local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = {
	["Type"] = "HarvestAllMutations",
	["RequireAll"] = true
}
local function v_u_7(p3)
	local v4 = ""
	for v5, v6 in ipairs(p3) do
		if v5 == #p3 then
			v4 = v4 .. v6
		else
			v4 = v4 .. v6 .. ", "
		end
	end
	return "[" .. v4 .. "]"
end
function v2.Display(_, p8, p9, p10)
	-- upvalues: (copy) v_u_7
	assert(p10, "Quest HarvestAllMutations doesn\'t have an argument.")
	return {
		["Title"] = ("Harvest %* containing %* %*"):format(p9, v_u_7(p10), #p10 > 1 and "Mutations" or "Mutation"),
		["Bar"] = ("%*/%*"):format(p8, p9),
		["Description"] = "The plant must have every mutation specified."
	}
end
function v2.Use(p11, p12)
	local v13 = p12.Arguments
	assert(v13, "Plant quests needs arguments.")
	local v14 = table.clone(p12)
	v14.Type = p11.Type
	v14.RequireAll = p11.RequireAll
	return v14
end
return v2