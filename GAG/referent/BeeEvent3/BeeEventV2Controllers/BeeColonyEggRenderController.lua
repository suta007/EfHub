local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("TweenService")
local v_u_7 = game:GetService("Debris")
local v_u_8 = require(v1.Data.BeeEvent.BeeEggRegistry)
local v_u_9 = v_u_8.Entries
local v_u_10 = require(v1.Modules.TimeHelper)
local v_u_11 = require(v1.Modules.Chalk)
local v_u_12 = require(v1.Modules.BeeEventV2Controllers.EggInfoFader)
require(v1.Data.SoundData)
require(v1.Modules.SoundPlayer)
local v_u_13 = require(v1.Modules.RaycastClickDetectorService)
local v14 = v1.GameEvents
local v_u_15 = v14.BizzyBeeEvent:WaitForChild("HatchBeeSwarmEgg")
local v_u_16 = v14.BizzyBeeEvent:WaitForChild("SkipBeeEggHatchTime")
local v_u_17 = script.Sounds
local v_u_18 = Color3.fromRGB(255, 255, 255)
local v_u_19 = Color3.fromRGB(140, 140, 140)
local v_u_20 = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_21 = Instance.new("Highlight")
v_u_21.FillTransparency = 1
v_u_21.OutlineColor = v_u_18
v_u_21.OutlineTransparency = 0
v_u_21.Parent = v1
local v_u_22 = nil
local v_u_23 = false
v_u_3.InputBegan:Connect(function(p24, p25)
	-- upvalues: (copy) v_u_21, (ref) v_u_23, (copy) v_u_19, (ref) v_u_22, (copy) v_u_6, (copy) v_u_20
	if p25 then
		return
	elseif p24.UserInputType == Enum.UserInputType.MouseButton1 then
		if v_u_21.Adornee then
			v_u_23 = true
			local v26 = v_u_19
			if v_u_22 then
				v_u_22:Cancel()
			end
			v_u_22 = v_u_6:Create(v_u_21, v_u_20, {
				["OutlineColor"] = v26
			})
			v_u_22:Play()
		end
	else
		return
	end
end)
v_u_3.InputEnded:Connect(function(p27)
	-- upvalues: (ref) v_u_23, (copy) v_u_18, (ref) v_u_22, (copy) v_u_6, (copy) v_u_21, (copy) v_u_20
	if p27.UserInputType == Enum.UserInputType.MouseButton1 then
		if v_u_23 then
			v_u_23 = false
			local v28 = v_u_18
			if v_u_22 then
				v_u_22:Cancel()
			end
			v_u_22 = v_u_6:Create(v_u_21, v_u_20, {
				["OutlineColor"] = v28
			})
			v_u_22:Play()
		end
	else
		return
	end
end)
local v_u_29 = v1.Assets.Models.BeeEggs
local v_u_30 = v1.Modules.BeeEventV2Controllers.BeeColonyEggShopController.EggInfo
local v31 = {}
local v_u_32 = v_u_5.LocalPlayer
local v_u_33 = {}
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = {}
local v_u_38 = {}
local v_u_39 = nil
local v_u_40 = false
local v_u_41 = v_u_3:GetLastInputType()
local function v_u_51(p42, p43, p44, p45, p46) -- name: TweenPivot
	-- upvalues: (copy) v_u_6
	if p42 and p42.Parent then
		local v47 = p42:GetPivot()
		local v48 = 0
		local v49 = p45 or Enum.EasingStyle.Sine
		if not p46 then
			p46 = Enum.EasingDirection.Out
		end
		while v48 < p44 do
			local v50 = v48 + task.wait()
			v48 = math.min(v50, p44)
			if not p42.Parent then
				return
			end
			p42:PivotTo(v47:Lerp(p43, (v_u_6:GetValue(v48 / p44, v49, p46))))
		end
		if p42.Parent then
			p42:PivotTo(p43)
		end
	end
end
local function v_u_55(p52) -- name: CreateSparkleVFX
	local v53 = Instance.new("Attachment")
	v53.Name = "BeeEggSparkleAttachment"
	v53.Parent = p52
	local v54 = Instance.new("ParticleEmitter")
	v54.Color = ColorSequence.new(Color3.fromRGB(255, 230, 80), Color3.fromRGB(255, 180, 0))
	v54.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 0) })
	v54.Lifetime = NumberRange.new(0.5, 1)
	v54.Rate = 6
	v54.Speed = NumberRange.new(0.5, 1.5)
	v54.SpreadAngle = Vector2.new(180, 180)
	v54.LightEmission = 1
	v54.Rotation = NumberRange.new(0, 360)
	v54.Parent = v53
	return v54
end
local function v_u_58(p56, p57) -- name: PlayShake
	-- upvalues: (copy) v_u_51
	v_u_51(p56, p57 * CFrame.new(0, 0.3, 0) * CFrame.Angles(0, 0, 0.3490658503988659), 0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	v_u_51(p56, p57 * CFrame.new(0, 0.3, 0) * CFrame.Angles(0, 0, -0.3490658503988659), 0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	v_u_51(p56, p57, 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end
local function v_u_63(p59, p_u_60) -- name: StartShakeLoop
	-- upvalues: (copy) v_u_37, (copy) v_u_55, (copy) v_u_58
	if v_u_37[p59] then
		return
	else
		local v61 = p_u_60.PrimaryPart
		if v61 then
			local v_u_62 = {
				["Running"] = true,
				["Model"] = nil,
				["BaseCFrame"] = nil,
				["Sparkle"] = nil,
				["Model"] = p_u_60,
				["BaseCFrame"] = p_u_60:GetPivot(),
				["Sparkle"] = v_u_55(v61)
			}
			v_u_37[p59] = v_u_62
			task.spawn(function()
				-- upvalues: (copy) v_u_62, (copy) p_u_60, (ref) v_u_58
				while v_u_62.Running do
					task.wait(1 + math.random() * 2)
					if not (v_u_62.Running and p_u_60.Parent) then
						break
					end
					pcall(v_u_58, p_u_60, v_u_62.BaseCFrame)
				end
			end)
		end
	end
end
local function v_u_68(p64, p65) -- name: HideDuplicateEggs
	for _, v66 in p64:GetChildren() do
		if v66 ~= p65 and (v66:IsA("Model") or v66:IsA("BasePart")) then
			for _, v67 in v66:GetDescendants() do
				if v67:IsA("BasePart") then
					v67.LocalTransparencyModifier = 1
				end
			end
			if v66:IsA("BasePart") then
				v66.LocalTransparencyModifier = 1
			end
		end
	end
end
local function v_u_72() -- name: CreateScreenFlash
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v69 = v_u_5.LocalPlayer:FindFirstChild("PlayerGui")
	if v69 then
		local v70 = Instance.new("ScreenGui")
		v70.Name = "HatchFlash"
		v70.DisplayOrder = 999
		v70.IgnoreGuiInset = true
		v70.Parent = v69
		local v_u_71 = Instance.new("Frame")
		v_u_71.Size = UDim2.fromScale(1, 1)
		v_u_71.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v_u_71.BackgroundTransparency = 0
		v_u_71.BorderSizePixel = 0
		v_u_71.Parent = v70
		task.delay(0.05, function()
			-- upvalues: (ref) v_u_6, (copy) v_u_71
			v_u_6:Create(v_u_71, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				["BackgroundTransparency"] = 1
			}):Play()
		end)
		v_u_7:AddItem(v70, 0.7)
	end
end
local v_u_73 = {
	ColorSequence.new(Color3.fromRGB(255, 230, 80), Color3.fromRGB(255, 160, 0)),
	ColorSequence.new(Color3.fromRGB(255, 200, 50), Color3.fromRGB(255, 120, 0)),
	ColorSequence.new(Color3.fromRGB(255, 245, 150), Color3.fromRGB(255, 180, 30)),
	ColorSequence.new(Color3.fromRGB(255, 210, 70), Color3.fromRGB(255, 140, 10))
}
local function v_u_81(p74, _) -- name: CreateEnergyBeams
	-- upvalues: (copy) v_u_73
	local v75 = Instance.new("Attachment")
	v75.Name = "BeamCenter"
	v75.Parent = p74
	local v76 = {}
	local v77 = {}
	for v78 = 1, 4 do
		local v79 = Instance.new("Attachment")
		v79.Name = "BeamOrbit_" .. v78
		v79.Parent = p74
		local v80 = Instance.new("Beam")
		v80.Attachment0 = v75
		v80.Attachment1 = v79
		v80.Color = v_u_73[v78]
		v80.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(0.5, 0.3), NumberSequenceKeypoint.new(1, 0.8) })
		v80.Width0 = 0.05
		v80.Width1 = 0.15
		v80.LightEmission = 1
		v80.LightInfluence = 0
		v80.FaceCamera = true
		v80.CurveSize0 = 1.5
		v80.CurveSize1 = -1.5
		v80.Segments = 12
		v80.TextureSpeed = 2
		v80.Parent = p74
		v76[v78] = v79
		v77[v78] = v80
	end
	return v75, v76, v77
end
local function v_u_261(p82, p_u_83) -- name: PlayHatchAnimation
	-- upvalues: (copy) v_u_37, (copy) v_u_7, (copy) v_u_68, (copy) v_u_17, (copy) v_u_9, (copy) v_u_81, (copy) v_u_6, (copy) v_u_51, (copy) v_u_72, (copy) v_u_4
	local v84 = v_u_37[p82]
	if v84 then
		v84.Running = false
		if v84.Sparkle then
			v84.Sparkle.Enabled = false
			local v85 = v84.Sparkle.Parent
			if v85 then
				v_u_7:AddItem(v85, 1.5)
			end
		end
		v_u_37[p82] = nil
	end
	v_u_68(p82, p_u_83)
	v_u_17.Open:Play()
	v_u_17.Riser:Play()
	local v86 = p_u_83.PrimaryPart
	if not v86 then
		return
	end
	local v87 = p_u_83:GetPivot()
	local v_u_88 = Instance.new("Attachment")
	v_u_88.Parent = v86
	task.delay(6, function()
		-- upvalues: (copy) v_u_88
		if v_u_88.Parent then
			v_u_88:Destroy()
		end
	end)
	local v89 = p82:GetAttribute("HatchedFrom") or "Common Bee Egg"
	local v90 = v_u_9[v89]
	local v91 = v90 and v90.Color or Color3.fromRGB(255, 220, 60)
	if v89 == "Common Bee Egg" then
		v91 = Color3.fromRGB(255, 220, 60)
	end
	local v_u_92 = Instance.new("PointLight")
	v_u_92.Color = v91
	v_u_92.Brightness = 0
	v_u_92.Range = 0
	v_u_92.Parent = v86
	local v_u_93 = Instance.new("ParticleEmitter")
	v_u_93.Color = ColorSequence.new(Color3.fromRGB(255, 230, 80), Color3.fromRGB(255, 130, 30))
	v_u_93.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(0.5, 0.3), NumberSequenceKeypoint.new(1, 0) })
	v_u_93.Lifetime = NumberRange.new(0.4, 1)
	v_u_93.Speed = NumberRange.new(2, 6)
	v_u_93.SpreadAngle = Vector2.new(180, 180)
	v_u_93.LightEmission = 1
	v_u_93.Rotation = NumberRange.new(0, 360)
	v_u_93.RotSpeed = NumberRange.new(-200, 200)
	v_u_93.Rate = 10
	v_u_93.Parent = v_u_88
	local v94, v_u_95, v_u_96 = v_u_81(v86, v87)
	local v_u_97 = {}
	local v_u_98 = {}
	for v99 = 1, 8 do
		local v100 = (v99 - 1) * 0.7853981633974483
		local v101 = (v99 % 3 - 1) * 2
		local v102 = math.cos(v100) * 10
		local v103 = math.sin(v100) * 10
		local v104 = Vector3.new(v102, v101, v103)
		local v105 = Instance.new("Attachment")
		v105.Parent = v86
		v105.Position = v104
		v105.CFrame = CFrame.lookAt(v104, Vector3.new(0, 0, 0))
		local v106 = Instance.new("ParticleEmitter")
		v106.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 220, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 230, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 220)) })
		v106.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(0.7, 0.2), NumberSequenceKeypoint.new(1, 0) })
		v106.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.6),
			NumberSequenceKeypoint.new(0.3, 0.1),
			NumberSequenceKeypoint.new(0.9, 0.3),
			NumberSequenceKeypoint.new(1, 1)
		})
		v106.Lifetime = NumberRange.new(0.5, 1)
		v106.Speed = NumberRange.new(8, 14)
		v106.SpreadAngle = Vector2.new(15, 15)
		v106.LightEmission = 1
		v106.Rotation = NumberRange.new(0, 360)
		v106.RotSpeed = NumberRange.new(-100, 100)
		v106.Rate = 0
		v106.Parent = v105
		table.insert(v_u_97, v105)
		table.insert(v_u_98, v106)
	end
	local v_u_107 = true
	local v_u_108 = 0
	task.spawn(function()
		-- upvalues: (copy) p_u_83, (ref) v_u_107, (ref) v_u_6, (copy) v_u_92, (copy) v_u_93, (copy) v_u_97, (ref) v_u_108, (copy) v_u_98, (copy) v_u_95, (copy) v_u_96
		local v109 = 0
		while v109 < 3.5 and (p_u_83.Parent and v_u_107) do
			local v110 = task.wait()
			local v111 = v109 + v110
			v109 = math.min(v111, 3.5)
			if not p_u_83.Parent then
				return
			end
			local v112 = v_u_6:GetValue(v109 / 3.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
			p_u_83:ScaleTo(1 + 0.8 * v112)
			v_u_92.Brightness = v112 * 0.4
			v_u_92.Range = v112 * 5
			v_u_93.Rate = 10 + v112 * 90
			local v113 = v112 * 35
			local v114 = 10 * (1 - v112 * 0.6)
			for v115, v116 in v_u_97 do
				local v117 = (v115 - 1) * 0.7853981633974483 + v_u_108 * 0.3
				local v118 = v_u_108 * 1.5 + v115
				local v119 = math.sin(v118) * (1 + v112 * 2)
				local v120 = math.cos(v117) * v114
				local v121 = math.sin(v117) * v114
				local v122 = Vector3.new(v120, v119, v121)
				v116.CFrame = CFrame.lookAt(v122, Vector3.new(0, 0, 0))
				v_u_98[v115].Rate = v113
				v_u_98[v115].Speed = NumberRange.new(8 + v112 * 10, 14 + v112 * 15)
			end
			v_u_108 = v_u_108 + (0.3 + v112 * 8) * v110
			local v123 = 3.5 * (1 - v112 * 0.7)
			for v124, v125 in v_u_95 do
				local v126 = (v124 - 1) * 1.5707963267948966 + v_u_108
				local v127 = v_u_108 * 2 + v124
				local v128 = math.sin(v127) * (0.5 + v112 * 1)
				local v129 = math.cos(v126) * v123
				local v130 = math.sin(v126) * v123
				v125.Position = Vector3.new(v129, v128, v130)
			end
			for _, v131 in v_u_96 do
				v131.Width0 = 0.05 + v112 * 0.4
				v131.Width1 = 0.15 + v112 * 0.6
				v131.CurveSize0 = 1.5 - v112 * 1.2
				v131.CurveSize1 = -1.5 + v112 * 1.2
				v131.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.6 - v112 * 0.5), NumberSequenceKeypoint.new(0.5, 0.3 - v112 * 0.25), NumberSequenceKeypoint.new(1, 0.8 - v112 * 0.5) })
			end
			if v112 > 0.15 then
				local v132 = (v112 - 0.15) * 0.15
				local v133 = workspace.CurrentCamera
				if v133 then
					local v134 = (math.random() - 0.5) * 2 * v132
					local v135 = (math.random() - 0.5) * 2 * v132
					v133.CFrame = v133.CFrame * CFrame.new(v134, v135, 0)
				end
			end
		end
	end)
	local v136 = 0
	while v136 < 3.5 and p_u_83.Parent do
		local v137 = v136 + task.wait()
		v136 = math.min(v137, 3.5)
		if not p_u_83.Parent then
			return
		end
		local v138 = v136 / 3.5
		local v139 = v_u_6:GetValue(v138, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
		local v140 = 3 + v139 * 42
		local v141 = math.rad(v140)
		local v142 = 1.5 + v139 * 14
		local v143 = v139 * 1.2
		local v144 = v_u_6:GetValue(v138, Enum.EasingStyle.Cubic, Enum.EasingDirection.In) * 3.141592653589793 * 6
		local v145 = v136 * v142
		local v146 = math.sin(v145) * v141
		local v147 = v136 * v142 * 0.7
		local v148 = math.cos(v147) * v141 * 0.4
		local v149 = v136 * v142 * 0.5
		local v150 = math.sin(v149)
		local v151 = math.abs(v150) * v143
		p_u_83:PivotTo(v87 * CFrame.new(0, v151, 0) * CFrame.Angles(v148, v144, v146))
	end
	v_u_107 = false
	v_u_51(p_u_83, v87 * CFrame.new(0, 1.5, 0), 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	for _, v152 in v_u_95 do
		v152.Position = Vector3.new(0, 0, 0)
	end
	for _, v153 in v_u_96 do
		v153.Width0 = 0.6
		v153.Width1 = 0.6
		v153.Transparency = NumberSequence.new(0)
	end
	task.wait(0.15)
	for _, v154 in v_u_96 do
		v154:Destroy()
	end
	for _, v155 in v_u_95 do
		v155:Destroy()
	end
	v94:Destroy()
	v_u_93.Enabled = false
	for _, v156 in v_u_97 do
		v156:Destroy()
	end
	local v157 = v86.Position
	local v158 = {}
	for _, v159 in p_u_83:GetDescendants() do
		if v159:IsA("BasePart") and v159.Transparency < 1 then
			local v160 = v159.Position - v157
			local v161
			if v160.Magnitude > 0.05 then
				v161 = v160.Unit
			else
				local v162 = math.random() - 0.5
				local v163 = math.random() * 0.5 + 0.5
				local v164 = math.random() - 0.5
				v161 = Vector3.new(v162, v163, v164).Unit
			end
			local v165 = {
				["Part"] = v159,
				["OrigCFrame"] = v159.CFrame,
				["OrigColor"] = v159.Color,
				["Dir"] = v161
			}
			table.insert(v158, v165)
		end
	end
	for _, v166 in p_u_83:GetDescendants() do
		if v166:IsA("JointInstance") or (v166:IsA("WeldConstraint") or v166:IsA("Constraint")) then
			v166:Destroy()
		end
	end
	for _, v167 in v158 do
		v167.Part.Anchored = true
	end
	local v168 = Instance.new("Highlight")
	v168.FillColor = Color3.fromRGB(255, 230, 100)
	v168.FillTransparency = 1
	v168.OutlineColor = Color3.fromRGB(255, 200, 50)
	v168.OutlineTransparency = 0.5
	v168.Adornee = p_u_83
	v168.Parent = p_u_83
	local v169 = Instance.new("Attachment")
	v169.Parent = v86
	local v170 = {}
	for v171, v172 in v158 do
		if v171 > 6 then
			break
		end
		local v173 = Instance.new("Attachment")
		v173.Parent = v172.Part
		local v174 = Instance.new("Beam")
		v174.Attachment0 = v169
		v174.Attachment1 = v173
		v174.Color = ColorSequence.new(Color3.fromRGB(255, 245, 180), Color3.fromRGB(255, 200, 60))
		v174.Transparency = NumberSequence.new(0.8)
		v174.Width0 = 0.02
		v174.Width1 = 0.05
		v174.LightEmission = 1
		v174.LightInfluence = 0
		v174.FaceCamera = true
		v174.Segments = 1
		v174.Parent = v86
		table.insert(v170, {
			["Beam"] = v174,
			["Att"] = v173
		})
	end
	v_u_17.Crack:Play()
	local v175 = os.clock()
	while os.clock() - v175 < 0.7 and p_u_83.Parent do
		task.wait()
		local v176 = (os.clock() - v175) / 0.7
		local v177 = v_u_6:GetValue(math.min(v176, 1), Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local v178 = os.clock() - v175
		for _, v179 in v158 do
			local v180 = v179.Dir * 3.5 * v177
			local v181 = v178 * (3 + v179.Dir.X * 4)
			v179.Part.CFrame = CFrame.new(v179.OrigCFrame.Position + v180) * v179.OrigCFrame.Rotation * CFrame.Angles(0, v181, v181 * 0.3)
			v179.Part.Color = v179.OrigColor:Lerp(Color3.fromRGB(255, 240, 180), v177 * 0.7)
		end
		for _, v182 in v170 do
			v182.Beam.Width0 = 0.02 + v177 * 0.3
			v182.Beam.Width1 = 0.05 + v177 * 0.4
			v182.Beam.Transparency = NumberSequence.new(0.8 - v177 * 0.6)
		end
		v168.FillTransparency = 1 - v177 * 0.7
		v_u_92.Brightness = 0.5 + v177 * 1
		v_u_92.Range = 5 + v177 * 5
		local v183 = workspace.CurrentCamera
		if v183 then
			local v184 = v177 * 0.08
			v183.CFrame = v183.CFrame * CFrame.new((math.random() - 0.5) * 2 * v184, (math.random() - 0.5) * 2 * v184, 0)
		end
	end
	v_u_17.Unlock:Play()
	local v185 = os.clock()
	while os.clock() - v185 < 0.15 and p_u_83.Parent do
		task.wait()
		local v186 = (os.clock() - v185) / 0.15
		local v187 = v_u_6:GetValue(math.min(v186, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		for _, v188 in v158 do
			local v189 = v188.Dir * 3.5 * (1 - v187)
			v188.Part.CFrame = CFrame.new(v188.OrigCFrame.Position + v189) * v188.OrigCFrame.Rotation
			v188.Part.Color = Color3.fromRGB(255, 255, 220)
		end
		v168.FillTransparency = 0.3 - v187 * 0.3
	end
	local v190 = os.clock()
	CFrame.new(v157)
	while os.clock() - v190 < 0.25 and p_u_83.Parent do
		task.wait()
		local v191 = (os.clock() - v190) / 0.25
		local v192 = v_u_6:GetValue(math.min(v191, 1), Enum.EasingStyle.Back, Enum.EasingDirection.In)
		for _, v193 in v158 do
			local v194 = 1 - v192 * 0.4
			local v195 = v193.OrigCFrame.Position - v157
			v193.Part.CFrame = CFrame.new(v157 + v195 * v194) * v193.OrigCFrame.Rotation
			v193.Part.Color = Color3.fromRGB(255, 255, 255):Lerp(v91, v192)
		end
		v168.FillTransparency = v192 * 0.5
		v_u_92.Brightness = 1 + v192 * 1
		v_u_92.Range = 8 + v192 * 6
	end
	task.wait(0.08)
	v168:Destroy()
	for _, v196 in v170 do
		v196.Beam:Destroy()
		v196.Att:Destroy()
	end
	v169:Destroy()
	local v_u_197 = {}
	for _, v198 in v158 do
		local v_u_199 = v198.Part:Clone()
		for _, v200 in v_u_199:GetDescendants() do
			if v200:IsA("JointInstance") or (v200:IsA("WeldConstraint") or v200:IsA("Constraint")) then
				v200:Destroy()
			end
		end
		local v201 = 0.25 + math.random() * 0.2
		local v202 = v_u_199.Size * v201
		local v203 = v202.X
		local v204 = v202.Y
		local v205 = v202.Z
		local v206 = math.max(v203, v204, v205)
		if v206 > 1.2 then
			v202 = v202 * (1.2 / v206)
		end
		v_u_199.Size = v202
		v_u_199.CFrame = v198.Part.CFrame * CFrame.new((math.random() - 0.5) * 0.5, (math.random() - 0.5) * 0.5, (math.random() - 0.5) * 0.5)
		v_u_199.Anchored = false
		v_u_199.CanCollide = true
		v_u_199.CanQuery = false
		v_u_199.Color = Color3.fromRGB(255, 255, 220)
		v_u_199.Material = Enum.Material.Neon
		v_u_199.Parent = workspace
		local v207 = v198.Dir
		local v208 = (math.random() - 0.5) * 0.4
		local v209 = 0.8 + math.random() * 0.8
		local v210 = (math.random() - 0.5) * 0.4
		v_u_199:ApplyImpulse((v207 + Vector3.new(v208, v209, v210)).Unit * ((25 + math.random() * 35) * v_u_199:GetMass()))
		local v211 = (math.random() - 0.5) * 40
		local v212 = (math.random() - 0.5) * 40
		local v213 = (math.random() - 0.5) * 40
		v_u_199:ApplyAngularImpulse(Vector3.new(v211, v212, v213) * v_u_199:GetMass())
		local v214 = Instance.new("Attachment")
		v214.Parent = v_u_199
		local v_u_215 = Instance.new("ParticleEmitter")
		v_u_215.Color = ColorSequence.new(Color3.fromRGB(255, 220, 80), Color3.fromRGB(255, 150, 20))
		v_u_215.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0) })
		v_u_215.Lifetime = NumberRange.new(0.3, 0.7)
		v_u_215.Speed = NumberRange.new(0.5, 2)
		v_u_215.SpreadAngle = Vector2.new(180, 180)
		v_u_215.LightEmission = 1
		v_u_215.Rate = 30
		v_u_215.Parent = v214
		table.insert(v_u_197, {
			["Shard"] = v_u_199,
			["Sparkle"] = v_u_215
		})
		v_u_7:AddItem(v_u_199, 15)
		task.spawn(function()
			-- upvalues: (copy) v_u_215
			task.wait(2)
			if v_u_215 then
				v_u_215.Enabled = false
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_199
			task.wait(1.5)
			if v_u_199.Parent then
				v_u_199.Material = Enum.Material.SmoothPlastic
			end
		end)
		v198.Part.LocalTransparencyModifier = 1
		for _ = 1, 2 do
			local v_u_216 = Instance.new("Part")
			local v217 = 0.2 + math.random() * 0.4
			local v218 = 0.2 + math.random() * 0.4
			local v219 = 0.2 + math.random() * 0.4
			v_u_216.Size = Vector3.new(v217, v218, v219)
			v_u_216.CFrame = v198.Part.CFrame * CFrame.new((math.random() - 0.5) * 1.5, (math.random() - 0.5) * 1.5, (math.random() - 0.5) * 1.5)
			v_u_216.Anchored = false
			v_u_216.CanCollide = true
			v_u_216.CanQuery = false
			v_u_216.Color = v198.OrigColor:Lerp(Color3.fromRGB(255, 240, 180), 0.5)
			v_u_216.Material = Enum.Material.Neon
			v_u_216.Parent = workspace
			local v220 = v198.Dir
			local v221 = math.random() - 0.5
			local v222 = math.random() * 0.5 + 0.5
			local v223 = math.random() - 0.5
			v_u_216:ApplyImpulse((v220 + Vector3.new(v221, v222, v223)).Unit * (15 + math.random() * 25) * v_u_216:GetMass())
			local v224 = (math.random() - 0.5) * 10
			local v225 = (math.random() - 0.5) * 10
			local v226 = (math.random() - 0.5) * 10
			v_u_216:ApplyAngularImpulse(Vector3.new(v224, v225, v226) * v_u_216:GetMass())
			table.insert(v_u_197, {
				["Shard"] = nil,
				["Sparkle"] = nil,
				["Shard"] = v_u_216
			})
			task.delay(6, function()
				-- upvalues: (copy) v_u_216
				if v_u_216.Parent then
					v_u_216:Destroy()
				end
			end)
			task.spawn(function()
				-- upvalues: (copy) v_u_216
				task.wait(1.5)
				if v_u_216.Parent then
					v_u_216.Material = Enum.Material.SmoothPlastic
				end
			end)
		end
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_197, (copy) v_u_92
		task.wait(2)
		local v227 = os.clock()
		while os.clock() - v227 < 2 do
			task.wait()
			local v228 = (os.clock() - v227) / 2
			local v229 = v_u_6:GetValue(math.min(v228, 1), Enum.EasingStyle.Sine, Enum.EasingDirection.In)
			for _, v230 in v_u_197 do
				if v230.Shard.Parent then
					v230.Shard.Transparency = v229
				end
			end
			if v_u_92.Parent then
				local v231 = v_u_92
				local v232 = v_u_92.Brightness * (1 - v229)
				v231.Brightness = math.max(0, v232)
				local v233 = v_u_92
				local v234 = v_u_92.Range * (1 - v229)
				v233.Range = math.max(0, v234)
			end
		end
		for _, v235 in v_u_197 do
			if v235.Shard.Parent then
				v235.Shard:Destroy()
			end
		end
		if v_u_92.Parent then
			v_u_92:Destroy()
		end
	end)
	v_u_72()
	local v_u_236 = workspace.CurrentCamera
	if v_u_236 then
		local v_u_237 = os.clock()
		local v_u_238 = nil
		local v_u_239 = 0.8
		local v_u_240 = 0.4
		v_u_238 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_237, (copy) v_u_239, (ref) v_u_238, (copy) v_u_240, (copy) v_u_236
			local v241 = os.clock() - v_u_237
			if v_u_239 <= v241 then
				v_u_238:Disconnect()
			else
				local v242 = 1 - v241 / v_u_239
				local v243 = (math.random() - 0.5) * 2 * v_u_240 * v242
				local v244 = (math.random() - 0.5) * 2 * v_u_240 * v242
				v_u_236.CFrame = v_u_236.CFrame * CFrame.new(v243, v244, 0)
			end
		end)
	end
	local v_u_245 = Instance.new("Attachment")
	v_u_245.Parent = v86
	v_u_245.Position = Vector3.new(0, 0, 0)
	local v_u_246 = Instance.new("Attachment")
	v_u_246.Parent = v86
	v_u_246.Position = Vector3.new(0, 60, 0)
	local v_u_247 = Instance.new("Beam")
	v_u_247.Attachment0 = v_u_245
	v_u_247.Attachment1 = v_u_246
	local v248 = v91:Lerp(Color3.fromRGB(255, 255, 255), 0.5)
	v_u_247.Color = ColorSequence.new(v91, v248)
	v_u_247.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.3, 0.4), NumberSequenceKeypoint.new(1, 1) })
	v_u_247.Width0 = 1.5
	v_u_247.Width1 = 0.15
	v_u_247.LightEmission = 1
	v_u_247.LightInfluence = 0
	v_u_247.FaceCamera = true
	v_u_247.Segments = 1
	v_u_247.Parent = v86
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_247, (copy) v_u_245, (copy) v_u_246
		local v249 = os.clock()
		while os.clock() - v249 < 0.6 do
			task.wait()
			local v250 = v_u_6:GetValue((os.clock() - v249) / 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			v_u_247.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1 + v250 * 0.9), NumberSequenceKeypoint.new(0.3, 0.4 + v250 * 0.6), NumberSequenceKeypoint.new(1, 1) })
			v_u_247.Width0 = 1.5 * (1 - v250 * 0.7)
			v_u_247.Width1 = 0.15 * (1 - v250 * 0.7)
		end
		v_u_247:Destroy()
		v_u_245:Destroy()
		v_u_246:Destroy()
	end)
	local v_u_251 = Instance.new("Attachment")
	v_u_251.Parent = v86
	v_u_251.Position = Vector3.new(0, -2, 0)
	local v252 = Instance.new("ParticleEmitter")
	v252.Color = ColorSequence.new(Color3.fromRGB(220, 200, 150), Color3.fromRGB(180, 160, 120))
	v252.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(0.5, 2), NumberSequenceKeypoint.new(1, 3) })
	v252.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(0.5, 0.7), NumberSequenceKeypoint.new(1, 1) })
	v252.Lifetime = NumberRange.new(1.5, 3)
	v252.Speed = NumberRange.new(3, 8)
	v252.SpreadAngle = Vector2.new(180, 20)
	v252.LightEmission = 0.2
	v252.Rotation = NumberRange.new(0, 360)
	v252.RotSpeed = NumberRange.new(-30, 30)
	v252.Drag = 3
	v252.Rate = 0
	v252.Parent = v_u_251
	v252:Emit(40)
	task.delay(4, function()
		-- upvalues: (copy) v_u_251
		if v_u_251.Parent then
			v_u_251:Destroy()
		end
	end)
	if v_u_92 and v_u_92.Parent then
		v_u_92:Destroy()
	end
	if WarmGlow and WarmGlow.Parent then
		WarmGlow:Destroy()
	end
	local v_u_253 = Instance.new("ParticleEmitter")
	v_u_253.Color = ColorSequence.new(Color3.fromRGB(255, 230, 80), Color3.fromRGB(255, 130, 30))
	v_u_253.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.4), NumberSequenceKeypoint.new(0.3, 0.7), NumberSequenceKeypoint.new(1, 0) })
	v_u_253.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0.3), NumberSequenceKeypoint.new(1, 1) })
	v_u_253.Lifetime = NumberRange.new(0.6, 1.4)
	v_u_253.Speed = NumberRange.new(20, 45)
	v_u_253.SpreadAngle = Vector2.new(180, 180)
	v_u_253.LightEmission = 1
	v_u_253.Rotation = NumberRange.new(0, 360)
	v_u_253.RotSpeed = NumberRange.new(-200, 200)
	v_u_253.Drag = 4
	v_u_253.Rate = 0
	v_u_253.Parent = v_u_88
	v_u_253:Emit(180)
	local v254 = Instance.new("ParticleEmitter")
	v254.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 250, 200))
	v254.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5), NumberSequenceKeypoint.new(0.2, 3), NumberSequenceKeypoint.new(1, 0) })
	v254.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 0.4), NumberSequenceKeypoint.new(1, 1) })
	v254.Lifetime = NumberRange.new(0.2, 0.4)
	v254.Speed = NumberRange.new(0, 1)
	v254.SpreadAngle = Vector2.new(180, 180)
	v254.LightEmission = 1
	v254.Rate = 0
	v254.Parent = v_u_88
	v254:Emit(30)
	local v_u_255 = Instance.new("ParticleEmitter")
	v_u_255.Color = ColorSequence.new(Color3.fromRGB(255, 255, 200))
	v_u_255.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 6) })
	v_u_255.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 0.3), NumberSequenceKeypoint.new(1, 1) })
	v_u_255.Lifetime = NumberRange.new(0.6, 1)
	v_u_255.Speed = NumberRange.new(18, 30)
	v_u_255.SpreadAngle = Vector2.new(180, 15)
	v_u_255.LightEmission = 1
	v_u_255.Rate = 0
	v_u_255.Parent = v_u_88
	v_u_255:Emit(40)
	local v256 = Instance.new("ParticleEmitter")
	v256.Color = ColorSequence.new(Color3.fromRGB(255, 180, 0), Color3.fromRGB(180, 100, 0))
	v256.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(0.3, 0.35), NumberSequenceKeypoint.new(1, 0) })
	v256.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.8, 0.2), NumberSequenceKeypoint.new(1, 1) })
	v256.Lifetime = NumberRange.new(1, 2.5)
	v256.Speed = NumberRange.new(12, 30)
	v256.SpreadAngle = Vector2.new(50, 50)
	v256.LightEmission = 0.4
	v256.Acceleration = Vector3.new(0, -25, 0)
	v256.Drag = 1.5
	v256.Rotation = NumberRange.new(0, 360)
	v256.Rate = 0
	v256.Parent = v_u_88
	v256:Emit(50)
	local v_u_257 = Instance.new("ParticleEmitter")
	v_u_257.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 200)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 220, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 180, 50)) })
	v_u_257.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.2, 0.25),
		NumberSequenceKeypoint.new(0.8, 0.15),
		NumberSequenceKeypoint.new(1, 0)
	})
	v_u_257.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
	v_u_257.Lifetime = NumberRange.new(2, 4)
	v_u_257.Speed = NumberRange.new(1, 4)
	v_u_257.SpreadAngle = Vector2.new(180, 180)
	v_u_257.LightEmission = 1
	v_u_257.Acceleration = Vector3.new(0, 2, 0)
	v_u_257.Rotation = NumberRange.new(0, 360)
	v_u_257.RotSpeed = NumberRange.new(-60, 60)
	v_u_257.Rate = 0
	v_u_257.Parent = v_u_88
	v_u_257:Emit(80)
	local v_u_258 = Instance.new("ParticleEmitter")
	v_u_258.Color = ColorSequence.new(Color3.fromRGB(200, 230, 255), Color3.fromRGB(255, 255, 200))
	v_u_258.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.08), NumberSequenceKeypoint.new(0.1, 0.15), NumberSequenceKeypoint.new(1, 0) })
	v_u_258.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.2), NumberSequenceKeypoint.new(1, 1) })
	v_u_258.Lifetime = NumberRange.new(0.1, 0.3)
	v_u_258.Speed = NumberRange.new(40, 80)
	v_u_258.SpreadAngle = Vector2.new(180, 180)
	v_u_258.LightEmission = 1
	v_u_258.Rotation = NumberRange.new(0, 360)
	v_u_258.Rate = 0
	v_u_258.Parent = v_u_88
	v_u_258:Emit(50)
	local v_u_259 = Instance.new("ParticleEmitter")
	v_u_259.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 50)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 130, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 60, 10)) })
	v_u_259.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.5, 0.15), NumberSequenceKeypoint.new(1, 0) })
	v_u_259.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.7, 0.4), NumberSequenceKeypoint.new(1, 1) })
	v_u_259.Lifetime = NumberRange.new(2, 5)
	v_u_259.Speed = NumberRange.new(2, 8)
	v_u_259.SpreadAngle = Vector2.new(180, 180)
	v_u_259.LightEmission = 0.8
	v_u_259.Acceleration = Vector3.new(0, 4, 0)
	v_u_259.Drag = 2
	v_u_259.Rotation = NumberRange.new(0, 360)
	v_u_259.RotSpeed = NumberRange.new(-40, 40)
	v_u_259.Rate = 0
	v_u_259.Parent = v_u_88
	v_u_259:Emit(60)
	v_u_92.Brightness = 1.2
	v_u_92.Range = 10
	v_u_6:Create(v_u_92, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		["Brightness"] = 0,
		["Range"] = 0
	}):Play()
	local v_u_260 = Instance.new("PointLight")
	v_u_260.Color = v91:Lerp(Color3.fromRGB(255, 200, 100), 0.4)
	v_u_260.Brightness = 0.3
	v_u_260.Range = 6
	v_u_260.Parent = v86
	v_u_6:Create(v_u_260, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		["Brightness"] = 0,
		["Range"] = 0
	}):Play()
	task.delay(0.5, function()
		-- upvalues: (copy) v_u_260
		if v_u_260.Parent then
			v_u_260:Destroy()
		end
	end)
	task.delay(0.12, function()
		-- upvalues: (copy) v_u_88, (copy) v_u_253, (copy) v_u_258
		if v_u_88.Parent then
			v_u_253:Emit(80)
			v_u_258:Emit(30)
		end
	end)
	task.delay(0.3, function()
		-- upvalues: (copy) v_u_88, (copy) v_u_255, (copy) v_u_257, (copy) v_u_259
		if v_u_88.Parent then
			v_u_255:Emit(20)
			v_u_257:Emit(40)
			v_u_259:Emit(30)
		end
	end)
	task.delay(1, function()
		-- upvalues: (copy) v_u_88, (copy) v_u_259, (copy) v_u_257
		if v_u_88.Parent then
			v_u_259:Emit(30)
			v_u_257:Emit(25)
		end
	end)
	task.delay(2.5, function()
		-- upvalues: (copy) v_u_88, (copy) v_u_259, (copy) v_u_257
		if v_u_88.Parent then
			v_u_259:Emit(15)
			v_u_257:Emit(10)
		end
	end)
end
local function v_u_267(p262, p263) -- name: UseEgg
	-- upvalues: (copy) v_u_38, (copy) v_u_32, (copy) v_u_13, (copy) v_u_33, (copy) v_u_12, (ref) v_u_34, (ref) v_u_35, (ref) v_u_36, (copy) v_u_21, (copy) v_u_15, (copy) v_u_261, (copy) v_u_16
	if p262 and p263 then
		if v_u_38[p262] then
			return
		elseif p262:GetAttribute("OwnerUserId") == v_u_32.UserId then
			local v264 = p262:GetAttribute("UUID")
			if typeof(v264) == "string" then
				if p262:GetAttribute("ReadyToHatch") then
					v_u_38[p262] = true
					local v265 = v_u_13.get(p262)
					if v265 then
						v265.MaxActivationDistance = 0
					end
					local v266 = v_u_33[p262]
					if v266 then
						v_u_12.Hide(v266)
					end
					if v_u_34 == p262 then
						v_u_34 = nil
					end
					if v_u_35 == p262 then
						v_u_35 = nil
					end
					if v_u_36 == p262 then
						v_u_36 = nil
						v_u_21.Adornee = nil
					end
					v_u_15:FireServer(v264)
					v_u_261(p262, p263)
				else
					v_u_16:FireServer(v264)
				end
			else
				warn("BeeColonyEggRenderController | No UUID on bee egg")
				return
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_271(p268) -- name: GetClickDetector
	-- upvalues: (copy) v_u_13
	local v269 = v_u_13.get(p268)
	if not v269 then
		local v270 = RaycastParams.new()
		v270.FilterType = Enum.RaycastFilterType.Include
		v270.FilterDescendantsInstances = { p268 }
		v269 = v_u_13.bind(p268, {
			["MaxDistance"] = 32,
			["RaycastParams"] = nil,
			["RaycastParams"] = v270
		})
	end
	return v269
end
local function v_u_282(p272) -- name: UpdateEggInfo
	-- upvalues: (copy) v_u_33, (ref) v_u_41, (copy) v_u_8, (copy) v_u_11, (copy) v_u_10
	local v273 = v_u_33[p272]
	if v273 then
		local v274 = p272:GetAttribute("HatchedFrom") or "Egg"
		local v275 = p272:GetAttribute("TimeUntilHatch") or 0
		local v276 = p272:GetAttribute("ReadyToHatch")
		if not v_u_41.Name:find("Gamepad") then
			local _ = v_u_41 == Enum.UserInputType.Touch
		end
		local _ = v276 or v275 <= 0
		local v277 = v273:FindFirstChild("Price", true)
		local v278 = v273:FindFirstChild("Item", true)
		if v278 and v278:IsA("TextLabel") then
			v278.RichText = true
			local v279 = v_u_8.Entries[v274]
			if v279 then
				v278.Text = v_u_11.color(v279.Color)(v274)
			else
				v278.Text = v274
			end
			local v280 = v277:FindFirstChild("Detail")
			if v280 and v280:IsA("TextLabel") then
				v277.Label.Visible = false
				v280.Visible = true
				if v276 or v275 <= 0 then
					v280.Text = "Ready to Hatch!"
				else
					v280.Text = ("Hatching in %*"):format((v_u_10:GenerateColonFormatFromTime(v275)))
				end
			end
		end
		local v281 = v273:FindFirstChild("Action", true)
		if v281 and v281:IsA("TextLabel") then
			v281.Text = ("[%* To %*]"):format(v_u_41.Name:find("Gamepad") and "L2" or (v_u_41 == Enum.UserInputType.Touch and "Tap" or "Click"), (v276 or v275 <= 0) and "Hatch" or "Skip")
		end
	end
end
v_u_3.LastInputTypeChanged:Connect(function(p283)
	-- upvalues: (ref) v_u_41, (copy) v_u_33, (copy) v_u_282
	v_u_41 = p283
	for v284 in v_u_33 do
		v_u_282(v284)
	end
end)
local function v_u_291(p285) -- name: SetActiveEgg
	-- upvalues: (copy) v_u_38, (ref) v_u_36, (copy) v_u_282, (copy) v_u_33, (copy) v_u_12, (copy) v_u_21, (ref) v_u_23, (copy) v_u_19, (copy) v_u_18, (ref) v_u_39, (copy) v_u_3, (ref) v_u_40, (copy) v_u_267
	if p285 and v_u_38[p285] then
		p285 = nil
	end
	if v_u_36 == p285 then
		if p285 then
			v_u_282(p285)
		end
		return
	else
		if v_u_36 and v_u_33[v_u_36] then
			v_u_12.Hide(v_u_33[v_u_36])
		end
		v_u_36 = p285
		if v_u_36 and v_u_33[v_u_36] then
			v_u_282(v_u_36)
			v_u_12.Show(v_u_33[v_u_36])
			local v286 = v_u_21
			local v287
			if v_u_23 then
				v287 = v_u_19
			else
				v287 = v_u_18
			end
			v286.OutlineColor = v287
			v_u_21.Adornee = v_u_36:FindFirstChildOfClass("Model")
			if not v_u_39 then
				v_u_39 = v_u_3.InputChanged:Connect(function(p288, p289)
					-- upvalues: (ref) v_u_36, (ref) v_u_21, (ref) v_u_40, (ref) v_u_267
					if p289 then
						return
					elseif p288.KeyCode == Enum.KeyCode.ButtonL2 then
						if v_u_36 and v_u_21.Adornee then
							local v290 = p288.Position.Z > 0.75
							if v290 and not v_u_40 then
								v_u_40 = true
								v_u_267(v_u_36, v_u_36:FindFirstChildOfClass("Model"))
							elseif not v290 and v_u_40 then
								v_u_40 = false
							end
						else
							return
						end
					else
						return
					end
				end)
			end
		else
			v_u_21.Adornee = nil
			if v_u_39 then
				v_u_39:Disconnect()
				v_u_39 = nil
			end
			v_u_40 = false
			return
		end
	end
end
local function v_u_309(p_u_292) -- name: CreateEggModel
	-- upvalues: (copy) v_u_29, (copy) v_u_30, (copy) v_u_33, (copy) v_u_282, (copy) v_u_63, (copy) v_u_271, (ref) v_u_34, (copy) v_u_291, (ref) v_u_35, (copy) v_u_37, (copy) v_u_7, (copy) v_u_32, (copy) v_u_38, (copy) v_u_12, (ref) v_u_36, (copy) v_u_21, (copy) v_u_15, (copy) v_u_261, (copy) v_u_16
	local v293 = p_u_292:GetAttribute("HatchedFrom")
	local v294 = p_u_292:GetAttribute("OwnerUserId")
	if not v293 then
		warn("BeeColonyEggRenderController:CreateEggModel | BeeData has no HatchedFrom")
		return nil
	end
	local v295 = v_u_29:FindFirstChild(v293)
	if not v295 then
		warn((("BeeColonyEggRenderController:CreateEggModel | no model found for egg type \"%*\""):format(v293)))
		return nil
	end
	if not v295.PrimaryPart then
		warn((("BeeColonyEggRenderController:CreateEggModel | model has no primary part set \"%*\""):format(v293)))
		return nil
	end
	local v296 = p_u_292:FindFirstChildOfClass("Model")
	if v296 then
		for _, v297 in p_u_292:GetChildren() do
			if v297:IsA("Model") and v297 ~= v296 then
				v297:Destroy()
			end
		end
		local v298 = p_u_292:FindFirstChild("EggInfo")
		if v298 and v298:IsA("BillboardGui") then
			v298.Enabled = false
		else
			v298 = v_u_30:Clone()
			v298.Name = "EggInfo"
			v298.Enabled = false
			v298.Parent = p_u_292
		end
		v_u_33[p_u_292] = v298
		v_u_282(p_u_292)
		return v296
	end
	local v_u_299 = v295:Clone()
	for _, v300 in v_u_299:GetDescendants() do
		if v300:IsA("BasePart") then
			v300.CanCollide = false
			v300.Anchored = true
		end
	end
	v_u_299.PrimaryPart.Anchored = true
	v_u_299:PivotTo(p_u_292.CFrame)
	v_u_299.Parent = p_u_292
	p_u_292.ChildAdded:Connect(function(p301)
		-- upvalues: (copy) v_u_299
		if p301:IsA("Model") and p301 ~= v_u_299 then
			p301:Destroy()
		end
	end)
	if p_u_292:GetAttribute("ReadyToHatch") then
		v_u_63(p_u_292, v_u_299)
	end
	local v302 = p_u_292:FindFirstChild("EggInfo")
	if v302 and v302:IsA("BillboardGui") then
		v302.Enabled = false
	else
		v302 = v_u_30:Clone()
		v302.Name = "EggInfo"
		v302.Enabled = false
		v302.Parent = p_u_292
	end
	v_u_33[p_u_292] = v302
	v_u_282(p_u_292)
	local v_u_303 = v_u_271(p_u_292)
	v_u_303.MouseHoverEnter:Connect(function()
		-- upvalues: (ref) v_u_34, (copy) p_u_292, (ref) v_u_291
		v_u_34 = p_u_292
		v_u_291(p_u_292)
	end)
	v_u_303.MouseHoverLeave:Connect(function()
		-- upvalues: (ref) v_u_34, (copy) p_u_292, (ref) v_u_291, (ref) v_u_35
		if v_u_34 == p_u_292 then
			v_u_34 = nil
			v_u_291(v_u_34 or v_u_35)
		end
	end)
	p_u_292:GetAttributeChangedSignal("TimeUntilHatch"):Connect(function()
		-- upvalues: (ref) v_u_282, (copy) p_u_292
		v_u_282(p_u_292)
	end)
	p_u_292:GetAttributeChangedSignal("ReadyToHatch"):Connect(function()
		-- upvalues: (ref) v_u_282, (copy) p_u_292, (ref) v_u_63, (copy) v_u_299, (ref) v_u_37, (ref) v_u_7
		v_u_282(p_u_292)
		if p_u_292:GetAttribute("ReadyToHatch") then
			v_u_63(p_u_292, v_u_299)
			return
		else
			local v304 = p_u_292
			local v305 = v_u_37[v304]
			if v305 then
				v305.Running = false
				if v305.Sparkle then
					v305.Sparkle.Enabled = false
					local v306 = v305.Sparkle.Parent
					if v306 then
						v_u_7:AddItem(v306, 1.5)
					end
				end
				v_u_37[v304] = nil
			end
		end
	end)
	p_u_292:GetAttributeChangedSignal("HatchedFrom"):Connect(function()
		-- upvalues: (ref) v_u_282, (copy) p_u_292
		v_u_282(p_u_292)
	end)
	if v294 == v_u_32.UserId then
		v_u_303.MouseClick:Connect(function()
			-- upvalues: (ref) v_u_38, (copy) p_u_292, (copy) v_u_303, (ref) v_u_33, (ref) v_u_12, (ref) v_u_34, (ref) v_u_35, (ref) v_u_36, (ref) v_u_21, (ref) v_u_15, (ref) v_u_261, (copy) v_u_299, (ref) v_u_16
			if v_u_38[p_u_292] then
				return
			else
				local v307 = p_u_292:GetAttribute("UUID")
				if v307 then
					if p_u_292:GetAttribute("ReadyToHatch") then
						v_u_38[p_u_292] = true
						v_u_303.MaxActivationDistance = 0
						local v308 = v_u_33[p_u_292]
						if v308 then
							v_u_12.Hide(v308)
						end
						if v_u_34 == p_u_292 then
							v_u_34 = nil
						end
						if v_u_35 == p_u_292 then
							v_u_35 = nil
						end
						if v_u_36 == p_u_292 then
							v_u_36 = nil
							v_u_21.Adornee = nil
						end
						v_u_15:FireServer(v307)
						v_u_261(p_u_292, v_u_299)
					else
						v_u_16:FireServer(v307)
					end
				else
					warn("BeeColonyEggRenderController | No UUID on bee egg")
					return
				end
			end
		end)
	end
	return v_u_299
end
local function v313(p310) -- name: RemoveEggModel
	-- upvalues: (copy) v_u_37, (copy) v_u_7, (copy) v_u_33, (copy) v_u_38, (ref) v_u_34, (ref) v_u_35, (ref) v_u_36, (copy) v_u_291
	if p310:IsA("BasePart") then
		local v311 = v_u_37[p310]
		if v311 then
			v311.Running = false
			if v311.Sparkle then
				v311.Sparkle.Enabled = false
				local v312 = v311.Sparkle.Parent
				if v312 then
					v_u_7:AddItem(v312, 1.5)
				end
			end
			v_u_37[p310] = nil
		end
		v_u_33[p310] = nil
		v_u_38[p310] = nil
		if v_u_34 == p310 then
			v_u_34 = nil
		end
		if v_u_35 == p310 then
			v_u_35 = nil
		end
		if v_u_36 == p310 then
			v_u_36 = nil
		end
	end
	p310:Destroy()
	v_u_291(v_u_34 or v_u_35)
end
local v_u_314 = v_u_35
local v_u_315 = v_u_36
local v_u_316 = v_u_34
local function v_u_323() -- name: GetClosestEgg
	-- upvalues: (copy) v_u_32, (copy) v_u_33, (copy) v_u_38
	local v317 = v_u_32.Character
	if not v317 then
		return nil
	end
	local v318 = v317:FindFirstChild("HumanoidRootPart")
	if not (v318 and v318:IsA("BasePart")) then
		return nil
	end
	local v319 = 32
	local v320 = nil
	for v321 in v_u_33 do
		if not v_u_38[v321] and v321:IsDescendantOf(workspace) then
			local v322 = (v318.Position - v321.Position).Magnitude
			if v322 <= v319 then
				v320 = v321
				v319 = v322
			end
		end
	end
	return v320
end
for _, v324 in v2:GetTagged("BeeSwarmEgg") do
	v_u_309(v324)
end
v2:GetInstanceAddedSignal("BeeSwarmEgg"):Connect(function(p325)
	-- upvalues: (copy) v_u_309, (copy) v_u_17
	v_u_309(p325)
	v_u_17.PlaceEgg:Play()
end)
v2:GetInstanceRemovedSignal("BeeSwarmEgg"):Connect(v313)
v_u_4.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_323, (ref) v_u_314, (copy) v_u_291, (ref) v_u_316, (ref) v_u_315, (copy) v_u_282
	local v326 = v_u_323()
	if v_u_314 == v326 then
		if v_u_315 then
			v_u_282(v_u_315)
		end
	else
		v_u_314 = v326
		v_u_291(v_u_316 or v_u_314)
	end
end)
return v31