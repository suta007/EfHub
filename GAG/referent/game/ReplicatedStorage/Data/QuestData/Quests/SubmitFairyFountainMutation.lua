local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "SubmitFairyFountainMutation",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest Submit Fairy Fountain Mutation doesn\'t have an argument.")
		return {
			["Title"] = ("Offer %*x %* fruit"):format(p3, p4[1]),
			["Bar"] = ("%*/%*"):format(p2, p3)
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "Submit Fairy Fountain Mutation quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}