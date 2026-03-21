local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.CosmeticRegistry).CosmeticList
local v3 = require(v1.Data.PetRegistry)
local v_u_4 = v3.PetList
local v_u_5 = v3.PetEggs
local v_u_6 = require(v1.Data.SeedData)
local v_u_7 = require(v1.Data.SeedPackData)
local v_u_8 = require(v1.Data.GearData)
local v_u_9 = require(v1.Data.CurrencyData)
local v_u_10 = require(v1.Data.FoodRecipeData)
local v_u_11 = require(v1.Data.FenceSkinRegistry)
local v_u_12 = require(v1.Modules.GearUtil)
local v_u_13 = require(v1.Data.TradeBoothSkinRegistry)
local v_u_14 = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
function FindItemImage(p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_6, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_14, (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_13
	if p16 == "Pet" then
		local v17 = v_u_4[p15]
		return not v17 and "rbxassetid://6937742258" or v17.Icon
	elseif p16 == "Fence" or p16 == "Fences" then
		local v18 = v_u_11[p15]
		return not v18 and "rbxassetid://6937742258" or "rbxassetid://" .. v18.Icon
	elseif p16 == "Seed" then
		local v19 = v_u_6[p15]
		return not v19 and "rbxassetid://6937742258" or v19.Asset
	elseif p16 == "RandomSeed" then
		return "rbxassetid://103471197086046"
	elseif p16 == "Holdable" or p16 == "Fruit" then
		local v20 = v_u_6[p15]
		return not v20 and "rbxassetid://6937742258" or v20.FruitIcon
	elseif v_u_12.IsItemTypeGear(p16) then
		local v21 = v_u_8[p15]
		if v21 then
			return v21.Asset
		end
		warn((("No image found for %* of item type %*"):format(p15, p16)))
		return "rbxassetid://6937742258"
	elseif p16 == "Seed Pack" then
		local v22 = v_u_7.Packs[p15]
		if v22 and v22.Icon then
			return v22.Icon
		end
		warn((("No image found for %* of item type %*"):format(p15, p16)))
		return "rbxassetid://6937742258"
	elseif p16 == "PetEgg" or p16 == "Egg" then
		local v23 = v_u_5[p15]
		return not v23 and "rbxassetid://6937742258" or v23.Icon
	elseif p16 == "CosmeticCrate" or p16 == "Crate" then
		local v24 = v_u_14[p15]
		return not v24 and "rbxassetid://6937742258" or v24.Icon
	elseif p16 == "Cosmetic" then
		local v25 = v_u_2[p15]
		return not v25 and "rbxassetid://6937742258" or v25.Icon
	elseif p16 == "Currency" then
		return v_u_9[p15].Icon
	elseif p16 == "Food" then
		return v_u_10.Recipes[p15].ImageId
	elseif p16 == "TradeBoothSkin" then
		local v26 = v_u_13[p15]
		return not v26 and "rbxassetid://6937742258" or v26.Icon
	else
		warn((("No image found for %* of item type %*"):format(p15, p16)))
		return "rbxassetid://6937742258"
	end
end
return FindItemImage