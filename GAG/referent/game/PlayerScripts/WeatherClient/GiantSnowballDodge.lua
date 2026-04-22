local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = false
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("Players")
local v_u_6 = v_u_5.LocalPlayer
local v_u_7 = script.Sky
local v_u_8 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_8.AddSkybox(v_u_7)
local v_u_9 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_10 = require(v_u_2.Modules.ScreenShakeCore)
local function v_u_17(p11, p12, p13, p14, p15)
	local v_u_16 = p11:Clone()
	v_u_16.PlaybackSpeed = v_u_16.PlaybackSpeed + math.random(p12 * 1000, p13 * 1000) / 1000
	v_u_16.Parent = p14
	v_u_16:Play()
	if p15 then
		return v_u_16
	end
	task.delay(8, function()
		-- upvalues: (copy) v_u_16
		if v_u_16 then
			v_u_16:Destroy()
		end
	end)
end
local function v_u_34(p18)
	-- upvalues: (copy) v_u_4, (copy) v_u_17, (copy) v_u_6, (copy) v_u_10, (copy) v_u_5
	local v_u_19 = script.SnowballBoulder:Clone()
	v_u_19.Position = p18 + Vector3.new(0, 20, 0)
	v_u_19.Transparency = 0
	v_u_19.Parent = workspace.WeatherVisuals
	v_u_4:Create(v_u_19, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
		["Position"] = p18
	}):Play()
	v_u_4:Create(v_u_19, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
		["Size"] = Vector3.new(12, 12, 12)
	}):Play()
	task.wait(1)
	v_u_19.Trail.Enabled = true
	v_u_19.Attachment.Land1:Emit(10)
	v_u_19.Attachment.Land2:Emit(10)
	v_u_19.Attachment.Snow:Emit(10)
	v_u_17(script.Sounds.Land, -0.2, 0.2, v_u_19)
	local v_u_20 = v_u_6.Character
	if v_u_20 and v_u_20:FindFirstChild("HumanoidRootPart") ~= nil then
		v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.5, 0.45, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
		v_u_10:ScreenShake("Normal", { "Tilt", 5 }, 5, 0.75, 0.7, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
	end
	local v_u_21 = Instance.new("LinearVelocity")
	v_u_21.Attachment0 = v_u_19.Att
	v_u_21.VectorVelocity = v_u_19.CFrame.LookVector * 15
	v_u_21.ForceLimitsEnabled = false
	v_u_21.Parent = v_u_19
	local v22 = TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
	v_u_4:Create(v_u_21, v22, {
		["VectorVelocity"] = v_u_19.CFrame.LookVector * 200
	}):Play()
	local v23 = script.Sounds.Rolling:Clone()
	v23.PlaybackSpeed = v23.PlaybackSpeed + math.random(-300, 300) / 1000
	v23.Parent = v_u_19
	v23:Play()
	local v_u_24 = v23
	v_u_4:Create(v_u_24, v22, {
		["Volume"] = 1
	}):Play()
	local v_u_25 = false
	local v_u_26 = false
	v_u_19.Touched:Connect(function(p27)
		-- upvalues: (copy) v_u_19, (ref) v_u_25, (ref) v_u_17, (copy) v_u_24, (copy) v_u_20, (ref) v_u_10, (copy) v_u_21, (ref) v_u_5, (ref) v_u_26
		if (v_u_19.Transparency == 1 or p27.Parent.Name ~= "Barrier") and p27.Name ~= "RampBottom" then
			if v_u_25 == false and v_u_5:GetPlayerFromCharacter(p27.Parent) ~= nil then
				if v_u_26 == false then
					v_u_26 = true
					v_u_17(script.Sounds.BigHit, -0.3, 0.3, p27)
					if v_u_20 and v_u_20:FindFirstChild("HumanoidRootPart") ~= nil then
						v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.5, 0.45, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
						v_u_10:ScreenShake("Normal", { "Tilt", 5 }, 5, 0.75, 0.7, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
					end
					if v_u_21 then
						v_u_21:Destroy()
					end
					v_u_19.Burst:Emit(3)
					v_u_19.Mist:Emit(3)
					v_u_19.SnowBits:Emit(3)
					v_u_19.SnowBurst:Emit(3)
					task.delay(0.5, function()
						-- upvalues: (ref) v_u_26
						v_u_26 = false
					end)
				end
				if p27.Parent == v_u_20 and v_u_20:FindFirstChild("HumanoidRootPart") ~= nil then
					v_u_25 = true
					v_u_20.Humanoid.PlatformStand = true
					local v_u_28 = Instance.new("BodyVelocity")
					v_u_28.MaxForce = Vector3.new(100000, 100000, 100000)
					v_u_28.Velocity = Vector3.new(0, 35, 0) + v_u_19.CFrame.LookVector * 125
					v_u_28.Parent = v_u_20.HumanoidRootPart
					local v_u_29 = Instance.new("BodyAngularVelocity")
					v_u_29.MaxTorque = Vector3.new(100000, 100000, 100000)
					local v30 = math.random(-30, 30)
					local v31 = math.random(-30, 30)
					local v32 = math.random
					v_u_29.AngularVelocity = Vector3.new(v30, v31, v32(-30, 30))
					v_u_29.Parent = v_u_20.HumanoidRootPart
					task.delay(0.2, function()
						-- upvalues: (copy) v_u_28, (copy) v_u_29, (ref) v_u_20, (ref) v_u_17, (ref) v_u_10
						if v_u_28 then
							v_u_28:Destroy()
						end
						if v_u_29 then
							v_u_29:Destroy()
						end
						task.wait(1)
						if v_u_20 and v_u_20:FindFirstChild("HumanoidRootPart") then
							v_u_20.Humanoid.PlatformStand = false
							v_u_20.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
							local v_u_33 = script.Smoke:Clone()
							v_u_33.Parent = v_u_20.HumanoidRootPart
							v_u_33:Emit(3)
							v_u_17(script.Poof, -0.2, 0.2, v_u_20.HumanoidRootPart)
							task.delay(1, function()
								-- upvalues: (copy) v_u_33
								if v_u_33 then
									v_u_33:Destroy()
								end
							end)
							v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.3, 0.45)
							v_u_10:ScreenShake("Normal", { "Tilt", 4 }, 5, 0.35, 0.7)
							v_u_20:PivotTo(CFrame.new(72.5 + math.random(-5, 5), 6.199999809265137, -13.5 + math.random(-5, 5)) * CFrame.Angles(0, -1.5707963267948966, 0))
						end
					end)
				end
			end
		else
			v_u_19.Transparency = 1
			v_u_25 = true
			v_u_17(script.Sounds.Burst1, -0.2, 0.2, v_u_19)
			v_u_17(script.Sounds.Burst2, -0.2, 0.2, v_u_19)
			if v_u_24 then
				v_u_24:Stop()
			end
			if v_u_20 and v_u_20:FindFirstChild("HumanoidRootPart") ~= nil then
				v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.5, 0.45, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
				v_u_10:ScreenShake("Normal", { "Tilt", 5 }, 5, 0.75, 0.7, { v_u_20.HumanoidRootPart.Position, v_u_19.Position, 500 })
			end
			if v_u_21 then
				v_u_21:Destroy()
			end
			v_u_19.Anchored = true
			v_u_19.Trail.Enabled = false
			v_u_19.CanTouch = false
			v_u_19.Burst:Emit(10)
			v_u_19.Mist:Emit(10)
			v_u_19.SnowBits:Emit(10)
			v_u_19.SnowBurst:Emit(10)
			task.wait(5)
			if v_u_19 then
				v_u_19:Destroy()
				return
			end
		end
	end)
	v_u_19.Anchored = false
end
local function v_u_47(p35)
	-- upvalues: (ref) v_u_3, (copy) v_u_9, (copy) v_u_6, (copy) v_u_17, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_2
	if v_u_3 ~= true then
		v_u_3 = true
		v_u_9:CreateNotification("An ice ramp is forming. Make it to the top to get a reward!")
		local v36 = v_u_6.Character
		if v36 and v36:FindFirstChild("HumanoidRootPart") then
			local v_u_37 = script.Smoke:Clone()
			v_u_37.Parent = v36.HumanoidRootPart
			v_u_37:Emit(3)
			v_u_17(script.Poof, -0.2, 0.2, v36.HumanoidRootPart)
			task.delay(1, function()
				-- upvalues: (copy) v_u_37
				if v_u_37 then
					v_u_37:Destroy()
				end
			end)
			v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.3, 0.45)
			v_u_10:ScreenShake("Normal", { "Tilt", 4 }, 5, 0.35, 0.7)
			v36:PivotTo(CFrame.new(72.5 + math.random(-5, 5), 6.199999809265137, -13.5 + math.random(-5, 5)) * CFrame.Angles(0, -1.5707963267948966, 0))
		end
		v_u_10:ScreenShake("Constant", { "Vector", "boulderRamp" }, 1, 1, 0.1)
		v_u_10:ScreenShake("Constant", { "Tilt", "boulderRamp2" }, 5, 0.075, 0.1)
		local v_u_38 = workspace:WaitForChild("SnowballBoulderRamp")
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (copy) v_u_38, (ref) v_u_10, (ref) v_u_6
			script.EarthquakeLoop.Volume = 0
			script.EarthquakeLoop:Play()
			local v39 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_4:Create(script.EarthquakeLoop, v39, {
				["Volume"] = 0.2
			}):Play()
			for _, v40 in v_u_38:GetDescendants() do
				if v40.ClassName == "Part" then
					v_u_4:Create(v40, v39, {
						["Size"] = v40:GetAttribute("OSize"),
						["CFrame"] = v40:GetAttribute("OCFrame")
					}):Play()
					task.wait(0.05)
				elseif v40.ClassName == "ParticleEmitter" then
					v40.Enabled = true
				end
			end
			v_u_38:WaitForChild("Reward").Reward.RewardClaim1.Enabled = false
			v_u_38:WaitForChild("Reward").Reward.RewardClaim2.Enabled = false
			v_u_38:WaitForChild("Reward").Reward.RewardClaim3.Enabled = false
			v_u_4:Create(script.EarthquakeLoop, v39, {
				["Volume"] = 0
			}):Play()
			v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.3, 0.45)
			v_u_10:ScreenShake("Normal", { "Tilt", 4 }, 5, 0.35, 0.7)
			local v41 = v_u_6:FindFirstChild("boulderRamp")
			if v41 then
				v41:Destroy()
			end
			local v42 = v_u_6:FindFirstChild("boulderRamp2")
			if v42 then
				v42:Destroy()
			end
			task.wait(0.2)
			script.EarthquakeLoop:Stop()
		end)
		if p35 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(59, 87, 93),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_8.UpdateSkybox(v_u_7, 4)
			script.Ambience:Play()
			script.Ambience.Volume = 0.45
			workspace.BasePlate.TopBaseplate.Color = Color3.fromRGB(255, 255, 255)
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_8.UpdateSkybox(v_u_7, 4)
			game.Lighting.ClockTime = 3
			task.wait(2)
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25,
				["ClockTime"] = 16
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(120, 168, 170),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			script.Ambience.Volume = 0
			script.Ambience:Play()
			v_u_4:Create(script.Ambience, TweenInfo.new(5), {
				["Volume"] = 0.45
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0.028
			}):Play()
			v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
				["Color"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		end
		local v43 = script.Parent.FestiveNight.BlizzardParticle:Clone()
		v43.Parent = workspace.WeatherVisuals
		for _, v44 in v43:GetChildren() do
			v44.Enabled = true
		end
		local v_u_45 = v_u_38:WaitForChild("Reward")
		local v_u_46 = nil
		v_u_45:WaitForChild("Reward"):WaitForChild("RewardPrompt").Enabled = true
		v_u_46 = v_u_45.Reward.RewardPrompt.Triggered:Connect(function()
			-- upvalues: (ref) v_u_46, (copy) v_u_45, (ref) v_u_2
			v_u_46:Disconnect()
			v_u_45.Reward.RewardPrompt.Enabled = false
			script.Reward:Play()
			v_u_45.Reward.Reward1.Enabled = false
			v_u_45.Reward.RewardClaim1:Emit(7)
			v_u_45.Reward.RewardClaim2:Emit(7)
			v_u_45.Reward.RewardClaim3:Emit(1)
			v_u_2:WaitForChild("GameEvents"):WaitForChild("GiantSnowballDodge"):FireServer()
		end)
		v_u_45.Reward.RewardPrompt.Destroying:Once(function()
			-- upvalues: (ref) v_u_46
			if v_u_46 then
				v_u_46:Disconnect()
			end
		end)
	end
end
local function v_u_60(p48)
	-- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_17, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7
	local v49 = p48 == true and workspace:FindFirstChild("SnowballBoulderRamp")
	if v49 then
		v49:Destroy()
	end
	if v_u_3 ~= false then
		v_u_3 = false
		task.spawn(function()
			-- upvalues: (ref) v_u_4
			script.EarthquakeLoop.Volume = 0
			script.EarthquakeLoop:Play()
			local v50 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_4:Create(script.EarthquakeLoop, v50, {
				["Volume"] = 0.2
			}):Play()
			local v51 = workspace:FindFirstChild("SnowballBoulderRamp")
			if v51 then
				for _, v52 in v51:GetDescendants() do
					if v52.ClassName == "Part" then
						v52.CanCollide = false
					end
				end
				for _, v53 in v51:GetDescendants() do
					if v53.ClassName == "Part" then
						v_u_4:Create(v53, v50, {
							["Size"] = Vector3.new(0, 0, 0)
						}):Play()
						task.wait(0.05)
					elseif v53.ClassName == "ParticleEmitter" then
						v53.Enabled = false
					end
				end
			end
			v_u_4:Create(script.EarthquakeLoop, v50, {
				["Volume"] = 0
			}):Play()
		end)
		local v54 = v_u_6.Character
		if v54 and (v54:FindFirstChild("HumanoidRootPart") and v54.HumanoidRootPart.Position.X > 100) then
			v54.Humanoid.PlatformStand = false
			v54.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			local v_u_55 = script.Smoke:Clone()
			v_u_55.Parent = v54.HumanoidRootPart
			v_u_55:Emit(3)
			v_u_17(script.Poof, -0.2, 0.2, v54.HumanoidRootPart)
			task.delay(1, function()
				-- upvalues: (copy) v_u_55
				if v_u_55 then
					v_u_55:Destroy()
				end
			end)
			v_u_10:ScreenShake("Normal", { "Vector" }, 1, 0.3, 0.45)
			v_u_10:ScreenShake("Normal", { "Tilt", 4 }, 5, 0.35, 0.7)
			v54:PivotTo(CFrame.new(72.5 + math.random(-5, 5), 6.199999809265137, -13.5 + math.random(-5, 5)) * CFrame.Angles(0, -1.5707963267948966, 0))
		end
		game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
			["ClockTime"] = 3
		}):Play()
		game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
			["Intensity"] = 0
		}):Play()
		local v56 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
		if v56 then
			for _, v57 in v56:GetChildren() do
				v57.Enabled = false
			end
		end
		v_u_4:Create(script.Ambience, TweenInfo.new(5), {
			["Volume"] = 0
		}):Play()
		task.wait(5)
		v_u_8.UpdateSkybox(v_u_7, 0)
		game.Lighting.ClockTime = 3
		game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness"),
			["ClockTime"] = 14
		}):Play()
		v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(91, 154, 76)
		}):Play()
		task.spawn(function()
			local v58 = workspace.WeatherVisuals:FindFirstChild("SnowPiles")
			if v58 then
				for _, v59 in v58:GetChildren() do
					v59:WaitForChild("Main"):WaitForChild("Smoke"):Emit(2)
					v59.Main.Poof:Play()
					v59.Main.Transparency = 1
					v59.One:Destroy()
					v59.Two:Destroy()
					if v59:FindFirstChild("Present") then
						v59.Present:Destroy()
					end
					if v59:FindFirstChild("Lights") then
						v59.Lights:Destroy()
					end
					task.wait()
				end
			end
			task.wait(3)
			if v58 then
				v58:Destroy()
			end
		end)
		game.Lighting.SunRays.Enabled = false
		script.Ambience:Stop()
		if v56 then
			v56:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("GiantSnowballDodge"):Connect(function()
	-- upvalues: (copy) v_u_47, (copy) v_u_60
	if workspace:GetAttribute("GiantSnowballDodge") then
		v_u_47()
	else
		v_u_60()
	end
end)
if workspace:GetAttribute("GiantSnowballDodge") then
	task.defer(function()
		-- upvalues: (copy) v_u_47
		v_u_47(true)
	end)
else
	v_u_60(true)
end
v_u_2:WaitForChild("GameEvents"):WaitForChild("GiantSnowballDodge").OnClientEvent:Connect(function(p61)
	-- upvalues: (ref) v_u_3, (copy) v_u_34
	if p61 ~= nil and v_u_3 == true then
		v_u_34(p61)
	end
end)
return v1