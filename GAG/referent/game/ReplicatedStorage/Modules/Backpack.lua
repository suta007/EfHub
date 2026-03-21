local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("GuiService")
local v4 = require(v1.Data.CategoryList)
local v_u_5 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_6 = require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_7 = require(v1.Modules.InventorySortingController)
local v_u_8 = require(v1.Modules.TradeControllers.TradingController)
local v9 = require(v1.Modules.Signal)
local v_u_10 = v9.new()
local v_u_11 = v9.new()
local v_u_12 = v3:IsTenFootInterface() or v2:IsStudio()
local v_u_13 = {}
local v_u_14 = { "All", "Favorited", "NonFavorited" }
local v_u_15 = "All"
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = "All"
local v_u_19 = nil
local v_u_20 = {
	["Favorited"] = "rbxassetid://83373307650705",
	["NonFavorited"] = "rbxassetid://82761222568258",
	["All"] = "rbxassetid://90084965933996"
}
local v_u_21 = false
for _, v22 in v4 do
	v_u_13[v22.Name] = v22
end
local function v_u_29(p23)
	-- upvalues: (ref) v_u_15, (copy) v_u_13, (copy) v_u_5, (copy) v_u_6
	if not p23 then
		return false
	end
	if v_u_15 == "All" then
		return true
	end
	local v24 = v_u_13[v_u_15]
	if not v24 then
		return false
	end
	local v25 = v24.Tags
	local v26 = p23:GetAttribute(v_u_5.ITEM_TYPE)
	local v27 = p23:GetAttribute("ItemType")
	for _, v28 in v25 do
		if v26 == v_u_6[v28] or v27 == v28 then
			return true
		end
	end
	return false
end
local v_u_30 = false
task.spawn(function()
	-- upvalues: (ref) v_u_30, (ref) v_u_16
	while true do
		repeat
			task.wait(1)
		until v_u_30
		v_u_30 = false
		v_u_16()
	end
end)
local v_u_31 = false
task.spawn(function()
	-- upvalues: (ref) v_u_31, (ref) v_u_16
	while true do
		repeat
			task.wait(1)
		until v_u_31
		v_u_31 = false
		v_u_16(true)
	end
end)
local v_u_32 = {
	["OpenClose"] = nil,
	["IsOpen"] = false,
	["StateChanged"] = Instance.new("BindableEvent"),
	["ModuleName"] = "Backpack",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = true
}
local v_u_33 = script:GetAttribute("TextSize")
local v34 = script:GetAttribute("BackgroundTransparency")
local v_u_35 = script:GetAttribute("BackgroundColor")
local v_u_36 = script:GetAttribute("DraggableColor")
local v_u_37 = script:GetAttribute("EquippedColor")
local v_u_38 = script:GetAttribute("SlotLockedTransparency")
local v_u_39 = script:GetAttribute("BorderColor")
local v40 = { Enum.KeyCode.Backquote }
local v41 = script:GetAttribute("FullSlots")
local v42 = script:GetAttribute("EmptySlots")
local v43 = script:GetAttribute("SearchBoxColor")
local v44 = script:GetAttribute("SearchBoxTransparency")
local v45 = script:WaitForChild("Api")
v45.Parent = game.ReplicatedStorage
local v46 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
local v_u_47 = v46:WaitForChild("Favorite_Item")
local v_u_48 = v46:WaitForChild("Favorite_Item_BE")
local v_u_49 = nil
local v_u_50 = true
local function v54()
	local v51 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	local v52 = Instance.new("Frame", v51)
	v52.BackgroundTransparency = 1
	v52.Size = UDim2.new(1, 0, 1, 0)
	local v53 = v52.AbsoluteSize
	v51:Destroy()
	return v53
end
local v_u_55 = Enum.KeyCode.Zero.Value
local v_u_56 = Enum.KeyCode.Backspace.Value
local v_u_57 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local v_u_58 = game:GetService("UserInputService")
local v59 = game:GetService("Players")
local v60 = game:GetService("ReplicatedStorage")
local v_u_61 = game:GetService("StarterGui")
local v_u_62 = game:GetService("GuiService")
local v63 = v59.LocalPlayer.PlayerGui
local v64 = Instance.new("ScreenGui", v63)
v64.DisplayOrder = 120
v64.IgnoreGuiInset = true
v64.ResetOnSpawn = false
v64.Name = "BackpackGui"
local v_u_65 = game:GetService("ContextActionService")
local v66 = game:GetService("RunService")
local v_u_67 = game:GetService("VRService")
local v_u_68 = require(script.Utility)
require(script.GameTranslator)
local v69 = require(v60.Modules.Icon)
local v_u_70 = v_u_62:IsTenFootInterface()
local v_u_71
if v_u_70 then
	v_u_33 = 24
	v_u_71 = 100
else
	v_u_71 = 60
end
local v_u_72 = false
local v73 = v_u_58.TouchEnabled
if v73 then
	v73 = v54().X < 1024
end
local v_u_74 = v59.LocalPlayer
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
local v_u_85 = v69.new()
v_u_85:setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "deselected")
v_u_85:setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "selected")
v_u_85:bindToggleKey(v40[1], v40[2])
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
local v_u_100 = v_u_67.VREnabled
local v_u_101 = v_u_100 and v42 and v42 or (v73 and 6 or v41)
local v_u_102 = v_u_100 and 3 or (v73 and 2 or 4)
local v_u_103 = nil
local function v_u_107(p104, p105)
	-- upvalues: (ref) v_u_33
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
		v106.TextSize = v_u_33
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
	-- upvalues: (ref) v_u_115, (ref) v_u_81, (ref) v_u_71, (ref) v_u_79
	if v_u_115 then
		pcall(task.cancel, v_u_115)
	end
	if p116 then
		local v117 = v_u_81.AbsoluteCellCount.Y * (v_u_71 + 5) + 5
		v_u_79.CanvasSize = UDim2.new(0, 0, 0, v117)
		v_u_115 = nil
	else
		v_u_115 = task.delay(0.05, function()
			-- upvalues: (ref) v_u_81, (ref) v_u_71, (ref) v_u_79, (ref) v_u_115
			local v118 = v_u_81.AbsoluteCellCount.Y * (v_u_71 + 5) + 5
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
	-- upvalues: (ref) v_u_76, (copy) v_u_101, (ref) v_u_71, (ref) v_u_77, (copy) v_u_102, (copy) v_u_100, (ref) v_u_79, (copy) v_u_114, (copy) v_u_122
	v_u_76.Size = UDim2.new(0, 5 + v_u_101 * (v_u_71 + 5), 0, v_u_71 + 5 + 5)
	v_u_76.Position = UDim2.new(0.5, -v_u_76.Size.X.Offset / 2, 1, -v_u_76.Size.Y.Offset)
	v_u_77.Size = UDim2.new(0, v_u_76.Size.X.Offset, 0, v_u_76.Size.Y.Offset * v_u_102 + 40 + (v_u_100 and 80 or 0))
	v_u_77.Position = UDim2.new(0.5, -v_u_77.Size.X.Offset / 2, 1, v_u_76.Position.Y.Offset - v_u_77.Size.Y.Offset)
	v_u_79.Size = UDim2.new(1, v_u_79.ScrollBarThickness + 1, 1, -40 - (v_u_100 and 80 or 0))
	v_u_79.Position = UDim2.new(0, 0, 0, 40 + (v_u_100 and 40 or 0))
	v_u_114()
	v_u_122()
end
local function v_u_126(p124)
	-- upvalues: (copy) v_u_47, (copy) v_u_48
	local v_u_125 = p124.Tool
	if v_u_125 then
		if not workspace:GetAttribute("InTutorial") then
			v_u_47:FireServer(v_u_125)
			task.delay(0.25, function()
				-- upvalues: (ref) v_u_48, (copy) v_u_125
				v_u_48:Fire(v_u_125)
			end)
		end
	else
		return
	end
end
os.clock()
local function v_u_268(p127, p128)
	-- upvalues: (copy) v_u_86, (copy) v_u_12, (copy) v_u_67, (copy) v_u_38, (copy) v_u_36, (copy) v_u_35, (ref) v_u_76, (ref) v_u_71, (copy) v_u_5, (copy) v_u_101, (ref) v_u_77, (copy) v_u_58, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (copy) v_u_65, (copy) v_u_88, (ref) v_u_87, (ref) v_u_82, (ref) v_u_103, (copy) v_u_107, (copy) v_u_37, (copy) v_u_90, (copy) v_u_85, (ref) v_u_19, (copy) v_u_119, (ref) v_u_49, (ref) v_u_83, (ref) v_u_84, (copy) v_u_8, (ref) v_u_30, (ref) v_u_21, (copy) v_u_39, (copy) v_u_126, (copy) v_u_268, (ref) v_u_80, (ref) v_u_95, (copy) v_u_89, (copy) v_u_55, (copy) v_u_74, (copy) v_u_7, (ref) v_u_17, (ref) v_u_16, (ref) v_u_79
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
	local function v_u_144()
		-- upvalues: (ref) v_u_67, (ref) v_u_131, (copy) v_u_130, (ref) v_u_12, (ref) v_u_38, (ref) v_u_36, (ref) v_u_35
		local _ = v_u_67.VREnabled
		v_u_131.SelectionImageObject = nil
		local v140 = v_u_131
		local v141
		if v_u_130.Hidden then
			v141 = false
		elseif v_u_12 then
			v141 = v_u_131:GetAttribute("Draggable")
		else
			v141 = v_u_131.Draggable
		end
		v140.BackgroundTransparency = v141 and 0 or v_u_38
		local v142 = v_u_131
		local v143
		if v_u_130.Hidden then
			v143 = false
		elseif v_u_12 then
			v143 = v_u_131:GetAttribute("Draggable")
		else
			v143 = v_u_131.Draggable
		end
		v142.BackgroundColor3 = v143 and v_u_36 or v_u_35
	end
	function v_u_130.Readjust(_, p145, p146)
		-- upvalues: (ref) v_u_76, (ref) v_u_71, (ref) v_u_131
		local v147 = v_u_76.Size.X.Offset / 2
		local v148 = v_u_71 + 5
		local v149 = p145 - (p146 / 2 + 0.5)
		v_u_131.Position = UDim2.new(0, v147 - v_u_71 / 2 + v148 * v149, 0, 5)
	end
	function v_u_130.Fill(p_u_150, p_u_151)
		-- upvalues: (ref) v_u_136, (ref) v_u_5, (copy) v_u_130, (ref) v_u_133, (ref) v_u_134, (ref) v_u_138, (ref) v_u_135, (ref) v_u_101, (ref) v_u_77, (ref) v_u_58, (ref) v_u_12, (ref) v_u_131, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (ref) v_u_65, (ref) v_u_88, (ref) v_u_87, (ref) v_u_86
		if v_u_136 then
			v_u_136:Disconnect()
			v_u_136 = nil
		end
		if not p_u_151 then
			return p_u_150:Clear()
		end
		p_u_150.Tool = p_u_151
		v_u_136 = p_u_151:GetAttributeChangedSignal(v_u_5.Favorite):Connect(function()
			-- upvalues: (copy) p_u_150, (copy) p_u_151, (ref) v_u_5, (ref) v_u_130
			p_u_150.Favorite = p_u_151:GetAttribute(v_u_5.Favorite)
			v_u_130.Frame.FavIcon.Visible = p_u_150.Favorite
		end)
		xpcall(function()
			-- upvalues: (copy) p_u_150, (copy) p_u_151, (ref) v_u_5, (ref) v_u_130
			p_u_150.Favorite = p_u_151:GetAttribute(v_u_5.Favorite)
			v_u_130.Frame.FavIcon.Visible = p_u_150.Favorite
		end, warn)
		local function v_u_154()
			-- upvalues: (copy) p_u_150, (copy) p_u_151, (ref) v_u_133, (ref) v_u_134, (ref) v_u_138
			if not p_u_150.Hidden then
				local v152 = p_u_151.TextureId
				v_u_133.Image = v152
				if v152 ~= "" then
					v_u_134.Visible = false
				end
				if string.find(p_u_151.Name, "Strawberry") or string.find(p_u_151.Name, "Exotic Enchanted Seed Pack") then
					v_u_134.TextSize = 12
				end
				v_u_134.Text = p_u_151.Name
				if v_u_138 and p_u_151:IsA("Tool") then
					v_u_138.Text = p_u_151.ToolTip
					local v153 = v_u_138.TextBounds.X + 24
					v_u_138.Size = UDim2.new(0, v153, 0, 24)
					v_u_138.Position = UDim2.new(0.5, -v153 / 2, 0, -28)
				end
			end
		end
		v_u_154()
		if v_u_135 then
			v_u_135:disconnect()
			v_u_135 = nil
		end
		p_u_150.AssignToolData = v_u_154
		v_u_135 = p_u_151.Changed:connect(function(p155)
			-- upvalues: (copy) v_u_154
			if p155 == "TextureId" or (p155 == "Name" or p155 == "ToolTip") then
				v_u_154()
			end
		end)
		local v156 = p_u_150.Index <= v_u_101
		if (not v156 or v_u_77.Visible) and not v_u_58.VREnabled then
			if v_u_12 then
				v_u_131:SetAttribute("Draggable", true)
			else
				v_u_131.Draggable = true
			end
		end
		p_u_150:UpdateEquipView()
		if v156 then
			v_u_91 = v_u_91 + 1
			if v_u_93 and (v_u_91 >= 1 and not v_u_72) then
				v_u_72 = true
				v_u_65:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		v_u_88[p_u_151] = p_u_150
		for v157 = 1, v_u_101 do
			v158 = v_u_86[v157]
			if not v158.Tool then
				::l25::
				v_u_87 = v158
				return
			end
		end
		local v158 = nil
		goto l25
	end
	function v_u_130.UpdateIndex(p159, p160)
		p159.Index = p160
		p159.Frame.Name = tostring(p160)
		p159.Frame.LayoutOrder = p160
	end
	function v_u_130.UpdateVisual(p161)
		-- upvalues: (ref) v_u_133, (ref) v_u_134, (ref) v_u_138, (ref) v_u_12, (ref) v_u_131, (ref) v_u_101, (ref) v_u_77, (ref) v_u_58, (ref) v_u_5
		if p161.Hidden then
			v_u_133.Image = ""
			v_u_134.Text = ""
			if v_u_138 then
				v_u_138.Text = ""
				v_u_138.Visible = false
			end
			if v_u_12 then
				v_u_131:SetAttribute("Draggable", false)
			else
				v_u_131.Draggable = false
			end
			v_u_131.FavIcon.Visible = false
			p161:UpdateEquipView(true)
		else
			if (p161.Index > v_u_101 or v_u_77.Visible) and not v_u_58.VREnabled then
				if v_u_12 then
					v_u_131:SetAttribute("Draggable", true)
				else
					v_u_131.Draggable = true
				end
			end
			if p161.AssignToolData then
				p161.AssignToolData()
			end
			if p161.Tool then
				v_u_131.FavIcon.Visible = p161.Tool:GetAttribute(v_u_5.Favorite)
			end
			p161:UpdateEquipView()
		end
	end
	function v_u_130.Clear(p162)
		-- upvalues: (ref) v_u_135, (ref) v_u_136, (ref) v_u_133, (ref) v_u_134, (ref) v_u_138, (ref) v_u_12, (ref) v_u_131, (ref) v_u_101, (ref) v_u_91, (ref) v_u_72, (ref) v_u_65, (ref) v_u_88, (ref) v_u_87, (ref) v_u_86
		if not p162.Tool then
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
		if v_u_12 then
			v_u_131:SetAttribute("Draggable", false)
		else
			v_u_131.Draggable = false
		end
		v_u_131.FavIcon.Visible = false
		p162:UpdateEquipView(true)
		if p162.Index <= v_u_101 then
			v_u_91 = v_u_91 - 1
			if v_u_91 < 1 then
				v_u_72 = false
				v_u_65:UnbindAction("RBXHotbarEquip")
			end
		end
		v_u_88[p162.Tool] = nil
		p162.Tool = nil
		for v163 = 1, v_u_101 do
			v164 = v_u_86[v163]
			if not v164.Tool then
				::l19::
				v_u_87 = v164
				return
			end
		end
		local v164 = nil
		goto l19
	end
	function v_u_130.UpdateEquipView(p165, p166)
		-- upvalues: (ref) v_u_82, (ref) v_u_103, (copy) v_u_130, (ref) v_u_137, (ref) v_u_107, (ref) v_u_131, (ref) v_u_37, (copy) v_u_144
		if not p166 then
			local v167 = p165.Tool
			if v167 then
				v167 = v167.Parent == v_u_82
			end
			if v167 and not p165.Hidden then
				v_u_103 = v_u_130
				if not v_u_137 then
					v_u_137 = v_u_107("Frame", "Equipped")
					v_u_137.ZIndex = v_u_131.ZIndex
					local v168 = Instance.new("UICorner")
					v168.CornerRadius = script:GetAttribute("CornerRadius")
					v168.Parent = v_u_137
					local v169 = Instance.new("UIStroke")
					v169.Name = "EquippedStroke"
					v169.Color = v_u_37
					v169.Thickness = 3
					v169.Parent = v_u_137
				end
				v_u_137.Parent = v_u_131
				task.defer(function()
					-- upvalues: (ref) v_u_137
					local v170 = v_u_137:FindFirstChild("EquippedStroke")
					if v170 then
						v170.Thickness = 3
					end
				end)
				::l11::
				v_u_144()
				return
			end
		end
		if v_u_137 then
			v_u_137.Parent = nil
		end
		goto l11
	end
	function v_u_130.IsEquipped(p171)
		-- upvalues: (ref) v_u_82
		local v172 = p171.Tool
		if v172 then
			v172 = v172.Parent == v_u_82
		end
		return v172
	end
	function v_u_130.Delete(p173)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_85, (ref) v_u_19, (ref) v_u_86, (ref) v_u_119
		if v_u_90[v_u_131] then
			v_u_90[v_u_131] = nil
			v_u_85:unlock()
			if v_u_19 then
				v_u_19:Destroy()
				v_u_19 = nil
			end
		end
		local v174 = p173.Index
		v_u_131:Destroy()
		table.remove(v_u_86, v174)
		for v175 = v174, #v_u_86 do
			local v176 = v_u_86[v175]
			if v176 then
				v176:UpdateIndex(v175)
			end
		end
		v_u_119()
	end
	function v_u_130.Swap(p177, p178)
		local v179 = p177.Tool
		local v180 = p178.Tool
		p177:Clear()
		if v180 then
			p178:Clear()
			p177:Fill(v180)
		end
		if v179 then
			p178:Fill(v179)
		else
			p178:Clear()
		end
	end
	function v_u_130.TurnNumber(_, p181)
		-- upvalues: (ref) v_u_139
		if v_u_139 then
			v_u_139.Visible = p181
		end
	end
	function v_u_130.SetClickability(p182, p183)
		-- upvalues: (ref) v_u_58, (ref) v_u_12, (ref) v_u_131, (copy) v_u_144
		if p182.Tool then
			if v_u_58.VREnabled then
				if v_u_12 then
					v_u_131:SetAttribute("Draggable", false)
				else
					v_u_131.Draggable = false
				end
			elseif v_u_12 then
				v_u_131:SetAttribute("Draggable", not p183)
			else
				v_u_131.Draggable = not p183
			end
			v_u_144()
		end
	end
	function v_u_130.CheckTerms(p184, p185)
		-- upvalues: (ref) v_u_134, (ref) v_u_138
		local v186 = 0
		local v187 = p184.Tool
		local v188
		if v187 then
			v188 = v186
			for v189 in pairs(p185) do
				local _, v190 = v_u_134.Text:lower():gsub(v189, "")
				v186 = v188 + v190
				if v187:IsA("Tool") then
					local _, v191 = (v_u_138 and v_u_138.Text or ""):lower():gsub(v189, "")
					v186 = v186 + v191
					v188 = v186
				else
					v188 = v186
				end
			end
		else
			v188 = v186
		end
		return v188
	end
	function v_u_130.Select(p192)
		-- upvalues: (copy) v_u_130, (ref) v_u_49, (ref) v_u_82, (ref) v_u_83, (ref) v_u_84, (ref) v_u_8, (ref) v_u_30, (ref) v_u_21
		local v193 = v_u_130.Tool
		if v193 then
			v_u_49 = p192
			local v194
			if v193 then
				v194 = v193.Parent == v_u_82
			else
				v194 = v193
			end
			if v194 then
				v_u_49 = nil
				if v_u_83 then
					v_u_83:UnequipTools()
					return
				end
			elseif v193.Parent == v_u_84 then
				if v_u_8:AddFromTool(v193) then
					v_u_30 = true
					return
				end
				if v_u_21 then
					return
				end
				if v_u_83 then
					v_u_83:UnequipTools()
				end
				v193.Parent = v_u_82
			end
		end
	end
	v_u_131 = v_u_107("TextButton", v129)
	local v_u_195 = Instance.new("UIStroke")
	v_u_195.Parent = v_u_131
	local v196 = Instance.new("UICorner")
	v196.CornerRadius = script:GetAttribute("CornerRadius")
	v196.Parent = v_u_131
	v_u_195.Thickness = 0
	v_u_131.BackgroundColor3 = v_u_35
	v_u_195.Color = v_u_39
	v_u_131.Text = ""
	v_u_131.AutoButtonColor = false
	v_u_131.BorderSizePixel = 0
	v_u_131.Size = UDim2.new(0, v_u_71, 0, v_u_71)
	v_u_131.Active = true
	v_u_131.Draggable = false
	if v_u_12 then
		v_u_131:SetAttribute("Draggable", false)
	end
	v_u_131.BackgroundTransparency = v_u_38
	v_u_131.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_130
		changeSlot(v_u_130)
	end)
	local v_u_197 = os.clock()
	if v_u_58.TouchEnabled then
		local v198 = v_u_131
		v198.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_197, (ref) v_u_126, (copy) v_u_130
			if os.clock() > v_u_197 + 0.25 then
				v_u_197 = os.clock()
			else
				v_u_126(v_u_130)
			end
		end)
		v198.TouchLongPress:Connect(function(_, p199, _)
			-- upvalues: (ref) v_u_126, (copy) v_u_130
			if p199 == Enum.UserInputState.End then
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
	local v200 = v_u_107("Frame", "SelectionObjectClipper")
	v200.Visible = false
	v200.Parent = v_u_131
	local v201 = v_u_107("ImageLabel", "Selector")
	v201.Size = UDim2.new(1, 0, 1, 0)
	v201.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	v201.ScaleType = Enum.ScaleType.Slice
	v201.SliceCenter = Rect.new(12, 12, 52, 52)
	v201.Parent = v200
	v_u_133 = v_u_107("ImageLabel", "Icon")
	v_u_133.Size = UDim2.new(0.8, 0, 0.8, 0)
	v_u_133.Position = UDim2.new(0.1, 0, 0.1, 0)
	v_u_133.Parent = v_u_131
	local v202 = v_u_107("ImageLabel", "FavIcon")
	v202.Size = UDim2.new(0.2, 0, 0.2, 0)
	v202.Position = UDim2.new(0.8, 0, 0.8, 0)
	v202.Parent = v_u_131
	v202.Visible = false
	v202.Image = "rbxassetid://80131230547874"
	v202.ImageColor3 = Color3.fromRGB(255, 0, 0)
	v202.ZIndex = 10
	v_u_134 = v_u_107("TextLabel", "ToolName")
	v_u_134.Size = UDim2.new(1, -2, 1, -2)
	v_u_134.Position = UDim2.new(0, 1, 0, 1)
	v_u_134.Parent = v_u_131
	v_u_130.Frame.LayoutOrder = v_u_130.Index
	if v129 <= v_u_101 then
		v_u_138 = v_u_107("TextLabel", "ToolTip")
		v_u_138.ZIndex = 2
		v_u_138.FontFace = script:GetAttribute("ToolTipFont")
		v_u_138.TextWrapped = false
		v_u_138.TextYAlignment = Enum.TextYAlignment.Center
		v_u_138.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		v_u_138.BackgroundTransparency = 0
		v_u_138.Visible = false
		v_u_138.Parent = v_u_131
		local v203 = Instance.new("UICorner")
		v203.CornerRadius = script:GetAttribute("CornerRadius")
		v203.Parent = v_u_138
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
		function v_u_130.MoveToInventory(p204)
			-- upvalues: (copy) v_u_130, (ref) v_u_101, (ref) v_u_268, (ref) v_u_80, (ref) v_u_82, (ref) v_u_83, (ref) v_u_95
			if v_u_101 < v_u_130.Index then
				return nil
			end
			local v205 = p204.Tool
			p204:Clear()
			local v206 = v_u_268(v_u_80)
			v206:Fill(v205)
			if v205 then
				v205 = v205.Parent == v_u_82
			end
			if v205 and v_u_83 then
				v_u_83:UnequipTools()
			end
			if v_u_95 then
				v206.Frame.Visible = false
			end
			return v206
		end
		if v129 < 10 or v129 == v_u_101 then
			local v207 = v129 < 10 and (v129 or 0) or 0
			v_u_139 = v_u_107("TextLabel", "Number")
			v_u_139.Text = v207
			v_u_139.Size = UDim2.new(0, 15, 0, 15)
			v_u_139.Visible = false
			v_u_139.Parent = v_u_131
			v_u_89[v_u_55 + v207] = v_u_130.Select
		end
	end
	local v_u_208 = v_u_131.Position
	local v_u_209 = 0
	local v_u_210 = nil
	local v_u_211 = nil
	local function v_u_217(p212)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_208, (copy) v_u_195, (ref) v_u_85, (ref) v_u_211, (copy) v_u_130, (ref) v_u_74, (ref) v_u_132, (ref) v_u_133, (ref) v_u_134, (ref) v_u_139, (ref) v_u_137, (ref) v_u_210, (ref) v_u_80, (ref) v_u_77, (ref) v_u_107, (ref) v_u_19
		v_u_90[v_u_131] = true
		v_u_208 = p212
		v_u_195.Thickness = 2
		v_u_85:lock()
		if v_u_211 then
			v_u_211:Disconnect()
			v_u_211 = nil
		end
		if v_u_130.Tool then
			v_u_211 = v_u_130.Tool.AncestryChanged:Connect(function(p213, _)
				-- upvalues: (ref) v_u_130, (ref) v_u_211, (ref) v_u_74, (ref) v_u_132
				if v_u_130.Tool and p213 == v_u_130.Tool then
					local v214 = v_u_130.Tool.Parent
					if v214 ~= v_u_74.Backpack and v214 ~= v_u_74.Character then
						if v_u_132 then
							v_u_132:Destroy()
							v_u_132 = nil
						end
						if v_u_211 then
							v_u_211:Disconnect()
							v_u_211 = nil
						end
					end
				elseif v_u_211 then
					v_u_211:Disconnect()
					v_u_211 = nil
				end
			end)
		elseif v_u_211 then
			v_u_211:Disconnect()
			v_u_211 = nil
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
			for _, v215 in v_u_137:GetChildren() do
				if not (v215:IsA("UICorner") or v215:IsA("UIStroke")) then
					v215.ZIndex = 2
				end
			end
		end
		v_u_210 = v_u_131.Parent
		if v_u_210 == v_u_80 then
			local _ = v_u_131.AbsolutePosition
			local v216 = UDim2.new(0, v_u_131.AbsolutePosition.X - v_u_77.AbsolutePosition.X, 0, v_u_131.AbsolutePosition.Y - v_u_77.AbsolutePosition.Y)
			v_u_131.Parent = v_u_77
			v_u_131.Position = v216
			v_u_132 = v_u_107("Frame", "FakeSlot")
			v_u_132.LayoutOrder = v_u_131.LayoutOrder
			v_u_132.Size = v_u_131.Size
			v_u_132.BackgroundTransparency = 1
			v_u_132.Parent = v_u_80
			v_u_19 = v_u_132
		end
	end
	local function v_u_250(p218)
		-- upvalues: (ref) v_u_90, (ref) v_u_131, (ref) v_u_132, (ref) v_u_211, (ref) v_u_208, (ref) v_u_210, (copy) v_u_195, (ref) v_u_85, (ref) v_u_133, (ref) v_u_134, (ref) v_u_139, (ref) v_u_137, (copy) v_u_130, (ref) v_u_77, (ref) v_u_101, (ref) v_u_5, (ref) v_u_7, (ref) v_u_17, (ref) v_u_16, (ref) v_u_209, (ref) v_u_87, (ref) v_u_76, (ref) v_u_86, (ref) v_u_82, (ref) v_u_83, (ref) v_u_95
		v_u_90[v_u_131] = nil
		if v_u_132 then
			v_u_132:Destroy()
			v_u_132 = nil
		end
		if v_u_211 then
			v_u_211:Disconnect()
			v_u_211 = nil
		end
		local v219 = tick()
		v_u_131.Position = v_u_208
		if v_u_210 and v_u_131.Parent ~= v_u_210 then
			v_u_131.Parent = v_u_210
		end
		v_u_195.Thickness = 0
		v_u_85:unlock()
		v_u_131.ZIndex = 1
		v_u_133.ZIndex = 1
		v_u_134.ZIndex = 1
		if v_u_210 then
			v_u_210.ZIndex = 1
		end
		if v_u_139 then
			v_u_139.ZIndex = 1
		end
		if v_u_137 then
			v_u_137.ZIndex = 1
			for _, v220 in v_u_137:GetChildren() do
				if not (v220:IsA("UICorner") or v220:IsA("UIStroke")) then
					v220.ZIndex = 1
				end
			end
		end
		if v_u_130.Tool then
			local v221 = v_u_77
			local v222 = p218.X
			local v223 = p218.Y
			local v224 = v221.AbsolutePosition
			local v225 = v221.AbsoluteSize
			local v226
			if v224.X < v222 and (v222 <= v224.X + v225.X and v224.Y < v223) then
				v226 = v223 <= v224.Y + v225.Y
			else
				v226 = false
			end
			if v226 then
				if v_u_130.Index <= v_u_101 then
					local v227 = v_u_130:MoveToInventory()
					local v228 = not v227.Tool or v227.Tool:GetAttribute(v_u_5.ITEM_UUID) or (v227.Tool:GetAttribute("PET_UUID") or v227.Tool:GetAttribute("UUID"))
					if v228 then
						v_u_7:MoveEntry(v228, v227.Index)
					end
					v_u_17.Text = ""
					if v_u_16 then
						task.delay(0.01, v_u_16, true)
					end
				end
				if v_u_101 < v_u_130.Index and v219 - v_u_209 < 0.5 then
					if v_u_87 then
						local v229 = v_u_130.Tool
						local v230 = v229:GetAttribute(v_u_5.ITEM_UUID) or (v229:GetAttribute("PET_UUID") or v229:GetAttribute("UUID"))
						local v231 = v_u_87.Index
						v_u_130:Clear()
						v_u_87:Fill(v229)
						v_u_130:Delete()
						if v230 then
							v_u_7:MoveEntry(v230, v231)
							v219 = 0
						else
							v219 = 0
						end
					else
						v219 = 0
					end
				end
			else
				local v232 = v_u_76
				local v233 = p218.X
				local v234 = p218.Y
				local v235 = v232.AbsolutePosition
				local v236 = v232.AbsoluteSize
				local v237
				if v235.X < v233 and (v233 <= v235.X + v236.X and v235.Y < v234) then
					v237 = v234 <= v235.Y + v236.Y
				else
					v237 = false
				end
				if v237 then
					local v238 = {
						["Magnitude"] = (1 / 0),
						["Slot"] = nil
					}
					for _, v239 in v_u_86 do
						if v_u_101 >= v239.Index then
							local v240 = v239.Frame
							local v241 = (v240.AbsolutePosition + v240.AbsoluteSize / 2 - p218).magnitude
							if v241 < v238.Magnitude then
								v238.Magnitude = v241
								v238.Slot = v239
							end
						end
					end
					local v242 = v238.Slot
					if not v242 or v242 == v_u_130 then
						return
					end
					local v243 = not v_u_130.Tool or v_u_130.Tool:GetAttribute(v_u_5.ITEM_UUID) or (v_u_130.Tool:GetAttribute("PET_UUID") or v_u_130.Tool:GetAttribute("UUID"))
					local v244 = not v242.Tool or v242.Tool:GetAttribute(v_u_5.ITEM_UUID) or (v242.Tool:GetAttribute("PET_UUID") or v242.Tool:GetAttribute("UUID"))
					local v245 = v242.Index
					local v246 = v_u_130.Index
					v_u_130:Swap(v242)
					if v243 then
						v_u_7:MoveEntry(v243, v245)
					end
					if v244 then
						task.wait()
						v_u_7:MoveEntry(v244, v246)
					end
					if v_u_101 < v_u_130.Index then
						local v247 = v_u_130.Tool
						if v247 then
							if v247 then
								v247 = v247.Parent == v_u_82
							end
							if v247 and v_u_83 then
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
					local v248 = v_u_130:MoveToInventory()
					local v249 = not v248.Tool or v248.Tool:GetAttribute(v_u_5.ITEM_UUID) or (v248.Tool:GetAttribute("PET_UUID") or v248.Tool:GetAttribute("UUID"))
					if v249 then
						v_u_7:MoveEntry(v249, v248.Index)
					end
					if v_u_16 then
						task.delay(0.01, v_u_16, true)
					end
				elseif v_u_130.Tool and (v_u_130.Tool:IsA("Tool") and v_u_130.Tool.CanBeDropped) then
					v_u_130.Tool.Parent = workspace
				end
			end
			v_u_209 = v219
			if v_u_16 then
				task.delay(0.01, v_u_16, true)
			end
		end
	end
	if v_u_12 then
		local v_u_251 = nil
		local v_u_252 = nil
		local v_u_253 = nil
		local v_u_254 = nil
		local v_u_255 = nil
		v_u_131.InputBegan:Connect(function(p_u_256)
			-- upvalues: (ref) v_u_131, (ref) v_u_252, (ref) v_u_58, (copy) v_u_217, (ref) v_u_251, (ref) v_u_254, (ref) v_u_255, (ref) v_u_253, (copy) v_u_250
			if v_u_131:GetAttribute("Draggable") then
				if p_u_256.UserInputType == Enum.UserInputType.MouseButton1 or (p_u_256.UserInputType == Enum.UserInputType.Touch or p_u_256.KeyCode == Enum.KeyCode.ButtonA) then
					v_u_252 = true
					local v_u_261 = v_u_58.InputChanged:Connect(function(p257)
						-- upvalues: (ref) v_u_252, (ref) v_u_217, (ref) v_u_131, (ref) v_u_251, (ref) v_u_254, (ref) v_u_58, (ref) v_u_255
						if v_u_252 then
							v_u_252 = false
							v_u_217(v_u_131.Position)
							v_u_251 = true
							v_u_254 = v_u_58:GetMouseLocation()
							v_u_255 = v_u_131.Position
						end
						if v_u_251 and (p257.UserInputType == Enum.UserInputType.MouseMovement or (p257.UserInputType == Enum.UserInputType.Touch or string.find(p257.UserInputType.Name, "Gamepad"))) then
							local v258 = v_u_58:GetMouseLocation()
							local v259 = v_u_255
							if v259 then
								v259 = v_u_254
							end
							assert(v259)
							local v260 = v258 - v_u_254
							v_u_131.Position = UDim2.new(v_u_255.X.Scale, v_u_255.X.Offset + v260.X, v_u_255.Y.Scale, v_u_255.Y.Offset + v260.Y)
						end
					end)
					local v_u_262 = nil
					v_u_262 = p_u_256:GetPropertyChangedSignal("UserInputState"):Connect(function()
						-- upvalues: (ref) v_u_251, (ref) v_u_252, (ref) v_u_262, (copy) p_u_256, (copy) v_u_261, (ref) v_u_253, (ref) v_u_255, (ref) v_u_250
						if v_u_251 or v_u_252 then
							if p_u_256.UserInputState == Enum.UserInputState.End then
								v_u_261:Disconnect()
								local v263 = v_u_251
								v_u_252 = nil
								v_u_251 = nil
								v_u_253 = nil
								v_u_255 = nil
								if v_u_262 then
									v_u_262:Disconnect()
									v_u_262 = nil
								end
								if v263 then
									v_u_250(Vector2.new(p_u_256.Position.X, p_u_256.Position.Y))
								end
							end
						elseif v_u_262 then
							v_u_262:Disconnect()
							v_u_262 = nil
						end
					end)
				end
			end
		end)
	else
		v_u_131.DragBegin:Connect(function(p264)
			-- upvalues: (copy) v_u_217
			v_u_217(p264)
		end)
		v_u_131.DragStopped:Connect(function(p265, p266)
			-- upvalues: (copy) v_u_250
			v_u_250(Vector2.new(p265, p266))
		end)
	end
	v_u_131.Parent = p127
	v_u_86[v129] = v_u_130
	if v_u_101 < v129 then
		v_u_119()
		if v_u_77.Visible and not v_u_95 then
			local v267 = v_u_79.CanvasSize.Y.Offset - v_u_79.AbsoluteSize.Y
			v_u_79.CanvasPosition = Vector2.new(0, (math.max(0, v267)))
		end
	end
	return v_u_130
end
local v_u_269 = nil
local function v_u_280(p270)
	-- upvalues: (ref) v_u_82, (ref) v_u_83, (ref) v_u_99, (ref) v_u_79, (ref) v_u_92, (copy) v_u_88, (copy) v_u_74, (ref) v_u_87, (copy) v_u_268, (ref) v_u_80, (copy) v_u_86, (ref) v_u_84, (copy) v_u_114, (ref) v_u_31, (copy) v_u_101, (ref) v_u_77, (ref) v_u_269
	if p270:IsA("Tool") then
		local _ = p270.Parent
		if p270.Parent == v_u_82 then
			v_u_99 = tick()
		end
		local v271 = v_u_79
		local v272 = v_u_79.CanvasPosition
		if not v_u_92 and (p270.Parent == v_u_82 and not v_u_88[p270]) then
			local v273 = v_u_74:FindFirstChild("StarterGear")
			if v273 and v273:FindFirstChild(p270.Name) then
				v_u_92 = true
				for v274 = (v_u_87 or v_u_268(v_u_80)).Index, 1, -1 do
					local v275 = v_u_86[v274]
					local v276 = v274 - 1
					if v276 > 0 then
						v_u_86[v276]:Swap(v275)
					else
						v275:Fill(p270)
					end
				end
				for _, v277 in pairs(v_u_82:GetChildren()) do
					if v277:IsA("Tool") and v277 ~= p270 then
						v277.Parent = v_u_84
					end
				end
				v_u_114()
				v271.CanvasPosition = v272
				v_u_31 = true
				return
			end
		end
		local v278 = v_u_88[p270]
		if v278 then
			v278:UpdateEquipView()
		else
			local v279 = v_u_87 or v_u_268(v_u_80)
			v279:Fill(p270)
			if v279.Index <= v_u_101 and not v_u_77.Visible then
				v_u_114()
				v271.CanvasPosition = v272
			end
		end
		if v_u_269 and coroutine.status(v_u_269) == "suspended" then
			task.cancel(v_u_269)
			v_u_269 = nil
		end
		v_u_269 = task.delay(0.2, function()
			-- upvalues: (ref) v_u_31
			v_u_31 = true
		end)
	elseif p270:IsA("Humanoid") and p270.Parent == v_u_82 then
		v_u_83 = p270
	end
end
local function v_u_284(p_u_281)
	-- upvalues: (ref) v_u_99, (ref) v_u_82, (ref) v_u_84, (copy) v_u_88, (copy) v_u_101, (ref) v_u_77, (copy) v_u_114
	if p_u_281:IsA("Tool") then
		v_u_99 = tick()
		local v282 = p_u_281.Parent
		if v282 ~= v_u_82 and v282 ~= v_u_84 then
			local v_u_283 = v_u_88[p_u_281]
			if v_u_283 then
				task.defer(function()
					-- upvalues: (ref) v_u_88, (copy) p_u_281, (copy) v_u_283, (ref) v_u_101, (ref) v_u_77, (ref) v_u_114
					if v_u_88[p_u_281] == v_u_283 then
						v_u_283:Clear()
						if v_u_101 < v_u_283.Index then
							v_u_283:Delete()
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
local function v325(p285)
	-- upvalues: (copy) v_u_86, (copy) v_u_101, (ref) v_u_87, (ref) v_u_91, (copy) v_u_97, (ref) v_u_82, (ref) v_u_84, (copy) v_u_74, (copy) v_u_7, (copy) v_u_5, (copy) v_u_268, (ref) v_u_80, (copy) v_u_284, (copy) v_u_280, (copy) v_u_114, (copy) v_u_122
	for v286 = #v_u_86, v_u_101 + 1, -1 do
		if v_u_86[v286] then
			v_u_86[v286]:Delete()
		end
	end
	for v287 = 1, v_u_101 do
		if v_u_86[v287] and v_u_86[v287].Tool then
			v_u_86[v287]:Clear()
		end
	end
	for v288 = 1, v_u_101 do
		v289 = v_u_86[v288]
		if not v289.Tool then
			goto l14
		end
	end
	local v289 = nil
	::l14::
	v_u_87 = v289
	v_u_91 = 0
	for _, v290 in v_u_97 do
		v290:Disconnect()
	end
	table.clear(v_u_97)
	v_u_82 = p285
	v_u_84 = v_u_74:WaitForChild("Backpack")
	local v291 = v_u_7:GetSortedData()
	if not v291 then
		return
	end
	local v292 = {}
	for _, v293 in v_u_84:GetChildren() do
		if v293:IsA("Tool") then
			local v294 = v293:GetAttribute(v_u_5.ITEM_UUID) or (v293:GetAttribute("PET_UUID") or v293:GetAttribute("UUID"))
			if v294 then
				v292[v294] = v293
			end
		end
	end
	for _, v295 in p285:GetChildren() do
		if v295:IsA("Tool") then
			local v296 = v295:GetAttribute(v_u_5.ITEM_UUID) or (v295:GetAttribute("PET_UUID") or v295:GetAttribute("UUID"))
			if v296 then
				v292[v296] = v295
			end
		end
	end
	local v297 = {}
	for v298, v299 in v291 do
		local v300 = {
			["Index"] = tonumber(v298) or 9999,
			["Guid"] = v299
		}
		table.insert(v297, v300)
	end
	table.sort(v297, function(p301, p302)
		return p301.Index < p302.Index
	end)
	for _, v303 in v297 do
		local v304 = v292[v303.Guid]
		if v304 then
			local v305 = v303.Index
			if v305 > 0 and v305 <= v_u_101 then
				if v_u_86[v305] then
					v_u_86[v305]:Fill(v304)
				end
			else
				v_u_268(v_u_80):Fill(v304)
			end
			v292[v303.Guid] = nil
		end
	end
	for _, v306 in v292 do
		for v307 = 1, v_u_101 do
			v308 = v_u_86[v307]
			if not v308.Tool then
				goto l54
			end
		end
		local v308 = nil
		::l54::
		local v309 = v308 or v_u_268(v_u_80)
		if v309 then
			v309:Fill(v306)
		end
	end
	for v310 = 1, v_u_101 do
		v324 = v_u_86[v310]
		if not v324.Tool then
			::l63::
			v_u_87 = v324
			local v311 = v_u_97
			local v312 = v_u_84.ChildRemoved
			local v313 = v_u_284
			table.insert(v311, v312:Connect(v313))
			local v314 = v_u_97
			local v315 = v_u_84.ChildAdded
			local v316 = v_u_280
			table.insert(v314, v315:Connect(v316))
			local v317 = v_u_97
			local v318 = p285.ChildRemoved
			local v319 = v_u_284
			table.insert(v317, v318:Connect(v319))
			local v320 = v_u_97
			local v321 = p285.ChildAdded
			local v322 = v_u_280
			table.insert(v320, v321:Connect(v322))
			for _, v323 in p285:GetChildren() do
				if not v323:IsA("Tool") then
					v_u_280(v323)
				end
			end
			v_u_114()
			v_u_122()
			return
		end
	end
	local v324 = nil
	goto l63
end
local v_u_326 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
v_u_58:GetMouseLocation()
local function v_u_330(p327)
	-- upvalues: (copy) v_u_58, (copy) v_u_326
	local v328 = v_u_58:GetMouseLocation()
	for _, v329 in v_u_326:GetGuiObjectsAtPosition(v328.X, v328.Y) do
		if v329.Name:find(p327) then
			return v329
		end
	end
end
local function v335(p331, p332)
	-- upvalues: (ref) v_u_94, (ref) v_u_93, (copy) v_u_56, (copy) v_u_89, (ref) v_u_77, (copy) v_u_330, (copy) v_u_85
	if p332 == false then
		local v333 = (p331.KeyCode == Enum.KeyCode.ButtonL2 or p331.UserInputType == Enum.UserInputType.Keyboard and (not v_u_94 and (v_u_93 or p331.KeyCode.Value == v_u_56))) and v_u_89[p331.KeyCode.Value]
		if v333 then
			v333(p332)
		end
		local v334 = p331.UserInputType
		if (v334 == Enum.UserInputType.MouseButton1 or v334 == Enum.UserInputType.Touch) and (v_u_77.Visible and not v_u_330("CategoryFrame")) then
			v_u_85:deselect()
		end
	end
end
local function v339(p336)
	-- upvalues: (copy) v_u_58, (copy) v_u_101, (copy) v_u_86
	if p336 == "KeyboardEnabled" or p336 == "VREnabled" then
		local v337 = v_u_58.KeyboardEnabled
		if v337 then
			v337 = not v_u_58.VREnabled
		end
		for v338 = 1, v_u_101 do
			if v_u_86[v338] then
				v_u_86[v338]:TurnNumber(v337)
			end
		end
	end
end
local v_u_340 = nil
local v_u_341 = nil
local function v_u_342() end
local _ = Vector2.new(0, 0)
function unbindAllGamepadEquipActions()
	-- upvalues: (copy) v_u_65
	v_u_65:UnbindAction("RBXBackpackHasGamepadFocus")
	v_u_65:UnbindAction("RBXCloseInventory")
end
local function v347(p343, p344)
	-- upvalues: (copy) v_u_101, (copy) v_u_86
	for v345 = 1, v_u_101 do
		local v346 = v_u_86[v345]
		if v346 and (v346.Frame and (p344 or v346.Tool)) then
			v346.Frame.Visible = p343
		end
	end
end
function changeToolFunc(_, p348, p_u_349)
	-- upvalues: (ref) v_u_21, (ref) v_u_340, (ref) v_u_341, (ref) v_u_83, (ref) v_u_82, (copy) v_u_88, (copy) v_u_101, (copy) v_u_86, (ref) v_u_103
	if v_u_21 then
		return
	elseif p348 == Enum.UserInputState.Begin then
		if v_u_340 and (v_u_340.KeyCode == Enum.KeyCode.ButtonR1 and p_u_349.KeyCode == Enum.KeyCode.ButtonL1 or v_u_340.KeyCode == Enum.KeyCode.ButtonL1 and p_u_349.KeyCode == Enum.KeyCode.ButtonR1) and tick() - v_u_341 <= 0.06 then
			if v_u_83 then
				v_u_83:UnequipTools()
			end
			v_u_340 = p_u_349
			v_u_341 = tick()
		else
			v_u_340 = p_u_349
			v_u_341 = tick()
			delay(0.06, function()
				-- upvalues: (ref) v_u_340, (copy) p_u_349, (ref) v_u_82, (ref) v_u_83, (ref) v_u_88, (ref) v_u_101, (ref) v_u_86, (ref) v_u_103
				if v_u_340 ~= p_u_349 then
					return
				end
				local v350 = p_u_349.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1
				local v351 = nil
				if v_u_82 and v_u_83 then
					for _, v352 in ipairs(v_u_82:GetChildren()) do
						if v352:IsA("Tool") then
							v351 = v352
							break
						end
					end
				end
				local v353 = -1
				if v351 then
					local v354 = v_u_88[v351]
					if v354 and v354.Index <= v_u_101 then
						v353 = v354.Index
					end
				end
				if v353 == -1 then
					local v355 = (not v_u_103 or (not v_u_103.Tool or v_u_103.Index > v_u_101)) and -1 or v_u_103.Index
					if v355 == -1 then
						for v356 = v350 == -1 and (v_u_101 or 1) or 1, v350 == -1 and 1 or v_u_101, v350 do
							if v_u_86[v356] and v_u_86[v356].Tool then
								v_u_86[v356]:Select()
								return
							end
						end
						if v_u_83 then
							v_u_83:UnequipTools()
						end
						return
					end
					local v357 = v350 + v355
					if v_u_101 < v357 then
						v357 = 1
					elseif v357 < 1 then
						v357 = v_u_101
					end
					local v358 = v357
					local v359 = false
					while true do
						if v_u_86[v357] and v_u_86[v357].Tool then
							v359 = true
							break
						end
						v357 = v357 + v350
						if v_u_101 < v357 then
							v357 = 1
						elseif v357 < 1 then
							v357 = v_u_101
						end
						if v357 == v358 or v359 then
							break
						end
					end
					if v359 then
						v_u_86[v357]:Select()
					elseif v_u_83 then
						v_u_83:UnequipTools()
					end
				else
					local v360 = v350 + v353
					if v_u_101 < v360 then
						v360 = 1
					elseif v360 < 1 then
						v360 = v_u_101
					end
					local v361 = v360
					local v362 = false
					while true do
						if v_u_86[v360] and v_u_86[v360].Tool then
							v362 = true
							break
						end
						v360 = v360 + v350
						if v_u_101 < v360 then
							v360 = 1
						elseif v360 < 1 then
							v360 = v_u_101
						end
						if v360 == v361 or v362 then
							break
						end
					end
					if v362 then
						if v_u_86[v360].Tool == v351 then
							local v363 = 0
							for v364 = 1, v_u_101 do
								if v_u_86[v364] and v_u_86[v364].Tool then
									v363 = v363 + 1
								end
							end
							if v363 <= 1 then
								if v_u_83 then
									v_u_83:UnequipTools()
								end
								v_u_103 = nil
							else
								v_u_86[v360]:Select()
							end
						else
							v_u_86[v360]:Select()
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
	for v365 = 1, #v_u_86 do
		if v_u_86[v365] and (v_u_86[v365].Frame:IsA("GuiButton") and (v_u_86[v365].Frame:FindFirstChild("UIStroke") and v_u_86[v365].Frame.UIStroke.Thickness > 0)) then
			return v_u_86[v365]
		end
	end
end
function changeSlot(p366)
	-- upvalues: (copy) v_u_67, (ref) v_u_77
	if v_u_67.VREnabled then
		local _ = v_u_77.Visible
	end
	p366:Select()
end
function vrMoveSlotToInventory()
	-- upvalues: (copy) v_u_67, (ref) v_u_78
	if v_u_67.VREnabled then
		local v367 = getGamepadSwapSlot()
		if v367 and v367.Tool then
			v367:WaitForChild("UIStroke").Thickness = 0
			v367:MoveToInventory()
			v_u_78.SelectionImageObject.Visible = false
		end
	end
end
function enableGamepadInventoryControl()
	-- upvalues: (ref) v_u_77, (copy) v_u_85, (copy) v_u_65, (copy) v_u_342, (copy) v_u_58, (copy) v_u_62, (ref) v_u_76
	local function v370(_, p368, _)
		-- upvalues: (ref) v_u_77, (ref) v_u_85
		if p368 == Enum.UserInputState.Begin then
			if getGamepadSwapSlot() then
				local v369 = getGamepadSwapSlot()
				if v369 and typeof(v369) == "Instance" then
					v369:WaitForChild("UIStroke").Thickness = 0
					return
				end
			elseif v_u_77.Visible then
				v_u_85:deselect()
			end
		end
	end
	v_u_65:BindAction("RBXBackpackHasGamepadFocus", v_u_342, false, Enum.UserInputType.Gamepad1)
	v_u_65:BindAction("RBXCloseInventory", v370, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	if not v_u_58.VREnabled then
		v_u_62.SelectedObject = v_u_76:FindFirstChild("1")
	end
end
function disableGamepadInventoryControl()
	-- upvalues: (copy) v_u_101, (copy) v_u_86, (copy) v_u_62, (ref) v_u_75
	unbindAllGamepadEquipActions()
	for v371 = 1, v_u_101 do
		local v372 = v_u_86[v371]
		if v372 and v372.Frame then
			v372.Frame:WaitForChild("UIStroke").Thickness = 0
		end
	end
	if v_u_62.SelectedObject and v_u_62.SelectedObject:IsDescendantOf(v_u_75) then
		v_u_62.SelectedObject = nil
	end
end
function gamepadDisconnected()
	-- upvalues: (ref) v_u_98
	v_u_98 = false
	disableGamepadInventoryControl()
end
function gamepadConnected()
	-- upvalues: (ref) v_u_98, (copy) v_u_62, (ref) v_u_75, (ref) v_u_91, (ref) v_u_93, (ref) v_u_72, (copy) v_u_65, (ref) v_u_77
	v_u_98 = true
	v_u_62:AddSelectionParent("RBXBackpackSelection", v_u_75)
	if v_u_91 >= 1 and (v_u_93 and not v_u_72) then
		v_u_72 = true
		v_u_65:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
	if v_u_77.Visible then
		enableGamepadInventoryControl()
	end
end
local function v_u_381(p373)
	-- upvalues: (copy) v_u_61, (copy) v_u_85, (copy) v_u_62, (ref) v_u_93, (ref) v_u_75, (copy) v_u_96, (ref) v_u_91, (ref) v_u_72, (copy) v_u_65
	local v374 = 0
	local v375 = true
	while true do
		if v374 >= 10 then
			v377 = v375
			break
		end
		local v376, v377 = pcall(function()
			-- upvalues: (ref) v_u_61
			return v_u_61:GetCore("TopbarEnabled")
		end)
		if v376 then
			break
		end
		v374 = v374 + 1
		task.wait(0.1)
	end
	local v378 = p373 and v377
	local v379 = v_u_85
	local v380
	if v378 then
		v380 = not v_u_62.MenuIsOpen
	else
		v380 = v378
	end
	v379:setEnabled(v380)
	v_u_93 = v378
	v_u_75.Visible = v378
	for _, _ in pairs(v_u_96) do

	end
	if v378 then
		if v_u_91 >= 1 and (v_u_93 and not v_u_72) then
			v_u_72 = true
			v_u_65:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			return
		end
	else
		disableGamepadInventoryControl()
		v_u_72 = false
		v_u_65:UnbindAction("RBXHotbarEquip")
	end
end
local function v387(p382, p383)
	-- upvalues: (copy) v_u_107
	local v384 = v_u_107("ImageButton", p382)
	v384.Size = UDim2.new(0, 40, 0, 40)
	v384.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local v385 = v_u_107("ImageLabel", "Icon")
	v385.Size = UDim2.new(0.5, 0, 0.5, 0)
	v385.Position = UDim2.new(0.25, 0, 0.25, 0)
	v385.Image = p383
	v385.Parent = v384
	local v386 = v_u_107("ImageLabel", "Selection")
	v386.Size = UDim2.new(0.9, 0, 0.9, 0)
	v386.Position = UDim2.new(0.05, 0, 0.05, 0)
	v386.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	v384.SelectionImageObject = v386
	return v384, v385, v386
end
local v388 = v_u_107("Frame", "Backpack")
v388.Visible = false
v388.Parent = v64
local v389 = v_u_107("Frame", "Hotbar")
v389.Parent = v388
local v_u_390 = v_u_30
local v391 = v388
local v_u_392 = v389
for v393 = 1, v_u_101 do
	local v394 = v_u_268(v_u_392, v393)
	v394.Frame.Visible = false
	if not v_u_87 then
		local v395 = v394
		v_u_87 = v395
	end
end
v_u_85.selected:Connect(function()
	-- upvalues: (copy) v_u_62, (copy) v_u_32
	if not v_u_62.MenuIsOpen then
		v_u_32.OpenClose()
	end
end)
v_u_85.deselected:Connect(function()
	-- upvalues: (ref) v_u_77, (copy) v_u_32
	if v_u_77.Visible then
		v_u_32.OpenClose()
	end
end)
LeftBumperButton = v_u_107("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = v_u_107("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
local v396 = v_u_107("Frame", "Inventory")
local v397 = Instance.new("UICorner")
v397.CornerRadius = script:GetAttribute("CornerRadius")
v397.Parent = v396
v396.BackgroundTransparency = v34
v396.BackgroundColor3 = v_u_35
v396.Active = true
v396.Visible = false
v396.Parent = v391
local v_u_398 = game:GetService("TweenService")
require(v60.Item_Module)
local v_u_399 = script.CategoryTemplate:Clone()
v_u_399.Parent = v396
local function v_u_402(p400)
	-- upvalues: (ref) v_u_15, (copy) v_u_399, (copy) v_u_13, (copy) v_u_10, (ref) v_u_390
	if v_u_15 ~= p400 then
		local v401 = v_u_15
		v_u_15 = p400
		v_u_399.Text = ("%* Items"):format(v_u_13[p400].Display or p400)
		v_u_10:Fire(p400, v401)
		v_u_390 = true
	end
end
v_u_32.UpdateCategory = v_u_402
function v_u_32.GetCategory()
	-- upvalues: (ref) v_u_15
	return v_u_15
end
function v_u_32.SetTrading(p403)
	-- upvalues: (ref) v_u_21, (copy) v_u_11, (ref) v_u_15, (copy) v_u_32, (ref) v_u_390
	v_u_21 = p403
	v_u_11:Fire(p403)
	if p403 or v_u_15 ~= "PetsOnly" then
		if p403 and v_u_15 == "Pet" then
			v_u_32.UpdateCategory("PetsOnly")
		elseif p403 and (v_u_15 ~= "PetsOnly" and v_u_15 ~= "Fruit") then
			v_u_32.UpdateCategory("Fruit")
		end
	else
		v_u_32.UpdateCategory("Pet")
	end
	v_u_390 = true
end
local v404 = script.CategoryFrame:Clone()
v404.Size = v73 and UDim2.fromScale(0.08, 1) or v404.Size
v404.Parent = v396
local v405 = v404.CategoryTemplate
local v_u_406 = v396
local function v414(p407, p408)
	local v409, v410, v411 = p407:ToHSV()
	local v412 = v411 + p408
	local v413 = math.clamp(v412, 0, 1)
	return Color3.fromHSV(v409, v410, v413)
end
local function v418(p415, p416)
	-- upvalues: (ref) v_u_21
	local v417
	if v_u_21 then
		v417 = p416.Name == "PetsOnly" and true or p416.Name == "Fruit"
	else
		v417 = not p416.Hidden
	end
	p415.Visible = v417
end
for _, v_u_419 in v4 do
	local v_u_420 = v_u_419.Name
	local v_u_421 = v405:Clone()
	local v422 = v_u_421.ImageButton
	local v423 = v_u_421.BackgroundColor3
	local v_u_424 = v_u_398:Create(v_u_421, TweenInfo.new(0.2), {
		["BackgroundColor3"] = v414(v423, 0.2)
	})
	local v_u_425 = v_u_398:Create(v_u_421, TweenInfo.new(0.2), {
		["BackgroundColor3"] = v423
	})
	v422.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_424
		v_u_424:Play()
	end)
	v422.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_425
		v_u_425:Play()
	end)
	v422.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_425
		v_u_425:Play()
	end)
	v422.MouseButton1Up:Connect(function()
		-- upvalues: (copy) v_u_424, (ref) v_u_402, (copy) v_u_420
		v_u_424:Play()
		v_u_402(v_u_420)
	end)
	v422.Image = v_u_419.Image
	v418(v_u_421, v_u_419)
	v_u_421.Parent = v404
	v_u_11:Connect(function()
		-- upvalues: (copy) v_u_421, (copy) v_u_419, (ref) v_u_21
		local v426 = v_u_421
		local v427 = v_u_419
		local v428
		if v_u_21 then
			v428 = v427.Name == "PetsOnly" and true or v427.Name == "Fruit"
		else
			v428 = not v427.Hidden
		end
		v426.Visible = v428
	end)
end
local v429 = v_u_107("TextButton", "VRInventorySelector")
v429.Position = UDim2.new(0, 0, 0, 0)
v429.Size = UDim2.new(1, 0, 1, 0)
v429.BackgroundTransparency = 1
v429.Text = ""
v429.Parent = v_u_406
local v430 = v_u_107("ImageLabel", "Selector")
v430.Size = UDim2.new(1, 0, 1, 0)
v430.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
v430.ScaleType = Enum.ScaleType.Slice
v430.SliceCenter = Rect.new(12, 12, 52, 52)
v430.Visible = false
v429.SelectionImageObject = v430
v429.MouseButton1Click:Connect(function()
	vrMoveSlotToInventory()
end)
local v_u_431 = v_u_107("ScrollingFrame", "ScrollingFrame")
v_u_431.Selectable = false
v_u_431.CanvasSize = UDim2.new(0, 0, 0, 0)
v_u_431.Parent = v_u_406
local v432 = v_u_107("Frame", "UIGridFrame")
v432.Selectable = false
v432.Size = UDim2.new(1, -10, 1, 0)
v432.Position = UDim2.new(0, 5, 0, 0)
v432.Parent = v_u_431
local v433 = Instance.new("UIGridLayout")
v433.SortOrder = Enum.SortOrder.LayoutOrder
v433.CellSize = UDim2.new(0, v_u_71, 0, v_u_71)
v433.CellPadding = UDim2.new(0, 5, 0, 5)
v433.Parent = v432
local v_u_434 = v387("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_434.Size = UDim2.new(0, 34, 0, 34)
v_u_434.Position = UDim2.new(0.5, -v_u_434.Size.X.Offset / 2, 0, 43)
v_u_434.Icon.Position = v_u_434.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_434.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_431, (ref) v_u_71
	local v435 = v_u_431
	local v436 = Vector2.new
	local v437 = v_u_431.CanvasPosition.X
	local v438 = v_u_431.CanvasSize.Y.Offset - v_u_431.AbsoluteWindowSize.Y
	local v439 = v_u_431.CanvasPosition.Y - (v_u_71 + 5)
	local v440 = math.max(0, v439)
	v435.CanvasPosition = v436(v437, (math.min(v438, v440)))
end)
local v_u_441 = v387("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
v_u_441.Rotation = 180
v_u_441.Icon.Position = v_u_441.Icon.Position - UDim2.new(0, 0, 0, 2)
v_u_441.Size = UDim2.new(0, 34, 0, 34)
v_u_441.Position = UDim2.new(0.5, -v_u_441.Size.X.Offset / 2, 1, -v_u_441.Size.Y.Offset - 3)
v_u_441.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_431, (ref) v_u_71
	local v442 = v_u_431
	local v443 = Vector2.new
	local v444 = v_u_431.CanvasPosition.X
	local v445 = v_u_431.CanvasSize.Y.Offset - v_u_431.AbsoluteWindowSize.Y
	local v446 = v_u_431.CanvasPosition.Y + (v_u_71 + 5)
	local v447 = math.max(0, v446)
	v442.CanvasPosition = v443(v444, (math.min(v445, v447)))
end)
v_u_431.Changed:Connect(function(p448)
	-- upvalues: (ref) v_u_431, (ref) v_u_434, (ref) v_u_441
	if p448 == "AbsoluteWindowSize" or (p448 == "CanvasPosition" or p448 == "CanvasSize") then
		local v449 = v_u_431.CanvasPosition.Y ~= 0
		local v450 = v_u_431.CanvasPosition.Y < v_u_431.CanvasSize.Y.Offset - v_u_431.AbsoluteWindowSize.Y
		v_u_434.Visible = v449
		v_u_441.Visible = v450
	end
end)
v123()
local v_u_451 = v_u_68:Create("Frame")({
	["Name"] = "GamepadHintsFrame",
	["Size"] = UDim2.new(0, v_u_392.Size.X.Offset, 0, v_u_70 and 95 or 60),
	["BackgroundTransparency"] = 1,
	["Visible"] = false,
	["Parent"] = v391
})
local function v457(p_u_452, p453)
	-- upvalues: (copy) v_u_68, (copy) v_u_451, (copy) v_u_58, (copy) v_u_70, (copy) v_u_32
	local v454 = v_u_68:Create("Frame")({
		["Name"] = "HintFrame",
		["Size"] = UDim2.new(1, 0, 1, -5),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundTransparency"] = 1,
		["Parent"] = v_u_451
	})
	local v_u_455 = v_u_68:Create("ImageLabel")({
		["Name"] = "HintImage",
		["Size"] = UDim2.fromScale(1, 1),
		["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
		["BackgroundTransparency"] = 1,
		["Image"] = v_u_58:GetImageForKeyCode(p_u_452),
		["Parent"] = v454
	})
	local v456 = v_u_68:Create("TextLabel")({
		["Name"] = "HintText",
		["Position"] = UDim2.new(0, v_u_70 and 100 or 70, 0, 0),
		["Size"] = UDim2.new(1, -(v_u_70 and 100 or 70), 1, 0),
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = v_u_70 and Enum.FontSize.Size36 or Enum.FontSize.Size24,
		["BackgroundTransparency"] = 1,
		["Text"] = p453,
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextWrapped"] = true,
		["Parent"] = v454
	})
	Instance.new("UITextSizeConstraint", v456).MaxTextSize = v456.TextSize
	v_u_32.StateChanged.Event:Connect(function()
		-- upvalues: (copy) v_u_455, (ref) v_u_58, (copy) p_u_452
		v_u_455.Image = v_u_58:GetImageForKeyCode(p_u_452)
	end)
end
local function v_u_463()
	-- upvalues: (copy) v_u_451, (ref) v_u_392, (copy) v_u_70, (ref) v_u_406
	v_u_451.Size = UDim2.new(v_u_392.Size.X.Scale, v_u_392.Size.X.Offset, 0, v_u_70 and 95 or 60)
	v_u_451.Position = UDim2.new(v_u_392.Position.X.Scale, v_u_392.Position.X.Offset, v_u_406.Position.Y.Scale, v_u_406.Position.Y.Offset - v_u_451.Size.Y.Offset)
	local v458 = v_u_451:GetChildren()
	local v459 = 0
	for v460 = 1, #v458 do
		v458[v460].Size = UDim2.new(1, 0, 1, -5)
		v458[v460].Position = UDim2.new(0, 0, 0, 0)
		v459 = v459 + (v458[v460].HintText.Position.X.Offset + v458[v460].HintText.TextBounds.X)
	end
	local v461 = (v_u_451.AbsoluteSize.X - v459) / (#v458 - 1)
	for v462 = 1, #v458 do
		v458[v462].Position = v462 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, v458[v462 - 1].Position.X.Offset + v458[v462 - 1].Size.X.Offset + v461, 0, 0)
		v458[v462].Size = UDim2.new(0, v458[v462].HintText.Position.X.Offset + v458[v462].HintText.TextBounds.X, 1, -5)
	end
end
v457(Enum.KeyCode.ButtonX, "Remove From Hotbar")
v457(Enum.KeyCode.ButtonA, "Select/Swap")
v457(Enum.KeyCode.ButtonB, "Close Backpack")
local v464 = v_u_107("Frame", "Search")
local v465 = Instance.new("UICorner")
v465.CornerRadius = script:GetAttribute("CornerRadius")
v465.Parent = v464
v464.BackgroundColor3 = v43
v464.BackgroundTransparency = v44
v464.Size = UDim2.new(0, 190, 0, 30)
v464.Position = UDim2.new(1, -v464.Size.X.Offset - 5, 0, 5)
v464.Parent = v_u_406
local v_u_466 = v_u_107("TextBox", "TextBox")
v_u_466.PlaceholderText = "search"
v_u_466.ClearTextOnFocus = false
v_u_466.FontSize = Enum.FontSize.Size24
v_u_466.TextXAlignment = Enum.TextXAlignment.Left
local v467 = Instance.new("UIPadding")
v467.Parent = v_u_466
v467.PaddingLeft = UDim.new(0, 8)
v_u_466.Size = v464.Size - UDim2.fromOffset(0, 0)
v_u_466.Position = UDim2.new(0, 0, 0, 0)
v_u_466.Parent = v464
local v_u_468 = script.StrokeTemplate:Clone()
v_u_468.Enabled = false
v_u_468.Parent = v464
task.spawn(function()
	-- upvalues: (copy) v_u_468, (copy) v_u_398
	while true do
		repeat
			task.wait()
		until v_u_468.Enabled
		local v469 = v_u_398:Create(v_u_468.UIGradient, TweenInfo.new(0.05), {
			["Rotation"] = v_u_468.UIGradient.Rotation + 1
		})
		v469:Play()
		v469.Completed:Wait()
	end
end)
local _ = v_u_466
local v_u_470 = v_u_107("TextButton", "X")
local v471 = Instance.new("UICorner")
v471.CornerRadius = script:GetAttribute("CornerRadius")
v471.Parent = v_u_470
v_u_470.Text = "X"
v_u_470.ZIndex = 10
v_u_470.TextColor3 = Color3.new(1, 1, 1)
v_u_470.FontSize = Enum.FontSize.Size24
v_u_470.TextYAlignment = Enum.TextYAlignment.Bottom
v_u_470.BackgroundTransparency = 1
v_u_470.Size = UDim2.new(0, v464.Size.Y.Offset - 10, 0, v464.Size.Y.Offset - 10)
v_u_470.Position = UDim2.new(1, -v_u_470.Size.X.Offset - 10, 0.5, -v_u_470.Size.Y.Offset / 2)
v_u_470.Visible = false
v_u_470.BorderSizePixel = 0
v_u_470.Parent = v464
local function v_u_474()
	-- upvalues: (copy) v_u_86, (copy) v_u_8, (copy) v_u_101, (copy) v_u_114
	for v472, v473 in v_u_86 do
		if v473.Tool then
			if v_u_8:IsItemInTradeFromTool(v473.Tool) then
				if v_u_101 < v472 then
					v473.Frame.Visible = false
				elseif not v473.Hidden then
					v473.Hidden = true
					v473:UpdateVisual()
				end
			elseif v472 <= v_u_101 and v473.Hidden then
				v473.Hidden = false
				v473:UpdateVisual()
			end
		end
	end
	v_u_114()
end
local function v_u_488(_)
	-- upvalues: (copy) v_u_466, (copy) v_u_101, (copy) v_u_86, (ref) v_u_95, (copy) v_u_29, (ref) v_u_18, (copy) v_u_474, (copy) v_u_119, (copy) v_u_470
	local v475 = v_u_466.Text
	local v476 = {}
	for v477 in v475:gmatch("%S+") do
		v476[v477:lower()] = true
	end
	local v478 = {}
	for v479 = v_u_101 + 1, #v_u_86 do
		local v480 = v_u_86[v479]
		local v481 = { v480, (v480:CheckTerms(v476)) }
		table.insert(v478, v481)
	end
	table.sort(v478, function(p482, p483)
		return p482[2] > p483[2]
	end)
	v_u_95 = true
	for _, v484 in v478 do
		local v485 = v484[1]
		local v486 = v484[2]
		local v487 = v485.Favorite
		if (v486 > 0 or v475 == "") and (v_u_29(v485.Tool) and (v_u_18 ~= "Favorited" or v487) and (v_u_18 ~= "NonFavorited" or not v487)) then
			v485.Frame.Visible = true
		else
			v485.Frame.Visible = false
		end
	end
	v_u_474()
	v_u_119()
	v_u_470.ZIndex = 3
end
local function v489(...)
	-- upvalues: (copy) v_u_488
	debug.profilebegin("UpdateFunction")
	v_u_488(...)
	debug.profileend()
end
v_u_32.UpdateFunction = v489
local function v_u_492()
	-- upvalues: (ref) v_u_95, (copy) v_u_101, (copy) v_u_86, (ref) v_u_15, (copy) v_u_29, (copy) v_u_474, (copy) v_u_470, (copy) v_u_119
	v_u_95 = false
	for v490 = v_u_101 + 1, #v_u_86 do
		local v491 = v_u_86[v490]
		if v491 and v491.Tool then
			if v_u_15 == "All" then
				v491.Frame.LayoutOrder = v491.Index
				v491.Frame.Visible = true
			elseif v_u_15 ~= "All" then
				if v_u_29(v491.Tool) then
					v491.Frame.Visible = true
				else
					v491.Frame.Visible = false
				end
			end
		end
	end
	v_u_474()
	v_u_470.ZIndex = 0
	v_u_119()
end
local v_u_493 = v_u_492
v_u_470.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_492, (copy) v_u_466
	v_u_492()
	v_u_466.Text = ""
end)
v_u_466.Changed:Connect(function(p494)
	-- upvalues: (ref) v_u_21, (ref) v_u_402, (copy) v_u_466, (copy) v_u_488, (copy) v_u_470, (copy) v_u_468
	if p494 == "Text" then
		if not v_u_21 then
			v_u_402("All")
		end
		local v495 = v_u_466.Text
		v_u_488()
		local v496 = v_u_470
		local v497
		if v495 == "" then
			v497 = false
		else
			v497 = v495 ~= ""
		end
		v496.Visible = v497
		local v498 = v_u_468
		local v499
		if v495 == "" then
			v499 = false
		else
			v499 = v495 ~= ""
		end
		v498.Enabled = v499
	end
end)
v_u_466.FocusLost:Connect(function(p500)
	-- upvalues: (copy) v_u_488
	if p500 then
		v_u_488()
	end
end)
local v_u_501 = script:WaitForChild("FavoriteOnly")
v_u_466.Size = v464.Size - UDim2.fromOffset(0, 0)
v_u_466.Position = UDim2.new(0, 0, 0, 0)
v_u_501.Position = v_u_466.Parent.Position - UDim2.fromOffset(v_u_466.Size.Y.Offset * 1.25, 0)
v_u_501.Size = UDim2.fromOffset(v_u_466.Size.Y.Offset, v_u_466.Size.Y.Offset)
v_u_501.ImageButton.Activated:Connect(function()
	-- upvalues: (ref) v_u_18, (copy) v_u_14, (copy) v_u_501, (copy) v_u_20, (ref) v_u_390
	local v502 = v_u_18
	local v503 = table.find(v_u_14, v502)
	local v504 = ("Invalid Filter \"%*\" passed to GetNextFilter"):format(v502)
	assert(v503, v504)
	v_u_18 = v_u_14[v503 % #v_u_14 + 1]
	v_u_501.ImageButton.Image = v_u_20[v_u_18]
	v_u_390 = true
end)
v_u_501.Parent = v_u_466.Parent.Parent
v_u_32.StateChanged.Event:Connect(function(p505)
	-- upvalues: (ref) v_u_406, (copy) v_u_85
	if not (p505 or v_u_406.Visible) then
		v_u_85:deselect()
	end
end)
v_u_89[Enum.KeyCode.Escape.Value] = function(p506)
	-- upvalues: (ref) v_u_406, (copy) v_u_85
	if not p506 then
		if v_u_406.Visible then
			v_u_85:deselect()
		end
	end
end
v_u_89[Enum.KeyCode.ButtonL2.Value] = function(_)
	-- upvalues: (ref) v_u_49, (copy) v_u_126
	if v_u_49 then
		v_u_126(v_u_49)
	end
end
v_u_62.MenuOpened:Connect(function()
	-- upvalues: (ref) v_u_406, (copy) v_u_85
	if v_u_406.Visible then
		v_u_85:deselect()
	end
end)
local function v_u_509(_, p507, _)
	-- upvalues: (copy) v_u_62, (copy) v_u_101, (copy) v_u_86, (ref) v_u_493
	if p507 == Enum.UserInputState.Begin then
		if v_u_62.SelectedObject then
			for v508 = 1, v_u_101 do
				if v_u_86[v508].Frame == v_u_62.SelectedObject and v_u_86[v508].Tool then
					v_u_86[v508]:MoveToInventory()
					v_u_493()
					return
				end
			end
			v_u_493()
		end
	else
		return
	end
end
v347(false)
v_u_61:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
function v_u_32.OpenClose()
	-- upvalues: (copy) v_u_90, (ref) v_u_406, (copy) v_u_114, (ref) v_u_392, (copy) v_u_101, (copy) v_u_86, (ref) v_u_98, (copy) v_u_57, (copy) v_u_58, (copy) v_u_463, (copy) v_u_451, (copy) v_u_65, (copy) v_u_509, (copy) v_u_32, (ref) v_u_21
	if not next(v_u_90) then
		v_u_406.Visible = not v_u_406.Visible
		local v510 = v_u_406.Visible
		v_u_114()
		v_u_392.Active = not v_u_392.Active
		for v511 = 1, v_u_101 do
			if v_u_86[v511] then
				v_u_86[v511]:SetClickability(not v510)
			end
		end
	end
	if v_u_406.Visible then
		if v_u_98 then
			if v_u_57[v_u_58:GetLastInputType()] then
				v_u_463()
				v_u_451.Visible = not v_u_58.VREnabled
			end
			enableGamepadInventoryControl()
		end
	else
		if v_u_98 then
			v_u_451.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if v_u_406.Visible then
		v_u_65:BindAction("RBXRemoveSlot", v_u_509, false, Enum.KeyCode.ButtonX)
	else
		v_u_65:UnbindAction("RBXRemoveSlot")
	end
	v_u_32.IsOpen = v_u_406.Visible
	v_u_32.StateChanged:Fire(v_u_406.Visible)
	if not v_u_32.IsOpen and v_u_21 then
		v_u_32.SetTrading(false)
	end
end
v_u_74.CharacterAdded:Connect(v325)
if v_u_74.Character then
	v325(v_u_74.Character)
end
v_u_58.InputBegan:Connect(v335)
v_u_58.TextBoxFocused:Connect(function()
	-- upvalues: (ref) v_u_94
	v_u_94 = true
end)
v_u_58.TextBoxFocusReleased:Connect(function()
	-- upvalues: (ref) v_u_94
	v_u_94 = false
end)
v_u_89[v_u_56] = function()
	-- upvalues: (ref) v_u_83
	if v_u_83 then
		v_u_83:UnequipTools()
	end
end
v_u_58.Changed:Connect(v339)
v339("KeyboardEnabled")
if v_u_58:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
v_u_58.GamepadConnected:Connect(function(p512)
	if p512 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
v_u_58.GamepadDisconnected:Connect(function(p513)
	if p513 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)
function v_u_32.SetBackpackEnabled(_, p514)
	-- upvalues: (ref) v_u_50
	v_u_50 = p514
end
function v_u_32.IsOpened(_)
	-- upvalues: (copy) v_u_32
	return v_u_32.IsOpen
end
function v_u_32.GetBackpackEnabled(_)
	-- upvalues: (ref) v_u_50
	return v_u_50
end
function v_u_32.GetStateChangedEvent(_)
	-- upvalues: (ref) v_u_84
	return v_u_84.StateChanged
end
v66.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_381, (ref) v_u_50, (copy) v_u_8, (ref) v_u_21
	local v515 = v_u_381
	local v516 = v_u_50
	if v516 then
		v516 = v_u_8.CurrentTradeReplicator == nil and true or v_u_21
	end
	v515(v516)
end)
v45.Event:Connect(function(p517, p518)
	-- upvalues: (copy) v_u_32
	if p517 == "SetBackpackEnabled" then
		v_u_32:SetBackpackEnabled(p518)
	elseif p517 == "SetInventoryOpen" then
		if type(p518) == "boolean" and p518 == true then
			v_u_32.IsOpen = true
			return
		end
		if type(p518) == "boolean" then
			v_u_32.IsOpen = false
			return
		end
	elseif p517 == "ToggleBackpack" then
		v_u_32.OpenClose()
	end
end)
v60.GameEvents.ABTestingEvents:WaitForChild("HideInventoryItem").Event:Connect(function(p519)
	-- upvalues: (copy) v_u_86, (copy) v_u_114, (copy) v_u_122
	for _, v520 in v_u_86 do
		local v521 = v520.Tool
		if v521 and string.find(v521.Name, p519) then
			v520:Clear()
			v_u_114()
			v_u_122()
		end
	end
end)
return v_u_32