local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.Parent.Shared.Util)
local v3 = require(v1.Modules.MutationHandler)
require(v1.Data.GearData)
local v_u_4 = {}
for v5 in v3:GetMutations() do
	table.insert(v_u_4, v5)
end
local v_u_10 = {
	["Transform"] = function(p6)
		-- upvalues: (copy) v_u_2, (copy) v_u_4
		return v_u_2.MakeFuzzyFinder(v_u_4)(p6)
	end,
	["Validate"] = function(p7)
		return #p7 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p8)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p8)
	end,
	["Parse"] = function(p9)
		return p9[1]
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
return function(p11)
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	p11:RegisterType("strictmutation", v_u_10)
	p11:RegisterType("strictmutations", v_u_2.MakeListableType(v_u_10, {
		["Prefixes"] = "% mutations"
	}))
end