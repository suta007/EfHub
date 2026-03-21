local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.CommaFormatNumber)
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p3, p4)
		local v5 = p3 or "Sheckles"
		local v6 = require(game.ReplicatedStorage.Data.CurrencyData)[v5]
		local v7 = ("Currency Item \"%*\" is not a valid entry. Please fix"):format(v5)
		assert(v6, v7)
		return {
			["Type"] = "Currency",
			["Value"] = v5,
			["Quantity"] = p4 or 1
		}
	end,
	["Format"] = function(_, p8)
		-- upvalues: (copy) v_u_2
		local v9 = p8.Quantity or 1
		local v10 = p8.Value
		return ("%*x %*"):format(v_u_2(v9), v10)
	end,
	["GetImage"] = function(_, p11)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p11.Value, "Currency")
	end,
	["GetRarity"] = function(_, p12)
		-- upvalues: (copy) v_u_1
		local v13 = require(v_u_1.Data.CurrencyData)
		return not v13 and "Common" or v13[p12.Value].Rarity
	end
}