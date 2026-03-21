local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Modules.TimeHelper)
return {
	["Type"] = "PlayTime",
	["Display"] = function(_, p3, p4)
		-- upvalues: (copy) v_u_2
		local v5 = v_u_2:GenerateColonFormatFromTime(p4)
		return {
			["Title"] = ("Play for %*"):format(v5),
			["Bar"] = ("%*/%*"):format(v_u_2:GenerateColonFormatFromTime(p3), v5),
			["Description"] = "Why touch grass when you could Grow a Garden!"
		}
	end,
	["Use"] = function(p6, p7)
		local v8 = table.clone(p7)
		v8.Type = p6.Type
		return v8
	end
}