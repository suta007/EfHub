local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Modules.ItemImageFinder)
return {
	["Type"] = "Seed Pack",
	["Display"] = function(_, p3)
		local v4 = p3.Data.Amount
		local v5 = ("Seed Pack%*"):format(v4 > 1 and "s" or "")
		if p3.Data.Type and p3.Data.Type ~= "Normal" then
			return ("+%* %* %*"):format(v4, p3.Data.Type, v5)
		else
			return ("+%* %*"):format(v4, v5)
		end
	end,
	["DisplayIcon"] = function(_, p6)
		-- upvalues: (copy) v_u_2
		return v_u_2(p6.Data.Type or "Normal", "Seed Pack")
	end,
	["Give"] = function(_, p7, p8)
		local v9 = game:GetService("ServerScriptService")
		require(v9.Modules.SeedPackService):Give(p7, p8.Data.Type or "Normal", p8.Data.Amount)
		return true
	end,
	["Use"] = function(p10, p11)
		return {
			["Type"] = p10.Type,
			["Data"] = p11
		}
	end
}