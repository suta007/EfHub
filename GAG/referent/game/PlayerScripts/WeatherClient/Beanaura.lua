local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Lighting")
local v_u_3 = game:GetService("TweenService")
local v4 = {}
local v_u_5 = false
local v_u_6 = script.Sky
local v_u_7 = require(v_u_1.Modules.SkyboxManager)
local v_u_8 = require(v_u_1.Data.SoundData)
local v_u_9 = require(v_u_1.Modules.SoundPlayer)
v_u_7.AddSkybox(v_u_6, 0)
local v_u_10 = v_u_2.ColorCorrection:Clone()
v_u_10.Name = script.Name
v_u_10.Parent = v_u_2
local v_u_11 = require(v_u_1.Code.CameraShaker)
local v_u_13 = v_u_11.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
v_u_13:Start()
local function v_u_19()
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_13, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	v_u_5 = true
	local v14 = workspace.Visuals:WaitForChild("sunGod")
	local v15 = v14:GetPivot()
	local v16 = v15 * CFrame.new(0, 190, 0)
	v_u_3:Create(v_u_2, TweenInfo.new(3), {
		["GeographicLatitude"] = 23,
		["ClockTime"] = 17
	}):Play()
	local v17 = 0
	while v17 < 3 do
		v17 = v17 + game:GetService("RunService").Heartbeat:Wait()
		v14:PivotTo(v15:Lerp(v16, (v_u_3:GetValue(v17 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))))
	end
	v_u_13:Shake(v_u_11.Presets.Explosion)
	v_u_3:Create(v_u_10, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(93, 255, 117),
		["Brightness"] = 0.5
	}):Play()
	v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_7.UpdateSkybox(v_u_6, 3)
	v_u_3:Create(v_u_2, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(208, 255, 219),
		["ExposureCompensation"] = 0.425,
		["Brightness"] = 0.7
	}):Play()
	v_u_3:Create(v_u_2.SunRays, TweenInfo.new(1), {
		["Intensity"] = 0.37,
		["Spread"] = 0.033
	}):Play()
	v_u_3:Create(v_u_10, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(193, 245, 202)
	}):Play()
	repeat
		task.wait(0.1)
	until v_u_5 == false
	v_u_7.UpdateSkybox(v_u_6, 0)
	local v18 = 0
	while v18 < 3 do
		v18 = v18 + game:GetService("RunService").Heartbeat:Wait()
		v14:PivotTo(v16:Lerp(v15, (v_u_3:GetValue(v18 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))))
	end
	v_u_3:Create(v_u_2.SunRays, TweenInfo.new(1), {
		["Intensity"] = 0,
		["Spread"] = 0
	}):Play()
	v14:Destroy()
	v_u_3:Create(v_u_10, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_2, TweenInfo.new(3), {
		["Ambient"] = v_u_2:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = v_u_2:GetAttribute("DefaultExposure"),
		["Brightness"] = v_u_2:GetAttribute("DefaultBrightness"),
		["ClockTime"] = 14,
		["GeographicLatitude"] = 29.475
	}):Play()
end
workspace:GetAttributeChangedSignal("Beanaura"):Connect(function()
	-- upvalues: (copy) v_u_19, (ref) v_u_5
	if workspace:GetAttribute("Beanaura") == true then
		v_u_19()
	else
		v_u_5 = false
	end
end)
local v_u_20 = require(v_u_1.Code.LightningBolt)
if workspace:GetAttribute("Beanaura") then
	task.defer(v_u_19)
else
	v_u_5 = false
end
local function v_u_27(p21, p22)
	-- upvalues: (copy) v_u_20, (copy) v_u_13, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8
	local v23 = v_u_20.new(p21, p22, 30)
	v23.Thickness = 1.5
	v23.Color = Color3.fromRGB(255, 201, 139)
	v23.Frequency = 15
	v23.MinThicknessMultiplier = 0.1
	v23.MaxThicknessMultiplier = 1
	task.wait(0.65)
	v_u_13:Shake(v_u_13.Presets.Explosion)
	local v24 = v_u_1.BeanStrike:Clone()
	v24.CFrame = CFrame.new(p22.WorldPosition)
	local v25 = workspace:Raycast(v24.CFrame.p, Vector3.new(-0, -50, -0))
	if v25 and v25.Position then
		v24.CFrame = CFrame.new(v25.Position)
	end
	v24.Parent = workspace.WeatherVisuals
	v_u_10.Brightness = 0.3
	task.delay(0.1, function()
		-- upvalues: (ref) v_u_10
		v_u_10.Brightness = 0.1
	end)
	for _, v26 in pairs(v24:GetDescendants()) do
		if v26:IsA("ParticleEmitter") then
			v26:Emit(v26:GetAttribute("EmitCount"))
		elseif v26:IsA("PointLight") then
			v_u_3:Create(v26, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	v_u_9:PlaySound(v_u_8.Weather.Beanaura.Flame, {
		["Volume"] = 1
	}, nil, v24)
	v_u_9:PlaySound(v_u_8.Weather.Beanaura.LightningStrike, {
		["Volume"] = 1
	}, nil, v24)
	v_u_9:PlaySound(v_u_8.Weather.Beanaura.Zap, {
		["Volume"] = 1
	}, nil, v24)
	v23:DestroyDissipate(0.7)
	game.Debris:AddItem(v24, 3)
end
local function v_u_31(p28)
	-- upvalues: (copy) v_u_27
	local v_u_29 = Instance.new("Attachment")
	local v_u_30 = Instance.new("Attachment")
	v_u_29.Parent = workspace.Terrain
	v_u_30.Parent = workspace.Terrain
	v_u_30.WorldPosition = p28 + Vector3.new(0, 200, 0)
	v_u_29.WorldPosition = p28
	task.spawn(function()
		-- upvalues: (ref) v_u_27, (copy) v_u_30, (copy) v_u_29
		v_u_27(v_u_30, v_u_29)
		task.delay(5, function()
			-- upvalues: (ref) v_u_30, (ref) v_u_29
			v_u_30:Destroy()
			v_u_29:Destroy()
		end)
	end)
end
v_u_1.GameEvents.BeanResonance.OnClientEvent:Connect(function(p_u_32)
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_10, (copy) v_u_31
	local v_u_33 = true
	local v_u_34 = p_u_32[1]
	local v35 = v_u_9:PlaySound(v_u_8.Weather.Beanaura.Sound, {
		["Looped"] = true
	})
	script.ReverbSoundEffect:Clone().Parent = v35
	task.spawn(function()
		-- upvalues: (ref) v_u_33, (copy) p_u_32, (copy) v_u_34
		while true do
			if not v_u_33 then
				return
			end
			for _, v36 in p_u_32 do
				if not v36 or (not v36:IsDescendantOf(workspace) or (v_u_34:GetPivot().p - v36:GetPivot().p).Magnitude > 32) then
					v_u_33 = false
					break
				end
			end
			task.wait(0.3)
		end
	end)
	local v37 = tick()
	local v38 = v_u_3:Create(v_u_10, TweenInfo.new(2), {
		["Brightness"] = 0.4,
		["TintColor"] = Color3.fromRGB(245, 216, 102)
	})
	local v39 = v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(1), {
		["FieldOfView"] = 80
	})
	v39:Play()
	v38:Play()
	local v40 = v_u_33
	repeat
		task.wait()
	until tick() - v37 >= 3 or v40 == false
	if v40 then
		if v39.PlaybackState == Enum.PlaybackState.Completed then
			v39:Pause()
			v38:Pause()
		end
		v_u_33 = false
		v_u_3:Create(v35, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		game.Debris:AddItem(v35, 2)
		v_u_3:Create(v_u_10, TweenInfo.new(0.4), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
		v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.6), {
			["FieldOfView"] = 60
		}):Play()
		local v41 = Vector3.new(0, 0, 0)
		for _, v42 in p_u_32 do
			v41 = v41 + v42:GetPivot().p
		end
		v_u_31(v41 / #p_u_32)
		task.wait(0.6)
		v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.1), {
			["FieldOfView"] = 60
		}):Play()
		v_u_10.Brightness = 10
		v_u_10.Contrast = 222
		v_u_10.Saturation = -1
		v_u_10.TintColor = Color3.fromRGB(255, 106, 0)
		task.wait(0.05)
		v_u_10.Brightness = 1
		v_u_10.Contrast = 1
		v_u_10.Saturation = 1
		v_u_10.TintColor = Color3.fromRGB(255, 255, 0)
		task.wait(0.05)
		v_u_10.Brightness = 0
		v_u_10.Contrast = -332
		v_u_10.Saturation = 1
		v_u_10.TintColor = Color3.fromRGB(255, 0, 0)
		v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 85
		}):Play()
		task.wait(0.05)
		v_u_10.Brightness = 0.3
		v_u_10.Contrast = 0
		v_u_10.Saturation = 0
		v_u_10.TintColor = Color3.fromRGB(245, 229, 149)
		task.wait(0.3)
		v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 70
		}):Play()
		v_u_3:Create(v_u_10, TweenInfo.new(2), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
	else
		if v39.PlaybackState == Enum.PlaybackState.Completed then
			v39:Pause()
			v38:Pause()
		end
		v_u_3:Create(v35, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		game.Debris:AddItem(v35, 2)
		v_u_3:Create(v_u_10, TweenInfo.new(2), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
		v_u_3:Create(game.Workspace.CurrentCamera, TweenInfo.new(2), {
			["FieldOfView"] = 70
		}):Play()
	end
end)
return v4