local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_3 = script:WaitForChild("Campfire_Sky")
v_u_2.AddSkybox(v_u_3, 0)
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v_u_6 = game:GetService("TweenService")
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = game:GetService("SoundService")
local _ = game.Lighting
local v_u_9 = workspace.Terrain.Clouds
local v_u_10 = game.Lighting.ColorCorrection:Clone()
v_u_10.Name = script.Name
v_u_10.Parent = game.Lighting
local v_u_11 = require(game.ReplicatedStorage.Modules.Trove)
local v_u_12 = require(v7.Modules.Spring)
local v_u_13 = require(script.ShootingStars)
local v_u_14 = require(v7.Modules.SoundPlayer)
local v_u_15 = require(v7.Data.SoundData)
local function v_u_19()
	-- upvalues: (ref) v_u_5, (copy) v_u_11, (copy) v_u_2, (copy) v_u_3, (copy) v_u_14, (copy) v_u_15, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13
	v_u_5 = true
	local v16 = v_u_11.new()
	v_u_2.UpdateSkybox(v_u_3, 2)
	local v_u_17 = v16:Add(script.Safari_Grass:Clone())
	v_u_17.Parent = game.Workspace.WeatherVisuals
	v16:Add(v_u_14:PlaySound(v_u_15.Weather.SafariNight.SafariKey, {
		["SoundGroup"] = v_u_8.Music.SFX,
		["Volume"] = 1
	}, nil, v_u_8))
	task.spawn(function()
		-- upvalues: (copy) v_u_17, (ref) v_u_6
		for _, v18 in v_u_17:GetDescendants() do
			if v18:IsA("Decal") then
				v_u_6:Create(v18, TweenInfo.new(3), {
					["Transparency"] = 0.5
				}):Play()
			end
		end
	end)
	v_u_6:Create(v_u_9, TweenInfo.new(3), {
		["Cover"] = 0.628,
		["Density"] = 0.163,
		["Color"] = Color3.fromRGB(255, 165, 62)
	}):Play()
	v_u_12.stop(game.Workspace.BasePlate.TopBaseplate)
	v_u_12.target(game.Workspace.BasePlate.TopBaseplate, 1, 4, {
		["Color"] = Color3.fromRGB(176, 159, 95)
	})
	v_u_2.UpdateSkybox(v_u_3, 20)
	v_u_12.target(game.Lighting, 0.9, 3, {
		["Ambient"] = Color3.fromRGB(70, 70, 70),
		["Brightness"] = 1,
		["ClockTime"] = 4.358,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 102, 0),
		["ColorShift_Top"] = Color3.fromRGB(255, 223, 158),
		["EnvironmentDiffuseScale"] = 1,
		["EnvironmentSpecularScale"] = 0.25,
		["ExposureCompensation"] = 1,
		["GeographicLatitude"] = 37.866,
		["OutdoorAmbient"] = Color3.fromRGB(172, 172, 172)
	})
	v_u_12.target(game.Lighting.Atmosphere, 0.9, 3, {
		["Density"] = 0.306,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(255, 162, 85),
		["Decay"] = Color3.fromRGB(255, 255, 255),
		["Glare"] = 0.32,
		["Haze"] = 1.7
	})
	v_u_12.target(v_u_10, 0.9, 3, {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.15,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	})
	v_u_13:Init({
		["Direction"] = Vector3.new(-1, 0, 1),
		["Height"] = 700,
		["Interval"] = NumberRange.new(0.5, 1.5),
		["Radius"] = 3000,
		["Speed"] = NumberRange.new(50, 100)
	})
	repeat
		task.wait()
	until v_u_5 == false
	v16:Destroy()
	v_u_2.UpdateSkybox(v_u_3, 0)
	v_u_6:Create(game.Lighting, TweenInfo.new(3), {
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
	v_u_6:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_6:Create(v_u_10, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_6:Create(v_u_9, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_6:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_13:Cleanup()
end
workspace:GetAttributeChangedSignal("SafariNight"):Connect(function()
	-- upvalues: (copy) v_u_19, (ref) v_u_5
	if workspace:GetAttribute("SafariNight") then
		v_u_19()
	else
		v_u_5 = false
	end
end)
if workspace:GetAttribute("SafariNight") then
	task.defer(v_u_19)
else
	v_u_5 = false
end
return v1