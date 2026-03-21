local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.CommaFormatNumber)
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p3, p4)
		local v5 = require(game.ReplicatedStorage.Data.CosmeticRegistry.CosmeticList)[p3]
		local v6 = ("Cosmetic Item \"%*\" is not a valid entry. Please fix"):format(p3)
		assert(v5, v6)
		return {
			["Type"] = "Cosmetic",
			["Value"] = p3,
			["Quantity"] = p4 or 1
		}
	end,
	["Format"] = function(_, p7)
		-- upvalues: (copy) v_u_2
		local v8 = p7.Quantity or 1
		local v9 = p7.Value
		return ("%*x %*"):format(v_u_2(v8), v9)
	end,
	["GetImage"] = function(_, p10)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p10.Value, "Cosmetic")
	end,
	["GetRarity"] = function(_, p11)
		-- upvalues: (copy) v_u_1
		local v12 = require(v_u_1.Data.CosmeticRegistry).CosmeticList[p11.Value]
		return not v12 and "Common" or v12.Rarity
	end
}