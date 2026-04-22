local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_3 = require(game.ReplicatedStorage.Code.LightningBolt)
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v_u_7 = v_u_2.new(Enum.RenderPriority.Camera.Value, function(p6)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p6
end)
v_u_7:Start()
local v_u_8 = script.Sky
local v_u_9 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_9.AddSkybox(v_u_8)
local v_u_10 = game.Lighting.ColorCorrection:Clone()
v_u_10.Name = script.Name
v_u_10.Parent = game.Lighting
local function v_u_11()
	-- upvalues: (ref) v_u_5, (copy) v_u_7, (copy) v_u_2, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8
	v_u_5 = true
	v_u_7:Shake(v_u_2.Presets.Explosion)
	game.TweenService:Create(v_u_10, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(190, 236, 255),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_9.UpdateSkybox(v_u_8, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {}):Play()
	game.TweenService:Create(v_u_10, TweenInfo.new(2), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 238, 203)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(255, 241, 207)
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.701,
		["Density"] = 0
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_8, (ref) v_u_10
		repeat
			task.wait()
		until not workspace:GetAttribute("JanzenStorm")
		v_u_9.UpdateSkybox(v_u_8, 0)
		game.TweenService:Create(v_u_10, TweenInfo.new(3), {
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
	end)
end
workspace:GetAttributeChangedSignal("JanzenStorm"):Connect(function()
	-- upvalues: (copy) v_u_11, (ref) v_u_5
	if workspace:GetAttribute("JanzenStorm") then
		v_u_11()
	else
		v_u_5 = false
	end
end)
if workspace:GetAttribute("JanzenStorm") then
	task.defer(v_u_11)
else
	v_u_5 = false
end
local function v_u_18(p12, p13)
	-- upvalues: (copy) v_u_3
	local v14 = v_u_3.new(p12, p13, 30)
	v14.Thickness = 1.5
	v14.Color = Color3.fromRGB(139, 205, 255)
	v14.Frequency = 15
	v14.MinThicknessMultiplier = 0.1
	v14.MaxThicknessMultiplier = 1
	task.wait(0.65)
	local v15 = game.ReplicatedStorage.LightningHit:Clone()
	v15.CFrame = CFrame.new(p13.WorldPosition)
	local v16 = workspace:Raycast(v15.CFrame.p, Vector3.new(-0, -50, -0))
	if v16 and v16.Position then
		v15.CFrame = CFrame.new(v16.Position)
	end
	v15.Parent = workspace.WeatherVisuals
	for _, v17 in pairs(v15:GetDescendants()) do
		if v17:IsA("ParticleEmitter") then
			v17:Emit(v17:GetAttribute("EmitCount"))
		elseif v17:IsA("Sound") then
			v17:Play()
		elseif v17:IsA("PointLight") then
			game.TweenService:Create(v17, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	v14:DestroyDissipate(0.7)
	game.Debris:AddItem(v15, 3)
end
local v19 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
v19.LightningBoltWithNoFlash.OnClientEvent:Connect(function(p20)
	-- upvalues: (copy) v_u_18
	local v_u_21 = Instance.new("Attachment")
	local v_u_22 = Instance.new("Attachment")
	v_u_21.Parent = workspace.Terrain
	v_u_22.Parent = workspace.Terrain
	v_u_22.WorldPosition = p20 + Vector3.new(0, 200, 0)
	v_u_21.WorldPosition = p20
	v_u_18(v_u_22, v_u_21)
	task.delay(5, function()
		-- upvalues: (copy) v_u_22, (copy) v_u_21
		v_u_22:Destroy()
		v_u_21:Destroy()
	end)
end)
v19.JandelCharge.OnClientEvent:Connect(function(p23)
	-- upvalues: (copy) v_u_3
	local v24 = p23["Right Arm"].Lightning
	local v25 = p23["Left Arm"].Lightning
	task.wait(0.5)
	local v26 = v_u_3.new(v25, v24, 30)
	v26.Thickness = 30
	v26.Color = Color3.fromRGB(167, 229, 255)
	v26.Frequency = 15
	v26.MinThicknessMultiplier = 0.1
	v26.MaxThicknessMultiplier = 1
	task.wait(0.5)
	v26:DestroyDissipate(0.3)
end)
return v1