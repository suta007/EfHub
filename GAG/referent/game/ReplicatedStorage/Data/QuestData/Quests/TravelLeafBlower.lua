local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "TravelLeafBlower",
	["Display"] = function(_, p2, p3, _)
		return {
			["Title"] = ("Travel %* studs with a Leafblower"):format(p3),
			["Bar"] = ("%*/%*"):format(math.floor(p2), p3),
			["Description"] = "Be free, little guy!"
		}
	end,
	["Use"] = function(p4, p5)
		local v6 = table.clone(p5)
		v6.Type = p4.Type
		return v6
	end
}