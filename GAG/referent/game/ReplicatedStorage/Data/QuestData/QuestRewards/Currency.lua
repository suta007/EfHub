local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Data.QuestData.Types)
local v_u_2 = require(v_u_1.Data.CurrencyData)
return {
	["Type"] = "Currency",
	["Display"] = function(_, p3)
		-- upvalues: (copy) v_u_1
		local v4 = require(v_u_1.Data.CurrencyData)
		local v5 = v4[p3.Data.Type] and v4[p3.Data.Type].CurrencyName or p3.Data.Type
		return ("+%* %*"):format(p3.Data.Amount, v5)
	end,
	["DisplayIcon"] = function(_, p6)
		-- upvalues: (copy) v_u_2
		return v_u_2[p6.Data.Type].Icon
	end,
	["Give"] = function(_, p7, p8)
		local v9 = game:GetService("ServerScriptService")
		return require(v9.Modules.CurrencyService):Add(p7, p8.Data.Amount, false, nil, p8.Data.Type, Enum.AnalyticsEconomyTransactionType.Gameplay, "QuestRewards")
	end,
	["Use"] = function(p10, p11)
		return {
			["Type"] = p10.Type,
			["Data"] = p11
		}
	end
}