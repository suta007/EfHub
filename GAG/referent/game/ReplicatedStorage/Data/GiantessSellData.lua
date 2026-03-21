local v1 = game:GetService("ReplicatedStorage")
require(game.ReplicatedStorage.Data.PetRegistry.PetEggs)
require(game.ReplicatedStorage.Data.SeedData)
require(game.ReplicatedStorage.Data.SeedPackData)
require(game.ReplicatedStorage.Data.GearData)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_2 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_3 = require(v1.Modules.PlantTraitsData)
require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_4 = {}
local v5 = {
	["Carrot"] = {
		["SellType"] = "Item",
		["RewardName"] = "Mythical Egg",
		["RewardQuantity"] = 1,
		["RewardType"] = "Egg"
	},
	["Strawberry"] = {
		["SellType"] = "Item",
		["RewardName"] = "Mysterious Crate",
		["RewardQuantity"] = 1,
		["RewardType"] = "Crate"
	},
	["Blueberry"] = {
		["SellType"] = "Item",
		["RewardName"] = "Sheckles",
		["RewardQuantity"] = 500,
		["RewardType"] = "Currency"
	},
	["Flower"] = {
		["SellType"] = "PlantTrait",
		["RewardName"] = "Sheckles",
		["RewardQuantity"] = 1000,
		["RewardType"] = "Currency",
		["CustomResponse"] = "Ooh, pretty!"
	}
}
v_u_4.SellData = v5
function v_u_4.GetRewardFor(_, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v7 = p6:GetAttribute(v_u_2.ItemName)
	p6:GetAttribute(v_u_2.ITEM_TYPE)
	if v_u_4[v7] == nil then
		for _, v8 in v_u_3.GetTraits(v7) do
			local v9 = v_u_4.SellData[v8]
			if v9 ~= nil and v9.SellType == "PlantTrait" then
				return v9
			end
		end
	end
	return v_u_4.SellData[v7]
end
function v_u_4.IsSellable(_, p10)
	-- upvalues: (copy) v_u_4
	if not p10:IsA("Tool") then
		return false
	end
	p10:FindFirstChild("Item_String")
	return v_u_4:GetRewardFor(p10) ~= nil
end
function v_u_4.GetSellableTools(_, p11, p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v13 = {}
	if not v13 then
		return v13
	end
	for _, v14 in p11:GetChildren() do
		if v14:IsA("Tool") and (v14:FindFirstChild("Item_String") and (not v14:GetAttribute(v_u_2.Favorite) or p12 ~= true and p12 ~= nil)) and v_u_4:GetRewardFor(v14) ~= nil then
			table.insert(v13, v14)
		end
	end
	return v13
end
return v_u_4