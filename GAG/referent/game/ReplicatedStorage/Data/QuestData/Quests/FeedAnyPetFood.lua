local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Modules.TimeHelper)
return {
	["Type"] = "FeedAnyPetFood",
	["Display"] = function(_, p2, p3, p4)
		assert(p4)
		return p4[1] and {
			["Title"] = ("Feed any pet %*x %*"):format(p3, p4[1]),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = ("Cook up %* for your pet"):format(p4[1])
		} or {
			["Title"] = ("Feed any pet %* time%*"):format(p3, p3 > 1 and "s" or ""),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Cook up a treat for your pet!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = table.clone(p6)
		v7.Type = p5.Type
		return v7
	end
}