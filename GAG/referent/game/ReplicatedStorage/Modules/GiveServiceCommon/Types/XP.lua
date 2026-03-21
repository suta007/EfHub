local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon.RewardDataTypes)
return {
	["Use"] = function(_, p3)
		return {
			["Type"] = "XP",
			["Value"] = p3
		}
	end,
	["Format"] = function(_, p4)
		-- upvalues: (copy) v_u_2
		return ("%*x XP"):format((v_u_2(p4.Value)))
	end,
	["GetImage"] = function(_, _)
		return "rbxassetid://0"
	end,
	["GetRarity"] = function(_, _)
		return "Common"
	end
}