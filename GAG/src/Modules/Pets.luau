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
end
function Pets.EquipPet(uuid)
	sData.PetsServiceEvent:FireServer("EquipPet", uuid)
end

function Pets.UnequipPet(uuid)
	sData.PetsServiceEvent:FireServer("UnequipPet", uuid)
end

function Pets.SwapPetLoadout(Loadout)
	local currentLoadout = sData.DataService:GetData().PetsData.SelectedPetLoadout
	if currentLoadout == Loadout then
		return
	end
	if Loadout == 2 then
		Loadout = 3
	elseif Loadout == 3 then
		Loadout = 2
	end
	sData.PetsServiceEvent:FireServer("SwapPetLoadout", Loadout)
	task.wait(8)
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
		reg.Log("machineData")
		if machineData then
			reg.Log("เจอ machineData")

			if machineData.PetReady then
				reg.Log("เจอ PetReady")
				MutantUUID = machineData.SubmittedPet.UUID
				fVar.IsMutating = false
				Pets.ClaimMutationPet()
				return
			end

			if machineData.IsRunning then
				reg.Log("เจอ IsRunning")
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
				reg.Log("เจอ SubmittedPet")
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
			Pets.MakePetFavorite(MutantUUID)
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
	local delayPlaceEgg = tonumber(Options.inpDelayPlaceEgg.Value)
	task.wait(delayPlaceEgg)

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
	reg.Log("Place Method is : " .. tostring(Options.ddPlaceMethod.Value))
	reg.Log("Place Slot is : " .. tostring(Options.ddPlaceSlot.Value))

	local MyPlantableParts = Utils.GetPlot()
	local targetPart = MyPlantableParts[placeSlot]
	local Boundary = Utils.GetBoundary(targetPart)
	sData.Character:PivotTo(CFrame.new(Boundary.maxX, 3, Boundary.minZ))
	task.wait(1)
	sData.Character:PivotTo(CFrame.new(Boundary.maxX, 3, Boundary.maxZ))
	task.wait(1)
	sData.Character:PivotTo(CFrame.new(Boundary.minX, 3, Boundary.maxZ))
	task.wait(1)
	sData.Character:PivotTo(CFrame.new(Boundary.minX, 3, Boundary.minZ))
	task.wait(1)
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

			task.wait(0.3)
			local finalPos = Vector3.new(eggCFrame.Position.X, eggCFrame.Position.Y, eggCFrame.Position.Z)
			reg.Log("Pos is : " .. tostring(finalPos))
			sData.Character:PivotTo(eggCFrame + Vector3.new(0, 5, 0))
			local success, err = pcall(function()
				sData.GameEvents:WaitForChild("PetEggService"):FireServer("CreateEgg", finalPos)
			end)
			if not success then
				reg.Log("PlaceEgg failed: " .. tostring(err))
			end
			if placeMethod == "Set" then
				plotPos = Utils.GetSetPlotPos(plotPos[2], plotPos[3], plotPos[4])
				eggCFrame = plotPos[1]
			else
				eggCFrame = Utils.GetRandomPlotPos()
			end
			Utils.UnequipTool()
		else
			break
		end
		task.wait(0.5)
	end
end

function Pets.Test()
	local MyPlantableParts = Utils.GetPlot()
	for i, Plot in ipairs(MyPlantableParts) do
		local bCf = Plot.CFrame
		local size = Plot.Size
		reg.Log("Plot " .. tostring(i) .. " Position : " .. tostring(bCf.Position) .. " Size : " .. tostring(size))
	end
end

return Pets
