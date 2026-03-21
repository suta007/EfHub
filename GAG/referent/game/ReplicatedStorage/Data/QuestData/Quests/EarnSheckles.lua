local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Comma_Module)
return {
	["Type"] = "EarnSheckles",
	["Display"] = function(_, p3, p4)
		-- upvalues: (copy) v_u_2
		local v5 = v_u_2.Comma(p4)
		return {
			["Title"] = ("Earn %*\194\162"):format(v5),
			["Bar"] = ("%*/%*"):format(v_u_2.Comma((math.min(p3, p4))), v5),
			["Description"] = "Sell your crops to make that moolah!"
		}
	end,
	["Use"] = function(p6, p7)
		local v8 = table.clone(p7)
		v8.Type = p6.Type
		return v8
	end
}