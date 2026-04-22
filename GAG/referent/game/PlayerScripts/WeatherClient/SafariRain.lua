local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = game:GetService("TweenService")
local _ = game.Lighting
local v_u_5 = workspace.Terrain.Clouds
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v_u_7 = require(game.ReplicatedStorage.Modules.Trove)
local v_u_8 = script.Sky
local v_u_9 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_9.AddSkybox(v_u_8)
local function v_u_13()
	-- upvalues: (ref) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	v_u_3 = true
	local v10 = v_u_7.new()
	v_u_9.UpdateSkybox(v_u_8, 2)
	local v_u_11 = v10:Add(script.Safari_Grass:Clone())
	v_u_11.Parent = game.Workspace.WeatherVisuals
	task.spawn(function()
		-- upvalues: (copy) v_u_11, (ref) v_u_4
		for _, v12 in v_u_11:GetDescendants() do
			if v12:IsA("Decal") then
				v_u_4:Create(v12, TweenInfo.new(3), {
					["Transparency"] = 0.5
				}):Play()
			end
		end
	end)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["ExposureCompensation"] = 0,
		["Brightness"] = 2,
		["ClockTime"] = 14
	}):Play()
	game.TweenService:Create(v_u_6, TweenInfo.new(3), {
		["Brightness"] = 0.05,
		["Contrast"] = 0,
		["TintColor"] = Color3.fromRGB(255, 247, 185),
		["Saturation"] = 0.1
	}):Play()
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.769,
		["Density"] = 1
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Offset"] = 0.3,
		["Density"] = 0.25
	}):Play()
	v10:Add(script.Rain_Effect:Clone()).Parent = game.Workspace.WeatherVisuals
	v_u_4:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(218, 168, 133)
	}):Play()
	repeat
		task.wait()
	until v_u_3 == false
	v10:Destroy()
	v_u_9.UpdateSkybox(v_u_8, 0)
	v_u_4:Create(game.Lighting, TweenInfo.new(3), {
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
	v_u_4:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_4:Create(v_u_6, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_4:Create(v_u_5, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_4:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
end
workspace:GetAttributeChangedSignal("SafariRain"):Connect(function()
	-- upvalues: (copy) v_u_13, (ref) v_u_3
	if workspace:GetAttribute("SafariRain") then
		v_u_13()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("SafariRain") then
	task.defer(v_u_13)
else
	v_u_3 = false
end
return v1