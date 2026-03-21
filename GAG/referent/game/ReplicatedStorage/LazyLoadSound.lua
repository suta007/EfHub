local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = require(v1.Modules.Observers)
local v_u_4 = require(v1.Modules.Trove)
local function v_u_9(p_u_5, p_u_6)
	-- upvalues: (copy) v_u_2
	if p_u_5.SoundId == "rbxassetid://133426881644587" then
		local v7 = p_u_5:GetAttribute("SoundId")
		if v7 then
			local v_u_8 = p_u_5.TimePosition
			p_u_5.SoundId = v7
			p_u_6:Add(task.spawn(function()
				-- upvalues: (copy) p_u_5, (copy) v_u_8, (copy) p_u_6
				while p_u_5.IsPlaying and not p_u_5.IsLoaded do
					task.wait()
				end
				p_u_5.TimePosition = v_u_8
				p_u_6:Clean()
			end))
		elseif v_u_2:IsStudio() then
			warn((("LazyLoadSound %* is missing its SoundId attribute somehow"):format((p_u_5:GetFullName()))))
		end
	else
		return
	end
end
return v3.observeTag("LazyLoadSound", function(p_u_10)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_9
	if not p_u_10:IsA("Sound") then
		return nil
	end
	if v_u_2:IsServer() then
		if p_u_10.SoundId == "rbxassetid://133426881644587" then
			return nil
		end
		p_u_10:SetAttribute("SoundId", p_u_10.SoundId)
		p_u_10.SoundId = "rbxassetid://133426881644587"
	end
	local v_u_11 = v_u_4.new()
	v_u_11:Connect(p_u_10:GetPropertyChangedSignal("Playing"), function()
		-- upvalues: (ref) v_u_9, (copy) p_u_10, (copy) v_u_11
		v_u_9(p_u_10, v_u_11)
	end)
	v_u_11:Connect(p_u_10.Played, function()
		-- upvalues: (ref) v_u_9, (copy) p_u_10, (copy) v_u_11
		v_u_9(p_u_10, v_u_11)
	end)
	if p_u_10.IsPlaying or p_u_10.Playing then
		v_u_9(p_u_10, v_u_11)
	end
	return v_u_11:WrapClean()
end)