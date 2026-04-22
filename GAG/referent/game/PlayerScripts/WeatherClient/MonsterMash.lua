local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.SoundPlayer)
local v_u_4 = require(v2.Data.SoundData)
local v_u_5 = require(v2.Modules.WeatherMusicManager)
Random.new()
local v_u_6 = workspace.CurrentCamera
require(game.ReplicatedStorage.Code.CameraShaker)
require(game.ReplicatedStorage.Code.LightningBolt)
local v_u_7 = require(game.ReplicatedStorage.Modules.NumberUtil)
local v8 = RaycastParams.new()
v8.FilterDescendantsInstances = { workspace.Terrain, workspace }
v8.FilterType = Enum.RaycastFilterType.Include
local v_u_9 = false
local v_u_10 = script.Sky
local v_u_11 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_11.AddSkybox(v_u_10)
local v_u_12 = game.Lighting.ColorCorrection:Clone()
v_u_12.Name = script.Name
v_u_12.Parent = game.Lighting
local v_u_13 = script.SFOTH
v_u_11.AddSkybox(v_u_13)
local function v_u_22(p14)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v15 = game.ReplicatedStorage.ShootingStar:Clone()
	v15.CFrame = p14
	v15.Parent = workspace
	local v16 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.Fire, nil, nil, workspace, { "LazyLoadSound" })
	game.Debris:AddItem(v16, 5)
	local v17 = 0
	while v17 < 1 do
		v17 = v17 + game:GetService("RunService").Heartbeat:Wait()
		v15:PivotTo(p14:Lerp(p14 * CFrame.new(0, 200, 0), v17))
	end
	for _, v18 in v15:GetDescendants() do
		if v18:IsA("BillboardGui") then
			v18.Enabled = false
		end
	end
	game.Debris:AddItem(v15, 4)
	local v19 = game.ReplicatedStorage.FireworkBoom:Clone()
	v19.Parent = workspace
	v19.CFrame = v15.CFrame
	for _, v20 in v19:GetDescendants() do
		if v20:IsA("ParticleEmitter") then
			v20:Emit(v20:GetAttribute("EmitCount"))
		end
	end
	local v21 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.Boom, nil, nil, workspace, { "LazyLoadSound" })
	game.Debris:AddItem(v21, 5)
	game.Debris:AddItem(v19, 10)
end
local function v_u_76()
	-- upvalues: (ref) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_6, (copy) v_u_22, (copy) v_u_5, (copy) v_u_13, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4
	v_u_9 = true
	game.TweenService:Create(v_u_12, TweenInfo.new(2), {
		["Brightness"] = 0.1
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(2), {
		["Ambient"] = Color3.fromRGB(60, 162, 230),
		["Brightness"] = 1
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0.436,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	v_u_11.UpdateSkybox(v_u_10, 2)
	local v_u_23 = workspace.Visuals:WaitForChild("DJJhai")
	local v_u_24 = v_u_23:GetPivot()
	local v_u_25 = v_u_24 * CFrame.new(0, 85, 0)
	local v26 = v_u_23:WaitForChild("jhailatte"):WaitForChild("Humanoid")
	local v_u_27 = v26.Animator:LoadAnimation(script.Mash)
	v_u_27.Priority = Enum.AnimationPriority.Action4
	local v_u_28 = v26.Animator:LoadAnimation(script.Animation)
	v_u_28:Play()
	local v_u_29 = game.ReplicatedStorage.Assets.DanceFloor:Clone()
	local v_u_30 = v_u_29:GetPivot()
	v_u_29.Parent = workspace
	local function v_u_32()
		-- upvalues: (copy) v_u_29
		for _, v31 in v_u_29.Colour:GetChildren() do
			v31.Color = Color3.fromHSV(Random.new():NextNumber(0, 1), Random.new():NextNumber(0, 1), 1)
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_32
		while workspace:GetAttribute("MonsterMash") do
			v_u_32()
			task.wait(1)
		end
	end)
	local v33 = 0
	while v33 < 2 do
		v33 = v33 + game:GetService("RunService").Heartbeat:Wait()
		local v34 = game.TweenService:GetValue(v33, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v_u_23:PivotTo(v_u_24:Lerp(v_u_25, v34))
		v_u_29:PivotTo(v_u_30:Lerp(v_u_30 * CFrame.new(0, 2, 0), v34))
	end
	workspace:GetAttribute("MonsterMashTimer")
	local v_u_35 = Instance.new("Sound")
	v_u_35.Volume = 0.6
	v_u_35.Parent = workspace
	v_u_35.SoundId = "rbxassetid://79451196298919"
	v_u_35.Looped = true
	v_u_35:Play()
	repeat
		task.wait()
	until workspace:GetAttribute("MonsterMashTimer") or not workspace:GetAttribute("MonsterMash")
	v_u_35.Looped = false
	local v_u_36 = v26.Animator:LoadAnimation(script.Up)
	local v_u_37 = 0
	local v_u_38 = false
	local v_u_39 = false
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (copy) v_u_23, (copy) v_u_35, (ref) v_u_39, (ref) v_u_38, (ref) v_u_6, (ref) v_u_37, (copy) v_u_28, (copy) v_u_27, (copy) v_u_36, (ref) v_u_12, (ref) v_u_22
		local v40 = nil
		while v_u_9 do
			task.wait(0)
			if v_u_23:IsDescendantOf(workspace) and v_u_23:FindFirstChild("DJBooth") then
				v_u_23.DJBooth.Light.Attachment.PointLight.Color = Color3.fromHSV(tick() / 3 % 1, 1, 1)
			end
			local v41 = (v_u_35.PlaybackLoudness - 200) / 700
			local v42 = math.clamp(v41, 0, 1)
			if v_u_39 == true then
				local v43 = v_u_35.PlaybackLoudness / 700
				v42 = math.clamp(v43, 0, 1)
			end
			if v40 and (v_u_35.PlaybackLoudness / 1000 - v40 > 0.2 and not v_u_38) then
				for _, v44 in v_u_23.jhailatte.HumanoidRootPart.Attachment:GetChildren() do
					v44:Emit(v44:GetAttribute("EmitCount"))
				end
				local _, v45 = v_u_6:WorldToScreenPoint(v_u_23:GetPivot().p)
				if v45 then
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
						["FieldOfView"] = 68
					}):Play()
					task.delay(0.2, function()
						game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
							["FieldOfView"] = 70
						}):Play()
					end)
				end
			end
			v40 = v_u_35.PlaybackLoudness / 1000
			if v42 > 0.45 then
				local v_u_46 = tick()
				v_u_37 = v_u_46
				if not v_u_38 then
					v_u_38 = true
					if v_u_39 then
						v_u_28:Stop()
						v_u_27:Play(0, 10)
					else
						v_u_36:Play()
					end
					game.TweenService:Create(v_u_12, TweenInfo.new(0.3), {
						["TintColor"] = Color3.fromRGB(226, 192, 255),
						["Brightness"] = 0.5
					}):Play()
					game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
						["FieldOfView"] = 90
					}):Play()
					for _, v_u_47 in v_u_23.Pyro:GetDescendants() do
						if v_u_47:IsA("ParticleEmitter") then
							v_u_47.Enabled = true
							task.delay(1.5, function()
								-- upvalues: (copy) v_u_47
								v_u_47.Enabled = false
							end)
						end
					end
					for _, v48 in v_u_23.Confetti:GetDescendants() do
						v48:Emit(v48:GetAttribute("EmitCount"))
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_23, (ref) v_u_22
						for _, v_u_49 in v_u_23.SpawnPoints:GetChildren() do
							task.spawn(function()
								-- upvalues: (ref) v_u_22, (copy) v_u_49
								v_u_22(v_u_49.CFrame)
							end)
							task.wait(0.1)
						end
					end)
					task.delay(3, function()
						-- upvalues: (ref) v_u_12
						game.TweenService:Create(v_u_12, TweenInfo.new(3), {
							["TintColor"] = Color3.fromRGB(255, 255, 255),
							["Brightness"] = 0.1
						}):Play()
					end)
					task.spawn(function()
						-- upvalues: (ref) v_u_38, (ref) v_u_23, (ref) v_u_6
						while v_u_38 and (v_u_23 and v_u_23:IsDescendantOf(workspace)) do
							for _, v50 in v_u_23.jhailatte.HumanoidRootPart.Attachment:GetChildren() do
								v50:Emit(v50:GetAttribute("EmitCount"))
							end
							local _, v51 = v_u_6:WorldToScreenPoint(v_u_23:GetPivot().p)
							if v51 then
								game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
									["FieldOfView"] = 68
								}):Play()
								task.delay(0.2, function()
									game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
										["FieldOfView"] = 70
									}):Play()
								end)
							end
							task.wait(0.5)
						end
					end)
				end
				task.delay(1, function()
					-- upvalues: (ref) v_u_37, (copy) v_u_46, (ref) v_u_39, (ref) v_u_38, (ref) v_u_36, (ref) v_u_27, (ref) v_u_28
					if v_u_37 == v_u_46 then
						if v_u_39 then
							repeat
								task.wait()
							until v_u_39 == false
						end
						v_u_38 = false
						v_u_36:Stop()
						v_u_27:Stop()
						v_u_28:Play()
					end
				end)
			end
			for _, v52 in v_u_23.DJBooth.Speakers:GetChildren() do
				if v52:IsA("BasePart") then
					local v53 = v52.Mesh
					local v54 = v42 * -1.4
					v53.Offset = Vector3.new(0, v54, 0)
					v52.Mesh.Scale = Vector3.new(1, 1, 1) * (v42 * 0.4 + 1)
				end
			end
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_35, (copy) v_u_23, (copy) v_u_25, (copy) v_u_24, (copy) v_u_29, (copy) v_u_30, (copy) v_u_36, (copy) v_u_28, (ref) v_u_11, (ref) v_u_10, (ref) v_u_13, (ref) v_u_12
		v_u_5.Start("MonsterMash", {
			["priority"] = 10
		})
		repeat
			task.wait()
		until not workspace:GetAttribute("MonsterMash")
		game.TweenService:Create(v_u_35, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_35
			v_u_35:Destroy()
		end)
		local v55 = 0
		while v55 < 2 do
			v55 = v55 + game:GetService("RunService").Heartbeat:Wait()
			local v56 = game.TweenService:GetValue(v55, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			v_u_23:PivotTo(v_u_25:Lerp(v_u_24, v56))
			v_u_29:PivotTo((v_u_30 * CFrame.new(0, 2, 0)):Lerp(v_u_30, v56))
		end
		v_u_5.Stop("MonsterMash")
		v_u_29:Destroy()
		v_u_36:Destroy()
		v_u_28:Destroy()
		if v_u_23 then
			v_u_23:Destroy()
		end
		v_u_11.UpdateSkybox(v_u_10, 0)
		v_u_11.UpdateSkybox(v_u_13, 0)
		game.TweenService:Create(v_u_12, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
	end)
	local v57 = v_u_23.Screen:FindFirstChild("Timer", true)
	local v_u_58 = v_u_39
	while true do
		if workspace:GetAttribute("MonsterMashCurrentClock") then
			v57.Text = v_u_7.compactFormat(workspace:GetAttribute("MonsterMashCurrentClock"))
		end
		task.wait(1)
		if workspace:GetAttribute("MonsterMashCurrentClock") <= 0 then
			game.TweenService:Create(v_u_23.Screen, TweenInfo.new(1), {
				["CFrame"] = v_u_23.Screen.CFrame * CFrame.new(0, -200, 0)
			}):Play()
			v_u_23.Screen:Destroy()
			game.TweenService:Create(v_u_35, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (copy) v_u_35
				v_u_35:Stop()
			end)
			local v59 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["PlaybackSpeed"] = 1,
				["Volume"] = 1.5
			}
			local v60 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.DjScratchEffect, v59, nil, workspace)
			game.Debris:AddItem(v60, 5)
			game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(2), {
				["FieldOfView"] = 65
			}):Play()
			task.wait(2)
			local v61 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["PlaybackSpeed"] = 1,
				["Volume"] = 1.5
			}
			local v62 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.Impact, v61, nil, workspace)
			game.Debris:AddItem(v62, 7)
			for _ = 1, 4 do
				for _, v63 in v_u_23.Pyro:GetDescendants() do
					if v63:IsA("ParticleEmitter") then
						v63:Emit(15)
					end
				end
				local v64 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["PlaybackSpeed"] = 1,
					["Volume"] = 0.5
				}
				local v65 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.AirHornSoundEffect, v64, nil, workspace)
				game.Debris:AddItem(v65, 4)
				game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.1), {
					["FieldOfView"] = 68
				}):Play()
				task.delay(0.05, function()
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.05), {
						["FieldOfView"] = 70
					}):Play()
				end)
				task.wait(0.15)
			end
			for _, v_u_66 in v_u_23.Pyro:GetDescendants() do
				if v_u_66:IsA("ParticleEmitter") then
					v_u_66.Enabled = true
					task.delay(1.5, function()
						-- upvalues: (copy) v_u_66
						v_u_66.Enabled = false
					end)
				end
			end
			task.spawn(function()
				-- upvalues: (copy) v_u_23, (ref) v_u_22
				local v67 = {}
				for v68, v_u_69 in v_u_23.SpawnPoints:GetChildren() do
					task.spawn(function()
						-- upvalues: (ref) v_u_22, (copy) v_u_69
						v_u_22(v_u_69.CFrame)
					end)
					v67[#v_u_23.SpawnPoints:GetChildren() - (v68 - 1)] = v_u_69.CFrame
					task.wait(0.1)
				end
				for _, v_u_70 in v67 do
					task.spawn(function()
						-- upvalues: (ref) v_u_22, (copy) v_u_70
						v_u_22(v_u_70)
					end)
					task.wait(0.1)
				end
			end)
			task.wait(2)
			local v71 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["PlaybackSpeed"] = 1,
				["Volume"] = 3
			}
			local v72 = v_u_3:PlaySound(v_u_4.Weather.MonsterMash.Countdown, v71, nil, workspace)
			game.Debris:AddItem(v72, 5)
			for _ = 1, 5 do
				task.wait(1)
				game.TweenService:Create(v_u_12, TweenInfo.new(0.3), {
					["TintColor"] = Color3.fromRGB(219, 188, 255),
					["Brightness"] = 0.3
				}):Play()
				game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
					["FieldOfView"] = 68
				}):Play()
				task.delay(0.05, function()
					-- upvalues: (ref) v_u_12
					game.TweenService:Create(v_u_12, TweenInfo.new(0.3), {
						["TintColor"] = Color3.fromRGB(255, 255, 255),
						["Brightness"] = 0.1
					}):Play()
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.4), {
						["FieldOfView"] = 70
					}):Play()
				end)
			end
			task.wait(0.5)
			v_u_35.SoundId = "rbxassetid://95780928979580"
			v_u_35.TimePosition = 0
			v_u_35.Volume = 3
			v_u_35:Play()
			task.delay(30, function()
				-- upvalues: (copy) v_u_23, (ref) v_u_58, (ref) v_u_12, (ref) v_u_11, (ref) v_u_10, (ref) v_u_13
				for _, v73 in v_u_23.jhailatte:GetDescendants() do
					if v73:IsA("ParticleEmitter") then
						v73.Color = ColorSequence.new(Color3.fromRGB(254, 119, 0))
					end
				end
				v_u_58 = true
				for _, v74 in v_u_23.BassDrop:GetDescendants() do
					if v74:IsA("ParticleEmitter") then
						v74:Emit(v74:GetAttribute("EmitCount"))
					end
				end
				game.TweenService:Create(game.Lighting, TweenInfo.new(0.3), {
					["Ambient"] = Color3.fromRGB(230, 145, 26)
				}):Play()
				game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(0.3), {
					["Density"] = 0.338,
					["Offset"] = 0,
					["Color"] = Color3.fromRGB(255, 157, 0),
					["Decay"] = Color3.fromRGB(255, 204, 2)
				}):Play()
				game.TweenService:Create(v_u_12, TweenInfo.new(0.3), {
					["TintColor"] = Color3.fromRGB(255, 169, 83),
					["Brightness"] = 0.7
				}):Play()
				game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
					["FieldOfView"] = 90
				}):Play()
				task.delay(0.3, function()
					-- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_13, (ref) v_u_23, (ref) v_u_12
					v_u_11.UpdateSkybox(v_u_10, 0)
					v_u_11.UpdateSkybox(v_u_13, 2)
					v_u_23.DJBooth.Smoke.OutwardSmoke.Enabled = true
					game.TweenService:Create(v_u_12, TweenInfo.new(1), {
						["TintColor"] = Color3.fromRGB(255, 255, 255),
						["Brightness"] = 0.1
					}):Play()
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(1), {
						["FieldOfView"] = 70
					}):Play()
				end)
				local v75 = game.ReplicatedStorage.Assets.DJJhaiFence:Clone()
				v75.Parent = workspace
				repeat
					task.wait()
				until not workspace:GetAttribute("MonsterMash")
				v75:Destroy()
			end)
			return
		end
	end
end
workspace:GetAttributeChangedSignal("MonsterMash"):Connect(function()
	-- upvalues: (copy) v_u_76, (ref) v_u_9
	if workspace:GetAttribute("MonsterMash") then
		v_u_76()
	else
		v_u_9 = false
	end
end)
if workspace:GetAttribute("MonsterMash") then
	task.defer(v_u_76)
else
	v_u_9 = false
end
return v1