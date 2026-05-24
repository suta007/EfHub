local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Data.BeeEvent.BeeRegistry)
local v_u_7 = require(v5.Modules.GetFarmAsync)
local v_u_8 = v4.LocalPlayer
local v_u_9 = v_u_8:WaitForChild("PlayerGui")
local v_u_10 = workspace.CurrentCamera
local v11 = {}
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = false
local v_u_17 = nil
local v_u_18 = RaycastParams.new()
v_u_18.FilterType = Enum.RaycastFilterType.Include
local v_u_19 = {
	["Common"] = Color3.new(0.666667, 0.666667, 0.666667),
	["Rare"] = Color3.new(0.027451, 0.466667, 1),
	["Legendary"] = Color3.new(0.921569, 0.921569, 0.00392157),
	["Mythical"] = Color3.new(0.666667, 0.333333, 1),
	["Transcendent"] = Color3.new(0.333333, 0, 0.498039),
	["Divine"] = Color3.new(0.729412, 0.670588, 0.239216)
}
local function v_u_23() -- name: UpdateRaycastFilter
	-- upvalues: (copy) v_u_1, (copy) v_u_18
	local v20 = {}
	for _, v21 in v_u_1:GetTagged("BeeHover") do
		table.insert(v20, v21)
	end
	for _, v22 in v_u_1:GetTagged("BeeNestHover") do
		table.insert(v20, v22)
	end
	v_u_18.FilterDescendantsInstances = v20
end
local function v_u_25(p24) -- name: FindHoverHitbox
	-- upvalues: (copy) v_u_1
	while p24 do
		if v_u_1:HasTag(p24, "BeeNestHover") and p24:IsA("BasePart") then
			return p24, "Nest"
		end
		if v_u_1:HasTag(p24, "BeeHover") and p24:IsA("BasePart") then
			return p24, "Bee"
		end
		p24 = p24.Parent
	end
	return nil, nil
end
local function v_u_32(p26) -- name: GetHiveSlotTarget
	-- upvalues: (ref) v_u_17, (copy) v_u_7, (copy) v_u_8
	local v27 = tonumber(p26)
	if not v27 then
		return nil
	end
	local v28
	if v_u_17 and v_u_17.Parent then
		v28 = v_u_17
	else
		local v29 = v_u_7(v_u_8)
		if v29 then
			v28 = v29:FindFirstChild("CurrentExpansion")
			if v28 then
				v28 = v28:FindFirstChild("Custom")
			end
			if v28 then
				v28 = v28:FindFirstChild("Hive")
			end
			v_u_17 = v28
		else
			v28 = nil
		end
	end
	if not v28 then
		return nil
	end
	local v30 = v28:FindFirstChild((tostring(v27)))
	if not v30 then
		return nil
	end
	if v30:IsA("Model") or v30:IsA("BasePart") then
		return v30
	end
	for _, v31 in v30:GetChildren() do
		if v31:IsA("Model") or v31:IsA("BasePart") then
			return v31
		end
	end
	return nil
end
local function v_u_41(p33, p34) -- name: IsPointInsidePart
	local v35 = p33.CFrame:PointToObjectSpace(p34)
	local v36 = p33.Size * 0.5
	local v37 = v35.X
	local v38
	if math.abs(v37) <= v36.X + 0.75 then
		local v39 = v35.Y
		if math.abs(v39) <= v36.Y + 0.75 then
			local v40 = v35.Z
			v38 = math.abs(v40) <= v36.Z + 0.75
		else
			v38 = false
		end
	else
		v38 = false
	end
	return v38
end
local function v_u_45(p42) -- name: GetNestPartForBee
	-- upvalues: (copy) v_u_1
	local v43 = p42:GetAttribute("Slot") or p42:GetAttribute("BeeSlot")
	for _, v44 in v_u_1:GetTagged("BeeNestHover") do
		if v44:IsA("BasePart") and (v43 ~= nil and v44:GetAttribute("Slot") == v43) then
			return v44
		end
	end
	return nil
end
local function v_u_50(p46) -- name: IsBeeNesting
	-- upvalues: (copy) v_u_45, (copy) v_u_41
	if p46:GetAttribute("IsNesting") == true then
		return true
	end
	local v47 = p46:GetAttribute("State") or p46:GetAttribute("BeeState")
	local v48 = string.lower((tostring(v47 or "")))
	if string.find(v48, "nest", 1, true) or string.find(v48, "hive", 1, true) then
		return true
	end
	local v49 = v_u_45(p46)
	return v49 and v_u_41(v49, p46.Position) and true or false
end
local function v_u_59(p51, p52, p53, p54, p55, p56) -- name: MakeLabel
	local v57 = Instance.new("TextLabel")
	v57.Name = p52
	v57.Size = UDim2.new(0, 0, 0, 0)
	v57.AutomaticSize = Enum.AutomaticSize.XY
	v57.BackgroundTransparency = 1
	v57.TextColor3 = p54
	v57.Text = ""
	v57.TextSize = p56
	v57.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Bold)
	v57.TextXAlignment = Enum.TextXAlignment.Center
	v57.RichText = true
	v57.LayoutOrder = p53
	v57.Parent = p51
	local v58 = Instance.new("UIStroke")
	v58.Color = p55 or Color3.fromRGB(0, 0, 0)
	v58.Thickness = 1.5
	v58.Parent = v57
	return v57
end
local function v_u_66() -- name: CreateUI
	-- upvalues: (copy) v_u_9, (copy) v_u_59, (copy) v_u_2
	local v60 = Instance.new("ScreenGui")
	v60.Name = "BeeHoverUI"
	v60.ResetOnSpawn = false
	v60.IgnoreGuiInset = true
	v60.DisplayOrder = -1
	v60.Parent = v_u_9
	local v61 = Instance.new("Frame")
	v61.Name = "BeeInfo"
	v61.Size = UDim2.new(0, 0, 0, 0)
	v61.AutomaticSize = Enum.AutomaticSize.XY
	v61.BackgroundTransparency = 1
	v61.Visible = false
	v61.AnchorPoint = Vector2.new(0.5, 1)
	v61.Parent = v60
	local v62 = Instance.new("UIListLayout")
	v62.SortOrder = Enum.SortOrder.LayoutOrder
	v62.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v62.Padding = UDim.new(0, 2)
	v62.Parent = v61
	v_u_59(v61, "BeeName", 1, Color3.fromRGB(255, 255, 255), nil, 24)
	v_u_59(v61, "Rarity", 2, Color3.fromRGB(255, 255, 255), nil, 18)
	local v63 = v_u_59(v61, "Description", 3, Color3.fromRGB(255, 255, 255), nil, 15)
	v63.Size = UDim2.fromOffset(280, 0)
	v63.AutomaticSize = Enum.AutomaticSize.Y
	v63.TextWrapped = true
	v_u_59(v61, "StatSpeed", 4, Color3.fromRGB(85, 255, 0), nil, 15)
	v_u_59(v61, "StatQuality", 5, Color3.fromRGB(85, 255, 0), nil, 15)
	v_u_59(v61, "StatRate", 6, Color3.fromRGB(85, 255, 0), nil, 15)
	local v_u_64 = Instance.new("UIScale")
	v_u_64.Parent = v61
	local function v65() -- name: UpdateScale
		-- upvalues: (ref) v_u_2, (copy) v_u_64
		v_u_64.Scale = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y or 1080) / 1080 * 2.5 * (v_u_2.PreferredInput == Enum.PreferredInput.Touch and 1.3 or 1)
	end
	v_u_64.Scale = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y or 1080) / 1080 * 2.5 * (v_u_2.PreferredInput == Enum.PreferredInput.Touch and 1.3 or 1)
	v_u_2:GetPropertyChangedSignal("PreferredInput"):Connect(v65)
	if workspace.CurrentCamera then
		workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v65)
	end
	return v60
end
local function v_u_72(p67, p68, p69) -- name: GetHighlightTarget
	-- upvalues: (copy) v_u_32, (copy) v_u_45
	if p68 == "Nest" then
		return v_u_32(p67:GetAttribute("Slot")) or p67, true
	end
	if p69 then
		local v70 = v_u_32(p67:GetAttribute("Slot") or p67:GetAttribute("BeeSlot"))
		if v70 then
			return v70, true
		end
		local v71 = v_u_45(p67)
		if v71 then
			return v71, true
		end
	end
	return p67:FindFirstAncestorOfClass("Model") or p67, false
end
local function v_u_76(p73, p74) -- name: ShowHighlight
	-- upvalues: (ref) v_u_13, (ref) v_u_15, (ref) v_u_16
	if v_u_13 then
		v_u_13:Destroy()
		v_u_13 = nil
	end
	local v75 = Instance.new("Highlight")
	v75.FillColor = Color3.fromRGB(255, 220, 60)
	v75.OutlineColor = Color3.fromRGB(255, 220, 60)
	v75.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	if p74 then
		v75.FillTransparency = 0.82
		v75.OutlineTransparency = 0
	else
		v75.FillTransparency = 1
		v75.OutlineTransparency = 0
	end
	v75.Adornee = p73
	v75.Parent = p73
	v_u_13 = v75
	v_u_15 = p73
	v_u_16 = p74
end
function v11.Start(_) -- name: Start
	-- upvalues: (copy) v_u_66, (copy) v_u_1, (copy) v_u_23, (copy) v_u_3, (ref) v_u_12, (ref) v_u_10, (copy) v_u_2, (copy) v_u_18, (copy) v_u_25, (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (ref) v_u_16, (copy) v_u_6, (copy) v_u_19, (copy) v_u_50, (copy) v_u_72, (copy) v_u_76
	local v_u_77 = v_u_66()
	local v_u_78 = v_u_77.BeeInfo
	v_u_1:GetInstanceAddedSignal("BeeHover"):Connect(v_u_23)
	v_u_1:GetInstanceRemovedSignal("BeeHover"):Connect(v_u_23)
	v_u_1:GetInstanceAddedSignal("BeeNestHover"):Connect(v_u_23)
	v_u_1:GetInstanceRemovedSignal("BeeNestHover"):Connect(v_u_23)
	v_u_23()
	local v_u_79 = 0
	v_u_3.PostSimulation:Connect(function(p80)
		-- upvalues: (ref) v_u_12, (ref) v_u_10, (copy) v_u_78, (ref) v_u_79, (ref) v_u_2, (ref) v_u_18, (ref) v_u_25, (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (ref) v_u_16, (ref) v_u_6, (ref) v_u_19, (ref) v_u_50, (copy) v_u_77, (ref) v_u_72, (ref) v_u_76
		v_u_10 = v_u_12 and (v_u_12.Parent and workspace.CurrentCamera)
		if v_u_10 then
			local v81 = v_u_12.Position
			local v82 = v_u_12.Size.Y * 0.5 + 1.5
			local v83, v84 = v_u_10:WorldToViewportPoint(v81 + Vector3.new(0, v82, 0))
			if v84 then
				v_u_78.Position = UDim2.fromOffset(v83.X, v83.Y)
			end
		end
		v_u_79 = v_u_79 + p80
		if v_u_79 < 0.1 then
			return
		else
			v_u_79 = 0
			v_u_10 = workspace.CurrentCamera
			if v_u_10 then
				local v85 = v_u_2:GetMouseLocation()
				local v86 = v_u_10:ViewportPointToRay(v85.X, v85.Y)
				local v87 = workspace:Raycast(v86.Origin, v86.Direction * 100, v_u_18)
				local v88, v89
				if v87 and v87.Instance then
					v88, v89 = v_u_25(v87.Instance)
				else
					v88 = nil
					v89 = nil
				end
				if v88 and v89 then
					local v90 = v88 ~= v_u_12 and true or v89 ~= v_u_14
					v_u_12 = v88
					v_u_14 = v89
					local v91 = v88:GetAttribute("BeeName")
					if v91 then
						v91 = v_u_6[v91]
					end
					if v91 then
						local v92 = v91.Rarity or "Common"
						local v93 = v_u_19[v92 or "Common"] or Color3.fromRGB(255, 255, 255)
						local v94 = v89 == "Nest" and true or v_u_50(v88)
						local v95 = v88:GetAttribute("IsIllusion") == true
						local v96
						if v89 == "Bee" then
							v96 = v88:GetAttribute("Health") <= 0
						else
							v96 = false
						end
						v_u_77.DisplayOrder = -1
						local v97 = v_u_78.BeeName
						local v98
						if v95 then
							v98 = ("Illusion %*"):format(v91.DisplayName)
						else
							v98 = v91.DisplayName
						end
						v97.Text = v98
						v_u_78.BeeName.TextColor3 = v93
						local v99 = v_u_78
						local v100
						if v94 then
							v100 = not v96
						else
							v100 = v94
						end
						v99.Rarity.Visible = v100
						v99.Description.Visible = v100
						v99.StatSpeed.Visible = v100
						v99.StatQuality.Visible = v100
						v99.StatRate.Visible = v100
						if v94 and not v96 then
							local v101 = v91.Stats
							local v102 = v88:GetAttribute("Speed") or v101.Speed
							local v103 = v88:GetAttribute("PollinationQuality") or v101.PollinationQuality
							local v104 = v88:GetAttribute("PollinationRate") or v101.PollinationRate
							local v105 = v91.Description or ""
							v_u_77.DisplayOrder = 1
							v_u_78.Rarity.Text = v92
							v_u_78.Rarity.TextColor3 = v93
							v_u_78.Description.Text = v105
							v_u_78.StatSpeed.Text = ("Speed: %*"):format(v102)
							v_u_78.StatQuality.Text = ("Quality: %*"):format(v103)
							v_u_78.StatRate.Text = ("Rate: %*"):format(v104)
						end
						v_u_78.Visible = true
						local v106, v107 = v_u_72(v88, v89, v94)
						if v90 or (v106 ~= v_u_15 or v107 ~= v_u_16) then
							v_u_76(v106, v107)
						end
					else
						v_u_78.Visible = false
						if v_u_13 then
							v_u_13:Destroy()
							v_u_13 = nil
						end
						v_u_15 = nil
						v_u_16 = false
					end
				else
					if v_u_12 then
						v_u_12 = nil
						v_u_14 = nil
						v_u_78.Visible = false
						if v_u_13 then
							v_u_13:Destroy()
							v_u_13 = nil
						end
						v_u_15 = nil
						v_u_16 = false
					end
					return
				end
			else
				return
			end
		end
	end)
end
v11:Start()
return v11