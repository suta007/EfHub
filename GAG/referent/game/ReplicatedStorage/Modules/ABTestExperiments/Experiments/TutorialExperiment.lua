local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.ABTestExperiments.ABTestTypes)
require(v1.Modules.IsDev)
local function v4(p2, p3)
	p2:SetAttribute("AB_TutorialVariant", p3)
end
local v5 = {
	["RemoteConfig"] = "TutorialVariant",
	["Disabled"] = false,
	["DefaultState"] = "Variant4"
}
local v6 = {
	["Variant1"] = {
		["Client"] = v4
	},
	["Variant2"] = {
		["Client"] = v4
	},
	["Variant3"] = {
		["Client"] = v4
	},
	["Variant4"] = {
		["Client"] = v4
	}
}
v5.States = v6
return v5