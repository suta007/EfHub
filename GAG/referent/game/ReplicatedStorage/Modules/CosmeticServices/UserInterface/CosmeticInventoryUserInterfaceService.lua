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
	v_u_56.CurrentQuery = p68
	local v69 = v_u_56.FrameRenderData.CosmeticCounterFrames
	local v70 = v_u_56.FrameRenderData.UniqueCosmeticFrames
	local v71 = v_u_18:GetAllCosmetics()
	local v72 = v_u_56.SelectedCategory
	local v73 = string.split(p68, " ")
	for v74, v75 in v69 do
		v75.Visible = true
		local v76 = v_u_54[v74]
		local v77 = v72 ~= "ALL" and not table.find(v76.Tags, v72) and true or false
		local v78 = v74:lower()
		local v79 = 0
		for _, v80 in v73 do
			if v78:find(v80) then
				v79 = v79 + 1
			end
		end
		if v78:find(p68) then
			v79 = v79 + 1
		end
		if v79 <= 0 and p68 ~= "" or v77 then
			v75.Visible = false
		else
			v75.LayoutOrder = -v79
			v75.Visible = true
		end
	end
	for v81, v82 in v70 do
		v82.Visible = true
		local v83 = v71[v81].Name
		if v83 then
			local v84 = v_u_54[v83]
			local v85 = v72 ~= "ALL" and not table.find(v84.Tags, v72) and true or false
			local v86 = v83:lower()
			local v87 = 0
			for _, v88 in v73 do
				if v86:find(v88) then
					v87 = v87 + 1
				end
			end
			if v86:find(p68) then
				v87 = v87 + 1
			end
			if v87 <= 0 and p68 ~= "" or v85 then
				v82.Visible = false
			else
				v82.LayoutOrder = -v87
				v82.Visible = true
			end
		end
	end
end
local v_u_89 = Color3.fromRGB(255, 94, 73)
local v_u_90 = v15(v_u_89, -0.35)
local v_u_91 = Color3.fromRGB(255, 255, 255)
local v_u_92 = v15(v_u_91, -0.35)
local v_u_93 = v_u_41:WaitForChild("UIStroke")
local v_u_94 = v_u_14(v_u_41, "DELETE_ICON")
local v95 = v_u_41:WaitForChild("SENSOR")
local function v_u_98(p96)
	-- upvalues: (copy) v_u_92, (copy) v_u_90, (copy) v_u_6, (copy) v_u_93, (copy) v_u_94, (copy) v_u_41
	local v97 = p96 and v_u_92 or v_u_90
	v_u_6:Create(v_u_93, TweenInfo.new(0.1), {
		["Color"] = v97
	}):Play()
	v_u_6:Create(v_u_94, TweenInfo.new(0.1), {
		["ImageColor3"] = v97
	}):Play()
	v_u_6:Create(v_u_41, TweenInfo.new(0.1), {
		["BackgroundColor3"] = v97
	}):Play()
end
local function v_u_101(p99)
	-- upvalues: (copy) v_u_89, (copy) v_u_91, (copy) v_u_6, (copy) v_u_93, (copy) v_u_94, (copy) v_u_41
	local v100 = p99 and v_u_89 or v_u_91
	v_u_6:Create(v_u_93, TweenInfo.new(0.1), {
		["Color"] = v100
	}):Play()
	v_u_6:Create(v_u_94, TweenInfo.new(0.1), {
		["ImageColor3"] = v100
	}):Play()
	v_u_6:Create(v_u_41, TweenInfo.new(0.1), {
		["BackgroundColor3"] = v100
	}):Play()
end
local v_u_102 = {}
function v_u_56.ToggleDeletionMode(_, p103)
	-- upvalues: (copy) v_u_56, (copy) v_u_101, (copy) v_u_44, (copy) v_u_6, (copy) v_u_102
	v_u_56.DeletionMode = p103
	v_u_101(v_u_56.DeletionMode)
	v_u_44.Text = p103 and "DELETION MODE ACTIVE" or "All Cosmetics"
	v_u_6:Create(v_u_44, TweenInfo.new(0.2), {
		["TextColor3"] = v_u_56.DeletionMode and Color3.fromRGB(255, 94, 73) or Color3.fromRGB(255, 255, 255)
	}):Play()
	table.clear(v_u_102)
end
v95.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_24, (copy) v_u_98, (copy) v_u_56
	v_u_24()
	v_u_98(v_u_56.DeletionMode)
end)
v95.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_101, (copy) v_u_56
	v_u_101(v_u_56.DeletionMode)
end)
v95.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_101, (copy) v_u_56
	v_u_101(v_u_56.DeletionMode)
end)
v95.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ToggleDeletionMode(not v_u_56.DeletionMode)
end)
local function v_u_107(p104, p105)
	-- upvalues: (copy) v_u_6
	local v106 = p104:WaitForChild("DeletionStuff")
	v_u_6:Create(v106:WaitForChild("UIStroke"), TweenInfo.new(0.2), {
		["Transparency"] = p105 and 0 or 1
	}):Play()
	v_u_6:Create(v106:WaitForChild("DELETE_ICON"), TweenInfo.new(0.2), {
		["ImageTransparency"] = p105 and 0 or 1
	}):Play()
	v_u_6:Create(v106, TweenInfo.new(0.2), {
		["BackgroundTransparency"] = p105 and 0.6 or 1
	}):Play()
end
local v_u_108 = Color3.fromRGB(255, 255, 255)
local v_u_109 = v15(v_u_108, -0.35)
v42:WaitForChild("UIStroke")
local v_u_110 = v_u_14(v42, "CATEGORY_ICON")
local v111 = v42:WaitForChild("SENSOR")
local v_u_112 = v42:WaitForChild("UIAspectRatioConstraint")
v_u_43:WaitForChild("UIStroke")
local v_u_113 = v_u_43:WaitForChild("INSERTION_POINT")
local v_u_114 = v_u_113:WaitForChild("TEMPLATE")
local v_u_115 = {}
function v_u_56.SetCategory(_, p116)
	-- upvalues: (copy) v_u_45, (copy) v_u_110, (copy) v_u_56, (copy) v_u_44
	v_u_110.Image = v_u_45[p116].Icon
	v_u_56.SelectedCategory = p116
	v_u_44.Text = ("%* Cosmetics"):format((("%*%*"):format(p116:sub(1, 1):upper(), (p116:sub(2, #p116):lower()))))
end
local v_u_117 = false
function v_u_56.ToggleCategoryDropdown(_, p118)
	-- upvalues: (ref) v_u_117, (copy) v_u_56, (copy) v_u_6, (copy) v_u_110, (copy) v_u_26, (copy) v_u_115, (copy) v_u_114, (copy) v_u_108, (copy) v_u_109, (copy) v_u_24, (copy) v_u_113, (copy) v_u_43, (copy) v_u_112
	if not v_u_117 then
		v_u_117 = true
		v_u_56.CategoryState = p118
		v_u_56:Search(v_u_56.CurrentQuery)
		v_u_6:Create(v_u_110, TweenInfo.new(0.2), {
			["ImageTransparency"] = p118 and 1 or 0
		}):Play()
		for v119, v120 in v_u_26 do
			local v_u_121 = v120.CategoryName
			local v122 = v_u_115[v_u_121]
			if not v122 then
				v122 = v_u_114:Clone()
				v_u_115[v_u_121] = v122
				local v_u_123 = v122.CATEGORY_ICON_TEMPLATE
				v122.Visible = true
				v_u_123.ImageTransparency = 1
				local v124 = v122:WaitForChild("SENSOR")
				local function v_u_127(p125)
					-- upvalues: (ref) v_u_108, (ref) v_u_109, (ref) v_u_6, (copy) v_u_123
					local v126 = p125 and v_u_108 or v_u_109
					v_u_6:Create(v_u_123, TweenInfo.new(0.1), {
						["ImageColor3"] = v126
					}):Play()
				end
				v_u_123.ImageColor3 = v_u_109
				v124.MouseEnter:Connect(function()
					-- upvalues: (ref) v_u_24, (copy) v_u_127
					v_u_24()
					v_u_127(true)
				end)
				v124.MouseLeave:Connect(function()
					-- upvalues: (ref) v_u_109, (ref) v_u_6, (copy) v_u_123
					local v128 = {
						["ImageColor3"] = v_u_109
					}
					v_u_6:Create(v_u_123, TweenInfo.new(0.1), v128):Play()
				end)
				v124.MouseButton1Down:Connect(function()
					-- upvalues: (ref) v_u_108, (ref) v_u_109, (ref) v_u_6, (copy) v_u_123
					local v129 = {
						["ImageColor3"] = v_u_108 or v_u_109
					}
					v_u_6:Create(v_u_123, TweenInfo.new(0.1), v129):Play()
				end)
				v124.MouseButton1Up:Connect(function()
					-- upvalues: (ref) v_u_109, (ref) v_u_6, (copy) v_u_123
					local v130 = {
						["ImageColor3"] = v_u_109
					}
					v_u_6:Create(v_u_123, TweenInfo.new(0.1), v130):Play()
				end)
				v124.MouseButton1Click:Connect(function()
					-- upvalues: (ref) v_u_56, (copy) v_u_121
					v_u_56:SetCategory(v_u_121)
					v_u_56:ToggleCategoryDropdown(false)
				end)
				v_u_123.Image = v120.Icon
				v122.Parent = v_u_113
			end
			v122.LayoutOrder = v119
		end
		local v131 = v_u_115[v_u_56.SelectedCategory]
		if v131 then
			v131.LayoutOrder = -1000
			v131.CATEGORY_ICON_TEMPLATE.ImageTransparency = p118 and 0 or 1
		end
		if p118 then
			v_u_43.Visible = true
			local v132 = v_u_6:Create(v_u_112, TweenInfo.new(0.3), {
				["AspectRatio"] = p118 and #v_u_26 or 1
			})
			v132:Play()
			v132.Completed:Wait()
			for _, v133 in v_u_26 do
				local v134 = v_u_115[v133.CategoryName]
				if v133 ~= v134 then
					local v135 = v_u_6:Create(v134.CATEGORY_ICON_TEMPLATE, TweenInfo.new(0.1), {
						["ImageTransparency"] = p118 and 0 or 1
					})
					v135:Play()
					v135.Completed:Wait()
				end
			end
		end
		if not p118 then
			for v136 = #v_u_26, 1, -1 do
				local v137 = v_u_26[v136]
				local v138 = v_u_115[v137.CategoryName]
				if v137 ~= v138 then
					local v139 = v_u_6:Create(v138.CATEGORY_ICON_TEMPLATE, TweenInfo.new(0.1), {
						["ImageTransparency"] = p118 and 0 or 1
					})
					v139:Play()
					v139.Completed:Wait()
				end
			end
			v_u_43.Visible = false
			local v140 = v_u_6:Create(v_u_112, TweenInfo.new(0.3), {
				["AspectRatio"] = p118 and #v_u_26 or 1
			})
			v140:Play()
			v140.Completed:Wait()
		end
		v_u_117 = false
	end
end
local function v_u_143(p141)
	-- upvalues: (copy) v_u_108, (copy) v_u_109, (copy) v_u_6, (copy) v_u_110
	local v142 = p141 and v_u_108 or v_u_109
	v_u_6:Create(v_u_110, TweenInfo.new(0.1), {
		["ImageColor3"] = v142
	}):Play()
end
v_u_110.ImageColor3 = v_u_109
v111.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_24, (copy) v_u_143
	v_u_24()
	v_u_143(true)
end)
v111.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_109, (copy) v_u_6, (copy) v_u_110
	local v144 = {
		["ImageColor3"] = v_u_109
	}
	v_u_6:Create(v_u_110, TweenInfo.new(0.1), v144):Play()
end)
v111.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_108, (copy) v_u_109, (copy) v_u_6, (copy) v_u_110
	local v145 = {
		["ImageColor3"] = v_u_108 or v_u_109
	}
	v_u_6:Create(v_u_110, TweenInfo.new(0.1), v145):Play()
end)
v111.MouseButton1Up:Connect(function()
	-- upvalues: (copy) v_u_109, (copy) v_u_6, (copy) v_u_110
	local v146 = {
		["ImageColor3"] = v_u_109
	}
	v_u_6:Create(v_u_110, TweenInfo.new(0.1), v146):Play()
end)
v111.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ToggleCategoryDropdown(not v_u_56.CategoryState)
end)
local v_u_147 = v_u_11.UIScale
local v148 = v30.SENSOR
local v_u_149 = v_u_6:Create(v30.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v30.ANIMATED_TEXTURE.ImageColor3
})
local v_u_150 = v_u_6:Create(v30.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v15(v30.ANIMATED_TEXTURE.ImageColor3, 0.2)
})
v148.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_149
	v_u_149:Play()
end)
v148.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_150, (copy) v_u_24
	v_u_150:Play()
	v_u_24()
end)
v148.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56
	v_u_56:ChangeScaleMode(not v_u_56.BigScale)
end)
task.spawn(function()
	-- upvalues: (ref) v_u_55, (copy) v_u_6, (copy) v_u_147
	while true do
		repeat
			task.wait(0.1)
			local v151 = v_u_55.ViewportSize.X
		until v151 ~= nil
		local v152 = v_u_6
		local v153 = v_u_147
		local v154 = TweenInfo.new(0.2)
		local v155 = {}
		local v156 = 0.0011111111111111111 * v151
		v155.Scale = math.min(v156, 1.5)
		v152:Create(v153, v154, v155):Play()
	end
end)
local _ = v_u_11.UIScale
local v157 = v36.SENSOR
local v_u_158 = v_u_6:Create(v36.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v36.ANIMATED_TEXTURE.ImageColor3
})
local v_u_159 = v_u_6:Create(v36.ANIMATED_TEXTURE, TweenInfo.new(0.2), {
	["ImageColor3"] = v15(v36.ANIMATED_TEXTURE.ImageColor3, 0.2)
})
v157.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_158
	v_u_158:Play()
end)
v157.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_159, (copy) v_u_24
	v_u_159:Play()
	v_u_24()
end)
v157.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_56, (copy) v_u_53
	v_u_56:Toggle(false)
	v_u_53:deselect()
end)
local function v_u_169()
	-- upvalues: (copy) v_u_18
	local v160 = v_u_18:GetAllEquippedCosmetics()
	local v161 = v_u_18:GetAllCosmetics()
	local v162 = {
		["ReturnedItemMap"] = {},
		["UniqueItemMap"] = {}
	}
	local v163 = v162.ReturnedItemMap
	local v164 = v162.UniqueItemMap
	for v165, v166 in v161 do
		if not v160[v165] then
			local v167 = v166.Name
			if v167 then
				local v168 = v166.Data
				if v168 then
					if not v163[v167] then
						v163[v167] = 0
					end
					if next(v168) then
						v164[v165] = true
					else
						v163[v167] = v163[v167] + 1
					end
				else
					warn(v165, "Cosmetic is corrupted and has no ArbitraryData")
				end
			else
				warn(v165, "Cosmetic is corrupted and has no name!")
			end
		end
	end
	return v162
end
local function v_u_176(p170)
	-- upvalues: (copy) v_u_18, (copy) v_u_102
	local v171 = v_u_18:GetAllEquippedCosmetics()
	for v172, v173 in v_u_18:GetAllCosmetics() do
		if not (v_u_102[v172] or v171[v172]) then
			local v174 = v173.Name
			if v174 then
				if v174 == p170 then
					local v175 = v173.Data
					if v175 then
						if not next(v175) then
							return v172
						end
					else
						warn(v172, "Cosmetic is corrupted and has no ArbitraryData")
					end
				end
			else
				warn(v172, "Cosmetic is corrupted and has no name!")
			end
		end
	end
end
local function v_u_217()
	-- upvalues: (copy) v_u_169, (copy) v_u_56, (copy) v_u_18, (copy) v_u_54, (copy) v_u_34, (copy) v_u_14, (copy) v_u_6, (copy) v_u_1, (copy) v_u_2, (copy) v_u_176, (copy) v_u_102, (copy) v_u_20, (copy) v_u_25, (copy) v_u_22, (copy) v_u_8, (copy) v_u_23, (copy) v_u_24, (copy) v_u_19, (copy) v_u_107, (copy) v_u_33
	local v177 = v_u_169()
	local v178 = v_u_56.FrameRenderData.UniqueCosmeticFrames
	local v179 = v_u_56.FrameRenderData.CosmeticCounterFrames
	local v180 = v177.ReturnedItemMap
	local v181 = v177.UniqueItemMap
	local v182 = v_u_18:GetAllCosmetics()
	for v183, _ in v179 do
		if v180[v183] then
			if v180[v183] <= 0 and v183 then
				if typeof(v183) == "string" then
					local v184 = v_u_56.FrameRenderData.CosmeticCounterFrames
					local v185 = v184[v183]
					if v185 then
						v185:Destroy()
						v184[v183] = nil
					end
				end
			end
		elseif v183 then
			if typeof(v183) == "string" then
				local v186 = v_u_56.FrameRenderData.CosmeticCounterFrames
				local v187 = v186[v183]
				if v187 then
					v187:Destroy()
					v186[v183] = nil
				end
			end
		end
	end
	for v188, _ in v178 do
		if not v181[v188] and v188 then
			if typeof(v188) == "string" then
				local v189 = v_u_56.FrameRenderData.UniqueCosmeticFrames
				local v190 = v189[v188]
				if v190 then
					v190:Destroy()
					v189[v188] = nil
				end
			end
		end
	end
	for v_u_191, v192 in v180 do
		if v192 <= 0 then
			return
		end
		local v_u_193 = v_u_54[v_u_191]
		if v_u_193 then
			local v194 = v179[v_u_191]
			if not v194 then
				local v_u_195 = v_u_34:Clone()
				local v196 = v_u_14(v_u_195, "SENSOR")
				local v197 = {
					["BackgroundColor3"] = v_u_1
				}
				local v_u_198 = v_u_6:Create(v_u_195.ActualFrame, TweenInfo.new(0.2), v197)
				local v199 = {
					["BackgroundColor3"] = v_u_2
				}
				local v_u_200 = v_u_6:Create(v_u_195.ActualFrame, TweenInfo.new(0.2), v199)
				v196.MouseButton1Down:Connect(function()
					-- upvalues: (copy) v_u_200
					v_u_200:Play()
				end)
				v196.MouseButton1Up:Connect(function()
					-- upvalues: (copy) v_u_198, (ref) v_u_56, (ref) v_u_176, (copy) v_u_191, (ref) v_u_102, (copy) v_u_193, (ref) v_u_20, (ref) v_u_25, (ref) v_u_18, (ref) v_u_22, (ref) v_u_8, (ref) v_u_23
					v_u_198:Play()
					if v_u_56.DeletionMode then
						local v_u_201 = v_u_176(v_u_191)
						if v_u_201 then
							v_u_102[v_u_201] = true
							if v_u_193.Undeletable then
								v_u_20:CreateNotification((("%* is undeletable."):format(v_u_191)))
							else
								v_u_25:CreateNotification({
									["Icon"] = v_u_193.Icon,
									["Text"] = ("Are you sure you want to destroy \"%*\"?"):format(v_u_191),
									["OnConfirm"] = function(p202)
										-- upvalues: (ref) v_u_18, (copy) v_u_201, (ref) v_u_102
										v_u_18:DestroyCosmetic(v_u_201)
										v_u_102[p202.OccupiedUUID] = nil
									end,
									["OnDecline"] = function(p203)
										-- upvalues: (ref) v_u_102
										v_u_102[p203.OccupiedUUID] = nil
									end
								}).OccupiedUUID = v_u_201
							end
						else
							return
						end
					elseif v_u_18:HasMaxEquipped() then
						return v_u_20:CreateNotification((("Cannot place anymore you have max placed objects! %*"):format((v_u_22(v_u_18:GetAllEquippedCosmetics())))))
					elseif v_u_18:CanEquipAtLocation(v_u_8) then
						local v204 = v_u_176(v_u_191)
						if v204 then
							v_u_18:Equip(v204)
							task.delay(0.2, function()
								-- upvalues: (ref) v_u_23
								v_u_23("rbxassetid://99990810464653").Volume = 0.5
							end)
						end
					else
						return v_u_20:CreateNotification("Cannot place cosmetic out of farm!")
					end
				end)
				v196.MouseEnter:Connect(function()
					-- upvalues: (copy) v_u_198, (ref) v_u_24, (ref) v_u_19, (ref) v_u_195, (copy) v_u_200, (ref) v_u_56, (ref) v_u_107
					v_u_198:Play()
					v_u_24()
					task.spawn(function()
						-- upvalues: (ref) v_u_19, (ref) v_u_195, (ref) v_u_200
						repeat
							task.wait()
						until v_u_19("CosmeticItemTemplate") ~= v_u_195
						v_u_200:Play()
					end)
					if v_u_56.DeletionMode then
						v_u_107(v_u_195, true)
					end
				end)
				v196.MouseLeave:Connect(function()
					-- upvalues: (ref) v_u_107, (ref) v_u_195, (copy) v_u_200
					v_u_107(v_u_195, false)
					v_u_200:Play()
				end)
				v_u_195.Visible = true
				v_u_195.Parent = v_u_33
				v179[v_u_191] = v_u_195
				v194 = v_u_195
			end
			local v205 = v_u_14(v194, "COUNTER_TEXT")
			v205.Text = ("x%*"):format(v192)
			v_u_14(v194, "ITEM_ICON").Image = v_u_193.Icon
			v205.Visible = v192 >= 2
		else
			warn(v_u_191, "has no attached registry data! Skipping render.")
		end
	end
	for v_u_206 in v181 do
		local v_u_207 = v182[v_u_206]
		if v_u_207 then
			local v_u_208 = v_u_207.Name
			local v_u_209 = v_u_54[v_u_208]
			if v_u_209 then
				local v210 = v178[v_u_206]
				if not v210 then
					local v_u_211 = v_u_34:Clone()
					local v212 = v_u_14(v_u_211, "SENSOR")
					local v213 = {
						["BackgroundColor3"] = v_u_1
					}
					local v_u_214 = v_u_6:Create(v_u_211.ActualFrame, TweenInfo.new(0.2), v213)
					local v215 = {
						["BackgroundColor3"] = v_u_2
					}
					local v_u_216 = v_u_6:Create(v_u_211.ActualFrame, TweenInfo.new(0.2), v215)
					v212.MouseButton1Down:Connect(function()
						-- upvalues: (copy) v_u_216
						v_u_216:Play()
					end)
					v212.MouseButton1Up:Connect(function()
						-- upvalues: (copy) v_u_214, (ref) v_u_56, (copy) v_u_209, (ref) v_u_20, (copy) v_u_207, (ref) v_u_25, (copy) v_u_208, (ref) v_u_18, (copy) v_u_206, (ref) v_u_22, (ref) v_u_8, (ref) v_u_23
						v_u_214:Play()
						if v_u_56.DeletionMode then
							if v_u_209.Undeletable then
								v_u_20:CreateNotification((("%* is undeletable."):format(v_u_207.Name)))
							else
								v_u_25:CreateNotification({
									["Icon"] = v_u_209.Icon,
									["Text"] = ("Are you sure you want to destroy \"%*\"?"):format(v_u_208),
									["OnConfirm"] = function()
										-- upvalues: (ref) v_u_18, (ref) v_u_206
										v_u_18:DestroyCosmetic(v_u_206)
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
							v_u_18:Equip(v_u_206)
							v_u_23("rbxassetid://99990810464653").Volume = 0.5
							return
						end
					end)
					v212.MouseEnter:Connect(function()
						-- upvalues: (copy) v_u_214, (ref) v_u_24, (ref) v_u_19, (ref) v_u_211, (copy) v_u_216, (ref) v_u_56, (ref) v_u_107
						v_u_214:Play()
						v_u_24()
						task.spawn(function()
							-- upvalues: (ref) v_u_19, (ref) v_u_211, (ref) v_u_216
							repeat
								task.wait()
							until v_u_19("CosmeticItemTemplate") ~= v_u_211
							v_u_216:Play()
						end)
						if v_u_56.DeletionMode then
							v_u_107(v_u_211, true)
						end
					end)
					v212.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_107, (ref) v_u_211, (copy) v_u_216
						v_u_107(v_u_211, false)
						v_u_216:Play()
					end)
					v_u_211.Visible = true
					v_u_211.Parent = v_u_33
					v178[v_u_206] = v_u_211
					v210 = v_u_211
				end
				v_u_14(v210, "ITEM_ICON").Image = v_u_209.Icon
			else
				warn(v_u_208, v_u_206, "has no attached registry data! Skipping render.")
			end
		end
	end
end
v_u_217()
v_u_52()
v_u_16:GetPathSignal("CosmeticData/MutableStats/@"):Connect(function()
	-- upvalues: (copy) v_u_52
	v_u_52()
end)
v_u_16:GetPathSignal("CosmeticData/@"):Connect(function()
	-- upvalues: (copy) v_u_52, (copy) v_u_217
	v_u_52()
	v_u_217()
end)
v_u_16:GetPathSignal("SaveSlots/@"):Connect(function()
	-- upvalues: (copy) v_u_217, (copy) v_u_52
	v_u_217()
	v_u_52()
end)
v_u_35:GetPropertyChangedSignal("Text"):Connect(function()
	-- upvalues: (copy) v_u_56, (copy) v_u_35
	v_u_56:Search(v_u_35.Text)
end)
v_u_57.Visible:Observe(function(p218, _)
	-- upvalues: (copy) v_u_53
	if p218 then
		v_u_53:select()
	else
		v_u_53:deselect()
	end
end)
v_u_4.InputEnded:Connect(function(p219, p220)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_56, (copy) v_u_53
	if v_u_8:GetAttribute("FirstTimePlayer") then
		return
	elseif v_u_4:GetFocusedTextBox() then
		return
	elseif p220 then
		return
	elseif p219.KeyCode == Enum.KeyCode.B then
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
v_u_53.toggled:Connect(function(p221, p222)
	-- upvalues: (copy) v_u_8, (copy) v_u_56
	if p222 == "User" then
		if not v_u_8:GetAttribute("FirstTimePlayer") then
			v_u_56:Toggle(p221)
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
local v_u_223 = nil
v_u_57.Visible:Observe(function(p_u_224)
	-- upvalues: (copy) v_u_5, (copy) v_u_53, (copy) v_u_56, (ref) v_u_223, (copy) v_u_6, (copy) v_u_11, (copy) v_u_3, (copy) v_u_113, (copy) v_u_34, (copy) v_u_12, (copy) v_u_13
	if p_u_224 then
		v_u_5.GameEvents.CosmeticNotice:FireServer()
		v_u_53:clearNotices()
	end
	v_u_56.State = p_u_224
	v_u_56.OnToggled:Fire(p_u_224)
	if v_u_223 then
		v_u_223:Cancel()
		v_u_223 = nil
	end
	local v_u_225 = v_u_6:Create(v_u_11, TweenInfo.new(0.2), {
		["Position"] = p_u_224 and UDim2.fromScale(0.5, 0.97) or UDim2.fromScale(0.5, 1.5)
	})
	v_u_225:Play()
	v_u_223 = v_u_225
	if p_u_224 then
		v_u_11.Visible = true
	end
	v_u_225.Completed:Once(function()
		-- upvalues: (copy) v_u_225, (copy) p_u_224, (ref) v_u_11, (ref) v_u_3, (ref) v_u_113, (ref) v_u_34, (ref) v_u_223
		if v_u_225.PlaybackState == Enum.PlaybackState.Completed then
			if p_u_224 then
				v_u_3:EnableGamepadCursor(v_u_113:FindFirstChildOfClass(v_u_34.Name) or v_u_11)
			else
				v_u_11.Visible = false
			end
			if v_u_223 == v_u_225 then
				v_u_223 = nil
			end
		end
	end)
	v_u_12.Enabled = not p_u_224
	v_u_13.Enabled = not p_u_224
	if not p_u_224 then
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
		local v_u_226 = v_u_16:GetData()
		v_u_16:GetPathSignal("CosmeticNotice"):Connect(function()
			-- upvalues: (copy) v_u_226, (ref) v_u_53
			while v_u_226.CosmeticNotice and v_u_53.totalNotices < v_u_226.CosmeticNotice do
				v_u_53:notify()
			end
		end)
		while v_u_226.CosmeticNotice and v_u_53.totalNotices < v_u_226.CosmeticNotice do
			v_u_53:notify()
		end
	end
end)
return v_u_56