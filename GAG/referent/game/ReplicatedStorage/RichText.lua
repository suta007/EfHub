local v_u_1 = {}
local v_u_2 = {
	["Color"] = "TextColor3",
	["StrokeColor"] = "TextStrokeColor3",
	["ImageColor"] = "ImageColor3"
}
v_u_1.ColorShortcuts = {}
v_u_1.ColorShortcuts.White = Color3.new(1, 1, 1)
v_u_1.ColorShortcuts.Black = Color3.new(0, 0, 0)
v_u_1.ColorShortcuts.Red = Color3.new(1, 0.4, 0.4)
v_u_1.ColorShortcuts.Green = Color3.new(0.4, 1, 0.4)
v_u_1.ColorShortcuts.Blue = Color3.new(0.4, 0.4, 1)
v_u_1.ColorShortcuts.Cyan = Color3.new(0.4, 0.85, 1)
v_u_1.ColorShortcuts.Orange = Color3.new(1, 0.5, 0.2)
v_u_1.ColorShortcuts.Yellow = Color3.new(1, 0.9, 0.2)
v_u_1.ImageShortcuts = {}
v_u_1.ImageShortcuts.Eggplant = 639588687
v_u_1.ImageShortcuts.Thinking = 955646496
v_u_1.ImageShortcuts.Sad = 947900188
v_u_1.ImageShortcuts.Happy = 414889555
v_u_1.ImageShortcuts.Despicable = 711674643
local v_u_3 = {
	["ContainerHorizontalAlignment"] = "Center",
	["ContainerVerticalAlignment"] = "Center",
	["TextYAlignment"] = "Center",
	["TextScaled"] = true,
	["TextScaleRelativeTo"] = "Frame",
	["TextScale"] = 0.6,
	["TextSize"] = 20,
	["Font"] = "SourceSans",
	["TextColor3"] = "White",
	["TextStrokeColor3"] = "Black",
	["TextTransparency"] = 0,
	["TextStrokeTransparency"] = 0,
	["BackgroundTransparency"] = 1,
	["BorderSizePixel"] = 0,
	["ImageColor3"] = "White",
	["ImageTransparency"] = 0,
	["ImageRectOffset"] = "0,0",
	["ImageRectSize"] = "0,0",
	["AnimateStepTime"] = 0,
	["AnimateStepGrouping"] = "Letter",
	["AnimateStepFrequency"] = 4,
	["AnimateYield"] = 0,
	["AnimateStyle"] = "Appear",
	["AnimateStyleTime"] = 0.5,
	["AnimateStyleNumPeriods"] = 3,
	["AnimateStyleAmplitude"] = 0.5
}
local v_u_33 = {
	["Appear"] = function(p4)
		p4.Visible = true
	end,
	["Fade"] = function(p5, p6, p7)
		p5.Visible = true
		if p5:IsA("TextLabel") then
			p5.TextTransparency = 1 - p6 * (1 - p7.TextTransparency)
		elseif p5:IsA("ImageLabel") then
			p5.ImageTransparency = 1 - p6 * (1 - p7.ImageTransparency)
		end
	end,
	["Wiggle"] = function(p8, p9, p10)
		p8.Visible = true
		local v11 = p10.InitialSize.Y.Offset * (1 - p9) * p10.AnimateStyleAmplitude
		local v12 = p10.InitialPosition
		local v13 = UDim2.new
		local v14 = p9 * 3.141592653589793 * 2 * p10.AnimateStyleNumPeriods
		p8.Position = v12 + v13(0, 0, 0, math.sin(v14) * v11 / 2)
	end,
	["FallDown"] = function(p15, p16, p17)
		p15.Visible = true
		local v18 = p17.InitialSize.Y.Offset * (1 - p16) * p17.AnimateStyleAmplitude
		p15.Position = p17.InitialPosition + UDim2.new(0, 0, 0, v18 * -1)
		p15.TextTransparency = 1 - p16
	end,
	["Swing"] = function(p19, p20, p21)
		p19.Visible = true
		local v22 = 90 * (1 - p20) * p21.AnimateStyleAmplitude
		local v23 = p20 * 3.141592653589793 * 2 * p21.AnimateStyleNumPeriods
		p19.Rotation = math.sin(v23) * v22
	end,
	["Spin"] = function(p24, p25, p26)
		p24.Visible = true
		p24.Position = p26.InitialPosition + UDim2.new(0, p26.InitialSize.X.Offset / 2, 0, p26.InitialSize.Y.Offset / 2)
		p24.AnchorPoint = Vector2.new(0.5, 0.5)
		p24.Rotation = p25 * p26.AnimateStyleNumPeriods * 360
	end,
	["Rainbow"] = function(p27, p28, p29)
		p27.Visible = true
		local v30 = Color3.fromHSV(p28 * p29.AnimateStyleNumPeriods % 1, 1, 1)
		if p27:IsA("TextLabel") then
			local v31 = getColorFromString(p29.TextColor3)
			p27.TextColor3 = Color3.new(v30.r + p28 * (v31.r - v30.r), v30.g + p28 * (v31.g - v30.g), v30.b + p28 * (v31.b - v30.b))
		else
			local v32 = getColorFromString(p29.ImageColor3)
			p27.ImageColor3 = Color3.new(v30.r + p28 * (v32.r - v30.r), v30.g + p28 * (v32.g - v30.g), v30.b + p28 * (v32.b - v30.b))
		end
	end
}
local v_u_34 = game:GetService("TextService")
local v_u_35 = game:GetService("RunService")
local v_u_36 = 0
function getLayerCollector(p37)
	if p37 then
		if p37:IsA("LayerCollector") then
			return p37
		elseif p37 and p37.Parent then
			return getLayerCollector(p37.Parent)
		else
			return nil
		end
	else
		return nil
	end
end
function shallowCopy(p38)
	local v39 = {}
	for v40, v41 in pairs(p38) do
		v39[v40] = v41
	end
	return v39
end
function getColorFromString(p42)
	-- upvalues: (copy) v_u_1
	if v_u_1.ColorShortcuts[p42] then
		return v_u_1.ColorShortcuts[p42]
	end
	local v43, v44, v45 = p42:match("(%d+),(%d+),(%d+)")
	return Color3.new(v43 / 255, v44 / 255, v45 / 255)
end
function getVector2FromString(p46)
	local v47, v48 = p46:match("(%d+),(%d+)")
	return Vector2.new(v47, v48)
end
function setHorizontalAlignment(p49, p50)
	if p50 == "Left" then
		p49.AnchorPoint = Vector2.new(0, 0)
		p49.Position = UDim2.new(0, 0, 0, 0)
		return
	elseif p50 == "Center" then
		p49.AnchorPoint = Vector2.new(0.5, 0)
		p49.Position = UDim2.new(0.5, 0, 0, 0)
	elseif p50 == "Right" then
		p49.AnchorPoint = Vector2.new(1, 0)
		p49.Position = UDim2.new(1, 0, 0, 0)
	end
end
function v_u_1.New(_, p_u_51, p52, p53, p54, p55)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_34, (copy) v_u_1, (ref) v_u_36, (copy) v_u_35, (copy) v_u_33
	for _, v56 in pairs(p_u_51:GetChildren()) do
		v56:Destroy()
	end
	local v_u_57 = p54 == nil and true or p54
	local v_u_58 = {}
	local v_u_59 = {}
	if p55 then
		p52 = p55.Text
		p53 = p55.StartingProperties
	end
	local v_u_60 = {}
	local v_u_61 = {}
	local v_u_62 = {}
	local v_u_63 = 0
	local v_u_64 = false
	local v_u_65 = Instance.new("TextLabel")
	local v_u_66 = Instance.new("ImageLabel")
	local v_u_67 = getLayerCollector(p_u_51)
	v_u_65.AutoLocalize = false
	local v_u_68 = nil
	local v_u_69 = nil
	local function v_u_73(p70, p71)
		-- upvalues: (ref) v_u_2, (copy) v_u_59, (ref) v_u_58, (ref) v_u_68, (copy) v_u_60, (ref) v_u_3, (ref) v_u_69
		local v72 = v_u_2[p70] or p70
		if p71 == "/" then
			if v_u_59[v72] then
				p71 = v_u_59[v72]
			else
				warn("Attempt to default <" .. v72 .. "> to value with no default")
			end
		end
		if tonumber(p71) then
			p71 = tonumber(p71)
		elseif p71 == "false" or p71 == "true" then
			p71 = p71 == "true"
		end
		v_u_58[v72] = p71
		if not v_u_68(v72, p71) then
			if v72 == "ContainerHorizontalAlignment" and v_u_60[#v_u_60] then
				setHorizontalAlignment(v_u_60[#v_u_60].Container, p71)
			elseif not v_u_3[v72] then
				if v72 ~= "Img" then
					return false
				end
				v_u_69(p71)
			end
		end
		return true
	end
	v_u_68 = function(p_u_74, p75, p76)
		-- upvalues: (copy) v_u_65, (copy) v_u_66
		local v_u_77 = nil
		local v78 = false
		for _, v_u_79 in pairs(p76 and { p76 } or { v_u_65, v_u_66 }) do
			if pcall(function()
				-- upvalues: (ref) v_u_77, (copy) v_u_79, (copy) p_u_74
				local v80 = v_u_79[p_u_74]
				v_u_77 = typeof(v80)
			end) then
				if v_u_77 == "Color3" then
					v_u_79[p_u_74] = getColorFromString(p75)
				elseif v_u_77 == "Vector2" then
					v_u_79[p_u_74] = getVector2FromString(p75)
				else
					v_u_79[p_u_74] = p75
				end
				v78 = true
			end
		end
		return v78
	end
	local v_u_81 = v_u_68
	for v82, v83 in pairs(v_u_3) do
		v_u_73(v82, v83)
		v_u_59[v_u_2[v82] or v82] = v_u_58[v_u_2[v82] or v82]
	end
	for v84, v85 in pairs(p53 or {}) do
		v_u_73(v84, v85)
		v_u_59[v_u_2[v84] or v84] = v_u_58[v_u_2[v84] or v84]
	end
	if p55 then
		v_u_58 = p55.OverflowPickupProperties
		for v86, v87 in pairs(v_u_58) do
			v_u_73(v86, v87)
		end
	end
	local v_u_88 = 0
	local function v_u_97()
		-- upvalues: (copy) v_u_60, (ref) v_u_88, (ref) v_u_57, (ref) v_u_58, (copy) v_u_67, (copy) p_u_51, (ref) v_u_64, (copy) v_u_61, (ref) v_u_63
		local v89 = v_u_60[#v_u_60]
		if v89 then
			v_u_88 = v_u_88 + v89.Size.Y.Offset
			if not v_u_57 then
				local v90 = v_u_88
				local v91
				if v_u_58.TextScaled == true then
					local v92 = nil
					if v_u_58.TextScaleRelativeTo == "Screen" then
						v92 = v_u_67.AbsoluteSize.Y
					elseif v_u_58.TextScaleRelativeTo == "Frame" then
						v92 = p_u_51.AbsoluteSize.Y
					end
					local v93 = v_u_58.TextScale * v92
					v91 = math.min(v93, 100)
				else
					v91 = v_u_58.TextSize
				end
				if v90 + v91 > p_u_51.AbsoluteSize.Y then
					v_u_64 = true
					return
				end
			end
		end
		local v94 = Instance.new("Frame")
		v94.Name = string.format("Line%03d", #v_u_60 + 1)
		v94.Size = UDim2.new(0, 0, 0, 0)
		v94.BackgroundTransparency = 1
		local v95 = Instance.new("Frame", v94)
		v95.Name = "Container"
		v95.Size = UDim2.new(0, 0, 0, 0)
		v95.BackgroundTransparency = 1
		setHorizontalAlignment(v95, v_u_58.ContainerHorizontalAlignment)
		v94.Parent = p_u_51
		local v96 = v_u_60
		table.insert(v96, v94)
		v_u_61[#v_u_60] = {}
		v_u_63 = 0
	end
	v_u_97()
	local function v_u_109(p98, p99, p100, p101)
		-- upvalues: (copy) v_u_60, (ref) v_u_58, (ref) v_u_63, (copy) p_u_51, (copy) v_u_61, (copy) v_u_97, (copy) v_u_62
		local v102 = v_u_60[#v_u_60]
		local v103 = v_u_58.TextYAlignment
		local v104 = tostring(v103)
		if v104 == "Top" then
			p98.Position = UDim2.new(0, v_u_63, 0, 0)
			p98.AnchorPoint = Vector2.new(0, 0)
		elseif v104 == "Center" then
			p98.Position = UDim2.new(0, v_u_63, 0.5, 0)
			p98.AnchorPoint = Vector2.new(0, 0.5)
		elseif v104 == "Bottom" then
			p98.Position = UDim2.new(0, v_u_63, 1, 0)
			p98.AnchorPoint = Vector2.new(0, 1)
		end
		v_u_63 = v_u_63 + p100
		if v_u_63 > p_u_51.AbsoluteSize.X and v_u_63 ~= p100 then
			p98:Destroy()
			local v105 = v_u_61[#v_u_60][#v_u_61[#v_u_60]]
			if v105:IsA("TextLabel") and v105.Text == " " then
				v102.Container.Size = UDim2.new(0, v_u_63 - p100 - v105.Size.X.Offset, 1, 0)
				v105:Destroy()
				table.remove(v_u_61[#v_u_60])
			end
			v_u_97()
			p101()
		else
			p98.Size = UDim2.new(0, p100, 0, p99)
			v102.Container.Size = UDim2.new(0, v_u_63, 1, 0)
			local v106 = UDim2.new
			local v107 = v102.Size.Y.Offset
			v102.Size = v106(1, 0, 0, (math.max(v107, p99)))
			p98.Name = string.format("Group%03d", #v_u_61[#v_u_60] + 1)
			p98.Parent = v102.Container
			local v108 = v_u_61[#v_u_60]
			table.insert(v108, p98)
			v_u_62[p98] = shallowCopy(v_u_58)
			v_u_62[p98].InitialSize = p98.Size
			v_u_62[p98].InitialPosition = p98.Position
			v_u_62[p98].InitialAnchorPoint = p98.AnchorPoint
			v_u_58.AnimateYield = 0
		end
	end
	local function v_u_123(p_u_110)
		-- upvalues: (copy) v_u_97, (ref) v_u_63, (ref) v_u_58, (copy) v_u_67, (copy) p_u_51, (ref) v_u_34, (copy) v_u_65, (copy) v_u_62, (ref) v_u_109, (ref) v_u_64, (ref) v_u_123
		if p_u_110 == "\n" then
			v_u_97()
			return
		elseif p_u_110 ~= " " or v_u_63 ~= 0 then
			local v111
			if v_u_58.TextScaled == true then
				local v112 = nil
				if v_u_58.TextScaleRelativeTo == "Screen" then
					v112 = v_u_67.AbsoluteSize.Y
				elseif v_u_58.TextScaleRelativeTo == "Frame" then
					v112 = p_u_51.AbsoluteSize.Y
				end
				local v113 = v_u_58.TextScale * v112
				v111 = math.min(v113, 100)
			else
				v111 = v_u_58.TextSize
			end
			local v114 = v_u_34:GetTextSize(p_u_110, v111, v_u_65.Font, Vector2.new(v_u_67.AbsoluteSize.X, v111)).X
			local v115 = v_u_65:Clone()
			v115.TextScaled = false
			v115.TextSize = v111
			v115.Text = p_u_110
			v115.TextTransparency = 1
			v115.TextStrokeTransparency = 1
			v115.TextWrapped = false
			local v116 = 1
			local v117 = 0
			for v118, v119 in utf8.graphemes(p_u_110) do
				local v120 = string.sub(p_u_110, v118, v119)
				local v121 = v_u_34:GetTextSize(v120, v111, v_u_65.Font, Vector2.new(v_u_67.AbsoluteSize.X, v111)).X
				local v122 = v_u_65:Clone()
				v122.Text = v120
				v122.TextScaled = false
				v122.TextSize = v111
				v122.Position = UDim2.new(0, v117, 0, 0)
				v122.Size = UDim2.new(0, v121 + 1, 0, v111)
				v122.Name = string.format("Char%03d", v116)
				v122.Parent = v115
				v122.Visible = false
				v_u_62[v122] = shallowCopy(v_u_58)
				v_u_62[v122].InitialSize = v122.Size
				v_u_62[v122].InitialPosition = v122.Position
				v_u_62[v122].InitialAnchorPoint = v122.AnchorPoint
				v117 = v117 + v121
				v116 = v116 + 1
			end
			v_u_109(v115, v111, v114, function()
				-- upvalues: (ref) v_u_64, (ref) v_u_123, (copy) p_u_110
				if not v_u_64 then
					v_u_123(p_u_110)
				end
			end)
		end
	end
	v_u_69 = function(p_u_124)
		-- upvalues: (ref) v_u_58, (copy) v_u_67, (copy) p_u_51, (copy) v_u_66, (ref) v_u_1, (ref) v_u_109, (ref) v_u_64, (ref) v_u_69
		local v125
		if v_u_58.TextScaled == true then
			local v126 = nil
			if v_u_58.TextScaleRelativeTo == "Screen" then
				v126 = v_u_67.AbsoluteSize.Y
			elseif v_u_58.TextScaleRelativeTo == "Frame" then
				v126 = p_u_51.AbsoluteSize.Y
			end
			local v127 = v_u_58.TextScale * v126
			v125 = math.min(v127, 100)
		else
			v125 = v_u_58.TextSize
		end
		local v128 = v_u_66:Clone()
		if v_u_1.ImageShortcuts[p_u_124] then
			local v129 = v_u_1.ImageShortcuts[p_u_124]
			v128.Image = typeof(v129) == "number" and "rbxassetid://" .. v_u_1.ImageShortcuts[p_u_124] or v_u_1.ImageShortcuts[p_u_124]
		else
			v128.Image = "rbxassetid://" .. p_u_124
		end
		v128.Size = UDim2.new(0, v125, 0, v125)
		v128.Visible = false
		v_u_109(v128, v125, v125, function()
			-- upvalues: (ref) v_u_64, (ref) v_u_69, (copy) p_u_124
			if not v_u_64 then
				v_u_69(p_u_124)
			end
		end)
	end
	local function v134(p130)
		-- upvalues: (ref) v_u_73, (ref) v_u_123
		for _, v131 in pairs(p130) do
			local v132, v133 = string.match(v131, "<(.+)=(.+)>")
			if v132 and v133 then
				if not v_u_73(v132, v133) then
					warn("Could not apply markup: ", v131)
				end
			else
				v_u_123(v131)
			end
		end
	end
	local v135 = #p52
	local v136 = {}
	local v137
	if p55 then
		v137 = p55.OverflowPickupIndex
	else
		v137 = 1
	end
	while true do
		if not v137 or v137 > v135 then
			v138 = v137
			break
		end
		local v138, v139 = string.find(p52, "<.->", v137)
		local v140, v141 = string.find(p52, "[ \t\n]", v137)
		local v142
		if v138 and (v139 and (not v140 or v138 < v140)) then
			v142 = nil
		else
			v138 = v140 or v135 + 1
			v139 = v141 or v135 + 1
			v142 = true
		end
		local v143
		if v137 < v138 then
			local v144 = v138 - 1
			v143 = string.sub(p52, v137, v144) or nil
		else
			v143 = nil
		end
		local v145
		if v138 <= v135 then
			v145 = string.sub(p52, v138, v139) or nil
		else
			v145 = nil
		end
		table.insert(v136, v143)
		if v142 then
			v134(v136)
			if v_u_64 then
				v138 = v137
				break
			end
			v134({ v145 })
			if v_u_64 then
				break
			end
			v136 = {}
		else
			table.insert(v136, v145)
		end
		v137 = v139 + 1
	end
	if not v_u_64 then
		v134(v136)
	end
	local v146 = Instance.new("UIListLayout")
	v146.HorizontalAlignment = v_u_58.ContainerHorizontalAlignment
	v146.VerticalAlignment = v_u_58.ContainerVerticalAlignment
	v146.Parent = p_u_51
	local v147 = p_u_51.AbsoluteSize.X
	local v148 = 0
	local v149 = 0
	for _, v150 in pairs(v_u_60) do
		v148 = v148 + v150.Size.Y.Offset
		local v151 = v150.Container
		local v152 = nil
		local v153 = nil
		if v151.AnchorPoint.X == 0 then
			v152 = v151.Position.X.Offset
			v153 = v151.Size.X.Offset
		elseif v151.AnchorPoint.X == 0.5 then
			v152 = v150.AbsoluteSize.X / 2 - v151.Size.X.Offset / 2
			v153 = v150.AbsoluteSize.X / 2 + v151.Size.X.Offset / 2
		elseif v151.AnchorPoint.X == 1 then
			v152 = v150.AbsoluteSize.X - v151.Size.X.Offset
			v153 = v150.AbsoluteSize.X
		end
		v147 = math.min(v147, v152)
		v149 = math.max(v149, v153)
	end
	v_u_36 = v_u_36 + 1
	local v_u_154 = false
	local v_u_155 = false
	local v_u_156 = false
	local v_u_157 = "TextAnimation" .. v_u_36
	local v_u_158 = {}
	local function v_u_166()
		-- upvalues: (ref) v_u_155, (ref) v_u_158, (ref) v_u_154, (ref) v_u_35, (copy) v_u_157, (ref) v_u_33
		if v_u_155 and #v_u_158 == 0 or v_u_154 then
			v_u_154 = true
			v_u_35:UnbindFromRenderStep(v_u_157)
			v_u_158 = {}
		else
			local v159 = tick()
			for v160 = #v_u_158, 1, -1 do
				local v161 = v_u_158[v160]
				local v162 = v161.Settings
				local v163 = v_u_33[v162.AnimateStyle]
				if not v163 then
					warn("No animation style found for: ", v162.AnimateStyle, ", defaulting to Appear")
					v163 = v_u_33.Appear
				end
				local v164 = (v159 - v161.Start) / v162.AnimateStyleTime
				local v165 = math.min(v164, 1)
				v163(v161.Char, v165, v162)
				if v165 >= 1 then
					table.remove(v_u_158, v160)
				end
			end
		end
	end
	local function v_u_170(p167)
		-- upvalues: (copy) v_u_62, (ref) v_u_81
		p167.Position = v_u_62[p167].InitialPosition
		p167.Size = v_u_62[p167].InitialSize
		p167.AnchorPoint = v_u_62[p167].InitialAnchorPoint
		for v168, v169 in pairs(v_u_62[p167]) do
			v_u_81(v168, v169, p167)
		end
	end
	local function v_u_200(p171)
		-- upvalues: (ref) v_u_154, (ref) v_u_35, (copy) v_u_157, (copy) v_u_166, (copy) v_u_61, (ref) v_u_158, (ref) v_u_156, (copy) v_u_62, (ref) v_u_155
		v_u_154 = false
		v_u_35:BindToRenderStep(v_u_157, Enum.RenderPriority.Last.Value, v_u_166)
		local v172 = nil
		local v173 = nil
		local _ = nil
		local v174 = nil
		for _, v175 in pairs(v_u_61) do
			for _, v176 in pairs(v175) do
				v176.Visible = false
				for _, v177 in pairs(v176:GetChildren()) do
					v177.Visible = false
				end
			end
		end
		for _, v178 in pairs(v_u_61) do
			for _, v179 in pairs(v178) do
				local v180 = v_u_62[v179]
				v172 = (v180.AnimateStepGrouping ~= v174 or v180.AnimateStepFrequency ~= v173) and 0 or v172
				v174 = v180.AnimateStepGrouping
				local v181 = v180.AnimateStepTime
				local v182 = v180.AnimateStepFrequency
				if v180.AnimateYield > 0 then
					wait(v180.AnimateYield)
				end
				local v183
				if v174 == "Word" or v174 == "All" then
					local v184
					if v179:IsA("TextLabel") then
						v179.Visible = true
						v184 = v181
						v173 = v182
						for _, v185 in pairs(v179:GetChildren()) do
							local v186 = v_u_158
							local v187 = {
								["Char"] = v185,
								["Settings"] = v_u_62[v185],
								["Start"] = tick()
							}
							table.insert(v186, v187)
						end
					else
						local v188 = v_u_158
						local v189 = {
							["Char"] = v179,
							["Settings"] = v180,
							["Start"] = tick()
						}
						table.insert(v188, v189)
						v184 = v181
						v173 = v182
					end
					if v174 == "Word" then
						v183 = v172 + 1
						if v_u_156 or (v183 % v173 ~= 0 or v184 < 0) then
							v172 = v183
						else
							local v190 = v184 > 0 and v184 or nil
							wait(v190)
							v172 = v183
						end
					end
				elseif v174 == "Letter" then
					if v179:IsA("TextLabel") then
						v179.Visible = true
						local _ = v179.Text
						local v191 = v181
						v173 = v182
						local v192 = 1
						while true do
							local v193 = v179:FindFirstChild(string.format("Char%03d", v192))
							if not v193 then
								break
							end
							local v194 = v_u_158
							local v195 = {
								["Char"] = v193,
								["Settings"] = v_u_62[v193],
								["Start"] = tick()
							}
							table.insert(v194, v195)
							v183 = v172 + 1
							if not v_u_156 and (v183 % v173 == 0 and v191 >= 0) then
								local v196
								if v191 > 0 then
									v196 = v191 or nil
								else
									v196 = nil
								end
								wait(v196)
							end
							if v_u_154 then
								return
							end
							v192 = v192 + 1
							v172 = v183
						end
					else
						local v197 = v_u_158
						local v198 = {
							["Char"] = v179,
							["Settings"] = v180,
							["Start"] = tick()
						}
						table.insert(v197, v198)
						v183 = v172 + 1
						if v_u_156 or (v183 % v182 ~= 0 or v181 < 0) then
							v172 = v183
							v173 = v182
						else
							local v199 = v181 > 0 and v181 or nil
							wait(v199)
							v172 = v183
							v173 = v182
						end
					end
				else
					warn("Invalid step grouping: ", v174)
					v173 = v182
				end
				if v_u_154 then
					return
				end
			end
		end
		v_u_155 = true
		if p171 then
			while #v_u_158 > 0 do
				v_u_35.RenderStepped:Wait()
			end
		end
	end
	local v201 = {
		["Overflown"] = v_u_64,
		["OverflowPickupIndex"] = v138,
		["StartingProperties"] = p53,
		["OverflowPickupProperties"] = v_u_58,
		["Text"] = p52
	}
	if p55 then
		p55.NextTextObject = v201
	end
	v201.ContentSize = Vector2.new(v149 - v147, v148)
	function v201.Animate(p202, p203)
		-- upvalues: (copy) v_u_200
		if p203 then
			v_u_200()
		else
			coroutine.wrap(v_u_200)()
		end
		if p202.NextTextObject then
			p202.NextTextObject:Animate(p203)
		end
	end
	function v201.Show(p204, p205)
		-- upvalues: (ref) v_u_156, (ref) v_u_154, (copy) v_u_61, (copy) v_u_170
		if p205 then
			v_u_156 = true
		else
			v_u_154 = true
			for _, v206 in pairs(v_u_61) do
				for _, v207 in pairs(v206) do
					v207.Visible = true
					for _, v208 in pairs(v207:GetChildren()) do
						v208.Visible = true
						v_u_170(v208)
					end
					if v207:IsA("ImageLabel") then
						v_u_170(v207)
					end
				end
			end
		end
		if p204.NextTextObject then
			p204.NextTextObject:Show(p205)
		end
	end
	function v201.Hide(p209)
		-- upvalues: (ref) v_u_154, (copy) v_u_61
		v_u_154 = true
		for _, v210 in pairs(v_u_61) do
			for _, v211 in pairs(v210) do
				v211.Visible = false
				for _, v212 in pairs(v211:GetChildren()) do
					v212.Visible = false
				end
			end
		end
		if p209.NextTextObject then
			p209.NextTextObject:Hide()
		end
	end
	return v201
end
function v_u_1.ContinueOverflow(_, p213, p214)
	-- upvalues: (copy) v_u_1
	return v_u_1:New(p213, nil, nil, false, p214)
end
return v_u_1