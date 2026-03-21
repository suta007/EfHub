local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = {
	["EffectInstance"] = nil,
	["EmitDivider"] = 1,
	["CurrentScale"] = 1,
	["OriginalScale"] = {}
}
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(script.Parent:WaitForChild("TableUtil"))
local function v_u_12(p6, p7)
	if p7 == 0 then
		return p6.Keypoints[1].Value
	end
	if p7 == 1 then
		return p6.Keypoints[#p6.Keypoints].Value
	end
	for v8 = 1, #p6.Keypoints - 1 do
		local v9 = p6.Keypoints[v8]
		local v10 = p6.Keypoints[v8 + 1]
		if v9.Time <= p7 and p7 < v10.Time then
			local v11 = (p7 - v9.Time) / (v10.Time - v9.Time)
			return Color3.new((v10.Value.R - v9.Value.R) * v11 + v9.Value.R, (v10.Value.G - v9.Value.G) * v11 + v9.Value.G, (v10.Value.B - v9.Value.B) * v11 + v9.Value.B)
		end
	end
end
function v_u_1.new(p13)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	local v14 = v_u_5.Reconcile(p13, v_u_2)
	local v15 = {
		["EffectInstance"] = v14.EffectInstance:Clone() or Instance.new("Part"),
		["EmitDivider"] = v14.EmitDivider or 1,
		["CurrentScale"] = v14.CurrentScale or 1,
		["OriginalScale"] = v14.OriginalScale or {}
	}
	local v16 = v_u_1
	return setmetatable(v15, v16)
end
function v_u_1.SetCFrame(p17, p18)
	if not p17.EffectInstance then
		return false
	end
	if p17.EffectInstance:IsA("BasePart") or (p17.EffectInstance:IsA("Part") or p17.EffectInstance:IsA("MeshPart")) then
		p17.EffectInstance.CFrame = p18
	elseif p17.EffectInstance:IsA("Model") and p17.EffectInstance.PrimaryPart then
		p17.EffectInstance:SetPrimaryPartCFrame(p18)
	end
	return true
end
function v_u_1.AttachTo(p19, p20)
	local v21 = Instance.new("WeldConstraint")
	p19.EffectInstance.Massless = true
	p19.EffectInstance.CanCollide = false
	v21.Part0 = p20
	v21.Part1 = p19.EffectInstance
	v21.Parent = p19.EffectInstance
	return v21
end
function v_u_1.Play(p_u_22, p23)
	if not p_u_22.EffectInstance then
		return false
	end
	local v24 = p_u_22.EffectInstance:GetDescendants()
	local v25 = p_u_22.EffectInstance
	table.insert(v24, v25)
	local v_u_26 = p23 or {}
	for _, v_u_27 in ipairs(v24) do
		if v_u_27:IsA("ParticleEmitter") then
			local v_u_28 = v_u_27:GetAttribute("EmitCount") or 1
			local v_u_29 = v_u_27:GetAttribute("EmitRepeat") or 1
			local v_u_30 = v_u_27:GetAttribute("EmitDelay") or 0
			if v_u_30 > 0 then
				task.delay(v_u_30, function()
					-- upvalues: (copy) v_u_29, (ref) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) p_u_22, (copy) v_u_30
					for _ = 1, v_u_29 do
						if not (table.find(v_u_26, v_u_27) or table.find(v_u_26, v_u_27.Name)) then
							local v31 = v_u_27
							local v32 = v_u_28 / (p_u_22.EmitDivider or 1)
							v31:Emit((math.ceil(v32)))
						end
						task.wait(v_u_30)
					end
				end)
			else
				for _ = 1, v_u_29 do
					if not (table.find(v_u_26, v_u_27) or table.find(v_u_26, v_u_27.Name)) then
						local v33 = v_u_28 / p_u_22.EmitDivider
						v_u_27:Emit((math.ceil(v33)))
					end
				end
			end
		end
	end
	return true
end
function v_u_1.Emit(p34, p35, p36)
	if not p34.EffectInstance then
		return false
	end
	local v37 = p36 or {}
	local v38 = p35 or 1
	for _, v39 in ipairs(p34.EffectInstance:GetDescendants()) do
		if v39:IsA("ParticleEmitter") and not (table.find(v37, v39) or table.find(v37, v39.Name)) then
			local v40 = v38 / p34.EmitDivider
			v39:Emit((math.ceil(v40)))
		end
	end
	return true
end
function v_u_1.EmitForSeconds(p41, p42, p43)
	if not p41.EffectInstance then
		return false
	end
	local v44 = p43 or {}
	local v_u_45 = {}
	local v46 = p42 or 1
	for _, v_u_47 in ipairs(p41.EffectInstance:GetDescendants()) do
		if v_u_47:IsA("ParticleEmitter") then
			local v48 = v_u_47:GetAttribute("EmitDelay") or 0
			if not (table.find(v44, v_u_47) or table.find(v44, v_u_47.Name)) then
				if v48 > 0 then
					task.delay(v48, function()
						-- upvalues: (copy) v_u_47
						v_u_47.Enabled = true
					end)
				else
					v_u_47.Enabled = true
				end
				table.insert(v_u_45, v_u_47)
			end
		end
	end
	task.delay(v46, function()
		-- upvalues: (copy) v_u_45
		for _, v49 in ipairs(v_u_45) do
			if v49 then
				v49.Enabled = false
			end
		end
	end)
	return true
end
function v_u_1.Toggle(p50, p51, p52)
	-- upvalues: (copy) v_u_3
	if not p50.EffectInstance then
		return false
	end
	local v53 = p52 or {}
	for _, v54 in ipairs(p50.EffectInstance:GetDescendants()) do
		if v54:IsA("ParticleEmitter") then
			if not (table.find(v53, v54) or table.find(v53, v54.Name)) then
				local v55
				if p51 == nil then
					v55 = not v54.Enabled
				else
					v55 = p51
				end
				v54.Enabled = v55
			end
		elseif v54:IsA("Beam") then
			v54.Enabled = false
		elseif v54:IsA("PointLight") or v54:IsA("SpotLight") then
			v_u_3:Create(v54, TweenInfo.new(1), {
				["Brightness"] = 0
			}):Play()
		end
	end
	return true
end
function v_u_1.SetOriginalScale(p56, p57)
	p56.OriginalScale[p57] = {}
	p56.OriginalScale[p57].Size = p57.Size
	p56.OriginalScale[p57].Speed = p57.Speed
	p56.OriginalScale[p57].Acceleration = p57.Acceleration
end
function v_u_1.SetScale(p58, p59, p60, p61)
	if not (p58.EffectInstance and p58.OriginalScale) then
		return false
	end
	p58.CurrentScale = p59
	local v62 = p60 or {}
	for _, v63 in ipairs(p58.EffectInstance:GetDescendants()) do
		if v63:IsA("ParticleEmitter") then
			if not (table.find(v62, v63) or table.find(v62, v63.Name)) then
				if not p58.OriginalScale[v63] or p61 then
					p58:SetOriginalScale(v63)
				end
				local v64 = {}
				for _, v65 in ipairs(p58.OriginalScale[v63].Size.Keypoints) do
					local v66 = NumberSequenceKeypoint.new
					local v67 = v65.Time
					local v68 = v65.Value * p59
					local v69 = v65.Envelope * p59
					table.insert(v64, v66(v67, v68, v69))
				end
				local v70 = NumberSequence.new(v64)
				local v71 = NumberRange.new(p58.OriginalScale[v63].Speed.Min * p59, p58.OriginalScale[v63].Speed.Max * p59)
				local v72 = p58.OriginalScale[v63].Acceleration * p59
				v63.Size = v70
				v63.Speed = v71
				v63.Acceleration = v72
			end
		elseif v63:IsA("Attachment") then
			v63.Position = v63.Position * p59
		elseif v63:IsA("Beam") then
			v63.CurveSize0 = v63.CurveSize0 * p59
			v63.CurveSize1 = v63.CurveSize1 * p59
			v63.Width0 = v63.Width0 * p59
			v63.Width1 = v63.Width1 * p59
		end
	end
	return true
end
function v_u_1.SetColor(p73, p74, p75)
	if not p73.EffectInstance then
		return false
	end
	local v76 = p75 or {}
	for _, v77 in ipairs(p73.EffectInstance:GetDescendants()) do
		if v77:IsA("ParticleEmitter") and not (table.find(v76, v77) or table.find(v76, v77.Name)) then
			v77.Color = p74
		end
	end
	return true
end
function v_u_1.SetSize(p78, p79, p80)
	if not p78.EffectInstance then
		return false
	end
	local v81 = p80 or {}
	for _, v82 in ipairs(p78.EffectInstance:GetDescendants()) do
		if v82:IsA("ParticleEmitter") and not (table.find(v81, v82) or table.find(v81, v82.Name)) then
			v82.Size = p79
		end
	end
	return true
end
function v_u_1.SetDelayTimeScale(p83, p84, p85)
	if not p83.EffectInstance then
		return false
	end
	local v86 = p85 or {}
	for _, v87 in ipairs(p83.EffectInstance:GetDescendants()) do
		if v87:IsA("ParticleEmitter") and (not table.find(v86, v87) and (not table.find(v86, v87.Name) and v87:GetAttribute("EmitDelay"))) then
			v87:SetAttribute("EmitDelay", v87:GetAttribute("EmitDelay") * (1 / p84))
		end
	end
	return true
end
function v_u_1.TweenScale(p_u_88, p_u_89, p_u_90, p91)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_92 = p91 or {}
	task.spawn(function()
		-- upvalues: (copy) p_u_88, (copy) p_u_90, (copy) p_u_89, (ref) v_u_3, (ref) v_u_92, (ref) v_u_4
		local v93 = os.clock()
		local v94 = p_u_88.CurrentScale
		p_u_88.CurrentScale = p_u_90
		repeat
			local v95 = (os.clock() - v93) / p_u_89.Time
			local v96 = v_u_3:GetValue(math.clamp(v95, 0, 1), p_u_89.EasingStyle, p_u_89.EasingDirection)
			p_u_88:SetScale(v94 + (p_u_90 - v94) * v96, v_u_92)
			v_u_4.Heartbeat:Wait()
		until os.clock() - v93 > p_u_89.Time or not p_u_88.EffectInstance
		if p_u_88.EffectInstance then
			p_u_88:SetScale(p_u_90, v_u_92)
		end
	end)
end
function v_u_1.TweenColor(p97, p_u_98, p_u_99, p100)
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_4
	local v101 = p100 or {}
	local v_u_102 = {}
	local v_u_103 = {}
	for _, v104 in ipairs(p97.EffectInstance:GetDescendants()) do
		if v104:IsA("ParticleEmitter") and not (table.find(v101, v104) or table.find(v101, v104.Name)) then
			table.insert(v_u_102, v104)
		end
	end
	local function v_u_117(p105)
		-- upvalues: (copy) v_u_102, (copy) v_u_103, (copy) p_u_99, (ref) v_u_12
		for _, v106 in ipairs(v_u_102) do
			if v106 then
				if not v_u_103[v106] then
					v_u_103[v106] = v106.Color
				end
				local v107 = {}
				for _, v108 in ipairs(p_u_99.Keypoints) do
					local v109 = v_u_12(v_u_103[v106], v108.Time)
					local v110 = v108.Value
					local v111 = v109.R + (v110.R - v109.R) * p105
					local v112 = v109.G + (v110.G - v109.G) * p105
					local v113 = v109.B + (v110.B - v109.B) * p105
					local v114 = ColorSequenceKeypoint.new
					local v115 = v108.Time
					local v116 = Color3.new
					table.insert(v107, v114(v115, v116(v111, v112, v113)))
				end
				v106.Color = ColorSequence.new(v107)
			end
		end
	end
	task.spawn(function()
		-- upvalues: (copy) p_u_98, (ref) v_u_3, (copy) v_u_117, (ref) v_u_4
		local v118 = os.clock()
		repeat
			local v119 = (os.clock() - v118) / p_u_98.Time
			v_u_117((v_u_3:GetValue(math.clamp(v119, 0, 1), p_u_98.EasingStyle, p_u_98.EasingDirection)))
			v_u_4.Heartbeat:Wait()
		until os.clock() - v118 > p_u_98.Time
		v_u_117(1)
	end)
end
function v_u_1.IncrementDelay(p120, p121, p122)
	local v123 = p122 or {}
	for _, v124 in ipairs(p120.EffectInstance:GetDescendants()) do
		if v124:IsA("ParticleEmitter") and (not table.find(v123, v124) and (not table.find(v123, v124.Name) and v124:GetAttribute("EmitDelay"))) then
			v124:SetAttribute("EmitDelay", v124:GetAttribute("EmitDelay") + p121)
		end
	end
end
function v_u_1.UnLock(p125, p126)
	local v127 = p126 or {}
	for _, v128 in ipairs(p125.EffectInstance:GetDescendants()) do
		if v128:IsA("ParticleEmitter") and not (table.find(v127, v128) or table.find(v127, v128.Name)) then
			v128.LockedToPart = false
		end
	end
end
function v_u_1.Destroy(p129)
	if p129.EffectInstance then
		p129.EffectInstance:Destroy()
	end
	table.clear(p129)
	setmetatable(p129, nil)
end
return v_u_1