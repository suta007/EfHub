local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = game.Lighting
game:GetService("UserInputService")
local v_u_7 = require(v_u_2.Code.CameraShaker)
local v_u_8 = require(v_u_2.Modules.SkyboxManager)
local v_u_9 = require(v_u_2.Modules.Notification)
local v_u_10 = require(v_u_2.Modules.SoundPlayer)
local v_u_11 = require(v_u_2.Data.SoundData)
local v_u_12 = require(v_u_2.Code.FocusCamera)
local v_u_13 = require(v_u_2.Modules.WeatherMusicManager)
local v_u_14 = v5.LocalPlayer
local v_u_15 = workspace.CurrentCamera
local v_u_16 = false
local v_u_17 = {}
local v_u_18 = nil
local v_u_19 = { "rbxassetid://182435998", "rbxassetid://182436842", "rbxassetid://182436935" }
local function v_u_24()
	-- upvalues: (copy) v_u_14, (copy) v_u_19, (ref) v_u_18
	local v20 = v_u_14.Character
	if v20 then
		local v21 = v20:FindFirstChildOfClass("Humanoid")
		if v21 then
			local v22 = v21:FindFirstChildOfClass("Animator")
			if v22 then
				local v23 = Instance.new("Animation")
				v23.AnimationId = v_u_19[math.random(1, #v_u_19)]
				v_u_18 = v22:LoadAnimation(v23)
				v_u_18.Priority = Enum.AnimationPriority.Action4
				v_u_18.Looped = true
				v_u_18:Play()
			end
		else
			return
		end
	else
		return
	end
end
local v_u_25 = {}
local v_u_27 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p26)
	-- upvalues: (copy) v_u_15
	v_u_15.CFrame = v_u_15.CFrame * p26
end)
v_u_27:Start()
local v_u_28 = script:FindFirstChild("Sky")
if v_u_28 then
	v_u_8.AddSkybox(v_u_28)
end
local v_u_29 = v_u_6.ColorCorrection:Clone()
v_u_29.Name = "JandelsLastStand"
v_u_29.Parent = v_u_6
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local function v_u_35()
	-- upvalues: (ref) v_u_30, (copy) v_u_14, (ref) v_u_31
	v_u_30 = Instance.new("ScreenGui")
	v_u_30.Name = "MoonfallFlash"
	v_u_30.ResetOnSpawn = false
	v_u_30.IgnoreGuiInset = true
	v_u_30.DisplayOrder = 100
	v_u_30.Parent = v_u_14.PlayerGui
	v_u_31 = Instance.new("Frame")
	v_u_31.Size = UDim2.new(1, 0, 1, 0)
	v_u_31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	v_u_31.BackgroundTransparency = 1
	v_u_31.BorderSizePixel = 0
	v_u_31.Parent = v_u_30
end
local function v_u_39(p36, p37, p38)
	-- upvalues: (ref) v_u_31, (copy) v_u_3
	if v_u_31 then
		v_u_31.BackgroundColor3 = p36
		v_u_31.BackgroundTransparency = 0
		task.wait(p37)
		v_u_3:Create(v_u_31, TweenInfo.new(p38, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
			["BackgroundTransparency"] = 1
		}):Play()
	end
end
local function v_u_44(p40)
	-- upvalues: (ref) v_u_32, (ref) v_u_33, (ref) v_u_34
	local v41 = script:FindFirstChild("HelpJandelGui")
	if v41 then
		v_u_32 = v41:Clone()
		v_u_32.Adornee = p40
		v_u_32.Parent = p40
		local v42 = v_u_32:FindFirstChild("ImageLabel") and v_u_32.ImageLabel:FindFirstChild("Bar")
		if v42 then
			v42 = v_u_32.ImageLabel.Bar:FindFirstChild("Fill")
		end
		v_u_33 = v42
		local v43 = v_u_32:FindFirstChild("ImageLabel") and v_u_32.ImageLabel:FindFirstChild("Bar")
		if v43 then
			v43 = v_u_32.ImageLabel.Bar:FindFirstChild("Amount")
		end
		v_u_34 = v43
	else
		warn("[JandelsLastStand] script.HelpJandelGui not found")
	end
end
local function v_u_49(p45, p46)
	-- upvalues: (ref) v_u_33, (copy) v_u_3, (ref) v_u_34
	if v_u_33 then
		local v47 = p45 / p46
		local v48 = math.clamp(v47, 0, 1)
		v_u_3:Create(v_u_33, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
			["Size"] = UDim2.new(v48, 0, 1, 0)
		}):Play()
		if v_u_34 then
			v_u_34.Text = p45 .. "/" .. p46
		end
	end
end
local v_u_50 = script.Parent.Parent:FindFirstChild("Armageddon")
if v_u_50 then
	v_u_50 = v_u_50:FindFirstChild("Meteor")
end
local v_u_51 = {}
local v_u_52 = false
local function v_u_64()
	-- upvalues: (copy) v_u_50, (ref) v_u_16, (copy) v_u_51, (ref) v_u_52, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_27, (copy) v_u_7
	if v_u_50 then
		if v_u_16 then
			local v_u_53 = v_u_50:Clone()
			local v54 = math.random(-250, 250)
			local v55 = math.random(-250, 250)
			local v56 = math.random(500, 800)
			local v57 = v54 + math.random(-80, 80)
			local v58 = 5 + v56
			local v59 = v55 + math.random(-80, 80)
			v_u_53.Position = Vector3.new(v57, v58, v59)
			v_u_53.Parent = workspace:FindFirstChild("Visuals") or (workspace:FindFirstChild("WeatherVisuals") or workspace)
			local v60 = v_u_51
			table.insert(v60, v_u_53)
			if not v_u_52 then
				v_u_52 = true
				v_u_9:CreateNotification("THE MOON IS FALLING!!", nil, 5)
				task.delay(12, function()
					-- upvalues: (ref) v_u_52
					v_u_52 = false
				end)
			end
			local v61 = math.random(40, 90) * 0.1
			local v_u_62 = true
			task.spawn(function()
				-- upvalues: (copy) v_u_53, (ref) v_u_10, (ref) v_u_11, (ref) v_u_62
				while v_u_53.Parent do
					pcall(function()
						-- upvalues: (ref) v_u_53
						v_u_53.Attachment.Backlines2:Emit(4)
						v_u_53.Attachment.Ring:Emit(4)
					end)
					if math.random(1, 3) == 1 then
						pcall(function()
							-- upvalues: (ref) v_u_10, (ref) v_u_11
							v_u_10:PlaySound(v_u_11.Weather.Armageddon.whistle, {
								["PlaybackSpeed"] = 1 + math.random(-25, 25) * 0.01
							})
						end)
					end
					task.wait(0.5)
					if v_u_62 == false or not v_u_53.Parent then
						break
					end
				end
			end)
			local v_u_63 = nil
			pcall(function()
				-- upvalues: (ref) v_u_63, (ref) v_u_10, (ref) v_u_11, (copy) v_u_53
				v_u_63 = v_u_10:PlaySound(v_u_11.Weather.Armageddon.Center.loop, {
					["RollOffMaxDistance"] = 50000,
					["RollOffMinDistance"] = 100,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Loop"] = true,
					["Volume"] = 0.75
				}, nil, v_u_53.Center)
			end)
			v_u_3:Create(v_u_53, TweenInfo.new(v61, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["Position"] = Vector3.new(v54, 5, v55)
			}):Play()
			task.delay(v61, function()
				-- upvalues: (ref) v_u_62, (copy) v_u_53, (ref) v_u_63, (ref) v_u_16, (ref) v_u_27, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11
				v_u_62 = false
				if v_u_53.Parent then
					if v_u_63 then
						pcall(function()
							-- upvalues: (ref) v_u_63
							v_u_63:Stop()
						end)
					end
					if v_u_16 then
						v_u_27:Shake(v_u_7.Presets.Explosion)
					end
					pcall(function()
						-- upvalues: (ref) v_u_10, (ref) v_u_11
						v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode, {
							["RollOffMaxDistance"] = 50000,
							["RollOffMinDistance"] = 10,
							["RollOffMode"] = Enum.RollOffMode.Inverse,
							["Volume"] = 0.75,
							["PlaybackSpeed"] = 0.9
						})
					end)
					v_u_53.Transparency = 1
					pcall(function()
						-- upvalues: (ref) v_u_53
						v_u_53.End.BigBOOM:Emit(3)
						v_u_53.End.GroundBOOM.Enabled = true
						v_u_53.End.RaysBOOM.Enabled = true
					end)
					task.delay(2, function()
						-- upvalues: (ref) v_u_53
						pcall(function()
							-- upvalues: (ref) v_u_53
							v_u_53.End.GroundBOOM.Enabled = false
							v_u_53.End.RaysBOOM.Enabled = false
						end)
						game.Debris:AddItem(v_u_53, 1)
					end)
				end
			end)
		end
	else
		return
	end
end
local function v_u_69(p65)
	-- upvalues: (copy) v_u_3, (copy) v_u_29, (copy) v_u_6
	local v66 = {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}
	v_u_3:Create(v_u_29, TweenInfo.new(p65), v66):Play()
	local v67 = {
		["Ambient"] = v_u_6:GetAttribute("DefaultAmbient") or Color3.fromRGB(138, 138, 138),
		["ExposureCompensation"] = v_u_6:GetAttribute("DefaultExposure") or 0,
		["Brightness"] = v_u_6:GetAttribute("DefaultBrightness") or 2
	}
	v_u_3:Create(v_u_6, TweenInfo.new(p65), v67):Play()
	local v68 = {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}
	v_u_3:Create(v_u_6.Atmosphere, TweenInfo.new(p65), v68):Play()
end
local function v_u_74()
	-- upvalues: (ref) v_u_16, (copy) v_u_13, (copy) v_u_17, (copy) v_u_25, (copy) v_u_27, (copy) v_u_69, (copy) v_u_28, (copy) v_u_8, (copy) v_u_3, (copy) v_u_15, (ref) v_u_32, (ref) v_u_33, (ref) v_u_34, (ref) v_u_30, (copy) v_u_12, (ref) v_u_18
	v_u_16 = false
	v_u_13.Stop("JandelsLastStand")
	for _, v70 in v_u_17 do
		if typeof(v70) == "RBXScriptConnection" then
			v70:Disconnect()
		end
	end
	table.clear(v_u_17)
	for v71, v72 in v_u_25 do
		if v71.Parent then
			v71.CelestialBodiesShown = v72
		end
	end
	table.clear(v_u_25)
	v_u_27:StopSustained(2)
	v_u_69(5)
	if v_u_28 then
		v_u_8.UpdateSkybox(v_u_28, 0)
	end
	v_u_3:Create(v_u_15, TweenInfo.new(1), {
		["FieldOfView"] = 70
	}):Play()
	v_u_3:Create(workspace, TweenInfo.new(2), {
		["Gravity"] = 192.6
	}):Play()
	if v_u_32 then
		v_u_32:Destroy()
		v_u_32 = nil
	end
	v_u_33 = nil
	v_u_34 = nil
	if v_u_30 then
		v_u_30:Destroy()
		v_u_30 = nil
	end
	v_u_12:Stop()
	if v_u_18 then
		v_u_18:Stop()
		v_u_18 = nil
	end
	local v73 = workspace.Visuals:FindFirstChild("MoonfallBeam")
	if v73 then
		v_u_3:Create(v73, TweenInfo.new(1), {
			["Transparency"] = 1
		}):Play()
		game.Debris:AddItem(v73, 1.5)
	end
end
local function v_u_157()
	-- upvalues: (ref) v_u_16, (copy) v_u_13, (copy) v_u_11, (copy) v_u_35, (copy) v_u_6, (copy) v_u_25, (copy) v_u_17, (copy) v_u_28, (copy) v_u_8, (copy) v_u_3, (copy) v_u_29, (copy) v_u_10, (copy) v_u_27, (copy) v_u_7, (copy) v_u_15, (copy) v_u_64, (copy) v_u_51, (copy) v_u_9, (copy) v_u_39, (copy) v_u_12, (copy) v_u_44, (copy) v_u_2, (copy) v_u_49, (ref) v_u_32, (copy) v_u_4, (ref) v_u_33, (ref) v_u_34, (copy) v_u_24, (copy) v_u_69, (copy) v_u_74
	if not v_u_16 then
		v_u_16 = true
		v_u_13.Start("JandelsLastStand", {
			["soundId"] = v_u_11.Weather.JandelsLastStand.EpicMusic,
			["priority"] = 15,
			["volume"] = 0.75
		})
		v_u_35()
		for _, v75 in v_u_6:GetChildren() do
			if v75:IsA("Sky") then
				if v_u_25[v75] == nil then
					v_u_25[v75] = v75.CelestialBodiesShown
				end
				v75.CelestialBodiesShown = false
			end
		end
		local v76 = v_u_17
		local v77 = v_u_6.ChildAdded
		local function v79(p78)
			-- upvalues: (ref) v_u_25
			if p78:IsA("Sky") then
				if v_u_25[p78] == nil then
					v_u_25[p78] = p78.CelestialBodiesShown
				end
				p78.CelestialBodiesShown = false
			end
		end
		table.insert(v76, v77:Connect(v79))
		if (workspace:GetAttribute("JandelsLastStand_Phase") or 1) <= 1 then
			if v_u_28 then
				v_u_8.UpdateSkybox(v_u_28, 2)
			end
			local v80 = {
				["TintColor"] = Color3.fromRGB(255, 120, 80),
				["Brightness"] = 0.2,
				["Saturation"] = -0.3,
				["Contrast"] = 0.2
			}
			v_u_3:Create(v_u_29, TweenInfo.new(3), v80):Play()
			local v81 = {
				["Haze"] = 3,
				["Glare"] = 0.5,
				["Color"] = Color3.fromRGB(255, 130, 80),
				["Decay"] = Color3.fromRGB(200, 80, 50),
				["Density"] = 0.15
			}
			v_u_3:Create(v_u_6.Atmosphere, TweenInfo.new(5), v81):Play()
			local v82 = {
				["Ambient"] = Color3.fromRGB(180, 80, 50),
				["ExposureCompensation"] = 0.5,
				["Brightness"] = 1.5
			}
			v_u_3:Create(v_u_6, TweenInfo.new(5), v82):Play()
			pcall(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_11
				v_u_10:PlaySound(v_u_11.Weather.Armageddon.FlareUI.alarm, {
					["PlaybackSpeed"] = 0.5,
					["Volume"] = 0.5
				}, nil, game.SoundService)
			end)
			v_u_27:ShakeSustain(v_u_7.Presets.Earthquake)
			v_u_3:Create(workspace, TweenInfo.new(8), {
				["Gravity"] = 80
			}):Play()
			v_u_3:Create(v_u_15, TweenInfo.new(12), {
				["FieldOfView"] = 62
			}):Play()
			local v_u_83 = 4
			local v_u_84 = 3
			local v_u_85 = 6
			task.spawn(function()
				-- upvalues: (ref) v_u_16, (copy) v_u_83, (ref) v_u_64, (copy) v_u_84, (copy) v_u_85, (ref) v_u_51
				while v_u_16 and (workspace:GetAttribute("JandelsLastStand") and v_u_83 > (workspace:GetAttribute("JandelsLastStand_Phase") or 0)) do
					v_u_64()
					task.wait(v_u_84 + math.random() * (v_u_85 - v_u_84))
				end
				for _, v86 in v_u_51 do
					if v86 and v86.Parent then
						v86:Destroy()
					end
				end
				table.clear(v_u_51)
			end)
			v_u_9:CreateNotification("The moon is falling!")
			local v87 = script:FindFirstChild("Reticle")
			local v_u_88
			if v87 then
				v_u_88 = v87:Clone()
				local v90 = workspace:Raycast(Vector3.new(-104, 800, -194), Vector3.new(0, -1200, 0), ((function()
					local v89 = RaycastParams.new()
					v89.FilterDescendantsInstances = { workspace.Visuals, workspace:FindFirstChild("WeatherVisuals") }
					v89.FilterType = Enum.RaycastFilterType.Exclude
					return v89
				end)()))
				local v91 = v90 and v90.Position.Y or 5
				v_u_88:PivotTo(CFrame.new(-104, v91 + 0.1, -194))
				v_u_88.Parent = workspace.Visuals
				task.spawn(function()
					-- upvalues: (ref) v_u_88, (ref) v_u_16, (ref) v_u_3
					local v92 = 0
					while v_u_88 and (v_u_88.Parent and (v_u_16 and (workspace:GetAttribute("JandelsLastStand_Phase") or 0) < 2)) do
						v92 = v92 + task.wait(0.05)
						local v93 = v92 * 3.141592653589793 * 1.8
						local v94 = (math.sin(v93) * 0.5 + 0.5) * 0.3 + 1
						local v95 = v92 * 3.141592653589793 * v94 * 2
						local v96 = (math.sin(v95) * 0.5 + 0.5) * 0.55 + 0.15
						for _, v97 in v_u_88:GetDescendants() do
							if v97:IsA("BasePart") then
								v97.Transparency = v96
							end
						end
					end
					if v_u_88 and v_u_88.Parent then
						for _, v98 in v_u_88:GetDescendants() do
							if v98:IsA("BasePart") then
								v_u_3:Create(v98, TweenInfo.new(0.5), {
									["Transparency"] = 1
								}):Play()
							end
						end
						game.Debris:AddItem(v_u_88, 0.6)
						v_u_88 = nil
					end
				end)
			else
				v_u_88 = nil
			end
			repeat
				task.wait(0.25)
			until not v_u_16 or (workspace:GetAttribute("JandelsLastStand_Phase") or 0) >= 2
			if v_u_88 and v_u_88.Parent then
				v_u_88:Destroy()
				local _ = nil
			end
		end
		if (workspace:GetAttribute("JandelsLastStand_Phase") or 2) <= 2 and v_u_16 then
			task.spawn(function()
				-- upvalues: (ref) v_u_39
				v_u_39(Color3.fromRGB(255, 255, 255), 0.3, 1.5)
			end)
			v_u_27:Shake(v_u_7.Presets.BigExplosion)
			v_u_3:Create(v_u_15, TweenInfo.new(0.3), {
				["FieldOfView"] = 105
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_15
				v_u_3:Create(v_u_15, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					["FieldOfView"] = 75
				}):Play()
			end)
			v_u_10:PlaySound(v_u_11.Weather.SpaceTravel.SpaceEffect.Boom, {
				["Volume"] = 0.75,
				["PlaybackSpeed"] = 1
			})
			local v99 = {
				["TintColor"] = Color3.fromRGB(200, 170, 255),
				["Brightness"] = 0.15
			}
			v_u_3:Create(v_u_29, TweenInfo.new(3), v99):Play()
			v_u_3:Create(workspace, TweenInfo.new(0.3), {
				["Gravity"] = 5
			}):Play()
			task.delay(0.8, function()
				-- upvalues: (ref) v_u_3
				v_u_3:Create(workspace, TweenInfo.new(1), {
					["Gravity"] = 80
				}):Play()
			end)
			local v100 = workspace.Visuals:WaitForChild("MF_JANDEL", 5)
			if v100 then
				v_u_12:Focus(v100)
				task.delay(2.5, function()
					-- upvalues: (ref) v_u_12
					v_u_12:Stop()
				end)
			end
			v_u_9:CreateNotification("Jandel has arrived!")
			repeat
				task.wait(0.25)
			until not v_u_16 or (workspace:GetAttribute("JandelsLastStand_Phase") or 0) >= 3
		end
		if (workspace:GetAttribute("JandelsLastStand_Phase") or 3) <= 3 and v_u_16 then
			local v_u_101 = workspace.Visuals:FindFirstChild("MF_JANDEL")
			local v102 = not v_u_101 or v_u_101:FindFirstChild("HumanoidRootPart") or (v_u_101.PrimaryPart or nil)
			if v102 then
				v_u_44(v102)
			end
			local v103 = {
				["TintColor"] = Color3.fromRGB(220, 160, 180),
				["Brightness"] = 0.1,
				["Contrast"] = 0.15
			}
			v_u_3:Create(v_u_29, TweenInfo.new(2), v103):Play()
			v_u_27:StopSustained(1)
			task.delay(1, function()
				-- upvalues: (ref) v_u_16, (ref) v_u_27, (ref) v_u_7
				if v_u_16 and (workspace:GetAttribute("JandelsLastStand_Phase") or 0) == 3 then
					v_u_27:ShakeSustain(v_u_7.Presets.WeakEarthquake)
				end
			end)
			local v_u_104 = v_u_2:FindFirstChild("MoonfallHelp")
			local v_u_105 = workspace:GetAttribute("JandelsLastStand_HelpGoal") or 150
			if v_u_104 then
				v_u_49(v_u_104.Value, v_u_105)
				local v106 = v_u_104:GetPropertyChangedSignal("Value"):Connect(function()
					-- upvalues: (ref) v_u_49, (copy) v_u_104, (copy) v_u_105, (ref) v_u_10, (ref) v_u_11
					v_u_49(v_u_104.Value, v_u_105)
					v_u_10:PlaySound(v_u_11.Weather.GiantSwordPull.Budge, {
						["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000,
						["Volume"] = 0.4
					})
				end)
				local v107 = v_u_17
				table.insert(v107, v106)
			end
			local v113 = workspace:GetAttributeChangedSignal("JandelsLastStand_TimeLeft"):Connect(function()
				-- upvalues: (ref) v_u_32
				local v108 = workspace:GetAttribute("JandelsLastStand_TimeLeft") or 0
				if v_u_32 then
					local v109 = v_u_32:FindFirstChild("Timer")
					if v109 then
						local v110 = v108 / 60
						local v111 = math.floor(v110)
						local v112 = v108 % 60
						v109.Text = string.format("%d:%02d", v111, v112)
					end
				end
			end)
			local v114 = v_u_17
			table.insert(v114, v113)
			local v115 = workspace:GetAttribute("JandelsLastStand_TimeLeft") or 55
			local v116 = v_u_32 and v_u_32:FindFirstChild("Timer")
			if v116 then
				local v117 = v115 / 60
				local v118 = math.floor(v117)
				local v119 = v115 % 60
				v116.Text = string.format("%d:%02d", v118, v119)
			end
			local v128 = workspace:GetAttributeChangedSignal("JandelsLastStand_Struggle"):Connect(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_29
				local v120 = (workspace:GetAttribute("JandelsLastStand_Struggle") or 50) / 100
				local v121 = {}
				local v122 = Color3.fromRGB
				local v123 = 255 - 100 * v120
				local v124 = math.floor(v123)
				local v125 = 120 + 80 * v120
				local v126 = math.floor(v125)
				local v127 = 100 + 155 * v120
				v121.TintColor = v122(v124, v126, (math.floor(v127)))
				v_u_3:Create(v_u_29, TweenInfo.new(0.3), v121):Play()
				workspace.Gravity = 120 - 60 * v120
			end)
			local v129 = v_u_17
			table.insert(v129, v128)
			local v_u_130 = workspace.Visuals:FindFirstChild("MoonfallLazerSpot")
			if v_u_101 and v_u_130 then
				local v_u_131 = Instance.new("Part")
				v_u_131.Name = "MoonfallBeam"
				v_u_131.Anchored = true
				v_u_131.CanCollide = false
				v_u_131.CanQuery = false
				v_u_131.Transparency = 0.3
				v_u_131.Material = Enum.Material.Neon
				v_u_131.Color = Color3.fromRGB(100, 180, 255)
				v_u_131.CastShadow = false
				v_u_131.Parent = workspace.Visuals
				local v144 = v_u_4.Heartbeat:Connect(function()
					-- upvalues: (ref) v_u_16, (copy) v_u_101, (copy) v_u_130, (copy) v_u_131
					if v_u_16 then
						if v_u_101 and v_u_101.Parent then
							if v_u_130 and v_u_130.Parent then
								local v132
								if v_u_101:FindFirstChild("Head") then
									v132 = v_u_101.Head.Position
								else
									v132 = v_u_101:GetPivot().Position + Vector3.new(0, 5, 0)
								end
								local v133 = v_u_130.Position
								local v134 = (v132 + v133) / 2
								local v135 = (v132 - v133).Magnitude
								v_u_131.Size = Vector3.new(2, 2, v135)
								v_u_131.CFrame = CFrame.lookAt(v134, v133)
								local v136 = (workspace:GetAttribute("JandelsLastStand_Struggle") or 50) / 100
								local v137 = v_u_131
								local v138 = Color3.fromRGB
								local v139 = 255 - 155 * v136
								local v140 = math.floor(v139)
								local v141 = 100 + 80 * v136
								local v142 = math.floor(v141)
								local v143 = 150 + 105 * v136
								v137.Color = v138(v140, v142, (math.floor(v143)))
							end
						else
							return
						end
					else
						return
					end
				end)
				local v145 = v_u_17
				table.insert(v145, v144)
			end
			v_u_9:CreateNotification("Help Jandel push back the moon! Get close to Jandel and interact!")
			repeat
				task.wait(0.25)
			until not v_u_16 or (workspace:GetAttribute("JandelsLastStand_Phase") or 0) >= 4
		end
		if v_u_32 then
			v_u_32:Destroy()
			v_u_32 = nil
		end
		v_u_33 = nil
		v_u_34 = nil
		if (workspace:GetAttribute("JandelsLastStand_Phase") or 4) <= 4 and v_u_16 then
			local v_u_146 = workspace:GetAttribute("JandelsLastStand_GoalReached")
			if v_u_146 then
				local v147 = {
					["TintColor"] = Color3.fromRGB(180, 200, 255),
					["Brightness"] = 0.3,
					["Contrast"] = 0.2
				}
				v_u_3:Create(v_u_29, TweenInfo.new(2), v147):Play()
			else
				local v148 = {
					["TintColor"] = Color3.fromRGB(200, 140, 130),
					["Brightness"] = 0.1,
					["Contrast"] = 0.3
				}
				v_u_3:Create(v_u_29, TweenInfo.new(2), v148):Play()
			end
			v_u_27:StopSustained(0.5)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_16, (copy) v_u_146, (ref) v_u_27, (ref) v_u_7
				if v_u_16 then
					if v_u_146 then
						v_u_27:ShakeSustain(v_u_7.Presets.Earthquake)
						return
					end
					v_u_27:ShakeSustain(v_u_7.Presets.WeakEarthquake)
				end
			end)
			v_u_10:PlaySound(v_u_11.Weather.FlamingoLazer.Charge, {
				["Volume"] = v_u_146 and 3 or 1.2,
				["PlaybackSpeed"] = v_u_146 and 0.8 or 0.5
			})
			v_u_3:Create(v_u_15, TweenInfo.new(4), {
				["FieldOfView"] = v_u_146 and 60 or 65
			}):Play()
			v_u_3:Create(v_u_6.Atmosphere, TweenInfo.new(4), {
				["Density"] = v_u_146 and 0.3 or 0.15,
				["Haze"] = v_u_146 and 1 or 0.5
			}):Play()
			v_u_3:Create(v_u_29, TweenInfo.new(4), {
				["Brightness"] = v_u_146 and 0.5 or 0.15
			}):Play()
			repeat
				task.wait(0.25)
			until not v_u_16 or (workspace:GetAttribute("JandelsLastStand_Phase") or 0) >= 5
		end
		if (workspace:GetAttribute("JandelsLastStand_Phase") or 5) <= 5 and v_u_16 then
			local v149 = workspace:GetAttribute("JandelsLastStand_GoalReached")
			local v150 = workspace.Visuals:FindFirstChild("MoonfallBeam")
			if v150 then
				v_u_3:Create(v150, TweenInfo.new(1), {
					["Transparency"] = 1
				}):Play()
				game.Debris:AddItem(v150, 1.5)
			end
			if v149 then
				task.spawn(function()
					-- upvalues: (ref) v_u_39
					v_u_39(Color3.fromRGB(255, 255, 255), 0.5, 3)
				end)
				v_u_27:StopSustained(0)
				v_u_27:Shake(v_u_7.Presets.BigExplosion)
				v_u_3:Create(v_u_15, TweenInfo.new(0.2), {
					["FieldOfView"] = 115
				}):Play()
				task.delay(0.5, function()
					-- upvalues: (ref) v_u_3, (ref) v_u_15
					v_u_3:Create(v_u_15, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
						["FieldOfView"] = 70
					}):Play()
				end)
				v_u_24()
				v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode, {
					["Volume"] = 0.75,
					["PlaybackSpeed"] = 0.9
				})
				v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode2, {
					["Volume"] = 0.75
				})
				v_u_10:PlaySound(v_u_11.Weather.Armageddon.pre, {
					["Volume"] = 0.75,
					["PlaybackSpeed"] = 0.8
				})
				task.spawn(function()
					-- upvalues: (ref) v_u_4
					local v151 = Instance.new("Part")
					v151.Name = "MoonfallShockwave"
					v151.Shape = Enum.PartType.Cylinder
					v151.Anchored = true
					v151.CanCollide = false
					v151.CanQuery = false
					v151.Material = Enum.Material.Neon
					v151.Color = Color3.fromRGB(180, 220, 255)
					v151.CastShadow = false
					v151.Size = Vector3.new(2, 4, 4)
					v151.Transparency = 0.3
					v151.CFrame = CFrame.new(-104, 100, -194) * CFrame.Angles(0, 0, 1.5707963267948966)
					v151.Parent = workspace.Visuals
					local v152 = 0
					while v152 < 3 do
						v152 = v152 + v_u_4.Heartbeat:Wait()
						local v153 = v152 / 3
						local v154 = v153 * 2000 + 4
						v151.Size = Vector3.new(2, v154, v154)
						v151.Transparency = v153 * 0.7 + 0.3
					end
					v151:Destroy()
				end)
				v_u_3:Create(workspace, TweenInfo.new(0.2), {
					["Gravity"] = 0
				}):Play()
				task.delay(2, function()
					-- upvalues: (ref) v_u_3, (ref) v_u_27, (ref) v_u_7
					v_u_3:Create(workspace, TweenInfo.new(0.3), {
						["Gravity"] = 250
					}):Play()
					v_u_27:Shake(v_u_7.Presets.Bump)
					task.delay(0.5, function()
						-- upvalues: (ref) v_u_3
						v_u_3:Create(workspace, TweenInfo.new(1), {
							["Gravity"] = 192.6
						}):Play()
					end)
				end)
				local v155 = {
					["TintColor"] = Color3.fromRGB(230, 240, 255),
					["Brightness"] = 0.4,
					["Saturation"] = 0.1
				}
				v_u_3:Create(v_u_29, TweenInfo.new(1), v155):Play()
				task.delay(3, function()
					-- upvalues: (ref) v_u_69
					v_u_69(5)
				end)
				task.delay(4, function()
					-- upvalues: (ref) v_u_28, (ref) v_u_8
					if v_u_28 then
						v_u_8.UpdateSkybox(v_u_28, 0)
					end
				end)
			else
				task.spawn(function()
					-- upvalues: (ref) v_u_39
					v_u_39(Color3.fromRGB(180, 80, 60), 0.8, 4)
				end)
				v_u_27:StopSustained(0.5)
				v_u_27:Shake(v_u_7.Presets.Bump)
				v_u_3:Create(v_u_15, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["FieldOfView"] = 70
				}):Play()
				v_u_10:PlaySound(v_u_11.Weather.Armageddon.End.explode, {
					["Volume"] = 0.75,
					["PlaybackSpeed"] = 0.6
				})
				v_u_3:Create(workspace, TweenInfo.new(4), {
					["Gravity"] = 192.6
				}):Play()
				local v156 = {
					["TintColor"] = Color3.fromRGB(200, 180, 170),
					["Brightness"] = -0.05,
					["Saturation"] = -0.3,
					["Contrast"] = 0.1
				}
				v_u_3:Create(v_u_29, TweenInfo.new(2), v156):Play()
				task.delay(4, function()
					-- upvalues: (ref) v_u_69
					v_u_69(6)
				end)
				task.delay(5, function()
					-- upvalues: (ref) v_u_28, (ref) v_u_8
					if v_u_28 then
						v_u_8.UpdateSkybox(v_u_28, 0)
					end
				end)
			end
			repeat
				task.wait(0.25)
			until not v_u_16
		end
		v_u_74()
	end
end
workspace:GetAttributeChangedSignal("JandelsLastStand"):Connect(function()
	-- upvalues: (copy) v_u_157, (ref) v_u_16, (copy) v_u_74
	if workspace:GetAttribute("JandelsLastStand") then
		task.defer(v_u_157)
		return
	elseif v_u_16 then
		v_u_74()
	end
end)
if workspace:GetAttribute("JandelsLastStand") then
	task.defer(v_u_157)
end
return v1