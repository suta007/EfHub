local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_5 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v_u_8 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p7)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p7
end)
local function v_u_9()
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	v_u_2 = true
	v_u_8:Start()
	tick()
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_5, (ref) v_u_6
		v_u_8:Shake(v_u_5.Presets.Explosion)
		game.TweenService:Create(v_u_6, TweenInfo.new(0.3), {
			["TintColor"] = Color3.fromRGB(255, 219, 201),
			["Brightness"] = 0.5
		}):Play()
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 90
		}):Play()
		task.wait(0.3)
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 70
		}):Play()
		game.TweenService:Create(v_u_6, TweenInfo.new(3), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Brightness"] = 0
		}):Play()
	end);
	(workspace:FindFirstChild("BW_JANDEL") or workspace.Visuals:WaitForChild("jandel")):GetPivot()
	v_u_4.UpdateSkybox(v_u_3, 0)
	game.TweenService:Create(v_u_6, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0
	}):Play()
	task.delay(3, function()
		game.Workspace.Terrain.Clouds.Enabled = false
	end)
	repeat
		task.wait()
	until v_u_2 == false
end
workspace:GetAttributeChangedSignal("JandelMagician"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_2
	if workspace:GetAttribute("JandelMagician") then
		v_u_9()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("JandelMagician") then
	task.defer(v_u_9)
else
	v_u_2 = false
end
return v1