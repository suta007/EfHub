local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.CosmeticRegistry).CosmeticList
local v_u_3 = require(v1.Data.PetRegistry).PetList
local v_u_4 = require(v1.Data.SeedData)
local v_u_5 = require(v1.Data.SeedPackData)
local v_u_6 = require(v1.Data.GearData)
local v_u_7 = require(v1.Data.CurrencyData)
local v_u_8 = require(v1.Data.FenceSkinRegistry)
local v_u_9 = require(v1.Data.TradeBoothSkinRegistry)
local v_u_10 = require(v1.Modules.GearUtil)
return function(p11, p12)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_2, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_9
	if p12 == "Fence" or p12 == "Fences" then
		local v13 = v_u_8[p11]
		if v13 then
			return v13.Rarity
		end
	elseif p12 == "Seed" or p12 == "Holdable" then
		local v14 = v_u_4[p11]
		if v14 then
			return v14.SeedRarity
		end
	elseif p12 == "Cosmetic" then
		local v15 = v_u_2[p11]
		if v15 then
			return v15.Rarity
		end
	elseif p12 ~= "Egg" then
		if v_u_10.IsItemTypeGear(p12) then
			local v16 = v_u_6[p11]
			if v16 then
				return v16.GearRarity
			end
		elseif p12 == "Seed Pack" then
			if v_u_5.Packs[p11] then
				return "Common"
			end
		elseif p12 ~= "Fruit" then
			if p12 == "Pet" then
				local v17 = v_u_3[p11]
				if v17 then
					return v17.Rarity
				end
			elseif p12 == "Currency" then
				local v18 = v_u_7[p11]
				if v18 then
					return v18.Rarity
				end
			else
				local v19 = p12 == "TradeBoothSkin" and v_u_9[p11]
				if v19 then
					return v19.Rarity
				end
			end
		end
	end
	return nil
end