local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Debris")
local v_u_6 = game:GetService("Workspace")
local _ = v1.LocalPlayer
local v_u_7 = script
local v_u_8 = Color3.fromRGB(255, 160, 220)
local v_u_9 = Color3.fromRGB(160, 100, 255)
local v_u_10 = Color3.fromRGB(147, 112, 219)
local function v_u_13(p11)
	if p11.PrimaryPart and p11.PrimaryPart:IsA("BasePart") then
		return p11.PrimaryPart
	end
	for _, v12 in p11:GetDescendants() do
		if v12:IsA("BasePart") then
			p11.PrimaryPart = v12
			return v12
		end
	end
	return nil
end
local function v_u_18(p14)
	-- upvalues: (copy) v_u_7, (copy) v_u_13
	local v15 = v_u_7:FindFirstChild(p14)
	if not (v15 and v15:IsA("Model")) then
		warn("[LichCrystalVisuals] Missing model asset:", p14)
		return nil
	end
	local v16 = v15:Clone()
	for _, v17 in v16:GetDescendants() do
		if v17:IsA("BasePart") then
			v17.Anchored = true
			v17.CanCollide = false
		end
	end
	v_u_13(v16)
	return v16
end
local function v_u_24(p19, p20)
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	local v21 = Instance.new("Attachment", p19)
	local v22 = Instance.new("Attachment", p20)
	local v23 = Instance.new("Beam")
	v23.Attachment0 = v21
	v23.Attachment1 = v22
	v23.Width0 = 0.25
	v23.Width1 = 0.25
	v23.Brightness = 2
	v23.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v_u_8), ColorSequenceKeypoint.new(1, v_u_9) })
	v23.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.7) })
	v23.Parent = p19
	return v23
end
local function v_u_28(p25, p26)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_5
	local v27 = script.Specs:Clone()
	v27.Color = ColorSequence.new(v_u_8, v_u_9)
	v27.LightEmission = 0.5
	v27.Speed = NumberRange.new(20, 45)
	v27.SpreadAngle = Vector2.new(180, 180)
	v27.Lifetime = NumberRange.new(0.6, 1.2)
	v27.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.5), NumberSequenceKeypoint.new(1, 0) })
	v27.Parent = p25
	v27:Emit(p26)
	v_u_5:AddItem(v27, 2)
end
local function v_u_31(p29)
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v30 = Instance.new("Part")
	v30.Shape = Enum.PartType.Ball
	v30.Material = Enum.Material.ForceField
	v30.Color = v_u_10
	v30.Transparency = 0.4
	v30.Anchored = true
	v30.CanCollide = false
	v30.CastShadow = false
	v30.Size = Vector3.new(1, 1, 1)
	v30.CFrame = CFrame.new(p29)
	v30.Parent = v_u_6
	v_u_3:Create(v30, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Size"] = Vector3.new(55, 55, 55),
		["Transparency"] = 1
	}):Play()
	v_u_5:AddItem(v30, 2.1)
end
local function v_u_44(p_u_32)
	-- upvalues: (copy) v_u_4
	if p_u_32.PrimaryPart then
		local v_u_33 = p_u_32.PrimaryPart.CFrame
		local v_u_34 = tick()
		local v35 = math.random()
		local v36 = math.random()
		local v37 = math.random() * 2
		Vector3.new(v35, v36, v37)
		return v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_34, (copy) p_u_32, (copy) v_u_33
			local v38 = tick() - v_u_34
			local v39 = v38 / 1.5
			local v40 = math.clamp(v39, 0, 1) * 8
			local v41 = Vector3.new(0, v40, 0)
			local v42 = v38 * 3.141592653589793 * 2
			local v43 = math.sin(v42) * 1.25
			p_u_32:PivotTo(v_u_33 + (v41 + Vector3.new(0, v43, 0)))
		end)
	end
end
local function v_u_48(p45, p46)
	-- upvalues: (copy) v_u_3
	for _, v47 in p45:GetDescendants() do
		if v47:IsA("BasePart") then
			v_u_3:Create(v47, TweenInfo.new(p46, Enum.EasingStyle.Sine), {
				["Transparency"] = 1
			}):Play()
		end
	end
end
v2:WaitForChild("GameEvents"):WaitForChild("LichCrystalVisuals").OnClientEvent:Connect(function(p49, p50, p51, p_u_52)
	-- upvalues: (copy) v_u_18, (copy) v_u_6, (copy) v_u_44, (copy) v_u_24, (copy) v_u_4, (copy) v_u_48, (copy) v_u_28, (copy) v_u_31, (copy) v_u_5
	local v_u_53 = v_u_18("BatModel")
	local v_u_54 = v_u_18("CrowModel")
	local v_u_55 = v_u_18("ScarabModel")
	local v_u_56 = v_u_18("LichCrystal")
	if v_u_53 and (v_u_54 and (v_u_55 and v_u_56)) then
		v_u_53.Parent = v_u_6
		v_u_54.Parent = v_u_6
		v_u_55.Parent = v_u_6
		v_u_56.Parent = v_u_6
		local v57 = CFrame.new(p49)
		if v_u_53.PrimaryPart then
			v_u_53:PivotTo(v57)
		end
		local v58 = CFrame.new(p50)
		if v_u_54.PrimaryPart then
			v_u_54:PivotTo(v58)
		end
		local v59 = CFrame.new(p51)
		if v_u_55.PrimaryPart then
			v_u_55:PivotTo(v59)
		end
		local v60 = CFrame.new(p_u_52)
		if v_u_56.PrimaryPart then
			v_u_56:PivotTo(v60)
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_44, (copy) v_u_53
			v_u_44(v_u_53)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_44, (copy) v_u_54
			v_u_44(v_u_54)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_44, (copy) v_u_55
			v_u_44(v_u_55)
		end)
		task.delay(1, function()
			local v61 = game.SoundService.LichCrystal
			v61.PlaybackSpeed = 1
			v61.TimePosition = 0
			v61.Playing = true
		end)
		task.delay(1.5, function()
			-- upvalues: (ref) v_u_24, (copy) v_u_53, (copy) v_u_56, (copy) v_u_54, (copy) v_u_55, (ref) v_u_44, (ref) v_u_4, (ref) v_u_48, (ref) v_u_28, (ref) v_u_31, (ref) v_u_5, (ref) v_u_18, (copy) p_u_52, (ref) v_u_6
			local v_u_62 = v_u_24(v_u_53.PrimaryPart, v_u_56.PrimaryPart)
			local v_u_63 = v_u_24(v_u_54.PrimaryPart, v_u_56.PrimaryPart)
			local v_u_64 = v_u_24(v_u_55.PrimaryPart, v_u_56.PrimaryPart)
			v_u_44(v_u_56)
			local v_u_65 = v_u_56
			local v66 = 0.05
			if v_u_65.PrimaryPart then
				local v_u_67 = v66 or 1
				local v_u_68 = v_u_65.PrimaryPart.CFrame
				local v_u_69 = tick()
				local v_u_70 = nil
				local v_u_71 = 3
				local v_u_72 = 0.5
				v_u_70 = v_u_4.RenderStepped:Connect(function()
					-- upvalues: (copy) v_u_69, (copy) v_u_71, (ref) v_u_67, (copy) v_u_72, (copy) v_u_65, (copy) v_u_68, (ref) v_u_70
					local v73 = (tick() - v_u_69) / v_u_71
					local v74 = math.clamp(v73, 0, 1)
					v_u_65:ScaleTo(v_u_67 + (v_u_72 - v_u_67) * v74)
					v_u_65:PivotTo(v_u_68)
					if v74 >= 1 then
						v_u_70:Disconnect()
					end
				end)
			end
			v_u_48(v_u_53, 3)
			v_u_48(v_u_54, 3)
			v_u_48(v_u_55, 3)
			task.delay(3, function()
				-- upvalues: (copy) v_u_62, (copy) v_u_63, (copy) v_u_64, (ref) v_u_56, (ref) v_u_28, (ref) v_u_31, (ref) v_u_4, (ref) v_u_5, (ref) v_u_18, (ref) p_u_52, (ref) v_u_44, (ref) v_u_6, (ref) v_u_53, (ref) v_u_54, (ref) v_u_55
				if v_u_62 then
					v_u_62.Enabled = false
				end
				if v_u_63 then
					v_u_63.Enabled = false
				end
				if v_u_64 then
					v_u_64.Enabled = false
				end
				local v75 = v_u_56.PrimaryPart
				v_u_28(v75, 120)
				v_u_31(v75.Position)
				v_u_56.Crystal.Transparency = 1
				local v_u_76 = v_u_56
				local v77 = 0.5
				if v_u_76.PrimaryPart then
					local v_u_78 = v77 or 1
					local v_u_79 = v_u_76.PrimaryPart.CFrame
					local v_u_80 = tick()
					local v_u_81 = nil
					local v_u_82 = 3
					local v_u_83 = 0.01
					v_u_81 = v_u_4.RenderStepped:Connect(function()
						-- upvalues: (copy) v_u_80, (copy) v_u_82, (ref) v_u_78, (copy) v_u_83, (copy) v_u_76, (copy) v_u_79, (ref) v_u_81
						local v84 = (tick() - v_u_80) / v_u_82
						local v85 = math.clamp(v84, 0, 1)
						v_u_76:ScaleTo(v_u_78 + (v_u_83 - v_u_78) * v85)
						v_u_76:PivotTo(v_u_79)
						if v85 >= 1 then
							v_u_81:Disconnect()
						end
					end)
				end
				v_u_5:AddItem(v_u_56, 3)
				local v86 = v_u_18("LichModel")
				local v87 = CFrame.new(p_u_52)
				if v86.PrimaryPart then
					v86:PivotTo(v87)
				end
				v_u_44(v86)
				v_u_5:AddItem(v86, 3)
				v86.Parent = v_u_6
				v_u_5:AddItem(v_u_53, 10)
				v_u_5:AddItem(v_u_54, 10)
				v_u_5:AddItem(v_u_55, 10)
			end)
		end)
	end
end)