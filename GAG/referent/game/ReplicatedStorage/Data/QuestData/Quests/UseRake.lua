local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "UseRake",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest UseRake doesn\'t have an argument.")
		return {
			["Title"] = ("Have %* rake%* be stepped on by another player"):format(p3, p3 > 1 and "s" or ""),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Classic cartoon trickery!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "UseRake quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}