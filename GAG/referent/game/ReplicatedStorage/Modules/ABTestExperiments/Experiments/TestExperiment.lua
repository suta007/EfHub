local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v2 = {
	["RemoteConfig"] = "Test",
	["Disabled"] = false,
	["DefaultState"] = true
}
local v3 = {
	[true] = {
		["Server"] = function(_, _) end,
		["Client"] = function(_, _) end
	},
	[false] = {
		["Server"] = function(_, _) end,
		["Client"] = function(_, _) end
	}
}
v2.States = v3
return v2