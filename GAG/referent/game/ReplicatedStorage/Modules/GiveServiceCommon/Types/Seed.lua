local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.CommaFormatNumber)
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p3, p4, p5)
		local v6 = require(game.ReplicatedStorage.Data.SeedData)[p3]
		local v7 = ("Seed Item \"%*\" is an invalid entry. Please fix"):format(p3)
		assert(v6, v7)
		return {
			["Type"] = "Seed",
			["Value"] = p3,
			["Quantity"] = p4 or 1,
			["Variant"] = p5
		}
	end,
	["Format"] = function(_, p8)
		-- upvalues: (copy) v_u_2
		local v9 = p8.Quantity or 1
		local v10 = p8.Value
		if p8.Variant then
			v10 = p8.Variant .. " " .. v10
		end
		if v10:sub(-4) ~= "Seed" then
			v10 = v10 .. " Seed"
		end
		return ("%*x %*"):format(v_u_2(v9), v10)
	end,
	["GetImage"] = function(_, p11)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p11.Value, "Seed")
	end,
	["GetRarity"] = function(_, p12)
		-- upvalues: (copy) v_u_1
		local v13 = require(v_u_1.Data.SeedData)[p12.Value]
		return not v13 and "Common" or v13.SeedRarity
	end
}