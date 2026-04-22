local v1 = game:GetService("ReplicatedStorage")
local _ = require(v1.Data.CosmeticRegistry).CosmeticList
local v2 = require(v1.Data.PetRegistry)
local _ = v2.PetList
local _ = v2.PetEggs
local v_u_3 = require(v1.Data.SeedData)
local v_u_4 = require(v1.Data.SeedPackData)
local v_u_5 = require(v1.Data.GearData)
require(v1.Data.CurrencyData)
require(v1.Data.FoodRecipeData)
local v_u_6 = require(v1.Data.FenceSkinRegistry)
local v_u_7 = require(v1.Data.TradeBoothSkinRegistry)
local v_u_8 = require(v1.Modules.GearUtil)
local v_u_9 = require(v1.Data.CurrencyData)
local _ = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
function FindItemName(p10, p11)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7
	if p11 == "Fence" or p11 == "Fences" then
		local v12 = v_u_6[p10]
		if v12 then
			return v12.DisplayName
		else
			return p10
		end
	elseif p11 == "Seed" then
		local v13 = v_u_3[p10]
		if v13 then
			return v13.DisplayName or v13.SeedName
		else
			return p10
		end
	elseif p11 == "Cosmetic" then
		return p10
	elseif p11 == "Egg" then
		return p10
	elseif v_u_8.IsItemTypeGear(p11) then
		if v_u_5[p10] then
			return v_u_5[p10].GearName
		end
		warn((("No image found for %* of item type %*"):format(p10, p11)))
		return p10
	elseif p11 == "Seed Pack" then
		local v14 = v_u_4.Packs[p10]
		if v14 then
			return v14.DisplayName
		else
			return p10
		end
	elseif p11 == "Fruit" or p11 == "Holdable" then
		if p10 == "Candy Blossom 2026" then
			return "Candy Blossom"
		end
		local v15 = v_u_3[p10]
		return v15 and v15.DisplayName or p10
	elseif p11 == "Pet" then
		return p10
	elseif p11 == "Currency" then
		local v16 = v_u_9[p10]
		if v16 then
			return v16.CurrencyName
		else
			return p10
		end
	elseif p11 == "Crate" then
		return p10
	elseif p11 == "TradeBoothSkin" then
		local v17 = v_u_7[p10]
		if v17 then
			return v17.DisplayName
		else
			return p10
		end
	else
		return p11
	end
end
return FindItemName