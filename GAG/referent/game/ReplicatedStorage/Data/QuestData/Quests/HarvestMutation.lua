local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "HarvestMutation",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest HarvestMutation doesn\'t have an argument.")
		return p4[1] and {
			["Title"] = ("Harvest %*x %* Mutated Plants"):format(p3, p4[1]),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = ("Any plant will do, as long as it has the %* mutation!"):format(p4[1])
		} or {
			["Title"] = ("Harvest %*x Mutated Plants"):format(p3),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Any plant will do, as long as it has a mutation!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "Plant quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}