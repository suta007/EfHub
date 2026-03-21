local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ProximityPromptService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("TextService")
local v_u_5 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_6 = {
	[Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png",
	[Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png",
	[Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png",
	[Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png",
	[Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png",
	[Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png",
	[Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png",
	[Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png",
	[Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png",
	[Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png",
	[Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
}
local v_u_7 = {
	[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
	[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
	[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
}
local v_u_8 = {
	["\'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
	[","] = "rbxasset://textures/ui/Controls/comma.png",
	["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
	["."] = "rbxasset://textures/ui/Controls/period.png",
	[" "] = "rbxasset://textures/ui/Controls/spacebar.png"
}
local v_u_9 = {
	[Enum.KeyCode.LeftControl] = "Ctrl",
	[Enum.KeyCode.RightControl] = "Ctrl",
	[Enum.KeyCode.LeftAlt] = "Alt",
	[Enum.KeyCode.RightAlt] = "Alt",
	[Enum.KeyCode.F1] = "F1",
	[Enum.KeyCode.F2] = "F2",
	[Enum.KeyCode.F3] = "F3",
	[Enum.KeyCode.F4] = "F4",
	[Enum.KeyCode.F5] = "F5",
	[Enum.KeyCode.F6] = "F6",
	[Enum.KeyCode.F7] = "F7",
	[Enum.KeyCode.F8] = "F8",
	[Enum.KeyCode.F9] = "F9",
	[Enum.KeyCode.F10] = "F10",
	[Enum.KeyCode.F11] = "F11",
	[Enum.KeyCode.F12] = "F12"
}
local function v_u_222(p_u_10, p11, p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4
	local v_u_13 = {}
	local v_u_14 = {}
	local v_u_15 = {}
	local v_u_16 = {}
	TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v_u_17 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v_u_18 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local v19 = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local v_u_20 = nil
	local v21 = p_u_10:GetAttribute("Theme")
	if v21 then
		local v22 = script:FindFirstChild(v21)
		if v22 then
			v_u_20 = v22:Clone()
		end
	end
	if v_u_20 == nil then
		v_u_20 = script.Default:Clone()
	end
	v_u_20.Enabled = true
	local v23 = v_u_20.PromptFrame
	local v24 = v23.InputFrame
	local v_u_25 = v23.ActionText
	local v_u_26 = v23.ObjectText
	local v27 = v23.BackgroundTransparency
	local v28 = v23.ImageTransparency
	v23.BackgroundTransparency = 1
	v23.ImageTransparency = 1
	local v29 = v_u_3
	local v30 = {
		["Size"] = UDim2.fromScale(0.5, 1),
		["BackgroundTransparency"] = 1,
		["ImageTransparency"] = 1
	}
	table.insert(v_u_13, v29:Create(v23, v_u_17, v30))
	local v31 = v_u_3
	local v32 = {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = v27,
		["ImageTransparency"] = v28
	}
	table.insert(v_u_14, v31:Create(v23, v_u_17, v32))
	local v33 = v_u_3
	local v34 = {
		["Size"] = UDim2.fromScale(0.5, 1),
		["BackgroundTransparency"] = 1,
		["ImageTransparency"] = 1
	}
	table.insert(v_u_15, v33:Create(v23, v_u_17, v34))
	local v35 = v_u_3
	local v36 = {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = v27,
		["ImageTransparency"] = v28
	}
	table.insert(v_u_16, v35:Create(v23, v_u_17, v36))
	local function v_u_51(p37)
		-- upvalues: (copy) v_u_13, (ref) v_u_3, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
		local v38 = p37.Transparency
		p37.Transparency = 1
		local v39 = v_u_13
		local v40 = v_u_3
		local v41 = v_u_17
		table.insert(v39, v40:Create(p37, v41, {
			["Transparency"] = 1
		}))
		local v42 = v_u_14
		local v43 = v_u_3
		local v44 = v_u_17
		table.insert(v42, v43:Create(p37, v44, {
			["Transparency"] = v38
		}))
		local v45 = v_u_15
		local v46 = v_u_3
		local v47 = v_u_17
		table.insert(v45, v46:Create(p37, v47, {
			["Transparency"] = 1
		}))
		local v48 = v_u_16
		local v49 = v_u_3
		local v50 = v_u_17
		table.insert(v48, v49:Create(p37, v50, {
			["Transparency"] = v38
		}))
	end
	local function v_u_66(p52)
		-- upvalues: (copy) v_u_13, (ref) v_u_3, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
		local v53 = p52.BackgroundTransparency
		p52.BackgroundTransparency = 1
		local v54 = v_u_13
		local v55 = v_u_3
		local v56 = v_u_17
		table.insert(v54, v55:Create(p52, v56, {
			["BackgroundTransparency"] = 1
		}))
		local v57 = v_u_14
		local v58 = v_u_3
		local v59 = v_u_17
		table.insert(v57, v58:Create(p52, v59, {
			["BackgroundTransparency"] = v53
		}))
		local v60 = v_u_15
		local v61 = v_u_3
		local v62 = v_u_17
		table.insert(v60, v61:Create(p52, v62, {
			["BackgroundTransparency"] = 1
		}))
		local v63 = v_u_16
		local v64 = v_u_3
		local v65 = v_u_17
		table.insert(v63, v64:Create(p52, v65, {
			["BackgroundTransparency"] = v53
		}))
	end
	local function v_u_82(p67)
		-- upvalues: (copy) v_u_13, (ref) v_u_3, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
		local v68 = p67.TextTransparency
		local v69 = p67.TextStrokeTransparency
		p67.TextTransparency = 1
		p67.TextStrokeTransparency = 1
		local v70 = v_u_13
		local v71 = v_u_3
		local v72 = v_u_17
		table.insert(v70, v71:Create(p67, v72, {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1
		}))
		local v73 = v_u_14
		local v74 = v_u_3
		local v75 = v_u_17
		table.insert(v73, v74:Create(p67, v75, {
			["TextTransparency"] = v68,
			["TextStrokeTransparency"] = v69
		}))
		local v76 = v_u_15
		local v77 = v_u_3
		local v78 = v_u_17
		table.insert(v76, v77:Create(p67, v78, {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1
		}))
		local v79 = v_u_16
		local v80 = v_u_3
		local v81 = v_u_17
		table.insert(v79, v80:Create(p67, v81, {
			["TextTransparency"] = v68,
			["TextStrokeTransparency"] = v69
		}))
	end
	local function v_u_97(p83)
		-- upvalues: (copy) v_u_13, (ref) v_u_3, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
		local v84 = p83.ImageTransparency
		p83.ImageTransparency = 1
		local v85 = v_u_13
		local v86 = v_u_3
		local v87 = v_u_17
		table.insert(v85, v86:Create(p83, v87, {
			["ImageTransparency"] = 1
		}))
		local v88 = v_u_14
		local v89 = v_u_3
		local v90 = v_u_17
		table.insert(v88, v89:Create(p83, v90, {
			["ImageTransparency"] = v84
		}))
		local v91 = v_u_15
		local v92 = v_u_3
		local v93 = v_u_17
		table.insert(v91, v92:Create(p83, v93, {
			["ImageTransparency"] = 1
		}))
		local v94 = v_u_16
		local v95 = v_u_3
		local v96 = v_u_17
		table.insert(v94, v95:Create(p83, v96, {
			["ImageTransparency"] = v84
		}))
	end
	local function v_u_100(p98)
		-- upvalues: (copy) v_u_51, (copy) v_u_66, (copy) v_u_82, (copy) v_u_97, (copy) v_u_100
		if p98:IsA("UIStroke") then
			v_u_51(p98)
		elseif not p98:IsA("UIGradient") and p98:IsA("GuiObject") then
			v_u_66(p98)
			if p98:IsA("TextLabel") then
				v_u_82(p98)
			elseif p98:IsA("ImageLabel") then
				v_u_97(p98)
			end
		end
		for _, v99 in pairs(p98:GetChildren()) do
			v_u_100(v99)
		end
	end
	local v101 = {
		[v24] = false,
		[v_u_25] = true,
		[v_u_26] = true
	}
	for _, v102 in pairs(v23:GetChildren()) do
		if v101[v102] == nil then
			v_u_100(v102)
		elseif v101[v102] == true then
			for _, v103 in pairs(v102:GetChildren()) do
				v_u_100(v103)
			end
		end
	end
	local v104 = v24.Frame
	local v105 = v104.UIScale
	local v106 = p11 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33
	local v107 = v_u_3
	table.insert(v_u_13, v107:Create(v105, v_u_17, {
		["Scale"] = v106
	}))
	local v108 = v_u_3
	table.insert(v_u_14, v108:Create(v105, v_u_17, {
		["Scale"] = 1
	}))
	v_u_82(v_u_25)
	v_u_82(v_u_26)
	local v_u_109 = v104.ButtonFrame;
	(function()
		-- upvalues: (copy) v_u_109, (copy) v_u_15, (ref) v_u_3, (copy) v_u_18, (copy) v_u_16
		local v110 = v_u_15
		local v111 = v_u_3
		local v112 = v_u_109
		local v113 = v_u_18
		table.insert(v110, v111:Create(v112, v113, {
			["BackgroundTransparency"] = 1,
			["ImageTransparency"] = 1
		}))
		local v114 = v_u_16
		local v115 = v_u_3
		local v116 = v_u_109
		local v117 = v_u_18
		local v118 = {
			["BackgroundTransparency"] = v_u_109.BackgroundTransparency,
			["ImageTransparency"] = v_u_109.ImageTransparency
		}
		table.insert(v114, v115:Create(v116, v117, v118))
		for _, v119 in pairs(v_u_109:getChildren()) do
			if v119:IsA("UIStroke") then
				local v120 = v_u_15
				local v121 = v_u_3
				local v122 = v_u_18
				table.insert(v120, v121:Create(v119, v122, {
					["Transparency"] = 1
				}))
				local v123 = v_u_16
				local v124 = v_u_3
				local v125 = v_u_18
				local v126 = {
					["Transparency"] = v119.Transparency
				}
				table.insert(v123, v124:Create(v119, v125, v126))
			end
		end
	end)()
	local v_u_127 = v104.ButtonImage
	local v_u_128 = v104.ButtonText
	local v_u_129 = v104.ButtonTextImage
	local function v149()
		-- upvalues: (copy) v_u_128, (copy) v_u_15, (ref) v_u_3, (copy) v_u_18, (copy) v_u_16
		local v130 = v_u_128.TextTransparency
		local v131 = v_u_128.TextStrokeTransparency
		local v132 = v_u_128.BackgroundTransparency
		v_u_128.BackgroundTransparency = 1
		v_u_128.TextStrokeTransparency = 1
		v_u_128.TextTransparency = 1
		local v133 = v_u_15
		local v134 = v_u_3
		local v135 = v_u_128
		local v136 = v_u_18
		table.insert(v133, v134:Create(v135, v136, {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1,
			["BackgroundTransparency"] = 1
		}))
		local v137 = v_u_16
		local v138 = v_u_3
		local v139 = v_u_128
		local v140 = v_u_18
		table.insert(v137, v138:Create(v139, v140, {
			["TextTransparency"] = v130,
			["TextStrokeTransparency"] = v131,
			["BackgroundTransparency"] = v132
		}))
		for _, v141 in pairs(v_u_128:getChildren()) do
			if v141:IsA("UIStroke") then
				local v142 = v_u_15
				local v143 = v_u_3
				local v144 = v_u_18
				table.insert(v142, v143:Create(v141, v144, {
					["Transparency"] = 1
				}))
				local v145 = v_u_16
				local v146 = v_u_3
				local v147 = v_u_18
				local v148 = {
					["Transparency"] = v141.Transparency
				}
				table.insert(v145, v146:Create(v141, v147, v148))
			end
		end
	end
	local function v160()
		-- upvalues: (copy) v_u_127, (copy) v_u_15, (ref) v_u_3, (copy) v_u_18, (copy) v_u_16
		local v150 = v_u_127.ImageTransparency
		local v151 = v_u_127.BackgroundTransparency
		v_u_127.BackgroundTransparency = 1
		v_u_127.ImageTransparency = 1
		local v152 = v_u_15
		local v153 = v_u_3
		local v154 = v_u_127
		local v155 = v_u_18
		table.insert(v152, v153:Create(v154, v155, {
			["ImageTransparency"] = 1,
			["BackgroundTransparency"] = 1
		}))
		local v156 = v_u_16
		local v157 = v_u_3
		local v158 = v_u_127
		local v159 = v_u_18
		table.insert(v156, v157:Create(v158, v159, {
			["ImageTransparency"] = v150,
			["BackgroundTransparency"] = v151
		}))
	end
	local function v171()
		-- upvalues: (copy) v_u_129, (copy) v_u_15, (ref) v_u_3, (copy) v_u_18, (copy) v_u_16
		local v161 = v_u_129.BackgroundTransparency
		local v162 = v_u_129.ImageTransparency
		v_u_129.BackgroundTransparency = 1
		v_u_129.ImageTransparency = 1
		local v163 = v_u_15
		local v164 = v_u_3
		local v165 = v_u_129
		local v166 = v_u_18
		table.insert(v163, v164:Create(v165, v166, {
			["ImageTransparency"] = 1,
			["BackgroundTransparency"] = 1
		}))
		local v167 = v_u_16
		local v168 = v_u_3
		local v169 = v_u_129
		local v170 = v_u_18
		table.insert(v167, v168:Create(v169, v170, {
			["ImageTransparency"] = v162,
			["BackgroundTransparency"] = v161
		}))
	end
	if p11 == Enum.ProximityPromptInputType.Gamepad then
		if v_u_6[p_u_10.GamepadKeyCode] then
			v171()
			v_u_129.Image = string.gsub(v_u_1:GetImageForKeyCode(p_u_10.GamepadKeyCode), "@2x", "@3x")
			v_u_128.Visible = false
			v_u_127.Visible = false
			v_u_129.Visible = true
		end
	elseif p11 == Enum.ProximityPromptInputType.Touch then
		v160()
		v_u_127.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
		v_u_128.Visible = false
		v_u_129.Visible = false
		v_u_127.Visible = true
	else
		v160()
		v_u_127.Visible = true
		local v172 = v_u_1:GetStringForKeyCode(p_u_10.KeyboardKeyCode)
		local v173 = v_u_7[p_u_10.KeyboardKeyCode]
		if v173 == nil then
			v173 = v_u_8[v172]
		end
		if v173 == nil then
			v172 = v_u_9[p_u_10.KeyboardKeyCode] or v172
		end
		if v173 then
			v171()
			v_u_129.Image = v173
			v_u_128.Visible = false
			v_u_129.Visible = true
		elseif v172 == nil or v172 == "" then
			local v174 = error
			local v175 = p_u_10.Name
			local v176 = p_u_10.KeyboardKeyCode
			v174("ProximityPrompt \'" .. v175 .. "\' has an unsupported keycode for rendering UI: " .. tostring(v176))
		else
			if string.len(v172) > 2 then
				local v177 = v_u_128.TextSize * 6 / 7
				v_u_128.TextSize = math.round(v177)
			end
			v149()
			v_u_128.Text = v172
			v_u_129.Visible = false
			v_u_128.Visible = true
		end
	end
	if p11 == Enum.ProximityPromptInputType.Touch or p_u_10.ClickablePrompt then
		local v178 = v_u_20.TextButton
		local v_u_179 = false
		v178.InputBegan:Connect(function(p180)
			-- upvalues: (copy) p_u_10, (ref) v_u_179
			if (p180.UserInputType == Enum.UserInputType.Touch or p180.UserInputType == Enum.UserInputType.MouseButton1) and p180.UserInputState ~= Enum.UserInputState.Change then
				p_u_10:InputHoldBegin()
				v_u_179 = true
			end
		end)
		v178.InputEnded:Connect(function(p181)
			-- upvalues: (ref) v_u_179, (copy) p_u_10
			if (p181.UserInputType == Enum.UserInputType.Touch or p181.UserInputType == Enum.UserInputType.MouseButton1) and v_u_179 then
				v_u_179 = false
				p_u_10:InputHoldEnd()
			end
		end)
		v_u_20.Active = true
	end
	local v_u_182 = v104.ProgressBar
	local v_u_183 = v_u_182.LeftGradient.ProgressBarImage.UIGradient
	local v_u_184 = v_u_182.RightGradient.ProgressBarImage.UIGradient
	v_u_182.Progress.Changed:Connect(function(p185)
		-- upvalues: (copy) v_u_183, (copy) v_u_184
		local v186 = p185 * 360
		local v187 = math.clamp(v186, 0, 360)
		v_u_183.Rotation = math.clamp(v187, 180, 360)
		v_u_184.Rotation = math.clamp(v187, 0, 180)
	end)
	local v188 = v_u_3
	local v189 = v_u_182.Progress
	table.insert(v_u_14, v188:Create(v189, v19, {
		["Value"] = 0
	}))
	local v_u_190 = nil
	local v_u_192 = p_u_10.PromptButtonHoldBegan:Connect(function()
		-- upvalues: (copy) p_u_10, (ref) v_u_190, (ref) v_u_3, (copy) v_u_182, (copy) v_u_13
		if p_u_10.HoldDuration ~= 0 then
			v_u_190 = v_u_3:Create(v_u_182.Progress, TweenInfo.new(p_u_10.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["Value"] = 1
			})
			v_u_190:Play()
			for _, v191 in ipairs(v_u_13) do
				v191:Play()
			end
		end
	end)
	local v_u_194 = p_u_10.PromptButtonHoldEnded:Connect(function()
		-- upvalues: (ref) v_u_190, (copy) v_u_14
		if v_u_190 then
			v_u_190:Cancel()
			v_u_190 = nil
		end
		for _, v193 in ipairs(v_u_14) do
			v193:Play()
		end
	end)
	local v_u_196 = p_u_10.Triggered:Connect(function()
		-- upvalues: (copy) v_u_15
		for _, v195 in ipairs(v_u_15) do
			v195:Play()
		end
	end)
	local v_u_198 = p_u_10.TriggerEnded:Connect(function()
		-- upvalues: (copy) v_u_16
		for _, v197 in ipairs(v_u_16) do
			v197:Play()
		end
	end)
	local function v208()
		-- upvalues: (copy) p_u_10, (copy) v_u_25, (ref) v_u_4, (copy) v_u_26, (ref) v_u_20
		pcall(function()
			-- upvalues: (ref) p_u_10, (ref) v_u_25, (ref) v_u_4, (ref) v_u_26, (ref) v_u_20
			local v199 = Instance.new("GetTextBoundsParams")
			v199.Text = p_u_10.ActionText
			v199.Font = v_u_25.FontFace
			v199.Size = v_u_25.TextSize
			v199.Width = 1000
			local v200 = v_u_4:GetTextBoundsAsync(v199)
			local v201 = Instance.new("GetTextBoundsParams")
			v201.Text = p_u_10.ObjectText
			v201.Font = v_u_26.FontFace
			v201.Size = v_u_26.TextSize
			v201.Width = 1000
			local v202 = v_u_4:GetTextBoundsAsync(v201)
			local v203 = v200.X
			local v204 = v202.X
			local v205 = math.max(v203, v204)
			local v206 = (p_u_10.ActionText == nil or p_u_10.ActionText == "") and (p_u_10.ObjectText == nil or p_u_10.ObjectText == "") and 72 or v205 + 72 + 24
			local v207 = (p_u_10.ObjectText == nil or p_u_10.ObjectText == "") and 0 or 9
			v_u_25.Position = UDim2.new(0.5, 72 - v206 / 2, 0, v207)
			v_u_26.Position = UDim2.new(0.5, 72 - v206 / 2, 0, -10)
			v_u_25.Text = p_u_10.ActionText
			v_u_26.Text = p_u_10.ObjectText
			v_u_25.AutoLocalize = p_u_10.AutoLocalize
			v_u_25.RootLocalizationTable = p_u_10.RootLocalizationTable
			v_u_26.AutoLocalize = p_u_10.AutoLocalize
			v_u_26.RootLocalizationTable = p_u_10.RootLocalizationTable
			v_u_20.Size = UDim2.fromOffset(v206, 72)
			v_u_20.SizeOffset = Vector2.new(p_u_10.UIOffset.X / v_u_20.Size.Width.Offset, p_u_10.UIOffset.Y / v_u_20.Size.Height.Offset)
		end)
	end
	local v_u_209 = p_u_10.Changed:Connect(v208)
	pcall(function()
		-- upvalues: (copy) p_u_10, (copy) v_u_25, (ref) v_u_4, (copy) v_u_26, (ref) v_u_20
		local v210 = Instance.new("GetTextBoundsParams")
		v210.Text = p_u_10.ActionText
		v210.Font = v_u_25.FontFace
		v210.Size = v_u_25.TextSize
		v210.Width = 1000
		local v211 = v_u_4:GetTextBoundsAsync(v210)
		local v212 = Instance.new("GetTextBoundsParams")
		v212.Text = p_u_10.ObjectText
		v212.Font = v_u_26.FontFace
		v212.Size = v_u_26.TextSize
		v212.Width = 1000
		local v213 = v_u_4:GetTextBoundsAsync(v212)
		local v214 = v211.X
		local v215 = v213.X
		local v216 = math.max(v214, v215)
		local v217 = (p_u_10.ActionText == nil or p_u_10.ActionText == "") and (p_u_10.ObjectText == nil or p_u_10.ObjectText == "") and 72 or v216 + 72 + 24
		local v218 = (p_u_10.ObjectText == nil or p_u_10.ObjectText == "") and 0 or 9
		v_u_25.Position = UDim2.new(0.5, 72 - v217 / 2, 0, v218)
		v_u_26.Position = UDim2.new(0.5, 72 - v217 / 2, 0, -10)
		v_u_25.Text = p_u_10.ActionText
		v_u_26.Text = p_u_10.ObjectText
		v_u_25.AutoLocalize = p_u_10.AutoLocalize
		v_u_25.RootLocalizationTable = p_u_10.RootLocalizationTable
		v_u_26.AutoLocalize = p_u_10.AutoLocalize
		v_u_26.RootLocalizationTable = p_u_10.RootLocalizationTable
		v_u_20.Size = UDim2.fromOffset(v217, 72)
		v_u_20.SizeOffset = Vector2.new(p_u_10.UIOffset.X / v_u_20.Size.Width.Offset, p_u_10.UIOffset.Y / v_u_20.Size.Height.Offset)
	end)
	v_u_20.Adornee = p_u_10.Parent
	v_u_20.Parent = p12
	local v_u_219 = v_u_190
	for _, v220 in ipairs(v_u_16) do
		v220:Play()
	end
	return function()
		-- upvalues: (copy) v_u_192, (copy) v_u_194, (copy) v_u_196, (copy) v_u_198, (copy) v_u_209, (ref) v_u_219, (copy) v_u_15, (ref) v_u_20
		v_u_192:Disconnect()
		v_u_194:Disconnect()
		v_u_196:Disconnect()
		v_u_198:Disconnect()
		v_u_209:Disconnect()
		if v_u_219 then
			v_u_219:Cancel()
			v_u_219 = nil
		end
		for _, v221 in ipairs(v_u_15) do
			v221:Play()
		end
		wait(0.2)
		v_u_20.Parent = nil
	end
end
v2.PromptShown:Connect(function(p223, p224)
	-- upvalues: (copy) v_u_5, (copy) v_u_222
	if p223:GetAttribute("DontShow") == nil then
		if p223.Style == Enum.ProximityPromptStyle.Default then
			return
		end
		local v225 = v_u_5:FindFirstChild("ProximityPrompts")
		if v225 == nil then
			v225 = Instance.new("ScreenGui")
			v225.Name = "ProximityPrompts"
			v225.ResetOnSpawn = false
			v225.Parent = v_u_5
		end
		local v226 = v_u_222(p223, p224, v225)
		p223.PromptHidden:Wait()
		v226()
	end
end)