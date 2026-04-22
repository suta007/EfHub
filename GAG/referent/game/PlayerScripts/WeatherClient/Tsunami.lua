local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Lighting")
game:GetService("Debris")
local v_u_6 = require(v2.Modules.Spring)
local v_u_7 = require(v2.Code.CameraShaker)
local v_u_8 = require(v2.Modules.SoundPlayer)
local v_u_9 = require(v2.Data.SoundData)
local v_u_11 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
v_u_11:Start()
local v_u_12 = require(v2.Modules.SkyboxManager)
local v_u_13 = script:WaitForChild("Underwater")
v_u_12.AddSkybox(v_u_13)
local v_u_14 = require(v2.Code:WaitForChild("Windlines"))
local v_u_15 = v_u_5.ColorCorrection:Clone()
v_u_15.Name = script.Name
v_u_15.Parent = v_u_5
local v_u_16 = workspace.Terrain.Clouds
local v_u_17 = false
Random.new()
local _ = workspace.CurrentCamera
local v_u_18 = require(game.ReplicatedStorage.Modules.Trove)
local function v_u_118()
	-- upvalues: (ref) v_u_17, (copy) v_u_18, (copy) v_u_3, (copy) v_u_5, (copy) v_u_15, (copy) v_u_16, (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_12, (copy) v_u_13, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_4
	v_u_17 = true
	local v_u_19 = v_u_18.new()
	v_u_3:Create(v_u_5, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(70, 70, 70),
		["Brightness"] = 3,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 153, 153),
		["ColorShift_Top"] = Color3.fromRGB(238, 255, 192),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0.2,
		["GeographicLatitude"] = 80,
		["OutdoorAmbient"] = Color3.fromRGB(172, 172, 172),
		["ShadowSoftness"] = 0.75
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.302,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(255, 214, 178),
		["Decay"] = Color3.fromRGB(255, 255, 255),
		["Glare"] = 0,
		["Haze"] = 10
	}):Play()
	v_u_3:Create(v_u_15, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 208, 242)
	}):Play()
	if not workspace:GetAttribute("Tsunami_IsUnderwater") then
		v_u_3:Create(v_u_16, TweenInfo.new(3), {
			["Cover"] = 0.943,
			["Density"] = 0.329,
			["Color"] = Color3.fromRGB(128, 128, 128)
		}):Play()
	end
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(135, 154, 127)
	}):Play()
	local v_u_20 = v_u_19:Add(script.Ocean:Clone())
	local v21 = v_u_20.Position
	v_u_20.Position = v_u_20.Position + Vector3.new(0, -50, 0)
	v_u_20.Transparency = 1
	v_u_20.Parent = workspace
	v_u_6.target(v_u_20, 1, 2, {
		["Position"] = v21,
		["Transparency"] = 0
	})
	local function v_u_100()
		-- upvalues: (ref) v_u_11, (ref) v_u_7, (ref) v_u_12, (ref) v_u_13, (copy) v_u_19, (ref) v_u_8, (ref) v_u_9, (copy) v_u_20, (ref) v_u_15, (ref) v_u_17
		v_u_11:Shake(v_u_7.Presets.Explosion)
		v_u_12.UpdateSkybox(v_u_13, 5)
		game.Lighting.Ambient = Color3.fromRGB(0, 132, 255)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(147, 161, 255)
		game.Lighting.Atmosphere.Haze = 0
		game.Workspace.Terrain.Clouds.Cover = 0
		game.SoundService.AmbientReverb = Enum.ReverbType.UnderWater
		workspace.BasePlate.TopBaseplate.Color = Color3.fromRGB(119, 219, 142)
		v_u_19:Add(v_u_8:PlaySound(v_u_9.Weather.Tsunami.Liquid, {
			["Looped"] = true,
			["Volume"] = 0.6
		}, nil, nil))
		v_u_20:Destroy()
		task.spawn(function()
			-- upvalues: (ref) v_u_19
			local v22 = workspace.CurrentCamera.FieldOfView / 2
			local v23 = math.rad(v22)
			local v24 = math.tan(v23) * 10
			local v25 = v24 * 1.2 / 1.78
			local v_u_26 = v_u_19:Add(game.ReplicatedStorage.SubmergeEffect:Clone())
			v_u_26.Size = Vector3.new(v25, v24, 0.1)
			v_u_26.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5)
			v_u_26.Parent = workspace.Visuals
			local v_u_31 = v_u_19:Add(game:GetService("RunService").RenderStepped:Connect(function()
				-- upvalues: (copy) v_u_26
				local v27 = workspace.CurrentCamera.FieldOfView / 2
				local v28 = math.rad(v27)
				local v29 = math.tan(v28) * 10
				local v30 = v29 * (workspace.CurrentCamera.ViewportSize.X / workspace.CurrentCamera.ViewportSize.Y)
				v_u_26.Size = Vector3.new(v30, v29, 0.1)
				v_u_26.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5)
			end))
			for _, v_u_32 in v_u_26:GetDescendants() do
				if v_u_32:IsA("ParticleEmitter") then
					v_u_32:Emit(v_u_32:GetAttribute("EmitCount"))
					v_u_32.Enabled = true
					task.delay(0.6, function()
						-- upvalues: (copy) v_u_32
						v_u_32.Enabled = false
					end)
				end
			end
			task.delay(1.6, function()
				-- upvalues: (copy) v_u_31, (copy) v_u_26
				v_u_31:Disconnect()
				v_u_26:Destroy()
			end)
		end)
		game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
			["FieldOfView"] = 90
		}):Play()
		game.TweenService:Create(v_u_15, TweenInfo.new(0.3), {
			["Brightness"] = 0.7
		}):Play()
		local v_u_33 = v_u_19:Add(game.ReplicatedStorage.Bubble:Clone())
		v_u_33.Parent = workspace.Visuals
		for _, v34 in v_u_33:GetChildren() do
			if v34:IsA("ParticleEmitter") then
				v34:Emit(90)
			end
		end
		task.delay(4, function()
			-- upvalues: (copy) v_u_33
			for _, v35 in v_u_33:GetChildren() do
				if v35:IsA("ParticleEmitter") then
					game.TweenService:Create(v35, TweenInfo.new(7), {
						["Rate"] = 25
					}):Play()
				end
			end
			game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(3), {
				["FieldOfView"] = 70
			}):Play()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_17, (copy) v_u_33
			repeat
				task.wait()
			until v_u_17 == false
			for _, v36 in v_u_33:GetChildren() do
				if v36:IsA("ParticleEmitter") then
					v36.Enabled = false
				end
			end
			task.delay(3, function()
				-- upvalues: (ref) v_u_33
				v_u_33:Destroy()
			end)
		end)
		task.delay(0.7, function()
			-- upvalues: (ref) v_u_15
			game.TweenService:Create(v_u_15, TweenInfo.new(0.3), {
				["Brightness"] = 0.1
			}):Play()
		end)
		local v_u_37 = game.Players.LocalPlayer.Character
		if not v_u_37 then
			repeat
				task.wait()
			until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:IsDescendantOf(workspace)
			v_u_37 = game.Players.LocalPlayer.Character
		end
		local v_u_38 = v_u_19:Add(script.AlignPosition:Clone())
		local v_u_39 = v_u_19:Add(script.AlignOrientation:Clone())
		v_u_38.Attachment0 = v_u_37:WaitForChild("HumanoidRootPart"):WaitForChild("RootAttachment")
		v_u_39.Attachment0 = v_u_38.Attachment0
		v_u_38.Parent = v_u_37.PrimaryPart
		v_u_39.Parent = v_u_37.PrimaryPart
		local v_u_40 = Vector3.new(0, 0, 0)
		local v_u_41 = v_u_37.HumanoidRootPart.RootJoint.C0
		local v_u_42 = v_u_37.Humanoid:LoadAnimation(script.WalkAnim)
		local v_u_43 = {}
		local v_u_97 = v_u_19:Add(game:GetService("RunService").Stepped:Connect(function(_)
			-- upvalues: (ref) v_u_17, (ref) v_u_40, (copy) v_u_43, (copy) v_u_38, (copy) v_u_39, (copy) v_u_41, (copy) v_u_42
			if v_u_17 then
				task.spawn(function()
					-- upvalues: (ref) v_u_40, (ref) v_u_43
					for _, v44 in game.Players:GetPlayers() do
						if v44.Character and v44 ~= game.Players.LocalPlayer then
							if not v44.Character:GetAttribute("NormalC0") then
								v44.Character:SetAttribute("NormalC0", v44.Character.HumanoidRootPart.RootJoint.C0)
							end
							local v45 = v44.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
							local v46 = v44.Character.PrimaryPart.AssemblyLinearVelocity.Unit
							local v47 = v44.Character.PrimaryPart.CFrame
							local v48 = (v47:inverse() * CFrame.new(v47.p + v46)).p
							local v49 = v_u_40.x + v48.x * 1
							local v50 = math.min(16, v49)
							local v51 = math.max(-16, v50)
							local v52 = v_u_40.y + v48.y * 1
							local v53 = -math.max(-16, v52)
							local v54 = v_u_40.z + v48.z * 1
							local v55 = math.min(16, v54)
							local v56 = math.max(-16, v55)
							local v57 = Vector3.new(v51, v53, v56) * 60
							local v58 = v44.Character:GetAttribute("NormalC0")
							local v59 = RaycastParams.new()
							v59.FilterDescendantsInstances = { v44.Character }
							v59.FilterType = Enum.RaycastFilterType.Exclude
							local v60 = workspace:Raycast(v44.Character.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v59)
							if v60 or (v45 <= 5 or v_u_43[v44]) then
								if v45 < 8 then
									game.TweenService:Create(v44.Character.HumanoidRootPart.RootJoint, TweenInfo.new(0.4), {
										["C0"] = v58
									}):Play()
									if v60 and v_u_43[v44] then
										v_u_43[v44]:Stop()
										v_u_43[v44] = nil
									end
								end
							else
								v_u_43[v44] = v44.Character.Humanoid.Animator:LoadAnimation(script.WalkAnim)
								v_u_43[v44]:Play()
								local v61 = v57.Z / 16
								local v62 = -math.clamp(v61, -1, 1)
								print(v62)
								local v63 = game.TweenService
								local v64 = v44.Character.HumanoidRootPart.RootJoint
								local v65 = TweenInfo.new(0.4)
								local v66 = {}
								local v67 = CFrame.Angles
								local v68 = v62 * 70
								v66.C0 = v58 * v67(math.rad(v68), 0, 0)
								v63:Create(v64, v65, v66):Play()
							end
						end
					end
				end)
				local v69 = game.Players.LocalPlayer.Character
				if v69 then
					local v70 = v69:FindFirstChild("Humanoid")
					local v71 = v70.MoveDirection
					local v72 = game.Workspace.CurrentCamera.CFrame
					local v73 = (v72:inverse() * CFrame.new(v72.p + v71)).p
					v_u_40 = v_u_40 * 0.95
					game:GetService("UserInputService"):GetFocusedTextBox()
					local v74 = v_u_40.x + v73.x * 1
					local v75 = math.min(16, v74)
					local v76 = math.max(-16, v75)
					local v77 = v_u_40.y + v73.y * 1
					local v78 = -math.max(-16, v77)
					local v79 = v_u_40.z + v73.z * 1
					local v80 = math.min(16, v79)
					local v81 = math.max(-16, v80)
					v_u_40 = Vector3.new(v76, v78, v81)
					v_u_38.Position = (v69.HumanoidRootPart.CFrame * CFrame.new(v_u_40)).Position
					local v82 = v_u_40.Z / 16
					local v83 = -math.clamp(v82, -1, 1)
					v_u_39.CFrame = v72
					local v84 = v_u_40.X / 16
					local v85 = -math.clamp(v84, -1, 1)
					local v86 = RaycastParams.new()
					v86.FilterDescendantsInstances = { v69 }
					v86.FilterType = Enum.RaycastFilterType.Exclude
					if workspace:Raycast(v69.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v86) then
						v_u_38.Enabled = false
						v_u_39.Enabled = false
						v70.PlatformStand = false
						local v87 = {
							["C0"] = v_u_41
						}
						game.TweenService:Create(v69.HumanoidRootPart.RootJoint, TweenInfo.new(0.1), v87):Play()
						v_u_42:Stop()
					else
						v70.PlatformStand = true
						v_u_38.Enabled = true
						v_u_39.Enabled = true
						if v73.Magnitude > 0 then
							if not v_u_42.IsPlaying then
								v_u_42:Play()
							end
						else
							v_u_42:Stop()
						end
						local v88 = game.TweenService
						local v89 = v69.HumanoidRootPart.RootJoint
						local v90 = TweenInfo.new(0.1)
						local v91 = {}
						local v92 = v_u_41
						local v93 = CFrame.Angles
						local v94 = v83 * 70
						local v95 = math.rad(v94)
						local v96 = v85 * 35
						v91.C0 = v92 * v93(v95, math.rad(v96), 0)
						v88:Create(v89, v90, v91):Play()
					end
				else
					return
				end
			else
				return
			end
		end))
		v_u_19:Add(function()
			-- upvalues: (copy) v_u_97, (copy) v_u_43, (ref) v_u_37, (copy) v_u_41, (copy) v_u_42
			if v_u_97 and v_u_97.Connected then
				v_u_97:Disconnect()
			end
			for _, v_u_98 in game.Players:GetPlayers() do
				task.spawn(function()
					-- upvalues: (ref) v_u_43, (copy) v_u_98
					if v_u_43[v_u_98] then
						v_u_43[v_u_98]:Stop()
						v_u_43[v_u_98] = nil
					end
					if v_u_98 ~= game.Players.LocalPlayer then
						game.TweenService:Create(v_u_98.Character.HumanoidRootPart.RootJoint, TweenInfo.new(0.1), {
							["C0"] = v_u_98.Character:GetAttribute("NormalC0")
						}):Play()
					end
				end)
			end
			v_u_37.Humanoid.PlatformStand = false
			v_u_37.HumanoidRootPart.RootJoint.C0 = v_u_41
			local v99 = {
				["C0"] = v_u_41
			}
			game.TweenService:Create(v_u_37.HumanoidRootPart.RootJoint, TweenInfo.new(0.15), v99):Play()
			v_u_42:Stop()
			v_u_42:Destroy()
		end)
	end
	if workspace:GetAttribute("Tsunami_IsUnderwater") then
		v_u_100()
	else
		local v_u_101 = v_u_19:Add(script.FlareUI:Clone())
		v_u_101.Parent = game.Players.LocalPlayer.PlayerGui
		local v_u_102 = v_u_19:Add(v_u_8:PlaySound(v_u_9.Weather.Tsunami.Alarm, {
			["Looped"] = true,
			["Volume"] = 0.2
		}, nil, nil, { "LazyLoadSound" }))
		v_u_102.Parent = game.SoundService
		v_u_102.Playing = true
		task.delay(10, function()
			-- upvalues: (copy) v_u_102
			v_u_102:Destroy()
		end)
		v_u_101.TextLabel.Visible = false
		v_u_19:Add(task.spawn(function()
			-- upvalues: (copy) v_u_102, (copy) v_u_101
			while v_u_102.Parent ~= nil do
				task.wait(0.422)
				v_u_101.TextLabel.Visible = true
				task.wait(0.422)
				v_u_101.TextLabel.Visible = false
			end
			v_u_101.TextLabel.Visible = false
		end))
		v_u_14:Init({
			["Direction"] = Vector3.new(0.5, 0, 0),
			["Speed"] = 90,
			["Lifetime"] = 10,
			["SpawnRate"] = 30,
			["Color"] = Color3.fromRGB(255, 255, 255)
		})
		local v_u_103 = not workspace:GetAttribute("TsunamiStarted")
		task.delay(10, function()
			-- upvalues: (copy) v_u_19, (ref) v_u_4, (copy) v_u_100, (ref) v_u_103
			local function v117()
				-- upvalues: (ref) v_u_19, (ref) v_u_4, (ref) v_u_100
				local v_u_104 = v_u_19:Add(script.TsunamiModel:Clone())
				v_u_104.Parent = game.Workspace.WeatherVisuals
				local v_u_105 = v_u_104:GetPivot() + Vector3.new(0, -500, 0)
				local v_u_106 = v_u_19:Add(Instance.new("CFrameValue"))
				v_u_106.Value = v_u_105
				v_u_19:Add(v_u_106.Changed:Connect(function(p107)
					-- upvalues: (copy) v_u_104
					v_u_104:PivotTo(p107)
				end))
				local v_u_108 = tick()
				local v_u_109 = nil
				v_u_109 = v_u_19:Add(v_u_4.Heartbeat:Connect(function()
					-- upvalues: (copy) v_u_108, (copy) v_u_106, (copy) v_u_105, (ref) v_u_109
					local v110 = (tick() - v_u_108) / 25
					local v111 = v110 >= 1 and 1 or v110
					local v112 = 3200 * v111
					local v113 = 3.141592653589793 * v111
					local v114 = math.sin(v113) * 1050 - 525
					v_u_106.Value = v_u_105 * CFrame.new(0, v114, v112)
					if v111 >= 1 then
						v_u_109:Disconnect()
						v_u_106:Destroy()
					end
				end))
				local v_u_115 = false
				v_u_19:Add(v_u_104.Hitbox.Touched:Connect(function(p116)
					-- upvalues: (ref) v_u_115, (ref) v_u_100
					if p116.Parent == game.Players.LocalPlayer.Character and not v_u_115 then
						v_u_115 = true
						v_u_100()
					end
				end))
				task.delay(25, function()
					-- upvalues: (ref) v_u_115, (ref) v_u_100, (copy) v_u_104
					if not v_u_115 then
						v_u_100()
					end
					if v_u_104 then
						v_u_104:Destroy()
					end
				end)
			end
			if v_u_103 then
				v117()
			else
				v_u_100()
			end
		end)
	end
	while v_u_17 do
		task.wait(0.5)
	end
	v_u_12.UpdateSkybox(v_u_13, -1)
	v_u_3:Create(v_u_5, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0,
		["GeographicLatitude"] = 29.475,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_3:Create(v_u_15, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_16, TweenInfo.new(3), {
		["Cover"] = 0.646,
		["Density"] = 0,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_14:Cleanup()
	v_u_19:Destroy()
end
workspace:GetAttributeChangedSignal("Tsunami"):Connect(function()
	-- upvalues: (copy) v_u_118, (ref) v_u_17
	if workspace:GetAttribute("Tsunami") then
		v_u_118()
	else
		v_u_17 = false
	end
end)
if workspace:GetAttribute("Tsunami") then
	task.defer(v_u_118)
else
	v_u_17 = false
end
return v1