local v1 = {}
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("Lighting")
local v4 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
require(v4.Modules.MutationHandler)
require(v4.Modules.CreateTagHandler)
local v5 = require(v4.Modules.Settings.SettingsService)
local v_u_6 = v2.LocalPlayer
local function v_u_8()
	-- upvalues: (copy) v_u_3
	for _, v7 in v_u_3:GetDescendants() do
		if v7.Name ~= "Atmosphere" and (v7.Name ~= "Blur" and (v7.Name ~= "Cutscene" and (v7.Name ~= "LoadingBlur" and (v7.Name ~= "NightColor" and not v7:IsA("Folder"))))) then
			if not v7:IsA("Sky") then
				v7.Enabled = false
			end
		end
	end
end
v_u_6:GetAttributeChangedSignal("PerformanceMode"):Connect(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	if v_u_6:GetAttribute("PerformanceMode") then
		v_u_8()
	end
end)
if v5:GetSetting("PerformanceMode") then
	task.defer(v_u_8)
end
return v1