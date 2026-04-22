local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Lighting")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v_u_5 = 70
local v_u_6 = 0
local v_u_7 = 0
local v_u_8 = {
	9.1,
	19.9,
	27.9,
	29.2,
	30.1,
	31.1,
	31.3,
	31.5,
	36.672,
	40.896,
	49.365,
	53.589,
	54.592,
	55.659,
	56.704,
	70.805,
	79.403,
	83.2,
	86.357,
	87.424,
	91.648,
	96,
	100.203,
	104.363,
	112.875,
	120.725,
	127.403,
	127.723,
	128.107,
	128.448,
	128.789,
	129.131,
	129.472,
	129.835,
	130.176,
	130.56,
	130.901,
	131.243,
	131.563,
	131.861,
	133.973
}
local function v_u_12(p9)
	for _, v10 in p9.Pyro:GetChildren() do
		local v11 = v10:FindFirstChild("Attachment")
		if v11 then
			v11.FireParticle:Emit(math.random(30, 40))
		end
	end
end
local v_u_13 = {
	["FloatUp"] = { script.FloatUp, 2 },
	["CasualPlaying"] = { script.CasualPlaying, 9, 1.5 },
	["IntensePlaying"] = { script.IntensePlaying, 71 },
	["AggressivePlaying"] = { script.AggressivePlaying, 116 },
	["FloatDown"] = { script.FloatDown, 134 }
}
local v_u_14 = {
	["FloatUp"] = 0.1,
	["CasualPlaying"] = 0.3,
	["IntensePlaying"] = 0.7,
	["AggressivePlaying"] = 1,
	["FloatDown"] = 0.1
}
local v_u_15 = CFrame.new(-369.231, -440.687, -9.923) * CFrame.Angles(0, -1.5707963267948966, 0)
local v_u_16 = false
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {}
local v_u_24 = nil
local function v_u_46(p25)
	-- upvalues: (ref) v_u_17, (ref) v_u_6, (ref) v_u_7
	local v26 = {}
	local v27 = {}
	for _, v28 in p25 do
		v26[v28] = v28.Material
		v27[v28] = v28.Color
	end
	local v29 = #p25
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		local v30
		if v_u_6 > 0.033 then
			local v31 = (v_u_6 - 0.033) / 0.017
			v30 = math.clamp(v31, 0, 1) * 0.5
		else
			v30 = 0
		end
		local v32 = v30 + v_u_7 * 0.5
		local v33 = math.clamp(v32, 0, 1)
		if v33 > 0.3 then
			for _, v34 in p25 do
				v34.Material = v26[v34]
				v34.Color = v27[v34]
			end
			local v35 = (v33 - 0.3) / 0.7
			local v36 = math.clamp(v35, 0, 1)
			local v37 = 1 + (v29 - 1) * v36
			local v38 = math.ceil(v37)
			local v39 = {}
			for _ = 1, math.random(1, v38) do
				repeat
					local v40 = math.random(1, v29)
				until not v39[v40]
				v39[v40] = true
			end
			for v41, _ in pairs(v39) do
				local v42 = p25[v41]
				v42.Material = Enum.Material.Neon
				local v43 = 0.5 + v33 * 0.5
				v42.Color = v27[v42]:Lerp(Color3.new(1, 1, 1), v43)
			end
		else
			for _, v44 in p25 do
				v44.Material = v26[v44]
				v44.Color = v27[v44]
			end
		end
		task.wait(0.1)
	end
	for _, v45 in p25 do
		v45.Material = v26[v45]
		v45.Color = v27[v45]
	end
end
local function v_u_60(p47)
	-- upvalues: (ref) v_u_17
	local v48 = p47.Red
	local v49 = p47.Green
	local v50 = Color3.fromRGB(255, 0, 0)
	local v51 = Color3.fromRGB(0, 255, 0)
	local v52 = Color3.fromRGB(0, 0, 0)
	local v53 = true
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		if v53 then
			for _, v54 in v48 do
				v54.Material = Enum.Material.Neon
				v54.Color = v50
			end
			for _, v55 in v49 do
				v55.Material = Enum.Material.Plastic
				v55.Color = v52
			end
		else
			for _, v56 in v49 do
				v56.Material = Enum.Material.Neon
				v56.Color = v51
			end
			for _, v57 in v48 do
				v57.Material = Enum.Material.Plastic
				v57.Color = v52
			end
		end
		task.wait(0.7)
		v53 = not v53
	end
	for _, v58 in v48 do
		v58.Material = Enum.Material.Neon
		v58.Color = v50
	end
	for _, v59 in v49 do
		v59.Material = Enum.Material.Neon
		v59.Color = v51
	end
end
local function v_u_81()
	-- upvalues: (copy) v_u_3, (ref) v_u_5, (ref) v_u_17, (ref) v_u_18, (ref) v_u_6, (ref) v_u_7, (copy) v_u_1
	local _ = v_u_3.LocalPlayer
	local v_u_61 = workspace.CurrentCamera
	local v62 = 0
	local v63 = v_u_61.FieldOfView
	v_u_5 = v63
	task.wait(1)
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		local v64, v65 = pcall(function()
			-- upvalues: (ref) v_u_18
			return v_u_18:GetSpectrum()
		end)
		local v66
		if v64 and (v65 and #v65 > 0) then
			local v67 = #v65
			local v68 = 0
			local v69 = 0
			for v70 = 1, math.min(20, v67) do
				local v71 = v65[v70]
				if v71 == v71 and (v71 ~= (1 / 0) and v71 ~= (-1 / 0)) then
					v68 = v68 + v71
					v69 = v69 + 1
				end
			end
			if v69 > 0 then
				local v72 = v68 / v69
				v_u_6 = v72
				v66 = tick()
				if v72 > 0.033 and v66 - v62 > 0.1 then
					local v73
					if v_u_6 > 0.033 then
						local v74 = (v_u_6 - 0.033) / 0.017
						v73 = math.clamp(v74, 0, 1) * 0.5
					else
						v73 = 0
					end
					local v75 = v73 + v_u_7 * 0.5
					local v76 = math.clamp(v75, 0, 1)
					local v77 = v72 / 0.033 * 0.5
					local v78 = math.min(v77, 2)
					local v79 = {
						["FieldOfView"] = v_u_5 + 15 * (1 + v76) * v78
					}
					v_u_1:Create(v_u_61, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v79):Play()
					task.delay(0.15, function()
						-- upvalues: (ref) v_u_1, (copy) v_u_61, (ref) v_u_5
						local v80 = {
							["FieldOfView"] = v_u_5
						}
						v_u_1:Create(v_u_61, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v80):Play()
					end)
				else
					v66 = v62
				end
			else
				v66 = v62
			end
		else
			v66 = v62
		end
		task.wait(0.03)
		v62 = v66
	end
	v_u_61.FieldOfView = v63
end
local function v_u_101(p_u_82, p_u_83)
	-- upvalues: (copy) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_21, (ref) v_u_17
	local v_u_84 = 0
	local v_u_85 = 0
	local v_u_86 = false
	local v_u_87 = false
	local v_u_88 = Color3.new(1, 1, 1)
	local v_u_89 = Color3.new(0, 0, 0)
	local v99 = v_u_4.Heartbeat:Connect(function(p90)
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_84, (ref) v_u_86, (ref) v_u_87, (ref) v_u_85, (copy) v_u_88, (copy) v_u_89, (copy) p_u_82, (copy) p_u_83
		local v91 = v_u_6
		local v92 = tick()
		local v93
		if v_u_6 > 0.033 then
			local v94 = (v_u_6 - 0.033) / 0.017
			v93 = math.clamp(v94, 0, 1) * 0.5
		else
			v93 = 0
		end
		local v95 = v93 + v_u_7 * 0.5
		local v96 = math.clamp(v95, 0, 1)
		local v97 = 0.3 - v96 * 0.2
		if v91 > 0.033 and (v97 < v92 - v_u_84 and not v_u_86) then
			v_u_84 = v92
			v_u_86 = true
			v_u_87 = true
			v_u_85 = 0
		end
		if v_u_86 then
			v_u_85 = v_u_85 + p90 / (0.1 - v96 * 0.05)
			if v_u_85 >= 1 then
				v_u_85 = 0
				if v_u_87 then
					v_u_87 = false
				else
					v_u_86 = false
					v_u_87 = false
				end
			end
			local v98
			if v_u_87 then
				v98 = v_u_88:Lerp(v_u_89, v_u_85)
			else
				v98 = v_u_89:Lerp(v_u_88, v_u_85)
			end
			if p_u_82.Beam then
				p_u_82.Beam.Color = ColorSequence.new(v98)
			end
			if p_u_83.Beam then
				p_u_83.Beam.Color = ColorSequence.new(v98)
			end
		end
	end)
	local v100 = v_u_21
	table.insert(v100, v99)
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		task.wait(0.1)
	end
	v99:Disconnect()
	if p_u_82.Beam then
		p_u_82.Beam.Color = ColorSequence.new(v_u_88)
	end
	if p_u_83.Beam then
		p_u_83.Beam.Color = ColorSequence.new(v_u_88)
	end
end
local function v_u_112()
	-- upvalues: (copy) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_19, (ref) v_u_21, (ref) v_u_17
	local v_u_102 = Color3.new(1, 1, 1)
	local v_u_103 = Color3.new(1, 0, 0)
	local v_u_104 = 0
	local v_u_105 = 0
	local v110 = v_u_4.Heartbeat:Connect(function(p106)
		-- upvalues: (ref) v_u_104, (ref) v_u_6, (ref) v_u_7, (ref) v_u_105, (ref) v_u_19, (copy) v_u_102, (copy) v_u_103
		local v107
		if v_u_6 > 0.033 then
			local v108 = (v_u_6 - 0.033) / 0.017
			v107 = math.clamp(v108, 0, 1) * 0.5
		else
			v107 = 0
		end
		local v109 = v107 + v_u_7 * 0.5
		v_u_104 = math.clamp(v109, 0, 1)
		v_u_105 = v_u_105 + (v_u_104 - v_u_105) * (5 * p106)
		if v_u_19 then
			v_u_19.TintColor = v_u_102:Lerp(v_u_103, v_u_105)
		end
	end)
	local v111 = v_u_21
	table.insert(v111, v110)
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		task.wait(0.1)
	end
	v110:Disconnect()
end
local function v_u_132(p113, p114, p115, p116, p117, p118)
	-- upvalues: (ref) v_u_17, (ref) v_u_6, (ref) v_u_7, (copy) v_u_1
	local v119 = Enum.EasingStyle.Sine
	while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
		local v120
		if v_u_6 > 0.033 then
			local v121 = (v_u_6 - 0.033) / 0.017
			v120 = math.clamp(v121, 0, 1) * 0.5
		else
			v120 = 0
		end
		local v122 = v120 + v_u_7 * 0.5
		local v123 = 1 + math.clamp(v122, 0, 1) * 1.5
		local v124 = 1 / v123
		local v125 = 1 / v123
		v_u_1:Create(p113, TweenInfo.new(v124, v119, Enum.EasingDirection.InOut), {
			["CFrame"] = p115
		}):Play()
		v_u_1:Create(p114, TweenInfo.new(v124, v119, Enum.EasingDirection.InOut), {
			["CFrame"] = p118
		}):Play()
		task.wait(v124 + v125)
		if not (v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid"))) then
			break
		end
		local v126
		if v_u_6 > 0.033 then
			local v127 = (v_u_6 - 0.033) / 0.017
			v126 = math.clamp(v127, 0, 1) * 0.5
		else
			v126 = 0
		end
		local v128 = v126 + v_u_7 * 0.5
		local v129 = 1 + math.clamp(v128, 0, 1) * 1.5
		local v130 = 1 / v129
		local v131 = 1 / v129
		v_u_1:Create(p113, TweenInfo.new(v130, v119, Enum.EasingDirection.InOut), {
			["CFrame"] = p116
		}):Play()
		v_u_1:Create(p114, TweenInfo.new(v130, v119, Enum.EasingDirection.InOut), {
			["CFrame"] = p117
		}):Play()
		task.wait(v130 + v131)
	end
	v_u_1:Create(p113, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
		["CFrame"] = p115
	}):Play()
	v_u_1:Create(p114, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
		["CFrame"] = p117
	}):Play()
end
local function v_u_204()
	-- upvalues: (ref) v_u_20, (copy) v_u_2, (copy) v_u_15, (ref) v_u_19, (ref) v_u_17, (copy) v_u_3, (ref) v_u_18, (copy) v_u_1, (ref) v_u_22, (copy) v_u_81, (copy) v_u_112, (copy) v_u_132, (copy) v_u_46, (copy) v_u_60, (copy) v_u_8, (copy) v_u_12, (copy) v_u_101, (copy) v_u_13, (ref) v_u_23, (ref) v_u_24, (ref) v_u_6, (ref) v_u_7, (copy) v_u_14
	local v133 = workspace:GetAttribute("DecemberDavidStartTime")
	if not v133 then
		repeat
			v133 = workspace:GetAttribute("DecemberDavidStartTime")
			task.wait()
		until v133
	end
	local v134 = workspace:GetServerTimeNow() - v133
	game.TweenService:Create(game.SoundService.Music.Tunes.Music, TweenInfo.new(2), {
		["Volume"] = 0
	}):Play()
	task.spawn(Cleanup)
	task.wait(1)
	v_u_20 = v_u_2.ClockTime
	local v_u_135 = workspace:WaitForChild("Visuals"):WaitForChild("DecemberDavid")
	local v136 = v_u_135:WaitForChild("DevNamedDavid")
	local v_u_137 = v136:WaitForChild("Humanoid"):WaitForChild("Animator")
	local v_u_138 = game:GetService("CollectionService"):GetTagged("GuitarStringsDAVID")
	local v_u_139 = {
		["Red"] = {},
		["Green"] = {}
	}
	for _, v140 in v136.Guitar:GetChildren() do
		if v140.Material == Enum.Material.Neon then
			if v140.Color == Color3.fromRGB(0, 255, 0) then
				local v141 = v_u_139.Green
				table.insert(v141, v140)
			else
				local v142 = v_u_139.Red
				table.insert(v142, v140)
			end
		end
	end
	local v_u_143 = v_u_135:WaitForChild("Light_Beams"):WaitForChild("Left")
	local v_u_144 = v_u_135:WaitForChild("Light_Beams"):WaitForChild("Right")
	local v_u_145 = v_u_143:GetAttribute("OutwardOrientation")
	local v_u_146 = v_u_143:GetAttribute("InwardOrientation")
	local v_u_147 = v_u_144:GetAttribute("OutwardOrientation")
	local v_u_148 = v_u_144:GetAttribute("InwardOrientation")
	v_u_135:PivotTo(v_u_15)
	v_u_19 = Instance.new("ColorCorrectionEffect")
	v_u_19.Name = "DavidEventColorCorrection"
	v_u_19.TintColor = Color3.new(1, 1, 1)
	v_u_19.Enabled = true
	v_u_19.Parent = v_u_2
	v_u_17 = Instance.new("AudioPlayer")
	v_u_17.Parent = workspace
	v_u_17.Looping = false
	v_u_17.Volume = 0
	v_u_17.AssetId = "rbxassetid://93808705439016"
	local v149 = Instance.new("AudioDeviceOutput")
	v149.Parent = workspace
	v149.Player = v_u_3.LocalPlayer
	v_u_18 = Instance.new("AudioAnalyzer")
	v_u_18.Parent = workspace
	local v150 = Instance.new("Wire")
	v150.SourceInstance = v_u_17
	v150.TargetInstance = v149
	v150.Parent = v149
	local v151 = Instance.new("Wire")
	v151.SourceInstance = v_u_17
	v151.TargetInstance = v_u_18
	v151.Parent = v_u_18
	v_u_17:Play()
	if v134 > 0 then
		v_u_17.TimePosition = v134
	end
	v_u_17.Ended:Connect(function()
		workspace:SetAttribute("DecemberDavid", false)
	end)
	local v152 = 7 - v134
	local v153 = math.max(0, v152)
	if v153 > 0 then
		v_u_1:Create(v_u_17, TweenInfo.new(v153, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["Volume"] = 1
		}):Play()
	else
		v_u_17.Volume = 1
	end
	local v154 = 11 - v134
	local v155 = math.max(0, v154)
	local v156 = v134 / 11
	local v157 = math.clamp(v156, 0, 1)
	v_u_2.ClockTime = v_u_20 + (0 - v_u_20) * v157
	if v155 > 0 then
		v_u_1:Create(v_u_2, TweenInfo.new(v155, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
			["ClockTime"] = 0
		}):Play()
	else
		v_u_2.ClockTime = 0
	end
	local v158 = v_u_22
	local v159 = task.spawn
	local v160 = v_u_81
	table.insert(v158, v159(v160))
	local v161 = v_u_22
	local v162 = task.spawn
	local v163 = v_u_112
	table.insert(v161, v162(v163))
	local v164 = v_u_22
	local v165 = task.spawn
	local function v166()
		-- upvalues: (ref) v_u_132, (copy) v_u_143, (copy) v_u_144, (copy) v_u_145, (copy) v_u_146, (copy) v_u_147, (copy) v_u_148
		v_u_132(v_u_143, v_u_144, v_u_145, v_u_146, v_u_147, v_u_148)
	end
	table.insert(v164, v165(v166))
	local v167 = v_u_22
	local v168 = task.spawn
	local function v169()
		-- upvalues: (ref) v_u_46, (copy) v_u_138
		v_u_46(v_u_138)
	end
	table.insert(v167, v168(v169))
	local v170 = v_u_22
	local v171 = task.spawn
	local function v172()
		-- upvalues: (ref) v_u_60, (copy) v_u_139
		v_u_60(v_u_139)
	end
	table.insert(v170, v171(v172))
	local v173 = v_u_22
	local v174 = task.spawn
	local function v177()
		-- upvalues: (ref) v_u_17, (ref) v_u_8, (ref) v_u_12, (copy) v_u_135
		local v175 = 1
		while v_u_17 and (v_u_17.Parent and workspace:GetAttribute("DecemberDavid")) do
			local v176 = v_u_17.TimePosition
			if v175 <= #v_u_8 and v_u_8[v175] <= v176 then
				v_u_12(v_u_135)
				v175 = v175 + 1
			end
			task.wait(0.01)
		end
	end
	table.insert(v173, v174(v177))
	local v178 = v_u_22
	local v179 = task.spawn
	local function v180()
		-- upvalues: (ref) v_u_101, (copy) v_u_143, (copy) v_u_144
		v_u_101(v_u_143, v_u_144)
	end
	table.insert(v178, v179(v180))
	local v181 = v_u_22
	local v182 = task.spawn
	local function v203()
		-- upvalues: (ref) v_u_13, (copy) v_u_137, (ref) v_u_23, (ref) v_u_24, (ref) v_u_17, (ref) v_u_6, (ref) v_u_7, (ref) v_u_14
		local v183 = {}
		local v184 = {}
		local v185 = nil
		local v186 = nil
		for v187, v188 in pairs(v_u_13) do
			local v189 = {
				["name"] = v187,
				["animation"] = v188[1],
				["startTime"] = v188[2],
				["speed"] = v188[3]
			}
			table.insert(v183, v189)
			v184[v187] = v_u_137:LoadAnimation(v188[1])
		end
		table.sort(v183, function(p190, p191)
			return p190.startTime < p191.startTime
		end)
		for _, v192 in ipairs(v183) do
			repeat
				task.wait()
			until v184[v192.name].Length > 0
		end
		v_u_23 = v184
		v_u_24 = nil
		local v193 = false
		while workspace:GetAttribute("DecemberDavid") do
			local v194 = v_u_17.TimePosition
			local v195 = 1
			local v196 = nil
			for v197 = #v183, 1, -1 do
				if v183[v197].startTime <= v194 then
					v196 = v183[v197].name
					v195 = v183[v197].speed or 1
					break
				end
			end
			local v198 = v_u_6
			local v199
			if v198 < 0.02 then
				v199 = 1
			else
				local v200 = (v198 - 0.02) / 0.030000000000000002
				v199 = 1 + math.clamp(v200, 0, 1) * 2
			end
			local v201 = v195 * v199
			if v196 == v186 then
				if v185 then
					v185:AdjustSpeed(v201)
				end
			else
				v_u_7 = v_u_14[v196] or 0
				v185 = v184[v196]
				v185:Play(0.5, 1000, v201)
				if v185 then
					v185:Stop(0.5)
				end
				v_u_24 = v185
				if v196 == "FloatDown" then
					v185.Looped = false
					v186 = v196
					v193 = true
				else
					v186 = v196
				end
			end
			if v193 and (v185 and not v185.IsPlaying) then
				break
			end
			task.wait(0.05)
		end
		if v185 then
			v185:Stop(0.5)
		end
		for _, v202 in pairs(v184) do
			v202:Destroy()
		end
		v_u_23 = {}
		v_u_24 = nil
		if v193 then
			workspace:SetAttribute("DecemberDavid", false)
		end
	end
	table.insert(v181, v182(v203))
end
function Cleanup()
	-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_21, (ref) v_u_22, (ref) v_u_24, (ref) v_u_23, (ref) v_u_17, (copy) v_u_1, (ref) v_u_19, (ref) v_u_18, (ref) v_u_20, (copy) v_u_2, (copy) v_u_3
	repeat
		task.wait()
	until workspace:GetAttribute("DecemberDavid") == false
	v_u_6 = 0
	v_u_7 = 0
	for _, v205 in ipairs(v_u_21) do
		if v205 and v205.Connected then
			v205:Disconnect()
		end
	end
	v_u_21 = {}
	for _, v206 in ipairs(v_u_22) do
		if v206 then
			task.cancel(v206)
		end
	end
	v_u_22 = {}
	if v_u_24 then
		v_u_24:Stop(0)
		v_u_24 = nil
	end
	for _, v207 in pairs(v_u_23) do
		if v207 then
			v207:Stop(0)
			v207:Destroy()
		end
	end
	v_u_23 = {}
	if v_u_17 then
		v_u_1:Create(v_u_17, TweenInfo.new(2), {
			["Volume"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_17
			if v_u_17 then
				v_u_17:Stop()
				v_u_17:Destroy()
				v_u_17 = nil
			end
		end)
	end
	if v_u_19 then
		v_u_1:Create(v_u_19, TweenInfo.new(2), {
			["TintColor"] = Color3.new(1, 1, 1)
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_19
			if v_u_19 then
				v_u_19:Destroy()
				v_u_19 = nil
			end
		end)
	end
	if v_u_18 then
		v_u_18:Destroy()
		v_u_18 = nil
	end
	if v_u_20 then
		local v208 = {
			["ClockTime"] = v_u_20
		}
		v_u_1:Create(v_u_2, TweenInfo.new(2), v208):Play()
		v_u_20 = nil
	end
	local v209 = v_u_3.LocalPlayer
	if v209 and v209.Character then
		v_u_1:Create(workspace.CurrentCamera, TweenInfo.new(1), {
			["FieldOfView"] = 70
		}):Play()
	end
	local v210 = workspace:FindFirstChild("Visuals")
	if v210 then
		v210 = workspace.Visuals:FindFirstChild("DecemberDavid")
	end
	if v210 then
		v210:Destroy()
	end
	task.wait(2.5)
	if game.SoundService.Music and (game.SoundService.Music.Tunes and game.SoundService.Music.Tunes.Music) then
		v_u_1:Create(game.SoundService.Music.Tunes.Music, TweenInfo.new(2), {
			["Volume"] = 1
		}):Play()
	end
end
workspace:GetAttributeChangedSignal("DecemberDavid"):Connect(function()
	-- upvalues: (copy) v_u_204, (ref) v_u_16
	if workspace:GetAttribute("DecemberDavid") then
		v_u_204()
	else
		v_u_16 = false
		Cleanup()
	end
end)
if workspace:GetAttribute("DecemberDavid") then
	task.defer(v_u_204)
else
	v_u_16 = false
end
return {}