local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Modules.Pluralize)
return {
	["Type"] = "Harvest",
	["Display"] = function(_, p3, p4, p5)
		-- upvalues: (copy) v_u_2
		assert(p5, "Quest Harvest doesn\'t have an argument.")
		local v6 = {}
		local v7 = "Harvest %* %*"
		local v8
		if p4 > 1 then
			v8 = v_u_2(p5[1])
		else
			v8 = p5[1]
		end
		v6.Title = v7:format(p4, v8)
		v6.Bar = ("%*/%*"):format(p3, p4)
		v6.Description = "Mutations and variants not required."
		return v6
	end,
	["Use"] = function(p9, p10)
		local v11 = p10.Arguments
		assert(v11, "Plant quests needs arguments.")
		local v12 = table.clone(p10)
		v12.Type = p9.Type
		return v12
	end
}