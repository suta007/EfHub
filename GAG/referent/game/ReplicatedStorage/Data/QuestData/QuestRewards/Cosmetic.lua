local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Modules.ItemImageFinder)
return {
	["Type"] = "Cosmetic",
	["Display"] = function(_, p3)
		return ("+%* %*"):format(p3.Data.Amount, p3.Data.Type)
	end,
	["DisplayIcon"] = function(_, p4)
		-- upvalues: (copy) v_u_2
		return v_u_2(p4.Data.Type, "Cosmetic")
	end,
	["Give"] = function(_, p5, p6)
		local v7 = game:GetService("ServerScriptService")
		local v8 = require(v7.Modules.CosmeticsServices.CosmeticService)
		for _ = 1, p6.Data.Amount do
			v8:CreateCosmetic(p5, p6.Data.Type)
		end
		return true
	end,
	["Use"] = function(p9, p10)
		return {
			["Type"] = p9.Type,
			["Data"] = p10
		}
	end
}