local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "PlayWithFriend",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest PlayWithFriend doesn\'t have an argument.")
		return {
			["Title"] = "Play with a friend",
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Play on the same server as a connection!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "PlayWithFriend quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}