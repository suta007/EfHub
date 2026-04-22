local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Lighting")
local v_u_4 = game:GetService("Debris")
local v5 = game:GetService("ReplicatedStorage")
local v6 = require(v5.Code.CameraShaker)
local v_u_7 = require(v5.Modules.WeatherMusicManager)
local v_u_8 = require(v5.Data.SoundData)
local v_u_9 = workspace.CurrentCamera
local v10 = script:WaitForChild("Animations")
local v_u_11 = v10:WaitForChild("Sammy")
local v_u_12 = v10:WaitForChild("Jandel")
local v_u_13 = v10:WaitForChild("Ball")
local v_u_14 = v10:WaitForChild("Jhai")
local v_u_15 = script:WaitForChild("Bounce")
local v_u_16 = script:WaitForChild("Boom")
local v_u_17 = script:WaitForChild("Explosion2")
local v_u_18 = script:WaitForChild("FireKick")
local v19 = v_u_3:FindFirstChild("ColorCorrection")
local v_u_20
if v19 then
	v_u_20 = v19:Clone()
else
	v_u_20 = Instance.new("ColorCorrectionEffect")
end
v_u_20.Name = "SammysReturn"
v_u_20.Parent = v_u_3
local v_u_21 = Instance.new("BloomEffect")
v_u_21.Name = "SammysReturn_Bloom"
v_u_21.Intensity = 0
v_u_21.Size = 24
v_u_21.Threshold = 1.1
v_u_21.Enabled = true
v_u_21.Parent = v_u_3
local v_u_23 = v6.new(Enum.RenderPriority.Camera.Value, function(p22)
	-- upvalues: (copy) v_u_9
	v_u_9.CFrame = v_u_9.CFrame * p22
end)
local v_u_24 = false
local v_u_25 = {}
local v_u_26 = {}
local v_u_27 = nil
local v_u_28 = nil
local function v_u_32(p29)
	local v30 = p29:FindFirstChildOfClass("Humanoid")
	if v30 then
		return v30:FindFirstChildOfClass("Animator")
	else
		local v31 = p29:FindFirstChildOfClass("AnimationController")
		if v31 then
			return v31:FindFirstChildOfClass("Animator") or v31:FindFirstChild("Animator")
		else
			return nil
		end
	end
end
local function v_u_39(p33, p34, p35)
	-- upvalues: (copy) v_u_26
	if v_u_26[p33] then
		return v_u_26[p33]
	end
	local v36 = {}
	for _, v37 in p34:GetChildren() do
		if v37:IsA("Animation") then
			local v38 = p35:LoadAnimation(v37)
			v38:Play()
			v38:Stop()
			v36[v37.Name] = v38
		end
	end
	v_u_26[p33] = v36
	return v36
end
local function v_u_40()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_20
	v_u_2:Create(v_u_3, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
		["Ambient"] = Color3.fromRGB(75, 65, 90),
		["OutdoorAmbient"] = Color3.fromRGB(100, 85, 110),
		["ExposureCompensation"] = 0.05
	}):Play()
	v_u_2:Create(v_u_3.Atmosphere, TweenInfo.new(2.5), {
		["Density"] = 0.06,
		["Haze"] = 0.3,
		["Color"] = Color3.fromRGB(220, 200, 255),
		["Decay"] = Color3.fromRGB(200, 180, 240),
		["Glare"] = 0.08
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(2.5), {
		["TintColor"] = Color3.fromRGB(240, 230, 255),
		["Saturation"] = 0.12,
		["Contrast"] = 0.04,
		["Brightness"] = 0.04
	}):Play()
end
local function v_u_41()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_20, (copy) v_u_21
	v_u_2:Create(v_u_3, TweenInfo.new(4), {
		["Ambient"] = v_u_3:GetAttribute("DefaultAmbient") or Color3.fromRGB(70, 70, 70),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ExposureCompensation"] = v_u_3:GetAttribute("DefaultExposure") or 0,
		["Brightness"] = v_u_3:GetAttribute("DefaultBrightness") or 2
	}):Play()
	v_u_2:Create(v_u_3.Atmosphere, TweenInfo.new(4), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(4), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0,
		["Contrast"] = 0,
		["Brightness"] = 0
	}):Play()
	v_u_2:Create(v_u_21, TweenInfo.new(4), {
		["Intensity"] = 0,
		["Threshold"] = 1.1
	}):Play()
end
local v_u_42 = Color3.fromRGB(240, 230, 255)
local function v_u_46(p43, p44)
	-- upvalues: (copy) v_u_20, (copy) v_u_42, (copy) v_u_2, (copy) v_u_21, (copy) v_u_3
	local v45 = {
		["TintColor"] = v_u_42,
		["Saturation"] = 0.12,
		["Contrast"] = 0.04,
		["Brightness"] = 0.04
	}
	v_u_2:Create(v_u_20, TweenInfo.new(p43, p44 or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v45):Play()
	v_u_2:Create(v_u_21, TweenInfo.new(p43, p44 or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Intensity"] = 0,
		["Threshold"] = 1.1
	}):Play()
	v_u_2:Create(v_u_3, TweenInfo.new(p43, p44 or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["ExposureCompensation"] = 0.05
	}):Play()
end
local function v_u_57()
	-- upvalues: (copy) v_u_20, (copy) v_u_2, (copy) v_u_21, (copy) v_u_3
	local v47 = v_u_20
	local v48 = {
		["TintColor"] = Color3.fromRGB(130, 255, 160),
		["Saturation"] = 0.45,
		["Contrast"] = 0.18,
		["Brightness"] = 0.15
	}
	local v49 = Enum.EasingStyle.Sine
	local v50 = Enum.EasingDirection.In
	v_u_2:Create(v47, TweenInfo.new(3.5, v49 or Enum.EasingStyle.Quad, v50 or Enum.EasingDirection.Out), v48):Play()
	local v51 = v_u_21
	local v52 = Enum.EasingStyle.Sine
	local v53 = Enum.EasingDirection.In
	v_u_2:Create(v51, TweenInfo.new(3.5, v52 or Enum.EasingStyle.Quad, v53 or Enum.EasingDirection.Out), {
		["Intensity"] = 0.8,
		["Threshold"] = 0.6
	}):Play()
	local v54 = v_u_3
	local v55 = Enum.EasingStyle.Sine
	local v56 = Enum.EasingDirection.In
	v_u_2:Create(v54, TweenInfo.new(3.5, v55 or Enum.EasingStyle.Quad, v56 or Enum.EasingDirection.Out), {
		["ExposureCompensation"] = 0.5
	}):Play()
end
local function v_u_68()
	-- upvalues: (copy) v_u_20, (copy) v_u_2, (copy) v_u_21, (copy) v_u_3
	local v58 = v_u_20
	local v59 = {
		["TintColor"] = Color3.fromRGB(255, 120, 110),
		["Saturation"] = 0.45,
		["Contrast"] = 0.18,
		["Brightness"] = 0.15
	}
	local v60 = Enum.EasingStyle.Sine
	local v61 = Enum.EasingDirection.In
	v_u_2:Create(v58, TweenInfo.new(3, v60 or Enum.EasingStyle.Quad, v61 or Enum.EasingDirection.Out), v59):Play()
	local v62 = v_u_21
	local v63 = Enum.EasingStyle.Sine
	local v64 = Enum.EasingDirection.In
	v_u_2:Create(v62, TweenInfo.new(3, v63 or Enum.EasingStyle.Quad, v64 or Enum.EasingDirection.Out), {
		["Intensity"] = 0.8,
		["Threshold"] = 0.6
	}):Play()
	local v65 = v_u_3
	local v66 = Enum.EasingStyle.Sine
	local v67 = Enum.EasingDirection.In
	v_u_2:Create(v65, TweenInfo.new(3, v66 or Enum.EasingStyle.Quad, v67 or Enum.EasingDirection.Out), {
		["ExposureCompensation"] = 0.5
	}):Play()
end
local function v_u_73()
	-- upvalues: (copy) v_u_23, (copy) v_u_20, (copy) v_u_21, (copy) v_u_3, (copy) v_u_46, (copy) v_u_16, (copy) v_u_4, (copy) v_u_32, (copy) v_u_39, (copy) v_u_11
	if workspace:GetAttribute("SammysReturn_SammyAppear") then
		v_u_23:ShakeOnce(3, 6, 0.2, 0.8)
		v_u_20.TintColor = Color3.fromRGB(60, 255, 100)
		v_u_20.Saturation = 0.7
		v_u_20.Contrast = 0.3
		v_u_20.Brightness = 0.45
		v_u_21.Intensity = 1.6
		v_u_21.Threshold = 0.35
		v_u_3.ExposureCompensation = 1
		v_u_46(3)
		local v69 = v_u_16:Clone()
		v69.Volume = 2
		v69.Parent = workspace
		v69:Play()
		v_u_4:AddItem(v69, v69.TimeLength + 1)
		local v70 = workspace:FindFirstChild("BW_SAMMY")
		if v70 then
			local v71 = v_u_32(v70)
			if v71 then
				local v72 = v_u_39("Sammy", v_u_11, v71)
				if v72.Idle then
					v72.Idle:Play(0)
				end
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_78()
	-- upvalues: (copy) v_u_23, (copy) v_u_20, (copy) v_u_21, (copy) v_u_3, (copy) v_u_46, (copy) v_u_32, (copy) v_u_39, (copy) v_u_12, (copy) v_u_16, (copy) v_u_4
	if workspace:GetAttribute("SammysReturn_JandelAppear") then
		v_u_23:ShakeOnce(4, 8, 0.15, 0.6)
		v_u_20.TintColor = Color3.fromRGB(255, 60, 40)
		v_u_20.Saturation = 0.7
		v_u_20.Contrast = 0.3
		v_u_20.Brightness = 0.45
		v_u_21.Intensity = 1.6
		v_u_21.Threshold = 0.35
		v_u_3.ExposureCompensation = 1
		v_u_46(3)
		local v74 = workspace:FindFirstChild("BW_JANDEL")
		if v74 then
			local v75 = v_u_32(v74)
			if v75 then
				local v76 = v_u_39("Jandel", v_u_12, v75)
				if v76.Idle then
					v76.Idle:Play(0)
				end
				local v77 = v_u_16:Clone()
				v77.Volume = 2
				v77.Parent = workspace
				v77:Play()
				v_u_4:AddItem(v77, v77.TimeLength + 1)
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_99()
	-- upvalues: (ref) v_u_24, (ref) v_u_27, (copy) v_u_57, (copy) v_u_68, (copy) v_u_26, (copy) v_u_39, (copy) v_u_13, (copy) v_u_23, (copy) v_u_20, (copy) v_u_21, (copy) v_u_3, (copy) v_u_46, (copy) v_u_15, (copy) v_u_4, (copy) v_u_17, (copy) v_u_25, (copy) v_u_16, (copy) v_u_18
	local v79 = workspace:GetAttribute("SammysReturn_Phase")
	if v79 and v_u_24 then
		v_u_27 = v79
		if v79 == "Intro" then
			v_u_57()
			return
		elseif v79 == "JandelAppear" then
			v_u_68()
		elseif v79 == "BallScene" then
			local v80 = v_u_26.Sammy
			local v81 = v_u_26.Jandel
			if v80 then
				if v80.Talk then
					v80.Talk:Stop(0.2)
				end
				if v80.Idle then
					v80.Idle:Stop(0.2)
				end
			end
			if v81 then
				if v81.Talk then
					v81.Talk:Stop(0.2)
				end
				if v81.Idle then
					v81.Idle:Stop(0.2)
				end
			end
			local v82 = workspace:FindFirstChild("SoccerBall")
			local v83 = nil
			if v82 then
				local v84 = v82:FindFirstChildOfClass("AnimationController")
				if v84 then
					v84 = v84:FindFirstChildOfClass("Animator") or v84:FindFirstChild("Animator")
				end
				if v84 then
					v83 = v_u_39("Ball", v_u_13, v84)
				end
			end
			if v83 and v83.BallScene then
				local v85 = v83.BallScene:GetMarkerReachedSignal("Impact")
				local function v88()
					-- upvalues: (ref) v_u_23, (ref) v_u_20, (ref) v_u_21, (ref) v_u_3, (ref) v_u_46, (ref) v_u_15, (ref) v_u_4, (ref) v_u_17
					v_u_23:ShakeOnce(8, 12, 0.1, 1.5)
					v_u_20.TintColor = Color3.fromRGB(255, 240, 180)
					v_u_20.Saturation = -0.3
					v_u_20.Contrast = 0.35
					v_u_20.Brightness = 0.55
					v_u_21.Intensity = 2
					v_u_21.Threshold = 0.25
					v_u_3.ExposureCompensation = 1.3
					v_u_46(2.5, Enum.EasingStyle.Sine)
					local v86 = v_u_15:Clone()
					v86.Parent = workspace
					v86:Play()
					v_u_4:AddItem(v86, v86.TimeLength + 1)
					local v87 = v_u_17:Clone()
					v87.Volume = 3
					v87.Parent = workspace
					v87:Play()
					v_u_4:AddItem(v87, v87.TimeLength + 1)
				end
				local v89 = v_u_25
				table.insert(v89, v85:Connect(v88))
			end
			if v81 and v81.BallScene then
				local v90 = v81.BallScene:GetMarkerReachedSignal("Kick")
				local function v95()
					-- upvalues: (ref) v_u_16, (ref) v_u_4, (ref) v_u_18
					local v91 = v_u_16:Clone()
					v91.Volume = 2
					v91.Parent = workspace
					v91:Play()
					v_u_4:AddItem(v91, v91.TimeLength + 1)
					local v92 = workspace:FindFirstChild("BW_JANDEL")
					if v92 then
						v92 = v92:FindFirstChild("HumanoidRootPart")
					end
					if v92 then
						local v93 = v_u_18:Clone()
						v93.WorldCFrame = v92.CFrame * CFrame.new(0, 0, -20)
						v93.Parent = workspace.Terrain
						for _, v94 in v93:GetDescendants() do
							if v94:IsA("ParticleEmitter") then
								v94:Emit(v94:GetAttribute("EmitCount") or 10)
							end
						end
						v_u_4:AddItem(v93, 5)
					end
				end
				local v96 = v_u_25
				table.insert(v96, v90:Connect(v95))
			end
			if v80 and v80.BallScene then
				v80.BallScene:Play(0.2)
			end
			if v81 and v81.BallScene then
				v81.BallScene:Play(0.2)
			end
			if v83 and v83.BallScene then
				v83.BallScene:Play(0.2)
				return
			end
		elseif v79 == "Outro" then
			local v97 = v_u_26.Sammy
			local v98 = v_u_26.Jandel
			if v97 then
				if v97.BallScene then
					v97.BallScene:Stop(0)
				end
				if v97.AuraLoss then
					v97.AuraLoss:Play(0.3)
				end
			end
			if v98 then
				if v98.BallScene then
					v98.BallScene:Stop(0)
				end
				if v98.AuraFarm then
					v98.AuraFarm:Play(0.3)
				end
			end
		end
	else
		return
	end
end
local function v_u_103()
	-- upvalues: (ref) v_u_28, (ref) v_u_27, (copy) v_u_26
	local v100 = workspace:GetAttribute("SammysReturn_Speaker")
	if v100 == v_u_28 then
		return
	else
		v_u_28 = v100
		if v_u_27 ~= "Outro" and v_u_27 ~= "BallScene" then
			local v101 = v_u_26.Sammy
			local v102 = v_u_26.Jandel
			if v100 == "Sammy" and v101 then
				if v101.Talk then
					v101.Talk:Play(0.2)
				end
				if v101.Idle then
					v101.Idle:Stop(0.2)
				end
				if v102 then
					if v102.Talk then
						v102.Talk:Stop(0.2)
					end
					if v102.Idle then
						v102.Idle:Play(0.2)
						return
					end
				end
			elseif v100 == "Jandel" and v102 then
				if v102.Talk then
					v102.Talk:Play(0.2)
				end
				if v102.Idle then
					v102.Idle:Stop(0.2)
				end
				if v101 then
					if v101.Talk then
						v101.Talk:Stop(0.2)
					end
					if v101.Idle then
						v101.Idle:Play(0.2)
						return
					end
				end
			elseif v100 == nil then
				if v101 and v101.Talk then
					v101.Talk:Stop(0.2)
				end
				if v102 and v102.Talk then
					v102.Talk:Stop(0.2)
				end
			end
		end
	end
end
local function v_u_107()
	-- upvalues: (ref) v_u_24, (copy) v_u_25, (copy) v_u_26, (ref) v_u_27, (ref) v_u_28, (copy) v_u_23, (copy) v_u_7, (copy) v_u_41, (copy) v_u_21
	if v_u_24 then
		v_u_24 = false
		for _, v104 in v_u_25 do
			if typeof(v104) == "RBXScriptConnection" then
				v104:Disconnect()
			end
		end
		table.clear(v_u_25)
		for _, v105 in v_u_26 do
			for _, v106 in v105 do
				v106:Stop(0)
			end
		end
		table.clear(v_u_26)
		v_u_27 = nil
		v_u_28 = nil
		v_u_23:StopSustained(1)
		v_u_7.Stop("SammysReturn")
		v_u_41()
		v_u_21.Intensity = 0
		v_u_21.Threshold = 1.1
	end
end
local function v_u_137()
	-- upvalues: (ref) v_u_24, (copy) v_u_40, (copy) v_u_23, (copy) v_u_39, (copy) v_u_14, (copy) v_u_32, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_8, (copy) v_u_7, (copy) v_u_73, (copy) v_u_25, (copy) v_u_78, (copy) v_u_99, (copy) v_u_103, (copy) v_u_107
	if not v_u_24 then
		v_u_24 = true
		v_u_40()
		v_u_23:Start()
		task.spawn(function()
			-- upvalues: (ref) v_u_39, (ref) v_u_14
			local v108 = workspace:FindFirstChild("BW_DJ_SET") or workspace:WaitForChild("BW_DJ_SET", 30)
			if v108 then
				local v109 = v108:FindFirstChild("jhailatte")
				if v109 then
					v109 = v109:FindFirstChildOfClass("Humanoid")
				end
				if v109 then
					local v110 = v_u_39("Jhai", v_u_14, v109)
					if v110.Idle then
						v110.Idle:Play(0)
					end
				end
			else
				return
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_32, (ref) v_u_39, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16
			local v111 = game:GetService("ContentProvider")
			local v112 = workspace:FindFirstChild("BW_SAMMY") or workspace:WaitForChild("BW_SAMMY", 30)
			local v113 = v112 and v_u_32(v112)
			if v113 then
				v_u_39("Sammy", v_u_11, v113)
			end
			local v114 = workspace:FindFirstChild("BW_JANDEL") or workspace:WaitForChild("BW_JANDEL", 30)
			local v115 = v114 and v_u_32(v114)
			if v115 then
				v_u_39("Jandel", v_u_12, v115)
			end
			local v116 = {}
			for _, v117 in v_u_11:GetChildren() do
				if v117:IsA("Animation") then
					table.insert(v116, v117)
				end
			end
			for _, v118 in v_u_12:GetChildren() do
				if v118:IsA("Animation") then
					table.insert(v116, v118)
				end
			end
			for _, v119 in v_u_13:GetChildren() do
				if v119:IsA("Animation") then
					table.insert(v116, v119)
				end
			end
			for _, v120 in v_u_14:GetChildren() do
				if v120:IsA("Animation") then
					table.insert(v116, v120)
				end
			end
			local v121 = v_u_15
			table.insert(v116, v121)
			local v122 = v_u_16
			table.insert(v116, v122)
			v111:PreloadAsync(v116)
		end)
		local v123 = {
			["priority"] = 12,
			["fadeIn"] = 2,
			["fadeOut"] = 2
		}
		local v124 = v_u_8.Weather
		if v124 then
			v124 = v_u_8.Weather.SammysReturn
		end
		if v124 and v124.Music then
			v123.soundId = v124.Music
			v123.volume = 0.6
		end
		v_u_7.Start("SammysReturn", v123)
		local v125 = workspace:GetAttributeChangedSignal("SammysReturn_SammyAppear")
		local v126 = v_u_73
		local v127 = v_u_25
		table.insert(v127, v125:Connect(v126))
		local v128 = workspace:GetAttributeChangedSignal("SammysReturn_JandelAppear")
		local v129 = v_u_78
		local v130 = v_u_25
		table.insert(v130, v128:Connect(v129))
		local v131 = workspace:GetAttributeChangedSignal("SammysReturn_Phase")
		local v132 = v_u_99
		local v133 = v_u_25
		table.insert(v133, v131:Connect(v132))
		local v134 = workspace:GetAttributeChangedSignal("SammysReturn_Speaker")
		local v135 = v_u_103
		local v136 = v_u_25
		table.insert(v136, v134:Connect(v135))
		if workspace:GetAttribute("SammysReturn_SammyAppear") then
			task.defer(v_u_73)
		end
		if workspace:GetAttribute("SammysReturn_JandelAppear") then
			task.defer(v_u_78)
		end
		if workspace:GetAttribute("SammysReturn_Phase") then
			task.defer(v_u_99)
		end
		if workspace:GetAttribute("SammysReturn_Speaker") then
			task.defer(v_u_103)
		end
		repeat
			task.wait(0.3)
		until not workspace:GetAttribute("SammysReturn")
		v_u_107()
	end
end
workspace:GetAttributeChangedSignal("SammysReturn"):Connect(function()
	-- upvalues: (copy) v_u_137, (copy) v_u_107
	if workspace:GetAttribute("SammysReturn") then
		task.defer(v_u_137)
	else
		v_u_107()
	end
end)
if workspace:GetAttribute("SammysReturn") then
	task.defer(v_u_137)
end
return v1