local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.Parent.Shared.Util)
game:GetService("HttpService")
local v_u_3 = require(v1.Data.AdminQuestData)
local v_u_10 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v5 = {}
		for v6, _ in v_u_3.ValidAdminQuests do
			table.insert(v5, v6)
		end
		return v_u_2.MakeFuzzyFinder(v5)(p4)
	end,
	["Validate"] = function(p7)
		return #p7 > 0, "No Valid Admin Quests could be found."
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
	p11:RegisterType("adminquest", v_u_10)
end