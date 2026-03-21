local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Debris")
local v_u_6 = game:GetService("Workspace")
local v_u_7 = game:GetService("SoundService")
local _ = v1.LocalPlayer
local v_u_8 = script
local v_u_9 = Color3.fromRGB(255, 255, 0)
local v_u_10 = Color3.fromRGB(255, 140, 60)
local v_u_11 = Color3.fromRGB(255, 60, 40)
local function v_u_14(p12)
	if p12.PrimaryPart and p12.PrimaryPart:IsA("BasePart") then
		return p12.PrimaryPart
	end
	for _, v13 in p12:GetDescendants() do
		if v13:IsA("BasePart") then
			p12.PrimaryPart = v13
			return v13
		end
	end
	return nil
end
local function v_u_19(p15)
	-- upvalues: (copy) v_u_8, (copy) v_u_14
	local v16 = v_u_8:FindFirstChild(p15)
	if not (v16 and v16:IsA("Model")) then
		warn("[ChimeraVisuals] Missing asset:", p15)
		return nil
	end
	local v17 = v16:Clone()
	for _, v18 in v17:GetDescendants() do
		if v18:IsA("BasePart") then
			v18.Anchored = true
			v18.CanCollide = false
		end
	end
	v_u_14(v17)
	return v17
end
local function v_u_25(p20, p21)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	local v22 = Instance.new("Attachment", p20)
	local v23 = Instance.new("Attachment", p21)
	local v24 = Instance.new("Beam")
	v24.Attachment0 = v22
	v24.Attachment1 = v23
	v24.Width0 = 0.3
	v24.Width1 = 0.3
	v24.Brightness = 2
	v24.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v_u_9), ColorSequenceKeypoint.new(0.5, v_u_10), ColorSequenceKeypoint.new(1, v_u_11) })
	v24.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 0.8) })
	v24.Parent = p20
	return v24
end
local function v_u_29(p26, p27)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_5
	local v28 = script.Specs:Clone()
	v28.Color = ColorSequence.new(v_u_9, v_u_11)
	v28.LightEmission = 0.5
	v28.Speed = NumberRange.new(25, 50)
	v28.SpreadAngle = Vector2.new(180, 180)
	v28.Lifetime = NumberRange.new(0.5, 1.1)
	v28.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0) })
	v28.Parent = p26
	v28:Emit(p27)
	v_u_5:AddItem(v28, 2)
end
local function v_u_32(p30)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v31 = Instance.new("Part")
	v31.Shape = Enum.PartType.Ball
	v31.Material = Enum.Material.ForceField
	v31.Color = Color3.fromRGB(255, 120, 70)
	v31.Transparency = 0.4
	v31.Anchored = true
	v31.CanCollide = false
	v31.CastShadow = false
	v31.Size = Vector3.new(1, 1, 1)
	v31.CFrame = CFrame.new(p30)
	v31.Parent = v_u_6
	v_u_3:Create(v31, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Size"] = Vector3.new(55, 55, 55),
		["Transparency"] = 1
	}):Play()
	v_u_5:AddItem(v31, 1.65)
end
local function v_u_36(p33, p34)
	-- upvalues: (copy) v_u_3
	for _, v35 in p33:GetDescendants() do
		if v35:IsA("BasePart") then
			v_u_3:Create(v35, TweenInfo.new(p34, Enum.EasingStyle.Sine), {
				["Transparency"] = 1
			}):Play()
		end
	end
end
v2:WaitForChild("GameEvents"):WaitForChild("ChimeraVisuals").OnClientEvent:Connect(function(p37, p38, p39, p_u_40)
	-- upvalues: (copy) v_u_19, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_25, (copy) v_u_36, (copy) v_u_29, (copy) v_u_32, (copy) v_u_5
	local v_u_41 = v_u_19("GoatModel")
	local v_u_42 = v_u_19("LionModel")
	local v_u_43 = v_u_19("SnakeModel")
	local v_u_44 = v_u_19("ChimeraStone")
	if v_u_41 and (v_u_42 and (v_u_43 and v_u_44)) then
		v_u_41.Parent = v_u_6
		v_u_42.Parent = v_u_6
		v_u_43.Parent = v_u_6
		v_u_44.Parent = v_u_6
		local v45 = CFrame.new(p37)
		if v_u_41.PrimaryPart then
			v_u_41:PivotTo(v45)
		end
		local v46 = CFrame.new(p38)
		if v_u_42.PrimaryPart then
			v_u_42:PivotTo(v46)
		end
		local v47 = CFrame.new(p39)
		if v_u_43.PrimaryPart then
			v_u_43:PivotTo(v47)
		end
		local v48 = CFrame.new(p_u_40)
		if v_u_44.PrimaryPart then
			v_u_44:PivotTo(v48)
		end
		task.spawn(function()
			-- upvalues: (copy) v_u_41, (ref) v_u_4
			local v_u_49 = v_u_41
			if v_u_49.PrimaryPart then
				local v_u_50 = v_u_49.PrimaryPart.CFrame
				local v_u_51 = tick()
				v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_51, (copy) v_u_49, (copy) v_u_50
					local v52 = tick() - v_u_51
					local v53 = v52 / 1.5
					local v54 = math.clamp(v53, 0, 1) * 8
					local v55 = v52 * 3.141592653589793 * 2
					local v56 = v_u_49
					local v57 = v_u_50
					local v58 = v54 + math.sin(v55) * 1.25
					v56:PivotTo(v57 + Vector3.new(0, v58, 0))
				end)
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_42, (ref) v_u_4
			local v_u_59 = v_u_42
			if v_u_59.PrimaryPart then
				local v_u_60 = v_u_59.PrimaryPart.CFrame
				local v_u_61 = tick()
				v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_61, (copy) v_u_59, (copy) v_u_60
					local v62 = tick() - v_u_61
					local v63 = v62 / 1.5
					local v64 = math.clamp(v63, 0, 1) * 8
					local v65 = v62 * 3.141592653589793 * 2
					local v66 = v_u_59
					local v67 = v_u_60
					local v68 = v64 + math.sin(v65) * 1.25
					v66:PivotTo(v67 + Vector3.new(0, v68, 0))
				end)
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_43, (ref) v_u_4
			local v_u_69 = v_u_43
			if v_u_69.PrimaryPart then
				local v_u_70 = v_u_69.PrimaryPart.CFrame
				local v_u_71 = tick()
				v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_71, (copy) v_u_69, (copy) v_u_70
					local v72 = tick() - v_u_71
					local v73 = v72 / 1.5
					local v74 = math.clamp(v73, 0, 1) * 8
					local v75 = v72 * 3.141592653589793 * 2
					local v76 = v_u_69
					local v77 = v_u_70
					local v78 = v74 + math.sin(v75) * 1.25
					v76:PivotTo(v77 + Vector3.new(0, v78, 0))
				end)
			end
		end)
		task.delay(0.8, function()
			-- upvalues: (ref) v_u_7
			local v79 = v_u_7:FindFirstChild("ChimeraStone")
			if v79 then
				v79.PlaybackSpeed = 1
				v79.TimePosition = 0
				v79:Play()
			end
		end)
		task.delay(1.5, function()
			-- upvalues: (ref) v_u_25, (copy) v_u_41, (copy) v_u_44, (copy) v_u_42, (copy) v_u_43, (ref) v_u_4, (ref) v_u_36, (ref) v_u_29, (ref) v_u_32, (ref) v_u_19, (ref) v_u_6, (copy) p_u_40, (ref) v_u_5
			local v_u_80 = v_u_25(v_u_41.PrimaryPart, v_u_44.PrimaryPart)
			local v_u_81 = v_u_25(v_u_42.PrimaryPart, v_u_44.PrimaryPart)
			local v_u_82 = v_u_25(v_u_43.PrimaryPart, v_u_44.PrimaryPart)
			local v_u_83 = v_u_44
			if v_u_83.PrimaryPart then
				local v_u_84 = v_u_83.PrimaryPart.CFrame
				local v_u_85 = tick()
				v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_85, (copy) v_u_83, (copy) v_u_84
					local v86 = tick() - v_u_85
					local v87 = v86 / 1.5
					local v88 = math.clamp(v87, 0, 1) * 8
					local v89 = v86 * 3.141592653589793 * 2
					local v90 = v_u_83
					local v91 = v_u_84
					local v92 = v88 + math.sin(v89) * 1.25
					v90:PivotTo(v91 + Vector3.new(0, v92, 0))
				end)
			end
			local v_u_93 = v_u_44
			local v94 = 0.05
			if v_u_93.PrimaryPart then
				local v_u_95 = v94 or 1
				local v_u_96 = v_u_93.PrimaryPart.CFrame
				local v_u_97 = tick()
				local v_u_98 = nil
				local v_u_99 = 3
				local v_u_100 = 0.65
				v_u_98 = v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_97, (copy) v_u_99, (ref) v_u_95, (copy) v_u_100, (copy) v_u_93, (copy) v_u_96, (ref) v_u_98
					local v101 = (tick() - v_u_97) / v_u_99
					local v102 = math.clamp(v101, 0, 1)
					v_u_93:ScaleTo(v_u_95 + (v_u_100 - v_u_95) * v102)
					v_u_93:PivotTo(v_u_96)
					if v102 >= 1 then
						v_u_98:Disconnect()
					end
				end)
			end
			v_u_36(v_u_41, 3)
			v_u_36(v_u_42, 3)
			v_u_36(v_u_43, 3)
			task.delay(3, function()
				-- upvalues: (copy) v_u_80, (copy) v_u_81, (copy) v_u_82, (ref) v_u_44, (ref) v_u_29, (ref) v_u_32, (ref) v_u_19, (ref) v_u_6, (ref) p_u_40, (ref) v_u_4, (ref) v_u_5, (ref) v_u_41, (ref) v_u_42, (ref) v_u_43
				if v_u_80 then
					v_u_80.Enabled = false
				end
				if v_u_81 then
					v_u_81.Enabled = false
				end
				if v_u_82 then
					v_u_82.Enabled = false
				end
				local v103 = v_u_44.PrimaryPart
				v_u_29(v103, 140)
				v_u_32(v103.Position)
				v_u_44:Destroy()
				local v_u_104 = v_u_19("ChimeraModel")
				if v_u_104 then
					v_u_104.Parent = v_u_6
					local v105 = CFrame.new(p_u_40)
					if v_u_104.PrimaryPart then
						v_u_104:PivotTo(v105)
					end
					if v_u_104.PrimaryPart then
						local v_u_106 = v_u_104.PrimaryPart.CFrame
						local v_u_107 = tick()
						v_u_4.RenderStepped:Connect(function()
							-- upvalues: (copy) v_u_107, (copy) v_u_104, (copy) v_u_106
							local v108 = tick() - v_u_107
							local v109 = v108 / 1.5
							local v110 = math.clamp(v109, 0, 1) * 8
							local v111 = v108 * 3.141592653589793 * 2
							local v112 = v_u_104
							local v113 = v_u_106
							local v114 = v110 + math.sin(v111) * 1.25
							v112:PivotTo(v113 + Vector3.new(0, v114, 0))
						end)
					end
					v_u_5:AddItem(v_u_104, 4)
				end
				v_u_5:AddItem(v_u_41, 10)
				v_u_5:AddItem(v_u_42, 10)
				v_u_5:AddItem(v_u_43, 10)
			end)
		end)
	end
end)