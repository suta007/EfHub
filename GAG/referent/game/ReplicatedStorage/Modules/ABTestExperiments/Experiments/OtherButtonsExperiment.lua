local v1 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
game:GetService("GuiService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v2 = {
	["RemoteConfig"] = "OtherButtons",
	["Disabled"] = false,
	["DefaultState"] = false
}
local v5 = {
	["Variant"] = {
		["Server"] = function(p3, p4)
			print(p3, p4)
			p3:SetAttribute("OtherButtons", true)
		end
	}
}
v2.States = v5
return v2