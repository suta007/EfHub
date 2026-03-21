local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "Craft",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest Craft doesn\'t have an argument.")
		return {
			["Title"] = ("Craft %*x %*"):format(p3, p4[2]),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Find the right crafting station and get creating!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "Craft quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}