local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.Parent.Shared.Util)
local v_u_3 = {}
for _, v4 in require(v1.Data.AchievementsData).Seasons do
	for _, v5 in v4.Sets do
		for _, v6 in v5.Quests do
			local v7 = v6.Id
			table.insert(v_u_3, v7)
		end
	end
end
local v_u_12 = {
	["Transform"] = function(p8)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.MakeFuzzyFinder(v_u_3)(p8)
	end,
	["Validate"] = function(p9)
		return #p9 > 0, "No quests could be found."
	end,
	["Autocomplete"] = function(p10)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p10)
	end,
	["Parse"] = function(p11)
		return p11[1]
	end,
	["Default"] = function(_) end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p13)
	-- upvalues: (copy) v_u_12
	p13:RegisterType("achievementquest", v_u_12)
end