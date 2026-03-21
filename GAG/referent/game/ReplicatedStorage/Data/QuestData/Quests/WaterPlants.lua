local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "WaterPlants",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest WaterPlants doesn\'t have an argument.")
		return {
			["Title"] = ("Use a watering can on %* growing plant%*"):format(p3, p3 > 1 and "s" or ""),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Water your plants!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "WaterPlants quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}