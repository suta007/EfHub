local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.CommaFormatNumber)
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p3, p4)
		return {
			["Type"] = "Fruit",
			["Value"] = p3,
			["Quantity"] = p4 or 1
		}
	end,
	["Format"] = function(_, p5)
		-- upvalues: (copy) v_u_2
		local v6 = p5.Quantity or 1
		local v7 = p5.Value
		return ("%*x %*"):format(v_u_2(v6), v7)
	end,
	["GetImage"] = function(_, p8)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p8.Value, "Holdable")
	end,
	["GetRarity"] = function(_, p9)
		-- upvalues: (copy) v_u_1
		local v10 = require(v_u_1.Data.SeedData)[p9.Value]
		return not v10 and "Common" or v10.SeedRarity
	end
}