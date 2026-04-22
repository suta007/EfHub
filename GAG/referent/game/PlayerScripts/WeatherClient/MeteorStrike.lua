local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = script.Sky
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_5.AddSkybox(v_u_4, 0)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v_u_7 = game.Lighting.ColorCorrection:Clone()
v_u_7.Name = "ExplosionLight"
v_u_7.Parent = game.Lighting
local v_u_8 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_9 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_10 = require(game.ReplicatedStorage.Data.SoundData)
local v_u_11 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v_u_13 = v_u_8.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
local function v_u_14()
	-- upvalues: (ref) v_u_3, (copy) v_u_13, (copy) v_u_5, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	v_u_3 = true
	v_u_13:Start()
	v_u_5.UpdateSkybox(v_u_4, 2)
	v_u_13:Shake(v_u_8.Presets.Bump)
	game.TweenService:Create(v_u_6, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(255, 233, 197),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	v_u_9:PlaySound(v_u_10.Weather.MeteorStrike.Snap, {
		["Volume"] = 1
	}, nil, workspace, { "LazyLoadSound" })
	v_u_11.Start("MeteorStrike", {
		["priority"] = 12
	})
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	game.TweenService:Create(v_u_6, TweenInfo.new(3), {
		["TintColor"] = Color3.fromRGB(255, 216, 216),
		["Brightness"] = 0.1,
		["Saturation"] = 0.1
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(243, 166, 90),
		["Brightness"] = 1
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	repeat
		task.wait()
	until not workspace:GetAttribute("MeteorStrike")
	v_u_5.UpdateSkybox(v_u_4, 0)
	v_u_13:Shake(v_u_8.Presets.Bump)
	game.TweenService:Create(v_u_6, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(255, 233, 197),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.delay(0.3, function()
		-- upvalues: (ref) v_u_6
		game.TweenService:Create(v_u_6, TweenInfo.new(3), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Brightness"] = 0
		}):Play()
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 70
		}):Play()
	end)
	v_u_9:PlaySound(v_u_10.Weather.MeteorStrike.Snap, {
		["Volume"] = 1
	}, nil, workspace, { "LazyLoadSound" })
	v_u_11.Stop("MeteorStrike")
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2
	}):Play()
end
workspace:GetAttributeChangedSignal("MeteorStrike"):Connect(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_3
	if workspace:GetAttribute("MeteorStrike") then
		v_u_14()
	else
		v_u_3 = false
	end
end)
game.ReplicatedStorage.RainSplash:Clone().Parent = workspace.WeatherVisuals
local v15 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
if workspace:GetAttribute("MeteorStrike") then
	task.defer(v_u_14)
else
	v_u_3 = false
end
local function v_u_42(p16, p17)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_13, (copy) v_u_7
	local v18 = math.random(0, 360)
	local v19 = math.rad(v18)
	local v20 = math.cos(v19)
	local v21 = math.sin(v19)
	local v22 = Vector3.new(v20, 0, v21)
	local v23 = math.random(300, 500)
	local v24 = math.random(400, 500)
	local v25 = p16 + (v22 * v23 + Vector3.new(0, v24, 0))
	local v26 = p17 or p16
	local v27 = game.ReplicatedStorage.Assets.Meteor:Clone()
	v27.CFrame = CFrame.new(v25, p16)
	v27.Parent = workspace.WeatherVisuals
	local v28 = (v26 - v25).Magnitude / 200
	local v29 = 0
	local v30 = false
	while v29 < v28 do
		local v31 = task.wait()
		v29 = v29 + v31
		local v32 = v27.Position
		if p17 and (not v30 and (v26 - v32).Magnitude <= 60) then
			p16 = v26
			v30 = true
		end
		local v33 = v32 + (p16 - v32).Unit * 200 * v31
		v27.CFrame = CFrame.new(v33, p16)
	end
	for _, v34 in v27:GetDescendants() do
		if v34:IsA("Trail") or v34:IsA("ParticleEmitter") then
			v34.Enabled = false
		end
	end
	v27.Transparency = 1
	local v35 = game.ReplicatedStorage.Assets.MeteorSite:Clone()
	v35.CFrame = CFrame.new(v26)
	v35.Parent = workspace
	for _, v36 in pairs(v35:GetDescendants()) do
		if v36:IsA("ParticleEmitter") then
			v36:Emit(v36:GetAttribute("EmitCount"))
		end
	end
	v_u_9:PlaySound(v_u_10.Weather.MeteorShower.Landed, nil, nil, v35.Attachment)
	local v37 = (workspace.CurrentCamera.CFrame.Position - v26).Magnitude - 5
	local v38 = 1 - math.max(0, v37) / 300
	local v39 = math.clamp(v38, 0, 1)
	v_u_13:ShakeOnce(v39 * 6, v39 * 12, 0, 1.5)
	local v_u_40 = game.TweenService:Create(game.Lighting.Explosion, TweenInfo.new(0.2), {
		["FarIntensity"] = v39 * 0.589,
		["FocusDistance"] = v39 * 123.22,
		["InFocusRadius"] = 0,
		["NearIntensity"] = v39 * 0.152
	})
	local v_u_41 = game.TweenService:Create(game.Lighting.ExplosionLight, TweenInfo.new(0.2), {
		["Brightness"] = v39 * 0.4,
		["Saturation"] = v39 * 0.2,
		["TintColor"] = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 157, 0), v39)
	})
	v_u_40:Play()
	v_u_41:Play()
	task.delay(0.2, function()
		-- upvalues: (ref) v_u_40, (ref) v_u_41, (ref) v_u_7
		v_u_40 = game.TweenService:Create(game.Lighting.Explosion, TweenInfo.new(0.3), {
			["FarIntensity"] = 0,
			["FocusDistance"] = 0,
			["InFocusRadius"] = 0,
			["NearIntensity"] = 0
		})
		v_u_41 = game.TweenService:Create(v_u_7, TweenInfo.new(0.3), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		})
		v_u_40:Play()
		v_u_41:Play()
	end)
	game.TweenService:Create(v35.SurfaceGui.ImageLabel, TweenInfo.new(3), {
		["ImageTransparency"] = 1
	}):Play()
	game.Debris:AddItem(v35, 2)
	game.Debris:AddItem(v27, 4)
end
v15.MeteorStrike.OnClientEvent:Connect(function(p43, p44)
	-- upvalues: (copy) v_u_42
	v_u_42(p43, p44)
end)
return v1