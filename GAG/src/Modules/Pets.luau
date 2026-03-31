local getgenv = (getfenv() :: any).getgenv
local Pets = {}
local reg
local fVar
local sData
local Utils
local GetSelectedItems
local AgeBreakUUID = nil
local MutantUUID = nil

function Pets.Initialize(registry)
	reg = registry
	fVar = reg.fVar
	sData = reg.sData
	Utils = reg.Utils
	GetSelectedItems = Utils.GetSelectedItems
	--[[ 	sData.RefreshActivePetsUI.OnClientEvent:Connect(function()
		---
	end) ]]

	--[[ 	local allPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, false)
	if allPets then
		for i, pet in ipairs(allPets) do
			local txt = string.format("ลำดับที่ %d: %s | Level: %d | UUID: %s", i, pet.PetType, pet.PetData.Level, pet.UUID)
			getgenv().fLog(txt)
		end
	end

	local equippedPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)

	if equippedPets then
		for i, pet in ipairs(equippedPets) do
			local txt2 = string.format("ลำดับที่ %d: %s | Level: %d | UUID: %s", i, pet.PetType, pet.PetData.Level, pet.UUID)
			getgenv().fLog(txt2)
		end
	end ]]
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
			local petLevel = Pets.Level(uuid)
			local petWeight = Pets.Weight(uuid)
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
			local petLevel = Pets.Level(uuid)
			if petType == PetType and (petLevel >= 100 and petLevel < TargetAge) and not Pets.Favorited(uuid) then
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
	if not Options.tgMutantEnabled.Value or fVar.isFarmingLevel then
		return
	end
	local Loadout = tonumber(Options.ddLevelLoadout.Value)
	Pets.SwapPetLoadout(Loadout)

	fVar.isFarmingLevel = true
	local PetType
	MutantUUID, PetType = Pets.findFarmPet()
	if not MutantUUID then
		getgenv().fLog("🔴 FarmLevel: No Pet Found")
		fVar.isFarmingLevel = false
		return
	end
	task.wait(tonumber(Options.LoadOutDelay.Value) or 8)
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	if EquipPets and #EquipPets >= 8 then
		getgenv().fLog("🔴 FarmLevel: Equip pet full")
		fVar.isFarmingLevel = false
		return
	end
	Pets.EquipPet(MutantUUID)
	task.wait(0.1)
	getgenv().fLog("🔵 FarmLevel: Found Pet " .. tostring(MutantUUID) .. " Type: " .. tostring(PetType))
	fVar.isFarmingLevel = false
end

function Pets.findFarmPet()
	local Options = reg.Options
	local Method = Options.ddMutantMethod.Value :: string
	local useFavorite = Options.tgFavoritePet.Value :: boolean
	local petType = GetSelectedItems(Options.ddMutantPetType.Value) --table
	local targetMutant = GetSelectedItems(Options.ddTargetMutant.Value) --table

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

	local AllPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, false)
	if not AllPets then
		return
	end

	for _, pet in ipairs(AllPets) do
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
	return nil
end

return Pets
