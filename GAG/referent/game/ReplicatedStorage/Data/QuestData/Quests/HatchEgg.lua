local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Modules.TimeHelper)
return {
	["Type"] = "HatchEgg",
	["Display"] = function(_, p2, p3, p4)
		assert(p4)
		return {
			["Title"] = ("Hatch %* %*"):format(p3, p4[1]),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Hatch any pet from the egg!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = table.clone(p6)
		v7.Type = p5.Type
		return v7
	end
}