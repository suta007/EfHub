local v1 = {}
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TweenService")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = workspace:WaitForChild("SoundEffects", 30)
local v_u_7 = game.Players.LocalPlayer.PlayerGui:WaitForChild("SFX", 30)
local v_u_8 = v_u_3:WaitForChild("Music"):WaitForChild("SFX")
local v9 = v5.GameEvents.PlaySoundNew
local v_u_10 = {}
local function v_u_11(...)
	if game:GetService("RunService"):IsStudio() then
		warn((("[%*]: %*"):format(script.Name, (...))))
	end
end
local function v_u_15(p12, p13)
	-- upvalues: (copy) v_u_4
	p12.Volume = 0
	local v_u_14 = v_u_4:Create(p12, TweenInfo.new(p13.FadeInDuration or 1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Volume"] = p13.Volume
	})
	v_u_14:Play()
	v_u_14.Completed:Once(function()
		-- upvalues: (copy) v_u_14
		v_u_14:Destroy()
	end)
	return v_u_14
end
local function v_u_19(p16, p17)
	-- upvalues: (copy) v_u_4
	local v_u_18 = v_u_4:Create(p16, TweenInfo.new(p17.FadeInDuration or 1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		["Volume"] = 0
	})
	v_u_18:Play()
	v_u_18.Completed:Once(function()
		-- upvalues: (copy) v_u_18
		v_u_18:Destroy()
	end)
	return v_u_18
end
local function v_u_24(p20, p21)
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	if not p21 then
		task.wait(10)
	end
	if p20.IsPlaying then
		return
	else
		local v22 = v_u_10[p20.SoundId]
		if v22 then
			local v23 = table.find(v22, p20)
			if v23 then
				table.remove(v22, v23)
				if #v22 == 0 then
					v_u_10[p20.SoundId] = nil
				end
				if not p21 then
					if p20.Parent and p20.Parent:IsA("Attachment") then
						v_u_2:AddItem(p20.Parent, 1)
					end
					p20:AddTag("DestroyedBySoundPlayer")
					v_u_2:AddItem(p20, 0.5)
				end
			end
		else
			return
		end
	end
end
local function v_u_30(p25)
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	local v26 = nil
	local v27 = v_u_10[p25]
	if not v27 then
		v27 = {}
		v_u_10[p25] = v27
	end
	for _, v28 in v27 do
		if v28 and not v28.IsPlaying then
			v26 = v28
			break
		end
	end
	if v26 == nil then
		v26 = Instance.new("Sound")
		v26.SoundId = p25
		table.insert(v27, v26)
	end
	if v26 then
		local v29 = v26.Parent
		if v29 and v29:IsA("Attachment") then
			v26.Parent = v_u_6
			v29:Destroy()
		end
	end
	return v26
end
local function v_u_35(p_u_31, p32)
	local v_u_33 = false
	task.spawn(function()
		-- upvalues: (copy) p_u_31, (ref) v_u_33
		if not p_u_31.IsLoaded then
			p_u_31.Loaded:Wait()
		end
		v_u_33 = true
	end)
	local v34 = os.clock()
	while not v_u_33 and os.clock() - v34 < p32 do
		task.wait()
	end
	return v_u_33
end
local function v_u_54(p36, p_u_37, p38, p39, p40, p41)
	-- upvalues: (copy) v_u_11, (copy) v_u_30, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10, (copy) v_u_35, (copy) v_u_15, (copy) v_u_19, (copy) v_u_24
	if p36 then
		if p36 == "rbxassetid://0" then
			v_u_11("[PlaySound()] SoundID is rbxassetid://0!")
			return nil
		else
			local v_u_42 = v_u_30(p36)
			local v43 = Instance.new("Attachment")
			v_u_42.SoundId = p36
			v_u_42.SoundGroup = v_u_3.Music.SFX
			if p39 then
				v43.Parent = p39
				v_u_42.Parent = v43
			elseif p38 then
				v43.Parent = v_u_6
				v_u_42.Parent = v43
			else
				v_u_42.Parent = v_u_7
			end
			if p38 then
				v43.WorldCFrame = CFrame.new(p38)
			else
				v43.CFrame = CFrame.new(Vector3.new(0, 0, 0))
			end
			if p_u_37 then
				v_u_42.RollOffMaxDistance = p_u_37.RollOffMaxDistance or 1000
				v_u_42.RollOffMinDistance = p_u_37.RollOffMinDistance or 10
				v_u_42.RollOffMode = p_u_37.RollOffMode or Enum.RollOffMode.Inverse
				v_u_42.Looped = p_u_37.Looped or false
				v_u_42.PlaybackSpeed = p_u_37.PlaybackSpeed or 1
				v_u_42.TimePosition = p_u_37.TimePosition or 0
				v_u_42.Volume = p_u_37.Volume or 0.5
				v_u_42.SoundGroup = p_u_37.SoundGroup or v_u_8
			end
			v_u_42.Destroying:Once(function()
				-- upvalues: (copy) v_u_42, (ref) v_u_10
				if v_u_42:HasTag("DestroyedBySoundPlayer") then
					return
				else
					local v44 = v_u_42
					if v44.IsPlaying then
						return
					else
						local v45 = v_u_10[v44.SoundId]
						if v45 then
							local v46 = table.find(v45, v44)
							if v46 then
								table.remove(v45, v46)
								if #v45 == 0 then
									v_u_10[v44.SoundId] = nil
								end
							end
						else
							return
						end
					end
				end
			end)
			if v_u_35(v_u_42, 3) then
				if p_u_37 then
					if p_u_37.FadeInDuration then
						v_u_15(v_u_42, p_u_37)
					end
					if p_u_37.FadeOutDuration then
						local v47 = p_u_37.LoopDuration or v_u_42.TimeLength
						task.delay(v47 - p_u_37.FadeOutDuration, function()
							-- upvalues: (copy) v_u_42, (ref) v_u_19, (copy) p_u_37
							if v_u_42 then
								v_u_19(v_u_42, p_u_37)
							end
						end)
					end
				end
				if p40 then
					for _, v48 in p40 do
						v_u_42:AddTag(v48)
					end
				end
				if p41 then
					for v49, v50 in p41 do
						local v51 = Instance.new(v49)
						for v52, v53 in v50 do
							v51[v52] = v53
						end
						v51.Parent = v_u_42
					end
				end
				v_u_42.Ended:Once(function()
					-- upvalues: (ref) v_u_24, (copy) v_u_42
					v_u_24(v_u_42)
				end)
				v_u_42:Play()
				return v_u_42
			elseif p36 == "" then
				print("[SoundPlayer]: Sound did not load: Sound Id is an empty string.")
				return v_u_42
			else
				warn((("[SoundPlayer]: Sound Id %* did not load in time!"):format(p36)))
				return v_u_42
			end
		end
	else
		v_u_11("[PlaySound()] SoundID is nil!")
		return nil
	end
end
function v1.PlaySound(_, p55, p56, p57, p58, p59, p60)
	-- upvalues: (copy) v_u_54
	return v_u_54(p55, p56, p57, p58, p59, p60)
end
v9.OnClientEvent:Connect(function(...)
	-- upvalues: (copy) v_u_54
	v_u_54(...)
end)
return v1