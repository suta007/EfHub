game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("SoundService")
local v_u_2 = workspace:WaitForChild("SoundEffects")
local v_u_3 = {}
local function v_u_6(p4)
	if typeof(p4) == "string" then
		local v5 = Instance.new("Sound")
		v5.SoundId = p4
		return v5
	else
		if typeof(p4) == "Instance" and p4:IsA("Sound") then
			return p4:Clone()
		end
		warn((("SoundHandler:GetSound | Invalid sound input: %*. Must be Sound instance or SoundId string."):format(p4)))
		return nil
	end
end
function v_u_3.PlaySoundOnInstance(_, p7, p8)
	-- upvalues: (copy) v_u_6
	local v9
	if p8 and (p8:IsA("BasePart") or p8:IsA("Attachment")) then
		v9 = p8
	else
		v9 = p8 and p8:FindFirstChildWhichIsA("BasePart")
		if not v9 then
			if p8 then
				v9 = p8:FindFirstChildWhichIsA("Attachment")
			else
				v9 = p8
			end
		end
		if not v9 then
			warn((("SoundHandler:PlaySoundOnPart | Invalid part:%* provided for sound %*. Must BE or CONTAIN a BasePart or Attachment."):format(p8, p7)))
			return nil
		end
	end
	local v_u_10 = v_u_6(p7)
	if not v_u_10 then
		return nil
	end
	v_u_10.Parent = v9
	local v11, v12 = pcall(function()
		-- upvalues: (copy) v_u_10
		v_u_10:Play()
	end)
	if v11 then
		v_u_10.Ended:Connect(function()
			-- upvalues: (copy) v_u_10
			v_u_10:Destroy()
		end)
		return v_u_10
	end
	warn((("SoundHandler:PlaySoundOnPart | Failed to play sound %* on part %*: %*"):format(p7, v9.Name, v12)))
	v_u_10:Destroy()
	return nil
end
function v_u_3.PlaySoundAtPosition(_, p13, p14)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_15 = Instance.new("Part")
	v_u_15.Anchored = true
	v_u_15.CanCollide = false
	v_u_15.Transparency = 1
	v_u_15.Size = Vector3.new(1, 1, 1)
	if typeof(p14) == "Vector3" then
		v_u_15.CFrame = CFrame.new(p14)
	elseif typeof(p14) == "CFrame" then
		v_u_15.CFrame = p14
	else
		if typeof(p14) ~= "Instance" or not p14:IsA("BasePart") then
			warn((("SoundHandler:PlaySoundAtPosition | Invalid position: %*"):format(p14)))
			v_u_15:Destroy()
			return nil
		end
		v_u_15.CFrame = p14.CFrame
	end
	v_u_15.Parent = v_u_2
	local v16 = v_u_3:PlaySoundOnInstance(p13, v_u_15)
	if v16 then
		v16.Ended:Connect(function()
			-- upvalues: (copy) v_u_15
			v_u_15:Destroy()
		end)
		return v16
	else
		v_u_15:Destroy()
		return v16
	end
end
function v_u_3.PlaySound(_, p17)
	-- upvalues: (copy) v_u_6, (copy) v_u_1
	local v_u_18 = v_u_6(p17)
	if not v_u_18 then
		return nil
	end
	v_u_18.Parent = v_u_1
	local v19, v20 = pcall(function()
		-- upvalues: (copy) v_u_18
		v_u_18:Play()
	end)
	if v19 then
		v_u_18.Ended:Connect(function()
			-- upvalues: (copy) v_u_18
			v_u_18:Destroy()
		end)
		return v_u_18
	end
	warn((("SoundHandler:PlaySound | Failed to play sound %*: %*"):format(p17, v20)))
	v_u_18:Destroy()
	return nil
end
function v_u_3.FadeOut(_, p_u_21, p_u_22, p23)
	if p_u_21 and p_u_21:IsA("Sound") then
		local v_u_24 = p23 or false
		task.spawn(function()
			-- upvalues: (copy) p_u_21, (copy) p_u_22, (ref) v_u_24
			local v25 = tick()
			local v26 = p_u_21.Volume
			while tick() - v25 < p_u_22 do
				p_u_21.Volume = v26 * (1 - (tick() - v25) / p_u_22)
				task.wait()
			end
			p_u_21:Stop()
			p_u_21.Volume = v26
			if v_u_24 then
				p_u_21:Destroy()
			end
		end)
	else
		warn("Invalid sound object provided.")
	end
end
return v_u_3