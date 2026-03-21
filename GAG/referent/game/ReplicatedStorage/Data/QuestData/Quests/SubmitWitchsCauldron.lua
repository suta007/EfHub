local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
require(v1.Data.SeedData)
return {
	["Type"] = "SubmitWitchsCauldron",
	["Display"] = function(_, p2, p3)
		return {
			["Title"] = ("Offer %*x"):format(p3),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Contribute to the Cauldron!"
		}
	end,
	["Use"] = function(p4, p5)
		local v6 = table.clone(p5)
		v6.Type = p4.Type
		return v6
	end
}