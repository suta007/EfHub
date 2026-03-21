local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "UseMapleSyrup",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "Quest UseMapleSyrup doesn\'t have an argument.")
		return {
			["Title"] = ("Give %* Maple Syrup to a pet"):format(p3),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Maple Syrup for everyone!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = p6.Arguments
		assert(v7, "UseMapleSyrup quests needs arguments.")
		local v8 = table.clone(p6)
		v8.Type = p5.Type
		return v8
	end
}