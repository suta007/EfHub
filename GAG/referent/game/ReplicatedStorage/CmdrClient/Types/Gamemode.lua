game:GetService("ReplicatedStorage")
local v_u_1 = require(game.ReplicatedStorage.Code.Util)
local v_u_2 = { "Creative", "Adventure", "Spectator" }
local v_u_7 = {
	["Transform"] = function(p3)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		return v_u_1.MakeFuzzyFinder(v_u_2)(p3)
	end,
	["Validate"] = function(p4)
		return #p4 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p5)
		-- upvalues: (copy) v_u_1
		return v_u_1.GetNames(p5)
	end,
	["Parse"] = function(p6)
		return p6[1]
	end,
	["Default"] = function(_)
		return "Creative"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p8)
	-- upvalues: (copy) v_u_7
	p8:RegisterType("gamemode", v_u_7)
end