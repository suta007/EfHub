local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p2, p3)
		local v4 = require(game.ReplicatedStorage.Data.TradeBoothSkinRegistry)[p2]
		local v5 = ("TradeBoothSkin Item \"%*\" is not a valid entry. Please fix"):format(p2)
		assert(v4, v5)
		return {
			["Type"] = "TradeBoothSkin",
			["Value"] = p2,
			["Quantity"] = p3 or 1
		}
	end,
	["Format"] = function(_, p6)
		-- upvalues: (copy) v_u_1
		local v7 = require(v_u_1.Data.TradeBoothSkinRegistry)[p6.Value]
		return not v7 and "N/A" or v7.DisplayName
	end,
	["GetImage"] = function(_, p8)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p8.Value, "TradeBoothSkin")
	end,
	["GetRarity"] = function(_, p9)
		-- upvalues: (copy) v_u_1
		local v10 = require(v_u_1.Data.TradeBoothSkinRegistry)[p9.Value]
		return not v10 and "Common" or v10.Rarity
	end
}