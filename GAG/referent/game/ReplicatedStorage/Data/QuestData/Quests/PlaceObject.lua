local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Data.SeedData)
return {
	["Type"] = "PlaceObject",
	["Display"] = function(_, p3, p4, p5)
		-- upvalues: (copy) v_u_2
		assert(p5, "Quest PlaceObject doesn\'t have an argument.")
		local _ = v_u_2[p5[1]]
		return {
			["Title"] = ("Place %*x %*%*"):format(p4, p5[1], p4 > 1 and "s" or ""),
			["Bar"] = ("%*/%*"):format(p3, p4),
			["Description"] = "Place those items!"
		}
	end,
	["Use"] = function(p6, p7)
		local v8 = p7.Arguments
		assert(v8, "PlaceObject quests needs arguments.")
		local v9 = table.clone(p7)
		v9.Type = p6.Type
		return v9
	end
}