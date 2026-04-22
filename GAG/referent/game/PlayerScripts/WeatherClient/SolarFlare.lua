local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v_u_5 = require(v2.Code.CameraShaker)
local v_u_6 = require(v2.Modules.SoundPlayer)
local v_u_7 = require(v2.Data.SoundData)
local v_u_8 = nil
local v_u_9 = false
local v_u_11 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
v_u_11:Start()
local function v16()
	-- upvalues: (ref) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_5, (ref) v_u_8
	v_u_9 = true
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_11, (ref) v_u_5, (ref) v_u_8
		v_u_3:Create(v_u_4, TweenInfo.new(27, Enum.EasingStyle.Linear), {
			["TintColor"] = Color3.fromRGB(255, 134, 35)
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(27, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(255, 201, 75),
			["ExposureCompensation"] = 0,
			["Brightness"] = 2.5
		}):Play()
		local v_u_12 = script.FlareUI:Clone()
		v_u_12.Parent = game.Players.LocalPlayer.PlayerGui
		local v_u_13 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Alarm, {
			["Looped"] = true,
			["Volume"] = 0.2
		}, nil, game.SoundService)
		task.delay(2.52, function()
			-- upvalues: (copy) v_u_13
			v_u_13:Destroy()
		end)
		local v_u_14 = script.SolarFlare:Clone()
		v_u_14.Parent = workspace.WeatherVisuals
		v_u_3:Create(v_u_14.Center.BillboardGui.ImageLabel, TweenInfo.new(0.5), {
			["ImageTransparency"] = 0
		}):Play()
		v_u_3:Create(v_u_14.Center.BillboardGui.ImageLabel, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
			["Rotation"] = 359
		}):Play()
		task.spawn(function()
			-- upvalues: (copy) v_u_14, (copy) v_u_12
			repeat
				task.wait(0.5)
				v_u_14.Center.Ground:Emit(1)
				v_u_12.TextLabel.Visible = v_u_12.TextLabel.Visible == false
			until not v_u_14:FindFirstChild("Model")
			v_u_12.TextLabel.Visible = false
		end)
		v_u_3:Create(v_u_14.Center.BillboardGui.ImageLabel, TweenInfo.new(15), {
			["ImageColor3"] = Color3.fromRGB(255, 173, 102)
		}):Play()
		v_u_3:Create(v_u_14.Center.BillboardGui, TweenInfo.new(15), {
			["Brightness"] = 4
		}):Play()
		v_u_3:Create(v_u_14.Center, TweenInfo.new(15, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["CFrame"] = CFrame.new(Vector3.new(-123, -111, 0)) * v_u_14.Center.CFrame.Rotation
		}):Play()
		task.delay(4, function()
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_11, (ref) v_u_5
			v_u_3:Create(v_u_4, TweenInfo.new(10), {
				["TintColor"] = Color3.fromRGB(255, 193, 169),
				["Brightness"] = 0.05,
				["Saturation"] = 0.1
			}):Play()
			v_u_11:ShakeSustain(v_u_5.Presets.Earthquake, 4)
		end)
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(15), {
			["Glare"] = 0.2,
			["Haze"] = 2.3,
			["Color"] = Color3.fromRGB(255, 157, 38),
			["Decay"] = Color3.fromRGB(255, 161, 130)
		}):Play()
		v_u_8 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Loop, {
			["Looped"] = true,
			["Volume"] = 2
		}, nil, v_u_14.Center, { "LazyLoadSound" })
		task.wait(13)
		v_u_3:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(255, 129, 25),
			["ExposureCompensation"] = 1.2,
			["Brightness"] = 3
		}):Play()
		task.wait(1)
		v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Pre, {
			["PlaybackSpeed"] = 0.8,
			["Volume"] = 8
		}, nil, v_u_14.Center)
		v_u_3:Create(v_u_12.Frame, TweenInfo.new(1, Enum.EasingStyle.Linear), {
			["BackgroundTransparency"] = 0
		}):Play()
		task.wait(1)
		v_u_3:Create(v_u_12.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["BackgroundTransparency"] = 1
		}):Play()
		v_u_11:Shake(v_u_5.Presets.Explosion)
		v_u_14.Ball.Transparency = -2
		v_u_3:Create(v_u_14.Ball, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["Size"] = Vector3.new(200, 1500, 200),
			["Transparency"] = 1
		}):Play()
		v_u_14.Center.BillboardGui.Enabled = false
		v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Explode, {
			["PlaybackSpeed"] = 0.9,
			["Volume"] = 8
		}, nil, v_u_14.End)
		local v15 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Explode2, {
			["Volume"] = 2.5
		}, nil, v_u_14.End)
		script.PitchShiftSoundEffect:Clone().Parent = v15
		v_u_14.End.BigBOOM:Emit(3)
		v_u_14.End.GroundBOOM.Enabled = true
		v_u_14.End.RaysBOOM.Enabled = true
		v_u_8:Stop()
		v_u_14.Center.Ground.Enabled = false
		v_u_14.Center.Rays.Enabled = false
		task.wait(4)
		v_u_3:Create(v_u_4, TweenInfo.new(4), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Saturation"] = 0,
			["Brightness"] = 0,
			["Contrast"] = 0
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
			["Glare"] = 0,
			["Haze"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		v_u_11:StopSustained(4)
		v_u_14.End.GroundBOOM.Enabled = false
		v_u_14.End.RaysBOOM.Enabled = false
		task.wait(2)
		v_u_14:Destroy()
		v_u_12:Destroy()
	end)
end
workspace:GetAttributeChangedSignal("SolarFlareEvent"):Connect(function()
	-- upvalues: (ref) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_5, (ref) v_u_8
	if workspace:GetAttribute("SolarFlareEvent") then
		v_u_9 = true
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_11, (ref) v_u_5, (ref) v_u_8
			v_u_3:Create(v_u_4, TweenInfo.new(27, Enum.EasingStyle.Linear), {
				["TintColor"] = Color3.fromRGB(255, 134, 35)
			}):Play()
			v_u_3:Create(game.Lighting, TweenInfo.new(27, Enum.EasingStyle.Linear), {
				["Ambient"] = Color3.fromRGB(255, 201, 75),
				["ExposureCompensation"] = 0,
				["Brightness"] = 2.5
			}):Play()
			local v_u_17 = script.FlareUI:Clone()
			v_u_17.Parent = game.Players.LocalPlayer.PlayerGui
			local v_u_18 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Alarm, {
				["Looped"] = true,
				["Volume"] = 0.2
			}, nil, game.SoundService)
			task.delay(2.52, function()
				-- upvalues: (copy) v_u_18
				v_u_18:Destroy()
			end)
			local v_u_19 = script.SolarFlare:Clone()
			v_u_19.Parent = workspace.WeatherVisuals
			v_u_3:Create(v_u_19.Center.BillboardGui.ImageLabel, TweenInfo.new(0.5), {
				["ImageTransparency"] = 0
			}):Play()
			v_u_3:Create(v_u_19.Center.BillboardGui.ImageLabel, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
				["Rotation"] = 359
			}):Play()
			task.spawn(function()
				-- upvalues: (copy) v_u_19, (copy) v_u_17
				repeat
					task.wait(0.5)
					v_u_19.Center.Ground:Emit(1)
					v_u_17.TextLabel.Visible = v_u_17.TextLabel.Visible == false
				until not v_u_19:FindFirstChild("Model")
				v_u_17.TextLabel.Visible = false
			end)
			v_u_3:Create(v_u_19.Center.BillboardGui.ImageLabel, TweenInfo.new(15), {
				["ImageColor3"] = Color3.fromRGB(255, 173, 102)
			}):Play()
			v_u_3:Create(v_u_19.Center.BillboardGui, TweenInfo.new(15), {
				["Brightness"] = 4
			}):Play()
			v_u_3:Create(v_u_19.Center, TweenInfo.new(15, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["CFrame"] = CFrame.new(Vector3.new(-123, -111, 0)) * v_u_19.Center.CFrame.Rotation
			}):Play()
			task.delay(4, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_11, (ref) v_u_5
				v_u_3:Create(v_u_4, TweenInfo.new(10), {
					["TintColor"] = Color3.fromRGB(255, 193, 169),
					["Brightness"] = 0.05,
					["Saturation"] = 0.1
				}):Play()
				v_u_11:ShakeSustain(v_u_5.Presets.Earthquake, 4)
			end)
			v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(15), {
				["Glare"] = 0.2,
				["Haze"] = 2.3,
				["Color"] = Color3.fromRGB(255, 157, 38),
				["Decay"] = Color3.fromRGB(255, 161, 130)
			}):Play()
			v_u_8 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Loop, {
				["Looped"] = true,
				["Volume"] = 2
			}, nil, v_u_19.Center, { "LazyLoadSound" })
			task.wait(13)
			v_u_3:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Linear), {
				["Ambient"] = Color3.fromRGB(255, 129, 25),
				["ExposureCompensation"] = 1.2,
				["Brightness"] = 3
			}):Play()
			task.wait(1)
			v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Pre, {
				["PlaybackSpeed"] = 0.8,
				["Volume"] = 8
			}, nil, v_u_19.Center)
			v_u_3:Create(v_u_17.Frame, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				["BackgroundTransparency"] = 0
			}):Play()
			task.wait(1)
			v_u_3:Create(v_u_17.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["BackgroundTransparency"] = 1
			}):Play()
			v_u_11:Shake(v_u_5.Presets.Explosion)
			v_u_19.Ball.Transparency = -2
			v_u_3:Create(v_u_19.Ball, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Size"] = Vector3.new(200, 1500, 200),
				["Transparency"] = 1
			}):Play()
			v_u_19.Center.BillboardGui.Enabled = false
			v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Explode, {
				["PlaybackSpeed"] = 0.9,
				["Volume"] = 8
			}, nil, v_u_19.End)
			local v20 = v_u_6:PlaySound(v_u_7.Weather.SolarFlare.Explode2, {
				["Volume"] = 2.5
			}, nil, v_u_19.End)
			script.PitchShiftSoundEffect:Clone().Parent = v20
			v_u_19.End.BigBOOM:Emit(3)
			v_u_19.End.GroundBOOM.Enabled = true
			v_u_19.End.RaysBOOM.Enabled = true
			v_u_8:Stop()
			v_u_19.Center.Ground.Enabled = false
			v_u_19.Center.Rays.Enabled = false
			task.wait(4)
			v_u_3:Create(v_u_4, TweenInfo.new(4), {
				["TintColor"] = Color3.fromRGB(255, 255, 255),
				["Saturation"] = 0,
				["Brightness"] = 0,
				["Contrast"] = 0
			}):Play()
			v_u_3:Create(game.Lighting, TweenInfo.new(4), {
				["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
				["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
				["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
			}):Play()
			v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
				["Glare"] = 0,
				["Haze"] = 0,
				["Color"] = Color3.fromRGB(215, 244, 255),
				["Decay"] = Color3.fromRGB(190, 238, 255)
			}):Play()
			v_u_11:StopSustained(4)
			v_u_19.End.GroundBOOM.Enabled = false
			v_u_19.End.RaysBOOM.Enabled = false
			task.wait(2)
			v_u_19:Destroy()
			v_u_17:Destroy()
		end)
	else
		v_u_9 = false
	end
end)
if workspace:GetAttribute("SolarFlareEvent") then
	task.defer(v16)
else
	v_u_9 = false
end
return v1