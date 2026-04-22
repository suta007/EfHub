local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(game.ReplicatedStorage.Code.Util)
local v3 = require(v1.Modules.MutationHandler)
local v4 = require(v1.Item_Module)
require(v1.Data.GearData)
local v_u_5 = {}
for _, v6 in v4.VariantNames do
	table.insert(v_u_5, v6)
end
for v7 in v3:GetMutations() do
	table.insert(v_u_5, v7)
end
local v_u_12 = {
	["Transform"] = function(p8)
		-- upvalues: (copy) v_u_2, (copy) v_u_5
		return v_u_2.MakeFuzzyFinder(v_u_5)(p8)
	end,
	["Validate"] = function(p9)
		return #p9 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p10)
		-- upvalues: (copy) v_u_2
		return v_u_2.GetNames(p10)
	end,
	["Parse"] = function(p11)
		return p11[1]
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
return function(p13)
	-- upvalues: (copy) v_u_12
	p13:RegisterType("mutation", v_u_12)
end