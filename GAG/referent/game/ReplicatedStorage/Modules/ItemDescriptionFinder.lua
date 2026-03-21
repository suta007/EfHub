local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.CosmeticRegistry).CosmeticList
local v3 = require(v1.Data.PetRegistry)
local v_u_4 = v3.PetList
local v_u_5 = v3.PetEggs
local v_u_6 = require(v1.Data.SeedData)
local v_u_7 = require(v1.Data.SeedPackData)
local v_u_8 = require(v1.Data.GearData)
local v_u_9 = require(v1.Modules.GearUtil)
require(v1.Data.CurrencyData)
local v_u_10 = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
function FindItemDescription(p11, p12)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_10, (copy) v_u_2
	if p12 == "Pet" then
		local v13 = v_u_4[p11]
		if v13 and (v13.Description and v13.Description ~= "") then
			return v13.Description
		end
	elseif p12 == "Seed" then
		local v14 = v_u_6[p11]
		if v14 and (v14.Description and v14.Description ~= "") then
			return v14.Description
		end
	elseif p12 == "Holdable" then
		local v15 = v_u_6[p11]
		if v15 and (v15.Description and v15.Description ~= "") then
			return v15.Description
		end
	elseif v_u_9.IsItemTypeGear(p12) then
		local v16 = v_u_8[p11]
		if v16 and (v16.GearDescription and v16.GearDescription ~= "") then
			return v16.GearDescription
		end
	elseif p12 == "Seed Pack" then
		local v17 = v_u_7.Packs[p11]
		if v17 and (v17.Description and v17.Description ~= "") then
			return v17.Description
		end
	elseif p12 == "PetEgg" or p12 == "Egg" then
		local v18 = v_u_5[p11]
		if v18 and (v18.Description and v18.Description ~= "") then
			return v18.Description
		end
	elseif p12 == "CosmeticCrate" or p12 == "Crate" then
		local v19 = v_u_10[p11]
		if v19 and (v19.Description and v19.Description ~= "") then
			return v19.Description
		end
	elseif p12 == "Cosmetic" then
		local v20 = v_u_2[p11]
		if v20 and (v20.Description and v20.Description ~= "") then
			return v20.Description
		end
	elseif p12 == "Currency" then
		return nil
	end
	return nil
end
return FindItemDescription