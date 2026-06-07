local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local SummerEventControllers = Modules:WaitForChild("SummerEventControllers")
local SummerCraftingController = SummerEventControllers:WaitForChild("SummerCraftingController")
local SummerCraftingConfig = require(SummerCraftingController.SummerCraftingConfig)

local Craftables = SummerCraftingConfig.Craftables
local DataService = require(ReplicatedStorage.Modules.DataService)

local function getEggUUID(GetData, eggName)
	local inventory = GetData.InventoryData or {}
	for uuid, value in pairs(inventory) do
		if value.ItemType == "PetEgg" and value.ItemData.EggName == eggName then
			return uuid
		end
	end
	return nil
end

local function getSeedUUID(GetData, seedName)
	local inventory = GetData.InventoryData or {}
	for uuid, value in pairs(inventory) do
		if value.ItemType == "Seed" and value.ItemData.ItemName == seedName then
			return uuid
		end
	end
	return nil
end

local function getFruitUUID(GetData, fruitName)
	local inventory = GetData.InventoryData or {}
	for uuid, value in pairs(inventory) do
		if value.ItemType == "Holdable" and value.ItemData.ItemName == fruitName then
			return uuid
		end
	end
	return nil
end

local function getGearUUID(GetData, gearName)
	local inventory = GetData.InventoryData or {}
	for uuid, value in pairs(inventory) do
		if value.ItemType == gearName or value.ItemData.ItemName == gearName then
			return uuid
		end
	end
	return nil
end

local function getCosmeticUUID(GetData, cosmeticName)
	local inventory = GetData.CosmeticData and GetData.CosmeticData.Inventory or {}
	for uuid, value in pairs(inventory) do
		if value.Name == cosmeticName then
			return uuid
		end
	end
	return nil
end

local TierIndex = {}

local function GetRecipeUUID(recipes)
	local UUIDs = {}
	if type(recipes) ~= "table" then
		return nil
	end
	local GetData_result = DataService:GetData()
	--local inventory = GetData_result.InventoryData or {}
	for _i, recipe in pairs(recipes) do
		if recipe["Type"] == "Egg" then
			local uuid = getEggUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, uuid)
			else
				return nil
			end
		elseif recipe["Type"] == "Seed" then
			local uuid = getSeedUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, uuid)
			else
				return nil
			end
		elseif recipe["Type"] == "Fruit" then
			local uuid = getFruitUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, uuid)
			else
				return nil
			end
		elseif recipe["Type"] == "Gear" then
			local uuid = getGearUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, uuid)
			else
				return nil
			end
		elseif recipe["Type"] == "Cosmetic" then
			local uuid = getCosmeticUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, "Cosmetic:" .. uuid)
			else
				return nil
			end
		end
	end
	return UUIDs
end

for _i, data in pairs(Craftables) do
	if data.Result and data.Result.Value then
		TierIndex[data.Tier] = (TierIndex[data.Tier] or 0) + 1

		if data.Result.Value == "Areaclaimer" then
			local key = string.format("%d:%d:%s", data.Tier, TierIndex[data.Tier], data.Result.Value)
			--AddLog(key)
			--ShowData(v.Recipe)
			local result = GetRecipeUUID(data.Recipe)
			if result then
				local args = { key, result }
				--ShowData(args)
				game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("SummerCraftingService"):WaitForChild("StartCraft"):FireServer(unpack(args))
				--AddLog("------------------------------------------------------")
			else
				--AddLog("Missing ingredient(s)")
			end
		end
	end
end
