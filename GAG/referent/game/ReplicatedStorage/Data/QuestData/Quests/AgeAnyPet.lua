local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "AgeAnyPet",
	["Display"] = function(_, p2, p3, _)
		return {
			["Title"] = "Level up any pet",
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Level up any of your pets to make progress toward this quest."
		}
	end,
	["Use"] = function(p4, p5)
		local v6 = table.clone(p5)
		v6.Type = p4.Type
		return v6
	end
}