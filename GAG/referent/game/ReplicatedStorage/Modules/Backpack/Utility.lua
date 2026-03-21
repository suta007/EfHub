local v_u_1 = Color3.fromRGB(0, 162, 255)
local v_u_2 = Color3.fromRGB(78, 84, 96)
local v_u_3 = Color3.fromRGB(204, 204, 204)
local v_u_4 = Color3.fromRGB(255, 255, 255)
local v_u_5 = Color3.fromRGB(150, 150, 150)
local v_u_6 = game:GetService("HttpService")
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = game:GetService("GuiService")
local v_u_9 = game:GetService("RunService")
local v_u_10 = game.Players.LocalPlayer.PlayerGui
v_u_10:WaitForChild("BackpackGui")
local v_u_11 = game:GetService("ContextActionService")
local v_u_12 = game:GetService("VRService")
local v13, v14 = pcall(function()
	return false
end)
local v_u_15 = v13 and v14
local v_u_22 = {
	["Create"] = function(p_u_16)
		return function(p17)
			-- upvalues: (copy) p_u_16
			local v18 = Instance.new(p_u_16)
			local v19 = nil
			for v20, v21 in pairs(p17) do
				if type(v20) == "number" then
					v21.Parent = v18
				elseif v20 == "Parent" then
					v19 = v21
				else
					v18[v20] = v21
				end
			end
			if v19 then
				v18.Parent = v19
			end
			return v18
		end
	end
}
local v_u_23 = {}
setmetatable(v_u_23, {
	["__mode"] = "k"
})
local v_u_24 = v_u_22.Create("ImageLabel")({
	["Image"] = "",
	["BackgroundTransparency"] = 1
})
function clamp(p25, p26, p27)
	local v28 = math.min(p26, p27)
	return math.max(p25, v28)
end
function ClampVector2(p29, p30, p31)
	return Vector2.new(clamp(p29.x, p30.x, p31.x), clamp(p29.y, p30.y, p31.y))
end
local function v_u_36(p32, p33, p34, p35)
	if p35 <= p32 then
		return p33 + p34
	else
		return p34 * p32 / p35 + p33
	end
end
local function v_u_42(p37, p38, p39, p40)
	if p40 <= p37 then
		return p38 + p39
	end
	local v41 = p37 / p40
	return p38 - p39 * v41 * (v41 - 2)
end
local function v_u_48(p43, p44, p45, p46)
	if p46 <= p43 then
		return p44 + p45
	else
		local v47 = p43 / p46
		if v47 < 0.5 then
			return 2 * p45 * v47 * v47 + p44
		else
			return p44 + p45 * (2 * (2 - v47) * v47 - 1)
		end
	end
end
function PropertyTweener(p_u_49, p_u_50, p_u_51, p_u_52, p_u_53, p_u_54, p_u_55)
	-- upvalues: (copy) v_u_9
	local v_u_56 = {
		["StartTime"] = tick()
	}
	v_u_56.EndTime = v_u_56.StartTime + p_u_53
	v_u_56.Cancelled = false
	local v_u_57 = false
	local v_u_58 = 0
	p_u_49[p_u_50] = p_u_54(0, p_u_51, p_u_52 - p_u_51, p_u_53)
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_56, (copy) p_u_49, (copy) p_u_50, (copy) p_u_54, (copy) p_u_51, (copy) p_u_52, (copy) p_u_53, (ref) v_u_58, (ref) v_u_9, (ref) v_u_57, (copy) p_u_55
		local v59 = tick()
		while v59 < v_u_56.EndTime and p_u_49 do
			if v_u_56.Cancelled then
				return
			end
			p_u_49[p_u_50] = p_u_54(v59 - v_u_56.StartTime, p_u_51, p_u_52 - p_u_51, p_u_53)
			v_u_58 = clamp(0, 1, (v59 - v_u_56.StartTime) / p_u_53)
			v_u_9.RenderStepped:wait()
			v59 = tick()
		end
		if v_u_56.Cancelled == false and p_u_49 then
			if p_u_49 then
				p_u_49[p_u_50] = p_u_54(1, p_u_51, p_u_52 - p_u_51, 1)
			end
			v_u_57 = true
			v_u_58 = 1
			if p_u_55 then
				p_u_55()
			end
		end
	end)()
	function v_u_56.GetFinal(_)
		-- upvalues: (copy) p_u_52
		return p_u_52
	end
	function v_u_56.GetPercentComplete(_)
		-- upvalues: (ref) v_u_58
		return v_u_58
	end
	function v_u_56.IsFinished(_)
		-- upvalues: (ref) v_u_57
		return v_u_57
	end
	function v_u_56.Finish(p60)
		-- upvalues: (ref) v_u_57, (copy) p_u_49, (copy) p_u_50, (copy) p_u_54, (copy) p_u_51, (copy) p_u_52, (ref) v_u_58, (copy) p_u_55
		if not v_u_57 then
			p60:Cancel()
			if p_u_49 then
				p_u_49[p_u_50] = p_u_54(1, p_u_51, p_u_52 - p_u_51, 1)
			end
			v_u_57 = true
			v_u_58 = 1
			if p_u_55 then
				p_u_55()
			end
		end
	end
	function v_u_56.Cancel(_)
		-- upvalues: (copy) v_u_56
		v_u_56.Cancelled = true
	end
	return v_u_56
end
local function v_u_70()
	local v61 = {}
	local v_u_62 = Instance.new("BindableEvent")
	local v_u_63 = nil
	local v_u_64 = nil
	function v61.fire(_, ...)
		-- upvalues: (ref) v_u_63, (ref) v_u_64, (copy) v_u_62
		v_u_63 = { ... }
		v_u_64 = select("#", ...)
		v_u_62:Fire()
	end
	function v61.connect(_, p_u_65)
		-- upvalues: (copy) v_u_62, (ref) v_u_63, (ref) v_u_64
		if not p_u_65 then
			error("connect(nil)", 2)
		end
		return v_u_62.Event:Connect(function()
			-- upvalues: (copy) p_u_65, (ref) v_u_63, (ref) v_u_64
			local v66 = v_u_63
			local v67 = v_u_64
			p_u_65(unpack(v66, 1, v67))
		end)
	end
	function v61.wait(_)
		-- upvalues: (copy) v_u_62, (ref) v_u_63, (ref) v_u_64
		v_u_62.Event:wait()
		if not v_u_63 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end
		local v68 = v_u_63
		local v69 = v_u_64
		return unpack(v68, 1, v69)
	end
	return v61
end
local function v_u_71()
	while not workspace.CurrentCamera do
		workspace.Changed:wait()
	end
	while workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		workspace.CurrentCamera.Changed:wait()
	end
	return workspace.CurrentCamera.ViewportSize
end
local function v_u_78(p_u_72, p_u_73, p_u_74, p_u_75)
	local function v76()
		-- upvalues: (copy) p_u_72, (copy) p_u_74, (copy) p_u_73
		if p_u_72.Active then
			p_u_74(p_u_73)
		end
	end
	local function v77()
		-- upvalues: (copy) p_u_72, (copy) p_u_75, (copy) p_u_73
		if p_u_72.Active then
			p_u_75(p_u_73)
		end
	end
	p_u_72.MouseEnter:Connect(v77)
	p_u_72.SelectionGained:Connect(v77)
	p_u_72.MouseLeave:Connect(v76)
	p_u_72.SelectionLost:Connect(v76)
	p_u_74(p_u_73)
end
local function v_u_83(p79, p80)
	-- upvalues: (copy) v_u_23, (copy) v_u_71
	v_u_23[p79] = p80
	local v81 = v_u_71()
	local v82 = v_u_71()
	p80(v81, v82.Y > v82.X)
end
local v_u_84 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local function v_u_105(p85, p86, p_u_87, p_u_88, p_u_89)
	-- upvalues: (copy) v_u_22, (copy) v_u_84, (copy) v_u_7, (copy) v_u_8, (copy) v_u_12
	local v90 = v_u_22.Create("ImageLabel")({
		["Image"] = "",
		["BackgroundTransparency"] = 1
	})
	local v_u_91 = v_u_22.Create("ImageButton")({
		["Name"] = p85 .. "Button",
		["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		["AutoButtonColor"] = false,
		["BackgroundTransparency"] = 1,
		["Size"] = p86,
		["ZIndex"] = 2,
		["SelectionImageObject"] = v90
	})
	v_u_22.Create("BoolValue")({
		["Name"] = "Enabled",
		["Parent"] = v_u_91,
		["Value"] = true
	})
	if p_u_87 then
		v_u_91.MouseButton1Click:Connect(function()
			-- upvalues: (copy) p_u_87, (ref) v_u_84, (ref) v_u_7
			p_u_87(v_u_84[v_u_7:GetLastInputType()] or false)
		end)
	end
	local v_u_92 = nil
	local function v94(p93)
		-- upvalues: (ref) v_u_92
		v_u_92 = p93
	end
	v_u_91.InputBegan:Connect(function(p95)
		-- upvalues: (copy) v_u_91, (copy) p_u_89, (copy) p_u_88, (ref) v_u_92
		if v_u_91.Selectable and (p95.UserInputType == Enum.UserInputType.MouseMovement or p95.UserInputType == Enum.UserInputType.Touch) then
			local v96 = p_u_89
			if v96 == nil and p_u_88 then
				v96 = p_u_88.HubRef
			end
			if v96 and v96.Active or v96 == nil then
				v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
				local v97 = v_u_91
				if v_u_92 then
					v97 = v_u_92
				end
				if v96 then
					v96:ScrollToFrame(v97)
				end
			end
		end
	end)
	v_u_91.InputEnded:Connect(function(p98)
		-- upvalues: (copy) v_u_91, (ref) v_u_8
		if v_u_91.Selectable and v_u_8.SelectedCoreObject ~= v_u_91 and (p98.UserInputType == Enum.UserInputType.MouseMovement or p98.UserInputType == Enum.UserInputType.Touch) then
			v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
		end
	end)
	v_u_91.SelectionGained:Connect(function()
		-- upvalues: (copy) p_u_89, (copy) p_u_88, (copy) v_u_91, (ref) v_u_92
		local v99 = p_u_89
		if v99 == nil and p_u_88 then
			v99 = p_u_88.HubRef
		end
		if v99 and v99.Active or v99 == nil then
			v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
			local v100 = v_u_91
			if v_u_92 then
				v100 = v_u_92
			end
			if v99 then
				v99:ScrollToFrame(v100)
			end
		end
	end)
	v_u_91.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_91
		v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	end)
	v_u_8.Changed:Connect(function(p101)
		-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_91, (copy) p_u_89, (copy) p_u_88, (ref) v_u_92
		if p101 == "SelectedCoreObject" then
			local v102
			if v_u_12.VREnabled then
				v102 = false
			else
				v102 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v102 then
				if v_u_8.SelectedCoreObject == nil or v_u_8.SelectedCoreObject ~= v_u_91 then
					v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
				elseif v_u_91.Selectable then
					local v103 = p_u_89
					if v103 == nil and p_u_88 then
						v103 = p_u_88.HubRef
					end
					if v103 and v103.Active or v103 == nil then
						v_u_91.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
						local v104 = v_u_91
						if v_u_92 then
							v104 = v_u_92
						end
						if v103 then
							v103:ScrollToFrame(v104)
						end
					end
				end
			else
				return
			end
		else
			return
		end
	end)
	return v_u_91, v94
end
local function v_u_118(p106, p107, p108, p109, p110, p111)
	-- upvalues: (copy) v_u_105, (copy) v_u_22, (copy) v_u_71, (copy) v_u_7
	local v112, v113 = v_u_105(p106, p108, p109, p110, p111)
	local v114 = v_u_22.Create("TextLabel")({
		["Name"] = p106 .. "TextLabel",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 1, -8),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 24,
		["Text"] = p107,
		["TextScaled"] = true,
		["TextWrapped"] = true,
		["ZIndex"] = 2,
		["Parent"] = v112
	})
	local v115 = Instance.new("UITextSizeConstraint", v114)
	local v116 = v_u_71()
	local v117 = v_u_7.TouchEnabled
	if v117 then
		v117 = v116.Y < 500 and true or v116.X < 700
	end
	if v117 then
		v114.TextSize = 18
	elseif false then
		v114.TextSize = 36
	end
	v115.MaxTextSize = v114.TextSize
	return v112, v114, v113
end
local function v_u_128(p119, p120, p121, p122, p123, p124, p125)
	-- upvalues: (copy) v_u_105, (copy) v_u_22
	local v126, v127 = v_u_105(p119, p121, p123, p124, p125)
	return v126, v_u_22.Create("ImageLabel")({
		["Name"] = p119 .. "ImageLabel",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = p122,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Image"] = p120,
		["ZIndex"] = 2,
		["Parent"] = v126
	}), v127
end
local function v_u_139(p129, p130, p131, p132, p133, p134)
	-- upvalues: (copy) v_u_118, (copy) v_u_22
	local v135, v136, v137 = v_u_118(p130, p131, p132, p133, p129, p134)
	local v138 = v_u_22.Create("Frame")({
		["Name"] = p130 .. "Row",
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, p132.Y.Scale, p132.Y.Offset),
		["Parent"] = p129.Page
	})
	v135.Parent = v138
	v135.AnchorPoint = Vector2.new(1, 0)
	v135.Position = UDim2.new(1, -20, 0, 0)
	return v138, v135, v136, v137
end
local function v_u_204(p140, p_u_141, p_u_142)
	-- upvalues: (copy) v_u_6, (copy) v_u_22, (copy) v_u_10, (copy) v_u_12, (copy) v_u_7, (copy) v_u_8, (copy) v_u_11, (copy) v_u_118
	local v_u_143 = Color3.fromRGB(178, 178, 178)
	local v_u_144 = Color3.fromRGB(229, 229, 229)
	local v_u_145 = Color3.fromRGB(255, 255, 255)
	local v_u_146 = nil
	local v_u_147 = {
		["CurrentIndex"] = nil
	}
	Instance.new("BindableEvent").Name = "IndexChanged"
	if type(p140) ~= "table" then
		error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
		return v_u_147
	end
	local v_u_148 = Instance.new("BindableEvent")
	v_u_148.Name = "IndexChanged"
	local v_u_149 = true
	local v_u_150 = v_u_6:GenerateGUID(false)
	local v_u_151 = nil
	local v_u_152 = p140
	local v_u_153 = v_u_22.Create("ImageButton")({
		["Name"] = "DropDownFullscreenFrame",
		["BackgroundTransparency"] = 0.2,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
		["ZIndex"] = 10,
		["Active"] = true,
		["Visible"] = false,
		["Selectable"] = false,
		["AutoButtonColor"] = false,
		["Parent"] = v_u_10.RobloxGui
	})
	local function v155(p154)
		-- upvalues: (ref) v_u_12, (ref) v_u_10, (copy) v_u_153, (copy) v_u_147, (ref) v_u_152
		if p154 == "VREnabled" then
			if v_u_12.VREnabled then
				v_u_153.Parent = require(v_u_10.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):GetGUI()
				v_u_153.BackgroundTransparency = 1
			else
				v_u_153.Parent = v_u_10.RobloxGui
				v_u_153.BackgroundTransparency = 0.2
			end
			if v_u_147.UpdateDropDownList then
				v_u_147:UpdateDropDownList(v_u_152)
			end
		end
	end
	v_u_12.Changed:Connect(v155)
	v155("VREnabled")
	local v_u_156 = v_u_22.Create("ImageLabel")({
		["Name"] = "DropDownSelectionFrame",
		["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0.6, 0, 0.9, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["ZIndex"] = 10,
		["Parent"] = v_u_153
	})
	local v_u_157 = v_u_22.Create("ScrollingFrame")({
		["Name"] = "DropDownScrollingFrame",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, -20, 1, -25),
		["Position"] = UDim2.new(0, 10, 0, 10),
		["ZIndex"] = 10,
		["Parent"] = v_u_156
	})
	local v_u_158 = nil
	local v_u_159 = false
	local function v_u_163(p160, p161)
		-- upvalues: (copy) v_u_147, (ref) v_u_149, (copy) p_u_142, (copy) v_u_153, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (ref) v_u_146, (ref) v_u_158, (ref) v_u_11, (copy) v_u_150, (ref) v_u_151, (ref) v_u_159, (ref) v_u_10
		if p160 == nil or p161 == Enum.UserInputState.Begin then
			v_u_147.DropDownFrame.Selectable = v_u_149
			p_u_142:SetActive(true)
			if v_u_153.Visible then
				local v162
				if v_u_12.VREnabled then
					v162 = false
				else
					v162 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
				end
				if v162 then
					v_u_8.SelectedCoreObject = v_u_146
				end
			end
			v_u_153.Visible = false
			if v_u_158 then
				v_u_158:Disconnect()
			end
			v_u_11:UnbindAction(v_u_150 .. "Action")
			v_u_11:UnbindAction(v_u_150 .. "FreezeAction")
			v_u_151.Value = v_u_149
			v_u_159 = false
			if v_u_12.VREnabled then
				require(v_u_10.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v_u_153, 0)
			end
		end
	end
	local function v_u_164() end
	local function v166()
		-- upvalues: (ref) v_u_149, (copy) v_u_147, (ref) v_u_159, (copy) v_u_153, (ref) v_u_12, (ref) v_u_10, (ref) v_u_146, (ref) v_u_8, (ref) v_u_158, (copy) v_u_145, (copy) v_u_144, (copy) v_u_143, (ref) v_u_11, (copy) v_u_150, (copy) v_u_164, (copy) v_u_163, (copy) p_u_142, (ref) v_u_151
		if v_u_149 then
			v_u_147.DropDownFrame.Selectable = false
			v_u_159 = true
			v_u_153.Visible = true
			if v_u_12.VREnabled then
				require(v_u_10.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v_u_153, 0.5)
			end
			v_u_146 = v_u_147.DropDownFrame
			if v_u_147.CurrentIndex and v_u_147.CurrentIndex > 0 then
				v_u_8.SelectedCoreObject = v_u_147.Selections[v_u_147.CurrentIndex]
			end
			v_u_158 = v_u_8:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: (ref) v_u_147, (ref) v_u_8, (ref) v_u_145, (ref) v_u_12, (ref) v_u_144, (ref) v_u_143
				for v165 = 1, #v_u_147.Selections do
					if v_u_8.SelectedCoreObject == v_u_147.Selections[v165] then
						v_u_147.Selections[v165].TextColor3 = v_u_145
					else
						v_u_147.Selections[v165].TextColor3 = v_u_12.VREnabled and v_u_144 or v_u_143
					end
				end
			end)
			v_u_11:BindActionAtPriority(v_u_150 .. "FreezeAction", v_u_164, false, Enum.ContextActionPriority.High.Value, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			v_u_11:BindActionAtPriority(v_u_150 .. "Action", v_u_163, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
			p_u_142:SetActive(false)
			v_u_151.Value = false
		end
	end
	v_u_147.DropDownFrame = v_u_118("DropDownFrame", "Choose One", UDim2.new(0.6, 0, 0, 50), v166, nil, p_u_142)
	v_u_147.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
	v_u_147.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
	v_u_151 = v_u_147.DropDownFrame.Enabled
	local v_u_167 = v_u_147.DropDownFrame.DropDownFrameTextLabel
	v_u_167.Position = UDim2.new(0, 15, 0, 0)
	v_u_167.Size = UDim2.new(1, -50, 1, -8)
	v_u_167.ClipsDescendants = true
	v_u_167.TextXAlignment = Enum.TextXAlignment.Left
	local v_u_168 = v_u_22.Create("ImageLabel")({
		["Name"] = "DropDownImage",
		["Image"] = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Size"] = UDim2.new(0, 15, 0, 10),
		["Position"] = UDim2.new(1, -12, 0.5, 0),
		["ZIndex"] = 2,
		["Parent"] = v_u_147.DropDownFrame
	})
	v_u_147.DropDownImage = v_u_168
	local function v_u_173(p169)
		-- upvalues: (copy) v_u_147, (copy) v_u_167, (copy) v_u_148
		local v170 = false
		for v171, v172 in pairs(v_u_147.Selections) do
			if v171 == p169 then
				v_u_167.Text = v172.Text
				v_u_147.CurrentIndex = v171
				v170 = true
			end
		end
		if v170 then
			v_u_148:Fire(p169)
		end
	end
	local function v_u_178(p174)
		-- upvalues: (copy) v_u_147, (copy) v_u_167, (copy) v_u_148
		local v175 = false
		for v176, v177 in pairs(v_u_147.Selections) do
			if v177.Text == p174 then
				v_u_167.Text = v177.Text
				v_u_147.CurrentIndex = v176
				v175 = true
			end
		end
		if v175 then
			v_u_148:Fire(v_u_147.CurrentIndex)
		end
		return v175
	end
	local _ = false
	v_u_147.IndexChanged = v_u_148.Event
	function v_u_147.SetSelectionIndex(_, p179)
		-- upvalues: (copy) v_u_173
		v_u_173(p179)
	end
	function v_u_147.SetSelectionByValue(_, p180)
		-- upvalues: (copy) v_u_178
		return v_u_178(p180)
	end
	function v_u_147.ResetSelectionIndex(_)
		-- upvalues: (copy) v_u_147, (copy) v_u_167, (copy) v_u_163
		v_u_147.CurrentIndex = nil
		v_u_167.Text = "Choose One"
		v_u_163()
	end
	function v_u_147.GetSelectedIndex(_)
		-- upvalues: (copy) v_u_147
		return v_u_147.CurrentIndex
	end
	function v_u_147.SetZIndex(_, p181)
		-- upvalues: (copy) v_u_147, (copy) v_u_168, (copy) v_u_167
		v_u_147.DropDownFrame.ZIndex = p181
		v_u_168.ZIndex = p181
		v_u_167.ZIndex = p181
	end
	function v_u_147.SetInteractable(_, p182)
		-- upvalues: (ref) v_u_149, (copy) v_u_147, (copy) v_u_163, (ref) v_u_12, (ref) v_u_151, (ref) v_u_159
		v_u_149 = p182
		v_u_147.DropDownFrame.Selectable = v_u_149
		if v_u_149 then
			v_u_147.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
			v_u_147.DropDownFrame.ImageTransparency = 0
			v_u_147.DropDownImage.ImageTransparency = 0
			if not v_u_12.VREnabled then
				v_u_147:SetZIndex(2)
			end
		else
			v_u_163()
			if v_u_12.VREnabled then
				v_u_147.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
				v_u_147.DropDownFrame.ImageTransparency = 0.5
				v_u_147.DropDownImage.ImageTransparency = 0.5
			else
				v_u_147.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				v_u_147.DropDownFrame.ImageTransparency = 0
				v_u_147.DropDownImage.ImageTransparency = 0
			end
			if not v_u_12.VREnabled then
				v_u_147:SetZIndex(1)
			end
		end
		local v183 = v_u_151
		if p182 then
			p182 = not v_u_159
		end
		v183.Value = p182
	end
	function v_u_147.UpdateDropDownList(_, p184)
		-- upvalues: (ref) v_u_152, (copy) v_u_147, (ref) v_u_12, (ref) v_u_22, (copy) v_u_144, (copy) v_u_143, (copy) v_u_157, (copy) p_u_141, (copy) v_u_167, (copy) v_u_145, (copy) v_u_163, (copy) v_u_148, (ref) v_u_7, (ref) v_u_8, (copy) v_u_150, (copy) v_u_153, (copy) v_u_156
		v_u_152 = p184
		if v_u_147.Selections then
			for v185 = 1, #v_u_147.Selections do
				v_u_147.Selections[v185]:Destroy()
			end
		end
		v_u_147.Selections = {}
		v_u_147.SelectionInfo = {}
		local v186 = v_u_12.VREnabled
		local v187 = v186 and Enum.Font.SourceSansBold or Enum.Font.SourceSans
		local v188 = v186 and 70 or 50
		local v189 = v188 + 1
		local v190 = v186 and 36 or 24
		local v_u_191 = v186 and 600 or 400
		for v_u_192, v193 in pairs(p184) do
			local v194 = v_u_22.Create("Frame")({
				["BackgroundTransparency"] = 0.7,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
			local v_u_195 = v_u_22.Create("TextButton")({
				["Name"] = "Selection" .. tostring(v_u_192),
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["AutoButtonColor"] = false,
				["Size"] = UDim2.new(1, -28, 0, v188),
				["Position"] = UDim2.new(0, 14, 0, (v_u_192 - 1) * v189),
				["TextColor3"] = v_u_12.VREnabled and v_u_144 or v_u_143,
				["Font"] = v187,
				["TextSize"] = v190,
				["Text"] = v193,
				["ZIndex"] = 10,
				["SelectionImageObject"] = v194,
				["Parent"] = v_u_157
			})
			if v_u_192 == p_u_141 then
				v_u_147.CurrentIndex = v_u_192
				v_u_167.Text = v193
				v_u_195.TextColor3 = v_u_145
			elseif not p_u_141 and v_u_192 == 1 then
				v_u_195.TextColor3 = v_u_145
			end
			local function v196()
				-- upvalues: (ref) v_u_167, (copy) v_u_195, (ref) v_u_163, (ref) v_u_147, (copy) v_u_192, (ref) v_u_148
				v_u_167.Text = v_u_195.Text
				v_u_163()
				v_u_147.CurrentIndex = v_u_192
				v_u_148:Fire(v_u_192)
			end
			v_u_195.MouseButton1Click:Connect(v196)
			v_u_195.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_195
				local v197
				if v_u_12.VREnabled then
					v197 = false
				else
					v197 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
				end
				if v197 then
					v_u_8.SelectedCoreObject = v_u_195
				end
			end)
			v_u_147.Selections[v_u_192] = v_u_195
			v_u_147.SelectionInfo[v_u_195] = {
				["Clicked"] = v196
			}
		end
		v_u_8:RemoveSelectionGroup(v_u_150)
		local v198 = v_u_8
		local v199 = v_u_150
		local v200 = v_u_147.Selections
		v198:AddSelectionTuple(v199, unpack(v200))
		v_u_157.CanvasSize = UDim2.new(1, -20, 0, #p184 * v189)
		local function v_u_201()
			-- upvalues: (ref) v_u_157, (ref) v_u_153, (ref) v_u_156, (copy) v_u_191
			if v_u_157.CanvasSize.Y.Offset < v_u_153.AbsoluteSize.Y - 10 then
				v_u_156.Size = UDim2.new(0, v_u_191, 0, v_u_157.CanvasSize.Y.Offset + 25)
			else
				v_u_156.Size = UDim2.new(0, v_u_191, 0.9, 0)
			end
		end
		v_u_153.Changed:Connect(function(p202)
			-- upvalues: (copy) v_u_201
			if p202 == "AbsoluteSize" then
				v_u_201()
			end
		end)
		v_u_201()
	end
	v_u_147:UpdateDropDownList(p140)
	v_u_153.MouseButton1Click:Connect(v_u_163)
	p_u_142.PoppedMenu:Connect(function(p203)
		-- upvalues: (copy) v_u_153, (copy) v_u_163
		if p203 == v_u_153 then
			v_u_163()
		end
	end)
	return v_u_147
end
local function v_u_287(p205, p_u_206)
	-- upvalues: (copy) v_u_22, (copy) v_u_24, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_78, (copy) v_u_12, (copy) v_u_8, (copy) v_u_42, (copy) v_u_5, (copy) v_u_23, (copy) v_u_71
	local v_u_207 = 0
	local v_u_208 = {
		["HubRef"] = nil
	}
	if type(p205) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		return v_u_208
	end
	local v_u_209 = Instance.new("BindableEvent")
	v_u_209.Name = "IndexChanged"
	local v_u_210 = true
	v_u_208.CurrentIndex = 0
	v_u_208.SelectorFrame = v_u_22.Create("ImageButton")({
		["Name"] = "Selector",
		["Image"] = "",
		["AutoButtonColor"] = false,
		["NextSelectionLeft"] = v_u_208.SelectorFrame,
		["NextSelectionRight"] = v_u_208.SelectorFrame,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0.6, 0, 0, 50),
		["Position"] = UDim2.new(1, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["ZIndex"] = 2,
		["SelectionImageObject"] = v_u_24
	})
	local v_u_211 = v_u_22.Create("ImageButton")({
		["Name"] = "LeftButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 50, 0, 50),
		["Image"] = "",
		["ZIndex"] = 3,
		["Selectable"] = false,
		["SelectionImageObject"] = v_u_24,
		["Parent"] = v_u_208.SelectorFrame
	})
	local v_u_212 = v_u_22.Create("ImageButton")({
		["Name"] = "RightButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 50, 0, 50),
		["Image"] = "",
		["ZIndex"] = 3,
		["Selectable"] = false,
		["SelectionImageObject"] = v_u_24,
		["Parent"] = v_u_208.SelectorFrame
	})
	local v_u_213 = v_u_22.Create("ImageLabel")({
		["Name"] = "LeftButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 18, 0, 30),
		["Image"] = "rbxasset://textures/ui/Settings/Slider/Left.png",
		["ImageColor3"] = v_u_3,
		["ZIndex"] = 4,
		["Parent"] = v_u_211
	})
	local v_u_214 = v_u_22.Create("ImageLabel")({
		["Name"] = "RightButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 18, 0, 30),
		["Image"] = "rbxasset://textures/ui/Settings/Slider/Right.png",
		["ImageColor3"] = v_u_3,
		["ZIndex"] = 4,
		["Parent"] = v_u_212
	})
	if not v_u_7.TouchEnabled then
		local function v216(p215)
			-- upvalues: (ref) v_u_3
			p215.ImageColor3 = v_u_3
		end
		local function v218(p217)
			-- upvalues: (ref) v_u_4
			p217.ImageColor3 = v_u_4
		end
		v_u_78(v_u_211, v_u_213, v216, v218)
		v_u_78(v_u_212, v_u_214, v216, v218)
	end
	v_u_208.Selections = {}
	local v_u_219 = {}
	local v_u_220 = {}
	local v_u_221 = v_u_22.Create("ImageButton")({
		["Name"] = "AutoSelectButton",
		["BackgroundTransparency"] = 1,
		["Image"] = "",
		["Position"] = UDim2.new(0, v_u_211.Size.X.Offset, 0, 0),
		["Size"] = UDim2.new(1, v_u_211.Size.X.Offset * -2, 1, 0),
		["Parent"] = v_u_208.SelectorFrame,
		["ZIndex"] = 2,
		["SelectionImageObject"] = v_u_24
	})
	v_u_221.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_210, (copy) v_u_208, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8
		if v_u_210 then
			if #v_u_208.Selections > 1 then
				local v222 = v_u_208.CurrentIndex + 1
				v_u_208:SetSelectionIndex(#v_u_208.Selections < v222 and 1 or v222)
				local v223
				if v_u_12.VREnabled then
					v223 = false
				else
					v223 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
				end
				if v223 then
					v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
				end
			end
		else
			return
		end
	end)
	v_u_220[v_u_221] = true
	local function v_u_231(p224, p225)
		-- upvalues: (copy) v_u_208, (copy) v_u_211, (ref) v_u_219, (ref) v_u_42, (copy) v_u_209
		for v226, v227 in pairs(v_u_208.Selections) do
			local v228 = v226 == p224
			local v229 = UDim2.new(0, v_u_211.Size.X.Offset, 0, 0)
			local v230 = UDim2.new(0, v_u_211.Size.X.Offset * p225 * 3, 0, 0)
			if v_u_219[v227] then
				v230 = UDim2.new(0, v_u_211.Size.X.Offset * -p225 * 3, 0, 0)
			end
			if v230.X.Offset < 0 then
				v230 = UDim2.new(0, v230.X.Offset + v227.AbsoluteSize.X / 4, 0, 0)
			end
			if v228 then
				v_u_219[v227] = true
				v227.Position = v230
				v227.Visible = true
				PropertyTweener(v227, "TextTransparency", 1, 0, 0.165, v_u_42)
				if v227:IsDescendantOf(game) then
					v227:TweenPosition(v229, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				else
					v227.Position = v229
				end
				v_u_208.CurrentIndex = v226
				v_u_209:Fire(p224)
			elseif v_u_219[v227] then
				v_u_219[v227] = false
				PropertyTweener(v227, "TextTransparency", 0, 1, 0.165, v_u_42)
				if v227:IsDescendantOf(game) then
					v227:TweenPosition(v230, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					v227.Position = UDim2.new(v230)
				end
			end
		end
	end
	local function v_u_237(p232, p233)
		-- upvalues: (ref) v_u_210, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_208, (copy) v_u_231
		if v_u_210 then
			if p232 == nil or (p232.UserInputType == Enum.UserInputType.MouseButton1 or (p232.UserInputType == Enum.UserInputType.Gamepad1 or (p232.UserInputType == Enum.UserInputType.Gamepad2 or (p232.UserInputType == Enum.UserInputType.Gamepad3 or (p232.UserInputType == Enum.UserInputType.Gamepad4 or p232.UserInputType == Enum.UserInputType.Keyboard))))) then
				local v234
				if v_u_12.VREnabled then
					v234 = false
				else
					v234 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
				end
				if v234 then
					v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
				end
				local v235 = p233 + v_u_208.CurrentIndex
				local v236 = v_u_208.CurrentIndex < v235 and 1 or -1
				v_u_231(#v_u_208.Selections < v235 and 1 or (v235 < 1 and #v_u_208.Selections or v235), v236)
			end
		else
			return
		end
	end
	local v_u_238 = nil
	v_u_208.IndexChanged = v_u_209.Event
	function v_u_208.SetSelectionIndex(_, p239)
		-- upvalues: (copy) v_u_231
		v_u_231(p239, 1)
	end
	function v_u_208.GetSelectedIndex(_)
		-- upvalues: (copy) v_u_208
		return v_u_208.CurrentIndex
	end
	function v_u_208.SetZIndex(_, p240)
		-- upvalues: (copy) v_u_211, (copy) v_u_212, (copy) v_u_213, (copy) v_u_214, (copy) v_u_208
		v_u_211.ZIndex = p240
		v_u_212.ZIndex = p240
		v_u_213.ZIndex = p240
		v_u_214.ZIndex = p240
		for v241 = 1, #v_u_208.Selections do
			v_u_208.Selections[v241].ZIndex = p240
		end
	end
	function v_u_208.SetInteractable(_, p242)
		-- upvalues: (ref) v_u_210, (copy) v_u_208, (copy) v_u_211, (copy) v_u_212, (copy) v_u_213, (ref) v_u_5, (copy) v_u_214, (ref) v_u_3
		v_u_210 = p242
		v_u_208.SelectorFrame.Selectable = v_u_210
		v_u_211.Active = v_u_210
		v_u_212.Active = v_u_210
		if v_u_210 then
			for _, v243 in pairs(v_u_208.Selections) do
				v243.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			v_u_213.ImageColor3 = v_u_3
			v_u_214.ImageColor3 = v_u_3
		else
			for _, v244 in pairs(v_u_208.Selections) do
				v244.TextColor3 = Color3.fromRGB(49, 49, 49)
			end
			v_u_213.ImageColor3 = v_u_5
			v_u_214.ImageColor3 = v_u_5
		end
	end
	function v_u_208.UpdateOptions(_, p245)
		-- upvalues: (copy) v_u_208, (ref) v_u_219, (ref) v_u_22, (copy) v_u_211, (copy) p_u_206, (copy) v_u_212
		for _, v246 in pairs(v_u_208.Selections) do
			v246:Destroy()
		end
		v_u_219 = {}
		v_u_208.Selections = {}
		for v247, v248 in pairs(p245) do
			local v249 = v_u_22.Create("TextLabel")({
				["Name"] = "Selection" .. tostring(v247),
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, v_u_211.Size.X.Offset * -2, 1, 0),
				["Position"] = UDim2.new(1, 0, 0, 0),
				["TextColor3"] = Color3.fromRGB(255, 255, 255),
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["TextTransparency"] = 0.5,
				["Font"] = Enum.Font.SourceSans,
				["TextSize"] = 24,
				["Text"] = v248,
				["ZIndex"] = 2,
				["Visible"] = false,
				["Parent"] = v_u_208.SelectorFrame
			})
			if false then
				v249.TextSize = 36
			end
			if v247 == p_u_206 then
				v_u_208.CurrentIndex = v247
				v249.Position = UDim2.new(0, v_u_211.Size.X.Offset, 0, 0)
				v249.Visible = true
				v_u_219[v249] = true
			else
				v_u_219[v249] = false
			end
			v_u_208.Selections[v247] = v249
		end
		local v250 = #v_u_208.Selections > 1
		v_u_211.Visible = v250
		v_u_212.Visible = v250
	end
	local function v253(p251)
		-- upvalues: (ref) v_u_12, (copy) v_u_211, (copy) v_u_212, (copy) v_u_221
		if p251 == "VREnabled" then
			local v252 = v_u_12.VREnabled
			v_u_211.Selectable = v252
			v_u_212.Selectable = v252
			v_u_221.Selectable = v252
		end
	end
	v_u_12.Changed:Connect(v253)
	local v254 = v_u_12.VREnabled
	v_u_211.Selectable = v254
	v_u_212.Selectable = v254
	v_u_221.Selectable = v254
	v_u_211.InputBegan:Connect(function(p255)
		-- upvalues: (ref) v_u_210, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_208, (copy) v_u_231
		if p255.UserInputType == Enum.UserInputType.Touch then
			if not v_u_210 then
				return
			end
			local v256
			if v_u_12.VREnabled then
				v256 = false
			else
				v256 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v256 then
				v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
			end
			local v257 = -1 + v_u_208.CurrentIndex
			local v258 = v_u_208.CurrentIndex < v257 and 1 or -1
			v_u_231(#v_u_208.Selections < v257 and 1 or (v257 < 1 and #v_u_208.Selections or v257), v258)
		end
	end)
	v_u_211.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_210, (ref) v_u_12, (ref) v_u_8, (copy) v_u_208, (copy) v_u_231
		if not v_u_7.TouchEnabled then
			if not v_u_210 then
				return
			end
			local v259
			if v_u_12.VREnabled then
				v259 = false
			else
				v259 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v259 then
				v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
			end
			local v260 = -1 + v_u_208.CurrentIndex
			local v261 = v_u_208.CurrentIndex < v260 and 1 or -1
			v_u_231(#v_u_208.Selections < v260 and 1 or (v260 < 1 and #v_u_208.Selections or v260), v261)
		end
	end)
	v_u_212.InputBegan:Connect(function(p262)
		-- upvalues: (ref) v_u_210, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_208, (copy) v_u_231
		if p262.UserInputType == Enum.UserInputType.Touch then
			if not v_u_210 then
				return
			end
			local v263
			if v_u_12.VREnabled then
				v263 = false
			else
				v263 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v263 then
				v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
			end
			local v264 = 1 + v_u_208.CurrentIndex
			local v265 = v_u_208.CurrentIndex < v264 and 1 or -1
			v_u_231(#v_u_208.Selections < v264 and 1 or (v264 < 1 and #v_u_208.Selections or v264), v265)
		end
	end)
	v_u_212.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_210, (ref) v_u_12, (ref) v_u_8, (copy) v_u_208, (copy) v_u_231
		if not v_u_7.TouchEnabled then
			if not v_u_210 then
				return
			end
			local v266
			if v_u_12.VREnabled then
				v266 = false
			else
				v266 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v266 then
				v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
			end
			local v267 = 1 + v_u_208.CurrentIndex
			local v268 = v_u_208.CurrentIndex < v267 and 1 or -1
			v_u_231(#v_u_208.Selections < v267 and 1 or (v267 < 1 and #v_u_208.Selections or v267), v268)
		end
	end)
	local v_u_269 = true
	v_u_208:UpdateOptions(p205)
	v_u_7.InputBegan:Connect(function(p270)
		-- upvalues: (ref) v_u_210, (ref) v_u_269, (ref) v_u_8, (copy) v_u_208, (ref) v_u_12, (ref) v_u_7, (copy) v_u_231
		if v_u_210 then
			if v_u_269 then
				if p270.UserInputType == Enum.UserInputType.Gamepad1 or p270.UserInputType == Enum.UserInputType.Keyboard then
					if v_u_8.SelectedCoreObject == v_u_208.SelectorFrame then
						if p270.KeyCode == Enum.KeyCode.DPadLeft or (p270.KeyCode == Enum.KeyCode.Left or p270.KeyCode == Enum.KeyCode.A) then
							if v_u_210 then
								if p270 == nil or (p270.UserInputType == Enum.UserInputType.MouseButton1 or (p270.UserInputType == Enum.UserInputType.Gamepad1 or (p270.UserInputType == Enum.UserInputType.Gamepad2 or (p270.UserInputType == Enum.UserInputType.Gamepad3 or (p270.UserInputType == Enum.UserInputType.Gamepad4 or p270.UserInputType == Enum.UserInputType.Keyboard))))) then
									local v271
									if v_u_12.VREnabled then
										v271 = false
									else
										v271 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
									end
									if v271 then
										v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
									end
									local v272 = -1 + v_u_208.CurrentIndex
									local v273 = v_u_208.CurrentIndex < v272 and 1 or -1
									v_u_231(#v_u_208.Selections < v272 and 1 or (v272 < 1 and #v_u_208.Selections or v272), v273)
								end
							else
								return
							end
						else
							if p270.KeyCode == Enum.KeyCode.DPadRight or (p270.KeyCode == Enum.KeyCode.Right or p270.KeyCode == Enum.KeyCode.D) then
								if not v_u_210 then
									return
								end
								if p270 ~= nil and (p270.UserInputType ~= Enum.UserInputType.MouseButton1 and (p270.UserInputType ~= Enum.UserInputType.Gamepad1 and (p270.UserInputType ~= Enum.UserInputType.Gamepad2 and (p270.UserInputType ~= Enum.UserInputType.Gamepad3 and (p270.UserInputType ~= Enum.UserInputType.Gamepad4 and p270.UserInputType ~= Enum.UserInputType.Keyboard))))) then
									return
								end
								local v274
								if v_u_12.VREnabled then
									v274 = false
								else
									v274 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
								end
								if v274 then
									v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
								end
								local v275 = 1 + v_u_208.CurrentIndex
								local v276 = v_u_208.CurrentIndex < v275 and 1 or -1
								v_u_231(#v_u_208.Selections < v275 and 1 or (v275 < 1 and #v_u_208.Selections or v275), v276)
							end
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end)
	v_u_7.InputChanged:Connect(function(p277)
		-- upvalues: (ref) v_u_210, (ref) v_u_269, (ref) v_u_207, (ref) v_u_8, (copy) v_u_208, (copy) v_u_237
		if v_u_210 then
			if v_u_269 then
				if p277.UserInputType == Enum.UserInputType.Gamepad1 then
					local v278 = v_u_8.SelectedCoreObject
					if v278 and v278:IsDescendantOf(v_u_208.SelectorFrame.Parent) then
						if p277.KeyCode == Enum.KeyCode.Thumbstick1 then
							if p277.Position.X > 0.8 and (p277.Delta.X > 0 and v_u_207 ~= 1) then
								v_u_207 = 1
								v_u_237(p277, v_u_207)
								return
							elseif p277.Position.X < -0.8 and (p277.Delta.X < 0 and v_u_207 ~= -1) then
								v_u_207 = -1
								v_u_237(p277, v_u_207)
							else
								local v279 = p277.Position.X
								if math.abs(v279) < 0.8 then
									v_u_207 = 0
								end
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				v_u_207 = 0
				return
			end
		else
			return
		end
	end)
	v_u_208.SelectorFrame.AncestryChanged:Connect(function(_, p280)
		-- upvalues: (ref) v_u_269, (ref) v_u_238, (ref) v_u_8, (copy) v_u_208, (copy) v_u_220, (ref) v_u_12
		v_u_269 = p280
		if v_u_269 then
			v_u_238 = v_u_8:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: (ref) v_u_208, (ref) v_u_8, (ref) v_u_220, (ref) v_u_12
				if #v_u_208.Selections <= 0 then
					return
				elseif v_u_8.SelectedCoreObject == v_u_208.SelectorFrame then
					v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0
					return
				elseif v_u_8.SelectedCoreObject == nil or not v_u_220[v_u_8.SelectedCoreObject] then
					v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0.5
					return
				elseif v_u_12.VREnabled then
					v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0
				else
					v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
				end
			end)
		elseif v_u_238 then
			v_u_238:Disconnect()
			return
		end
	end)
	v_u_23[v_u_208.SelectorFrame] = function(_, p281)
		-- upvalues: (copy) v_u_208
		local v282 = p281 and 16 or 24
		for _, v283 in pairs(v_u_208.Selections) do
			v283.TextSize = v282
		end
	end
	v_u_71()
	local v284 = v_u_71()
	local v285 = v284.Y > v284.X and 16 or 24
	for _, v286 in pairs(v_u_208.Selections) do
		v286.TextSize = v285
	end
	v_u_238 = v_u_8:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: (copy) v_u_208, (ref) v_u_8, (copy) v_u_220, (ref) v_u_12
		if #v_u_208.Selections <= 0 then
			return
		elseif v_u_8.SelectedCoreObject == v_u_208.SelectorFrame then
			v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0
			return
		elseif v_u_8.SelectedCoreObject == nil or not v_u_220[v_u_8.SelectedCoreObject] then
			v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0.5
			return
		elseif v_u_12.VREnabled then
			v_u_208.Selections[v_u_208.CurrentIndex].TextTransparency = 0
		else
			v_u_8.SelectedCoreObject = v_u_208.SelectorFrame
		end
	end)
	return v_u_208
end
local function v_u_307(p288, p289, p_u_290, p_u_291, p292)
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_22, (copy) v_u_6, (copy) v_u_11, (copy) v_u_8, (copy) v_u_118, (copy) v_u_7
	local v_u_293 = v_u_10.RobloxGui
	if not v_u_293:FindFirstChild("AlertViewFullScreen") then
		local v_u_294 = nil
		local function v297(p295)
			-- upvalues: (ref) v_u_12, (ref) v_u_10, (ref) v_u_293, (ref) v_u_294
			if p295 == "VREnabled" then
				local v296 = nil
				if v_u_12.VREnabled then
					v296 = require(v_u_10.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu")
					v_u_293 = v296:GetGUI()
				else
					v_u_293 = v_u_10.RobloxGui
				end
				if v_u_294 and v_u_294.Parent ~= nil then
					v_u_294.Parent = v_u_293
					if v_u_12.VREnabled then
						v296:SetSubpanelDepth(v_u_294, 0.5)
					end
				end
			end
		end
		local v_u_298 = v_u_12.Changed:Connect(v297)
		Color3.fromRGB(59, 166, 241)
		Color3.fromRGB(255, 255, 255)
		v_u_294 = v_u_22.Create("ImageLabel")({
			["Name"] = "AlertViewBacking",
			["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(8, 6, 46, 44),
			["BackgroundTransparency"] = 1,
			["ImageTransparency"] = 1,
			["Size"] = UDim2.new(0, 400, 0, 350),
			["Position"] = UDim2.new(0.5, -200, 0.5, -175),
			["ZIndex"] = 9,
			["Parent"] = v_u_293
		})
		v297("VREnabled")
		if p292 or v_u_12.VREnabled then
			v_u_294.ImageTransparency = 0
		else
			v_u_294.Size = UDim2.new(0.8, 0, 0, 350)
			v_u_294.Position = UDim2.new(0.1, 0, 0.1, 0)
		end
		if v_u_10.RobloxGui.AbsoluteSize.Y <= v_u_294.Size.Y.Offset then
			v_u_294.Size = UDim2.new(v_u_294.Size.X.Scale, v_u_294.Size.X.Offset, v_u_294.Size.Y.Scale, v_u_10.RobloxGui.AbsoluteSize.Y)
			v_u_294.Position = UDim2.new(v_u_294.Position.X.Scale, -v_u_294.Size.X.Offset / 2, 0.5, -v_u_294.Size.Y.Offset / 2)
		end
		v_u_22.Create("TextLabel")({
			["Name"] = "AlertViewText",
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0.95, 0, 0.6, 0),
			["Position"] = UDim2.new(0.025, 0, 0.05, 0),
			["Font"] = Enum.Font.SourceSansBold,
			["TextSize"] = 36,
			["Text"] = p288,
			["TextWrapped"] = true,
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["ZIndex"] = 10,
			["Parent"] = v_u_294
		})
		v_u_22.Create("ImageLabel")({
			["Image"] = "",
			["BackgroundTransparency"] = 1
		})
		local v_u_299 = v_u_6:GenerateGUID(false)
		local function v301(_, p300)
			-- upvalues: (ref) v_u_12, (ref) v_u_294, (ref) v_u_10, (copy) p_u_291, (ref) v_u_11, (copy) v_u_299, (ref) v_u_8, (copy) p_u_290, (copy) v_u_298
			if v_u_12.VREnabled and (p300 == Enum.UserInputState.Begin or p300 == Enum.UserInputState.Cancel) then
				return
			elseif v_u_294 then
				if v_u_12.VREnabled then
					require(v_u_10.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v_u_294, 0)
				end
				v_u_294:Destroy()
				v_u_294 = nil
				if p_u_291 then
					p_u_291()
				end
				v_u_11:UnbindAction(v_u_299)
				v_u_8.SelectedCoreObject = nil
				if p_u_290 then
					p_u_290:ShowBar()
				end
				if v_u_298 then
					v_u_298:Disconnect()
				end
			end
		end
		local v302 = UDim2.new(1, -20, 0, 60)
		local v303 = UDim2.new(0, 10, 0.65, 0)
		if not p292 then
			v302 = UDim2.new(0, 200, 0, 50)
			v303 = UDim2.new(0.5, -100, 0.65, 0)
		end
		local v304, v305 = v_u_118("AlertViewButton", p289, v302, v301)
		v304.Position = v303
		v304.NextSelectionLeft = v304
		v304.NextSelectionRight = v304
		v304.NextSelectionUp = v304
		v304.NextSelectionDown = v304
		v304.ZIndex = 9
		v305.ZIndex = v304.ZIndex
		v304.Parent = v_u_294
		local v306
		if v_u_12.VREnabled then
			v306 = false
		else
			v306 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
		end
		if v306 then
			v_u_8.SelectedCoreObject = v304
		end
		v_u_8.SelectedCoreObject = v304
		v_u_11:BindActionAtPriority(v_u_299, v301, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
		if p_u_290 and not v_u_12.VREnabled then
			p_u_290:HideBar()
			p_u_290.Pages.CurrentPage:Hide(1, 1)
		end
	end
end
local function v_u_400(p308, p309, p_u_310)
	-- upvalues: (copy) v_u_6, (copy) v_u_22, (copy) v_u_24, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_4, (copy) v_u_78, (copy) v_u_71, (copy) v_u_1, (copy) v_u_2, (copy) v_u_12, (copy) v_u_8, (copy) v_u_9
	local v_u_311 = {}
	local v_u_312 = tonumber(p308)
	local v_u_313 = p309
	local v_u_314 = 0
	local v_u_315 = nil
	local v_u_316 = true
	local v_u_317 = v_u_6:GenerateGUID(false)
	if v_u_312 > 0 then
		local v_u_318 = Instance.new("BindableEvent")
		v_u_318.Name = "ValueChanged"
		v_u_311.SliderFrame = v_u_22.Create("ImageButton")({
			["Name"] = "Slider",
			["Image"] = "",
			["AutoButtonColor"] = false,
			["NextSelectionLeft"] = v_u_311.SliderFrame,
			["NextSelectionRight"] = v_u_311.SliderFrame,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0.6, 0, 0, 50),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["SelectionImageObject"] = v_u_24,
			["ZIndex"] = 2
		})
		v_u_311.StepsContainer = v_u_22.Create("Frame")({
			["Name"] = "StepsContainer",
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(1, -100, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["BackgroundTransparency"] = 1,
			["Parent"] = v_u_311.SliderFrame
		})
		local v_u_319 = v_u_22.Create("ImageButton")({
			["Name"] = "LeftButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 50, 0, 50),
			["Image"] = "",
			["ZIndex"] = 3,
			["Selectable"] = false,
			["SelectionImageObject"] = v_u_24,
			["Active"] = true,
			["Parent"] = v_u_311.SliderFrame
		})
		local v_u_320 = v_u_22.Create("ImageButton")({
			["Name"] = "RightButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 50, 0, 50),
			["Image"] = "",
			["ZIndex"] = 3,
			["Selectable"] = false,
			["SelectionImageObject"] = v_u_24,
			["Active"] = true,
			["Parent"] = v_u_311.SliderFrame
		})
		local v_u_321 = v_u_22.Create("ImageLabel")({
			["Name"] = "LeftButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 30, 0, 30),
			["Image"] = "rbxasset://textures/ui/Settings/Slider/Less.png",
			["ZIndex"] = 4,
			["Parent"] = v_u_319,
			["ImageColor3"] = v_u_7.TouchEnabled and v_u_4 or v_u_3
		})
		local v_u_322 = v_u_22.Create("ImageLabel")({
			["Name"] = "RightButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 30, 0, 30),
			["Image"] = "rbxasset://textures/ui/Settings/Slider/More.png",
			["ZIndex"] = 4,
			["Parent"] = v_u_320,
			["ImageColor3"] = v_u_7.TouchEnabled and v_u_4 or v_u_3
		})
		if not v_u_7.TouchEnabled then
			local function v324(p323)
				-- upvalues: (ref) v_u_3
				p323.ImageColor3 = v_u_3
			end
			local function v326(p325)
				-- upvalues: (ref) v_u_4
				p325.ImageColor3 = v_u_4
			end
			v_u_78(v_u_319, v_u_321, v324, v326)
			v_u_78(v_u_320, v_u_322, v324, v326)
		end
		v_u_311.Steps = {}
		local v327 = v_u_71()
		local v328 = v_u_7.TouchEnabled
		if v328 then
			v328 = v327.Y < 500 and true or v327.X < 700
		end
		local v329 = 1 / v_u_312
		for v330 = 1, v_u_312 do
			local v331 = v_u_22.Create("ImageButton")({
				["Name"] = "Step" .. tostring(v330),
				["BackgroundColor3"] = v_u_1,
				["BackgroundTransparency"] = 0.36,
				["BorderSizePixel"] = 0,
				["AutoButtonColor"] = false,
				["Active"] = false,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new((v330 - 1) * v329, 2, 0.5, 0),
				["Size"] = UDim2.new(v329, -4, 0.48, 0),
				["Image"] = "",
				["ZIndex"] = 3,
				["Selectable"] = false,
				["ImageTransparency"] = 0.36,
				["Parent"] = v_u_311.StepsContainer,
				["SelectionImageObject"] = v_u_24
			})
			if v_u_313 < v330 then
				v331.BackgroundColor3 = v_u_2
			end
			if v330 == 1 or v330 == v_u_312 then
				v331.BackgroundTransparency = 1
				v331.ScaleType = Enum.ScaleType.Slice
				v331.SliceCenter = Rect.new(3, 3, 32, 21)
				if v330 <= v_u_313 then
					if v330 == 1 then
						v331.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
					else
						v331.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
					end
				elseif v330 == 1 then
					v331.Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png"
				else
					v331.Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png"
				end
			end
			v_u_311.Steps[#v_u_311.Steps + 1] = v331
		end
		local function v_u_333()
			-- upvalues: (copy) v_u_312, (copy) v_u_311, (ref) v_u_2
			for v332 = 1, v_u_312 do
				v_u_311.Steps[v332].BackgroundColor3 = v_u_2
				if v332 == 1 then
					v_u_311.Steps[v332].Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png"
				elseif v332 == v_u_312 then
					v_u_311.Steps[v332].Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png"
				end
			end
		end
		local function v_u_335()
			-- upvalues: (copy) v_u_312, (ref) v_u_313, (copy) v_u_311, (ref) v_u_1
			for v334 = 1, v_u_312 do
				if v_u_313 < v334 then
					break
				end
				v_u_311.Steps[v334].BackgroundColor3 = v_u_1
				if v334 == 1 then
					v_u_311.Steps[v334].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
				elseif v334 == v_u_312 then
					v_u_311.Steps[v334].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
				end
			end
		end
		local function v_u_337(p336)
			-- upvalues: (ref) p_u_310, (copy) v_u_319, (copy) v_u_320, (copy) v_u_312, (ref) v_u_313, (copy) v_u_333, (copy) v_u_335, (ref) v_u_315, (copy) v_u_318
			if not p_u_310 then
				p_u_310 = 0
			end
			v_u_319.Visible = true
			v_u_320.Visible = true
			if p336 <= p_u_310 then
				p336 = p_u_310
				v_u_319.Visible = false
			end
			if v_u_312 <= p336 then
				p336 = v_u_312
				v_u_320.Visible = false
			end
			if v_u_313 ~= p336 then
				v_u_313 = p336
				v_u_333()
				v_u_335()
				v_u_315 = tick()
				v_u_318:Fire(v_u_313)
			end
		end
		local function v_u_352(p338, p339, p340)
			-- upvalues: (ref) v_u_316, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_311, (ref) v_u_314, (ref) v_u_313, (copy) v_u_312, (copy) v_u_337
			if v_u_316 then
				if p338 == nil then
					return
				else
					local v341
					if p338 then
						if p338.UserInputType == Enum.UserInputType.MouseButton1 or p338.UserInputType == Enum.UserInputType.Touch then
							v341 = true
						elseif p338.UserInputType == Enum.UserInputType.Gamepad1 then
							v341 = p338.KeyCode == Enum.KeyCode.ButtonA
						else
							v341 = false
						end
					else
						v341 = false
					end
					if v341 then
						local v342
						if v_u_12.VREnabled then
							v342 = false
						else
							v342 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
						end
						if v342 and not v_u_12.VREnabled then
							v_u_8.SelectedCoreObject = v_u_311.SliderFrame
						end
						if v_u_12.VREnabled then
							v_u_314 = 0
						elseif p340 then
							v_u_314 = p339 - v_u_313
						else
							v_u_314 = 0
							local v_u_343 = nil
							local v_u_349 = v_u_7.InputChanged:Connect(function(p344)
								-- upvalues: (ref) v_u_312, (ref) v_u_311, (ref) v_u_337
								if p344.UserInputType == Enum.UserInputType.MouseMovement then
									local v345 = p344.Position.X
									for v346 = 1, v_u_312 do
										local v347 = v_u_311.Steps[v346].AbsolutePosition.X
										local v348 = v_u_311.Steps[v346].AbsoluteSize.X
										if v347 <= v345 and v345 <= v347 + v348 then
											v_u_337(v346)
											return
										end
										if v346 == 1 and v345 < v347 then
											v_u_337(0)
											return
										end
										if v346 == v_u_312 and v347 <= v345 then
											v_u_337(v346)
											return
										end
									end
								end
							end)
							v_u_343 = v_u_7.InputEnded:Connect(function(p350)
								-- upvalues: (ref) v_u_314, (ref) v_u_343, (ref) v_u_349
								local v351
								if p350 then
									if p350.UserInputType == Enum.UserInputType.MouseButton1 or p350.UserInputType == Enum.UserInputType.Touch then
										v351 = true
									elseif p350.UserInputType == Enum.UserInputType.Gamepad1 then
										v351 = p350.KeyCode == Enum.KeyCode.ButtonA
									else
										v351 = false
									end
								else
									v351 = false
								end
								if v351 then
									v_u_314 = 0
									v_u_343:Disconnect()
									v_u_349:Disconnect()
								end
							end)
						end
						v_u_337(p339)
					end
				end
			else
				return
			end
		end
		v_u_311.ValueChanged = v_u_318.Event
		function v_u_311.SetValue(_, p353)
			-- upvalues: (copy) v_u_337
			v_u_337(p353)
		end
		function v_u_311.GetValue(_)
			-- upvalues: (ref) v_u_313
			return v_u_313
		end
		function v_u_311.SetInteractable(_, p354)
			-- upvalues: (ref) v_u_314, (ref) v_u_316, (copy) v_u_311, (copy) v_u_333, (copy) v_u_335
			v_u_314 = 0
			v_u_316 = p354
			v_u_311.SliderFrame.Selectable = p354
			if v_u_316 then
				v_u_335()
			else
				v_u_333()
			end
		end
		function v_u_311.SetZIndex(_, p355)
			-- upvalues: (copy) v_u_319, (copy) v_u_320, (copy) v_u_321, (copy) v_u_322, (copy) v_u_311
			v_u_319.ZIndex = p355
			v_u_320.ZIndex = p355
			v_u_321.ZIndex = p355
			v_u_322.ZIndex = p355
			for v356 = 1, #v_u_311.Steps do
				v_u_311.Steps[v356].ZIndex = p355
			end
		end
		function v_u_311.SetMinStep(_, p357)
			-- upvalues: (copy) v_u_312, (ref) p_u_310, (ref) v_u_313, (copy) v_u_319, (copy) v_u_320
			if p357 >= 0 and p357 <= v_u_312 then
				p_u_310 = p357
			end
			if v_u_313 <= p_u_310 then
				v_u_313 = p_u_310
				v_u_319.Visible = false
			end
			if v_u_312 <= v_u_313 then
				v_u_313 = v_u_312
				v_u_320.Visible = false
			end
		end
		v_u_319.InputBegan:Connect(function(p358)
			-- upvalues: (ref) v_u_313, (ref) v_u_316, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_311, (ref) v_u_314, (copy) v_u_337
			local v359 = v_u_313 - 1
			if v_u_316 then
				if p358 == nil then
					return
				else
					local v360
					if p358 then
						if p358.UserInputType == Enum.UserInputType.MouseButton1 or p358.UserInputType == Enum.UserInputType.Touch then
							v360 = true
						elseif p358.UserInputType == Enum.UserInputType.Gamepad1 then
							v360 = p358.KeyCode == Enum.KeyCode.ButtonA
						else
							v360 = false
						end
					else
						v360 = false
					end
					if v360 then
						local v361
						if v_u_12.VREnabled then
							v361 = false
						else
							v361 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
						end
						if v361 and not v_u_12.VREnabled then
							v_u_8.SelectedCoreObject = v_u_311.SliderFrame
						end
						if v_u_12.VREnabled then
							v_u_314 = 0
						else
							v_u_314 = v359 - v_u_313
						end
						v_u_337(v359)
					end
				end
			else
				return
			end
		end)
		v_u_319.InputEnded:Connect(function(p362)
			-- upvalues: (ref) v_u_316, (ref) v_u_314
			if v_u_316 then
				local v363
				if p362 then
					if p362.UserInputType == Enum.UserInputType.MouseButton1 or p362.UserInputType == Enum.UserInputType.Touch then
						v363 = true
					elseif p362.UserInputType == Enum.UserInputType.Gamepad1 then
						v363 = p362.KeyCode == Enum.KeyCode.ButtonA
					else
						v363 = false
					end
				else
					v363 = false
				end
				if v363 then
					v_u_314 = 0
				end
			else
				return
			end
		end)
		v_u_320.InputBegan:Connect(function(p364)
			-- upvalues: (ref) v_u_313, (ref) v_u_316, (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_311, (ref) v_u_314, (copy) v_u_337
			local v365 = v_u_313 + 1
			if v_u_316 then
				if p364 == nil then
					return
				else
					local v366
					if p364 then
						if p364.UserInputType == Enum.UserInputType.MouseButton1 or p364.UserInputType == Enum.UserInputType.Touch then
							v366 = true
						elseif p364.UserInputType == Enum.UserInputType.Gamepad1 then
							v366 = p364.KeyCode == Enum.KeyCode.ButtonA
						else
							v366 = false
						end
					else
						v366 = false
					end
					if v366 then
						local v367
						if v_u_12.VREnabled then
							v367 = false
						else
							v367 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
						end
						if v367 and not v_u_12.VREnabled then
							v_u_8.SelectedCoreObject = v_u_311.SliderFrame
						end
						if v_u_12.VREnabled then
							v_u_314 = 0
						else
							v_u_314 = v365 - v_u_313
						end
						v_u_337(v365)
					end
				end
			else
				return
			end
		end)
		v_u_320.InputEnded:Connect(function(p368)
			-- upvalues: (ref) v_u_316, (ref) v_u_314
			if v_u_316 then
				local v369
				if p368 then
					if p368.UserInputType == Enum.UserInputType.MouseButton1 or p368.UserInputType == Enum.UserInputType.Touch then
						v369 = true
					elseif p368.UserInputType == Enum.UserInputType.Gamepad1 then
						v369 = p368.KeyCode == Enum.KeyCode.ButtonA
					else
						v369 = false
					end
				else
					v369 = false
				end
				if v369 then
					v_u_314 = 0
				end
			else
				return
			end
		end)
		local function v373(p370)
			-- upvalues: (ref) v_u_12, (copy) v_u_319, (ref) v_u_316, (copy) v_u_320, (copy) v_u_311, (copy) v_u_312
			if p370 == "VREnabled" then
				if v_u_12.VREnabled then
					v_u_319.Selectable = v_u_316
					v_u_320.Selectable = v_u_316
					v_u_311.SliderFrame.Selectable = v_u_316
					for v371 = 1, v_u_312 do
						v_u_311.Steps[v371].Selectable = v_u_316
						v_u_311.Steps[v371].Active = v_u_316
					end
				else
					v_u_319.Selectable = false
					v_u_320.Selectable = false
					v_u_311.SliderFrame.Selectable = v_u_316
					for v372 = 1, v_u_312 do
						v_u_311.Steps[v372].Selectable = false
						v_u_311.Steps[v372].Active = false
					end
				end
			else
				return
			end
		end
		v_u_12.Changed:Connect(v373)
		v373("VREnabled")
		local function v_u_376(p374)
			-- upvalues: (copy) v_u_312, (copy) v_u_311
			for v375 = 1, v_u_312 do
				if v375 == 1 or v375 == v_u_312 then
					v_u_311.Steps[v375].ImageTransparency = p374
				else
					v_u_311.Steps[v375].BackgroundTransparency = p374
				end
			end
		end
		for v_u_377 = 1, v_u_312 do
			v_u_311.Steps[v_u_377].InputBegan:Connect(function(p378)
				-- upvalues: (copy) v_u_352, (copy) v_u_377
				v_u_352(p378, v_u_377)
			end)
			v_u_311.Steps[v_u_377].InputEnded:Connect(function(p379)
				-- upvalues: (ref) v_u_316, (ref) v_u_314
				if v_u_316 then
					local v380
					if p379 then
						if p379.UserInputType == Enum.UserInputType.MouseButton1 or p379.UserInputType == Enum.UserInputType.Touch then
							v380 = true
						elseif p379.UserInputType == Enum.UserInputType.Gamepad1 then
							v380 = p379.KeyCode == Enum.KeyCode.ButtonA
						else
							v380 = false
						end
					else
						v380 = false
					end
					if v380 then
						v_u_314 = 0
					end
				else
					return
				end
			end)
		end
		v_u_311.SliderFrame.InputBegan:Connect(function(p381)
			-- upvalues: (ref) v_u_12, (ref) v_u_8, (copy) v_u_311, (copy) v_u_352, (ref) v_u_313
			if v_u_12.VREnabled then
				local v382 = v_u_8.SelectedCoreObject
				if not (v382 and v382:IsDescendantOf(v_u_311.SliderFrame.Parent)) then
					return
				end
			end
			v_u_352(p381, v_u_313)
		end)
		v_u_311.SliderFrame.InputEnded:Connect(function(p383)
			-- upvalues: (ref) v_u_12, (ref) v_u_8, (copy) v_u_311, (ref) v_u_316, (ref) v_u_314
			if v_u_12.VREnabled then
				local v384 = v_u_8.SelectedCoreObject
				if not (v384 and v384:IsDescendantOf(v_u_311.SliderFrame.Parent)) then
					return
				end
			end
			if v_u_316 then
				local v385
				if p383 then
					if p383.UserInputType == Enum.UserInputType.MouseButton1 or p383.UserInputType == Enum.UserInputType.Touch then
						v385 = true
					elseif p383.UserInputType == Enum.UserInputType.Gamepad1 then
						v385 = p383.KeyCode == Enum.KeyCode.ButtonA
					else
						v385 = false
					end
				else
					v385 = false
				end
				if v385 then
					v_u_314 = 0
				end
			else
				return
			end
		end)
		local function v_u_386()
			-- upvalues: (ref) v_u_315, (copy) v_u_337, (ref) v_u_313, (ref) v_u_314
			if v_u_315 ~= nil then
				if tick() - v_u_315 >= 0.2 then
					v_u_337(v_u_313 + v_u_314)
				end
			end
		end
		local v_u_387 = true
		local v_u_388 = {
			[Enum.KeyCode.Thumbstick1] = true,
			[Enum.KeyCode.DPadLeft] = -1,
			[Enum.KeyCode.DPadRight] = 1,
			[Enum.KeyCode.Left] = -1,
			[Enum.KeyCode.Right] = 1,
			[Enum.KeyCode.A] = -1,
			[Enum.KeyCode.D] = 1,
			[Enum.KeyCode.ButtonA] = true
		}
		v_u_7.InputBegan:Connect(function(p389)
			-- upvalues: (ref) v_u_316, (ref) v_u_387, (ref) v_u_8, (copy) v_u_311, (copy) v_u_388, (ref) v_u_314, (copy) v_u_337, (ref) v_u_313
			if v_u_316 then
				if v_u_387 then
					if p389.UserInputType == Enum.UserInputType.Gamepad1 or p389.UserInputType == Enum.UserInputType.Keyboard then
						local v390 = v_u_8.SelectedCoreObject
						if v390 and v390:IsDescendantOf(v_u_311.SliderFrame.Parent) then
							if v_u_388[p389.KeyCode] == -1 then
								v_u_314 = -1
								v_u_337(v_u_313 - 1)
							elseif v_u_388[p389.KeyCode] == 1 then
								v_u_314 = 1
								v_u_337(v_u_313 + 1)
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end)
		v_u_7.InputEnded:Connect(function(p391)
			-- upvalues: (ref) v_u_316, (ref) v_u_8, (copy) v_u_311, (copy) v_u_388, (ref) v_u_314
			if v_u_316 then
				if p391.UserInputType == Enum.UserInputType.Gamepad1 or p391.UserInputType == Enum.UserInputType.Keyboard then
					local v392 = v_u_8.SelectedCoreObject
					if v392 and v392:IsDescendantOf(v_u_311.SliderFrame.Parent) then
						if v_u_388[p391.KeyCode] then
							v_u_314 = 0
						end
					end
				else
					return
				end
			else
				return
			end
		end)
		v_u_7.InputChanged:Connect(function(p393)
			-- upvalues: (ref) v_u_316, (ref) v_u_314, (ref) v_u_387, (ref) v_u_8, (copy) v_u_311, (copy) v_u_337, (ref) v_u_313
			if v_u_316 then
				if v_u_387 then
					if p393.UserInputType == Enum.UserInputType.Gamepad1 then
						local v394 = v_u_8.SelectedCoreObject
						if v394 and v394:IsDescendantOf(v_u_311.SliderFrame.Parent) then
							if p393.KeyCode == Enum.KeyCode.Thumbstick1 then
								if p393.Position.X > 0.8 and (p393.Delta.X > 0 and v_u_314 ~= 1) then
									v_u_314 = 1
									v_u_337(v_u_313 + 1)
									return
								elseif p393.Position.X < -0.8 and (p393.Delta.X < 0 and v_u_314 ~= -1) then
									v_u_314 = -1
									v_u_337(v_u_313 - 1)
								else
									local v395 = p393.Position.X
									if math.abs(v395) < 0.8 then
										v_u_314 = 0
									end
								end
							else
								return
							end
						else
							return
						end
					else
						return
					end
				else
					v_u_314 = 0
					return
				end
			else
				v_u_314 = 0
				return
			end
		end)
		local v_u_396 = false
		v_u_8.Changed:Connect(function(p397)
			-- upvalues: (ref) v_u_8, (copy) v_u_311, (copy) v_u_376, (ref) v_u_396, (ref) v_u_315, (ref) v_u_9, (copy) v_u_317, (copy) v_u_386
			if p397 == "SelectedCoreObject" then
				local v398 = v_u_8.SelectedCoreObject
				if v398 then
					v398 = v398:IsDescendantOf(v_u_311.SliderFrame.Parent)
				end
				if v398 then
					v_u_376(0)
					if not v_u_396 then
						v_u_396 = true
						v_u_315 = tick()
						v_u_9:BindToRenderStep(v_u_317, Enum.RenderPriority.Input.Value + 1, v_u_386)
						return
					end
				else
					v_u_376(0.36)
					if v_u_396 then
						v_u_396 = false
						v_u_9:UnbindFromRenderStep(v_u_317)
					end
				end
			end
		end)
		v_u_311.SliderFrame.AncestryChanged:Connect(function(_, p399)
			-- upvalues: (ref) v_u_387
			v_u_387 = p399
		end)
		v_u_337(v_u_313)
		return v_u_311
	end
	error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
end
local v_u_401 = 50
local v_u_402 = {}
local function v_u_463(p_u_403, p_u_404, p405, p406, p407, p408)
	-- upvalues: (copy) v_u_402, (copy) v_u_22, (ref) v_u_401, (copy) v_u_24, (copy) v_u_15, (copy) v_u_71, (copy) v_u_23, (copy) v_u_400, (copy) v_u_287, (copy) v_u_204, (copy) v_u_12, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10
	local v409 = p405 ~= "TextBox"
	local v410 = not v_u_402[p_u_403] and 0 or v_u_402[p_u_403]
	local v_u_411 = v_u_22.Create("ImageButton")({
		["Name"] = p_u_404 .. "Frame",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(2, 2, 18, 18),
		["ImageTransparency"] = 1,
		["Active"] = false,
		["AutoButtonColor"] = false,
		["Size"] = UDim2.new(1, 0, 0, v_u_401),
		["Position"] = UDim2.new(0, 0, 0, v410),
		["ZIndex"] = 2,
		["Selectable"] = false,
		["SelectionImageObject"] = v_u_24,
		["Parent"] = p_u_403.Page
	})
	v_u_411.ImageColor3 = v_u_411.BackgroundColor3
	if v_u_411 and p408 then
		v_u_411.Position = UDim2.new(v_u_411.Position.X.Scale, v_u_411.Position.X.Offset, v_u_411.Position.Y.Scale, v_u_411.Position.Y.Offset + p408)
	end
	local v_u_412 = v_u_22.Create("TextLabel")({
		["Name"] = p_u_404 .. "Label",
		["Text"] = p_u_404,
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 16,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, 200, 1, 0),
		["Position"] = UDim2.new(0, 10, 0, 0),
		["ZIndex"] = 2,
		["Parent"] = v_u_411
	})
	local v_u_413 = Instance.new("UITextSizeConstraint")
	if v_u_15 then
		v_u_412.Size = UDim2.new(0.35, 0, 1, 0)
		v_u_412.TextScaled = true
		v_u_412.TextWrapped = true
		v_u_413.Parent = v_u_412
		v_u_413.MaxTextSize = 16
	end
	if not v409 then
		v_u_412.Text = ""
	end
	local function v415(_, p414)
		-- upvalues: (ref) v_u_412, (copy) v_u_413
		if p414 then
			v_u_412.TextSize = 16
		else
			v_u_412.TextSize = 24
		end
		v_u_413.MaxTextSize = v_u_412.TextSize
	end
	v_u_71()
	local v416 = v_u_71()
	if v416.Y > v416.X then
		v_u_412.TextSize = 16
	else
		v_u_412.TextSize = 24
	end
	v_u_413.MaxTextSize = v_u_412.TextSize
	v_u_23[v_u_411] = v415
	v_u_71()
	local v417 = v_u_71()
	if v417.Y > v417.X then
		v_u_412.TextSize = 16
	else
		v_u_412.TextSize = 24
	end
	v_u_413.MaxTextSize = v_u_412.TextSize
	local v_u_418 = nil
	local v_u_419 = nil
	if p405 == "Slider" then
		v_u_419 = v_u_400(p406, p407)
		v_u_419.SliderFrame.Parent = v_u_411
		v_u_418 = v_u_419.SliderFrame
	elseif p405 == "Selector" then
		v_u_419 = v_u_287(p406, p407)
		v_u_419.SelectorFrame.Parent = v_u_411
		v_u_418 = v_u_419.SelectorFrame
	elseif p405 == "DropDown" then
		v_u_419 = v_u_204(p406, p407, p_u_403.HubRef)
		v_u_419.DropDownFrame.Parent = v_u_411
		v_u_418 = v_u_419.DropDownFrame
	elseif p405 == "TextBox" then
		local v_u_420 = false
		local v_u_421 = false
		local v422 = v_u_22.Create("ImageLabel")({
			["Image"] = "",
			["BackgroundTransparency"] = 1
		})
		v_u_419 = {
			["HubRef"] = nil
		}
		local v_u_423 = v_u_22.Create("TextBox")({
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.new(0.6, 0, 1, 0),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Text"] = p_u_404,
			["TextColor3"] = Color3.fromRGB(49, 49, 49),
			["BackgroundTransparency"] = 0.5,
			["BorderSizePixel"] = 0,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextWrapped"] = true,
			["Font"] = Enum.Font.SourceSans,
			["TextSize"] = 24,
			["ZIndex"] = 2,
			["SelectionImageObject"] = v422,
			["ClearTextOnFocus"] = false,
			["Parent"] = v_u_411
		})
		v_u_418 = v_u_423
		v_u_423.Focused:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_423, (copy) p_u_404
			local v424
			if v_u_12.VREnabled then
				v424 = false
			else
				v424 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v424 then
				v_u_8.SelectedCoreObject = v_u_423
			end
			if v_u_423.Text == p_u_404 then
				v_u_423.Text = ""
			end
		end)
		v_u_423.FocusLost:Connect(function(_, _)
			-- upvalues: (ref) v_u_421
			v_u_421 = false
		end)
		if p408 then
			v_u_423.Position = UDim2.new(v_u_423.Position.X.Scale, v_u_423.Position.X.Offset, v_u_423.Position.Y.Scale, v_u_423.Position.Y.Offset + p408)
		end
		v_u_418.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (copy) v_u_423, (ref) v_u_419, (ref) v_u_418
			local v425
			if v_u_12.VREnabled then
				v425 = false
			else
				v425 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v425 then
				v_u_423.BackgroundTransparency = 0.1
				if v_u_419.HubRef then
					v_u_419.HubRef:ScrollToFrame(v_u_418)
				end
			end
		end)
		v_u_418.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (copy) v_u_423
			local v426
			if v_u_12.VREnabled then
				v426 = false
			else
				v426 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v426 then
				v_u_423.BackgroundTransparency = 0.5
			end
		end)
		local function v430()
			-- upvalues: (ref) v_u_10, (ref) v_u_418, (ref) v_u_12, (ref) v_u_7, (copy) p_u_403, (ref) v_u_8, (ref) v_u_420
			local v427 = v_u_10.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v427 and v427.Visible) then
				local v428 = v_u_418
				if v428 and (v428.Visible and v428.ZIndex > 1) then
					local v429
					if v_u_12.VREnabled then
						v429 = false
					else
						v429 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
					end
					if v429 and p_u_403.Active then
						v_u_8.SelectedCoreObject = v428
						v_u_420 = true
					end
				end
			end
		end
		local function v432(p431)
			-- upvalues: (ref) v_u_8, (ref) v_u_418, (ref) v_u_421, (copy) v_u_423
			if p431.UserInputState == Enum.UserInputState.Begin and (p431.KeyCode == Enum.KeyCode.Return and v_u_8.SelectedCoreObject == v_u_418) then
				v_u_421 = true
				v_u_423:CaptureFocus()
			end
		end
		v_u_423.MouseEnter:Connect(v430)
		v_u_7.InputBegan:Connect(v432)
	elseif p405 == "TextEntry" then
		local v_u_433 = false
		local v_u_434 = false
		local v435 = v_u_22.Create("ImageLabel")({
			["Image"] = "",
			["BackgroundTransparency"] = 1
		})
		v_u_419 = {
			["HubRef"] = nil
		}
		local v_u_436 = v_u_22.Create("TextBox")({
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.new(0.4, -10, 0, 40),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Text"] = p_u_404,
			["TextColor3"] = Color3.fromRGB(178, 178, 178),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextWrapped"] = false,
			["Font"] = Enum.Font.SourceSans,
			["TextSize"] = 24,
			["ZIndex"] = 2,
			["SelectionImageObject"] = v435,
			["ClearTextOnFocus"] = false,
			["Parent"] = v_u_411
		})
		v_u_418 = v_u_436
		v_u_436.Focused:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_8, (copy) v_u_436, (copy) p_u_404
			local v437
			if v_u_12.VREnabled then
				v437 = false
			else
				v437 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v437 then
				v_u_8.SelectedCoreObject = v_u_436
			end
			if v_u_436.Text == p_u_404 then
				v_u_436.Text = ""
			end
		end)
		v_u_436.FocusLost:Connect(function(_, _)
			-- upvalues: (ref) v_u_434
			v_u_434 = false
		end)
		if p408 then
			v_u_436.Position = UDim2.new(v_u_436.Position.X.Scale, v_u_436.Position.X.Offset, v_u_436.Position.Y.Scale, v_u_436.Position.Y.Offset + p408)
		end
		v_u_418.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (copy) v_u_436, (ref) v_u_419, (ref) v_u_418
			local v438
			if v_u_12.VREnabled then
				v438 = false
			else
				v438 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v438 then
				v_u_436.BackgroundTransparency = 0.8
				if v_u_419.HubRef then
					v_u_419.HubRef:ScrollToFrame(v_u_418)
				end
			end
		end)
		v_u_418.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (copy) v_u_436
			local v439
			if v_u_12.VREnabled then
				v439 = false
			else
				v439 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v439 then
				v_u_436.BackgroundTransparency = 1
			end
		end)
		local function v443()
			-- upvalues: (ref) v_u_10, (ref) v_u_418, (ref) v_u_12, (ref) v_u_7, (copy) p_u_403, (ref) v_u_8, (ref) v_u_433
			local v440 = v_u_10.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v440 and v440.Visible) then
				local v441 = v_u_418
				if v441 and (v441.Visible and v441.ZIndex > 1) then
					local v442
					if v_u_12.VREnabled then
						v442 = false
					else
						v442 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
					end
					if v442 and p_u_403.Active then
						v_u_8.SelectedCoreObject = v441
						v_u_433 = true
					end
				end
			end
		end
		local function v445(p444)
			-- upvalues: (ref) v_u_8, (ref) v_u_418, (ref) v_u_434, (copy) v_u_436
			if p444.UserInputState == Enum.UserInputState.Begin and (p444.KeyCode == Enum.KeyCode.Return and v_u_8.SelectedCoreObject == v_u_418) then
				v_u_434 = true
				v_u_436:CaptureFocus()
			end
		end
		v_u_411.MouseEnter:Connect(v443)
		function v_u_419.SetZIndex(_, p446)
			-- upvalues: (copy) v_u_436
			v_u_436.ZIndex = p446
		end
		function v_u_419.SetInteractable(_, p447)
			-- upvalues: (copy) v_u_436
			v_u_436.Selectable = p447
			if p447 then
				v_u_436.TextColor3 = Color3.fromRGB(178, 178, 178)
				v_u_436.ZIndex = 2
			else
				v_u_436.TextColor3 = Color3.fromRGB(49, 49, 49)
				v_u_436.ZIndex = 1
			end
		end
		function v_u_419.SetValue(_, p448)
			-- upvalues: (copy) v_u_436
			v_u_436.Text = p448
		end
		local v_u_449 = Instance.new("BindableEvent")
		v_u_449.Name = "ValueChanged"
		v_u_436.FocusLost:Connect(function()
			-- upvalues: (copy) v_u_449, (copy) v_u_436
			v_u_449:Fire(v_u_436.Text)
		end)
		v_u_419.ValueChanged = v_u_449.Event
		v_u_7.InputBegan:Connect(v445)
	end
	v_u_419.Name = p_u_404 .. "ValueChanger"
	local v450 = v410 + v_u_401
	if p408 then
		v450 = v450 + p408
	end
	v_u_402[p_u_403] = v450
	if v409 then
		local function v454()
			-- upvalues: (ref) v_u_10, (ref) v_u_419, (ref) v_u_12, (ref) v_u_7, (copy) p_u_403, (ref) v_u_8
			local v451 = v_u_10.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v451 and v451.Visible) then
				local v452 = v_u_419.SliderFrame or v_u_419.SliderFrame or v_u_419.DropDownFrame or v_u_419.SelectorFrame
				if v452 and (v452.Visible and v452.ZIndex > 1) then
					local v453
					if v_u_12.VREnabled then
						v453 = false
					else
						v453 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
					end
					if v453 and p_u_403.Active then
						v_u_8.SelectedCoreObject = v452
					end
				end
			end
		end
		v_u_411.MouseEnter:Connect(v454)
		local function v458(p455)
			-- upvalues: (ref) v_u_12, (ref) v_u_411, (ref) v_u_418, (ref) v_u_8
			if p455 == "VREnabled" then
				if v_u_12.VREnabled then
					v_u_411.Selectable = true
					v_u_411.Active = true
					v_u_418.Active = true
					v_u_8.Changed:Connect(function(p456)
						-- upvalues: (ref) v_u_8, (ref) v_u_411
						if p456 == "SelectedCoreObject" then
							local v457 = v_u_8.SelectedCoreObject
							if v457 and (v457 == v_u_411 or v457:IsDescendantOf(v_u_411)) then
								v_u_411.ImageTransparency = 0.5
								v_u_411.BackgroundTransparency = 1
								return
							end
							v_u_411.ImageTransparency = 1
							v_u_411.BackgroundTransparency = 1
						end
					end)
					return
				end
				v_u_411.Selectable = false
				v_u_411.Active = false
			end
		end
		v_u_12.Changed:Connect(v458)
		if v_u_12.VREnabled then
			v_u_411.Selectable = true
			v_u_411.Active = true
			v_u_418.Active = true
			v_u_8.Changed:Connect(function(p459)
				-- upvalues: (ref) v_u_8, (ref) v_u_411
				if p459 == "SelectedCoreObject" then
					local v460 = v_u_8.SelectedCoreObject
					if v460 and (v460 == v_u_411 or v460:IsDescendantOf(v_u_411)) then
						v_u_411.ImageTransparency = 0.5
						v_u_411.BackgroundTransparency = 1
						return
					end
					v_u_411.ImageTransparency = 1
					v_u_411.BackgroundTransparency = 1
				end
			end)
		else
			v_u_411.Selectable = false
			v_u_411.Active = false
		end
		v_u_418.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_411, (ref) v_u_419
			local v461
			if v_u_12.VREnabled then
				v461 = false
			else
				v461 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v461 then
				if v_u_12.VREnabled then
					v_u_411.ImageTransparency = 0.5
					v_u_411.BackgroundTransparency = 1
				else
					v_u_411.ImageTransparency = 1
					v_u_411.BackgroundTransparency = 0.5
				end
				if v_u_419.HubRef then
					v_u_419.HubRef:ScrollToFrame(v_u_411)
				end
			end
		end)
		v_u_418.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_411
			local v462
			if v_u_12.VREnabled then
				v462 = false
			else
				v462 = (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
			end
			if v462 then
				v_u_411.ImageTransparency = 1
				v_u_411.BackgroundTransparency = 1
			end
		end)
	end
	p_u_403:AddRow(v_u_411, v_u_412, v_u_419, p408, false)
	v_u_419.Selection = v_u_418
	return v_u_411, v_u_412, v_u_419
end
local function v_u_475(p464, p465, p466, p467)
	-- upvalues: (copy) v_u_402, (copy) v_u_22, (ref) v_u_401, (copy) v_u_24, (copy) v_u_23, (copy) v_u_71, (copy) v_u_8, (copy) v_u_12
	local v468 = not v_u_402[p464] and 0 or v_u_402[p464]
	local v_u_469 = v_u_22.Create("ImageButton")({
		["Name"] = p465 .. "Frame",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10),
		["ImageTransparency"] = 1,
		["Active"] = false,
		["AutoButtonColor"] = false,
		["Size"] = UDim2.new(1, 0, 0, v_u_401),
		["Position"] = UDim2.new(0, 0, 0, v468),
		["ZIndex"] = 2,
		["Selectable"] = false,
		["SelectionImageObject"] = v_u_24,
		["Parent"] = p464.Page
	})
	v_u_469.ImageColor3 = v_u_469.BackgroundColor3
	v_u_469.SelectionGained:Connect(function()
		-- upvalues: (copy) v_u_469
		v_u_469.BackgroundTransparency = 0.5
	end)
	v_u_469.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_469
		v_u_469.BackgroundTransparency = 1
	end)
	local v_u_470 = v_u_22.Create("TextLabel")({
		["Name"] = p465 .. "Label",
		["Text"] = p465,
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 16,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, 200, 1, 0),
		["Position"] = UDim2.new(0, 10, 0, 0),
		["ZIndex"] = 2,
		["Parent"] = v_u_469
	})
	v_u_23[v_u_469] = function(_, p471)
		-- upvalues: (copy) v_u_470
		if p471 then
			v_u_470.TextSize = 16
		else
			v_u_470.TextSize = 24
		end
	end
	v_u_71()
	local v472 = v_u_71()
	if v472.Y > v472.X then
		v_u_470.TextSize = 16
	else
		v_u_470.TextSize = 24
	end
	if p467 then
		v_u_469.Position = UDim2.new(v_u_469.Position.X.Scale, v_u_469.Position.X.Offset, v_u_469.Position.Y.Scale, v_u_469.Position.Y.Offset + p467)
	end
	local v473 = v468 + v_u_401
	if p467 then
		v473 = v473 + p467
	end
	v_u_402[p464] = v473
	local function v474()
		-- upvalues: (copy) v_u_469, (ref) v_u_8
		if v_u_469.Visible then
			v_u_8.SelectedCoreObject = v_u_469
		end
	end
	v_u_469.MouseEnter:Connect(v474)
	p466.SelectionImageObject = v_u_24
	p466.SelectionGained:Connect(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_469
		if v_u_12.VREnabled then
			v_u_469.ImageTransparency = 0.5
			v_u_469.BackgroundTransparency = 1
		else
			v_u_469.ImageTransparency = 1
			v_u_469.BackgroundTransparency = 0.5
		end
	end)
	p466.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_469
		v_u_469.ImageTransparency = 1
		v_u_469.BackgroundTransparency = 1
	end)
	p466.Parent = v_u_469
	p464:AddRow(v_u_469, v_u_470, p466, p467, true)
	return v_u_469
end
local v_u_549 = {
	["Create"] = function(_, p_u_476)
		return function(p477)
			-- upvalues: (copy) p_u_476
			local v478 = Instance.new(p_u_476)
			local v479 = nil
			for v480, v481 in pairs(p477) do
				if type(v480) == "number" then
					v481.Parent = v478
				elseif v480 == "Parent" then
					v479 = v481
				else
					v478[v480] = v481
				end
			end
			if v479 then
				v478.Parent = v479
			end
			return v478
		end
	end,
	["RayPlaneIntersection"] = function(_, p482, p483, p484)
		local v485 = p483.unit
		local v486 = p482.Unit
		local v487 = v485:Dot(v486.Direction)
		if v487 == 0 then
			return nil
		else
			local v488 = v485:Dot(p484 - v486.Origin) / v487
			if v488 < 0 then
				return nil
			else
				return v486.Origin + v486.Direction * v488
			end
		end
	end,
	["GetEaseLinear"] = function(_)
		-- upvalues: (copy) v_u_36
		return v_u_36
	end,
	["GetEaseOutQuad"] = function(_)
		-- upvalues: (copy) v_u_42
		return v_u_42
	end,
	["GetEaseInOutQuad"] = function(_)
		-- upvalues: (copy) v_u_48
		return v_u_48
	end,
	["CreateNewSlider"] = function(_, p489, p490, p491)
		-- upvalues: (copy) v_u_400
		return v_u_400(p489, p490, p491)
	end,
	["CreateNewSelector"] = function(_, p492, p493)
		-- upvalues: (copy) v_u_287
		return v_u_287(p492, p493)
	end,
	["CreateNewDropDown"] = function(_, p494, p495)
		-- upvalues: (copy) v_u_204
		return v_u_204(p494, p495, nil)
	end,
	["AddNewRow"] = function(_, p496, p497, p498, p499, p500, p501)
		-- upvalues: (copy) v_u_463
		return v_u_463(p496, p497, p498, p499, p500, p501)
	end,
	["AddNewRowObject"] = function(_, p502, p503, p504, p505)
		-- upvalues: (copy) v_u_475
		return v_u_475(p502, p503, p504, p505)
	end,
	["ShowAlert"] = function(_, p506, p507, p508, p509, p510)
		-- upvalues: (copy) v_u_307
		v_u_307(p506, p507, p508, p509, p510)
	end,
	["IsSmallTouchScreen"] = function(_)
		-- upvalues: (copy) v_u_71, (copy) v_u_7
		local v511 = v_u_71()
		local v512 = v_u_7.TouchEnabled
		if v512 then
			v512 = v511.Y < 500 and true or v511.X < 700
		end
		return v512
	end,
	["IsPortrait"] = function(_)
		-- upvalues: (copy) v_u_71
		local v513 = v_u_71()
		return v513.Y > v513.X
	end,
	["MakeStyledButton"] = function(_, p514, p515, p516, p517, p518, p519)
		-- upvalues: (copy) v_u_118
		return v_u_118(p514, p515, p516, p517, p518, p519)
	end,
	["MakeStyledImageButton"] = function(_, p520, p521, p522, p523, p524, p525, p526)
		-- upvalues: (copy) v_u_128
		return v_u_128(p520, p521, p522, p523, p524, p525, p526)
	end,
	["AddButtonRow"] = function(_, p527, p528, p529, p530, p531, p532)
		-- upvalues: (copy) v_u_139
		return v_u_139(p527, p528, p529, p530, p531, p532)
	end,
	["CreateSignal"] = function(_)
		-- upvalues: (copy) v_u_70
		return v_u_70()
	end,
	["UsesSelectedObject"] = function(_)
		-- upvalues: (copy) v_u_12, (copy) v_u_7
		if v_u_12.VREnabled then
			return false
		else
			return (not v_u_7.TouchEnabled or v_u_7.GamepadEnabled) and true or false
		end
	end,
	["TweenProperty"] = function(_, p533, p534, p535, p536, p537, p538, p539)
		return PropertyTweener(p533, p534, p535, p536, p537, p538, p539)
	end,
	["OnResized"] = function(_, p540, p541)
		-- upvalues: (copy) v_u_83
		return v_u_83(p540, p541)
	end,
	["FireOnResized"] = function(_)
		-- upvalues: (copy) v_u_71, (copy) v_u_549, (copy) v_u_23
		local v542 = v_u_71()
		local v543 = v_u_549:IsPortrait()
		for _, v544 in pairs(v_u_23) do
			v544(v542, v543)
		end
	end,
	["Lerp"] = function(_, p545, p546, p547)
		return (1 - p545) * p546 + p545 * p547
	end,
	["Round"] = function(_, p548)
		return p548 % 1 >= 0.5 and math.ceil(p548) or math.floor(p548)
	end
}
return v_u_549