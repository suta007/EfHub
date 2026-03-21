local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v3 = {
	["RemoteConfig"] = "ShowPickupTally",
	["Disabled"] = false,
	["DefaultState"] = v2:IsStudio()
}
local v5 = {
	[true] = {
		["Client"] = function(p4, _)
			p4:SetAttribute("AB_ShowPickupTally", true)
		end
	}
}
v3.States = v5
return v3