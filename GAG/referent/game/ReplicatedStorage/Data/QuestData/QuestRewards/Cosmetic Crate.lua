local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Modules.ItemImageFinder)
return {
	["Type"] = "Cosmetic Crate",
	["Display"] = function(_, p3)
		return ("+%* %*"):format(p3.Data.Amount, p3.Data.Type)
	end,
	["DisplayIcon"] = function(_, p4)
		-- upvalues: (copy) v_u_2
		return v_u_2(p4.Data.Type, "CosmeticCrate")
	end,
	["Give"] = function(_, p5, p6)
		local v7 = game:GetService("ServerScriptService")
		return require(v7.Modules.Cosmetics.CosmeticCrateToolService):GiveCrate(p5, p6.Data.Type, p6.Data.Amount)
	end,
	["Use"] = function(p8, p9)
		return {
			["Type"] = p8.Type,
			["Data"] = p9
		}
	end
}