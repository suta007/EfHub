local v1 = {}
local v_u_2 = game.Lighting.ColorCorrection:Clone()
v_u_2.Name = script.Name
v_u_2.Parent = game.Lighting
local v_u_3 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_4 = false
local v_u_6 = v_u_3.new(Enum.RenderPriority.Camera.Value, function(p5)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p5
end)
v_u_6:Start()
local v_u_7 = script.Sky
local v_u_8 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v9 = game:GetService("ReplicatedStorage")
local v_u_10 = require(v9.Modules.SoundPlayer)
local v_u_11 = require(v9.Data.SoundData)
v_u_8.AddSkybox(v_u_7, 0)
local function v23()
	-- upvalues: (ref) v_u_4, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	v_u_4 = true
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_10, (ref) v_u_11, (ref) v_u_6, (ref) v_u_3, (ref) v_u_8, (ref) v_u_7, (ref) v_u_4
		game.TweenService:Create(v_u_2, TweenInfo.new(27, Enum.EasingStyle.Linear), {
			["TintColor"] = Color3.fromRGB(255, 134, 35)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(27, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(255, 201, 75),
			["ExposureCompensation"] = 0,
			["Brightness"] = 2.5
		}):Play()
		local v12 = script.FlareUI:Clone()
		v12.Parent = game.Players.LocalPlayer.PlayerGui
		local v_u_13 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Loop"] = false,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 0.5
		}
		local v_u_14 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.FlareUI.alarm, v_u_13, nil, game.SoundService)
		task.delay(1.68, function()
			-- upvalues: (copy) v_u_14, (ref) v_u_10, (ref) v_u_11, (copy) v_u_13
			v_u_14:Destroy()
			local v_u_15 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.FlareUI.alarm, v_u_13, nil, game.SoundService)
			task.delay(0.84, function()
				-- upvalues: (copy) v_u_15
				v_u_15:Destroy()
			end)
		end)
		local v_u_16 = script.Meteor:Clone()
		v_u_16.Parent = workspace.WeatherVisuals
		local v_u_17 = true
		task.spawn(function()
			-- upvalues: (copy) v_u_16, (ref) v_u_10, (ref) v_u_11, (ref) v_u_17
			while true do
				v_u_16.Attachment.Backlines2:Emit(4)
				v_u_16.Attachment.Ring:Emit(4)
				if math.random(1, 2) == 1 then
					local v18 = {
						["PlaybackSpeed"] = 1 + math.random(-25, 25) * 0.01
					}
					v_u_10:PlaySound(v_u_11.Weather.Armageddon.whistle, v18)
				end
				task.wait(0.5)
				if v_u_17 == false then
					return
				end
			end
		end)
		task.delay(4, function()
			-- upvalues: (ref) v_u_2, (ref) v_u_6, (ref) v_u_3
			game.TweenService:Create(v_u_2, TweenInfo.new(10), {
				["TintColor"] = Color3.fromRGB(255, 193, 169),
				["Brightness"] = 0.05,
				["Saturation"] = 0.1
			}):Play()
			v_u_6:ShakeSustain(v_u_3.Presets.Earthquake, 4)
		end)
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(15), {
			["Glare"] = 0.2,
			["Haze"] = 2.3,
			["Color"] = Color3.fromRGB(255, 157, 38),
			["Decay"] = Color3.fromRGB(255, 161, 130)
		}):Play()
		game.TweenService:Create(v_u_16, TweenInfo.new(16, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["Position"] = Vector3.new(-61.726, -170.925, -2.822)
		}):Play()
		local v19 = {
			["RollOffMaxDistance"] = 50000,
			["RollOffMinDistance"] = 100,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Loop"] = true,
			["Volume"] = 2
		}
		local v20 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.Center.loop, v19, nil, v_u_16.Center)
		task.wait(13)
		game.TweenService:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(255, 129, 25),
			["ExposureCompensation"] = 1.2,
			["Brightness"] = 3
		}):Play()
		task.wait(1)
		v_u_17 = false
		v12.TextLabel.Visible = false
		v_u_10:PlaySound(v_u_11.Weather.Armageddon.pre, {
			["PlaybackSpeed"] = 0.8,
			["Volume"] = 10
		}, nil, v_u_16.Center)
		game.TweenService:Create(v12.Frame, TweenInfo.new(1, Enum.EasingStyle.Linear), {
			["BackgroundTransparency"] = 0
		}):Play()
		task.wait(1)
		v_u_8.UpdateSkybox(v_u_7, 2)
		game.TweenService:Create(v12.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["BackgroundTransparency"] = 1
		}):Play()
		v_u_6:Shake(v_u_3.Presets.Explosion)
		v_u_16.Transparency = 1
		game.TweenService:Create(v_u_16.Ball, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["Size"] = Vector3.new(400, 2000, 400),
			["Transparency"] = 1
		}):Play()
		local v21 = {
			["RollOffMaxDistance"] = 50000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Loop"] = false,
			["Volume"] = 5,
			["PlaybackSpeed"] = 0.9
		}
		v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode, v21)
		local v22 = {
			["RollOffMaxDistance"] = 50000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Loop"] = false,
			["Volume"] = 4
		}
		v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode2, v22)
		v_u_16.End.BigBOOM:Emit(3)
		v_u_16.End.GroundBOOM.Enabled = true
		v_u_16.End.RaysBOOM.Enabled = true
		v20:Stop()
		v_u_16.Center.Ground.Enabled = false
		v_u_16.Center.Rays.Enabled = false
		game.ReplicatedStorage.Armageddon.Value = true
		task.wait(4)
		game.TweenService:Create(v_u_2, TweenInfo.new(4), {
			["TintColor"] = Color3.fromRGB(255, 224, 197),
			["Saturation"] = 0.1,
			["Brightness"] = 0,
			["Contrast"] = 0
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = Color3.fromRGB(255, 219, 205),
			["ExposureCompensation"] = 0.5,
			["Brightness"] = 2
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
			["Glare"] = 0,
			["Haze"] = 0,
			["Color"] = Color3.fromRGB(255, 227, 213),
			["Decay"] = Color3.fromRGB(255, 221, 192)
		}):Play()
		v_u_6:StopSustained(4)
		v_u_16.End.GroundBOOM.Enabled = false
		v_u_16.End.RaysBOOM.Enabled = false
		task.wait(2)
		v_u_16:Destroy()
		repeat
			task.wait(0.5)
		until v_u_4 == false
		v12.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		game.TweenService:Create(v12.Frame, TweenInfo.new(2, Enum.EasingStyle.Linear), {
			["BackgroundTransparency"] = 0
		}):Play()
		task.wait(2)
		game.ReplicatedStorage.Armageddon.Value = false
		game.TweenService:Create(v12.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["BackgroundTransparency"] = 1
		}):Play()
		game.TweenService:Create(v_u_2, TweenInfo.new(4), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Saturation"] = 0,
			["Brightness"] = 0,
			["Contrast"] = 0
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
			["Glare"] = 0,
			["Haze"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		v_u_8.UpdateSkybox(v_u_7, 0)
		task.wait(2)
		if v12 then
			v12:Destroy()
		end
	end)
end
workspace:GetAttributeChangedSignal("ArmageddonEvent"):Connect(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	if workspace:GetAttribute("ArmageddonEvent") then
		v_u_4 = true
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_10, (ref) v_u_11, (ref) v_u_6, (ref) v_u_3, (ref) v_u_8, (ref) v_u_7, (ref) v_u_4
			game.TweenService:Create(v_u_2, TweenInfo.new(27, Enum.EasingStyle.Linear), {
				["TintColor"] = Color3.fromRGB(255, 134, 35)
			}):Play()
			game.TweenService:Create(game.Lighting, TweenInfo.new(27, Enum.EasingStyle.Linear), {
				["Ambient"] = Color3.fromRGB(255, 201, 75),
				["ExposureCompensation"] = 0,
				["Brightness"] = 2.5
			}):Play()
			local v24 = script.FlareUI:Clone()
			v24.Parent = game.Players.LocalPlayer.PlayerGui
			local v_u_25 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = false,
				["Volume"] = 0.5,
				["PlaybackSpeed"] = 0.5
			}
			local v_u_26 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.FlareUI.alarm, v_u_25, nil, game.SoundService)
			task.delay(1.68, function()
				-- upvalues: (copy) v_u_26, (ref) v_u_10, (ref) v_u_11, (copy) v_u_25
				v_u_26:Destroy()
				local v_u_27 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.FlareUI.alarm, v_u_25, nil, game.SoundService)
				task.delay(0.84, function()
					-- upvalues: (copy) v_u_27
					v_u_27:Destroy()
				end)
			end)
			local v_u_28 = script.Meteor:Clone()
			v_u_28.Parent = workspace.WeatherVisuals
			local v_u_29 = true
			task.spawn(function()
				-- upvalues: (copy) v_u_28, (ref) v_u_10, (ref) v_u_11, (ref) v_u_29
				while true do
					v_u_28.Attachment.Backlines2:Emit(4)
					v_u_28.Attachment.Ring:Emit(4)
					if math.random(1, 2) == 1 then
						local v30 = {
							["PlaybackSpeed"] = 1 + math.random(-25, 25) * 0.01
						}
						v_u_10:PlaySound(v_u_11.Weather.Armageddon.whistle, v30)
					end
					task.wait(0.5)
					if v_u_29 == false then
						return
					end
				end
			end)
			task.delay(4, function()
				-- upvalues: (ref) v_u_2, (ref) v_u_6, (ref) v_u_3
				game.TweenService:Create(v_u_2, TweenInfo.new(10), {
					["TintColor"] = Color3.fromRGB(255, 193, 169),
					["Brightness"] = 0.05,
					["Saturation"] = 0.1
				}):Play()
				v_u_6:ShakeSustain(v_u_3.Presets.Earthquake, 4)
			end)
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(15), {
				["Glare"] = 0.2,
				["Haze"] = 2.3,
				["Color"] = Color3.fromRGB(255, 157, 38),
				["Decay"] = Color3.fromRGB(255, 161, 130)
			}):Play()
			game.TweenService:Create(v_u_28, TweenInfo.new(16, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["Position"] = Vector3.new(-61.726, -170.925, -2.822)
			}):Play()
			local v31 = {
				["RollOffMaxDistance"] = 50000,
				["RollOffMinDistance"] = 100,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = true,
				["Volume"] = 2
			}
			local v32 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.Center.loop, v31, nil, v_u_28.Center)
			task.wait(13)
			game.TweenService:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Linear), {
				["Ambient"] = Color3.fromRGB(255, 129, 25),
				["ExposureCompensation"] = 1.2,
				["Brightness"] = 3
			}):Play()
			task.wait(1)
			v_u_29 = false
			v24.TextLabel.Visible = false
			v_u_10:PlaySound(v_u_11.Weather.Armageddon.pre, {
				["PlaybackSpeed"] = 0.8,
				["Volume"] = 10
			}, nil, v_u_28.Center)
			game.TweenService:Create(v24.Frame, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				["BackgroundTransparency"] = 0
			}):Play()
			task.wait(1)
			v_u_8.UpdateSkybox(v_u_7, 2)
			game.TweenService:Create(v24.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["BackgroundTransparency"] = 1
			}):Play()
			v_u_6:Shake(v_u_3.Presets.Explosion)
			v_u_28.Transparency = 1
			game.TweenService:Create(v_u_28.Ball, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Size"] = Vector3.new(400, 2000, 400),
				["Transparency"] = 1
			}):Play()
			local v33 = {
				["RollOffMaxDistance"] = 50000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = false,
				["Volume"] = 5,
				["PlaybackSpeed"] = 0.9
			}
			v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode, v33)
			local v34 = {
				["RollOffMaxDistance"] = 50000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = false,
				["Volume"] = 4
			}
			v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode2, v34)
			v_u_28.End.BigBOOM:Emit(3)
			v_u_28.End.GroundBOOM.Enabled = true
			v_u_28.End.RaysBOOM.Enabled = true
			v32:Stop()
			v_u_28.Center.Ground.Enabled = false
			v_u_28.Center.Rays.Enabled = false
			game.ReplicatedStorage.Armageddon.Value = true
			task.wait(4)
			game.TweenService:Create(v_u_2, TweenInfo.new(4), {
				["TintColor"] = Color3.fromRGB(255, 224, 197),
				["Saturation"] = 0.1,
				["Brightness"] = 0,
				["Contrast"] = 0
			}):Play()
			game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
				["Ambient"] = Color3.fromRGB(255, 219, 205),
				["ExposureCompensation"] = 0.5,
				["Brightness"] = 2
			}):Play()
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
				["Glare"] = 0,
				["Haze"] = 0,
				["Color"] = Color3.fromRGB(255, 227, 213),
				["Decay"] = Color3.fromRGB(255, 221, 192)
			}):Play()
			v_u_6:StopSustained(4)
			v_u_28.End.GroundBOOM.Enabled = false
			v_u_28.End.RaysBOOM.Enabled = false
			task.wait(2)
			v_u_28:Destroy()
			repeat
				task.wait(0.5)
			until v_u_4 == false
			v24.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			game.TweenService:Create(v24.Frame, TweenInfo.new(2, Enum.EasingStyle.Linear), {
				["BackgroundTransparency"] = 0
			}):Play()
			task.wait(2)
			game.ReplicatedStorage.Armageddon.Value = false
			game.TweenService:Create(v24.Frame, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["BackgroundTransparency"] = 1
			}):Play()
			game.TweenService:Create(v_u_2, TweenInfo.new(4), {
				["TintColor"] = Color3.fromRGB(255, 255, 255),
				["Saturation"] = 0,
				["Brightness"] = 0,
				["Contrast"] = 0
			}):Play()
			game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
				["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
				["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
				["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
			}):Play()
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
				["Glare"] = 0,
				["Haze"] = 0,
				["Color"] = Color3.fromRGB(215, 244, 255),
				["Decay"] = Color3.fromRGB(190, 238, 255)
			}):Play()
			v_u_8.UpdateSkybox(v_u_7, 0)
			task.wait(2)
			if v24 then
				v24:Destroy()
			end
		end)
	else
		v_u_4 = false
	end
end)
if workspace:GetAttribute("ArmageddonEvent") then
	task.defer(v23)
else
	v_u_4 = false
end
return v1