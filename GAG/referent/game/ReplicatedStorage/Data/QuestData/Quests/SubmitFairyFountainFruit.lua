local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "SubmitFairyFountainFruit",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest Submit Fairy Fountain Fruit doesn\'t have an argument.")
		local v5 = p4[1]
		local v6 = p4[2]
		return v6 and {
			["Title"] = ("Offer %*x %* %*"):format(p3, v6, v5),
			["Bar"] = ("%*/%*"):format(p2, p3)
		} or {
			["Title"] = ("Offer %*x %*"):format(p3, v5),
			["Bar"] = ("%*/%*"):format(p2, p3)
		}
	end,
	["Use"] = function(p7, p8)
		local v9 = p8.Arguments
		assert(v9, "Submit Fairy Fountain Fruit quests needs arguments.")
		local v10 = table.clone(p8)
		v10.Type = p7.Type
		return v10
	end
}