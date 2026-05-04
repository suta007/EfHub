local getconnections = (getfenv() :: any).getconnections
local firesignal = (getfenv() :: any).firesignal

local Pets = {}
local reg
local fVar
local sData
local Utils
local GetSelectedItems
local AgeBreakUUID = nil
local MutantUUID = nil
local TaskMutantReady = nil

function Pets.Initialize(registry)
	reg = registry
	fVar = reg.fVar
	sData = reg.sData
	Utils = reg.Utils

	GetSelectedItems = Utils.GetSelectedItems
	--[[ 	sData.RefreshActivePetsUI.OnClientEvent:Connect(function()
		local Options = reg.Options
		if Options.tgMutantEnabled.Value then
			Pets.TargetPetLevelCheck()
		end
	end) ]]
end

local function GetPetInventory()
	local GetData_result = sData.DataService:GetData()
	local Inventory = GetData_result and GetData_result.PetsData and GetData_result.PetsData.PetInventory
	return Inventory
end

local function FindDupePet(UUID, PetType)
	local Options = reg.Options
	local AgeCondition = Options.ddAgeBreakAgeCond.Value
	local AgeValue = tonumber(Options.inpAgeBreakAgeVal.Value) or 50
	local WeightCondition = Options.ddAgeBreakWeightCond.Value
	local WeightValue = tonumber(Options.inpAgeBreakWeightVal.Value) or 38

	local Inventory = GetPetInventory()
	if not Inventory then
		return
	end

	for _, tData in pairs(Inventory) do
		if type(tData) ~= "table" then
			continue
		end
		for _, pet in pairs(tData) do
			if type(pet) ~= "table" then
				continue
			end
			local petType = pet.PetType
			if not petType then
				continue
			end
			local uuid = pet.UUID
			local petLevel = tonumber(pet.PetData.Level)
			local petWeight = tonumber(pet.PetData.BaseWeight)
			if uuid == UUID then
				continue
			end
			if petType ~= PetType then
				continue
			end
			if AgeValue ~= 0 and AgeCondition == "Below" and petLevel >= AgeValue then
				continue
			end
			if AgeValue ~= 0 and AgeCondition == "Above" and petLevel <= AgeValue then
				continue
			end
			if WeightValue ~= 0 and WeightCondition == "Below" and petWeight >= WeightValue then
				continue
			end
			if WeightValue ~= 0 and WeightCondition == "Above" and petWeight <= WeightValue then
				continue
			end
			return uuid
		end
	end
	return nil
end

local function FindMainPet()
	local Options = reg.Options
	local PetType = Options.ddAgeBreakPetType.Value
	local TargetAge = tonumber(Options.inpAgeBreakTargetAge.Value) or 115
	local Inventory = GetPetInventory()
	if not Inventory then
		return
	end

	for _, tData in pairs(Inventory) do
		if type(tData) ~= "table" then
			continue
		end
		for _, pet in pairs(tData) do
			if type(pet) ~= "table" then
				continue
			end
			local petType = pet.PetType
			if not petType then
				continue
			end
			local uuid = pet.UUID
			local petLevel = tonumber(pet.PetData.Level)
			if petType == PetType and (petLevel >= 100 and petLevel < TargetAge) and pet.PetData.IsFavorite ~= true then
				return uuid
			end
		end
	end
	return nil
end

function Pets.RawData(UUID)
	return sData.PetUtils:GetPetByUUID(sData.LocalPlayer, UUID)
end

function Pets.GetPetType(UUID)
	local data = Pets.RawData(UUID)
	if data then
		return data.PetType or "Unknown"
	end
	return "Unknown"
end

function Pets.Level(UUID)
	local data = Pets.RawData(UUID)

	if data and data.PetData then
		return data.PetData.Level or 1
	end
	return 1
end

function Pets.Favorited(UUID)
	local data = Pets.RawData(UUID)

	if data and data.PetData then
		return data.PetData.IsFavorite or false
	end
	return false
end

function Pets.MakePetFavorite(uuid)
	local favoriteEvent = sData.GameEvents:WaitForChild("Favorite_Item")
	if not Pets.Favorited(uuid) then
		local timeout = 5
		local startTime = tick()
		task.spawn(function()
			while tick() - startTime < timeout do
				local targetItem = nil

				for _, item in ipairs(sData.Backpack:GetChildren()) do
					if item:GetAttribute("ItemType") == "Pet" and item:GetAttribute("PET_UUID") == uuid then
						targetItem = item
						break
					end
				end

				if not targetItem and sData.LocalPlayer.Character then
					for _, item in ipairs(sData.LocalPlayer.Character:GetChildren()) do
						if item:GetAttribute("ItemType") == "Pet" and item:GetAttribute("PET_UUID") == uuid then
							targetItem = item
							break
						end
					end
				end

				if targetItem then
					favoriteEvent:FireServer(targetItem)
					task.wait(0.3)
					return true
				end
				task.wait(0.3)
			end
			return false
		end)
	end
	return false
end

function Pets.Weight(UUID)
	local data = Pets.RawData(UUID)

	if data and data.PetData then
		return tonumber(data.PetData.BaseWeight) or 1
	end
	return 1
end

function Pets.HeldPet(UUID)
	--local sData = reg.sData
	local Backpack = sData.Backpack
	pcall(function()
		sData.Humanoid:UnequipTool()
		task.wait(0.1)
	end)
	for _, item in pairs(Backpack:GetChildren()) do
		if item:GetAttribute("ItemType") == "Pet" and item:GetAttribute("PET_UUID") == UUID then
			local success, result = pcall(function()
				sData.Humanoid:EquipTool(item)
				task.wait(0.3)
				return true
			end)
			if success and result then
				return true
			end
		end
	end
	return false
end

function Pets.AgeBreak()
	local Options = reg.Options

	if not Options.tgAgeBreakEnabled.Value or fVar.IsAgeBreaking then
		return
	end
	local GetData_result = sData.DataService:GetData()
	if not GetData_result then
		return
	end
	local AgeBreakData = GetData_result.PetAgeBreakMachine
	if not AgeBreakData then
		return
	end
	fVar.IsAgeBreaking = true

	local PetType = Options.ddAgeBreakPetType.Value
	local TargetAge = tonumber(Options.inpAgeBreakTargetAge.Value) or 115

	if AgeBreakData.PetReady then
		AgeBreakUUID = AgeBreakData.SubmittedPet.UUID
		sData.GameEvents.PetAgeLimitBreak_Claim:FireServer()
		task.wait(1.5)
		fVar.IsAgeBreaking = false
		return
	end

	if AgeBreakData.IsRunning then
		AgeBreakUUID = AgeBreakData.SubmittedPet.UUID
		fVar.IsAgeBreaking = false
		return
	end

	local SubmittedPet = AgeBreakData.SubmittedPet
	local hasPetInMachine = SubmittedPet and type(SubmittedPet) == "table" and SubmittedPet.UUID ~= nil

	if not hasPetInMachine then
		if AgeBreakUUID then
			local petAge = Pets.Level(AgeBreakUUID)
			if petAge and petAge >= TargetAge then
				AgeBreakUUID = nil
			end
		end

		if not AgeBreakUUID then
			AgeBreakUUID = FindMainPet()
		end

		if AgeBreakUUID then
			if Pets.HeldPet(AgeBreakUUID) then
				task.wait(0.1)
				sData.GameEvents.PetAgeLimitBreak_SubmitHeld:FireServer()
				task.wait(2)
				fVar.IsAgeBreaking = false
			end
		end
	elseif hasPetInMachine and not AgeBreakData.IsRunning then
		local MachinePetType = SubmittedPet.PetType
		local MachinePetLevel = SubmittedPet.PetData.Level
		AgeBreakUUID = SubmittedPet.UUID

		if MachinePetType ~= PetType or MachinePetLevel >= TargetAge then
			reg.Log("Cancel Pet: " .. tostring(MachinePetType) .. " Level: " .. tostring(MachinePetLevel))
			sData.GameEvents.PetAgeLimitBreak_Cancel:FireServer()
			AgeBreakUUID = nil
			task.wait(1.5)
			fVar.IsAgeBreaking = false
			return
		end
		local dupeUUID = FindDupePet(AgeBreakUUID, PetType)
		if dupeUUID then
			sData.GameEvents.PetAgeLimitBreak_Submit:FireServer({ dupeUUID })
			task.wait(2)
		end
	end
	fVar.IsAgeBreaking = false
end
function Pets.EquipPet(uuid)
	sData.PetsServiceEvent:FireServer("EquipPet", uuid)
end

function Pets.UnequipPet(uuid)
	sData.PetsServiceEvent:FireServer("UnequipPet", uuid)
end

function Pets.SwapPetLoadout(Loadout)
	if Loadout == 2 then
		Loadout = 3
	elseif Loadout == 3 then
		Loadout = 2
	end
	local currentLoadout = sData.DataService:GetData().PetsData.SelectedPetLoadout
	if currentLoadout == Loadout then
		return
	end
	sData.PetsServiceEvent:FireServer("SwapPetLoadout", Loadout)
	task.wait(9)
end

function Pets.resetFarmUUID()
	MutantUUID = nil
	reg.Log("🔴 Reset Farm Pet UUID")
end

function Pets.FarmLevel()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.IsMutating then
		return
	end

	Utils.ClickButton(Utils.GardenButton)
	task.wait(0.5)
	local Loadout = tonumber(Options.ddLevelLoadout.Value)
	Pets.SwapPetLoadout(Loadout)

	fVar.IsMutating = true
	local PetType, Equiped

	local Method = Options.ddMutantMethod.Value :: string

	if Method == "Mutation" then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		--reg.Log("machineData")
		if machineData then
			--reg.Log("เจอ machineData")

			if machineData.PetReady then
				--reg.Log("เจอ PetReady")
				MutantUUID = machineData.SubmittedPet.UUID
				fVar.IsMutating = false
				Pets.ClaimMutationPet()
				return
			end

			if machineData.IsRunning then
				--reg.Log("เจอ IsRunning")
				MutantUUID = machineData.SubmittedPet.UUID

				if type(TaskMutantReady) == "thread" then
					task.cancel(TaskMutantReady)
					TaskMutantReady = nil
				end
				TaskMutantReady = task.spawn(function()
					while task.wait(60) do
						Pets.CheckMutantReady()
					end
				end)
				fVar.IsMutating = false
				return
			end

			if machineData.SubmittedPet and not machineData.IsRunning then
				--reg.Log("เจอ SubmittedPet")
				MutantUUID = machineData.SubmittedPet.UUID
				sData.GameEvents.PetMutationMachineService_RE:FireServer("CancelMachine")
				task.wait(1)
				fVar.IsMutating = false
				Pets.MutatePet()
				return
			end
		end
	end

	if MutantUUID then
		local TargetPet = Pets.RawData(MutantUUID)
		PetType = TargetPet.PetType
		Equiped = false
		local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
		if EquipPets then
			for _, pet in ipairs(EquipPets) do
				if pet.UUID == MutantUUID then
					Equiped = true
					break
				end
			end
		end
	else
		MutantUUID, PetType, Equiped = Pets.FindFarmPet()
	end
	if not MutantUUID then
		reg.Log("🔴 FarmLevel: No Pet Found")
		fVar.IsMutating = false
		return
	end

	if Equiped then
		reg.Log("🔵 FarmLevel: " .. tostring(PetType) .. " is already equipped")
		fVar.IsMutating = false
		return
	end

	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	if EquipPets and #EquipPets >= 8 then
		reg.Log("🔴 FarmLevel: Equip pet full")
		fVar.IsMutating = false

		return
	end

	Pets.EquipPet(MutantUUID)
	task.wait(0.1)
	reg.Log("🔵 FarmLevel: Found Pet " .. tostring(MutantUUID) .. " Type: " .. tostring(PetType))
	fVar.IsMutating = false
end

function Pets.FindFarmPet()
	local Options = reg.Options
	local Method = Options.ddMutantMethod.Value :: string
	local useFavorite = Options.tgFavoritePet.Value :: boolean
	local petType = GetSelectedItems(Options.ddMutantPetType.Value) --table
	local targetMutant = GetSelectedItems(Options.ddTargetMutant.Value) --table
	local Loadout = tonumber(Options.ddLevelLoadout.Value)
	Pets.SwapPetLoadout(Loadout)
	local blacklistMutant = {}
	if Method == "Nightmare" then
		blacklistMutant = { "Nightmare" }
	elseif Method == "Mutation" then
		blacklistMutant = targetMutant
	elseif Method == "Level" then
		blacklistMutant = { "NONE" }
	elseif Method == "Venom" then
		blacklistMutant = { "Venom" }
	elseif Method == "Everchanted" then
		blacklistMutant = { "Everchanted" }
	end

	local function checkPet(petData)
		for _, pet in ipairs(petData) do
			if not table.find(petType, pet.PetType) then
				continue
			end
			local isFavorite = pet.PetData.IsFavorite or false
			if useFavorite ~= isFavorite then
				continue
			end
			local petMutant = sData.EnumToNameCache[pet.PetData.MutationType] or "Normal"
			if table.find(blacklistMutant, petMutant) then
				continue
			end
			if Method == "Elephant" and tonumber(pet.PetData.BaseWeight) >= 3.5 and tonumber(pet.PetData.Level) >= 100 then
				continue
			end
			if Method == "Level" and tonumber(pet.PetData.Level) >= 100 then
				continue
			end
			return pet.UUID, pet.PetType
		end
		return nil, nil
	end
	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	if EquipPets then
		local eUUID, ePetType = checkPet(EquipPets)
		if eUUID then
			return eUUID, ePetType, true
		end
	end
	local AllPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, false)
	if AllPets then
		local aUUID, aPetType = checkPet(AllPets)
		if aUUID then
			return aUUID, aPetType, false
		end
	end
	return nil, nil, nil
end

function Pets.TargetPetLevelCheck()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.IsMutating then
		return
	end
	fVar.IsMutating = true
	if not MutantUUID then
		reg.Log("🟠 CheckLevel: No UUID Run FarmLevel()")
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	end

	local TargetAge = tonumber(Options.inpMutantTargetAge.Value) or 100
	local TargetPet = Pets.RawData(MutantUUID)
	if not TargetPet or not TargetPet.PetData then
		-- หากดึงไม่เจอ ให้รีเซ็ตแล้วไปหาใหม่
		MutantUUID = nil
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	end
	reg.Log("🔵 CheckLevel: " .. tostring(TargetPet.PetType) .. " Level: " .. tostring(TargetPet.PetData.Level))
	local Method = Options.ddMutantMethod.Value :: string
	local petMutant = sData.EnumToNameCache[TargetPet.PetData.MutationType] or "Normal"

	if Method == "Nightmare" then
		if petMutant == "Nightmare" then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			reg.Log("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Nightmare")
			reg.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			Pets.MakePetFavorite(MutantUUID)
			MutantUUID = nil
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		elseif petMutant ~= "Normal" and petMutant ~= "Nightmare" then
			Pets.PetShard("Cleansing Pet Shard")
			fVar.IsMutating = false
			return
		end
	elseif Method == "Venom" then
		if petMutant == "Venom" then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			reg.Log("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Venom")
			reg.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			Pets.MakePetFavorite(MutantUUID)
			MutantUUID = nil
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Everchanted" then
		if petMutant == "Everchanted" and (TargetPet.PetData.Level >= TargetAge or TargetAge == 0) then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			reg.Log("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Everchanted")
			reg.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			Pets.MakePetFavorite(MutantUUID)
			MutantUUID = nil
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Level" or Method == "Elephant" then
		if TargetPet.PetData.Level >= TargetAge then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			reg.Log("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Level")
			reg.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			Pets.MakePetFavorite(MutantUUID)
			MutantUUID = nil
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Mutation" then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		if machineData and (machineData.SubmittedPet or machineData.IsRunning or machineData.PetReady) then
			fVar.IsMutating = false
			return
		end
		if TargetPet.PetData.Level >= TargetAge then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			reg.Log("🟢 CheckLevel: " .. tostring(MutantUUID) .. " go to mutation machine")
			--Pets.MakePetFavorite(MutantUUID)
			fVar.IsMutating = false
			Pets.MutatePet()
			return
		end
		fVar.IsMutating = false
	end
	fVar.IsMutating = false
end

function Pets.MutatePet()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.IsMutating then
		return
	end
	fVar.IsMutating = true
	local Method = Options.ddMutantMethod.Value :: string
	if Method ~= "Mutation" then
		reg.Log("🟠 MutatePet: Method is not Mutation")
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	end
	if not MutantUUID then
		reg.Log("🟠 MutatePet: No UUID Run FarmLevel()")
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	end
	local Loadout = tonumber(Options.ddTimeLoadout.Value)
	Pets.SwapPetLoadout(Loadout)
	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	pcall(Pets.UnequipPet, MutantUUID)
	sData.Character:PivotTo(CFrame.new(-236.17, 4.50, 14.36))
	task.wait(0.2)

	if Pets.HeldPet(MutantUUID) then
		task.wait(0.5)
		sData.GameEvents.PetMutationMachineService_RE:FireServer("SubmitHeldPet")
		task.wait(0.5)
		sData.GameEvents.ReplicationChannel:FireServer("PetAssets", Pets.GetPetType(MutantUUID))
		task.wait(1)
		sData.GameEvents.PetMutationMachineService_RE:FireServer("StartMachine")

		if type(TaskMutantReady) == "thread" then
			task.cancel(TaskMutantReady)
			TaskMutantReady = nil
		end
		TaskMutantReady = task.spawn(function()
			while task.wait(60) do
				local success, err = pcall(function()
					Pets.CheckMutantReady()
				end)
				if not success then
					reg.Log("CheckMutantReady failed: " .. tostring(err))
				end
			end
		end)
		fVar.IsMutating = false
		return
	end
	fVar.IsMutating = false
end

function Pets.ClaimMutationPet()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.IsMutating then
		return
	end
	fVar.IsMutating = true
	pcall(function()
		if type(TaskMutantReady) == "thread" then
			task.cancel(TaskMutantReady)
			TaskMutantReady = nil
		end
	end)
	reg.Log("🟢 ClaimMutationPet: Run ClaimMutationPet")

	local Loadout = tonumber(Options.ddClaimLoadout.Value)
	Pets.SwapPetLoadout(Loadout)
	if not MutantUUID then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		local submittedPet = machineData.SubmittedPet
		if submittedPet then
			MutantUUID = submittedPet.UUID
		else
			reg.Log("🟠 ClaimMutationPet: No UUID Run FarmLevel() and MutatePet() first")
			MutantUUID = nil
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		end
	end
	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	sData.GameEvents.PetMutationMachineService_RE:FireServer("ClaimMutatedPet")
	task.wait(1.5)
	local TargetPet = Pets.RawData(MutantUUID)
	if not TargetPet or not TargetPet.PetData then
		reg.Log("🟠 ClaimMutationPet: รอข้อมูล Pet จาก Server...")
		task.wait(1)
		TargetPet = Pets.RawData(MutantUUID)
		if not TargetPet or not TargetPet.PetData then
			reg.Log("🔴 ClaimMutationPet: โหลดข้อมูลล้มเหลว รัน FarmLevel ใหม่")
			fVar.IsMutating = false
			Pets.FarmLevel()
			return
		end
	end
	local targetMutant = GetSelectedItems(Options.ddTargetMutant.Value)
	local petMutant = sData.EnumToNameCache[TargetPet.PetData.MutationType]
	if table.find(targetMutant, petMutant) then
		reg.Log("🟢 ClaimMutationPet: " .. tostring(MutantUUID) .. " finished Mutation : " .. tostring(petMutant))
		reg.Log("🟣 ClaimMutationPet: Run FarmLevel() to get new Pet")
		MutantUUID = nil
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	else
		reg.Log("🔴 ClaimMutationPet: " .. tostring(MutantUUID) .. " finished Mutation : " .. tostring(petMutant))
		reg.Log("🟣 ClaimMutationPet: Rerun FarmLevel() UUID : " .. tostring(MutantUUID))
		fVar.IsMutating = false
		Pets.FarmLevel()
		return
	end
end

function Pets.CheckMutantReady()
	local serviceData = sData.DataService:GetData()
	local machineData = serviceData.PetMutationMachine
	reg.Log("🔵 CheckMutantReady: " .. tostring(machineData.PetReady))
	if machineData.PetReady then
		MutantUUID = machineData.SubmittedPet.UUID
		fVar.IsMutating = false
		reg.Log("🟢 CheckMutantReady: Run ClaimMutationPet")
		task.spawn(function()
			local success, err = pcall(function()
				Pets.ClaimMutationPet()
			end)
			if not success then
				reg.Log("ClaimMutationPet failed: " .. tostring(err))
			end
		end)
		return
	end
end

function Pets.PetShard(shardName)
	local backpack = sData.Backpack
	local shard = Utils.FindToolByPattern(backpack, shardName)
	if shard then
		local petsPhysical = sData.Workspace:WaitForChild("PetsPhysical")
		for _, Mover in ipairs(petsPhysical:GetChildren()) do
			local pet = Mover:FindFirstChild(MutantUUID)
			if pet then
				Utils.EquipTool(shard)
				task.wait(0.5)
				local success, err = pcall(function()
					sData.PetShardService_RE:FireServer("ApplyShard", pet)
				end)
				if not success then
					reg.Log("ApplyShard failed: " .. tostring(err))
				end
				task.wait(1)
				Utils.UnequipTool()
				return
			end
		end
	end
end

function Pets.FeedPets()
	local Options = reg.Options
	if not Options.tgFeedPetsEnabled.Value or fVar.IsFeeding then
		return
	end
	fVar.IsFeeding = true
	local TargetHunger = tonumber(Options.inpFeedPetsHunger.Value) or 50
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	local Backpack = sData.Backpack
	local TargetCrops = GetSelectedItems(Options.ddFeedCropsType.Value)
	if EquipPets and #EquipPets > 0 then
		for _, pet in ipairs(EquipPets) do
			local petType = pet.PetType
			local petUUID = pet.UUID
			local maxHunger = sData.HungerDataTable[petType] or 10000
			local currentHunger = 100 * (pet.PetData.Hunger / maxHunger)
			if currentHunger <= TargetHunger then
				for _, item in ipairs(Backpack:GetChildren()) do
					local itemType = item:GetAttribute("b")
					if itemType == "j" or itemType == "u" then
						local itemName = item:GetAttribute("f")
						local isFavorite = item:GetAttribute("d")
						if itemName and (table.find(TargetCrops, "ALL") or table.find(TargetCrops, itemName)) and not isFavorite then
							Utils.EquipTool(item)
							task.wait(0.5)
							local success, err = pcall(function()
								sData.GameEvents:WaitForChild("ActivePetService"):FireServer("Feed", petUUID)
							end)
							if not success then
								reg.Log("FeedPet failed: " .. tostring(err))
							end
							task.wait(1)
							break
						end
					end
				end
			end
		end
	end
	fVar.IsFeeding = false
end

function Pets.EggInFarm()
	local ObjectsFolder = Utils.GetObjectsFolder()
	if not ObjectsFolder then
		return
	end
	local eggs = {}
	for _, obj in ipairs(ObjectsFolder:GetChildren()) do
		if obj and obj:GetAttribute("OBJECT_TYPE") == "PetEgg" then
			table.insert(eggs, obj)
		end
	end
	return eggs
end

function Pets.PlaceEggs()
	local Options = reg.Options
	if not Options.tgPlaceEggsEn or not Options.tgPlaceEggsEn.Value then
		return
	end

	local placeEggList = GetSelectedItems(Options.ddPlaceEgg.Value)
	if #placeEggList == 0 then
		reg.Log("🟠 PlaceEggs: No Egg Selected")
		return
	end
	local maxEgg = tonumber(Options.ipMaxEggs.Value)
	if maxEgg == 0 then
		reg.Log("🟠 PlaceEggs: Max Egg must be greater than 0")
		return
	end
	local speedLoadout = tonumber(Options.ddSpeedLoadout.Value) or 1
	pcall(Pets.SwapPetLoadout, speedLoadout)
	local placeSlot = tonumber(Options.ddPlaceSlot.Value) or 1
	local placeMethod = Options.ddPlaceMethod.Value
	local plotPos
	local eggCFrame

	if placeMethod == "Set" then
		plotPos = Utils.GetSetPlotPos(placeSlot)
		eggCFrame = plotPos[1]
	else
		eggCFrame = Utils.GetRandomPlotPos()
	end
	local rng = Random.new()
	while Options.tgPlaceEggsEn.Value do
		local eggs = Pets.EggInFarm()
		if eggs and type(eggs) == "table" and #eggs < maxEgg then
			local selectEgg = placeEggList[rng:NextInteger(1, #placeEggList)]
			local egg = Utils.FindToolByPattern(sData.Backpack, selectEgg)
			Utils.EquipTool(egg)
			task.wait(0.2) --0.3
			--local finalPos = Vector3.new(eggCFrame.Position.X, 0.1355266571044922, eggCFrame.Position.Z)
			local finalPos = vector.create(eggCFrame.Position.X, 0.1355266571044922, eggCFrame.Position.Z)
			--reg.Log("PlaceEgg: " .. tostring(finalPos))

			sData.PetEggService:FireServer("CreateEgg", finalPos)
			task.wait(0.2) --0.3
			if placeMethod == "Set" then
				plotPos = Utils.GetSetPlotPos(plotPos[2], plotPos[3], plotPos[4])
				eggCFrame = plotPos[1]
			else
				eggCFrame = Utils.GetRandomPlotPos()
			end
			Utils.UnequipTool()
			task.wait(0.1)
		else
			break
		end
		task.wait(0.1)
	end
end

local function ValidEggs(EggsData, rEggs)
	local Options = reg.Options
	local sHatchPet = GetSelectedItems(Options.ddSpecialHatchPet.Value) or {}
	local sWeight = tonumber(Options.inpSpecialHatchWeight.Value) or 3.5

	local spEggs = {}
	local nmEggs = {}
	if not EggsData or not rEggs then
		return nil, nil
	end

	for _, rEgg in rEggs do
		local EggData = EggsData[rEgg:GetAttribute("OBJECT_UUID")]
		if EggData then
			local HatchWeight = EggData.Data.BaseWeight * 1.1
			local HatchPetType = EggData.Data.Type
			if (sWeight ~= 0 and HatchWeight >= sWeight) or (#sHatchPet > 0 and table.find(sHatchPet, HatchPetType)) then
				table.insert(spEggs, rEgg)
			else
				table.insert(nmEggs, rEgg)
			end
		end
	end
	return nmEggs, spEggs
end

function Pets.HatchEgg()
	local Options = reg.Options
	if not Options.tgAutoHatchEn or not Options.tgAutoHatchEn.Value then
		return
	end

	while Options.tgAutoHatchEn.Value do
		local GetData_result = sData.DataService:GetData()
		local ReadyEggs = {}
		local PetsData = {}
		local myEggs = Pets.EggInFarm()
		local SelectedSlot = GetData_result.SaveSlots.SelectedSlot
		local fData = GetData_result.SaveSlots.AllSlots[SelectedSlot].SavedObjects
		if not fData or type(fData) ~= "table" then
			task.wait(5)
			continue
		end
		local petCount = 0
		for Key, PetData in pairs(fData) do
			if PetData.ObjectType == "PetEgg" then
				PetsData[Key] = PetData
				petCount = petCount + 1
			end
		end

		for _, nEggs in pairs(myEggs) do
			if nEggs:GetAttribute("READY") == true then
				table.insert(ReadyEggs, nEggs)
			end
		end

		if petCount ~= #ReadyEggs then
			task.wait(5)
			continue
		end
		local NormalEggs, SpecialEggs = ValidEggs(PetsData, ReadyEggs)

		if #SpecialEggs > 0 then
			pcall(Pets.SwapPetLoadout, tonumber(Options.ddSpecialHatchLoadout.Value) or 4)
			for _, sEgg in pairs(SpecialEggs) do
				sData.PetEggService:FireServer("HatchPet", sEgg)
				task.wait(0.2)
			end
		end
		task.wait(2)
		if #NormalEggs > 0 then
			pcall(Pets.SwapPetLoadout, tonumber(Options.ddHatchLoadout.Value) or 2)
			for _, rEgg in pairs(NormalEggs) do
				sData.PetEggService:FireServer("HatchPet", rEgg)
				task.wait(0.2)
			end
		end
		task.wait(1)
		break
	end
end

local function IsValidSellPet(petData)
	if not petData or type(petData) ~= "table" then
		return false
	end
	local Options = reg.Options
	local sPet = GetSelectedItems(Options.ddSellPet.Value)
	local sThreshold = Options.ddSellPetThreshold.Value
	local sWeight = tonumber(Options.inpSellPetWeight.Value)

	local sPetType = petData.PetType
	local sBaseWeight = petData.PetData.BaseWeight
	local sMutant = petData.PetData.MutationType or "m"

	local sFavorite = petData.PetData.IsFavorite
	if sFavorite then
		return false
	end
	if sMutant ~= "m" then
		return false
	end
	if not table.find(sPet, sPetType) then
		return false
	end
	if sWeight > 0 then
		if sThreshold == "Below" and sBaseWeight >= sWeight then
			return false
		end
		if sThreshold == "Above" and sBaseWeight <= sWeight then
			return false
		end
	end
	return true
end
local function scanSellPetList()
	local SellPetList = {}
	local GetData_result = sData.DataService:GetData()
	local inventory = GetData_result.PetsData.PetInventory
	if inventory then
		for _, v in pairs(inventory) do
			if type(v) == "table" then
				for _, petData in pairs(v) do
					if type(petData) == "table" and IsValidSellPet(petData) then
						table.insert(SellPetList, petData.UUID)
					end
				end
			end
		end
	end
	return SellPetList
end
function Pets.SellPet()
	local Options = reg.Options
	if not Options.tgSellPetEn or not Options.tgSellPetEn.Value then
		return
	end

	local sellPetList = scanSellPetList()
	if #sellPetList > 0 then
		pcall(Pets.SwapPetLoadout, tonumber(Options.ddSellLoadout.Value) or 3)
		for _, petUUID in pairs(sellPetList) do
			if Pets.HeldPet(petUUID) then
				task.wait()
				sData.GameEvents:WaitForChild("SellPet_RE"):FireServer()
			end
			task.wait(0.2)
		end
	end
end
local hatchSetTask = nil
function Pets.RunHatchSet()
	local Options = reg.Options

	if not hatchSetTask then
		hatchSetTask = task.spawn(function()
			while true do
				pcall(function()
					local delayPlaceEgg = Options.inpDelayPlaceEgg and tonumber(Options.inpDelayPlaceEgg.Value) or 2
					local delayHatchEgg = Options.inpDelayHatchEgg and tonumber(Options.inpDelayHatchEgg.Value) or 2
					local delaySellPet = Options.inpDelaySellPet and tonumber(Options.inpDelaySellPet.Value) or 2
					task.wait(delayPlaceEgg)
					Pets.PlaceEggs()

					task.wait(delayHatchEgg)
					Pets.HatchEgg()

					task.wait(delaySellPet)
					Pets.SellPet()
				end)
				task.wait(1)
			end
		end)
	end
	local PlaceEggsEn = Options.tgPlaceEggsEn and Options.tgPlaceEggsEn.Value
	local HatchSetEn = Options.tgAutoHatchEn and Options.tgAutoHatchEn.Value
	local SellPetEn = Options.tgSellPetEn and Options.tgSellPetEn.Value

	if not (PlaceEggsEn or HatchSetEn or SellPetEn) then
		pcall(function()
			if hatchSetTask then
				task.cancel(hatchSetTask)
				hatchSetTask = nil
			end
		end)
	end
end

local function IsValidGiftPet(petData)
	if not petData or type(petData) ~= "table" then
		return false
	end
	local Options = reg.Options

	local gPetTypes = GetSelectedItems(Options.ddGiftPet.Value)
	local gThreshold = Options.ddGiftPetThreshold.Value
	local gWeight = tonumber(Options.inpGiftPetWeight.Value)
	local gMutant = GetSelectedItems(Options.ddGiftPetMutant.Value)

	local gPetType = petData.PetType
	local gBaseWeight = petData.PetData.BaseWeight
	local petMutant = sData.EnumToNameCache[petData.PetData.MutationType] or "Normal"
	local gFavorite = petData.PetData.IsFavorite
	if gFavorite then
		return false
	end
	if not table.find(gPetTypes, gPetType) then
		return false
	end
	if gWeight > 0 then
		if gThreshold == "Below" and gBaseWeight >= gWeight then
			return false
		end
		if gThreshold == "Above" and gBaseWeight <= gWeight then
			return false
		end
	end
	if not table.find(gMutant, "ALL") and not table.find(gMutant, petMutant) then
		return false
	end

	return true
end

function Pets.GiftPets()
	local Options = reg.Options
	if not Options.tgGiftPetEn or not Options.tgGiftPetEn.Value then
		return
	end
	local friendName = Options.ddGiftFriends.Value
	local selectedPetTypes = GetSelectedItems(Options.ddGiftPet.Value)
	local baseWeight = tonumber(Options.inpGiftPetWeight.Value)
	if not friendName or friendName == "" then
		reg.Log("Invalid Friend Name")
		return
	end
	if not selectedPetTypes or #selectedPetTypes == 0 then
		reg.Log("Invalid Gift Pet Settings")
		return
	end

	local TargetPlayerObj = game:GetService("Players"):FindFirstChild(friendName)
	if not TargetPlayerObj then
		reg.Log("Invalid Friend Name")
		return
	end

	if baseWeight == nil or type(baseWeight) ~= "number" then
		reg.Log("Invalid Base Weight")
		return
	end

	local data = sData.DataService:GetData()
	local inventory = data and data.PetsData and data.PetsData.PetInventory
	if inventory then
		for _, v in pairs(inventory) do
			if type(v) == "table" then
				for kUUID, petData in pairs(v) do
					if type(petData) == "table" then
						if IsValidGiftPet(petData) then
							local tuuid = petData.UUID or kUUID
							if Pets.HeldPet(tuuid) then
								local args = {
									"GivePet",
									TargetPlayerObj,
								}
								sData.GameEvents:WaitForChild("PetGiftingService"):FireServer(unpack(args))
								task.wait(7)
							end
						end
					end
				end
			end
		end
	end
end
local AcceptGiftPetsDriver = nil

function Pets.AcceptGiftPets(Value)
	local notiFrame = sData.PlayerGui:FindFirstChild("Gift_Notification"):FindFirstChild("Frame")
	if Value then
		--local GiftPetEvent = sData.GameEvents:WaitForChild("GiftPet")
		--local AcceptPetGiftEvent = sData.GameEvents:WaitForChild("AcceptPetGift")
		if AcceptGiftPetsDriver then
			return
		end
		--AcceptGiftPetsDriver = GiftPetEvent.OnClientEvent:Connect(function(giftId, petName, _senderName)
		AcceptGiftPetsDriver = notiFrame.ChildAdded:Connect(function(_child)
			task.spawn(function()
				task.wait(2)
				--AcceptPetGiftEvent:FireServer(true, giftId)
				pcall(function()
					--local notiFrame = sData.PlayerGui:FindFirstChild("Gift_Notification"):FindFirstChild("Frame")
					for _, obj in pairs(notiFrame:GetChildren()) do
						if obj.Name == "Gift_Notification" then
							local acceptBtn = obj.Holder.Frame.Accept
							print("Accept Button Found", acceptBtn)
							if firesignal then
								firesignal(acceptBtn.MouseButton1Click)
								firesignal(acceptBtn.Activated)
							elseif getconnections then
								for _, connection in pairs(getconnections(acceptBtn.MouseButton1Click)) do
									print("Accept Button Connection", connection)
									if connection.Fire then
										connection:Fire()
									else
										connection.Function()
									end
								end
							end
						end
					end
				end)
			end)
		end)
	else
		pcall(function()
			if AcceptGiftPetsDriver then
				AcceptGiftPetsDriver:Disconnect()
				AcceptGiftPetsDriver = nil
			end
		end)
	end
end

function Pets.BoostPet()
	local Options = reg.Options
	if not Options.tgBoostPetEn.Value then
		return
	end
	local boostPetTypes = GetSelectedItems(Options.ddToyPetType.Value)
	if not boostPetTypes or #boostPetTypes == 0 then
		reg.Log("Do not have selected pet type to boost", "ERROR")
		return
	end

	local function GiveToy(petUUID, toy)
		if not toy then
			return
		end
		if not toy:HasTag("PetBoost") then
			reg.Log("Toy do not have tag PetBoost", "ERROR")
			return
		end
		if Utils.EquipTool(toy) then
			task.wait(0.1)
			sData.PetBoostService:FireServer("ApplyBoost", petUUID)
		else
			reg.Log("Equip toy failed", "ERROR")
		end
	end

	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	if EquipPets and #EquipPets > 0 then
		local Backpack = sData.Backpack
		local smToy = Utils.FindToolByPattern(Backpack, "Small Pet Toy")
		local mdToy = Utils.FindToolByPattern(Backpack, "Medium Pet Toy")
		local lgToy = Utils.FindToolByPattern(Backpack, "Large Pet Toy")
		for _, pet in ipairs(EquipPets) do
			local petType = pet.PetType
			if table.find(boostPetTypes, petType) then
				local petUUID = pet.UUID
				local Boosts = pet.PetData.Boosts
				local ActiveBoosts = {}
				for _i, v in pairs(Boosts) do
					if type(v) == "table" then
						table.insert(ActiveBoosts, v.BoostAmount)
					end
				end
				if Options.tgSmToy.Value and not table.find(ActiveBoosts, 0.1) then
					GiveToy(petUUID, smToy)
				end
				if Options.tgMdToy.Value and not table.find(ActiveBoosts, 0.2) then
					GiveToy(petUUID, mdToy)
				end
				if Options.tgLgToy.Value and not table.find(ActiveBoosts, 0.3) then
					GiveToy(petUUID, lgToy)
				end
			end
		end
	end
end

return Pets
