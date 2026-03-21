local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p2)
		local v3 = require(game.ReplicatedStorage.Data.FenceSkinRegistry)[p2]
		local v4 = ("Fence Item \"%*\" is not a valid entry. Please fix"):format(p2)
		assert(v3, v4)
		return {
			["Type"] = "Fences",
			["Value"] = p2
		}
	end,
	["Format"] = function(_, p5)
		-- upvalues: (copy) v_u_1
		local v6 = require(v_u_1.Data.FenceSkinRegistry)[p5.Value]
		return not v6 and "N/A" or v6.DisplayName
	end,
	["GetImage"] = function(_, p7)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p7.Value, "Fences")
	end,
	["GetRarity"] = function(_, p8)
		-- upvalues: (copy) v_u_1
		local v9 = require(v_u_1.Data.FenceSkinRegistry)[p8.Value]
		return not v9 and "Common" or v9.Rarity
	end
}