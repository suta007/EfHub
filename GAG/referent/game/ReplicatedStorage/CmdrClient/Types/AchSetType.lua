local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_2 = require(game.ReplicatedStorage.Code.Util)
local v_u_3 = {}
for _, v4 in v1.Data.AchievementsData.Seasons:GetChildren() do
	for v5, _ in require(v4).Sets do
		table.insert(v_u_3, v5)
	end
end
local v_u_10 = {
	["Transform"] = function(p6)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.MakeFuzzyFinder(v_u_3)(p6)
	end,
	["Validate"] = function(p7)
		return #p7 > 0, "No sets could be found."
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
	p11:RegisterType("achievementset", v_u_10)
end