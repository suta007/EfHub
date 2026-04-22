local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local _ = v_u_2.SnowParticle
Random.new()
local _ = workspace.CurrentCamera
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v7 = script.Sky
require(v_u_2.Code.BodyShaker)
local v8 = require(v_u_2.Modules.SkyboxManager)
require(v_u_2.Modules.SoundPlayer)
require(v_u_2.Data.SoundData)
v8.AddSkybox(v7)
local v_u_9 = require(v_u_2.Code.CameraShaker)
local v_u_11 = v_u_9.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
local function v_u_14()
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_9, (copy) v_u_2
	v_u_5 = true
	game.Lighting.Atmosphere.Color = Color3.fromRGB(253, 208, 129)
	game.Lighting.Atmosphere.Decay = Color3.fromRGB(253, 208, 129)
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(7), {
		["Density"] = 0.277,
		["Haze"] = 9.4,
		["Glare"] = 1.43
	}):Play()
	v_u_3:Create(v_u_6, TweenInfo.new(4), {
		["Brightness"] = 0.1,
		["Contrast"] = -0.1,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 241, 205)
	}):Play()
	v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(7), {
		["Intensity"] = 0
	}):Play()
	v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(7), {
		["Color"] = Color3.fromRGB(199, 172, 120)
	}):Play()
	v_u_11:Start()
	v_u_11:ShakeSustain(v_u_9.Presets.WeakEarthquake)
	local v12 = v_u_2.Assets.SandStormEffect:Clone()
	v12.Parent = workspace
	repeat
		task.wait()
	until v_u_5 == false
	for _, v13 in v12:GetChildren() do
		v13.Enabled = false
	end
	v_u_11:StopSustained(2)
	game.Debris:AddItem(v12, 4)
	v_u_3:Create(v_u_6, TweenInfo.new(1), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0
	}):Play()
	v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(7), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_3:Create(v_u_6, TweenInfo.new(4), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(15), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
end
workspace:GetAttributeChangedSignal("Sandstorm"):Connect(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_5
	if workspace:GetAttribute("Sandstorm") then
		v_u_14()
	else
		v_u_5 = false
	end
end)
if workspace:GetAttribute("Sandstorm") then
	task.defer(v_u_14)
else
	v_u_5 = false
end
return v1