local v_u_1 = game:GetService("TweenService")
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3)
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2
	local v5 = setmetatable({}, v4)
	v5.NPC = p3.NPC
	v5.OriginalParent = p3.OriginalParent
	v5.OriginalPosition = p3.OriginalPosition
	v5.ParticleContainer = p3.ParticleContainer
	v5.TweenDuration = p3.TweenDuration or 5
	v5.VerticalOffset = p3.VerticalOffset or 20
	v5.SoundName = p3.SoundName or "Rumble"
	v5.StorageFolder = p3.StorageFolder
	v5.SkipAnimation = p3.SkipAnimation or false
	v5.SkipAnimationEmitAmount = p3.SkipAnimationEmitAmount or 1
	v5.IsActive = false
	v5.CurrentTween = nil
	v5.CurrentConnection = nil
	v5.CurrentAlpha = nil
	return v5
end
function v_u_2.Appear(p_u_6)
	-- upvalues: (copy) v_u_1
	if p_u_6.IsActive then
		p_u_6:_cancelCurrentAnimation()
	end
	p_u_6.IsActive = true
	p_u_6.NPC.Parent = p_u_6.OriginalParent
	p_u_6.NPC:SetAttribute("State", "Entering")
	if p_u_6.SkipAnimation then
		p_u_6.NPC:PivotTo(p_u_6.OriginalPosition)
		p_u_6:_emitParticles(p_u_6.SkipAnimationEmitAmount)
		local v7 = p_u_6.ParticleContainer and p_u_6.ParticleContainer:FindFirstChild(p_u_6.SoundName)
		if v7 then
			v7:Play()
		end
		p_u_6:_cleanupAnimation()
	else
		local v_u_8 = p_u_6.OriginalPosition * CFrame.new(0, -p_u_6.VerticalOffset, 0) * CFrame.Angles(0, 3.141592653589793, 0)
		p_u_6.NPC:PivotTo(v_u_8)
		p_u_6:_toggleParticles(true)
		task.spawn(function()
			-- upvalues: (copy) p_u_6, (ref) v_u_1, (copy) v_u_8
			local v9 = Instance.new("NumberValue")
			v9.Value = 0
			p_u_6.CurrentAlpha = v9
			p_u_6.CurrentTween = v_u_1:Create(v9, TweenInfo.new(p_u_6.TweenDuration, Enum.EasingStyle.Linear), {
				["Value"] = 1
			})
			p_u_6.CurrentTween:Play()
			p_u_6.CurrentConnection = v9.Changed:Connect(function(p10)
				-- upvalues: (ref) p_u_6, (ref) v_u_8
				if p_u_6.NPC and p_u_6.NPC.Parent then
					p_u_6.NPC:PivotTo(v_u_8:Lerp(p_u_6.OriginalPosition, p10))
					if p10 >= 1 then
						p_u_6.NPC:SetAttribute("State", "Entered")
						p_u_6:_toggleParticles(false)
						p_u_6:_cleanupAnimation()
					end
				else
					p_u_6:_cancelCurrentAnimation()
				end
			end)
		end)
		p_u_6:_playSound()
	end
end
function v_u_2.Disappear(p_u_11)
	-- upvalues: (copy) v_u_1
	if p_u_11.IsActive then
		p_u_11:_cancelCurrentAnimation()
	end
	p_u_11.IsActive = true
	p_u_11.NPC:SetAttribute("State", "Leaving")
	if p_u_11.SkipAnimation then
		if not (p_u_11.NPC and p_u_11.NPC.Parent) then
			p_u_11:_cancelCurrentAnimation()
			return
		end
		p_u_11:_emitParticles(p_u_11.SkipAnimationEmitAmount)
		local v12 = p_u_11.ParticleContainer and p_u_11.ParticleContainer:FindFirstChild(p_u_11.SoundName)
		if v12 then
			v12:Play()
		end
		p_u_11:_cleanupAnimation()
		p_u_11.NPC:SetAttribute("State", "Left")
		if p_u_11.StorageFolder then
			p_u_11.NPC.Parent = p_u_11.StorageFolder
			return
		end
	else
		local v_u_13 = p_u_11.OriginalPosition * CFrame.new(0, -p_u_11.VerticalOffset, 0) * CFrame.Angles(0, 3.141592653589793, 0)
		p_u_11.NPC:PivotTo(p_u_11.OriginalPosition)
		p_u_11:_toggleParticles(true)
		task.spawn(function()
			-- upvalues: (copy) p_u_11, (ref) v_u_1, (copy) v_u_13
			local v14 = Instance.new("NumberValue")
			v14.Value = 0
			p_u_11.CurrentAlpha = v14
			p_u_11.CurrentTween = v_u_1:Create(v14, TweenInfo.new(p_u_11.TweenDuration, Enum.EasingStyle.Linear), {
				["Value"] = 1
			})
			p_u_11.CurrentTween:Play()
			p_u_11.CurrentConnection = v14.Changed:Connect(function(p15)
				-- upvalues: (ref) p_u_11, (ref) v_u_13
				if p_u_11.NPC and p_u_11.NPC.Parent then
					p_u_11.NPC:PivotTo(p_u_11.OriginalPosition:Lerp(v_u_13, p15))
					if p15 >= 1 then
						p_u_11.NPC:SetAttribute("State", "Left")
						if p_u_11.StorageFolder then
							p_u_11.NPC.Parent = p_u_11.StorageFolder
						end
						p_u_11:_toggleParticles(false)
						p_u_11:_cleanupAnimation()
					end
				else
					p_u_11:_cancelCurrentAnimation()
				end
			end)
		end)
		p_u_11:_playSound()
	end
end
function v_u_2._toggleParticles(p16, p17)
	if p16.ParticleContainer then
		for _, v18 in p16.ParticleContainer:GetChildren() do
			if v18:IsA("ParticleEmitter") then
				v18.Enabled = p17
			end
		end
	end
end
function v_u_2._emitParticles(p19, p20)
	if p19.ParticleContainer then
		for _, v21 in p19.ParticleContainer:GetChildren() do
			if v21:IsA("ParticleEmitter") then
				v21:Emit(p20)
			end
		end
	end
end
function v_u_2._playSound(p22)
	local v23 = p22.NPC.PrimaryPart
	if v23 then
		local v24 = v23:FindFirstChild(p22.SoundName)
		if v24 and v24:IsA("Sound") then
			v24.TimePosition = 0
			v24:Play()
		end
	end
end
function v_u_2._cancelCurrentAnimation(p25)
	if p25.CurrentConnection then
		p25.CurrentConnection:Disconnect()
		p25.CurrentConnection = nil
	end
	if p25.CurrentTween then
		p25.CurrentTween:Cancel()
		p25.CurrentTween = nil
	end
	if p25.CurrentAlpha then
		p25.CurrentAlpha:Destroy()
		p25.CurrentAlpha = nil
	end
	p25:_toggleParticles(false)
	p25.IsActive = false
end
function v_u_2._cleanupAnimation(p26)
	if p26.CurrentConnection then
		p26.CurrentConnection:Disconnect()
		p26.CurrentConnection = nil
	end
	if p26.CurrentAlpha then
		game.Debris:AddItem(p26.CurrentAlpha, 1)
		p26.CurrentAlpha = nil
	end
	p26.CurrentTween = nil
end
function v_u_2.Destroy(p27)
	p27:_cancelCurrentAnimation()
end
return v_u_2