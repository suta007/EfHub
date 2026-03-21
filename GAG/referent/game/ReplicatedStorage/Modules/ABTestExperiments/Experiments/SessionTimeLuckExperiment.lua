local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v2 = {
	["RemoteConfig"] = "SessionTimeLuck",
	["Disabled"] = false,
	["DefaultState"] = false
}
local v5 = {
	[false] = {
		["Server"] = function(p3, _)
			p3:SetAttribute("SessionTimeLuckEnabled", false)
		end
	},
	[true] = {
		["Server"] = function(p4, _)
			p4:SetAttribute("SessionTimeLuckEnabled", true)
		end
	}
}
v2.States = v5
return v2