local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Modules.TimeHelper)
return {
	["Type"] = "GrowPetToAge",
	["Display"] = function(_, p2, p3, p4)
		assert(p4)
		return {
			["Title"] = ("Grow a %* to age %*"):format(p4[1], p4[2]),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Pets will get older over time as long as you have them equipped."
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = table.clone(p6)
		v7.Type = p5.Type
		return v7
	end
}