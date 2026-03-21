game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_6 = {
	["Transform"] = function(p2)
		-- upvalues: (copy) v_u_1
		return v_u_1.MakeFuzzyFinder({ "Start", "End" })(p2)
	end,
	["Validate"] = function(p3)
		return #p3 > 0, "No action could be found."
	end,
	["Autocomplete"] = function(p4)
		-- upvalues: (copy) v_u_1
		return v_u_1.GetNames(p4)
	end,
	["Parse"] = function(p5)
		return p5[1]
	end,
	["Default"] = function(_)
		return "Start"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p7)
	-- upvalues: (copy) v_u_6
	p7:RegisterType("jackolanterntype", v_u_6)
end