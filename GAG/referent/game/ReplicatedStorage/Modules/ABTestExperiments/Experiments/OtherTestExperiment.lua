local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v2 = {
	["RemoteConfig"] = "TestKeyTeleport",
	["Disabled"] = false,
	["DefaultState"] = false
}
local v7 = {
	[true] = {
		["Server"] = function(p3, _)
			p3:SetAttribute("TestKeyTeleport", true)
		end,
		["Client"] = function(p4, _)
			p4:SetAttribute("TestKeyTeleport", true)
		end
	},
	[false] = {
		["Server"] = function(p5, _)
			p5:SetAttribute("TestKeyTeleport", false)
		end,
		["Client"] = function(p6, _)
			p6:SetAttribute("TestKeyTeleport", false)
		end
	}
}
v2.States = v7
return v2