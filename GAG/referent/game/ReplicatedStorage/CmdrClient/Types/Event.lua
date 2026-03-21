game:GetService("ReplicatedStorage")
local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_2 = game:GetService("HttpService")
local v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllEvents") or "[]")
workspace:GetAttributeChangedSignal("AllEvents"):Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllEvents"))
end)
local v_u_8 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_1, (ref) v_u_3
		return v_u_1.MakeFuzzyFinder(v_u_3)(p4)
	end,
	["Validate"] = function(p5)
		return #p5 > 0, "No events could be found."
	end,
	["Autocomplete"] = function(p6)
		-- upvalues: (copy) v_u_1
		return v_u_1.GetNames(p6)
	end,
	["Parse"] = function(p7)
		return p7[1]
	end,
	["Default"] = function(_) end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p9)
	-- upvalues: (copy) v_u_8
	p9:RegisterType("event", v_u_8)
end