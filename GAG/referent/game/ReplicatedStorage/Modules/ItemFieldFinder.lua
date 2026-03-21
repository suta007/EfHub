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
local v_u_13 = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
local function v_u_16(p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_6, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_13, (copy) v_u_2, (copy) v_u_9, (copy) v_u_10
	if p15 == "Pet" then
		return v_u_4[p14]
	end
	if p15 == "Fence" then
		return v_u_11[p14]
	end
	if p15 == "Seed" or p15 == "Holdable" then
		return v_u_6[p14]
	end
	if v_u_12.IsItemTypeGear(p15) then
		return v_u_8[p14]
	end
	if p15 == "Seed Pack" then
		if v_u_7 and v_u_7.Packs then
			return v_u_7.Packs[p14]
		end
	else
		if p15 == "PetEgg" or p15 == "Egg" then
			return v_u_5[p14]
		end
		if p15 == "CosmeticCrate" or p15 == "Crate" then
			return v_u_13[p14]
		end
		if p15 == "Cosmetic" then
			return v_u_2[p14]
		end
		if p15 == "Currency" then
			return v_u_9[p14]
		end
		if p15 == "Food" and (v_u_10 and v_u_10.Recipes) then
			return v_u_10.Recipes[p14]
		end
	end
	return nil
end
local function v_u_21(p17, p18, p19)
	-- upvalues: (copy) v_u_12
	if p19 == "Pet" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "Fence" then
		if not (p17 and p17.Icon) then
			return "rbxassetid://6937742258"
		end
		local v20 = p17.Icon
		return "rbxassetid://" .. tostring(v20)
	end
	if p19 == "Seed" then
		return p17 and p17.Asset or "rbxassetid://6937742258"
	end
	if p19 == "Holdable" then
		return p17 and p17.FruitIcon or "rbxassetid://6937742258"
	end
	if v_u_12.IsItemTypeGear(p19) then
		return p17 and p17.Asset or "rbxassetid://6937742258"
	end
	if p19 == "Seed Pack" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "PetEgg" or p19 == "Egg" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "CosmeticCrate" or p19 == "Crate" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "Cosmetic" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "Currency" then
		return p17 and p17.Icon or "rbxassetid://6937742258"
	end
	if p19 == "Food" then
		return p17 and p17.ImageId or "rbxassetid://6937742258"
	end
	warn((("No image found for %* of item type %*"):format(p18, p19)))
	return "rbxassetid://6937742258"
end
local function v_u_27(p22, p23)
	if typeof(p22) == "table" then
		if p22[p23] ~= nil then
			return p22[p23]
		end
		local v24 = string.lower(p23)
		for v25, v26 in pairs(p22) do
			if typeof(v25) == "string" and string.find(string.lower(v25), v24, 1, true) then
				print(("ItemFieldFinder matched key \'%s\' for field \'%s\'"):format(v25, p23))
				return v26
			end
		end
	end
	return nil
end
return function(p28, p29, p30)
	-- upvalues: (copy) v_u_16, (copy) v_u_21, (copy) v_u_27
	local v31 = v_u_16(p28, p29)
	if p30 == "Image" then
		if v31 then
			return v_u_21(v31, p28, p29)
		end
		warn((("No image found for %* of item type %*"):format(p28, p29)))
		return "rbxassetid://6937742258"
	end
	if not v31 then
		warn((("No record found for %* of item type %*"):format(p28, p29)))
		return nil
	end
	local v32 = v_u_27(v31, p30)
	if v32 == nil then
		warn((("No field containing \"%*\" found for %* of item type %*"):format(p30, p28, p29)))
	end
	return v32
end