local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "TriggerFallBloom",
	["Display"] = function(_, p2, p3, _)
		return {
			["Title"] = ("Trigger a Fall Bloom %* time%*"):format(p3, p3 > 1 and "s" or ""),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = "The Heartseed welcomes your contributions"
		}
	end,
	["Use"] = function(p4, p5)
		local v6 = table.clone(p5)
		v6.Type = p4.Type
		return v6
	end
}