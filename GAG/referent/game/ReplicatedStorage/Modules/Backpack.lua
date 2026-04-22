local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("GuiService")
local v_u_4 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_5 = require(v1.Modules.InventorySortingController)
local v_u_6 = require(v1.Modules.TradeControllers.TradingController)
local v_u_7 = require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_8 = require(v1.Modules.PlantTraitsData)
local v9 = require(v1.Data.CategoryList)
local v10 = require(v1.Modules.Signal)
local v_u_11 = v10.new()
local v_u_12 = v10.new()
local v_u_13 = v3:IsTenFootInterface() or v2:IsStudio()
local v_u_14 = {}
local v_u_15 = { "All", "Favorited", "NonFavorited" }
local v_u_16 = "All"
local v_u_17 = nil
local v_u_18 = "All"
local v_u_19 = false
local v_u_20 = {
	["Favorited"] = "rbxassetid://83373307650705",
	["NonFavorited"] = "rbxassetid://82761222568258",
	["All"] = "rbxassetid://90084965933996"
}
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = false
for _, v24 in v9 do
	v_u_14[v24.Name] = v24
end
local function v_u_31(p25)
	-- upvalues: (ref) v_u_16, (copy) v_u_14, (copy) v_u_4, (copy) v_u_7
	if not p25 then
		return false
	end
	if v_u_16 == "All" then
		return true
	end
	local v26 = v_u_14[v_u_16]
	if not v26 then
		return false
	end
	local v27 = v26.Tags
	local v28 = p25:GetAttribute(v_u_4.ITEM_TYPE)
	local v29 = p25:GetAttribute("ItemType")
	for _, v30 in v27 do
		if v28 == v_u_7[v30] or v29 == v30 then
			return true
		end
	end
	return false
end
local v_u_32 = false
task.spawn(function()
	-- upvalues: (ref) v_u_32, (ref) v_u_17
	while true do
		repeat
			task.wait(1)
		until v_u_32
		v_u_32 = false
		v_u_17()
	end
end)
local v_u_33 = false
task.spawn(function()
	-- upvalues: (ref) v_u_33, (ref) v_u_17
	while true do
		repeat
			task.wait(1)
		until v_u_33
		v_u_33 = false
		v_u_17(true)
	end
end)
local v_u_34 = {
	["OpenClose"] = nil,
	["IsOpen"] = false,
	["StateChanged"] = Instance.new("BindableEvent"),
	["ModuleName"] = "Backpack",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = true
}
local v_u_35 = script:GetAttribute("TextSize")
local v_u_36 = {
	["ICON_SIZE"] = 60,
	["ICON_BUFFER"] = 5,
	["BACKGROUND_FADE"] = script:GetAttribute("BackgroundTransparency"),
	["BACKGROUND_COLOR"] = script:GetAttribute("BackgroundColor")
}
local v_u_37 = script:GetAttribute("DraggableColor")
local v_u_38 = script:GetAttribute("EquippedColor")
local v_u_39 = script:GetAttribute("SlotLockedTransparency")
local v_u_40 = script:GetAttribute("BorderColor")
local v41 = { Enum.KeyCode.Backquote }
local v42 = script:GetAttribute("FullSlots")
local v43 = script:GetAttribute("EmptySlots")
local v44 = script:GetAttribute("SearchBoxColor")
local v45 = script:GetAttribute("SearchBoxTransparency")
local v46 = script:WaitForChild("Api")
v46.Parent = game.ReplicatedStorage
local v47 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
local v_u_48 = v47:WaitForChild("Favorite_Item")
local v_u_49 = v47:WaitForChild("Favorite_Item_BE")
local v_u_50 = nil
local v_u_51 = true
local function v55()
	local v52 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	local v53 = Instance.new("Frame", v52)
	v53.BackgroundTransparency = 1
	v53.Size = UDim2.new(1, 0, 1, 0)
	local v54 = v53.AbsoluteSize
	v52:Destroy()
	return v54
end
local v_u_56 = Enum.KeyCode.Zero.Value
local v_u_57 = Enum.KeyCode.Backspace.Value
local v_u_58 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local v_u_59 = game:GetService("UserInputService")
local v60 = game:GetService("Players")
local v_u_61 = game:GetService("ReplicatedStorage")
local v_u_62 = game:GetService("StarterGui")
local v_u_63 = game:GetService("GuiService")
local v64 = v60.LocalPlayer.PlayerGui
local v65 = Instance.new("ScreenGui", v64)
v65.DisplayOrder = 120
v65.IgnoreGuiInset = true
v65.ResetOnSpawn = false
v65.Name = "BackpackGui"
local v_u_66 = game:GetService("ContextActionService")
local v67 = game:GetService("RunService")
local v_u_68 = game:GetService("VRService")
local v_u_69 = require(script.Utility)
require(script.GameTranslator)
local v70 = require(v_u_61.Modules.Icon)
local v_u_71 = v_u_63:IsTenFootInterface()
if v_u_71 then
	v_u_36.ICON_SIZE = 100
	v_u_35 = 24
end
local v_u_72 = false
local v73 = v_u_59.TouchEnabled
if v73 then
	v73 = v55().X < 1024
end
local v_u_74 = v60.LocalPlayer
local v_u_75 = nil
local v_u_76 = nil
local v_u_77 = nil
local v_u_78 = nil
local v_u_79 = nil
local v_u_80 = nil
local v_u_81 = nil
local v_u_82 = v_u_74.Character or v_u_74.CharacterAdded:Wait()
local v_u_83 = v_u_82:FindFirstChildOfClass("Humanoid")
local v_u_84 = v_u_74:WaitForChild("Backpack")
local v_u_85 = v70.new()
v_u_85:setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "deselected")
v_u_85:setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "selected")
v_u_85:bindToggleKey(v41[1], v41[2])
v_u_85:setName("InventoryIcon")
v_u_85:setImageScale(1.12)
v_u_85:setOrder(-5)
v_u_85:setCaption("Toggle the backpack.")
v_u_85.deselectWhenOtherIconSelected = false
local v_u_86 = {}
local v_u_87 = nil
local v_u_88 = {}
local v_u_89 = {}
local v_u_90 = {}
local v_u_91 = 0
local v_u_92 = false
local v_u_93 = false
local v_u_94 = false
local v_u_95 = false
local v_u_96 = {}
local v_u_97 = {}
local v_u_98 = false
local v_u_99 = 0
local v_u_100 = v_u_68.VREnabled
local v_u_101 = v_u_100 and v43 and v43 or (v73 and 6 or v42)
local v_u_102 = v_u_100 and 3 or (v73 and 2 or 4)
local v_u_103 = nil
local function v_u_107(p104, p105)
	-- upvalues: (ref) v_u_35
	local v106 = Instance.new(p104)
	v106.Name = p105
	v106.BackgroundColor3 = Color3.new(0, 0, 0)
	v106.BackgroundTransparency = 1
	v106.BorderColor3 = Color3.new(0, 0, 0)
	v106.BorderSizePixel = 0
	v106.Size = UDim2.new(1, 0, 1, 0)
	if p104:match("Text") then
		v106.TextColor3 = Color3.new(1, 1, 1)
		v106.Text = ""
		v106.FontFace = script:GetAttribute("LabelFont")
		v106.TextSize = v_u_35
		v106.TextWrapped = true
		if p104 == "TextButton" then
			v106.FontFace = script:GetAttribute("SlotFont")
		end
	end
	return v106
end
local function v_u_114()
	-- upvalues: (ref) v_u_77, (ref) v_u_91, (copy) v_u_101, (copy) v_u_86
	local v108 = v_u_77.Visible
	local v109
	if v108 then
		v109 = v_u_101
	else
		v109 = v_u_91
		for v110 = 1, v_u_101 do
			if v_u_86[v110].Hidden then
				v109 = v109 - 1
			end
		end
	end
	local _ = v109 >= 1
	local v111 = 0
	for v112 = 1, v_u_101 do
		local v113 = v_u_86[v112]
		if v113 and (v113.Tool or v108) and (not v113.Hidden or v108) then
			v111 = v111 + 1
			v113:Readjust(v111, v109)
			v113.Frame.Visible = true
		elseif v113 then
			v113.Frame.Visible = false
		end
	end
end
local v_u_115 = nil
local function v_u_119(p116)
	-- upvalues: (ref) v_u_115, (ref) v_u_81, (copy) v_u_36, (ref) v_u_79
	if v_u_115 then
		pcall(task.cancel, v_u_115)
	end
	if p116 then
		local v117 = v_u_81.AbsoluteCellCount.Y * (v_u_36.ICON_SIZE + v_u_36.ICON_BUFFER) + v_u_36.ICON_BUFFER
		v_u_79.CanvasSize = UDim2.new(0, 0, 0, v117)
		v_u_115 = nil
	else
		v_u_115 = task.delay(0.05, function()
			-- upvalues: (ref) v_u_81, (ref) v_u_36, (ref) v_u_79, (ref) v_u_115
			local v118 = v_u_81.AbsoluteCellCount.Y * (v_u_36.ICON_SIZE + v_u_36.ICON_BUFFER) + v_u_36.ICON_BUFFER
			v_u_79.CanvasSize = UDim2.new(0, 0, 0, v118)
			v_u_115 = nil
		end)
	end
end
local function v_u_122()
	-- upvalues: (copy) v_u_101, (copy) v_u_86, (copy) v_u_119
	for v120 = v_u_101 + 1, #v_u_86 do
		local v121 = v_u_86[v120]
		if v121 then
			v121.Frame.LayoutOrder = v121.Index
			v121.Frame.Visible = v121.Tool ~= nil
		end
	end
	v_u_119()
end
local function v123()
	-- upvalues: (ref) v_u_76, (copy) v_u_36, (copy) v_u_101, (ref) v_u_77, (copy) v_u_102, (copy) v_u_100, (ref) v_u_79, (copy) v_u_114, (copy) v_u_122
	v_u_76.Size = UDim2.new(0, v_u_36.ICON_BUFFER + v_u_101 * (v_u_36.ICON_SIZE + v_u_36.ICON_BUFFER), 0, v_u_36.ICON_BUFFER + v_u_36.ICON_SIZE + v_u_36.ICON_BUFFER)
	v_u_76.Position = UDim2.new(0.5, -v_u_76.Size.X.Offset / 2, 1, -v_u_76.Size.Y.Offset)
	v_u_77.Size = UDim2.new(0, v_u_76.Size.X.Offset, 0, v_u_76.Size.Y.Offset * v_u_102 + 40 + (v_u_100 and 80 or 0))
	v_u_77.Position = UDim2.new(0.5, -v_u_77.Size.X.Offset / 2, 1, v_u_76.Position.Y.Offset - v_u_77.Size.Y.Offset)
	v_u_79.Size = UDim2.new(1, v_u_79.ScrollBarThickness + 1, 1, -40 - (v_u_100 and 80 or 0))
	v_u_79.Position = UDim2.new(0, 0, 0, 40 + (v_u_100 and 40 or 0))
	v_u_114()
	v_u_122()
end
local function v_u_126(p124)
	-- upvalues: (copy) v_u_48, (copy) v_u_49
	local v_u_125 = p124.Tool
	if v_u_125 then
		if not workspace:GetAttribute("InTutorial") then
			v_u_48:FireServer(v_u_125)
			task.delay(0.25, function()
				-- upvalues: (ref) v_u_49, (copy) v_u_125
				v_u_49:Fire(v_u_125)
			end)
		end
	else
		return
	end
end
os.clock()
local function v_u_298(p127, p128)
	-- upvalues: (copy) v_u_86, (copy) v_u_13, (copy) v_u_107, (copy) v_u_68, (copy) v_u_39, (copy) v_u_8, (copy) v_u_37, (copy) v_u_36, (ref) v_u_76, (copy) v_u_4, (copy) v_u_101, (ref) v_u_77, (copy) v_u_59, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (copy) v_u_66, (copy) v_u_88, (ref) v_u_87, (ref) v_u_82, (ref) v_u_103, (copy) v_u_38, (copy) v_u_90, (copy) v_u_85, (ref) v_u_21, (copy) v_u_119, (copy) v_u_61, (ref) v_u_50, (ref) v_u_83, (ref) v_u_84, (copy) v_u_6, (ref) v_u_32, (ref) v_u_23, (copy) v_u_40, (copy) v_u_126, (copy) v_u_298, (ref) v_u_80, (ref) v_u_95, (copy) v_u_89, (copy) v_u_56, (copy) v_u_74, (copy) v_u_5, (ref) v_u_22, (ref) v_u_17, (ref) v_u_79
	local v129 = p128 or #v_u_86 + 1
	local v_u_130 = {
		["Tool"] = nil,
		["Index"] = v129,
		["Frame"] = nil,
		["Hidden"] = false
	}
	local v_u_131 = nil
	local v_u_132 = nil
	local v_u_133 = nil
	local v_u_134 = nil
	local v_u_135 = nil
	local v_u_136 = nil
	local v_u_137 = nil
	local v_u_138 = nil
	local v_u_139 = nil
	local v_u_140 = v_u_107("ImageLabel", "EasterIcon")
	v_u_140.Size = UDim2.new(0.25, 0, 0.25, 0)
	v_u_140.Position = UDim2.new(1, 0, 0, 2)
	v_u_140.AnchorPoint = Vector2.new(1, 0)
	v_u_140.Visible = false
	v_u_140.Image = "rbxassetid://106773525796884"
	v_u_140.ImageColor3 = Color3.fromRGB(255, 197, 255)
	v_u_140.ZIndex = 10
	local function v_u_150()
		-- upvalues: (ref) v_u_68, (ref) v_u_131, (copy) v_u_130, (ref) v_u_13, (ref) v_u_39, (ref) v_u_8, (ref) v_u_37, (ref) v_u_36, (copy) v_u_140
		local _ = v_u_68.VREnabled
		v_u_131.SelectionImageObject = nil
		local v141 = v_u_131
		local v142
		if v_u_130.Hidden then
			v142 = false
		elseif v_u_13 then
			v142 = v_u_131:GetAttribute("Draggable")
		else
			v142 = v_u_131.Draggable
		end
		v141.BackgroundTransparency = v142 and 0 or v_u_39
		local v143
		if v_u_130.Tool then
			local v144 = v_u_130.Tool
			local v145
			if v144 then
				local v146 = not v144:GetAttribute("Seed") and v144:FindFirstChild("Item_String")
				if v146 then
					v146 = v144.Item_String.Value
				end
				v145 = v146 and v_u_8.EasterSlot[v146] == true and true or false
			else
				v145 = false
			end
			v143 = v145 or false
		else
			v143 = false
		end
		local v147 = v_u_131
		local v148 = v143 and Color3.fromRGB(181, 109, 221)
		if not v148 then
			local v149
			if v_u_130.Hidden then
				v149 = false
			elseif v_u_13 then
				v149 = v_u_131:GetAttribute("Draggable")
			else
				v149 = v_u_131.Draggable
			end
			v148 = v149 and v_u_37 or v_u_36.BACKGROUND_COLOR
		end
		v147.BackgroundColor3 = v148
		v_u_140.Visible = v143
	end
	function v_u_130.Readjust(_, p151, p152)
		-- upvalues: (ref) v_u_76, (ref) v_u_36, (ref) v_u_131
		local v153 = v_u_76.Size.X.Offset / 2
		local v154 = v_u_36.ICON_BUFFER + v_u_36.ICON_SIZE
		local v155 = p151 - (p152 / 2 + 0.5)
		v_u_131.Position = UDim2.new(0, v153 - v_u_36.ICON_SIZE / 2 + v154 * v155, 0, v_u_36.ICON_BUFFER)
	end
	function v_u_130.Fill(p_u_156, p_u_157)
		-- upvalues: (ref) v_u_136, (ref) v_u_4, (copy) v_u_130, (ref) v_u_8, (ref) v_u_131, (ref) v_u_13, (ref) v_u_37, (ref) v_u_36, (copy) v_u_140, (ref) v_u_134, (ref) v_u_138, (ref) v_u_133, (ref) v_u_135, (ref) v_u_101, (ref) v_u_77, (ref) v_u_59, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (ref) v_u_66, (ref) v_u_88, (ref) v_u_87, (ref) v_u_86
		if v_u_136 then
			v_u_136:Disconnect()
			v_u_136 = nil
		end
		if not p_u_157 then
			return p_u_156:Clear()
		end
		p_u_156.Tool = p_u_157
		v_u_136 = p_u_157:GetAttributeChangedSignal(v_u_4.Favorite):Connect(function()
			-- upvalues: (copy) p_u_156, (copy) p_u_157, (ref) v_u_4, (ref) v_u_130
			p_u_156.Favorite = p_u_157:GetAttribute(v_u_4.Favorite)
			v_u_130.Frame.FavIcon.Visible = p_u_156.Favorite
		end)
		xpcall(function()
			-- upvalues: (copy) p_u_156, (copy) p_u_157, (ref) v_u_4, (ref) v_u_130
			p_u_156.Favorite = p_u_157:GetAttribute(v_u_4.Favorite)
			v_u_130.Frame.FavIcon.Visible = p_u_156.Favorite
		end, warn)
		local function v_u_169()
			-- upvalues: (copy) p_u_156, (copy) p_u_157, (ref) v_u_8, (ref) v_u_131, (ref) v_u_130, (ref) v_u_13, (ref) v_u_37, (ref) v_u_36, (ref) v_u_140, (ref) v_u_4, (ref) v_u_134, (ref) v_u_138, (ref) v_u_133
			if not p_u_156.Hidden then
				local v158 = p_u_157
				local v159
				if v158 then
					local v160 = not v158:GetAttribute("Seed") and v158:FindFirstChild("Item_String")
					if v160 then
						v160 = v158.Item_String.Value
					end
					v159 = v160 and v_u_8.EasterSlot[v160] == true and true or false
				else
					v159 = false
				end
				local v161 = v_u_131
				local v162 = v159 and Color3.fromRGB(181, 109, 221)
				if not v162 then
					local v163
					if v_u_130.Hidden then
						v163 = false
					elseif v_u_13 then
						v163 = v_u_131:GetAttribute("Draggable")
					else
						v163 = v_u_131.Draggable
					end
					v162 = v163 and v_u_37 or v_u_36.BACKGROUND_COLOR
				end
				v161.BackgroundColor3 = v162
				v_u_140.Visible = v159
				local v164 = p_u_157.Name
				local v165 = p_u_157.ToolTip
				if not p_u_157:GetAttribute(v_u_4.Uses) then
					p_u_157:GetAttribute("Uses")
				end
				v_u_134.Text = v164
				v_u_134.TextSize = 14
				v_u_134.Visible = true
				if v_u_138 and p_u_157:IsA("Tool") then
					v_u_138.Text = v165
					local v166 = v_u_138.TextBounds.X + 24
					local v167 = v_u_138.TextBounds.Y + 10
					v_u_138.Size = UDim2.new(0, v166, 0, v167)
					v_u_138.Position = UDim2.new(0.5, -v166 / 2, 0, -v167 - 4)
				end
				local v168 = p_u_157.TextureId
				v_u_133.Image = v168
				if v168 and v168 ~= "" then
					v_u_134.Visible = false
					if string.find(v164, "Strawberry") or string.find(v164, "Exotic Enchanted Seed Pack") then
						v_u_134.TextSize = 12
					end
				end
			end
		end
		v_u_169()
		if v_u_135 then
			v_u_135:disconnect()
			v_u_135 = nil
		end
		p_u_156.AssignToolData = v_u_169
		v_u_135 = p_u_157.Changed:connect(function(p170)
			-- upvalues: (copy) v_u_169
			if p170 == "TextureId" or (p170 == "Name" or p170 == "ToolTip") then
				v_u_169()
			end
		end)
		local v171 = p_u_156.Index <= v_u_101
		if (not v171 or v_u_77.Visible) and not v_u_59.VREnabled then
			if v_u_13 then
				v_u_131:SetAttribute("Draggable", true)
			else
				v_u_131.Draggable = true
			end
		end
		p_u_156:UpdateEquipView()
		if v171 then
			v_u_91 = v_u_91 + 1
			if v_u_93 and (v_u_91 >= 1 and not v_u_72) then
				v_u_72 = true
				v_u_66:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		v_u_88[p_u_157] = p_u_156
		for v172 = 1, v_u_101 do
			v173 = v_u_86[v172]
			if not v173.Tool then
				::l25::
				v_u_87 = v173
				return
			end
		end
		local v173 = nil
		goto l25
	end
	function v_u_130.UpdateIndex(p174, p175)
		p174.Index = p175
		p174.Frame.Name = tostring(p175)
		p174.Frame.LayoutOrder = p175
	end
	function v_u_130.UpdateVisual(p176)
		-- upvalues: (ref) v_u_133, (ref) v_u_134, (ref) v_u_138, (ref) v_u_13, (ref) v_u_131, (ref) v_u_36, (copy) v_u_140, (ref) v_u_101, (ref) v_u_77, (ref) v_u_59, (ref) v_u_4
		if p176.Hidden then
			v_u_133.Image = ""
			v_u_134.Text = ""
			if v_u_138 then
				v_u_138.Text = ""
				v_u_138.Visible = false
			end
			if v_u_13 then
				v_u_131:SetAttribute("Draggable", false)
			else
				v_u_131.Draggable = false
			end
			v_u_131.FavIcon.Visible = false
			p176:UpdateEquipView(true)
			v_u_131.BackgroundColor3 = v_u_36.BACKGROUND_COLOR
			v_u_140.Visible = false
		else
			if (p176.Index > v_u_101 or v_u_77.Visible) and not v_u_59.VREnabled then
				if v_u_13 then
					v_u_131:SetAttribute("Draggable", true)
				else
					v_u_131.Draggable = true
				end
			end
			if p176.AssignToolData then
				p176.AssignToolData()
			end
			if p176.Tool then
				v_u_131.FavIcon.Visible = p176.Tool:GetAttribute(v_u_4.Favorite)
			end
			p176:UpdateEquipView()
		end
	end
	function v_u_130.Clear(p177)
		-- upvalues: (ref) v_u_135, (ref) v_u_136, (ref) v_u_133, (ref) v_u_134, (ref) v_u_138, (ref) v_u_13, (ref) v_u_131, (ref) v_u_88, (ref) v_u_101, (ref) v_u_91, (ref) v_u_72, (ref) v_u_66, (ref) v_u_87, (ref) v_u_86
		if not p177.Tool then
			return
		end
		if v_u_135 then
			v_u_135:disconnect()
			v_u_135 = nil
		end
		if v_u_136 then
			v_u_136:disconnect()
			v_u_136 = nil
		end
		v_u_133.Image = ""
		v_u_134.Text = ""
		if v_u_138 then
			v_u_138.Text = ""
			v_u_138.Visible = false
		end
		if v_u_13 then
			v_u_131:SetAttribute("Draggable", false)
		else
			v_u_131.Draggable = false
		end
		v_u_131.FavIcon.Visible = false
		v_u_88[p177.Tool] = nil
		p177.Tool = nil
		p177:UpdateEquipView(true)
		if p177.Index <= v_u_101 then
			v_u_91 = v_u_91 - 1
			if v_u_91 < 1 then
				v_u_72 = false
				v_u_66:UnbindAction("RBXHotbarEquip")
			end
		end
		for v178 = 1, v_u_101 do
			v179 = v_u_86[v178]
			if not v179.Tool then
				::l19::
				v_u_87 = v179
				return
			end
		end
		local v179 = nil
		goto l19
	end
	function v_u_130.UpdateEquipView(p180, p181)
		-- upvalues: (ref) v_u_82, (ref) v_u_103, (copy) v_u_130, (ref) v_u_137, (ref) v_u_107, (ref) v_u_131, (ref) v_u_38, (copy) v_u_150
		if not p181 then
			local v182 = p180.Tool
			if v182 then
				v182 = v182.Parent == v_u_82
			end
			if v182 and not p180.Hidden then
				v_u_103 = v_u_130
				if not v_u_137 then
					v_u_137 = v_u_107("Frame", "Equipped")
					v_u_137.ZIndex = v_u_131.ZIndex
					local v183 = Instance.new("UICorner")
					v183.CornerRadius = script:GetAttribute("CornerRadius")
					v183.Parent = v_u_137
					local v184 = Instance.new("UIStroke")
					v184.Name = "EquippedStroke"
					v184.Color = v_u_38
					v184.Thickness = 3
					v184.Parent = v_u_137
				end
				v_u_137.Parent = v_u_131
				task.defer(function()
					-- upvalues: (ref) v_u_137
					local v185 = v_u_137:FindFirstChild("EquippedStroke")
					if v185 then
						v185.Thickness = 3
					end
				end)
				::l11::
				v_u_150()
				return
			end
		end
		if v_u_137 then
			v_u_137.Parent = nil
		end
		goto l11
	end
	function v_u_130.IsEquipped(p186)
		-- upvalues: (ref) v_u_82
		local v187 = p186.Tool
		if v187 then
			v187 = v187.Parent == v_u_82
		end
		return v187
	end
	function v_u_130.Delete(p188)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_85, (ref) v_u_21, (ref) v_u_86, (ref) v_u_119
		if v_u_90[v_u_131] then
			v_u_90[v_u_131] = nil
			v_u_85:unlock()
			if v_u_21 then
				v_u_21:Destroy()
				v_u_21 = nil
			end
		end
		local v189 = p188.Index
		v_u_131:Destroy()
		table.remove(v_u_86, v189)
		for v190 = v189, #v_u_86 do
			local v191 = v_u_86[v190]
			if v191 then
				v191:UpdateIndex(v190)
			end
		end
		v_u_119()
	end
	function v_u_130.Swap(p192, p193)
		local v194 = p192.Tool
		local v195 = p193.Tool
		p192:Clear()
		if v195 then
			p193:Clear()
			p192:Fill(v195)
		end
		if v194 then
			p193:Fill(v194)
		else
			p193:Clear()
		end
	end
	function v_u_130.TurnNumber(_, p196)
		-- upvalues: (ref) v_u_139
		if v_u_139 then
			v_u_139.Visible = p196
		end
	end
	function v_u_130.SetClickability(p197, p198)
		-- upvalues: (ref) v_u_59, (ref) v_u_13, (ref) v_u_131, (copy) v_u_150
		if p197.Tool then
			if v_u_59.VREnabled then
				if v_u_13 then
					v_u_131:SetAttribute("Draggable", false)
				else
					v_u_131.Draggable = false
				end
			elseif v_u_13 then
				v_u_131:SetAttribute("Draggable", not p198)
			else
				v_u_131.Draggable = not p198
			end
			v_u_150()
		end
	end
	local v_u_199 = require(v_u_61.Modules.ItemRarityFinder)
	local v_u_200 = require(v_u_61.Data.EnumRegistry.ReversedItemTypeEnums)
	local v_u_201 = require(v_u_61.Modules.PetTraitsData)
	function v_u_130.CheckTerms(p202, p203, p204)
		-- upvalues: (ref) v_u_4, (copy) v_u_200, (copy) v_u_199, (ref) v_u_8, (copy) v_u_201, (ref) v_u_134, (ref) v_u_138
		if not (p203 and next(p203)) then
			return 0
		end
		local v205 = 0
		local v206 = p202.Tool
		if not v206 then
			return v205
		end
		local v207 = v206:GetAttribute(v_u_4.ItemName)
		local v208 = v_u_200[v206:GetAttribute(v_u_4.ITEM_TYPE)]
		local v209
		if v207 and v208 then
			v209 = v_u_199(v207, v208)
		else
			v209 = nil
		end
		local v210 = nil
		if v207 and (v208 == "Holdable" or v208 == "Seed") then
			v210 = v_u_8.GetTraitsAsString(v207)
		elseif v207 and v208 == "Pet" then
			v210 = v_u_201.GetTraitsAsString(v207)
		end
		local v211 = v205
		for v212 in p203 do
			local _, v213 = v206.Name:lower():gsub(v212, "")
			v205 = v211 + v213
			if p204 then
				local _ = 0 < v205
			end
			local _, v214 = v_u_134.Text:lower():gsub(v212, "")
			v205 = v205 + v214
			if p204 then
				local _ = 0 < v205
			end
			if v206:IsA("Tool") then
				local v215 = v206.ToolTip or ""
				local v216 = v_u_138 and v_u_138.Text or ""
				local _, v217 = v215:lower():gsub(v212, "")
				v205 = v205 + v217
				if p204 then
					local _ = 0 < v205
				end
				local _, v218 = v216:lower():gsub(v212, "")
				v205 = v205 + v218
				if p204 then
					local _ = 0 < v205
					v211 = v205
				else
					v211 = v205
				end
			else
				v211 = v205
			end
			if v207 then
				local _, v219 = v207:lower():gsub(v212, "")
				v205 = v211 + v219
				if p204 then
					local _ = 0 < v205
					v211 = v205
				else
					v211 = v205
				end
			end
			if v210 then
				local _, v220 = v210:lower():gsub(v212, "")
				v205 = v211 + v220
				if p204 then
					local _ = 0 < v205
					v211 = v205
				else
					v211 = v205
				end
			end
			if v209 then
				local _, v221 = v209:lower():gsub(v212, "")
				v205 = v211 + v221
				if p204 and v205 > 0 then
					v211 = v205
				else
					v211 = v205
				end
			end
		end
		return v211
	end
	function v_u_130.Select(p222)
		-- upvalues: (copy) v_u_130, (ref) v_u_50, (ref) v_u_82, (ref) v_u_83, (ref) v_u_84, (ref) v_u_6, (ref) v_u_32, (ref) v_u_23
		local v223 = v_u_130.Tool
		if v223 then
			v_u_50 = p222
			local v224
			if v223 then
				v224 = v223.Parent == v_u_82
			else
				v224 = v223
			end
			if v224 then
				v_u_50 = nil
				if v_u_83 then
					v_u_83:UnequipTools()
					return
				end
			elseif v223.Parent == v_u_84 then
				if v_u_6:AddFromTool(v223) then
					v_u_32 = true
					return
				end
				if v_u_23 then
					return
				end
				if v_u_83 then
					v_u_83:UnequipTools()
				end
				v223.Parent = v_u_82
			end
		end
	end
	v_u_131 = v_u_107("TextButton", v129)
	local v_u_225 = Instance.new("UIStroke")
	v_u_225.Parent = v_u_131
	local v226 = Instance.new("UICorner")
	v226.CornerRadius = script:GetAttribute("CornerRadius")
	v226.Parent = v_u_131
	v_u_225.Thickness = 0
	v_u_131.BackgroundColor3 = v_u_36.BACKGROUND_COLOR
	v_u_225.Color = v_u_40
	v_u_131.Text = ""
	v_u_131.AutoButtonColor = false
	v_u_131.BorderSizePixel = 0
	v_u_131.Size = UDim2.new(0, v_u_36.ICON_SIZE, 0, v_u_36.ICON_SIZE)
	v_u_131.Active = true
	v_u_131.Draggable = false
	if v_u_13 then
		v_u_131:SetAttribute("Draggable", false)
	end
	v_u_131.BackgroundTransparency = v_u_39
	v_u_131.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_130
		changeSlot(v_u_130)
	end)
	local v_u_227 = os.clock()
	if v_u_59.TouchEnabled then
		local v228 = v_u_131
		v228.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_227, (ref) v_u_126, (copy) v_u_130
			if os.clock() > v_u_227 + 0.25 then
				v_u_227 = os.clock()
			else
				v_u_126(v_u_130)
			end
		end)
		v228.TouchLongPress:Connect(function(_, p229, _)
			-- upvalues: (ref) v_u_126, (copy) v_u_130
			if p229 == Enum.UserInputState.End then
				v_u_126(v_u_130)
			end
		end)
	else
		v_u_131.MouseButton2Click:Connect(function()
			-- upvalues: (ref) v_u_126, (copy) v_u_130
			v_u_126(v_u_130)
		end)
	end
	v_u_130.Frame = v_u_131
	local v230 = v_u_107("Frame", "SelectionObjectClipper")
	v230.Visible = false
	v230.Parent = v_u_131
	local v231 = v_u_107("ImageLabel", "Selector")
	v231.Size = UDim2.new(1, 0, 1, 0)
	v231.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	v231.ScaleType = Enum.ScaleType.Slice
	v231.SliceCenter = Rect.new(12, 12, 52, 52)
	v231.Parent = v230
	v_u_133 = v_u_107("ImageLabel", "Icon")
	v_u_133.Size = UDim2.new(0.8, 0, 0.8, 0)
	v_u_133.Position = UDim2.new(0.1, 0, 0.1, 0)
	v_u_133.Parent = v_u_131
	local v232 = v_u_107("ImageLabel", "FavIcon")
	v232.Size = UDim2.new(0.2, 0, 0.2, 0)
	v232.Position = UDim2.new(0.8, 0, 0.8, 0)
	v232.Parent = v_u_131
	v232.Visible = false
	v232.Image = "rbxassetid://80131230547874"
	v232.ImageColor3 = Color3.fromRGB(255, 0, 0)
	v232.ZIndex = 10
	v_u_140.Parent = v_u_131
	v_u_134 = v_u_107("TextLabel", "ToolName")
	v_u_134.Size = UDim2.new(1, -2, 1, -2)
	v_u_134.Position = UDim2.new(0, 1, 0, 1)
	v_u_134.Parent = v_u_131
	v_u_130.Frame.LayoutOrder = v_u_130.Index
	if v129 <= v_u_101 then
		v_u_138 = v_u_107("TextLabel", "ToolTip")
		v_u_138.ZIndex = 2
		v_u_138.FontFace = script:GetAttribute("ToolTipFont")
		v_u_138.RichText = true
		v_u_138.TextWrapped = false
		v_u_138.TextYAlignment = Enum.TextYAlignment.Center
		v_u_138.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		v_u_138.BackgroundTransparency = 0
		v_u_138.Visible = false
		v_u_138.Parent = v_u_131
		local v233 = Instance.new("UICorner")
		v233.CornerRadius = script:GetAttribute("CornerRadius")
		v233.Parent = v_u_138
		v_u_131.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_138
			if v_u_138.Text ~= "" then
				v_u_138.Visible = true
			end
		end)
		v_u_131.MouseLeave:Connect(function()
			-- upvalues: (ref) v_u_138
			v_u_138.Visible = false
		end)
		function v_u_130.MoveToInventory(p234)
			-- upvalues: (copy) v_u_130, (ref) v_u_101, (ref) v_u_298, (ref) v_u_80, (ref) v_u_82, (ref) v_u_83, (ref) v_u_95
			if v_u_101 < v_u_130.Index then
				return nil
			end
			local v235 = p234.Tool
			p234:Clear()
			local v236 = v_u_298(v_u_80)
			v236:Fill(v235)
			if v235 then
				v235 = v235.Parent == v_u_82
			end
			if v235 and v_u_83 then
				v_u_83:UnequipTools()
			end
			if v_u_95 then
				v236.Frame.Visible = false
			end
			return v236
		end
		if v129 < 10 or v129 == v_u_101 then
			local v237 = v129 < 10 and (v129 or 0) or 0
			v_u_139 = v_u_107("TextLabel", "Number")
			v_u_139.Text = v237
			v_u_139.Size = UDim2.new(0, 15, 0, 15)
			v_u_139.Visible = false
			v_u_139.Parent = v_u_131
			v_u_89[v_u_56 + v237] = v_u_130.Select
		end
	end
	local v_u_238 = v_u_131.Position
	local v_u_239 = 0
	local v_u_240 = nil
	local v_u_241 = nil
	local function v_u_247(p242)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_238, (copy) v_u_225, (ref) v_u_85, (ref) v_u_241, (copy) v_u_130, (ref) v_u_74, (ref) v_u_132, (ref) v_u_133, (ref) v_u_134, (ref) v_u_139, (ref) v_u_137, (ref) v_u_240, (ref) v_u_80, (ref) v_u_77, (ref) v_u_107, (ref) v_u_21
		v_u_90[v_u_131] = true
		v_u_238 = p242
		v_u_225.Thickness = 2
		v_u_85:lock()
		if v_u_241 then
			v_u_241:Disconnect()
			v_u_241 = nil
		end
		if v_u_130.Tool then
			v_u_241 = v_u_130.Tool.AncestryChanged:Connect(function(p243, _)
				-- upvalues: (ref) v_u_130, (ref) v_u_241, (ref) v_u_74, (ref) v_u_132
				if v_u_130.Tool and p243 == v_u_130.Tool then
					local v244 = v_u_130.Tool.Parent
					if v244 ~= v_u_74.Backpack and v244 ~= v_u_74.Character then
						if v_u_132 then
							v_u_132:Destroy()
							v_u_132 = nil
						end
						if v_u_241 then
							v_u_241:Disconnect()
							v_u_241 = nil
						end
					end
				elseif v_u_241 then
					v_u_241:Disconnect()
					v_u_241 = nil
				end
			end)
		elseif v_u_241 then
			v_u_241:Disconnect()
			v_u_241 = nil
		end
		v_u_131.ZIndex = 2
		v_u_133.ZIndex = 2
		v_u_134.ZIndex = 2
		v_u_131.Parent.ZIndex = 2
		if v_u_139 then
			v_u_139.ZIndex = 2
		end
		if v_u_137 then
			v_u_137.ZIndex = 2
			for _, v245 in v_u_137:GetChildren() do
				if not (v245:IsA("UICorner") or v245:IsA("UIStroke")) then
					v245.ZIndex = 2
				end
			end
		end
		v_u_240 = v_u_131.Parent
		if v_u_240 == v_u_80 then
			local _ = v_u_131.AbsolutePosition
			local v246 = UDim2.new(0, v_u_131.AbsolutePosition.X - v_u_77.AbsolutePosition.X, 0, v_u_131.AbsolutePosition.Y - v_u_77.AbsolutePosition.Y)
			v_u_131.Parent = v_u_77
			v_u_131.Position = v246
			v_u_132 = v_u_107("Frame", "FakeSlot")
			v_u_132.LayoutOrder = v_u_131.LayoutOrder
			v_u_132.Size = v_u_131.Size
			v_u_132.BackgroundTransparency = 1
			v_u_132.Parent = v_u_80
			v_u_21 = v_u_132
		end
	end
	local function v_u_280(p248)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_132, (ref) v_u_241, (ref) v_u_238, (ref) v_u_240, (copy) v_u_225, (ref) v_u_85, (ref) v_u_133, (ref) v_u_134, (ref) v_u_139, (ref) v_u_137, (copy) v_u_130, (ref) v_u_77, (ref) v_u_101, (ref) v_u_4, (ref) v_u_5, (ref) v_u_22, (ref) v_u_17, (ref) v_u_239, (ref) v_u_87, (ref) v_u_76, (ref) v_u_86, (ref) v_u_82, (ref) v_u_83, (ref) v_u_95
		v_u_90[v_u_131] = nil
		if v_u_132 then
			v_u_132:Destroy()
			v_u_132 = nil
		end
		if v_u_241 then
			v_u_241:Disconnect()
			v_u_241 = nil
		end
		local v249 = tick()
		v_u_131.Position = v_u_238
		if v_u_240 and v_u_131.Parent ~= v_u_240 then
			v_u_131.Parent = v_u_240
		end
		v_u_225.Thickness = 0
		v_u_85:unlock()
		v_u_131.ZIndex = 1
		v_u_133.ZIndex = 1
		v_u_134.ZIndex = 1
		if v_u_240 then
			v_u_240.ZIndex = 1
		end
		if v_u_139 then
			v_u_139.ZIndex = 1
		end
		if v_u_137 then
			v_u_137.ZIndex = 1
			for _, v250 in v_u_137:GetChildren() do
				if not (v250:IsA("UICorner") or v250:IsA("UIStroke")) then
					v250.ZIndex = 1
				end
			end
		end
		if v_u_130.Tool then
			local v251 = v_u_77
			local v252 = p248.X
			local v253 = p248.Y
			local v254 = v251.AbsolutePosition
			local v255 = v251.AbsoluteSize
			local v256
			if v254.X < v252 and (v252 <= v254.X + v255.X and v254.Y < v253) then
				v256 = v253 <= v254.Y + v255.Y
			else
				v256 = false
			end
			if v256 then
				if v_u_130.Index <= v_u_101 then
					local v257 = v_u_130:MoveToInventory()
					local v258 = not v257.Tool or v257.Tool:GetAttribute(v_u_4.ITEM_UUID) or (v257.Tool:GetAttribute("PET_UUID") or v257.Tool:GetAttribute("UUID"))
					if v258 then
						v_u_5:MoveEntry(v258, v257.Index)
					end
					v_u_22.Text = ""
					if v_u_17 then
						task.delay(0.01, v_u_17, true)
					end
				end
				if v_u_101 < v_u_130.Index and v249 - v_u_239 < 0.5 then
					if v_u_87 then
						local v259 = v_u_130.Tool
						local v260 = v259:GetAttribute(v_u_4.ITEM_UUID) or (v259:GetAttribute("PET_UUID") or v259:GetAttribute("UUID"))
						local v261 = v_u_87.Index
						v_u_130:Clear()
						v_u_87:Fill(v259)
						v_u_130:Delete()
						if v260 then
							v_u_5:MoveEntry(v260, v261)
							v249 = 0
						else
							v249 = 0
						end
					else
						v249 = 0
					end
				end
			else
				local v262 = v_u_76
				local v263 = p248.X
				local v264 = p248.Y
				local v265 = v262.AbsolutePosition
				local v266 = v262.AbsoluteSize
				local v267
				if v265.X < v263 and (v263 <= v265.X + v266.X and v265.Y < v264) then
					v267 = v264 <= v265.Y + v266.Y
				else
					v267 = false
				end
				if v267 then
					local v268 = {
						["Magnitude"] = (1 / 0),
						["Slot"] = nil
					}
					for _, v269 in v_u_86 do
						if v_u_101 >= v269.Index then
							local v270 = v269.Frame
							local v271 = (v270.AbsolutePosition + v270.AbsoluteSize / 2 - p248).magnitude
							if v271 < v268.Magnitude then
								v268.Magnitude = v271
								v268.Slot = v269
							end
						end
					end
					local v272 = v268.Slot
					if not v272 or v272 == v_u_130 then
						return
					end
					local v273 = not v_u_130.Tool or v_u_130.Tool:GetAttribute(v_u_4.ITEM_UUID) or (v_u_130.Tool:GetAttribute("PET_UUID") or v_u_130.Tool:GetAttribute("UUID"))
					local v274 = not v272.Tool or v272.Tool:GetAttribute(v_u_4.ITEM_UUID) or (v272.Tool:GetAttribute("PET_UUID") or v272.Tool:GetAttribute("UUID"))
					local v275 = v272.Index
					local v276 = v_u_130.Index
					v_u_130:Swap(v272)
					if v273 then
						v_u_5:MoveEntry(v273, v275)
					end
					if v274 then
						task.wait()
						v_u_5:MoveEntry(v274, v276)
					end
					if v_u_101 < v_u_130.Index then
						local v277 = v_u_130.Tool
						if v277 then
							if v277 then
								v277 = v277.Parent == v_u_82
							end
							if v277 and v_u_83 then
								v_u_83:UnequipTools()
							end
							if v_u_95 then
								v_u_130.Frame.Visible = false
							end
						else
							v_u_130:Delete()
						end
					end
				elseif v_u_130.Index <= v_u_101 then
					local v278 = v_u_130:MoveToInventory()
					local v279 = not v278.Tool or v278.Tool:GetAttribute(v_u_4.ITEM_UUID) or (v278.Tool:GetAttribute("PET_UUID") or v278.Tool:GetAttribute("UUID"))
					if v279 then
						v_u_5:MoveEntry(v279, v278.Index)
					end
					if v_u_17 then
						task.delay(0.01, v_u_17, true)
					end
				elseif v_u_130.Tool and (v_u_130.Tool:IsA("Tool") and v_u_130.Tool.CanBeDropped) then
					v_u_130.Tool.Parent = workspace
				end
			end
			v_u_239 = v249
			if v_u_17 then
				task.delay(0.01, v_u_17, true)
			end
		end
	end
	if v_u_13 then
		local v_u_281 = nil
		local v_u_282 = nil
		local v_u_283 = nil
		local v_u_284 = nil
		local v_u_285 = nil
		v_u_131.InputBegan:Connect(function(p_u_286)
			-- upvalues: (ref) v_u_131, (ref) v_u_282, (ref) v_u_59, (copy) v_u_247, (ref) v_u_281, (ref) v_u_284, (ref) v_u_285, (ref) v_u_283, (copy) v_u_280
			if v_u_131:GetAttribute("Draggable") then
				if p_u_286.UserInputType == Enum.UserInputType.MouseButton1 or (p_u_286.UserInputType == Enum.UserInputType.Touch or p_u_286.KeyCode == Enum.KeyCode.ButtonA) then
					v_u_282 = true
					local v_u_291 = v_u_59.InputChanged:Connect(function(p287)
						-- upvalues: (ref) v_u_282, (ref) v_u_247, (ref) v_u_131, (ref) v_u_281, (ref) v_u_284, (ref) v_u_59, (ref) v_u_285
						if v_u_282 then
							v_u_282 = false
							v_u_247(v_u_131.Position)
							v_u_281 = true
							v_u_284 = v_u_59:GetMouseLocation()
							v_u_285 = v_u_131.Position
						end
						if v_u_281 and (p287.UserInputType == Enum.UserInputType.MouseMovement or (p287.UserInputType == Enum.UserInputType.Touch or string.find(p287.UserInputType.Name, "Gamepad"))) then
							local v288 = v_u_59:GetMouseLocation()
							local v289 = v_u_285
							if v289 then
								v289 = v_u_284
							end
							assert(v289)
							local v290 = v288 - v_u_284
							v_u_131.Position = UDim2.new(v_u_285.X.Scale, v_u_285.X.Offset + v290.X, v_u_285.Y.Scale, v_u_285.Y.Offset + v290.Y)
						end
					end)
					local v_u_292 = nil
					v_u_292 = p_u_286:GetPropertyChangedSignal("UserInputState"):Connect(function()
						-- upvalues: (ref) v_u_281, (ref) v_u_282, (ref) v_u_292, (copy) p_u_286, (copy) v_u_291, (ref) v_u_283, (ref) v_u_285, (ref) v_u_280
						if v_u_281 or v_u_282 then
							if p_u_286.UserInputState == Enum.UserInputState.End then
								v_u_291:Disconnect()
								local v293 = v_u_281
								v_u_282 = nil
								v_u_281 = nil
								v_u_283 = nil
								v_u_285 = nil
								if v_u_292 then
									v_u_292:Disconnect()
									v_u_292 = nil
								end
								if v293 then
									v_u_280(Vector2.new(p_u_286.Position.X, p_u_286.Position.Y))
								end
							end
						elseif v_u_292 then
							v_u_292:Disconnect()
							v_u_292 = nil
						end
					end)
				end
			end
		end)
	else
		v_u_131.DragBegin:Connect(function(p294)
			-- upvalues: (copy) v_u_247
			v_u_247(p294)
		end)
		v_u_131.DragStopped:Connect(function(p295, p296)
			-- upvalues: (copy) v_u_280
			v_u_280(Vector2.new(p295, p296))
		end)
	end
	v_u_131.Parent = p127
	v_u_86[v129] = v_u_130
	if v_u_101 < v129 then
		v_u_119()
		if v_u_77.Visible and not v_u_95 then
			local v297 = v_u_79.CanvasSize.Y.Offset - v_u_79.AbsoluteSize.Y
			v_u_79.CanvasPosition = Vector2.new(0, (math.max(0, v297)))
		end
	end
	return v_u_130
end
local v_u_299 = nil
local function v_u_310(p300)
	-- upvalues: (ref) v_u_82, (ref) v_u_83, (ref) v_u_99, (ref) v_u_79, (ref) v_u_92, (copy) v_u_88, (copy) v_u_74, (ref) v_u_87, (copy) v_u_298, (ref) v_u_80, (copy) v_u_86, (ref) v_u_84, (copy) v_u_114, (ref) v_u_33, (copy) v_u_101, (ref) v_u_77, (ref) v_u_299
	if p300:IsA("Tool") then
		local _ = p300.Parent
		if p300.Parent == v_u_82 then
			v_u_99 = tick()
		end
		local v301 = v_u_79
		local v302 = v_u_79.CanvasPosition
		if not v_u_92 and (p300.Parent == v_u_82 and not v_u_88[p300]) then
			local v303 = v_u_74:FindFirstChild("StarterGear")
			if v303 and v303:FindFirstChild(p300.Name) then
				v_u_92 = true
				for v304 = (v_u_87 or v_u_298(v_u_80)).Index, 1, -1 do
					local v305 = v_u_86[v304]
					local v306 = v304 - 1
					if v306 > 0 then
						v_u_86[v306]:Swap(v305)
					else
						v305:Fill(p300)
					end
				end
				for _, v307 in pairs(v_u_82:GetChildren()) do
					if v307:IsA("Tool") and v307 ~= p300 then
						v307.Parent = v_u_84
					end
				end
				v_u_114()
				v301.CanvasPosition = v302
				v_u_33 = true
				return
			end
		end
		local v308 = v_u_88[p300]
		if v308 then
			v308:UpdateEquipView()
		else
			local v309 = v_u_87 or v_u_298(v_u_80)
			v309:Fill(p300)
			if v309.Index <= v_u_101 and not v_u_77.Visible then
				v_u_114()
				v301.CanvasPosition = v302
			end
		end
		if v_u_299 and coroutine.status(v_u_299) == "suspended" then
			task.cancel(v_u_299)
			v_u_299 = nil
		end
		v_u_299 = task.delay(0.2, function()
			-- upvalues: (ref) v_u_33
			v_u_33 = true
		end)
	elseif p300:IsA("Humanoid") and p300.Parent == v_u_82 then
		v_u_83 = p300
	end
end
local function v_u_314(p_u_311)
	-- upvalues: (ref) v_u_99, (ref) v_u_82, (ref) v_u_84, (copy) v_u_88, (copy) v_u_101, (ref) v_u_77, (copy) v_u_114
	if p_u_311:IsA("Tool") then
		v_u_99 = tick()
		local v312 = p_u_311.Parent
		if v312 ~= v_u_82 and v312 ~= v_u_84 then
			local v_u_313 = v_u_88[p_u_311]
			if v_u_313 then
				task.defer(function()
					-- upvalues: (ref) v_u_88, (copy) p_u_311, (copy) v_u_313, (ref) v_u_101, (ref) v_u_77, (ref) v_u_114
					if v_u_88[p_u_311] == v_u_313 then
						v_u_313:Clear()
						if v_u_101 < v_u_313.Index then
							v_u_313:Delete()
							return
						end
						if not v_u_77.Visible then
							v_u_114()
						end
					end
				end)
			end
		end
	else
		return
	end
end
local function v355(p315)
	-- upvalues: (copy) v_u_86, (copy) v_u_101, (ref) v_u_87, (ref) v_u_91, (copy) v_u_97, (ref) v_u_82, (ref) v_u_84, (copy) v_u_74, (copy) v_u_5, (copy) v_u_4, (copy) v_u_298, (ref) v_u_80, (copy) v_u_314, (copy) v_u_310, (copy) v_u_114, (copy) v_u_122
	for v316 = #v_u_86, v_u_101 + 1, -1 do
		if v_u_86[v316] then
			v_u_86[v316]:Delete()
		end
	end
	for v317 = 1, v_u_101 do
		if v_u_86[v317] and v_u_86[v317].Tool then
			v_u_86[v317]:Clear()
		end
	end
	for v318 = 1, v_u_101 do
		v319 = v_u_86[v318]
		if not v319.Tool then
			goto l14
		end
	end
	local v319 = nil
	::l14::
	v_u_87 = v319
	v_u_91 = 0
	for _, v320 in v_u_97 do
		v320:Disconnect()
	end
	table.clear(v_u_97)
	v_u_82 = p315
	v_u_84 = v_u_74:WaitForChild("Backpack")
	local v321 = v_u_5:GetSortedData()
	if not v321 then
		return
	end
	local v322 = {}
	for _, v323 in v_u_84:GetChildren() do
		if v323:IsA("Tool") then
			local v324 = v323:GetAttribute(v_u_4.ITEM_UUID) or (v323:GetAttribute("PET_UUID") or v323:GetAttribute("UUID"))
			if v324 then
				v322[v324] = v323
			end
		end
	end
	for _, v325 in p315:GetChildren() do
		if v325:IsA("Tool") then
			local v326 = v325:GetAttribute(v_u_4.ITEM_UUID) or (v325:GetAttribute("PET_UUID") or v325:GetAttribute("UUID"))
			if v326 then
				v322[v326] = v325
			end
		end
	end
	local v327 = {}
	for v328, v329 in v321 do
		local v330 = {
			["Index"] = tonumber(v328) or 9999,
			["Guid"] = v329
		}
		table.insert(v327, v330)
	end
	table.sort(v327, function(p331, p332)
		return p331.Index < p332.Index
	end)
	for _, v333 in v327 do
		local v334 = v322[v333.Guid]
		if v334 then
			local v335 = v333.Index
			if v335 > 0 and v335 <= v_u_101 then
				if v_u_86[v335] then
					v_u_86[v335]:Fill(v334)
				end
			else
				v_u_298(v_u_80):Fill(v334)
			end
			v322[v333.Guid] = nil
		end
	end
	for _, v336 in v322 do
		for v337 = 1, v_u_101 do
			v338 = v_u_86[v337]
			if not v338.Tool then
				goto l54
			end
		end
		local v338 = nil
		::l54::
		local v339 = v338 or v_u_298(v_u_80)
		if v339 then
			v339:Fill(v336)
		end
	end
	for v340 = 1, v_u_101 do
		v354 = v_u_86[v340]
		if not v354.Tool then
			::l63::
			v_u_87 = v354
			local v341 = v_u_97
			local v342 = v_u_84.ChildRemoved
			local v343 = v_u_314
			table.insert(v341, v342:Connect(v343))
			local v344 = v_u_97
			local v345 = v_u_84.ChildAdded
			local v346 = v_u_310
			table.insert(v344, v345:Connect(v346))
			local v347 = v_u_97
			local v348 = p315.ChildRemoved
			local v349 = v_u_314
			table.insert(v347, v348:Connect(v349))
			local v350 = v_u_97
			local v351 = p315.ChildAdded
			local v352 = v_u_310
			table.insert(v350, v351:Connect(v352))
			for _, v353 in p315:GetChildren() do
				if not v353:IsA("Tool") then
					v_u_310(v353)
				end
			end
			v_u_114()
			v_u_122()
			return
		end
	end
	local v354 = nil
	goto l63
end
local v_u_356 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
v_u_59:GetMouseLocation()
local function v_u_360(p357)
	-- upvalues: (copy) v_u_59, (copy) v_u_356
	local v358 = v_u_59:GetMouseLocation()
	for _, v359 in v_u_356:GetGuiObjectsAtPosition(v358.X, v358.Y) do
		if v359.Name:find(p357) then
			return v359
		end
	end
end
local function v365(p361, p362)
	-- upvalues: (ref) v_u_94, (ref) v_u_93, (copy) v_u_57, (copy) v_u_89, (ref) v_u_77, (copy) v_u_360, (copy) v_u_85
	if p362 == false then
		local v363 = (p361.KeyCode == Enum.KeyCode.ButtonL2 or p361.UserInputType == Enum.UserInputType.Keyboard and (not v_u_94 and (v_u_93 or p361.KeyCode.Value == v_u_57))) and v_u_89[p361.KeyCode.Value]
		if v363 then
			v363(p362)
		end
		local v364 = p361.UserInputType
		if (v364 == Enum.UserInputType.MouseButton1 or v364 == Enum.UserInputType.Touch) and (v_u_77.Visible and not v_u_360("CategoryFrame")) then
			v_u_85:deselect()
		end
	end
end
local function v369(p366)
	-- upvalues: (copy) v_u_59, (copy) v_u_101, (copy) v_u_86
	if p366 == "KeyboardEnabled" or p366 == "VREnabled" then
		local v367 = v_u_59.KeyboardEnabled
		if v367 then
			v367 = not v_u_59.VREnabled
		end
		for v368 = 1, v_u_101 do
			if v_u_86[v368] then
				v_u_86[v368]:TurnNumber(v367)
			end
		end
	end
end
local v_u_370 = nil
local v_u_371 = nil
local function v_u_372() end
local _ = Vector2.new(0, 0)
function unbindAllGamepadEquipActions()
	-- upvalues: (copy) v_u_66
	v_u_66:UnbindAction("RBXBackpackHasGamepadFocus")
	v_u_66:UnbindAction("RBXCloseInventory")
end
local function v377(p373, p374)
	-- upvalues: (copy) v_u_101, (copy) v_u_86
	for v375 = 1, v_u_101 do
		local v376 = v_u_86[v375]
		if v376 and (v376.Frame and (p374 or v376.Tool)) then
			v376.Frame.Visible = p373
		end
	end
end
function changeToolFunc(_, p378, p_u_379)
	-- upvalues: (ref) v_u_23, (ref) v_u_370, (ref) v_u_371, (ref) v_u_83, (ref) v_u_82, (copy) v_u_88, (copy) v_u_101, (copy) v_u_86, (ref) v_u_103
	if v_u_23 then
		return
	elseif p378 == Enum.UserInputState.Begin then
		if v_u_370 and (v_u_370.KeyCode == Enum.KeyCode.ButtonR1 and p_u_379.KeyCode == Enum.KeyCode.ButtonL1 or v_u_370.KeyCode == Enum.KeyCode.ButtonL1 and p_u_379.KeyCode == Enum.KeyCode.ButtonR1) and tick() - v_u_371 <= 0.06 then
			if v_u_83 then
				v_u_83:UnequipTools()
			end
			v_u_370 = p_u_379
			v_u_371 = tick()
		else
			v_u_370 = p_u_379
			v_u_371 = tick()
			delay(0.06, function()
				-- upvalues: (ref) v_u_370, (copy) p_u_379, (ref) v_u_82, (ref) v_u_83, (ref) v_u_88, (ref) v_u_101, (ref) v_u_86, (ref) v_u_103
				if v_u_370 ~= p_u_379 then
					return
				end
				local v380 = p_u_379.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1
				local v381 = nil
				if v_u_82 and v_u_83 then
					for _, v382 in ipairs(v_u_82:GetChildren()) do
						if v382:IsA("Tool") then
							v381 = v382
							break
						end
					end
				end
				local v383 = -1
				if v381 then
					local v384 = v_u_88[v381]
					if v384 and v384.Index <= v_u_101 then
						v383 = v384.Index
					end
				end
				if v383 == -1 then
					local v385 = (not v_u_103 or (not v_u_103.Tool or v_u_103.Index > v_u_101)) and -1 or v_u_103.Index
					if v385 == -1 then
						for v386 = v380 == -1 and (v_u_101 or 1) or 1, v380 == -1 and 1 or v_u_101, v380 do
							if v_u_86[v386] and v_u_86[v386].Tool then
								v_u_86[v386]:Select()
								return
							end
						end
						if v_u_83 then
							v_u_83:UnequipTools()
						end
						return
					end
					local v387 = v380 + v385
					if v_u_101 < v387 then
						v387 = 1
					elseif v387 < 1 then
						v387 = v_u_101
					end
					local v388 = v387
					local v389 = false
					while true do
						if v_u_86[v387] and v_u_86[v387].Tool then
							v389 = true
							break
						end
						v387 = v387 + v380
						if v_u_101 < v387 then
							v387 = 1
						elseif v387 < 1 then
							v387 = v_u_101
						end
						if v387 == v388 or v389 then
							break
						end
					end
					if v389 then
						v_u_86[v387]:Select()
					elseif v_u_83 then
						v_u_83:UnequipTools()
					end
				else
					local v390 = v380 + v383
					if v_u_101 < v390 then
						v390 = 1
					elseif v390 < 1 then
						v390 = v_u_101
					end
					local v391 = v390
					local v392 = false
					while true do
						if v_u_86[v390] and v_u_86[v390].Tool then
							v392 = true
							break
						end
						v390 = v390 + v380
						if v_u_101 < v390 then
							v390 = 1
						elseif v390 < 1 then
							v390 = v_u_101
						end
						if v390 == v391 or v392 then
							break
						end
					end
					if v392 then
						if v_u_86[v390].Tool == v381 then
							local v393 = 0
							for v394 = 1, v_u_101 do
								if v_u_86[v394] and v_u_86[v394].Tool then
									v393 = v393 + 1
								end
							end
							if v393 <= 1 then
								if v_u_83 then
									v_u_83:UnequipTools()
								end
								v_u_103 = nil
							else
								v_u_86[v390]:Select()
							end
						else
							v_u_86[v390]:Select()
							return
						end
					else
						if v_u_83 then
							v_u_83:UnequipTools()
						end
						v_u_103 = nil
						return
					end
				end
			end)
		end
	else
		return
	end
end
function getGamepadSwapSlot()
	-- upvalues: (copy) v_u_86
	for v395 = 1, #v_u_86 do
		if v_u_86[v395] and (v_u_86[v395].Frame:IsA("GuiButton") and (v_u_86[v395].Frame:FindFirstChild("UIStroke") and v_u_86[v395].Frame.UIStroke.Thickness > 0)) then
			return v_u_86[v395]
		end
	end
end
function changeSlot(p396)
	-- upvalues: (copy) v_u_68, (ref) v_u_77
	if v_u_68.VREnabled then
		local _ = v_u_77.Visible
	end
	p396:Select()
end
function vrMoveSlotToInventory()
	-- upvalues: (copy) v_u_68, (ref) v_u_78
	if v_u_68.VREnabled then
		local v397 = getGamepadSwapSlot()
		if v397 and v397.Tool then
			v397:WaitForChild("UIStroke").Thickness = 0
			v397:MoveToInventory()
			v_u_78.SelectionImageObject.Visible = false
		end
	end
end
function enableGamepadInventoryControl()
	-- upvalues: (ref) v_u_77, (copy) v_u_85, (copy) v_u_66, (copy) v_u_372, (copy) v_u_59, (copy) v_u_63, (ref) v_u_76
	local function v400(_, p398, _)
		-- upvalues: (ref) v_u_77, (ref) v_u_85
		if p398 == Enum.UserInputState.Begin then
			if getGamepadSwapSlot() then
				local v399 = getGamepadSwapSlot()
				if v399 and typeof(v399) == "Instance" then
					v399:WaitForChild("UIStroke").Thickness = 0
					return
				end
			elseif v_u_77.Visible then
				v_u_85:deselect()
			end
		end
	end
	v_u_66:BindAction("RBXBackpackHasGamepadFocus", v_u_372, false, Enum.UserInputType.Gamepad1)
	v_u_66:BindAction("RBXCloseInventory", v400, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	if not v_u_59.VREnabled then
		v_u_63.SelectedObject = v_u_76:FindFirstChild("1")
	end
end
function disableGamepadInventoryControl()
	-- upvalues: (copy) v_u_101, (copy) v_u_86, (copy) v_u_63, (ref) v_u_75
	unbindAllGamepadEquipActions()
	for v401 = 1, v_u_101 do
		local v402 = v_u_86[v401]
		if v402 and v402.Frame then
			v402.Frame:WaitForChild("UIStroke").Thickness = 0
		end
	end
	if v_u_63.SelectedObject and v_u_63.SelectedObject:IsDescendantOf(v_u_75) then
		v_u_63.SelectedObject = nil
	end
end
function gamepadDisconnected()
	-- upvalues: (ref) v_u_98
	v_u_98 = false
	disableGamepadInventoryControl()
end
function gamepadConnected()
	-- upvalues: (ref) v_u_98, (copy) v_u_63, (ref) v_u_75, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (copy) v_u_66, (ref) v_u_77
	v_u_98 = true
	v_u_63:AddSelectionParent("RBXBackpackSelection", v_u_75)
	if v_u_91 >= 1 and (v_u_93 and not v_u_72) then
		v_u_72 = true
		v_u_66:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
	if v_u_77.Visible then
		enableGamepadInventoryControl()
	end
end
local function v_u_411(p403)
	-- upvalues: (copy) v_u_62, (copy) v_u_85, (copy) v_u_63, (ref) v_u_93, (ref) v_u_75, (copy) v_u_96, (ref) v_u_91, (ref) v_u_72, (copy) v_u_66
	local v404 = 0
	local v405 = true
	while true do
		if v404 >= 10 then
			v407 = v405
			break
		end
		local v406, v407 = pcall(function()
			-- upvalues: (ref) v_u_62
			return v_u_62:GetCore("TopbarEnabled")
		end)
		if v406 then
			break
		end
		v404 = v404 + 1
		task.wait(0.1)
	end
	local v408 = p403 and v407
	local v409 = v_u_85
	local v410
	if v408 then
		v410 = not v_u_63.MenuIsOpen
	else
		v410 = v408
	end
	v409:setEnabled(v410)
	v_u_93 = v408
	v_u_75.Visible = v408
	for _, _ in pairs(v_u_96) do

	end
	if v408 then
		if v_u_91 >= 1 and (v_u_93 and not v_u_72) then
			v_u_72 = true
			v_u_66:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			return
		end
	else
		disableGamepadInventoryControl()
		v_u_72 = false
		v_u_66:UnbindAction("RBXHotbarEquip")
	end
end
local function v417(p412, p413)
	-- upvalues: (copy) v_u_107
	local v414 = v_u_107("ImageButton", p412)
	v414.Size = UDim2.new(0, 40, 0, 40)
	v414.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local v415 = v_u_107("ImageLabel", "Icon")
	v415.Size = UDim2.new(0.5, 0, 0.5, 0)
	v415.Position = UDim2.new(0.25, 0, 0.25, 0)
	v415.Image = p413
	v415.Parent = v414
	local v416 = v_u_107("ImageLabel", "Selection")
	v416.Size = UDim2.new(0.9, 0, 0.9, 0)
	v416.Position = UDim2.new(0.05, 0, 0.05, 0)
	v416.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	v414.SelectionImageObject = v416
	return v414, v415, v416
end
local v418 = v_u_107("Frame", "Backpack")
v418.Visible = false
v418.Parent = v65
local v419 = v_u_107("Frame", "Hotbar")
v419.Parent = v418
local v_u_420 = v_u_32
local v421 = v418
local v_u_422 = v419
for v423 = 1, v_u_101 do
	local v424 = v_u_298(v_u_422, v423)
	v424.Frame.Visible = false
	if not v_u_87 then
		local v425 = v424
		v_u_87 = v425
	end
end
v_u_85.selected:Connect(function()
	-- upvalues: (copy) v_u_63, (copy) v_u_34
	if not v_u_63.MenuIsOpen then
		v_u_34.OpenClose()
	end
end)
v_u_85.deselected:Connect(function()
	-- upvalues: (ref) v_u_77, (copy) v_u_34
	if v_u_77.Visible then
		v_u_34.OpenClose()
	end
end)
LeftBumperButton = v_u_107("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = v_u_107("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
local v426 = v_u_107("Frame", "Inventory")
local v427 = Instance.new("UICorner")
v427.CornerRadius = script:GetAttribute("CornerRadius")
v427.Parent = v426
v426.BackgroundTransparency = v_u_36.BACKGROUND_FADE
v426.BackgroundColor3 = v_u_36.BACKGROUND_COLOR
v426.Active = true
v426.Visible = false
v426.Parent = v421
local v_u_428 = game:GetService("TweenService")
require(v_u_61.Item_Module)
local v_u_429 = script.CategoryTemplate:Clone()
v_u_429.Parent = v426
local function v_u_432(p430)
	-- upvalues: (ref) v_u_16, (copy) v_u_429, (copy) v_u_14, (copy) v_u_11, (ref) v_u_420
	if v_u_16 ~= p430 then
		local v431 = v_u_16
		v_u_16 = p430
		v_u_429.Text = ("%* Items"):format(v_u_14[p430].Display or p430)
		v_u_11:Fire(p430, v431)
		v_u_420 = true
	end
end
v_u_34.UpdateCategory = v_u_432
function v_u_34.GetCategory()
	-- upvalues: (ref) v_u_16
	return v_u_16
end
function v_u_34.SetTrading(p433)
	-- upvalues: (ref) v_u_23, (copy) v_u_12, (ref) v_u_16, (copy) v_u_34, (ref) v_u_420
	v_u_23 = p433
	v_u_12:Fire(p433)
	if p433 or v_u_16 ~= "PetsOnly" then
		if p433 and v_u_16 == "Pet" then
			v_u_34.UpdateCategory("PetsOnly")
		elseif p433 and (v_u_16 ~= "PetsOnly" and v_u_16 ~= "Fruit") then
			v_u_34.UpdateCategory("Fruit")
		end
	else
		v_u_34.UpdateCategory("Pet")
	end
	v_u_420 = true
end
local v434 = script.CategoryFrame:Clone()
v434.Size = v73 and UDim2.fromScale(0.08, 1) or v434.Size
v434.Parent = v426
local v435 = v434.CategoryTemplate
local v_u_436 = v426
local function v444(p437, p438)
	local v439, v440, v441 = p437:ToHSV()
	local v442 = v441 + p438
	local v443 = math.clamp(v442, 0, 1)
	return Color3.fromHSV(v439, v440, v443)
end
local function v448(p445, p446)
	-- upvalues: (ref) v_u_23
	local v447
	if v_u_23 then
		v447 = p446.Name == "PetsOnly" and true or p446.Name == "Fruit"
	else
		v447 = not p446.Hidden
	end
	p445.Visible = v447
end
for _, v_u_449 in v9 do
	local v_u_450 = v_u_449.Name
	local v_u_451 = v435:Clone()
	local v452 = v_u_451.ImageButton
	local v453 = v_u_451.BackgroundColor3
	local v_u_454 = v_u_428:Create(v_u_451, TweenInfo.new(0.2), {
		["BackgroundColor3"] = v444(v453, 0.2)
	})
	local v_u_455 = v_u_428:Create(v_u_451, TweenInfo.new(0.2), {
		["BackgroundColor3"] = v453
	})
	v452.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_454
		v_u_454:Play()
	end)
	v452.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_455
		v_u_455:Play()
	end)
	v452.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_455
		v_u_455:Play()
	end)
	v452.MouseButton1Up:Connect(function()
		-- upvalues: (copy) v_u_454, (ref) v_u_432, (copy) v_u_450
		v_u_454:Play()
		v_u_432(v_u_450)
	end)
	v452.Image = v_u_449.Image
	v448(v_u_451, v_u_449)
	v_u_451.Parent = v434
	v_u_12:Connect(function()
		-- upvalues: (copy) v_u_451, (copy) v_u_449, (ref) v_u_23
		local v456 = v_u_451
		local v457 = v_u_449
		local v458
		if v_u_23 then
			v458 = v457.Name == "PetsOnly" and true or v457.Name == "Fruit"
		else
			v458 = not v457.Hidden
		end
		v456.Visible = v458
	end)
end
local v459 = v_u_107("TextButton", "VRInventorySelector")
v459.Position = UDim2.new(0, 0, 0, 0)
v459.Size = UDim2.new(1, 0, 1, 0)
v459.BackgroundTransparency = 1
v459.Text = ""
v459.Parent = v_u_436
local v460 = v_u_107("ImageLabel", "Selector")
v460.Size = UDim2.new(1, 0, 1, 0)
v460.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
v460.ScaleType = Enum.ScaleType.Slice
v460.SliceCenter = Rect.new(12, 12, 52, 52)
v460.Visible = false
v459.SelectionImageObject = v460
v459.MouseButton1Click:Connect(function()
	vrMoveSlotToInventory()
end)
local v_u_461 = v_u_107("ScrollingFrame", "ScrollingFrame")
v_u_461.Selectable = false
v_u_461.CanvasSize = UDim2.new(0, 0, 0, 0)
v_u_461.Parent = v_u_436
local v462 = v_u_107("Frame", "UIGridFrame")
v462.Selectable = false
v462.Size = UDim2.new(1, -(v_u_36.ICON_BUFFER * 2), 1, 0)
v462.Position = UDim2.new(0, v_u_36.ICON_BUFFER, 0, 0)
v462.Parent = v_u_461
local v463 = Instance.new("UIGridLayout")
v463.SortOrder = Enum.SortOrder.LayoutOrder
v463.CellSize = UDim2.new(0, v_u_36.ICON_SIZE, 0, v_u_36.ICON_SIZE)
v463.CellPadding = UDim2.new(0, v_u_36.ICON_BUFFER, 0, v_u_36.ICON_BUFFER)
v463.Parent = v462
local v_u_464 = v417("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_464.Size = UDim2.new(0, 34, 0, 34)
v_u_464.Position = UDim2.new(0.5, -v_u_464.Size.X.Offset / 2, 0, 43)
v_u_464.Icon.Position = v_u_464.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_464.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_461, (copy) v_u_36
	local v465 = v_u_461
	local v466 = Vector2.new
	local v467 = v_u_461.CanvasPosition.X
	local v468 = v_u_461.CanvasSize.Y.Offset - v_u_461.AbsoluteWindowSize.Y
	local v469 = v_u_461.CanvasPosition.Y - (v_u_36.ICON_BUFFER + v_u_36.ICON_SIZE)
	local v470 = math.max(0, v469)
	v465.CanvasPosition = v466(v467, (math.min(v468, v470)))
end)
local v_u_471 = v417("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_471.Rotation = 180
v_u_471.Icon.Position = v_u_471.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_471.Size = UDim2.new(0, 34, 0, 34)
v_u_471.Position = UDim2.new(0.5, -v_u_471.Size.X.Offset / 2, 1, -v_u_471.Size.Y.Offset - 3)
v_u_471.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_461, (copy) v_u_36
	local v472 = v_u_461
	local v473 = Vector2.new
	local v474 = v_u_461.CanvasPosition.X
	local v475 = v_u_461.CanvasSize.Y.Offset - v_u_461.AbsoluteWindowSize.Y
	local v476 = v_u_461.CanvasPosition.Y + (v_u_36.ICON_BUFFER + v_u_36.ICON_SIZE)
	local v477 = math.max(0, v476)
	v472.CanvasPosition = v473(v474, (math.min(v475, v477)))
end)
v_u_461.Changed:Connect(function(p478)
	-- upvalues: (ref) v_u_461, (ref) v_u_464, (ref) v_u_471
	if p478 == "AbsoluteWindowSize" or (p478 == "CanvasPosition" or p478 == "CanvasSize") then
		local v479 = v_u_461.CanvasPosition.Y ~= 0
		local v480 = v_u_461.CanvasPosition.Y < v_u_461.CanvasSize.Y.Offset - v_u_461.AbsoluteWindowSize.Y
		v_u_464.Visible = v479
		v_u_471.Visible = v480
	end
end)
v123()
local v_u_481 = v_u_69:Create("Frame")({
	["Name"] = "GamepadHintsFrame",
	["Size"] = UDim2.new(0, v_u_422.Size.X.Offset, 0, v_u_71 and 95 or 60),
	["BackgroundTransparency"] = 1,
	["Visible"] = false,
	["Parent"] = v421
})
local function v487(p_u_482, p483)
	-- upvalues: (copy) v_u_69, (copy) v_u_481, (copy) v_u_59, (copy) v_u_71, (copy) v_u_34
	local v484 = v_u_69:Create("Frame")({
		["Name"] = "HintFrame",
		["Size"] = UDim2.new(1, 0, 1, -5),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundTransparency"] = 1,
		["Parent"] = v_u_481
	})
	local v_u_485 = v_u_69:Create("ImageLabel")({
		["Name"] = "HintImage",
		["Size"] = UDim2.fromScale(1, 1),
		["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
		["BackgroundTransparency"] = 1,
		["Image"] = v_u_59:GetImageForKeyCode(p_u_482),
		["Parent"] = v484
	})
	local v486 = v_u_69:Create("TextLabel")({
		["Name"] = "HintText",
		["Position"] = UDim2.new(0, v_u_71 and 100 or 70, 0, 0),
		["Size"] = UDim2.new(1, -(v_u_71 and 100 or 70), 1, 0),
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = v_u_71 and Enum.FontSize.Size36 or Enum.FontSize.Size24,
		["BackgroundTransparency"] = 1,
		["Text"] = p483,
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextWrapped"] = true,
		["Parent"] = v484
	})
	Instance.new("UITextSizeConstraint", v486).MaxTextSize = v486.TextSize
	v_u_34.StateChanged.Event:Connect(function()
		-- upvalues: (copy) v_u_485, (ref) v_u_59, (copy) p_u_482
		v_u_485.Image = v_u_59:GetImageForKeyCode(p_u_482)
	end)
end
local function v_u_493()
	-- upvalues: (copy) v_u_481, (ref) v_u_422, (copy) v_u_71, (ref) v_u_436
	v_u_481.Size = UDim2.new(v_u_422.Size.X.Scale, v_u_422.Size.X.Offset, 0, v_u_71 and 95 or 60)
	v_u_481.Position = UDim2.new(v_u_422.Position.X.Scale, v_u_422.Position.X.Offset, v_u_436.Position.Y.Scale, v_u_436.Position.Y.Offset - v_u_481.Size.Y.Offset)
	local v488 = v_u_481:GetChildren()
	local v489 = 0
	for v490 = 1, #v488 do
		v488[v490].Size = UDim2.new(1, 0, 1, -5)
		v488[v490].Position = UDim2.new(0, 0, 0, 0)
		v489 = v489 + (v488[v490].HintText.Position.X.Offset + v488[v490].HintText.TextBounds.X)
	end
	local v491 = (v_u_481.AbsoluteSize.X - v489) / (#v488 - 1)
	for v492 = 1, #v488 do
		v488[v492].Position = v492 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, v488[v492 - 1].Position.X.Offset + v488[v492 - 1].Size.X.Offset + v491, 0, 0)
		v488[v492].Size = UDim2.new(0, v488[v492].HintText.Position.X.Offset + v488[v492].HintText.TextBounds.X, 1, -5)
	end
end
v487(Enum.KeyCode.ButtonX, "Remove From Hotbar")
v487(Enum.KeyCode.ButtonA, "Select/Swap")
v487(Enum.KeyCode.ButtonB, "Close Backpack")
local v494 = v_u_107("Frame", "Search")
local v495 = Instance.new("UICorner")
v495.CornerRadius = script:GetAttribute("CornerRadius")
v495.Parent = v494
v494.BackgroundColor3 = v44
v494.BackgroundTransparency = v45
v494.Size = UDim2.new(0, 190, 0, 30)
v494.Position = UDim2.new(1, -v494.Size.X.Offset - 5, 0, 5)
v494.Parent = v_u_436
local v_u_496 = v_u_107("TextBox", "TextBox")
v_u_496.PlaceholderText = "search"
v_u_496.ClearTextOnFocus = false
v_u_496.FontSize = Enum.FontSize.Size24
v_u_496.TextXAlignment = Enum.TextXAlignment.Left
local v497 = Instance.new("UIPadding")
v497.Parent = v_u_496
v497.PaddingLeft = UDim.new(0, 8)
v_u_496.Size = v494.Size - UDim2.fromOffset(0, 0)
v_u_496.Position = UDim2.new(0, 0, 0, 0)
v_u_496.Parent = v494
local v_u_498 = script.StrokeTemplate:Clone()
v_u_498.Enabled = false
v_u_498.Parent = v494
task.spawn(function()
	-- upvalues: (copy) v_u_498, (copy) v_u_428
	while true do
		repeat
			task.wait()
		until v_u_498.Enabled
		local v499 = v_u_428:Create(v_u_498.UIGradient, TweenInfo.new(0.05), {
			["Rotation"] = v_u_498.UIGradient.Rotation + 1
		})
		v499:Play()
		v499.Completed:Wait()
	end
end)
local _ = v_u_496
local v_u_500 = v_u_107("TextButton", "X")
local v501 = Instance.new("UICorner")
v501.CornerRadius = script:GetAttribute("CornerRadius")
v501.Parent = v_u_500
v_u_500.Text = "X"
v_u_500.ZIndex = 10
v_u_500.TextColor3 = Color3.new(1, 1, 1)
v_u_500.FontSize = Enum.FontSize.Size24
v_u_500.TextYAlignment = Enum.TextYAlignment.Bottom
v_u_500.BackgroundTransparency = 1
v_u_500.Size = UDim2.new(0, v494.Size.Y.Offset - 10, 0, v494.Size.Y.Offset - 10)
v_u_500.Position = UDim2.new(1, -v_u_500.Size.X.Offset - 10, 0.5, -v_u_500.Size.Y.Offset / 2)
v_u_500.Visible = false
v_u_500.BorderSizePixel = 0
v_u_500.Parent = v494
local function v_u_504()
	-- upvalues: (copy) v_u_86, (copy) v_u_6, (copy) v_u_101, (copy) v_u_114
	for v502, v503 in v_u_86 do
		if v503.Tool then
			if v_u_6:IsItemInTradeFromTool(v503.Tool) then
				if v_u_101 < v502 then
					v503.Frame.Visible = false
				elseif not v503.Hidden then
					v503.Hidden = true
					v503:UpdateVisual()
				end
			elseif v502 <= v_u_101 and v503.Hidden then
				v503.Hidden = false
				v503:UpdateVisual()
			end
		end
	end
	v_u_114()
end
local function v_u_522(_)
	-- upvalues: (copy) v_u_496, (copy) v_u_101, (copy) v_u_86, (ref) v_u_95, (copy) v_u_31, (ref) v_u_18, (ref) v_u_19, (copy) v_u_8, (copy) v_u_504, (copy) v_u_119, (copy) v_u_500
	local v505 = v_u_496.Text
	local v506 = {}
	for v507 in v505:gmatch("%S+") do
		v506[v507:lower()] = true
	end
	local v508 = {}
	for v509 = v_u_101 + 1, #v_u_86 do
		local v510 = v_u_86[v509]
		local v511 = { v510, (v510:CheckTerms(v506, true)) }
		table.insert(v508, v511)
	end
	table.sort(v508, function(p512, p513)
		return p512[2] > p513[2]
	end)
	v_u_95 = true
	for _, v514 in v508 do
		local v515 = v514[1]
		local v516 = v514[2]
		local v517 = v515.Favorite
		local v518 = v_u_31(v515.Tool)
		if (v516 > 0 or v505 == "") and (v518 and (v_u_18 ~= "Favorited" or v517) and (v_u_18 ~= "NonFavorited" or not v517)) then
			if v_u_19 then
				local v519 = v515.Tool
				local v520
				if v519 then
					local v521 = not v519:GetAttribute("Seed") and v519:FindFirstChild("Item_String")
					if v521 then
						v521 = v519.Item_String.Value
					end
					v520 = v521 and v_u_8.EasterSlot[v521] == true and true or false
				else
					v520 = false
				end
				if v520 then
					goto l18
				end
				goto l11
			end
			::l18::
			v515.Frame.Visible = true
		else
			::l11::
			v515.Frame.Visible = false
		end
	end
	v_u_504()
	v_u_119()
	v_u_500.ZIndex = 3
end
local function v523(...)
	-- upvalues: (copy) v_u_522
	debug.profilebegin("UpdateFunction")
	v_u_522(...)
	debug.profileend()
end
v_u_34.UpdateFunction = v523
local function v_u_526()
	-- upvalues: (ref) v_u_95, (copy) v_u_101, (copy) v_u_86, (ref) v_u_16, (copy) v_u_31, (copy) v_u_504, (copy) v_u_500, (copy) v_u_119
	v_u_95 = false
	for v524 = v_u_101 + 1, #v_u_86 do
		local v525 = v_u_86[v524]
		if v525 and v525.Tool then
			if v_u_16 == "All" then
				v525.Frame.LayoutOrder = v525.Index
				v525.Frame.Visible = true
			elseif v_u_16 ~= "All" then
				if v_u_31(v525.Tool) then
					v525.Frame.Visible = true
				else
					v525.Frame.Visible = false
				end
			end
		end
	end
	v_u_504()
	v_u_500.ZIndex = 0
	v_u_119()
end
local v_u_527 = v_u_526
v_u_500.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_526, (copy) v_u_496
	v_u_526()
	v_u_496.Text = ""
end)
v_u_496.Changed:Connect(function(p528)
	-- upvalues: (ref) v_u_23, (ref) v_u_432, (copy) v_u_496, (copy) v_u_522, (copy) v_u_500, (copy) v_u_498
	if p528 == "Text" then
		if not v_u_23 then
			v_u_432("All")
		end
		local v529 = v_u_496.Text
		v_u_522()
		local v530 = v_u_500
		local v531
		if v529 == "" then
			v531 = false
		else
			v531 = v529 ~= ""
		end
		v530.Visible = v531
		local v532 = v_u_498
		local v533
		if v529 == "" then
			v533 = false
		else
			v533 = v529 ~= ""
		end
		v532.Enabled = v533
	end
end)
v_u_496.FocusLost:Connect(function(p534)
	-- upvalues: (copy) v_u_522
	if p534 then
		v_u_522()
	end
end)
local v_u_535 = script:WaitForChild("FavoriteOnly")
v_u_496.Size = v494.Size - UDim2.fromOffset(0, 0)
v_u_496.Position = UDim2.new(0, 0, 0, 0)
v_u_535.Position = v_u_496.Parent.Position - UDim2.fromOffset(v_u_496.Size.Y.Offset * 1.25, 0)
v_u_535.Size = UDim2.fromOffset(v_u_496.Size.Y.Offset, v_u_496.Size.Y.Offset)
v_u_535.ImageButton.Activated:Connect(function()
	-- upvalues: (ref) v_u_18, (copy) v_u_15, (copy) v_u_535, (copy) v_u_20, (ref) v_u_420
	local v536 = v_u_18
	local v537 = table.find(v_u_15, v536)
	local v538 = ("Invalid Filter \"%*\" passed to GetNextFilter"):format(v536)
	assert(v537, v538)
	v_u_18 = v_u_15[v537 % #v_u_15 + 1]
	v_u_535.ImageButton.Image = v_u_20[v_u_18]
	v_u_420 = true
end)
v_u_535.Parent = v_u_496.Parent.Parent
local v539 = v_u_535.Size.Y.Offset
local v540 = v539 * 3
local v_u_541 = v_u_107("TextButton", "EasterOnly")
v_u_541.Size = UDim2.fromOffset(v540, v539)
v_u_541.Position = v_u_535.Position - UDim2.fromOffset(v540 + 5, 0)
v_u_541.Text = "Show Easter"
v_u_541.TextScaled = true
v_u_541.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
v_u_541.BackgroundTransparency = 0.5
v_u_541.Parent = v_u_535.Parent
local v_u_542 = Instance.new("UIStroke")
v_u_542.Color = Color3.fromRGB(181, 109, 221)
v_u_542.Thickness = 0
v_u_542.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
v_u_542.Parent = v_u_541
local v543 = Instance.new("UICorner")
v543.CornerRadius = script:GetAttribute("CornerRadius")
v543.Parent = v_u_541
v_u_541.Activated:Connect(function()
	-- upvalues: (ref) v_u_19, (copy) v_u_542, (copy) v_u_541, (ref) v_u_420
	v_u_19 = not v_u_19
	v_u_542.Thickness = v_u_19 and 2 or 0
	v_u_541.TextColor3 = v_u_19 and Color3.fromRGB(255, 197, 255) or Color3.fromRGB(255, 255, 255)
	v_u_541.Text = v_u_19 and "Show Easter" or "Hide Easter"
	v_u_420 = true
end)
v_u_34.StateChanged.Event:Connect(function(p544)
	-- upvalues: (ref) v_u_436, (copy) v_u_85
	if not (p544 or v_u_436.Visible) then
		v_u_85:deselect()
	end
end)
v_u_89[Enum.KeyCode.Escape.Value] = function(p545)
	-- upvalues: (ref) v_u_436, (copy) v_u_85
	if not p545 then
		if v_u_436.Visible then
			v_u_85:deselect()
		end
	end
end
v_u_89[Enum.KeyCode.ButtonL2.Value] = function(_)
	-- upvalues: (ref) v_u_50, (copy) v_u_126
	if v_u_50 then
		v_u_126(v_u_50)
	end
end
v_u_63.MenuOpened:Connect(function()
	-- upvalues: (ref) v_u_436, (copy) v_u_85
	if v_u_436.Visible then
		v_u_85:deselect()
	end
end)
local function v_u_548(_, p546, _)
	-- upvalues: (copy) v_u_63, (copy) v_u_101, (copy) v_u_86, (ref) v_u_527
	if p546 == Enum.UserInputState.Begin then
		if v_u_63.SelectedObject then
			for v547 = 1, v_u_101 do
				if v_u_86[v547].Frame == v_u_63.SelectedObject and v_u_86[v547].Tool then
					v_u_86[v547]:MoveToInventory()
					v_u_527()
					return
				end
			end
			v_u_527()
		end
	else
		return
	end
end
v377(false)
v_u_62:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
function v_u_34.OpenClose()
	-- upvalues: (copy) v_u_90, (ref) v_u_436, (copy) v_u_114, (ref) v_u_422, (copy) v_u_101, (copy) v_u_86, (ref) v_u_98, (copy) v_u_58, (copy) v_u_59, (copy) v_u_493, (copy) v_u_481, (copy) v_u_66, (copy) v_u_548, (copy) v_u_34, (ref) v_u_23
	if not next(v_u_90) then
		v_u_436.Visible = not v_u_436.Visible
		local v549 = v_u_436.Visible
		v_u_114()
		v_u_422.Active = not v_u_422.Active
		for v550 = 1, v_u_101 do
			if v_u_86[v550] then
				v_u_86[v550]:SetClickability(not v549)
			end
		end
	end
	if v_u_436.Visible then
		if v_u_98 then
			if v_u_58[v_u_59:GetLastInputType()] then
				v_u_493()
				v_u_481.Visible = not v_u_59.VREnabled
			end
			enableGamepadInventoryControl()
		end
	else
		if v_u_98 then
			v_u_481.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if v_u_436.Visible then
		v_u_66:BindAction("RBXRemoveSlot", v_u_548, false, Enum.KeyCode.ButtonX)
	else
		v_u_66:UnbindAction("RBXRemoveSlot")
	end
	v_u_34.IsOpen = v_u_436.Visible
	v_u_34.StateChanged:Fire(v_u_436.Visible)
	if not v_u_34.IsOpen and v_u_23 then
		v_u_34.SetTrading(false)
	end
end
v_u_74.CharacterAdded:Connect(v355)
if v_u_74.Character then
	v355(v_u_74.Character)
end
v_u_59.InputBegan:Connect(v365)
v_u_59.TextBoxFocused:Connect(function()
	-- upvalues: (ref) v_u_94
	v_u_94 = true
end)
v_u_59.TextBoxFocusReleased:Connect(function()
	-- upvalues: (ref) v_u_94
	v_u_94 = false
end)
v_u_89[v_u_57] = function()
	-- upvalues: (ref) v_u_83
	if v_u_83 then
		v_u_83:UnequipTools()
	end
end
v_u_59.Changed:Connect(v369)
v369("KeyboardEnabled")
if v_u_59:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
v_u_59.GamepadConnected:Connect(function(p551)
	if p551 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
v_u_59.GamepadDisconnected:Connect(function(p552)
	if p552 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)
function v_u_34.SetBackpackEnabled(_, p553)
	-- upvalues: (ref) v_u_51
	v_u_51 = p553
end
function v_u_34.IsOpened(_)
	-- upvalues: (copy) v_u_34
	return v_u_34.IsOpen
end
function v_u_34.GetBackpackEnabled(_)
	-- upvalues: (ref) v_u_51
	return v_u_51
end
function v_u_34.GetStateChangedEvent(_)
	-- upvalues: (ref) v_u_84
	return v_u_84.StateChanged
end
v67.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_411, (ref) v_u_51, (copy) v_u_6, (ref) v_u_23
	local v554 = v_u_411
	local v555 = v_u_51
	if v555 then
		v555 = v_u_6.CurrentTradeReplicator == nil and true or v_u_23
	end
	v554(v555)
end)
v46.Event:Connect(function(p556, p557)
	-- upvalues: (copy) v_u_34
	if p556 == "SetBackpackEnabled" then
		v_u_34:SetBackpackEnabled(p557)
	elseif p556 == "SetInventoryOpen" then
		if type(p557) == "boolean" and p557 == true then
			v_u_34.IsOpen = true
			return
		end
		if type(p557) == "boolean" then
			v_u_34.IsOpen = false
			return
		end
	elseif p556 == "ToggleBackpack" then
		v_u_34.OpenClose()
	end
end)
v_u_61.GameEvents.ABTestingEvents:WaitForChild("HideInventoryItem").Event:Connect(function(p558)
	-- upvalues: (copy) v_u_86, (copy) v_u_114, (copy) v_u_122
	for _, v559 in v_u_86 do
		local v560 = v559.Tool
		if v560 and string.find(v560.Name, p558) then
			v559:Clear()
			v_u_114()
			v_u_122()
		end
	end
end)
return v_u_34