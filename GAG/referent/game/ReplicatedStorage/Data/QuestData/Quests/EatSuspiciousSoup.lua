local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "EatSuspiciousSoup",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest EatSuspiciousSoup doesn\'t have an argument.")
		return {
			["Title"] = ("Consume %* bowls of Suspicious Soup"):format(p3),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "I hope it tastes better than it looks!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "EatSuspiciousSoup quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}