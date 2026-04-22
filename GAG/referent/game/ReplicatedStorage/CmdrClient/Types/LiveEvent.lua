local v_u_1 = require(game.ReplicatedStorage.Code.Util)
local v_u_2 = game:GetService("HttpService")
local v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllLiveEvents") or "[]")
workspace:GetAttributeChangedSignal("AllLiveEvents"):Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllLiveEvents"))
end)
local v_u_8 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_1, (ref) v_u_3
		return v_u_1.MakeFuzzyFinder(v_u_3)(p4)
	end,
	["Validate"] = function(p5)
		return #p5 > 0, "No live events could be found."
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
	p9:RegisterType("liveevent", v_u_8)
end