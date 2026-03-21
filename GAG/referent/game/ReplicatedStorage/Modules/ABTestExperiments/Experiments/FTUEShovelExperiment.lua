local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local function v5(p3, p4)
	p3:SetAttribute("AB_FTUEShovel", p4)
end
return {
	["RemoteConfig"] = "FTUEShovel",
	["Disabled"] = false,
	["DefaultState"] = v2:IsStudio() and "Variant2" or "Variant3",
	["States"] = {
		["Variant1"] = {
			["Server"] = v5
		},
		["Variant2"] = {
			["Server"] = v5
		},
		["Variant3"] = {
			["Server"] = v5
		}
	}
}