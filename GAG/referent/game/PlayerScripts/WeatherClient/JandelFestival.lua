local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("CollectionService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("Lighting")
local v_u_8 = game:GetService("Debris")
local v_u_9 = require(v_u_2.Modules.Notification)
local v_u_10 = require(v_u_2.Code.CameraShaker)
local v_u_11 = require(v_u_2.Modules.WeatherMusicManager)
local v_u_13 = v_u_10.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
v_u_13:Start()
local v_u_14 = {
	Color3.fromRGB(255, 40, 180),
	Color3.fromRGB(40, 200, 255),
	Color3.fromRGB(255, 200, 0),
	Color3.fromRGB(60, 255, 80),
	Color3.fromRGB(200, 50, 255),
	Color3.fromRGB(255, 100, 30),
	Color3.fromRGB(255, 60, 60),
	Color3.fromRGB(80, 120, 255)
}
local v_u_15 = { "rbxassetid://182435998", "rbxassetid://182436842", "rbxassetid://182436935" }
local v_u_16 = false
local v_u_17 = {}
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = v_u_7.ColorCorrection:Clone()
v_u_22.Name = script.Name
v_u_22.Parent = v_u_7
local function v_u_27()
	-- upvalues: (copy) v_u_6, (copy) v_u_15, (ref) v_u_20
	local v23 = v_u_6.LocalPlayer.Character
	if v23 then
		local v24 = v23:FindFirstChildOfClass("Humanoid")
		if v24 then
			local v25 = v24:FindFirstChildOfClass("Animator")
			if v25 then
				local v26 = Instance.new("Animation")
				v26.AnimationId = v_u_15[math.random(1, #v_u_15)]
				v_u_20 = v25:LoadAnimation(v26)
				v_u_20.Priority = Enum.AnimationPriority.Action4
				v_u_20.Looped = true
				v_u_20:Play()
			end
		else
			return
		end
	else
		return
	end
end
local v_u_28 = {}
local function v_u_57(p_u_29, p_u_30)
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (ref) v_u_16, (copy) v_u_28, (ref) v_u_18, (copy) v_u_5
	local v_u_31 = Instance.new("Part")
	v_u_31.Name = "FestivalHub"
	v_u_31.Size = Vector3.new(1, 1, 1)
	v_u_31.Transparency = 1
	v_u_31.Anchored = true
	v_u_31.CanCollide = false
	v_u_31.CanQuery = false
	v_u_31.CastShadow = false
	v_u_31.CFrame = CFrame.new(p_u_29, 155, p_u_30)
	v_u_31.Parent = workspace.WeatherVisuals
	local v32 = v_u_17
	table.insert(v32, v_u_31)
	local v_u_33 = Instance.new("Attachment")
	v_u_33.Parent = v_u_31
	local v_u_34 = {}
	for v35 = 1, 10 do
		local v36 = v_u_14[(v35 - 1) % #v_u_14 + 1]
		local v37 = Instance.new("Part")
		v37.Name = "FestivalTarget"
		v37.Size = Vector3.new(1, 1, 1)
		v37.Transparency = 1
		v37.Anchored = true
		v37.CanCollide = false
		v37.CanQuery = false
		v37.CastShadow = false
		v37.CFrame = CFrame.new(p_u_29, 1, p_u_30)
		v37.Parent = workspace.WeatherVisuals
		local v38 = v_u_17
		table.insert(v38, v37)
		local v39 = Instance.new("Attachment")
		v39.Parent = v37
		local v40 = Instance.new("Beam")
		v40.Attachment0 = v_u_33
		v40.Attachment1 = v39
		v40.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.25, v36), ColorSequenceKeypoint.new(1, v36:Lerp(Color3.fromRGB(0, 0, 0), 0.55)) })
		v40.Width0 = 1.85
		v40.Width1 = 0.38
		v40.LightEmission = 0.95
		v40.LightInfluence = 0
		v40.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.8, 0.1), NumberSequenceKeypoint.new(1, 0.9) })
		v40.FaceCamera = false
		v40.Segments = 4
		v40.Parent = v_u_31
		v_u_34[v35] = {
			["att"] = v39,
			["baseAngle"] = (v35 - 1) / 10 * 3.141592653589793 * 2,
			["color"] = v36
		}
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_28, (ref) v_u_14, (copy) v_u_33, (copy) v_u_31
		for v41 = 1, 5 do
			local v42 = workspace.Visuals:WaitForChild("FestivalGroundSpot_" .. v41, 15)
			if not (v42 and v_u_16) then
				break
			end
			local v43 = v_u_28
			table.insert(v43, v42)
			local v44 = Instance.new("Attachment")
			v44.Parent = v42
			local v45 = v_u_14[(v41 - 1) % #v_u_14 + 1]
			local v46 = Instance.new("Beam")
			v46.Attachment0 = v_u_33
			v46.Attachment1 = v44
			v46.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.15, v45), ColorSequenceKeypoint.new(1, v45) })
			v46.Width0 = 4
			v46.Width1 = 2
			v46.LightEmission = 1
			v46.LightInfluence = 0
			v46.Transparency = NumberSequence.new(0)
			v46.FaceCamera = false
			v46.Segments = 2
			v46.Parent = v_u_31
		end
	end)
	local v_u_47 = 0
	v_u_18 = v_u_5.Heartbeat:Connect(function(p48)
		-- upvalues: (ref) v_u_47, (copy) v_u_34, (copy) p_u_29, (copy) p_u_30
		v_u_47 = v_u_47 + p48 * 0.4
		for v49, v50 in v_u_34 do
			local v51 = v_u_47 + v50.baseAngle
			local v52 = v_u_47 * 0.4 + v49
			local v53 = (math.sin(v52) * 0.5 + 0.5) * 200 + 180
			local v54 = v50.att
			local v55 = p_u_29 + v53 * math.cos(v51)
			local v56 = p_u_30 + v53 * math.sin(v51)
			v54.WorldPosition = Vector3.new(v55, 1, v56)
		end
	end)
end
local function v_u_80(p_u_58, p_u_59)
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (ref) v_u_19, (copy) v_u_5
	local v60 = Instance.new("Part")
	v60.Size = Vector3.new(1, 1, 1)
	v60.Transparency = 1
	v60.Anchored = true
	v60.CanCollide = false
	v60.CanQuery = false
	v60.CastShadow = false
	v60.CFrame = CFrame.new(p_u_58, 147, p_u_59)
	v60.Parent = workspace.WeatherVisuals
	local v61 = v_u_17
	table.insert(v61, v60)
	local v62 = Instance.new("Attachment")
	v62.Parent = v60
	local v_u_63 = {}
	for v64 = 1, 7 do
		local v65 = v_u_14[(v64 + 2) % #v_u_14 + 1]
		local v66 = Instance.new("Part")
		v66.Size = Vector3.new(1, 1, 1)
		v66.Transparency = 1
		v66.Anchored = true
		v66.CanCollide = false
		v66.CanQuery = false
		v66.CastShadow = false
		v66.CFrame = CFrame.new(p_u_58, 1, p_u_59)
		v66.Parent = workspace.WeatherVisuals
		local v67 = v_u_17
		table.insert(v67, v66)
		local v68 = Instance.new("Attachment")
		v68.Parent = v66
		local v69 = Instance.new("Beam")
		v69.Attachment0 = v62
		v69.Attachment1 = v68
		v69.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.3, v65), ColorSequenceKeypoint.new(1, v65:Lerp(Color3.fromRGB(0, 0, 0), 0.5)) })
		v69.Width0 = 2.6
		v69.Width1 = 0.22
		v69.LightEmission = 0.92
		v69.LightInfluence = 0
		v69.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.7, 0.05), NumberSequenceKeypoint.new(1, 1) })
		v69.FaceCamera = false
		v69.Segments = 3
		v69.Parent = v60
		v_u_63[v64] = {
			["att"] = v68,
			["baseAngle"] = (v64 - 1) / 7 * 3.141592653589793 * 2
		}
	end
	local v_u_70 = 0
	v_u_19 = v_u_5.Heartbeat:Connect(function(p71)
		-- upvalues: (ref) v_u_70, (copy) v_u_63, (copy) p_u_58, (copy) p_u_59
		v_u_70 = v_u_70 + p71 * -0.6
		for v72, v73 in v_u_63 do
			local v74 = v_u_70 + v73.baseAngle
			local v75 = v_u_70 * 0.55 + v72 * 1.7
			local v76 = (math.sin(v75) * 0.5 + 0.5) * 200 + 180
			local v77 = v73.att
			local v78 = p_u_58 + v76 * math.cos(v74)
			local v79 = p_u_59 + v76 * math.sin(v74)
			v77.WorldPosition = Vector3.new(v78, 1, v79)
		end
	end)
end
local function v_u_89(p81, p82, p83)
	-- upvalues: (copy) v_u_14, (copy) v_u_4, (copy) v_u_8
	local v84 = v_u_14[p83:NextInteger(1, #v_u_14)]
	local v85 = p81 + p83:NextNumber(-220, 220)
	local v86 = p82 + p83:NextNumber(-220, 220)
	local v_u_87 = Instance.new("Part")
	v_u_87.Name = "FestivalPillar"
	v_u_87.Size = Vector3.new(4, 1, 4)
	v_u_87.Anchored = true
	v_u_87.CanCollide = false
	v_u_87.CanQuery = false
	v_u_87.CastShadow = false
	v_u_87.Material = Enum.Material.Neon
	v_u_87.Color = v84
	v_u_87.Transparency = 0
	v_u_87.CFrame = CFrame.new(v85, 0.5, v86)
	v_u_87.Parent = workspace.WeatherVisuals
	local v_u_88 = Instance.new("PointLight")
	v_u_88.Color = v84
	v_u_88.Brightness = 19
	v_u_88.Range = 112
	v_u_88.Parent = v_u_87
	v_u_4:Create(v_u_87, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		["Size"] = Vector3.new(4, 240, 4),
		["CFrame"] = CFrame.new(v85, 120, v86)
	}):Play()
	task.delay(0.4, function()
		-- upvalues: (copy) v_u_87, (ref) v_u_4, (copy) v_u_88, (ref) v_u_8
		if v_u_87.Parent then
			v_u_4:Create(v_u_87, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Transparency"] = 1
			}):Play()
			v_u_4:Create(v_u_88, TweenInfo.new(0.7), {
				["Brightness"] = 0,
				["Range"] = 0
			}):Play()
			v_u_8:AddItem(v_u_87, 1)
		end
	end)
end
local v_u_90 = Random.new()
local function v_u_100(p91, p92)
	-- upvalues: (copy) v_u_14, (copy) v_u_90, (copy) v_u_4, (copy) v_u_8
	local v93 = v_u_14[v_u_90:NextInteger(1, #v_u_14)]
	local v94 = p91 + v_u_90:NextNumber(-250, 250)
	local v95 = p92 + v_u_90:NextNumber(-250, 250)
	local v96 = 55 + v_u_90:NextNumber() * 90
	local v97 = Instance.new("Part")
	v97.Name = "FestivalFirework"
	v97.Size = Vector3.new(1, 1, 1)
	v97.Anchored = true
	v97.CanCollide = false
	v97.CanQuery = false
	v97.CastShadow = false
	v97.Material = Enum.Material.Neon
	v97.Color = v93
	v97.Transparency = 0
	v97.CFrame = CFrame.new(v94, v96, v95)
	local v98 = Instance.new("SpecialMesh")
	v98.MeshType = Enum.MeshType.Sphere
	v98.Scale = Vector3.new(1, 1, 1)
	v98.Parent = v97
	local v99 = Instance.new("PointLight")
	v99.Color = v93
	v99.Brightness = 16
	v99.Range = 78
	v99.Parent = v97
	v97.Parent = workspace.WeatherVisuals
	v_u_4:Create(v98, TweenInfo.new(0.78, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Scale"] = Vector3.new(24, 24, 24)
	}):Play()
	v_u_4:Create(v97, TweenInfo.new(0.78, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		["Transparency"] = 1
	}):Play()
	v_u_4:Create(v99, TweenInfo.new(0.78), {
		["Range"] = 0,
		["Brightness"] = 0
	}):Play()
	v_u_8:AddItem(v97, 0.92)
end
local function v_u_101()
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_22
	v_u_4:Create(v_u_7, TweenInfo.new(4), {
		["Ambient"] = v_u_7:GetAttribute("DefaultAmbient") or Color3.fromRGB(70, 70, 70),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ExposureCompensation"] = v_u_7:GetAttribute("DefaultExposure") or 0,
		["Brightness"] = v_u_7:GetAttribute("DefaultBrightness") or 2
	}):Play()
	v_u_4:Create(v_u_7.Atmosphere, TweenInfo.new(4), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_4:Create(v_u_22, TweenInfo.new(4), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0,
		["Contrast"] = 0,
		["Brightness"] = 0
	}):Play()
end
local function v_u_120()
	-- upvalues: (ref) v_u_16, (copy) v_u_11, (copy) v_u_2, (copy) v_u_13, (copy) v_u_10, (copy) v_u_4, (copy) v_u_22, (copy) v_u_7, (copy) v_u_9, (copy) v_u_27, (copy) v_u_57, (copy) v_u_80, (copy) v_u_14, (copy) v_u_89, (copy) v_u_100, (copy) v_u_90, (copy) v_u_28, (copy) v_u_3, (copy) v_u_21, (ref) v_u_18, (ref) v_u_19, (copy) v_u_17, (ref) v_u_20, (copy) v_u_101
	if not v_u_16 then
		v_u_16 = true
		v_u_11.Start("JandelFestival", {
			["priority"] = 12
		})
		local v102 = v_u_2.StrikeLightningHere
		local v_u_103 = v102.CFrame.Position.X
		local v_u_104 = v102.CFrame.Position.Z
		v_u_13:Shake(v_u_10.Presets.Explosion)
		v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.35), {
			["FieldOfView"] = 90
		}):Play()
		task.delay(0.4, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_4
			if v_u_16 then
				v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					["FieldOfView"] = 70
				}):Play()
			end
		end)
		v_u_4:Create(v_u_22, TweenInfo.new(1.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			["TintColor"] = Color3.fromRGB(255, 220, 245),
			["Brightness"] = 0.07,
			["Saturation"] = 0.12,
			["Contrast"] = 0.06
		}):Play()
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_4, (ref) v_u_7
			if v_u_16 then
				v_u_4:Create(v_u_7, TweenInfo.new(2), {
					["Ambient"] = Color3.fromRGB(90, 170, 235),
					["OutdoorAmbient"] = Color3.fromRGB(80, 80, 120),
					["Brightness"] = 1.4
				}):Play()
				v_u_4:Create(v_u_7.Atmosphere, TweenInfo.new(2), {
					["Density"] = 0.35,
					["Haze"] = 1.8,
					["Offset"] = 0.8,
					["Color"] = Color3.fromRGB(40, 20, 60),
					["Decay"] = Color3.fromRGB(30, 15, 50)
				}):Play()
			end
		end)
		v_u_9:CreateNotification("Jandel drops the ultimate garden festival. The whole garden is partying!")
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_27
			if v_u_16 then
				v_u_27()
			end
		end)
		local v_u_105 = Random.new()
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_57, (copy) v_u_103, (copy) v_u_104
			if v_u_16 then
				v_u_57(v_u_103, v_u_104)
			end
		end)
		task.delay(0.4, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_80, (copy) v_u_103, (copy) v_u_104
			if v_u_16 then
				v_u_80(v_u_103, v_u_104)
			end
		end)
		task.delay(1.75, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_14, (ref) v_u_4, (ref) v_u_22
			if v_u_16 then
				local v_u_106 = 1
				task.spawn(function()
					-- upvalues: (ref) v_u_16, (ref) v_u_14, (ref) v_u_106, (ref) v_u_4, (ref) v_u_22
					while v_u_16 do
						local v107 = v_u_14[v_u_106]
						v_u_106 = v_u_106 % #v_u_14 + 1
						local v108 = {
							["TintColor"] = v107,
							["Saturation"] = 0.58,
							["Contrast"] = 0.12,
							["Brightness"] = 0.05
						}
						v_u_4:Create(v_u_22, TweenInfo.new(1.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v108):Play()
						task.wait(1.35)
					end
				end)
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_16, (copy) v_u_105, (ref) v_u_89, (copy) v_u_103, (copy) v_u_104
			task.wait(1.5)
			while v_u_16 do
				for _ = 1, v_u_105:NextInteger(2, 3) do
					v_u_89(v_u_103, v_u_104, v_u_105)
					task.wait(v_u_105:NextNumber(0.1, 0.26))
				end
				task.wait(2.8 + v_u_105:NextNumber() * 3.2)
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_100, (copy) v_u_103, (copy) v_u_104, (ref) v_u_90
			task.wait(0.55)
			while v_u_16 do
				v_u_100(v_u_103, v_u_104)
				task.wait(0.42 + v_u_90:NextNumber() * 0.62)
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_28, (ref) v_u_3, (ref) v_u_21
			while true do
				if not v_u_16 then
					return
				end
				task.wait(1.5)
				if #v_u_28 ~= 0 then
					for _, v109 in v_u_3:GetTagged("Harvestable") do
						if v109:IsDescendantOf(workspace) then
							local v110 = v109.PrimaryPart
							if v110 then
								local v111 = false
								for _, v112 in v_u_28 do
									if v112.Parent then
										local v113 = v110.Position.X - v112.Position.X
										local v114 = v110.Position.Z - v112.Position.Z
										if v113 * v113 + v114 * v114 <= 625 then
											v111 = true
											break
										end
									end
								end
								if v111 then
									for _, v115 in v109:GetDescendants() do
										if v115:IsA("BasePart") and v115.Material ~= Enum.Material.Neon then
											if not v_u_21[v115] then
												v_u_21[v115] = v115.Material
											end
											v115.Material = Enum.Material.Neon
										end
									end
								end
							end
						end
					end
				end
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_18, (ref) v_u_19, (ref) v_u_17, (ref) v_u_28, (ref) v_u_20, (ref) v_u_21, (ref) v_u_3, (ref) v_u_11, (ref) v_u_4, (ref) v_u_101
			while v_u_16 do
				task.wait(0.25)
			end
			if v_u_18 then
				v_u_18:Disconnect()
				v_u_18 = nil
			end
			if v_u_19 then
				v_u_19:Disconnect()
				v_u_19 = nil
			end
			for _, v116 in v_u_17 do
				if v116 and v116.Parent then
					v116:Destroy()
				end
			end
			table.clear(v_u_17)
			table.clear(v_u_28)
			if v_u_20 then
				v_u_20:Stop()
				v_u_20 = nil
			end
			for v117, v118 in v_u_21 do
				if v117 and v117.Parent then
					v117.Material = v118
				end
			end
			table.clear(v_u_21)
			for _, v119 in v_u_3:GetTagged("JandelFestivalMusic") do
				if v119:IsA("Sound") then
					v119:Stop()
					v119:Destroy()
				end
			end
			v_u_11.Stop("JandelFestival")
			v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["FieldOfView"] = 70
			}):Play()
			v_u_101()
		end)
	end
end
workspace:GetAttributeChangedSignal("JandelFestival"):Connect(function()
	-- upvalues: (copy) v_u_120, (ref) v_u_16
	if workspace:GetAttribute("JandelFestival") then
		v_u_120()
		return
	elseif v_u_16 then
		v_u_16 = false
	end
end)
if workspace:GetAttribute("JandelFestival") then
	task.defer(v_u_120)
elseif v_u_16 then
	v_u_16 = false
end
return v1