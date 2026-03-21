game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
return {
	["defaultEasingStyle"] = Enum.EasingStyle.Linear,
	["defaultEasingDirection"] = Enum.EasingDirection.Out,
	["defaultFadeTime"] = 1,
	["_createTransparentNumberSequence"] = function(_, p3)
		local v4 = {}
		for _, v5 in p3.Keypoints do
			local v6 = NumberSequenceKeypoint.new
			local v7 = v5.Time
			local v8 = v5.Envelope
			table.insert(v4, v6(v7, 1, v8))
		end
		return NumberSequence.new(v4)
	end,
	["_interpolateNumberSequence"] = function(_, p9, p10)
		local v11 = {}
		for _, v12 in p9.Keypoints do
			local v13 = v12.Value + (1 - v12.Value) * p10
			local v14 = NumberSequenceKeypoint.new
			local v15 = v12.Time
			local v16 = v12.Envelope
			table.insert(v11, v14(v15, v13, v16))
		end
		return NumberSequence.new(v11)
	end,
	["_setNumberSequenceTransparency"] = function(_, p17, p18)
		local v19 = {}
		for _, v20 in p17.Keypoints do
			local v21 = NumberSequenceKeypoint.new
			local v22 = v20.Time
			local v23 = v20.Envelope
			table.insert(v19, v21(v22, p18, v23))
		end
		return NumberSequence.new(v19)
	end,
	["_interpolateNumberSequenceToTarget"] = function(_, p24, p25, p26)
		local v27 = {}
		for _, v28 in p24.Keypoints do
			local v29 = v28.Value
			local v30 = v29 + (p25 - v29) * p26
			local v31 = NumberSequenceKeypoint.new
			local v32 = v28.Time
			local v33 = v28.Envelope
			table.insert(v27, v31(v32, v30, v33))
		end
		return NumberSequence.new(v27)
	end,
	["GetDescendantTransparency"] = function(_, p34)
		local v35 = p34:GetDescendants()
		table.insert(v35, p34)
		local v36 = {
			"Transparency",
			"TextTransparency",
			"TextStrokeTransparency",
			"BackgroundTransparency",
			"ImageTransparency",
			"ScrollBarImageTransparency"
		}
		local v37 = {}
		for _, v_u_38 in v35 do
			local v39 = {}
			for _, v_u_40 in v36 do
				local v41, v42 = pcall(function()
					-- upvalues: (copy) v_u_38, (copy) v_u_40
					return v_u_38[v_u_40]
				end)
				if v41 and v42 ~= nil then
					v39[v_u_40] = v42
				end
			end
			if next(v39) then
				v37[v_u_38] = v39
			end
		end
		return v37
	end,
	["SetDescendantTransparency"] = function(p_u_43, p44, p45, p_u_46, p_u_47, p48, p49)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v50 = p44:GetDescendants()
		table.insert(v50, p44)
		local v51 = {
			"Transparency",
			"TextTransparency",
			"TextStrokeTransparency",
			"BackgroundTransparency",
			"ImageTransparency",
			"ScrollBarImageTransparency"
		}
		if p_u_46 and p_u_46 > 0 then
			local v_u_52 = p48 or p_u_43.defaultEasingStyle
			local v_u_53 = p49 or p_u_43.defaultEasingDirection
			local v54 = TweenInfo.new(p_u_46, v_u_52, v_u_53)
			local v55 = {}
			local v_u_56 = {}
			if typeof(p45) == "number" then
				for _, v_u_57 in v50 do
					for _, v_u_58 in v51 do
						local v59, v60 = pcall(function()
							-- upvalues: (copy) v_u_57, (copy) v_u_58
							return v_u_57[v_u_58]
						end)
						if v59 and v60 ~= nil then
							if typeof(v60) == "number" then
								local v61 = v_u_1:Create(v_u_57, v54, {
									[v_u_58] = p45
								})
								table.insert(v55, v61)
								v61:Play()
							elseif typeof(v60) == "NumberSequence" then
								local v62 = {
									["object"] = v_u_57,
									["property"] = v_u_58,
									["startSequence"] = v60,
									["targetTransparency"] = p45,
									["startTime"] = os.clock()
								}
								table.insert(v_u_56, v62)
							end
						end
					end
				end
			elseif typeof(p45) == "table" then
				for v_u_63, v64 in p45 do
					if v_u_63 and v_u_63.Parent then
						if typeof(v64) == "number" then
							local v65, v66 = pcall(function()
								-- upvalues: (copy) v_u_63
								return v_u_63.Transparency
							end)
							if v65 and v66 ~= nil then
								if typeof(v66) == "number" then
									local v67 = v_u_1:Create(v_u_63, v54, {
										["Transparency"] = v64
									})
									table.insert(v55, v67)
									v67:Play()
								elseif typeof(v66) == "NumberSequence" then
									local v68 = {
										["object"] = v_u_63,
										["property"] = "Transparency",
										["startSequence"] = v66,
										["targetSequence"] = v64,
										["startTime"] = os.clock()
									}
									table.insert(v_u_56, v68)
								end
							end
						elseif typeof(v64) == "NumberSequence" then
							local v69, v70 = pcall(function()
								-- upvalues: (copy) v_u_63
								return v_u_63.Transparency
							end)
							if v69 then
								local v71 = {
									["object"] = v_u_63,
									["property"] = "Transparency",
									["startSequence"] = v70,
									["targetSequence"] = v64,
									["startTime"] = os.clock()
								}
								table.insert(v_u_56, v71)
							end
						elseif typeof(v64) == "table" then
							for v_u_72, v73 in v64 do
								local v74, v75 = pcall(function()
									-- upvalues: (copy) v_u_63, (copy) v_u_72
									return v_u_63[v_u_72]
								end)
								if v74 and v75 ~= nil then
									if typeof(v73) == "number" and typeof(v75) == "number" then
										local v76 = v_u_1:Create(v_u_63, v54, {
											[v_u_72] = v73
										})
										table.insert(v55, v76)
										v76:Play()
									elseif typeof(v75) == "NumberSequence" then
										if typeof(v73) == "number" then
											local v77 = {
												["object"] = v_u_63,
												["property"] = v_u_72,
												["startSequence"] = v75,
												["targetTransparency"] = v73,
												["startTime"] = os.clock()
											}
											table.insert(v_u_56, v77)
										elseif typeof(v73) == "NumberSequence" then
											local v78 = {
												["object"] = v_u_63,
												["property"] = v_u_72,
												["startSequence"] = v75,
												["targetSequence"] = v73,
												["startTime"] = os.clock()
											}
											table.insert(v_u_56, v78)
										end
									end
								end
							end
						end
					end
				end
			end
			if #v_u_56 > 0 then
				local v_u_79 = nil
				v_u_79 = v_u_2.Heartbeat:Connect(function()
					-- upvalues: (copy) v_u_56, (copy) p_u_46, (ref) v_u_1, (ref) v_u_52, (ref) v_u_53, (copy) p_u_43, (ref) v_u_79
					local v80 = os.clock()
					local v81 = true
					for v82 = #v_u_56, 1, -1 do
						local v83 = v_u_56[v82]
						local v84 = (v80 - v83.startTime) / p_u_46
						local v85 = math.min(v84, 1)
						local v86 = v_u_1:GetValue(v85, v_u_52, v_u_53)
						if v83.targetTransparency then
							v83.object[v83.property] = p_u_43:_interpolateNumberSequenceToTarget(v83.startSequence, v83.targetTransparency, v86)
						elseif v83.targetSequence then
							local v87 = v83.startSequence.Keypoints
							local v88 = v83.targetSequence.Keypoints
							local v89 = {}
							for v90, v91 in v87 do
								if v88[v90] then
									local v92 = v88[v90]
									local v93 = v91.Value + (v92.Value - v91.Value) * v86
									local v94 = NumberSequenceKeypoint.new
									local v95 = v91.Time
									local v96 = v91.Envelope
									table.insert(v89, v94(v95, v93, v96))
								end
							end
							v83.object[v83.property] = NumberSequence.new(v89)
						end
						if v85 >= 1 then
							table.remove(v_u_56, v82)
						else
							v81 = false
						end
					end
					if v81 then
						v_u_79:Disconnect()
					end
				end)
			end
			if p_u_47 then
				task.spawn(function()
					-- upvalues: (copy) p_u_46, (copy) p_u_47
					task.wait(p_u_46)
					p_u_47()
				end)
			end
			return v55
		end
		if typeof(p45) == "number" then
			for _, v_u_97 in v50 do
				for _, v_u_98 in v51 do
					local v99, v100 = pcall(function()
						-- upvalues: (copy) v_u_97, (copy) v_u_98
						return v_u_97[v_u_98]
					end)
					if v99 and v100 ~= nil then
						if typeof(v100) == "number" then
							v_u_97[v_u_98] = p45
						elseif typeof(v100) == "NumberSequence" then
							v_u_97[v_u_98] = p_u_43:_setNumberSequenceTransparency(v100, p45)
						end
					end
				end
			end
		elseif typeof(p45) == "table" then
			for v_u_101, v_u_102 in p45 do
				if v_u_101 and v_u_101.Parent then
					if typeof(v_u_102) == "number" or typeof(v_u_102) == "NumberSequence" then
						pcall(function()
							-- upvalues: (copy) v_u_101, (copy) v_u_102
							v_u_101.Transparency = v_u_102
						end)
					elseif typeof(v_u_102) == "table" then
						for v_u_103, v_u_104 in v_u_102 do
							pcall(function()
								-- upvalues: (copy) v_u_101, (copy) v_u_103, (copy) v_u_104
								v_u_101[v_u_103] = v_u_104
							end)
						end
					end
				end
			end
		end
		if p_u_47 then
			p_u_47()
		end
	end,
	["GetRGBfromColor3"] = function(_, p105)
		local v106 = {}
		local v107 = p105.R * 255
		v106.R = math.floor(v107)
		local v108 = p105.G * 255
		v106.G = math.floor(v108)
		local v109 = p105.B * 255
		v106.B = math.floor(v109)
		return v106
	end
}