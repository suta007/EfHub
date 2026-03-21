local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Modules.Pluralize)
return {
	["Type"] = "HarvestButtercup",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest Harvest doesn\'t have an argument.")
		return {
			["Title"] = ("Harvest %* %* %*"):format(p3, p4[1], p3 > 1 and "Buttercups" or "Buttercup"),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Mutations and variants not required."
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