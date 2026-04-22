local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("Debris")
local v_u_7 = workspace.CurrentCamera
local v_u_8 = require(v2.Code:WaitForChild("Windlines"))
local v_u_9 = require(v2.Modules.SkyboxManager)
local v_u_10 = script.DuskSky
v_u_9.AddSkybox(v_u_10)
local v_u_11 = v_u_5.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = v_u_5
local v_u_12 = workspace.Terrain.Clouds
local v_u_13 = {
	["Lightning"] = {
		["Ambient"] = Color3.fromRGB(69, 21, 191),
		["Brightness"] = 2,
		["OutdoorAmbient"] = Color3.fromRGB(72, 70, 128),
		["ClockTime"] = 18
	},
	["ColorCorrection"] = {
		["Brightness"] = 0,
		["Saturation"] = 0,
		["Contrast"] = 0,
		["TintColor"] = Color3.fromRGB(221, 215, 255)
	},
	["Atmosphere"] = {
		["Density"] = 0.593,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(69, 44, 255),
		["Decay"] = Color3.fromRGB(119, 133, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}
}
local v_u_14 = false
local function v_u_17()
	-- upvalues: (ref) v_u_14, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (copy) v_u_13, (copy) v_u_11, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	v_u_14 = true
	v_u_9.UpdateSkybox(v_u_10, 2)
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), v_u_13.Atmosphere):Play()
	v_u_3:Create(v_u_11, TweenInfo.new(3), v_u_13.ColorCorrection):Play()
	v_u_3:Create(game.Lighting, TweenInfo.new(3), v_u_13.Lightning):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(218, 168, 133)
	}):Play()
	v_u_3:Create(v_u_12, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0,
		["Color"] = Color3.fromRGB(43, 49, 54)
	}):Play()
	v_u_8:Init({
		["Direction"] = Vector3.new(0, 0, 1),
		["Speed"] = 10,
		["Lifetime"] = 10,
		["SpawnRate"] = 30,
		["Color"] = Color3.fromRGB(255, 255, 255)
	})
	local v_u_15 = script.Stars:Clone()
	v_u_15.Parent = v_u_7
	local v16 = v_u_4.RenderStepped:Connect(function()
		-- upvalues: (copy) v_u_15, (ref) v_u_7
		v_u_15.Position = v_u_7.CFrame.Position
	end)
	while v_u_14 do
		task.wait(0.5)
	end
	if v16 then
		v16:Disconnect()
	end
	v_u_6:AddItem(v_u_15, 3)
	v_u_15.Stars.Enabled = false
	v_u_3:Create(v_u_5, TweenInfo.new(3), {
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
	v_u_3:Create(v_u_11, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_12, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_8:Cleanup()
	task.delay(0.5, v_u_9.UpdateSkybox, v_u_10, 0)
end
workspace:GetAttributeChangedSignal("SafariDusk"):Connect(function()
	-- upvalues: (copy) v_u_17, (ref) v_u_14
	if workspace:GetAttribute("SafariDusk") then
		v_u_17()
	else
		v_u_14 = false
	end
end)
if workspace:GetAttribute("SafariDusk") then
	task.defer(v_u_17)
else
	v_u_14 = false
end
return v1