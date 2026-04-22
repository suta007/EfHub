local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_2 = require(game.ReplicatedStorage.Code.Util)
local v_u_3 = {}
for v4 in require(v1.Data.FFlagState) do
	table.insert(v_u_3, v4)
end
local v_u_9 = {
	["Transform"] = function(p5)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.MakeFuzzyFinder(v_u_3)(p5)
	end,
	["Validate"] = function(p6)
		return #p6 > 0, "No type could be found."
	end,
	["Autocomplete"] = function(p7)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p7)
	end,
	["Parse"] = function(p8)
		return p8[1]
	end,
	["Default"] = function(_)
		return "Gold"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p10)
	-- upvalues: (copy) v_u_9
	p10:RegisterType("fflag", v_u_9)
end