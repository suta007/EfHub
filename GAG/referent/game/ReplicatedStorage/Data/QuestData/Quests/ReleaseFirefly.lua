local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "ReleaseFirefly",
	["Display"] = function(_, p2, p3, _)
		local v4
		if p3 > 1 then
			v4 = ("Release %* Fireflies from their jars"):format(p3)
		else
			v4 = ("Release %* Firefly from its jar"):format(p3)
		end
		return {
			["Title"] = v4,
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "Be free, little guy!"
		}
	end,
	["Use"] = function(p5, p6)
		local v7 = table.clone(p6)
		v7.Type = p5.Type
		return v7
	end
}