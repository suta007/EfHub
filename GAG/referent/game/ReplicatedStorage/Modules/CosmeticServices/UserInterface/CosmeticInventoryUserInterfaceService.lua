local v_u_1 = Color3.fromRGB(255, 255, 255)
local v_u_2 = Color3.fromRGB(140, 140, 140)
local v_u_3 = game:GetService("GamepadService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("ReplicatedStorage")
local v_u_6 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = game:GetService("Players").LocalPlayer
local v9 = v_u_8.PlayerGui
local v_u_10 = v9:WaitForChild("CosmeticUI")
local v_u_11 = v_u_10:WaitForChild("CosmeticInventory")
local v_u_12 = v9:WaitForChild("BackpackGui")
local v_u_13 = v9:WaitForChild("ActivePetUI")
local v_u_14 = require(v_u_5.Modules.WaitForDescendant)
local v15 = require(v_u_5.Modules.AdjustBrightnessHSV)
local v_u_16 = require(v_u_5.Modules.DataService)
local v_u_17 = require(v_u_5.Modules.GuiController)
local v_u_18 = require(v_u_5.Modules.CosmeticServices.CosmeticService)
local v_u_19 = require(v_u_5.Modules.GetUIElementWithTag)
local v_u_20 = require(v_u_5.Modules.Notification)
local v21 = require(v_u_5.Modules.Icon)
require(v_u_5.Modules.UpdateService)
local v_u_22 = require(v_u_5.Modules.CountDictionary)
local v_u_23 = require(v_u_5.Modules.PlaySound)
local v_u_24 = require(v_u_5.Modules.PlayHoverSound)
local v_u_25 = require(v_u_5.Modules.ModernInputNotificationUserInterfaceService)
local v_u_26 = require(v_u_5.Data.CosmeticRegistry.CosmeticCategoryList)
require(v_u_5.Data.CosmeticRegistry.CosmeticList)
local v_u_27 = require(v_u_5.Modules.TradeControllers.TradeWorldController)
local v28 = require(v_u_5.Modules.PlatformService.Signal)
v_u_14(v_u_11, "SQUARE_INSERTION_POINT")
local v_u_29 = v_u_14(v_u_11, "ACTUAL_FRAME")
local v30 = v_u_14(v_u_11, "MENU_BUTTON")
local v_u_31 = v_u_14(v_u_11, "UISizeConstraint")
local v_u_32 = v_u_14(v_u_11, "ARROW_IMAGE")
local v_u_33 = v_u_14(v_u_11, "SQUARE_INSERTION_POINT")
local v_u_34 = v_u_33:WaitForChild("COSMETIC_TEMPLATE")
local v_u_35 = v_u_14(v_u_11, "SEARCH_TEXT_BOX")
local v36 = v_u_14(v_u_11, "CLOSE_BUTTON")
local v_u_37 = v_u_14(v_u_11, "ACTUAL_TEXTURE")
v_u_14(v_u_11, "TITLE_TEXT")
local v38 = v_u_14(v_u_11, "COSMETIC_WIDGET")
local v_u_39 = v_u_14(v38, "INVENTORY_COUNT")
local v_u_40 = v_u_14(v38, "PLACED_COUNT")
local _ = v_u_14(v38, "SEPERATION_BAR")
local v_u_41 = v_u_14(v_u_11, "DELETE_BUTTON")
local v42 = v_u_14(v_u_11, "CATEGORY_BUTTON")
v_u_14(v_u_11, "CATEGORY_DROPDOWN")
local v_u_43 = v_u_14(v_u_11, "CATEGORY_DROPDOWN")
local v_u_44 = v_u_14(v_u_11, "TITLE_TEXT")
local v_u_45 = {}
for _, v46 in v_u_26 do
	v_u_45[v46.CategoryName] = v46
end
local function v_u_52()
	-- upvalues: (copy) v_u_22, (copy) v_u_18, (copy) v_u_39, (copy) v_u_40
	local v47 = v_u_22(v_u_18:GetAllEquippedCosmetics()) or 0
	local v48 = {}
	for _, v49 in v_u_18:GetAllCosmetics() do
		if v49.Name then
			v48[v49.Name] = true
		end
	end
	local v50 = 0
	for _ in v48 do
		v50 = v50 + 1
	end
	local v51 = v_u_18:GetMutableStat("MaxEquippedCosmetics")
	v_u_39.Text = ("Total Items: %*/%*"):format(v50, (v_u_18:GetMutableStat("MaxCosmeticsInInventory")))
	v_u_40.Text = ("Placed Items: %*/%*"):format(v47, v51)
end
local v_u_53 = v21.new()
v_u_53:setImage("rbxassetid://130953946651026", "deselected")
v_u_53:setImage("rbxassetid://119182315828169", "selected")
v_u_53:setName("CosmeticInventoryIcon")
v_u_53:setImageScale(1.12)
v_u_53:setOrder(-3)
v_u_53:setCaption("Toggle the cosmetic inventory.")
v_u_53.deselectWhenOtherIconSelected = false
local v_u_54 = require(v_u_5.Data.CosmeticRegistry).CosmeticList
local v_u_55 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_55
	v_u_55 = workspace.CurrentCamera
end)
local v_u_56 = {
	["BigScale"] = false,
	["State"] = false,
	["CurrentInventoryState"] = 4,
	["DeletionMode"] = false,
	["CategoryState"] = false,
	["SelectedCategory"] = "ALL",
	["CurrentQuery"] = "",
	["FrameRenderData"] = {
		["CosmeticCounterFrames"] = {},
		["UniqueCosmeticFrames"] = {}
	},
	["OnToggled"] = v28.new()
}
local v_u_57 = v_u_17:GetStateForGui(v_u_10)
v_u_57.ChangeEnabled:Set(true)
function v_u_56.Toggle(_, p58)
	-- upvalues: (copy) v_u_57, (copy) v_u_17, (copy) v_u_10
	if p58 then
		if not v_u_57.Visible:Get() then
			v_u_17:Open(v_u_10)
			return
		end
	elseif v_u_57.Visible:Get() then
		v_u_17:Close(v_u_10)
	end
end
function v_u_56.ChangeScaleMode(_, p59)
	-- upvalues: (copy) v_u_56, (copy) v_u_29, (copy) v_u_6, (copy) v_u_32, (copy) v_u_31, (copy) v_u_37
	v_u_56.BigScale = p59
	local v60 = v_u_29.Size
	local v61 = v_u_29.Size + UDim2.fromScale(0, 1)
	local v62 = v_u_6:Create(v_u_29, TweenInfo.new(0.2), {
		["Size"] = v60
	})
	local v63 = v_u_6:Create(v_u_29, TweenInfo.new(0.2), {
		["Size"] = v61
	})
	local v64 = v_u_6:Create(v_u_32, TweenInfo.new(0.2), {
		["Position"] = v_u_32.Position
	})
	local v65 = v_u_6:Create(v_u_32, TweenInfo.new(0.2), {
		["Position"] = UDim2.fromScale(0.5, 0.5)
	})
	local v66 = v_u_6:Create(v_u_32, TweenInfo.new(0.2), {
		["Rotation"] = 0
	})
	local v67 = v_u_6:Create(v_u_32, TweenInfo.new(0.2), {
		["Rotation"] = 180
	})
	if p59 then
		v63 = v62 or v63
	end
	v63:Play()
	if p59 then
		v64 = v65 or v64
	end
	v64:Play()
	if p59 then
		v66 = v67 or v66
	end
	v66:Play()
	v_u_6:Create(v_u_31, TweenInfo.new(0.2), {
		["MaxSize"] = p59 and Vector2.new(579.67, 115.25) or Vector2.new(579.67, 340)
	}):Play()
	v_u_37.Image = p59 and "rbxassetid://122189350536032" or "rbxassetid://127843077446462"
end
function v_u_56.Search(_, p68)
	-- upvalues: (copy) v_u_56, (copy) v_u_18, (copy) v_u_54
	local v69 = p68:lower()
	v_u_56.CurrentQuery = v69
	local v70 = v_u_56.FrameRenderData.CosmeticCounterFrames
	local v71 = v_u_56.FrameRenderData.UniqueCosmeticFrames
	local v72 = v_u_18:GetAllCosmetics()
	local v73 = v_u_56.SelectedCategory
	local v74 = string.split(v69, " ")
	for v75, v76 in v70 do
		v76.Visible = true
		local v77 = v_u_54[v75]
		local v78 = v73 ~= "ALL" and not table.find(v77.Tags, v73) and true or false
		local v79 = v75:lower()
		local v80 = 0
		for _, v81 in v74 do
			if v79:find(v81) then
				v80 = v80 + 1
			end
		end
		if v79:find(v69) then
			v80 = v80 + 1
		end
		if v80 <= 0 and v69 ~= "" or v78 then
			v76.Visible = false
		else
			v76.LayoutOrder = -v80
			v76.Visible = true
		end
	end
	for v82, v83 in v71 do
		v83.Visible = true
		local v84 = v72[v82].Name
		if v84 then
			local v85 = v_u_54[v84]
			local v86 = v73 ~= "ALL" and not table.find(v85.Tags, v73) and true or false
			local v87 = v84:lower()
			local v88 = 0
			for _, v89 in v74 do
				if v87:find(v89) then
					v88 = v88 + 1
				end
			end
			if v87:find(v69) then
				v88 = v88 + 1
			end
			if v88 <= 0 and v69 ~= "" or v86 then
				v83.Visible = false
			else
				v83.LayoutOrder = -v88
				v83.Visible = true
			end
		end
	end
end
local v_u_90 = Color3.fromRGB(255, 94, 73)
local v_u_91 = v15(v_u_90, -0.35)
local v_u_92 = Color3.fromRGB(255, 255, 255)
local v_u_93 = v15(v_u_92, -0.35)
local v_u_94 = v_u_41:WaitForChild("UIStroke")
local v_u_95 = v_u_14(v_u_41, "DELETE_ICON")
local v96 = v_u_41:WaitForChild("SENSOR")
local function v_u_99(p97)
	-- upvalues: (copy) v_u_93, (copy) v_u_91, (copy) v_u_6, (copy) v_u_94, (copy) v_u_95, (copy) v_u_41
	local v98 = p97 and v_u_93 or v_u_91
	v_u_6:Create(v_u_94, TweenInfo.new(0.1), {
		["Color"] = v98
	}):Play()
	v_u_6:Create(v_u_95, TweenInfo.new(0.1), {
		["ImageColor3"] = v98
	}):Play()
	v_u_6:Create(v_u_41, TweenInfo.new(0.1), {
		["BackgroundColor3"] = v98
	}):Play()
end
local function v_u_102(p100)
	-- upvalues: (copy) v_u_90, (copy) v_u_92, (copy) v_u_6, (copy) v_u_94, (copy) v_u_95, (copy) v_u_41
	local v101 = p100 and v_u_90 or v_u_92
	v_u_6:Create(v_u_94, TweenInfo.new(0.1), {
		["Color"] = v101
	}):Play()
	v_u_6:Create(v_u_95, TweenInfo.new(0.1), {
		["ImageColor3"] = v101
	}):Play()
	v_u_6:Create(v_u_41, TweenInfo.new(0.1), {
		["BackgroundColor3"] = v101
	}):Play()
end
local v_u_103 = {}
function v_u_56.ToggleDeletionMode(_, p104)
	-- upvalues: (copy) v_u_56, (copy) v_u_102, (copy) v_u_44, (copy) v_u_6, (copy) v_u_103
	v_u_56.DeletionMode = p104
	v_u_102(v_u_56.DeletionMode)
	v_u_44.Text = p104 and "DELETION MODE ACTIVE" or "All Cosmetics"
	v_u_6:Create(v_u_44, TweenInfo.new(0.2), {
		["TextColor3"] = v_u_56.DeletionMode and Color3.fromRGB(255, 94, 73) or Color3.fromRGB(255, 255, 255)
	}):Play()
	table.clear(v_u_103)
end
v96.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_24, (copy) v_u_99, (copy) v_u_56
	v_u_24()
	v_u_99(v_u_56.DeletionMode)
end)
v96.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_102, (copy) v_u_56
	v_u_102(v_u_56.DeletionMode)
end)
v96.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_102, (copy) v_u_56
	v_u_102(v_u_56.DeletionMode)
end)
v96.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ToggleDeletionMode(not v_u_56.DeletionMode)
end)
local function v_u_108(p105, p106)
	-- upvalues: (copy) v_u_6
	local v107 = p105:WaitForChild("DeletionStuff")
	v_u_6:Create(v107:WaitForChild("UIStroke"), TweenInfo.new(0.2), {
		["Transparency"] = p106 and 0 or 1
	}):Play()
	v_u_6:Create(v107:WaitForChild("DELETE_ICON"), TweenInfo.new(0.2), {
		["ImageTransparency"] = p106 and 0 or 1
	}):Play()
	v_u_6:Create(v107, TweenInfo.new(0.2), {
		["BackgroundTransparency"] = p106 and 0.6 or 1
	}):Play()
end
local v_u_109 = Color3.fromRGB(255, 255, 255)
local v_u_110 = v15(v_u_109, -0.35)
v42:WaitForChild("UIStroke")
local v_u_111 = v_u_14(v42, "CATEGORY_ICON")
local v112 = v42:WaitForChild("SENSOR")
local v_u_113 = v42:WaitForChild("UIAspectRatioConstraint")
v_u_43:WaitForChild("UIStroke")
local v_u_114 = v_u_43:WaitForChild("INSERTION_POINT")
local v_u_115 = v_u_114:WaitForChild("TEMPLATE")
local v_u_116 = {}
function v_u_56.SetCategory(_, p117)
	-- upvalues: (copy) v_u_45, (copy) v_u_111, (copy) v_u_56, (copy) v_u_44
	v_u_111.Image = v_u_45[p117].Icon
	v_u_56.SelectedCategory = p117
	v_u_44.Text = ("%* Cosmetics"):format((("%*%*"):format(p117:sub(1, 1):upper(), (p117:sub(2, #p117):lower()))))
end
local v_u_118 = false
function v_u_56.ToggleCategoryDropdown(_, p119)
	-- upvalues: (ref) v_u_118, (copy) v_u_56, (copy) v_u_6, (copy) v_u_111, (copy) v_u_26, (copy) v_u_116, (copy) v_u_115, (copy) v_u_109, (copy) v_u_110, (copy) v_u_24, (copy) v_u_114, (copy) v_u_43, (copy) v_u_113
	if not v_u_118 then
		v_u_118 = true
		v_u_56.CategoryState = p119
		v_u_56:Search(v_u_56.CurrentQuery)
		v_u_6:Create(v_u_111, TweenInfo.new(0.2), {
			["ImageTransparency"] = p119 and 1 or 0
		}):Play()
		for v120, v121 in v_u_26 do
			local v_u_122 = v121.CategoryName
			local v123 = v_u_116[v_u_122]
			if not v123 then
				v123 = v_u_115:Clone()
				v_u_116[v_u_122] = v123
				local v_u_124 = v123.CATEGORY_ICON_TEMPLATE
				v123.Visible = true
				v_u_124.ImageTransparency = 1
				local v125 = v123:WaitForChild("SENSOR")
				local function v_u_128(p126)
					-- upvalues: (ref) v_u_109, (ref) v_u_110, (ref) v_u_6, (copy) v_u_124
					local v127 = p126 and v_u_109 or v_u_110
					v_u_6:Create(v_u_124, TweenInfo.new(0.1), {
						["ImageColor3"] = v127
					}):Play()
				end
				v_u_124.ImageColor3 = v_u_110
				v125.MouseEnter:Connect(function()
					-- upvalues: (ref) v_u_24, (copy) v_u_128
					v_u_24()
					v_u_128(true)
				end)
				v125.MouseLeave:Connect(function()
					-- upvalues: (ref) v_u_110, (ref) v_u_6, (copy) v_u_124
					local v129 = {
						["ImageColor3"] = v_u_110
					}
					v_u_6:Create(v_u_124, TweenInfo.new(0.1), v129):Play()
				end)
				v125.MouseButton1Down:Connect(function()
					-- upvalues: (ref) v_u_109, (ref) v_u_110, (ref) v_u_6, (copy) v_u_124
					local v130 = {
						["ImageColor3"] = v_u_109 or v_u_110
					}
					v_u_6:Create(v_u_124, TweenInfo.new(0.1), v130):Play()
				end)
				v125.MouseButton1Up:Connect(function()
					-- upvalues: (ref) v_u_110, (ref) v_u_6, (copy) v_u_124
					local v131 = {
						["ImageColor3"] = v_u_110
					}
					v_u_6:Create(v_u_124, TweenInfo.new(0.1), v131):Play()
				end)
				v125.MouseButton1Click:Connect(function()
					-- upvalues: (ref) v_u_56, (copy) v_u_122
					v_u_56:SetCategory(v_u_122)
					v_u_56:ToggleCategoryDropdown(false)
				end)
				v_u_124.Image = v121.Icon
				v123.Parent = v_u_114
			end
			v123.LayoutOrder = v120
		end
		local v132 = v_u_116[v_u_56.SelectedCategory]
		if v132 then
			v132.LayoutOrder = -1000
			v132.CATEGORY_ICON_TEMPLATE.ImageTransparency = p119 and 0 or 1
		end
		if p119 then
			v_u_43.Visible = true
			local v133 = v_u_6:Create(v_u_113, TweenInfo.new(0.3), {
				["AspectRatio"] = p119 and #v_u_26 or 1
			})
			v133:Play()
			v133.Completed:Wait()
			for _, v134 in v_u_26 do
				local v135 = v_u_116[v134.CategoryName]
				if v134 ~= v135 then
					local v136 = v_u_6:Create(v135.CATEGORY_ICON_TEMPLATE, TweenInfo.new(0.1), {
						["ImageTransparency"] = p119 and 0 or 1
					})
					v136:Play()
					v136.Completed:Wait()
				end
			end
		end
		if not p119 then
			for v137 = #v_u_26, 1, -1 do
				local v138 = v_u_26[v137]
				local v139 = v_u_116[v138.CategoryName]
				if v138 ~= v139 then
					local v140 = v_u_6:Create(v139.CATEGORY_ICON_TEMPLATE, TweenInfo.new(0.1), {
						["ImageTransparency"] = p119 and 0 or 1
					})
					v140:Play()
					v140.Completed:Wait()
				end
			end
			v_u_43.Visible = false
			local v141 = v_u_6:Create(v_u_113, TweenInfo.new(0.3), {
				["AspectRatio"] = p119 and #v_u_26 or 1
			})
			v141:Play()
			v141.Completed:Wait()
		end
		v_u_118 = false
	end
end
local function v_u_144(p142)
	-- upvalues: (copy) v_u_109, (copy) v_u_110, (copy) v_u_6, (copy) v_u_111
	local v143 = p142 and v_u_109 or v_u_110
	v_u_6:Create(v_u_111, TweenInfo.new(0.1), {
		["ImageColor3"] = v143
	}):Play()
end
v_u_111.ImageColor3 = v_u_110
v112.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_24, (copy) v_u_144
	v_u_24()
	v_u_144(true)
end)
v112.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_110, (copy) v_u_6, (copy) v_u_111
	local v145 = {
		["ImageColor3"] = v_u_110
	}
	v_u_6:Create(v_u_111, TweenInfo.new(0.1), v145):Play()
end)
v112.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_109, (copy) v_u_110, (copy) v_u_6, (copy) v_u_111
	local v146 = {
		["ImageColor3"] = v_u_109 or v_u_110
	}
	v_u_6:Create(v_u_111, TweenInfo.new(0.1), v146):Play()
end)
v112.MouseButton1Up:Connect(function()
	-- upvalues: (copy) v_u_110, (copy) v_u_6, (copy) v_u_111
	local v147 = {
		["ImageColor3"] = v_u_110
	}
	v_u_6:Create(v_u_111, TweenInfo.new(0.1), v147):Play()
end)
v112.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ToggleCategoryDropdown(not v_u_56.CategoryState)
end)
local v_u_148 = v_u_11.UIScale
local v149 = v30.SENSOR
local v_u_150 = v_u_6:Create(v30.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v30.ANIMATED_TEXTURE.ImageColor3
})
local v_u_151 = v_u_6:Create(v30.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v15(v30.ANIMATED_TEXTURE.ImageColor3, 0.2)
})
v149.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_150
	v_u_150:Play()
end)
v149.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_151, (copy) v_u_24
	v_u_151:Play()
	v_u_24()
end)
v149.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ChangeScaleMode(not v_u_56.BigScale)
end)
task.spawn(function()
	-- upvalues: (ref) v_u_55, (copy) v_u_6, (copy) v_u_148
	while true do
		repeat
			task.wait(0.1)
			local v152 = v_u_55.ViewportSize.X
		until v152 ~= nil
		local v153 = v_u_6
		local v154 = v_u_148
		local v155 = TweenInfo.new(0.2)
		local v156 = {}
		local v157 = 0.0011111111111111111 * v152
		v156.Scale = math.min(v157, 1.5)
		v153:Create(v154, v155, v156):Play()
	end
end)
local _ = v_u_11.UIScale
local v158 = v36.SENSOR
local v_u_159 = v_u_6:Create(v36.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v36.ANIMATED_TEXTURE.ImageColor3
})
local v_u_160 = v_u_6:Create(v36.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v15(v36.ANIMATED_TEXTURE.ImageColor3, 0.2)
})
v158.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_159
	v_u_159:Play()
end)
v158.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_160, (copy) v_u_24
	v_u_160:Play()
	v_u_24()
end)
v158.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56, (copy) v_u_53
	v_u_56:Toggle(false)
	v_u_53:deselect()
end)
local function v_u_170()
	-- upvalues: (copy) v_u_18
	local v161 = v_u_18:GetAllEquippedCosmetics()
	local v162 = v_u_18:GetAllCosmetics()
	local v163 = {
		["ReturnedItemMap"] = {},
		["UniqueItemMap"] = {}
	}
	local v164 = v163.ReturnedItemMap
	local v165 = v163.UniqueItemMap
	for v166, v167 in v162 do
		if not v161[v166] then
			local v168 = v167.Name
			if v168 then
				local v169 = v167.Data
				if v169 then
					if not v164[v168] then
						v164[v168] = 0
					end
					if next(v169) then
						v165[v166] = true
					else
						v164[v168] = v164[v168] + 1
					end
				else
					warn(v166, "Cosmetic is corrupted and has no ArbitraryData")
				end
			else
				warn(v166, "Cosmetic is corrupted and has no name!")
			end
		end
	end
	return v163
end
local function v_u_177(p171)
	-- upvalues: (copy) v_u_18, (copy) v_u_103
	local v172 = v_u_18:GetAllEquippedCosmetics()
	for v173, v174 in v_u_18:GetAllCosmetics() do
		if not (v_u_103[v173] or v172[v173]) then
			local v175 = v174.Name
			if v175 then
				if v175 == p171 then
					local v176 = v174.Data
					if v176 then
						if not next(v176) then
							return v173
						end
					else
						warn(v173, "Cosmetic is corrupted and has no ArbitraryData")
					end
				end
			else
				warn(v173, "Cosmetic is corrupted and has no name!")
			end
		end
	end
end
local function v_u_218()
	-- upvalues: (copy) v_u_170, (copy) v_u_56, (copy) v_u_18, (copy) v_u_54, (copy) v_u_34, (copy) v_u_14, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2, (copy) v_u_177, (copy) v_u_103, (copy) v_u_20, (copy) v_u_25, (copy) v_u_22, (copy) v_u_8, (copy) v_u_23, (copy) v_u_24, (copy) v_u_19, (copy) v_u_108, (copy) v_u_33
	local v178 = v_u_170()
	local v179 = v_u_56.FrameRenderData.UniqueCosmeticFrames
	local v180 = v_u_56.FrameRenderData.CosmeticCounterFrames
	local v181 = v178.ReturnedItemMap
	local v182 = v178.UniqueItemMap
	local v183 = v_u_18:GetAllCosmetics()
	for v184, _ in v180 do
		if v181[v184] then
			if v181[v184] <= 0 and v184 then
				if typeof(v184) == "string" then
					local v185 = v_u_56.FrameRenderData.CosmeticCounterFrames
					local v186 = v185[v184]
					if v186 then
						v186:Destroy()
						v185[v184] = nil
					end
				end
			end
		elseif v184 then
			if typeof(v184) == "string" then
				local v187 = v_u_56.FrameRenderData.CosmeticCounterFrames
				local v188 = v187[v184]
				if v188 then
					v188:Destroy()
					v187[v184] = nil
				end
			end
		end
	end
	for v189, _ in v179 do
		if not v182[v189] and v189 then
			if typeof(v189) == "string" then
				local v190 = v_u_56.FrameRenderData.UniqueCosmeticFrames
				local v191 = v190[v189]
				if v191 then
					v191:Destroy()
					v190[v189] = nil
				end
			end
		end
	end
	for v_u_192, v193 in v181 do
		if v193 <= 0 then
			return
		end
		local v_u_194 = v_u_54[v_u_192]
		if v_u_194 then
			local v195 = v180[v_u_192]
			if not v195 then
				local v_u_196 = v_u_34:Clone()
				local v197 = v_u_14(v_u_196, "SENSOR")
				local v198 = {
					["BackgroundColor3"] = v_u_1
				}
				local v_u_199 = v_u_6:Create(v_u_196.ActualFrame, TweenInfo.new(0.2), v198)
				local v200 = {
					["BackgroundColor3"] = v_u_2
				}
				local v_u_201 = v_u_6:Create(v_u_196.ActualFrame, TweenInfo.new(0.2), v200)
				v197.MouseButton1Down:Connect(function()
					-- upvalues: (copy) v_u_201
					v_u_201:Play()
				end)
				v197.MouseButton1Up:Connect(function()
					-- upvalues: (copy) v_u_199, (ref) v_u_56, (ref) v_u_177, (copy) v_u_192, (ref) v_u_103, (copy) v_u_194, (ref) v_u_20, (ref) v_u_25, (ref) v_u_18, (ref) v_u_22, (ref) v_u_8, (ref) v_u_23
					v_u_199:Play()
					if v_u_56.DeletionMode then
						local v_u_202 = v_u_177(v_u_192)
						if v_u_202 then
							v_u_103[v_u_202] = true
							if v_u_194.Undeletable then
								v_u_20:CreateNotification((("%* is undeletable."):format(v_u_192)))
							else
								v_u_25:CreateNotification({
									["Icon"] = v_u_194.Icon,
									["Text"] = ("Are you sure you want to destroy \"%*\"?"):format(v_u_192),
									["OnConfirm"] = function(p203)
										-- upvalues: (ref) v_u_18, (copy) v_u_202, (ref) v_u_103
										v_u_18:DestroyCosmetic(v_u_202)
										v_u_103[p203.OccupiedUUID] = nil
									end,
									["OnDecline"] = function(p204)
										-- upvalues: (ref) v_u_103
										v_u_103[p204.OccupiedUUID] = nil
									end
								}).OccupiedUUID = v_u_202
							end
						else
							return
						end
					elseif v_u_18:HasMaxEquipped() then
						return v_u_20:CreateNotification((("Cannot place anymore you have max placed objects! %*"):format((v_u_22(v_u_18:GetAllEquippedCosmetics())))))
					elseif v_u_18:CanEquipAtLocation(v_u_8) then
						local v205 = v_u_177(v_u_192)
						if v205 then
							v_u_18:Equip(v205)
							task.delay(0.2, function()
								-- upvalues: (ref) v_u_23
								v_u_23("rbxassetid://99990810464653").Volume = 0.5
							end)
						end
					else
						return v_u_20:CreateNotification("Cannot place cosmetic out of farm!")
					end
				end)
				v197.MouseEnter:Connect(function()
					-- upvalues: (copy) v_u_199, (ref) v_u_24, (ref) v_u_19, (ref) v_u_196, (copy) v_u_201, (ref) v_u_56, (ref) v_u_108
					v_u_199:Play()
					v_u_24()
					task.spawn(function()
						-- upvalues: (ref) v_u_19, (ref) v_u_196, (ref) v_u_201
						repeat
							task.wait()
						until v_u_19("CosmeticItemTemplate") ~= v_u_196
						v_u_201:Play()
					end)
					if v_u_56.DeletionMode then
						v_u_108(v_u_196, true)
					end
				end)
				v197.MouseLeave:Connect(function()
					-- upvalues: (ref) v_u_108, (ref) v_u_196, (copy) v_u_201
					v_u_108(v_u_196, false)
					v_u_201:Play()
				end)
				v_u_196.Visible = true
				v_u_196.Parent = v_u_33
				v180[v_u_192] = v_u_196
				v195 = v_u_196
			end
			local v206 = v_u_14(v195, "COUNTER_TEXT")
			v206.Text = ("x%*"):format(v193)
			v_u_14(v195, "ITEM_ICON").Image = v_u_194.Icon
			v206.Visible = v193 >= 2
		else
			warn(v_u_192, "has no attached registry data! Skipping render.")
		end
	end
	for v_u_207 in v182 do
		local v_u_208 = v183[v_u_207]
		if v_u_208 then
			local v_u_209 = v_u_208.Name
			local v_u_210 = v_u_54[v_u_209]
			if v_u_210 then
				local v211 = v179[v_u_207]
				if not v211 then
					local v_u_212 = v_u_34:Clone()
					local v213 = v_u_14(v_u_212, "SENSOR")
					local v214 = {
						["BackgroundColor3"] = v_u_1
					}
					local v_u_215 = v_u_6:Create(v_u_212.ActualFrame, TweenInfo.new(0.2), v214)
					local v216 = {
						["BackgroundColor3"] = v_u_2
					}
					local v_u_217 = v_u_6:Create(v_u_212.ActualFrame, TweenInfo.new(0.2), v216)
					v213.MouseButton1Down:Connect(function()
						-- upvalues: (copy) v_u_217
						v_u_217:Play()
					end)
					v213.MouseButton1Up:Connect(function()
						-- upvalues: (copy) v_u_215, (ref) v_u_56, (copy) v_u_210, (ref) v_u_20, (copy) v_u_208, (ref) v_u_25, (copy) v_u_209, (ref) v_u_18, (copy) v_u_207, (ref) v_u_22, (ref) v_u_8, (ref) v_u_23
						v_u_215:Play()
						if v_u_56.DeletionMode then
							if v_u_210.Undeletable then
								v_u_20:CreateNotification((("%* is undeletable."):format(v_u_208.Name)))
							else
								v_u_25:CreateNotification({
									["Icon"] = v_u_210.Icon,
									["Text"] = ("Are you sure you want to destroy \"%*\"?"):format(v_u_209),
									["OnConfirm"] = function()
										-- upvalues: (ref) v_u_18, (ref) v_u_207
										v_u_18:DestroyCosmetic(v_u_207)
									end
								})
							end
						else
							if v_u_18:HasMaxEquipped() then
								return v_u_20:CreateNotification((("Cannot place anymore you have max placed objects! %*"):format((v_u_22(v_u_18:GetAllEquippedCosmetics())))))
							end
							if not v_u_18:CanEquipAtLocation(v_u_8) then
								return v_u_20:CreateNotification("Cannot place cosmetic out of farm!")
							end
							v_u_18:Equip(v_u_207)
							v_u_23("rbxassetid://99990810464653").Volume = 0.5
							return
						end
					end)
					v213.MouseEnter:Connect(function()
						-- upvalues: (copy) v_u_215, (ref) v_u_24, (ref) v_u_19, (ref) v_u_212, (copy) v_u_217, (ref) v_u_56, (ref) v_u_108
						v_u_215:Play()
						v_u_24()
						task.spawn(function()
							-- upvalues: (ref) v_u_19, (ref) v_u_212, (ref) v_u_217
							repeat
								task.wait()
							until v_u_19("CosmeticItemTemplate") ~= v_u_212
							v_u_217:Play()
						end)
						if v_u_56.DeletionMode then
							v_u_108(v_u_212, true)
						end
					end)
					v213.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_108, (ref) v_u_212, (copy) v_u_217
						v_u_108(v_u_212, false)
						v_u_217:Play()
					end)
					v_u_212.Visible = true
					v_u_212.Parent = v_u_33
					v179[v_u_207] = v_u_212
					v211 = v_u_212
				end
				v_u_14(v211, "ITEM_ICON").Image = v_u_210.Icon
			else
				warn(v_u_209, v_u_207, "has no attached registry data! Skipping render.")
			end
		end
	end
end
v_u_218()
v_u_52()
v_u_16:GetPathSignal("CosmeticData/MutableStats/@"):Connect(function()
	-- upvalues: (copy) v_u_52
	v_u_52()
end)
v_u_16:GetPathSignal("CosmeticData/@"):Connect(function()
	-- upvalues: (copy) v_u_52, (copy) v_u_218
	v_u_52()
	v_u_218()
end)
v_u_16:GetPathSignal("SaveSlots/@"):Connect(function()
	-- upvalues: (copy) v_u_218, (copy) v_u_52
	v_u_218()
	v_u_52()
end)
v_u_35:GetPropertyChangedSignal("Text"):Connect(function()
	-- upvalues: (copy) v_u_56, (copy) v_u_35
	v_u_56:Search(v_u_35.Text)
end)
v_u_57.Visible:Observe(function(p219, _)
	-- upvalues: (copy) v_u_53
	if p219 then
		v_u_53:select()
	else
		v_u_53:deselect()
	end
end)
v_u_4.InputEnded:Connect(function(p220, p221)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_56, (copy) v_u_53
	if v_u_8:GetAttribute("FirstTimePlayer") then
		return
	elseif v_u_4:GetFocusedTextBox() then
		return
	elseif p221 then
		return
	elseif p220.KeyCode == Enum.KeyCode.B then
		v_u_56:Toggle(not v_u_56.State)
		if v_u_56.State then
			v_u_53:select()
		else
			v_u_53:deselect()
		end
	else
		return
	end
end)
v_u_53.toggled:Connect(function(p222, p223)
	-- upvalues: (copy) v_u_8, (copy) v_u_56
	if p223 == "User" then
		if not v_u_8:GetAttribute("FirstTimePlayer") then
			v_u_56:Toggle(p222)
		end
	else
		return
	end
end)
v_u_8:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
	-- upvalues: (copy) v_u_53, (copy) v_u_8
	v_u_53:setEnabled(not v_u_8:GetAttribute("FirstTimePlayer"))
end)
v_u_53:setEnabled(not v_u_8:GetAttribute("FirstTimePlayer"))
local v_u_224 = nil
v_u_57.Visible:Observe(function(p_u_225)
	-- upvalues: (copy) v_u_5, (copy) v_u_53, (copy) v_u_56, (ref) v_u_224, (copy) v_u_6, (copy) v_u_11, (copy) v_u_3, (copy) v_u_114, (copy) v_u_34, (copy) v_u_12, (copy) v_u_13
	if p_u_225 then
		v_u_5.GameEvents.CosmeticNotice:FireServer()
		v_u_53:clearNotices()
	end
	v_u_56.State = p_u_225
	v_u_56.OnToggled:Fire(p_u_225)
	if v_u_224 then
		v_u_224:Cancel()
		v_u_224 = nil
	end
	local v_u_226 = v_u_6:Create(v_u_11, TweenInfo.new(0.2), {
		["Position"] = p_u_225 and UDim2.fromScale(0.5, 0.97) or UDim2.fromScale(0.5, 1.5)
	})
	v_u_226:Play()
	v_u_224 = v_u_226
	if p_u_225 then
		v_u_11.Visible = true
	end
	v_u_226.Completed:Once(function()
		-- upvalues: (copy) v_u_226, (copy) p_u_225, (ref) v_u_11, (ref) v_u_3, (ref) v_u_114, (ref) v_u_34, (ref) v_u_224
		if v_u_226.PlaybackState == Enum.PlaybackState.Completed then
			if p_u_225 then
				v_u_3:EnableGamepadCursor(v_u_114:FindFirstChildOfClass(v_u_34.Name) or v_u_11)
			else
				v_u_11.Visible = false
			end
			if v_u_224 == v_u_226 then
				v_u_224 = nil
			end
		end
	end)
	v_u_12.Enabled = not p_u_225
	v_u_13.Enabled = not p_u_225
	if not p_u_225 then
		v_u_56:ChangeScaleMode(true)
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_27, (copy) v_u_53, (copy) v_u_7, (copy) v_u_56, (copy) v_u_16
	if v_u_27:IsInWorld() then
		v_u_53:destroy()
	else
		v_u_7.MenuOpened:Connect(function()
			-- upvalues: (ref) v_u_56
			v_u_56:Toggle(false)
		end)
		local v_u_227 = v_u_16:GetData()
		v_u_16:GetPathSignal("CosmeticNotice"):Connect(function()
			-- upvalues: (copy) v_u_227, (ref) v_u_53
			while v_u_227.CosmeticNotice and v_u_53.totalNotices < v_u_227.CosmeticNotice do
				v_u_53:notify()
			end
		end)
		while v_u_227.CosmeticNotice and v_u_53.totalNotices < v_u_227.CosmeticNotice do
			v_u_53:notify()
		end
	end
end)
return v_u_56