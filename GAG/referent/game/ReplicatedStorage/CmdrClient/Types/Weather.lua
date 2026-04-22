local v_u_1 = require(game.ReplicatedStorage.Code.Util)
game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllWeather") or "[]")
workspace:GetAttributeChangedSignal("AllWeather"):Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	v_u_3 = v_u_2:JSONDecode(workspace:GetAttribute("AllWeather"))
end)
local v_u_8 = {
	["Transform"] = function(p4)
		-- upvalues: (copy) v_u_1, (ref) v_u_3
		return v_u_1.MakeFuzzyFinder(v_u_3)(p4)
	end,
	["Validate"] = function(p5)
		return #p5 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p6)
		-- upvalues: (copy) v_u_1
		return v_u_1.GetNames(p6)
	end,
	["Parse"] = function(p7)
		return p7[1]
	end,
	["Default"] = function(_)
		return "Rain"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p9)
	-- upvalues: (copy) v_u_8, (copy) v_u_1
	p9:RegisterType("weather", v_u_8)
	p9:RegisterType("weathers", v_u_1.MakeListableType(v_u_8))
end