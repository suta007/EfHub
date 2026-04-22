local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
game:GetService("Debris")
local v_u_5 = require(v2.Modules.SkyboxManager)
local v_u_6 = script.Sky
v_u_5.AddSkybox(v_u_6)
local v_u_7 = require(v2.Code:WaitForChild("Windlines"))
local v_u_8 = v_u_4.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = v_u_4
local v_u_9 = workspace.Terrain.Clouds
local v_u_10 = false
local function v_u_12()
	-- upvalues: (ref) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7
	v_u_10 = true
	v_u_5.UpdateSkybox(v_u_6, 2)
	v_u_3:Create(v_u_4, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(70, 70, 70),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 153, 153),
		["ColorShift_Top"] = Color3.fromRGB(167, 255, 161),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0.2,
		["GeographicLatitude"] = 80,
		["OutdoorAmbient"] = Color3.fromRGB(172, 172, 172),
		["ShadowSoftness"] = 0.75
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.419,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(83, 255, 89),
		["Decay"] = Color3.fromRGB(255, 255, 255),
		["Glare"] = 0,
		["Haze"] = 10
	}):Play()
	v_u_3:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 208, 242)
	}):Play()
	v_u_3:Create(v_u_9, TweenInfo.new(3), {
		["Cover"] = 0.742,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(23, 139, 31)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(137, 168, 105)
	}):Play()
	v_u_7:Init({
		["Direction"] = Vector3.new(0.5, 0, 0),
		["Speed"] = 40,
		["Lifetime"] = 10,
		["SpawnRate"] = 30,
		["Color"] = Color3.fromRGB(0, 255, 30)
	})
	local v11 = script.Acid_Rain:Clone()
	v11.Parent = game.Workspace
	while v_u_10 do
		task.wait(0.5)
	end
	v_u_3:Create(v_u_4, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0,
		["GeographicLatitude"] = 29.475,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_3:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_9, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_7:Cleanup()
	v11:Destroy()
	task.delay(0.5, v_u_5.UpdateSkybox, v_u_6, 0)
end
workspace:GetAttributeChangedSignal("AcidRain"):Connect(function()
	-- upvalues: (copy) v_u_12, (ref) v_u_10
	if workspace:GetAttribute("AcidRain") then
		v_u_12()
	else
		v_u_10 = false
	end
end)
if workspace:GetAttribute("AcidRain") then
	task.defer(v_u_12)
else
	v_u_10 = false
end
return v1