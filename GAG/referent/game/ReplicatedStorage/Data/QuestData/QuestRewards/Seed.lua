local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Data.QuestData.Types)
local v_u_2 = require(v_u_1.Modules.ItemImageFinder)
return {
	["Type"] = "Seed",
	["Display"] = function(_, p3)
		local v4 = p3.Data.Amount
		return ("+%* %* Seed%*"):format(v4, p3.Data.Type, v4 > 1 and "s" or "")
	end,
	["DisplayIcon"] = function(_, p5)
		-- upvalues: (copy) v_u_2
		return v_u_2(p5.Data.Type, "Seed")
	end,
	["Give"] = function(_, p6, p7)
		-- upvalues: (copy) v_u_1
		game:GetService("ServerScriptService")
		local v8 = require(v_u_1.Give_Seed)
		for _ = 1, p7.Data.Amount do
			task.spawn(v8.Give_Seed, p6, p7.Data.Type)
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