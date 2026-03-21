local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.Parent.Shared.Util)
game:GetService("HttpService")
local v_u_3 = require(v1.Modules.CycleHandler)
local v_u_11 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v5 = {}
		for v6, v7 in v_u_3.getAllHandlers() do
			if not v7.DisableCommandAutocomplete then
				table.insert(v5, v6)
			end
		end
		return v_u_2.MakeFuzzyFinder(v5)(p4)
	end,
	["Validate"] = function(p8)
		return #p8 > 0, "No Cycles could be found."
	end,
	["Autocomplete"] = function(p9)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p9)
	end,
	["Parse"] = function(p10)
		return p10[1]
	end,
	["Default"] = function(_) end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p12)
	-- upvalues: (copy) v_u_11
	p12:RegisterType("cycle", v_u_11)
end