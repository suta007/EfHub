local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.Parent.Shared.Util)
local v_u_3 = {}
for _, v4 in v1.Data.AchievementsData.Seasons:GetChildren() do
	local v5 = v4.Name
	table.insert(v_u_3, v5)
end
local v_u_10 = {
	["Transform"] = function(p6)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.MakeFuzzyFinder(v_u_3)(p6)
	end,
	["Validate"] = function(p7)
		return #p7 > 0, "No seasons could be found."
	end,
	["Autocomplete"] = function(p8)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p8)
	end,
	["Parse"] = function(p9)
		return p9[1]
	end,
	["Default"] = function(_) end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p11)
	-- upvalues: (copy) v_u_10
	p11:RegisterType("achievementseason", v_u_10)
end