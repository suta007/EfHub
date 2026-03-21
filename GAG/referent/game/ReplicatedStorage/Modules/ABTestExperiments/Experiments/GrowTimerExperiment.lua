local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v3 = {
	["RemoteConfig"] = "GrowTimer",
	["Disabled"] = true,
	["DefaultState"] = v2:IsStudio()
}
local v6 = {
	[true] = {
		["Server"] = function(p4, _)
			p4:SetAttribute("AB_GrowTimer", true)
		end
	},
	[false] = {
		["Server"] = function(p5, _)
			p5:SetAttribute("AB_GrowTimer", nil)
		end
	}
}
v3.States = v6
return v3