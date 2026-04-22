local v1 = {}
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v_u_5 = game.Lighting.Blur:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
local v_u_6 = script.Sky
local v_u_7 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_7.AddSkybox(v_u_6)
local v_u_8 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_9 = script.GAG2
local v_u_11 = v_u_8.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
v_u_11:Start()
local function v_u_50()
	-- upvalues: (ref) v_u_3, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_5
	v_u_3 = true
	task.wait(4)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
		["FieldOfView"] = 60
	}):Play()
	task.wait(0.2)
	local v12 = game.ReplicatedStorage.Assets.ThrusterBeams:Clone()
	v12.Parent = workspace
	for _, v13 in v12:GetChildren() do
		local v14 = v13.A.CFrame
		local v15 = v13.B.CFrame
		v13.B.CFrame = v14
		game.TweenService:Create(v13.B, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			["CFrame"] = v15
		}):Play()
	end
	v_u_11:Shake(v_u_8.Presets.Explosion)
	v_u_11:ShakeSustain(v_u_8.Presets.WeakEarthquake)
	v_u_7.UpdateSkybox(v_u_6, 2)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	game.TweenService:Create(v_u_4, TweenInfo.new(0.2), {
		["Brightness"] = 0.6,
		["Saturation"] = -0.5,
		["Contrast"] = 0.5,
		["TintColor"] = Color3.fromRGB(179, 174, 255)
	}):Play()
	task.delay(0.2, function()
		-- upvalues: (ref) v_u_4
		game.TweenService:Create(v_u_4, TweenInfo.new(0.8), {
			["Saturation"] = -0.5,
			["Brightness"] = 0.3,
			["Contrast"] = 0.5,
			["TintColor"] = Color3.fromRGB(179, 174, 255)
		}):Play()
	end)
	v_u_9.Parent = workspace
	game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
		["ExposureCompensation"] = 1.5,
		["Ambient"] = Color3.fromRGB(183, 0, 255),
		["OutdoorAmbient"] = Color3.fromRGB(72, 16, 128)
	}):Play()
	task.wait(5)
	for _, v16 in v12:GetChildren() do
		local v17 = v16.A.CFrame
		local _ = v16.B.CFrame
		game.TweenService:Create(v16.B, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["CFrame"] = v17
		}):Play()
	end
	game.Debris:AddItem(v12, 1)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_11:StopSustained(1)
	workspace.Gravity = 30
	v_u_11:Shake(v_u_8.Presets.Bump)
	game.TweenService:Create(v_u_4, TweenInfo.new(0.4), {
		["Saturation"] = -0.5
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(0.4), {
		["ExposureCompensation"] = 0.9
	}):Play()
	game.TweenService:Create(v_u_4, TweenInfo.new(0.4), {
		["Saturation"] = 0,
		["Brightness"] = 0,
		["Contrast"] = 0,
		["TintColor"] = Color3.fromRGB(215, 215, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(0.4), {
		["Ambient"] = Color3.fromRGB(198, 106, 255),
		["OutdoorAmbient"] = Color3.fromRGB(245, 166, 255)
	}):Play()
	local v_u_18 = workspace.WeatherVisuals:WaitForChild("InSpace")
	local v_u_19 = v_u_18.Parkour:GetPivot()
	task.spawn(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_19
		local v20 = 0
		while v20 < 0.5 do
			v20 = v20 + game:GetService("RunService").Heartbeat:Wait()
			local v21 = game.TweenService:GetValue(v20 / 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			v_u_18.Parkour:PivotTo(v_u_19:Lerp(v_u_19 * CFrame.new(-133, 0, 0), v21))
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_8, (ref) v_u_7, (ref) v_u_6, (ref) v_u_4, (ref) v_u_9, (ref) v_u_5
		while v_u_3 do
			task.wait(0.25)
		end
		local v22 = {
			["FieldOfView"] = 60
		}
		game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), v22):Play()
		task.wait(0.2)
		local v23 = game.ReplicatedStorage.Assets.ThrusterBeams:Clone()
		v23.Parent = workspace
		for _, v24 in v23:GetChildren() do
			local v25 = v24.A.CFrame
			local v26 = v24.B.CFrame
			v24.B.CFrame = v25
			local v27 = {
				["CFrame"] = v26
			}
			game.TweenService:Create(v24.B, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), v27):Play()
		end
		v_u_11:Shake(v_u_8.Presets.Explosion)
		v_u_11:ShakeSustain(v_u_8.Presets.WeakEarthquake)
		v_u_7.UpdateSkybox(v_u_6, 2)
		local v28 = {
			["FieldOfView"] = 90
		}
		game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.5), v28):Play()
		local v29 = game.TweenService
		local v30 = v_u_4
		local v31 = TweenInfo.new(0.2)
		local v32 = {
			["Brightness"] = 0.6,
			["Saturation"] = -0.5,
			["Contrast"] = 0.5,
			["TintColor"] = Color3.fromRGB(179, 174, 255)
		}
		v29:Create(v30, v31, v32):Play()
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_4
			game.TweenService:Create(v_u_4, TweenInfo.new(0.8), {
				["Saturation"] = -0.5,
				["Brightness"] = 0.3,
				["Contrast"] = 0.5,
				["TintColor"] = Color3.fromRGB(179, 174, 255)
			}):Play()
		end)
		local v33 = game.TweenService
		local v34 = game.Lighting
		local v35 = TweenInfo.new(0.1)
		local v36 = {
			["ExposureCompensation"] = 1.5,
			["Ambient"] = Color3.fromRGB(183, 0, 255),
			["OutdoorAmbient"] = Color3.fromRGB(72, 16, 128)
		}
		v33:Create(v34, v35, v36):Play()
		task.wait(5)
		for _, v37 in v23:GetChildren() do
			local v38 = v37.A.CFrame
			local _ = v37.B.CFrame
			local v39 = {
				["CFrame"] = v38
			}
			game.TweenService:Create(v37.B, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v39):Play()
		end
		local v40 = game.TweenService
		local v41 = v_u_4
		local v42 = TweenInfo.new(0.2)
		local v43 = {
			["Brightness"] = 0.6,
			["Saturation"] = -0.5,
			["Contrast"] = 0.5,
			["TintColor"] = Color3.fromRGB(179, 174, 255)
		}
		v40:Create(v41, v42, v43):Play()
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_4
			game.TweenService:Create(v_u_4, TweenInfo.new(0.8), {
				["Saturation"] = 0,
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		end)
		v_u_9.Parent = script
		game.Debris:AddItem(v23, 1)
		local v44 = {
			["FieldOfView"] = 70
		}
		game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), v44):Play()
		v_u_11:StopSustained(1)
		v_u_7.UpdateSkybox(v_u_6, 0)
		local v45 = {
			["Size"] = 0
		}
		game.TweenService:Create(v_u_5, TweenInfo.new(3), v45):Play()
		local v46 = game.TweenService
		local v47 = game.Lighting
		local v48 = TweenInfo.new(3)
		local v49 = {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}
		v46:Create(v47, v48, v49):Play()
	end)
end
workspace:GetAttributeChangedSignal("SpaceTravelEvent"):Connect(function()
	-- upvalues: (copy) v_u_50, (ref) v_u_3
	if workspace:GetAttribute("SpaceTravelEvent") then
		v_u_50()
	else
		workspace.Gravity = 192.6
		v_u_3 = false
	end
end)
if workspace:GetAttribute("SpaceTravelEvent") then
	task.defer(v_u_50)
else
	v_u_3 = false
end
return v1