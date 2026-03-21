local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v3 = {
	["RemoteConfig"] = "RestockTimer",
	["Disabled"] = false,
	["DefaultState"] = v2:IsStudio()
}
local v6 = {
	[true] = {
		["Client"] = function(p4, _)
			p4:SetAttribute("AB_RestockTimer", true)
		end
	},
	[false] = {
		["Client"] = function(p5, _)
			p5:SetAttribute("AB_RestockTimer", nil)
		end
	}
}
v3.States = v6
return v3