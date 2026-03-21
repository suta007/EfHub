local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Comma_Module)
local v_u_2 = require(v1.Modules.NumberUtil)
local v_u_3 = require(v1.Data.CurrencyData)
return {
	["Type"] = "Sheckles",
	["Display"] = function(_, p4)
		-- upvalues: (copy) v_u_2
		return ("+%*"):format((v_u_2.DisplaySheckles(p4.Data.Amount)))
	end,
	["DisplayIcon"] = function(_, _)
		-- upvalues: (copy) v_u_3
		return v_u_3.Sheckles.Icon
	end,
	["Give"] = function(_, p5, p6)
		local v7 = game:GetService("ServerScriptService")
		return require(v7.Modules.CurrencyService):Add(p5, p6.Data.Amount, nil, nil, nil, Enum.AnalyticsEconomyTransactionType.Gameplay, "QuestRewards")
	end,
	["Use"] = function(p8, p9)
		return {
			["Type"] = p8.Type,
			["Data"] = p9
		}
	end
}