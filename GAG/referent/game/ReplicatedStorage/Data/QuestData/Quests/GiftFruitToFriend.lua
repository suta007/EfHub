local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "GiftFruitToFriend",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest GiftFruitToFriend doesn\'t have an argument.")
		local v5 = p4[1]
		return v5 and {
			["Title"] = ("Gift %*x %* to friends"):format(p3, v5),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Sharing is caring!"
		} or {
			["Title"] = ("Gift %*x fruits to friends"):format(p3),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Sharing is caring!"
		}
	end,
	["Use"] = function(p6, p7)
		local v8 = p7.Arguments
		assert(v8, "GiftFruitToFriend quests needs arguments.")
		local v9 = table.clone(p7)
		v9.Type = p6.Type
		return v9
	end
}