local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Data.SeedData)
return {
	["Type"] = "Plant",
	["Display"] = function(_, p3, p4, p5)
		-- upvalues: (copy) v_u_2
		assert(p5, "Quest Plant doesn\'t have an argument.")
		local v6 = v_u_2[p5[1]]
		local v7 = {}
		local v8 = "Plant %*x %*%*"
		local v9
		if v6 then
			v9 = v6.SeedName
		else
			v9 = p5[1]
		end
		v7.Title = v8:format(p4, v9, p4 > 1 and "s" or "")
		v7.Bar = ("%*/%*"):format(p3, p4)
		v7.Description = "Get planting, gardener!"
		return v7
	end,
	["Use"] = function(p10, p11)
		local v12 = p11.Arguments
		assert(v12, "Plant quests needs arguments.")
		local v13 = table.clone(p11)
		v13.Type = p10.Type
		return v13
	end
}