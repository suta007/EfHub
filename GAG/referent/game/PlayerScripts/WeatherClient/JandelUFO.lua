local v1 = {}
local v_u_2 = false
local v3 = game.Lighting.ColorCorrection:Clone()
v3.Name = script.Name
v3.Parent = game.Lighting
local v_u_4 = script.Sky
require(game.ReplicatedStorage.Field_Of_View_Module)
require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_5.AddSkybox(v_u_4)
require(game.ReplicatedStorage.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p6)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p6
end)
local function v_u_7()
	-- upvalues: (ref) v_u_2, (copy) v_u_5, (copy) v_u_4
	v_u_2 = true
	v_u_5.UpdateSkybox(v_u_4, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
		["Ambient"] = Color3.fromRGB(94, 0, 131),
		["Brightness"] = 1,
		["OutdoorAmbient"] = Color3.fromRGB(81, 81, 81),
		["ExposureCompensation"] = 1,
		["GeographicLatitude"] = 80
	}):Play()
	game.Lighting.Atmosphere.Color = Color3.fromRGB(0, 0, 0)
	game.Lighting.Atmosphere.Decay = Color3.fromRGB(255, 255, 255)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0,
		["Haze"] = 0,
		["Glare"] = 0.32
	}):Play()
	print(v_u_2)
	game.TweenService:Create(game.SoundService.Music.Tunes.Music, TweenInfo.new(2), {
		["Volume"] = 0
	}):Play()
	repeat
		task.wait()
	until v_u_2 == false
	game.TweenService:Create(game.SoundService.Music.Tunes.Music, TweenInfo.new(2), {
		["Volume"] = 1
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ShadowSoftness"] = 0.025,
		["ExposureCompensation"] = 0,
		["GeographicLatitude"] = 29.475
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_5.UpdateSkybox(v_u_4, 0)
end
workspace:GetAttributeChangedSignal("JandelUFO"):Connect(function()
	-- upvalues: (copy) v_u_7, (ref) v_u_2
	if workspace:GetAttribute("JandelUFO") then
		v_u_7()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("JandelUFO") then
	task.defer(v_u_7)
else
	v_u_2 = false
end
return v1