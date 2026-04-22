local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local _ = v1.Assets.Models.Fertilizers
local v_u_2 = require(game.ReplicatedStorage.Code.Util)
local v_u_3 = { "Variant" }
local v_u_8 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.MakeFuzzyFinder(v_u_3)(p4)
	end,
	["Validate"] = function(p5)
		return #p5 > 0, "No fertilizer could be found."
	end,
	["Autocomplete"] = function(p6)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p6)
	end,
	["Parse"] = function(p7)
		return p7[1]
	end,
	["Default"] = function(_)
		return "Variant"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p9)
	-- upvalues: (copy) v_u_8
	p9:RegisterType("fertilizertype", v_u_8)
end