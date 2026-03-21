local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
return {
	["RemoteConfig"] = "PetTutorial",
	["Disabled"] = false,
	["DefaultState"] = v2:IsStudio() and true or false,
	["States"] = {
		[true] = {
			["Server"] = function(p3, _)
				p3:SetAttribute("AB_PetTutorial", true)
			end
		},
		[false] = {
			["Server"] = function(p4, _)
				p4:SetAttribute("AB_PetTutorial", false)
			end
		}
	}
}