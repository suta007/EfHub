local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local v2 = v1.Assets.Models.FriendshipPots
local v_u_3 = require(script.Parent.Parent.Shared.Util)
local v_u_4 = {}
for _, v5 in v2:GetChildren() do
	local v6 = v5.Name
	table.insert(v_u_4, v6)
end
local v_u_11 = {
	["Transform"] = function(p7)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3.MakeFuzzyFinder(v_u_4)(p7)
	end,
	["Validate"] = function(p8)
		return #p8 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p9)
		-- upvalues: (copy) v_u_3
		return v_u_3.GetNames(p9)
	end,
	["Parse"] = function(p10)
		return p10[1]
	end,
	["Default"] = function(_)
		return "Common"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p12)
	-- upvalues: (copy) v_u_11
	p12:RegisterType("friendshippottype", v_u_11)
end