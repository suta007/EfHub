local getgenv = (getfenv() :: any).getgenv
local Pets = {}
local reg
local fVar
local sData
local AgeBreakUUID = nil

function Pets.Initialize(registry)
	reg = registry
	fVar = reg.fVar
	sData = reg.sData
end

local function GetPetInventory()
	local GetData_result = sData.DataService:GetData()
	local Inventory = GetData_result and GetData_result.Success and GetData_result.PetInventory
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
		getgenv().fLog("No inventory")
		return
	end

	for _, tData in pairs(Inventory) do
		if type(tData) ~= "table" then
			getgenv().fLog("Not table1")
			continue
		end
		for _, pet in pairs(tData) do
			if type(pet) ~= "table" then
				getgenv().fLog("Not table2")
				continue
			end
			local petType = pet.PetType
			if not petType then
				getgenv().fLog("Not petType")
				continue
			end
			local uuid = pet.UUID
			local petLevel = Pets.Level(uuid)
			local petWeight = Pets.Weight(uuid)
			if uuid == UUID then
				getgenv().fLog("Same UUID")
				continue
			end
			if petType ~= PetType then
				getgenv().fLog("Different petType")
				continue
			end
			if AgeValue ~= 0 and AgeCondition == "Below" and petLevel >= AgeValue then
				getgenv().fLog("Age condition below")
				continue
			end
			if AgeValue ~= 0 and AgeCondition == "Above" and petLevel <= AgeValue then
				getgenv().fLog("Age condition above")
				continue
			end
			if WeightValue ~= 0 and WeightCondition == "Below" and petWeight >= WeightValue then
				getgenv().fLog("Weight condition below")
				continue
			end
			if WeightValue ~= 0 and WeightCondition == "Above" and petWeight <= WeightValue then
				getgenv().fLog("Weight condition above")
				continue
			end
			getgenv().fLog("Found dupe pet")
			return uuid
		end
	end
	getgenv().fLog("Not found dupe pet")
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
	local success, result = pcall(function()
		return sData.ActivePetsService:GetPetData(sData.LocalPlayer.Name, UUID)
	end)

	if success and result then
		return result
	end
	return nil
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
	local sData = reg.sData
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
		getgenv().fLog("Pet in machine")
		local MachinePetType = SubmittedPet.PetType
		local MachinePetLevel = SubmittedPet.PetData.Level
		AgeBreakUUID = SubmittedPet.UUID

		if MachinePetType ~= PetType or MachinePetLevel >= TargetAge then
			getgenv().fLog("Cancel")
			sData.GameEvents.PetAgeLimitBreak_Cancel:FireServer()
			AgeBreakUUID = nil
			task.wait(1.5)
			fVar.isAgeBreaking = false
			return
		end
		getgenv().fLog("Find dupe pet")
		local dupeUUID = findDupePet(AgeBreakUUID, PetType)
		getgenv().fLog("Dupe UUID: " .. tostring(dupeUUID))
		if dupeUUID then
			sData.GameEvents.PetAgeLimitBreak_Submit:FireServer({ dupeUUID })
			task.wait(2)
		end
	end
end

return Pets
