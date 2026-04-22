local v1 = game:GetService("ReplicatedStorage")
local v2 = {}
local v_u_3 = false
local v_u_4 = script.Sky
local v_u_5 = require(v1.Modules.SkyboxManager)
local v_u_6 = require(v1.Data.SoundData)
local v_u_7 = require(v1.Modules.SoundPlayer)
v_u_5.AddSkybox(v_u_4, 0)
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
local v_u_9 = require(v1.Code.CameraShaker)
local v_u_11 = v_u_9.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
v_u_11:Start()
local function v_u_17()
	-- upvalues: (ref) v_u_3, (copy) v_u_11, (copy) v_u_9, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4
	v_u_3 = true
	local v12 = workspace.Visuals:WaitForChild("sunGod")
	local v13 = v12:GetPivot()
	local v14 = v13 * CFrame.new(0, 190, 0)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["GeographicLatitude"] = 23,
		["ClockTime"] = 17
	}):Play()
	local v15 = 0
	while v15 < 3 do
		v15 = v15 + game:GetService("RunService").Heartbeat:Wait()
		v12:PivotTo(v13:Lerp(v14, (game.TweenService:GetValue(v15 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))))
	end
	v_u_11:Shake(v_u_9.Presets.Explosion)
	game.TweenService:Create(v_u_8, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(255, 227, 89),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_5.UpdateSkybox(v_u_4, 3)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(255, 215, 94),
		["ExposureCompensation"] = 0.425,
		["Brightness"] = 0.7
	}):Play()
	game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(1), {
		["Intensity"] = 0.37,
		["Spread"] = 0.033
	}):Play()
	game.TweenService:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(245, 229, 149)
	}):Play()
	repeat
		task.wait()
	until v_u_3 == false
	v_u_5.UpdateSkybox(v_u_4, 0)
	local v16 = 0
	while v16 < 3 do
		v16 = v16 + game:GetService("RunService").Heartbeat:Wait()
		v12:PivotTo(v14:Lerp(v13, (game.TweenService:GetValue(v16 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))))
	end
	game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(1), {
		["Intensity"] = 0,
		["Spread"] = 0
	}):Play()
	v12:Destroy()
	game.TweenService:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness"),
		["ClockTime"] = 14,
		["GeographicLatitude"] = 29.475
	}):Play()
end
workspace:GetAttributeChangedSignal("SunGod"):Connect(function()
	-- upvalues: (copy) v_u_17, (ref) v_u_3
	if workspace:GetAttribute("SunGod") then
		v_u_17()
	else
		v_u_3 = false
	end
end)
local v_u_18 = require(game.ReplicatedStorage.Code.LightningBolt)
if workspace:GetAttribute("SunGod") then
	task.defer(v_u_17)
else
	v_u_3 = false
end
local function v_u_25(p19, p20)
	-- upvalues: (copy) v_u_18, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v21 = v_u_18.new(p19, p20, 30)
	v21.Thickness = 1.5
	v21.Color = Color3.fromRGB(255, 201, 139)
	v21.Frequency = 15
	v21.MinThicknessMultiplier = 0.1
	v21.MaxThicknessMultiplier = 1
	task.wait(0.65)
	v_u_11:Shake(v_u_11.Presets.Explosion)
	local v22 = game.ReplicatedStorage.SunStrike:Clone()
	v22.CFrame = CFrame.new(p20.WorldPosition)
	local v23 = workspace:Raycast(v22.CFrame.p, Vector3.new(-0, -50, -0))
	if v23 and v23.Position then
		v22.CFrame = CFrame.new(v23.Position)
	end
	v22.Parent = workspace.WeatherVisuals
	v_u_8.Brightness = 0.3
	task.delay(0.1, function()
		-- upvalues: (ref) v_u_8
		v_u_8.Brightness = 0.1
	end)
	for _, v24 in pairs(v22:GetDescendants()) do
		if v24:IsA("ParticleEmitter") then
			v24:Emit(v24:GetAttribute("EmitCount"))
		elseif v24:IsA("PointLight") then
			game.TweenService:Create(v24, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	v_u_7:PlaySound(v_u_6.Weather.SunGod.Flame, {
		["Volume"] = 1
	}, nil, v22)
	v_u_7:PlaySound(v_u_6.Weather.SunGod.LightningStrike, {
		["Volume"] = 1
	}, nil, v22)
	v_u_7:PlaySound(v_u_6.Weather.SunGod.Zap, {
		["Volume"] = 1
	}, nil, v22)
	v21:DestroyDissipate(0.7)
	game.Debris:AddItem(v22, 3)
end
local function v_u_29(p26)
	-- upvalues: (copy) v_u_25
	local v_u_27 = Instance.new("Attachment")
	local v_u_28 = Instance.new("Attachment")
	v_u_27.Parent = workspace.Terrain
	v_u_28.Parent = workspace.Terrain
	v_u_28.WorldPosition = p26 + Vector3.new(0, 200, 0)
	v_u_27.WorldPosition = p26
	task.spawn(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_28, (copy) v_u_27
		v_u_25(v_u_28, v_u_27)
		task.delay(5, function()
			-- upvalues: (ref) v_u_28, (ref) v_u_27
			v_u_28:Destroy()
			v_u_27:Destroy()
		end)
	end)
end
game.ReplicatedStorage.GameEvents.SunResonance.OnClientEvent:Connect(function(p_u_30)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_29
	local v_u_31 = true
	local v_u_32 = p_u_30[1]
	local v33 = v_u_7:PlaySound(v_u_6.Weather.SunGod.Sound, {
		["Looped"] = true
	})
	script.ReverbSoundEffect:Clone().Parent = v33
	task.spawn(function()
		-- upvalues: (ref) v_u_31, (copy) p_u_30, (copy) v_u_32
		while true do
			if not v_u_31 then
				return
			end
			for _, v34 in p_u_30 do
				if not v34 or (not v34:IsDescendantOf(workspace) or (v_u_32:GetPivot().p - v34:GetPivot().p).Magnitude > 32) then
					v_u_31 = false
					break
				end
			end
			task.wait(0.3)
		end
	end)
	local v35 = tick()
	local v36 = game.TweenService:Create(v_u_8, TweenInfo.new(2), {
		["Brightness"] = 0.4,
		["TintColor"] = Color3.fromRGB(245, 216, 102)
	})
	local v37 = game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(1), {
		["FieldOfView"] = 80
	})
	v37:Play()
	v36:Play()
	local v38 = v_u_31
	repeat
		task.wait()
	until tick() - v35 >= 3 or v38 == false
	if v38 then
		print("RESONANCE!")
		if v37.PlaybackState == Enum.PlaybackState.Completed then
			v37:Pause()
			v36:Pause()
		end
		v_u_31 = false
		game.TweenService:Create(v33, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		game.Debris:AddItem(v33, 2)
		game.TweenService:Create(v_u_8, TweenInfo.new(0.4), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.6), {
			["FieldOfView"] = 60
		}):Play()
		local v39 = Vector3.new(0, 0, 0)
		for _, v40 in p_u_30 do
			v39 = v39 + v40:GetPivot().p
		end
		v_u_29(v39 / #p_u_30)
		task.wait(0.6)
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.1), {
			["FieldOfView"] = 60
		}):Play()
		v_u_8.Brightness = 10
		v_u_8.Contrast = 222
		v_u_8.Saturation = -1
		v_u_8.TintColor = Color3.fromRGB(255, 106, 0)
		task.wait(0.05)
		v_u_8.Brightness = 1
		v_u_8.Contrast = 1
		v_u_8.Saturation = 1
		v_u_8.TintColor = Color3.fromRGB(255, 255, 0)
		task.wait(0.05)
		v_u_8.Brightness = 0
		v_u_8.Contrast = -332
		v_u_8.Saturation = 1
		v_u_8.TintColor = Color3.fromRGB(255, 0, 0)
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 85
		}):Play()
		task.wait(0.05)
		v_u_8.Brightness = 0.3
		v_u_8.Contrast = 0
		v_u_8.Saturation = 0
		v_u_8.TintColor = Color3.fromRGB(245, 229, 149)
		task.wait(0.3)
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 70
		}):Play()
		game.TweenService:Create(v_u_8, TweenInfo.new(2), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
	else
		if v37.PlaybackState == Enum.PlaybackState.Completed then
			v37:Pause()
			v36:Pause()
		end
		game.TweenService:Create(v33, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		game.Debris:AddItem(v33, 2)
		game.TweenService:Create(v_u_8, TweenInfo.new(2), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(245, 229, 149)
		}):Play()
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(2), {
			["FieldOfView"] = 70
		}):Play()
	end
end)
game.ReplicatedStorage.GameEvents.SunStrike.OnClientEvent:Connect(function() end)
return v2