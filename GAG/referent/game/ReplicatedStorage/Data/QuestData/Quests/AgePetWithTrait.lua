local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
return {
	["Type"] = "AgePetWithTrait",
	["Display"] = function(_, p2, p3, p4)
		assert(p4, "AgePetWithTrait quest requires trait argument")
		local v5 = p4[1]
		return {
			["Title"] = ("Level up a \"%*\" type pet"):format(v5),
			["Bar"] = ("%*/%*"):format(p2, p3),
			["Description"] = ("Level up pets that are \"%*\" type!."):format(v5)
		}
	end,
	["Use"] = function(p6, p7)
		local v8 = table.clone(p7)
		v8.Type = p6.Type
		return v8
	end
}