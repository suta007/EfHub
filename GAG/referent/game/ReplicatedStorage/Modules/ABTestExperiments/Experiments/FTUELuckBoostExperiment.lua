local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v_u_3 = {
	["Variant1"] = 0,
	["Variant2"] = 60,
	["Variant3"] = 120,
	["Variant4"] = 180,
	["Variant5"] = 240,
	["Variant6"] = 300
}
local function v6(p4, p5)
	-- upvalues: (copy) v_u_3
	p4:SetAttribute("AB_FTUELuckBoost", v_u_3[p5] or 0)
end
return {
	["RemoteConfig"] = "FTUELuckBoost",
	["Disabled"] = false,
	["DefaultState"] = v2:IsStudio() and "Variant5" or "Variant1",
	["States"] = {
		["Variant1"] = {
			["Server"] = v6
		},
		["Variant2"] = {
			["Server"] = v6
		},
		["Variant3"] = {
			["Server"] = v6
		},
		["Variant4"] = {
			["Server"] = v6
		},
		["Variant5"] = {
			["Server"] = v6
		},
		["Variant6"] = {
			["Server"] = v6
		}
	}
}