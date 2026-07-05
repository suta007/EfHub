-- AutoCraft.luau
-- A helper script to automate claiming completed crafts and starting new crafts
-- based on a priority target list.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Required game services/modules
local DataService = require(ReplicatedStorage.Modules.DataService)
local GameConfigController = require(ReplicatedStorage.Modules.GameConfigController)
local SummerCraftingConfig = GameConfigController:GetConfig("SummerCraftingConfig")
local SummerFireConfig = GameConfigController:GetConfig("SummerFireConfig")

local ItemRarityFinder = require(ReplicatedStorage.Modules.ItemRarityFinder)
local CalculatePlantValue = require(ReplicatedStorage.Modules.CalculatePlantValue)
local MutationHandler = require(ReplicatedStorage.Modules.MutationHandler)
local CalculateWeight = require(ReplicatedStorage.Calculate_Weight)

local SummerCraftingService = ReplicatedStorage.GameEvents.SummerCraftingService

-- Configuration
local CONFIG = {
	Enabled = true,
	UpdateInterval = 5, -- Seconds between checks
	TargetCrafts = {
		"Campfire Egg",
		"Paradise Egg",
		"Rare Summer Egg",
		"Common Summer Egg",
		"Super Watering Can",
		"Areaclaimer",
		"Energy Chew",
		"Firepit Flower",
	},
	Verbose = true, -- Print updates in the console
}

local function log(...)
	if CONFIG.Verbose then
		print("[AutoCraft]", ...)
	end
end

-- Helper to match item with requirement
local function doesItemMatchRequirement(itemEntry, req)
	if type(itemEntry) ~= "table" then return false end
	local itemData = itemEntry.ItemData
	if type(itemData) ~= "table" then return false end

	local reqType = tostring(req.Type or "")
	local targetType = (reqType == "Pet Egg" or reqType == "PetEgg" or reqType == "Egg") and "Egg" or reqType
	local targetValue = tostring(req.Value or "")

	if targetType == "Fruit" then
		if itemEntry.ItemType == "Holdable" or itemEntry.ItemType == "Fruit" then
			if itemData.IsFavorite then return false end
			return (itemData.ItemName == targetValue or itemData.SeedName == targetValue or itemData.FruitName == targetValue or itemData.GearName == targetValue or itemData.Name == targetValue or itemData.Type == targetValue) or itemData.Seed == targetValue
		else
			return false
		end
	elseif targetType == "Seed" then
		if itemEntry.ItemType == "Seed" then
			if (itemData.ItemName == targetValue or itemData.SeedName == targetValue or itemData.FruitName == targetValue or itemData.GearName == targetValue or itemData.Name == targetValue or itemData.Type == targetValue) or itemData.Seed == targetValue then
				return not req.Variant or (itemData.Variant or itemData.VariantName or itemData.SeedVariant or "Normal") == req.Variant
			else
				return false
			end
		else
			return false
		end
	elseif targetType == "Gear" then
		return (itemEntry.ItemType == targetValue or itemData.ItemName == targetValue or itemData.SeedName == targetValue or itemData.FruitName == targetValue or itemData.GearName == targetValue or itemData.Name == targetValue or itemData.Type == targetValue) or itemData.Seed == targetValue
	elseif targetType == "Egg" then
		if itemEntry.ItemType == "PetEgg" or itemEntry.ItemType == "Pet Egg" or itemEntry.ItemType == "Egg" or itemEntry.ItemType == "BeeEgg" or itemEntry.ItemType == "Bee Egg" then
			return (itemData.ItemName == targetValue or itemData.SeedName == targetValue or itemData.FruitName == targetValue or itemData.GearName == targetValue or itemData.Name == targetValue or itemData.Type == targetValue) or itemData.Seed == targetValue or (itemData.EggName == targetValue or itemData.PetEggName == targetValue or itemData.PetEggType == targetValue) or itemData.BeeEggType == targetValue
		else
			return false
		end
	end
	return false
end

-- Helper to calculate plant value
local function getPlantEntryValue(itemData)
	local name = itemData.ItemName or itemData.SeedName or itemData.FruitName or itemData.GearName or itemData.Name or itemData.Type or itemData.Seed
	if not name then return 0 end
	
	local variant = itemData.Variant or itemData.VariantName or itemData.SeedVariant or "Normal"
	local fruitVersion = itemData.FruitVersion or itemData.FruitVersion or 0
	
	local weight = tonumber(itemData.Weight)
	if not weight then
		local baseWeight = 1
		if itemData.Seed and itemData.ItemName then
			baseWeight = tonumber(CalculateWeight.Calculate_Weight(itemData.Seed, itemData.ItemName)) or 1
		end
		weight = baseWeight * (tonumber(itemData.WeightMultiplier) or 1)
	end
	
	local mutationStr = itemData.MutationString or ""
	local mutationMultiplier = 1
	if MutationHandler.ExtractMutationsFromString and MutationHandler.CalcValueMultiFromMuts then
		mutationMultiplier = MutationHandler:CalcValueMultiFromMuts(MutationHandler:ExtractMutationsFromString(mutationStr))
	end
	
	return CalculatePlantValue({
		name = name,
		variant = variant,
		weight = weight,
		mutationMultiplier = mutationMultiplier,
		fruitVersion = fruitVersion,
	})
end

-- Get item count/uses
local function getItemQuantity(itemEntry, req)
	if type(itemEntry) ~= "table" then return 0 end
	local reqType = tostring(req.Type or "")
	local targetType = (reqType == "Pet Egg" or reqType == "PetEgg" or reqType == "Egg") and "Egg" or reqType
	local itemData = itemEntry.ItemData

	if targetType == "Gear" then
		local uses = itemData and itemData.Uses
		local numUses = tonumber(uses)
		if numUses then return math.max(0, math.floor(numUses)) end
		
		local quantity = itemData and itemData.Quantity
		local numQty = tonumber(quantity)
		if not numQty then return 1 end
		return math.max(0, math.floor(numQty))
	end

	if targetType ~= "Seed" and targetType ~= "Egg" then
		return 1
	end

	local quantity = itemData and itemData.Quantity
	local numQty = tonumber(quantity)
	if numQty then return math.max(0, math.floor(numQty)) end

	local uses = itemData and itemData.Uses
	local numUses = tonumber(uses)
	if not numUses then return 1 end
	return math.max(0, math.floor(numUses))
end

-- Find the craft key and details of an item
local function findCraftableInfo(itemName)
	for index, craftable in ipairs(SummerCraftingConfig.Craftables) do
		if craftable.Result and craftable.Result.Value == itemName then
			local key = string.format("%d:%d:%s", craftable.Tier, index, itemName)
			return key, craftable
		end
	end
	return nil, nil
end

-- Main function to check and resolve materials for a recipe
local function resolveRecipeMaterials(recipe, data, usedUUIDs)
	local inventory = data.InventoryData or {}
	local resolvedRequirementUUIDs = {}

	for reqIndex, req in ipairs(recipe) do
		local reqType = tostring(req.Type or "")
		local targetType = (reqType == "Pet Egg" or reqType == "PetEgg" or reqType == "Egg") and "Egg" or reqType
		local requiredQty = math.max(1, tonumber(req.Quantity) or 1)

		local isSelectable = (targetType == "Fruit" or targetType == "Seed" or targetType == "Pet" or targetType == "Gear" or targetType == "Egg" or targetType == "Cosmetic")
		if not isSelectable then
			-- Non-selectable requirement (e.g., Currency like Sheckles). No UUIDs needed.
			resolvedRequirementUUIDs[reqIndex] = {}
			continue
		end

		local chosenUUIDs = {}

		if targetType == "Fruit" then
			-- Gather matching fruits, sort by value
			local candidates = {}
			for uuid, itemEntry in pairs(inventory) do
				if not usedUUIDs[uuid] and doesItemMatchRequirement(itemEntry, req) then
					table.insert(candidates, {
						uuid = uuid,
						value = getPlantEntryValue(itemEntry.ItemData),
					})
				end
			end
			table.sort(candidates, function(a, b)
				return a.value < b.value
			end)

			for _, candidate in ipairs(candidates) do
				if #chosenUUIDs >= requiredQty then break end
				table.insert(chosenUUIDs, candidate.uuid)
				usedUUIDs[candidate.uuid] = true
			end

		elseif targetType == "Pet" then
			local petsData = data.PetsData and data.PetsData.PetInventory and data.PetsData.PetInventory.Data or {}
			local candidates = {}
			for petId, petEntry in pairs(petsData) do
				local token = "Pet:" .. petId
				if not usedUUIDs[token] and petEntry.IsFavorite ~= true and petEntry.Locked ~= true then
					local petName = tostring(req.Value or "")
					if petEntry.PetName == petName or petEntry.Name == petName or petEntry.Type == petName or petEntry.ItemName == petName then
						table.insert(candidates, {
							token = token,
							level = tonumber(petEntry.Level or petEntry.PetLevel) or 1,
						})
					end
				end
			end
			table.sort(candidates, function(a, b)
				return a.level < b.level
			end)

			for _, candidate in ipairs(candidates) do
				if #chosenUUIDs >= requiredQty then break end
				table.insert(chosenUUIDs, candidate.token)
				usedUUIDs[candidate.token] = true
			end

		elseif targetType == "Cosmetic" then
			local cosmeticData = data.CosmeticData and data.CosmeticData.Inventory or {}
			for cosmeticId, cosmeticEntry in pairs(cosmeticData) do
				local token = "Cosmetic:" .. cosmeticId
				if not usedUUIDs[token] then
					local targetName = tostring(req.Value or "")
					local matches = false
					if type(cosmeticEntry) == "table" then
						matches = cosmeticEntry.Name == targetName or cosmeticEntry.CosmeticName == targetName or cosmeticEntry.ItemName == targetName
					end
					if matches then
						table.insert(chosenUUIDs, token)
						usedUUIDs[token] = true
						if #chosenUUIDs >= requiredQty then break end
					end
				end
			end

		elseif targetType == "Gear" or targetType == "Egg" then
			local candidates = {}
			for uuid, itemEntry in pairs(inventory) do
				if not usedUUIDs[uuid] and doesItemMatchRequirement(itemEntry, req) then
					local qty = getItemQuantity(itemEntry, req)
					if qty > 0 then
						table.insert(candidates, {
							uuid = uuid,
							amount = qty,
						})
					end
				end
			end

			local remainingNeeded = requiredQty
			for _, candidate in ipairs(candidates) do
				if remainingNeeded <= 0 then break end
				table.insert(chosenUUIDs, candidate.uuid)
				usedUUIDs[candidate.uuid] = true
				remainingNeeded = remainingNeeded - candidate.amount
			end

			if remainingNeeded > 0 then
				-- Clean up used status if not fully satisfied
				for _, uuid in ipairs(chosenUUIDs) do
					usedUUIDs[uuid] = nil
				end
				return nil -- Missing enough items
			end

		else
			-- Other types (e.g., Seeds/default fallback)
			local candidates = {}
			for uuid, itemEntry in pairs(inventory) do
				if not usedUUIDs[uuid] and doesItemMatchRequirement(itemEntry, req) then
					local qty = getItemQuantity(itemEntry, req)
					if qty > 0 then
						table.insert(candidates, {
							uuid = uuid,
							amount = qty,
						})
					end
				end
			end

			local remainingNeeded = requiredQty
			for _, candidate in ipairs(candidates) do
				if remainingNeeded <= 0 then break end
				table.insert(chosenUUIDs, candidate.uuid)
				usedUUIDs[candidate.uuid] = true
				remainingNeeded = remainingNeeded - candidate.amount
			end

			if remainingNeeded > 0 then
				for _, uuid in ipairs(chosenUUIDs) do
					usedUUIDs[uuid] = nil
				end
				return nil
			end
		end

		if #chosenUUIDs < requiredQty then
			-- Clean up used status if not fully satisfied
			for _, uuid in ipairs(chosenUUIDs) do
				usedUUIDs[uuid] = nil
			end
			return nil -- Missing enough items
		end

		resolvedRequirementUUIDs[reqIndex] = chosenUUIDs
	end

	return resolvedRequirementUUIDs
end

-- Process crafting loop
local function performAutoCraftCycle()
	local data = DataService:GetData()
	if not data then return end

	local campfireTier = tonumber(workspace:GetAttribute(SummerFireConfig.WORKSPACE_ATTRIBUTE)) or 0
	if workspace:GetAttribute(SummerFireConfig.WORKSPACE_SUPER_ATTRIBUTE) == true then
		campfireTier = SummerFireConfig.MAX_TIERS
	end

	local craftingData = data.SummerCraftingEventData
	local slots = craftingData and craftingData.Slots or {}

	-- Slot unlock requirements map
	local slotUnlockTiers = { 0, 3, 4 }
	local activeSlotStates = {}

	-- 1. Check and claim completed crafts
	for slotIndex = 1, 3 do
		local unlockTier = slotUnlockTiers[slotIndex]
		if campfireTier >= unlockTier then
			local slot = slots[slotIndex]
			if type(slot) == "table" then
				local remaining = tonumber(slot.RemainingTime)
				if remaining == nil then
					local endT = tonumber(slot.EndTime) or 0
					remaining = math.max(0, endT - workspace:GetServerTimeNow())
				else
					remaining = math.max(0, remaining)
				end

				if remaining <= 0 then
					log("Claiming completed craft in slot " .. slotIndex .. " (Item: " .. tostring(slot.Result and slot.Result.Value) .. ")")
					SummerCraftingService.ClaimCraft:FireServer(slotIndex)
					task.wait(0.5)
					activeSlotStates[slotIndex] = "Empty"
				else
					activeSlotStates[slotIndex] = "Crafting"
				end
			else
				activeSlotStates[slotIndex] = "Empty"
			end
		else
			activeSlotStates[slotIndex] = "Locked"
		end
	end

	-- 2. Start new crafts in empty slots
	local usedUUIDs = {}
	for slotIndex = 1, 3 do
		if activeSlotStates[slotIndex] == "Empty" then
			log("Slot " .. slotIndex .. " is empty. Looking for craft target...")

			local startedCraft = false
			for _, targetName in ipairs(CONFIG.TargetCrafts) do
				local craftKey, craftable = findCraftableInfo(targetName)
				if craftable then
					-- Check tier requirement
					if campfireTier >= craftable.Tier then
						-- Try to resolve materials
						local resolvedUUIDs = resolveRecipeMaterials(craftable.Recipe, data, usedUUIDs)
						if resolvedUUIDs then
							log("Starting craft: " .. targetName .. " in slot " .. slotIndex)
							SummerCraftingService.StartCraft:FireServer(craftKey, resolvedUUIDs)
							activeSlotStates[slotIndex] = "Crafting"
							startedCraft = true
							task.wait(0.5)
							break
						end
					end
				end
			end

			if not startedCraft then
				log("No craftable target could be started in slot " .. slotIndex .. " (insufficient materials or tier lock)")
			end
		end
	end
end

-- Thread runner
task.spawn(function()
	log("AutoCraft script initialized successfully.")
	while true do
		if CONFIG.Enabled then
			local success, err = pcall(performAutoCraftCycle)
			if not success then
				warn("[AutoCraft] Error during execution: " .. tostring(err))
			end
		end
		task.wait(CONFIG.UpdateInterval)
	end
end)

return CONFIG
