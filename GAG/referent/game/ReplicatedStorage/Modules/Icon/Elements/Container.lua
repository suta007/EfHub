local v_u_1 = 0
return function(p_u_2)
	-- upvalues: (ref) v_u_1
	local v_u_3 = game:GetService("GuiService")
	local v_u_4 = game:GetService("Players")
	local v_u_5 = game:GetService("UserInputService")
	local v6 = {}
	local v_u_7 = require(script.Parent.Parent.Packages.GoodSignal).new()
	local v_u_8 = v_u_3:GetGuiInset()
	local v_u_9 = 0
	local v_u_10 = 0
	local v_u_11 = 0
	local v_u_12 = 0
	local v_u_13 = false
	local v_u_14 = false
	local function v_u_18(p15)
		-- upvalues: (copy) v_u_3, (ref) v_u_13, (ref) v_u_14, (copy) v_u_5, (copy) p_u_2, (ref) v_u_12, (copy) v_u_18, (copy) v_u_4, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (copy) v_u_7, (ref) v_u_1
		local v16 = v_u_3.TopbarInset.Height
		v_u_13 = v_u_3:IsTenFootInterface()
		v_u_14 = v_u_5.VREnabled
		p_u_2.isOldTopbar = false
		v_u_12 = v_u_12 + 1
		if v16 == 0 and p15 == nil then
			task.defer(function()
				-- upvalues: (ref) v_u_18
				task.wait(8)
				v_u_18("ForceConvertToOld")
			end)
		elseif v_u_12 == 1 then
			task.delay(5, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_18
				v_u_4.LocalPlayer:WaitForChild("PlayerGui")
				if v_u_12 == 1 then
					v_u_18()
				end
			end)
		end
		v_u_8 = v_u_3:GetGuiInset()
		v_u_9 = v_u_8.Y - 50
		v_u_10 = 0
		v_u_11 = -2
		if v_u_13 then
			v_u_9 = 10
			v_u_10 = 0
		end
		if v_u_3.TopbarInset.Height == 0 then
			v_u_11 = 50
		end
		v_u_7:Fire(v_u_8)
		local v_u_17 = v_u_8.Y
		if v_u_17 ~= v_u_1 then
			v_u_1 = v_u_17
			task.defer(function()
				-- upvalues: (ref) p_u_2, (copy) v_u_17
				p_u_2.insetHeightChanged:Fire(v_u_17)
			end)
		end
	end
	v_u_3:GetPropertyChangedSignal("TopbarInset"):Connect(v_u_18)
	v_u_18("FirstTime")
	local v_u_19 = Instance.new("ScreenGui")
	v_u_7:Connect(function()
		-- upvalues: (copy) v_u_19, (ref) v_u_9
		v_u_19:SetAttribute("StartInset", v_u_9)
	end)
	v_u_19.Name = "TopbarStandard"
	v_u_19.Enabled = true
	v_u_19.DisplayOrder = p_u_2.baseDisplayOrder
	v_u_19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v_u_19.IgnoreGuiInset = true
	v_u_19.ResetOnSpawn = false
	v_u_19.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	v6[v_u_19.Name] = v_u_19
	p_u_2.baseDisplayOrderChanged:Connect(function()
		-- upvalues: (copy) v_u_19, (copy) p_u_2
		v_u_19.DisplayOrder = p_u_2.baseDisplayOrder
	end)
	local v_u_20 = Instance.new("Frame")
	v_u_20.Name = "Holders"
	v_u_20.BackgroundTransparency = 1
	v_u_7:Connect(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_11, (copy) v_u_20, (ref) v_u_10
		local v21 = v_u_14 and 36 or 56
		local v22
		if v_u_13 then
			v22 = UDim2.new(1, 0, 0, v21)
		else
			v22 = UDim2.new(1, 0, 1, v_u_11)
		end
		v_u_20.Position = UDim2.new(0, 0, 0, v_u_10)
		v_u_20.Size = v22
	end)
	v_u_20.Visible = true
	v_u_20.ZIndex = 1
	v_u_20.Parent = v_u_19
	local v_u_23 = v_u_19:Clone()
	local v_u_24 = v_u_23.Holders
	local function v25()
		-- upvalues: (copy) v_u_24, (copy) v_u_3, (ref) v_u_11
		v_u_24.Size = UDim2.new(1, 0, 0, v_u_3.TopbarInset.Height + v_u_11)
	end
	v_u_23.Name = "TopbarCentered"
	v_u_23.DisplayOrder = p_u_2.baseDisplayOrder
	v_u_23.ScreenInsets = Enum.ScreenInsets.None
	p_u_2.baseDisplayOrderChanged:Connect(function()
		-- upvalues: (copy) v_u_23, (copy) p_u_2
		v_u_23.DisplayOrder = p_u_2.baseDisplayOrder
	end)
	v6[v_u_23.Name] = v_u_23
	v_u_7:Connect(v25)
	v_u_24.Size = UDim2.new(1, 0, 0, v_u_3.TopbarInset.Height + v_u_11)
	local v_u_26 = v_u_19:Clone()
	v_u_26.Name = v_u_26.Name .. "Clipped"
	v_u_26.DisplayOrder = p_u_2.baseDisplayOrder + 1
	p_u_2.baseDisplayOrderChanged:Connect(function()
		-- upvalues: (copy) v_u_26, (copy) p_u_2
		v_u_26.DisplayOrder = p_u_2.baseDisplayOrder + 1
	end)
	v6[v_u_26.Name] = v_u_26
	local v_u_27 = v_u_23:Clone()
	v_u_27.Name = v_u_27.Name .. "Clipped"
	v_u_27.DisplayOrder = p_u_2.baseDisplayOrder + 1
	p_u_2.baseDisplayOrderChanged:Connect(function()
		-- upvalues: (copy) v_u_27, (copy) p_u_2
		v_u_27.DisplayOrder = p_u_2.baseDisplayOrder + 1
	end)
	v6[v_u_27.Name] = v_u_27
	local v_u_28 = Instance.new("ScrollingFrame")
	v_u_28:SetAttribute("IsAHolder", true)
	v_u_28.Name = "Left"
	v_u_7:Connect(function()
		-- upvalues: (copy) v_u_28, (ref) v_u_9
		v_u_28.Position = UDim2.fromOffset(v_u_9, 0)
	end)
	v_u_28.Size = UDim2.new(1, -24, 1, 0)
	v_u_28.BackgroundTransparency = 1
	v_u_28.Visible = true
	v_u_28.ZIndex = 1
	v_u_28.Active = false
	v_u_28.ClipsDescendants = true
	v_u_28.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	v_u_28.CanvasSize = UDim2.new(0, 0, 1, -1)
	v_u_28.AutomaticCanvasSize = Enum.AutomaticSize.X
	v_u_28.ScrollingDirection = Enum.ScrollingDirection.X
	v_u_28.ScrollBarThickness = 0
	v_u_28.BorderSizePixel = 0
	v_u_28.Selectable = false
	v_u_28.ScrollingEnabled = false
	v_u_28.ElasticBehavior = Enum.ElasticBehavior.Never
	v_u_28.Parent = v_u_20
	local v_u_29 = Instance.new("UIListLayout")
	v_u_7:Connect(function()
		-- upvalues: (copy) v_u_29, (ref) v_u_9
		v_u_29.Padding = UDim.new(0, v_u_9)
	end)
	v_u_29.FillDirection = Enum.FillDirection.Horizontal
	v_u_29.SortOrder = Enum.SortOrder.LayoutOrder
	v_u_29.VerticalAlignment = Enum.VerticalAlignment.Bottom
	v_u_29.HorizontalAlignment = Enum.HorizontalAlignment.Left
	v_u_29.Parent = v_u_28
	local v_u_30 = v_u_28:Clone()
	v_u_7:Connect(function()
		-- upvalues: (copy) v_u_30, (ref) v_u_9
		v_u_30.UIListLayout.Padding = UDim.new(0, v_u_9)
	end)
	v_u_30.ScrollingEnabled = false
	v_u_30.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v_u_30.Name = "Center"
	v_u_30.Parent = v_u_24
	local v_u_31 = v_u_28:Clone()
	v_u_7:Connect(function()
		-- upvalues: (copy) v_u_31, (ref) v_u_9
		v_u_31.UIListLayout.Padding = UDim.new(0, v_u_9)
	end)
	v_u_31.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	v_u_31.Name = "Right"
	v_u_31.AnchorPoint = Vector2.new(1, 0)
	v_u_31.Position = UDim2.new(1, -12, 0, 0)
	v_u_31.Parent = v_u_20
	v_u_7:Fire(v_u_8)
	return v6
end