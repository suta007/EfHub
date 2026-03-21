local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Comma_Module)
local v_u_3 = require(v1.Data.CurrencyData)
return {
	["Type"] = "EarnEventCurrency",
	["Display"] = function(_, p4, p5, p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		assert(p6, "Quest EarnEventCurrency doesn\'t have an argument.")
		local v7 = v_u_3[p6[1]].CurrencyName
		local v8 = v_u_2.Comma(p5)
		return {
			["Title"] = ("Earn %* %*"):format(v8, v7),
			["Bar"] = ("%*/%*"):format(v_u_2.Comma((math.min(p4, p5))), v8),
			["Description"] = ("Earn %* from doing tasks related to its event!"):format(v7)
		}
	end,
	["Use"] = function(p9, p10)
		local v11 = table.clone(p10)
		v11.Type = p9.Type
		return v11
	end
}