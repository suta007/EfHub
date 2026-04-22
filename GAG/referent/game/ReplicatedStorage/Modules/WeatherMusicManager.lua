local v_u_1 = game:GetService("SoundService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = v_u_1.Music.Tunes.Music
local v_u_4 = v_u_1.Music.Tunes
local v_u_5 = {}
local v_u_6 = nil
local function v_u_19()
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_2, (copy) v_u_3
	local v7 = (-1 / 0)
	local v8 = nil
	for v9, v10 in v_u_5 do
		local v11 = v10.config.priority or 10
		if v7 < v11 then
			v8 = v9
			v7 = v11
		end
	end
	if v8 ~= v_u_6 then
		if v_u_6 and v_u_5[v_u_6] then
			local v12 = v_u_5[v_u_6]
			if v12.sound and v12.sound.Parent then
				local v13 = v12.sound
				local v14 = v12.config.fadeOut or 1
				v_u_2:Create(v13, TweenInfo.new(v14, Enum.EasingStyle.Linear), {
					["Volume"] = 0
				}):Play()
			end
		end
		v_u_6 = v8
		if v_u_6 then
			local v15 = v_u_5[v_u_6]
			local v16 = v15.config.fadeIn or 1
			v_u_2:Create(v_u_3, TweenInfo.new(v16, Enum.EasingStyle.Linear), {
				["Volume"] = 0
			}):Play()
			if v15.sound then
				if not v15.sound.IsPlaying then
					v15.sound.Volume = 0
					v15.sound:Play()
				end
				local v17 = v15.sound
				local v18 = {
					["Volume"] = v15.config.volume or 0.5
				}
				v_u_2:Create(v17, TweenInfo.new(v16, Enum.EasingStyle.Linear), v18):Play()
				return
			end
		else
			v_u_2:Create(v_u_3, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				["Volume"] = 1
			}):Play()
		end
	end
end
return {
	["Start"] = function(p20, p21)
		-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_4, (copy) v_u_1, (copy) v_u_19
		if v_u_5[p20] then
			local v22 = v_u_5[p20]
			if v22.sound and v22.sound.Parent then
				v22.sound:Stop()
				v22.sound:Destroy()
			end
			v_u_5[p20] = nil
			if v_u_6 == p20 then
				v_u_6 = nil
			end
		end
		local v23
		if p21.soundId and p21.soundId ~= "" then
			v23 = Instance.new("Sound")
			v23.Name = "WeatherMusic_" .. p20
			v23.SoundId = p21.soundId
			v23.Volume = 0
			if p21.looped == nil then
				v23.Looped = true
			else
				v23.Looped = p21.looped
			end
			if p21.playbackSpeed then
				v23.PlaybackSpeed = p21.playbackSpeed
			end
			if p21.timePosition then
				v23.TimePosition = p21.timePosition
			end
			v23.SoundGroup = v_u_4
			v23.Parent = v_u_1
		else
			v23 = nil
		end
		v_u_5[p20] = {
			["sound"] = v23,
			["config"] = p21
		}
		v_u_19()
		return v23
	end,
	["GetSound"] = function(p24)
		-- upvalues: (copy) v_u_5
		local v25 = v_u_5[p24]
		if v25 then
			return v25.sound
		else
			return nil
		end
	end,
	["Stop"] = function(p26)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_19
		local v27 = v_u_5[p26]
		if v27 then
			if v27.sound then
				local v28 = v27.config.fadeOut or 1
				v_u_2:Create(v27.sound, TweenInfo.new(v28, Enum.EasingStyle.Linear), {
					["Volume"] = 0
				}):Play()
				local v_u_29 = v27.sound
				task.delay(v28 + 0.5, function()
					-- upvalues: (copy) v_u_29
					if v_u_29 and v_u_29.Parent then
						v_u_29:Stop()
						v_u_29:Destroy()
					end
				end)
			end
			v_u_5[p26] = nil
			v_u_19()
		end
	end
}