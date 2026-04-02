local getgenv = (getfenv() :: any).getgenv
local Pets = {}
local reg
local fVar
local sData
local Utils
local GetSelectedItems
local AgeBreakUUID = nil
local MutantUUID = nil
local MutationMachineConnection = nil

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

local function findDupePet(UUID, PetType)
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

local function findMainPet()
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

	if not Options.tgAgeBreakEnabled.Value or fVar.isAgeBreaking then
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
	fVar.isAgeBreaking = true

	local PetType = Options.ddAgeBreakPetType.Value
	local TargetAge = tonumber(Options.inpAgeBreakTargetAge.Value) or 115

	if AgeBreakData.PetReady then
		AgeBreakUUID = AgeBreakData.SubmittedPet.UUID
		sData.GameEvents.PetAgeLimitBreak_Claim:FireServer()
		task.wait(1.5)
		fVar.isAgeBreaking = false
		return
	end

	if AgeBreakData.IsRunning then
		AgeBreakUUID = AgeBreakData.SubmittedPet.UUID
		fVar.isAgeBreaking = false
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
			AgeBreakUUID = findMainPet()
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
			getgenv().fLog("Cancel Pet: " .. tostring(MachinePetType) .. " Level: " .. tostring(MachinePetLevel))
			sData.GameEvents.PetAgeLimitBreak_Cancel:FireServer()
			AgeBreakUUID = nil
			task.wait(1.5)
			fVar.isAgeBreaking = false
			return
		end
		local dupeUUID = findDupePet(AgeBreakUUID, PetType)
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
	if Loadout == 2 then
		Loadout = 3
	elseif Loadout == 3 then
		Loadout = 2
	end
	sData.PetsServiceEvent:FireServer("SwapPetLoadout", Loadout)
end
-- GetData_result.PetMutationMachine.PetReady=false
-- GetData_result.PetMutationMachine.TimeLeft=0
-- GetData_result.PetMutationMachine.IsRunning=false
function Pets.FarmLevel()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.isMutating then
		return
	end

	Utils.ClickButton(Utils.GardenButton)
	task.wait(0.5)
	local Loadout = tonumber(Options.ddLevelLoadout.Value)
	Pets.SwapPetLoadout(Loadout)

	fVar.isMutating = true
	local PetType, Equiped

	local Method = Options.ddMutantMethod.Value :: string

	if Method == "Mutation" then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		if machineData then
			if machineData.SubmittedPet and not machineData.IsRunning then
				MutantUUID = machineData.SubmittedPet.UUID
				sData.GameEvents.PetMutationMachineService_RE:FireServer("CancelMachine")
				task.wait(1)
				fVar.isMutating = false
				Pets.MutatePet()
				return
			end
			if machineData.PetReady then
				MutantUUID = machineData.SubmittedPet.UUID
				fVar.isMutating = false
				Pets.ClaimMutationPet()
				return
			end
			if machineData.IsRunning then
				MutantUUID = machineData.SubmittedPet.UUID

				MutationMachineConnection = sData.DataService:GetPathSignal("PetMutationMachine/PetReady"):Connect(function()
					if MutationMachineConnection then
						MutationMachineConnection:Disconnect()
						MutationMachineConnection = nil
					end
					Pets.ClaimMutationPet()
				end)
				fVar.isMutating = false
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
		MutantUUID, PetType, Equiped = Pets.findFarmPet()
	end
	if not MutantUUID then
		getgenv().fLog("🔴 FarmLevel: No Pet Found")
		fVar.isMutating = false
		return
	end

	if Equiped then
		getgenv().fLog("🔵 FarmLevel: " .. tostring(PetType) .. " is already equipped")
		fVar.isMutating = false
		return
	end

	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	if EquipPets and #EquipPets >= 8 then
		getgenv().fLog("🔴 FarmLevel: Equip pet full")
		fVar.isMutating = false

		return
	end

	Pets.EquipPet(MutantUUID)
	task.wait(0.1)
	getgenv().fLog("🔵 FarmLevel: Found Pet " .. tostring(MutantUUID) .. " Type: " .. tostring(PetType))
	fVar.isMutating = false
end

function Pets.findFarmPet()
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
	if not Options.tgMutantEnabled.Value or fVar.isMutating then
		return
	end
	fVar.isMutating = true
	if not MutantUUID then
		getgenv().fLog("🟠 CheckLevel: No UUID Run FarmLevel()")
		fVar.isMutating = false
		Pets.FarmLevel()
		return
	end

	local TargetAge = tonumber(Options.inpMutantTargetAge.Value) or 100
	local TargetPet = Pets.RawData(MutantUUID)
	if not TargetPet or not TargetPet.PetData then
		-- หากดึงไม่เจอ ให้รีเซ็ตแล้วไปหาใหม่
		MutantUUID = nil
		Pets.FarmLevel()
		return
	end
	getgenv().fLog("🔵 CheckLevel: " .. tostring(TargetPet.PetType) .. " Level: " .. tostring(TargetPet.PetData.Level))
	local Method = Options.ddMutantMethod.Value :: string

	if Method == "Nightmare" then
		if sData.EnumToNameCache[TargetPet.PetData.MutationType] == "Nightmare" then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			getgenv().fLog("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Nightmare")
			getgenv().fLog("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			MutantUUID = nil
			fVar.isMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Venom" then
		if sData.EnumToNameCache[TargetPet.PetData.MutationType] == "Venom" then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			getgenv().fLog("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Venom")
			getgenv().fLog("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			MutantUUID = nil
			fVar.isMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Level" or Method == "Elephant" then
		if TargetPet.PetData.Level >= TargetAge then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			getgenv().fLog("🟢 CheckLevel: " .. tostring(MutantUUID) .. " finished Level")
			getgenv().fLog("🟣 CheckLevel: Run FarmLevel() to get new Pet")
			MutantUUID = nil
			fVar.isMutating = false
			Pets.FarmLevel()
			return
		end
	elseif Method == "Mutation" then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		if machineData and (machineData.SubmittedPet or machineData.IsRunning or machineData.PetReady) then
			fVar.isMutating = false
			return
		end
		if TargetPet.PetData.Level >= TargetAge then
			Pets.UnequipPet(MutantUUID)
			task.wait(0.5)
			getgenv().fLog("🟢 CheckLevel: " .. tostring(MutantUUID) .. " go to mutation machine")
			fVar.isMutating = false
			Pets.MutatePet()
			return
		end
		fVar.isMutating = false
	end
end

function Pets.MutatePet()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.isMutating then
		return
	end
	fVar.isMutating = true
	local Method = Options.ddMutantMethod.Value :: string
	if Method ~= "Mutation" then
		getgenv().fLog("🟠 MutatePet: Method is not Mutation")
		fVar.isMutating = false
		Pets.FarmLevel()
		return
	end
	if not MutantUUID then
		getgenv().fLog("🟠 MutatePet: No UUID Run FarmLevel()")
		fVar.isMutating = false
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
		MutationMachineConnection = sData.DataService:GetPathSignal("PetMutationMachine/PetReady"):Connect(function()
			if MutationMachineConnection then
				MutationMachineConnection:Disconnect()
				MutationMachineConnection = nil
			end
			Pets.ClaimMutationPet()
		end)
		return
	end
	fVar.isMutating = false
end

function Pets.ClaimMutationPet()
	local Options = reg.Options
	if not Options.tgMutantEnabled.Value or fVar.isMutating then
		return
	end
	fVar.isMutating = true
	local Loadout = tonumber(Options.ddClaimLoadout.Value)
	Pets.SwapPetLoadout(Loadout)
	if not MutantUUID then
		local serviceData = sData.DataService:GetData()
		local machineData = serviceData.PetMutationMachine
		local submittedPet = machineData.SubmittedPet
		if submittedPet then
			MutantUUID = submittedPet.UUID
		else
			getgenv().fLog("🟠 ClaimMutationPet: No UUID Run FarmLevel() and MutatePet() first")
			MutantUUID = nil
			Pets.FarmLevel()
			fVar.isMutating = false
			return
		end
	end
	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	sData.GameEvents.PetMutationMachineService_RE:FireServer("ClaimMutatedPet")
	task.wait(1.5)
	local TargetPet = Pets.RawData(MutantUUID)
	if not TargetPet or not TargetPet.PetData then
		getgenv().fLog("🟠 ClaimMutationPet: รอข้อมูล Pet จาก Server...")
		task.wait(1)
		TargetPet = Pets.RawData(MutantUUID)
		if not TargetPet or not TargetPet.PetData then
			getgenv().fLog("🔴 ClaimMutationPet: โหลดข้อมูลล้มเหลว รัน FarmLevel ใหม่")
			fVar.isMutating = false
			Pets.FarmLevel()
			return
		end
	end
	local targetMutant = GetSelectedItems(Options.ddTargetMutant.Value)
	local petMutant = sData.EnumToNameCache[TargetPet.PetData.MutationType]
	if table.find(targetMutant, petMutant) then
		getgenv().fLog("🟢 ClaimMutationPet: " .. tostring(MutantUUID) .. " finished Mutation : " .. tostring(petMutant))
		getgenv().fLog("🟣 ClaimMutationPet: Run FarmLevel() to get new Pet")
		MutantUUID = nil
		fVar.isMutating = false
		Pets.FarmLevel()
		return
	else
		getgenv().fLog("🔴 ClaimMutationPet: " .. tostring(MutantUUID) .. " finished Mutation : " .. tostring(petMutant))
		getgenv().fLog("🟣 ClaimMutationPet: Rerun FarmLevel() UUID : " .. tostring(MutantUUID))
		fVar.isMutating = false
		Pets.FarmLevel()
		return
	end
end

return Pets
