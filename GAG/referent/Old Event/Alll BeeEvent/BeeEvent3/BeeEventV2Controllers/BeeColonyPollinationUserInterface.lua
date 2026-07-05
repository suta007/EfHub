local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local v4 = {}
local v_u_5 = {}
local function v_u_22(p6) -- name: CreateProgressGui
	local v7 = p6.PrimaryPart
	if not v7 then
		return nil
	end
	local v8, v9 = p6:GetBoundingBox()
	local v10 = v8.Position.Y + v9.Y * 0.5 - v7.Position.Y + 2
	local v11 = math.max(4, v10)
	local v12 = Instance.new("BillboardGui")
	v12.Name = "PollinateProgress"
	v12.Size = UDim2.fromOffset(60, 20)
	v12.StudsOffset = Vector3.new(0, v11, 0)
	v12.AlwaysOnTop = true
	v12.MaxDistance = 200
	v12.Adornee = v7
	v12.Parent = v7
	local v13 = Instance.new("UIListLayout")
	v13.SortOrder = Enum.SortOrder.LayoutOrder
	v13.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v13.Padding = UDim.new(0, 2)
	v13.Parent = v12
	local v14 = Instance.new("Frame")
	v14.Name = "Background"
	v14.Size = UDim2.new(1, 0, 0, 6)
	v14.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	v14.BackgroundTransparency = 0.5
	v14.BorderSizePixel = 0
	v14.LayoutOrder = 1
	v14.Parent = v12
	local v15 = Instance.new("UICorner")
	v15.CornerRadius = UDim.new(1, 0)
	v15.Parent = v14
	local v16 = Instance.new("UIStroke")
	v16.Color = Color3.fromRGB(0, 0, 0)
	v16.Thickness = 1.5
	v16.Transparency = 0.3
	v16.Parent = v14
	local v17 = Instance.new("Frame")
	v17.Name = "Fill"
	v17.Size = UDim2.fromScale(0, 1)
	v17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	v17.BorderSizePixel = 0
	v17.Parent = v14
	local v18 = Instance.new("UICorner")
	v18.CornerRadius = UDim.new(1, 0)
	v18.Parent = v17
	local v19 = Instance.new("UIGradient")
	v19.Color = ColorSequence.new(Color3.fromRGB(255, 180, 0), Color3.fromRGB(255, 240, 80))
	v19.Parent = v17
	local v20 = Instance.new("TextLabel")
	v20.Name = "Timer"
	v20.Size = UDim2.new(1, 0, 0, 12)
	v20.BackgroundTransparency = 1
	v20.TextColor3 = Color3.fromRGB(255, 255, 255)
	v20.TextSize = 12
	v20.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Bold)
	v20.LayoutOrder = 2
	v20.Parent = v12
	local v21 = Instance.new("UIStroke")
	v21.Color = Color3.fromRGB(0, 0, 0)
	v21.Thickness = 0.75
	v21.Parent = v20
	return v12
end
local v_u_23 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_24 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local function v_u_27(p25) -- name: OnPlantAdded
	-- upvalues: (copy) v_u_5, (copy) v_u_22
	if not v_u_5[p25] then
		local v26 = v_u_22(p25)
		if v26 then
			v_u_5[p25] = v26
		end
	end
end
local function v_u_32(p28) -- name: OnPlantRemoved
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_23, (copy) v_u_24
	local v29 = v_u_5[p28]
	if v29 then
		v29:Destroy()
		v_u_5[p28] = nil
	end
	if p28.Parent then
		local v_u_30 = Instance.new("Highlight")
		v_u_30.FillTransparency = 1
		v_u_30.OutlineColor = Color3.fromRGB(255, 220, 60)
		v_u_30.OutlineTransparency = 1
		v_u_30.Adornee = p28
		v_u_30.Parent = p28
		v_u_2:Create(v_u_30, v_u_23, {
			["OutlineTransparency"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (copy) v_u_30, (ref) v_u_2, (ref) v_u_24
			if v_u_30.Parent then
				local v31 = v_u_2:Create(v_u_30, v_u_24, {
					["OutlineTransparency"] = 1
				})
				v31:Play()
				v31.Completed:Once(function()
					-- upvalues: (ref) v_u_30
					v_u_30:Destroy()
				end)
			end
		end)
	end
end
function v4.Start(_) -- name: Start
	-- upvalues: (copy) v_u_1, (copy) v_u_27, (copy) v_u_32, (copy) v_u_5, (copy) v_u_22, (copy) v_u_3
	v_u_1:GetInstanceAddedSignal("PollinatingPlant"):Connect(v_u_27)
	v_u_1:GetInstanceRemovedSignal("PollinatingPlant"):Connect(v_u_32)
	for _, v33 in v_u_1:GetTagged("PollinatingPlant") do
		if not v_u_5[v33] then
			local v34 = v_u_22(v33)
			if v34 then
				v_u_5[v33] = v34
			end
		end
	end
	v_u_3.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_5
		for v35, v36 in v_u_5 do
			local v37 = (v35:GetAttribute("PollinateProgress") or 0) / (v35:GetAttribute("PollinateThreshold") or 1)
			local v38 = math.clamp(v37, 0, 1)
			v36.Background.Fill.Size = UDim2.fromScale(v38, 1)
			local v39 = v35:GetAttribute("PollinateTimeRemaining") or 0
			v36.Timer.Text = ("%*s"):format(v39)
		end
	end)
end
v4:Start()
return v4