local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v_u_4.Modules.TimeHelper)
local v_u_6 = require(v_u_4.Modules.Utility.utils)
local v_u_7 = v3.LocalPlayer
local v_u_8 = v_u_7:WaitForChild("PlayerGui")
local v9 = {}
local v_u_10 = nil
local v_u_11 = {}
local v_u_12 = nil
local function v_u_19(p13, p14, p15, p16) -- name: MakeLabel
	local v17 = Instance.new("TextLabel")
	v17.Name = p14
	v17.Size = UDim2.new(0, 0, 0, 0)
	v17.AutomaticSize = Enum.AutomaticSize.XY
	v17.BackgroundTransparency = 1
	v17.TextColor3 = p16
	v17.TextSize = 15
	v17.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Bold)
	v17.TextXAlignment = Enum.TextXAlignment.Center
	v17.RichText = true
	v17.LayoutOrder = p15
	v17.Parent = p13
	local v18 = Instance.new("UIStroke")
	v18.Color = Color3.fromRGB(0, 0, 0)
	v18.Thickness = 2
	v18.Parent = v17
	return v17
end
local function v_u_24() -- name: CreateUI
	-- upvalues: (copy) v_u_8, (copy) v_u_19, (copy) v_u_2
	local v20 = Instance.new("ScreenGui")
	v20.Name = "EggHoverUI"
	v20.ResetOnSpawn = false
	v20.IgnoreGuiInset = true
	v20.Parent = v_u_8
	local v21 = Instance.new("Frame")
	v21.Name = "EggInfo"
	v21.Size = UDim2.new(0, 0, 0, 0)
	v21.AutomaticSize = Enum.AutomaticSize.XY
	v21.BackgroundTransparency = 1
	v21.Visible = false
	v21.Parent = v20
	local v22 = Instance.new("UIListLayout")
	v22.SortOrder = Enum.SortOrder.LayoutOrder
	v22.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v22.Parent = v21
	v_u_19(v21, "BeeName", 1, Color3.fromRGB(255, 255, 255))
	v_u_19(v21, "TimeLeft", 2, Color3.fromRGB(85, 255, 0))
	local v_u_23 = Instance.new("UIScale")
	v_u_23.Scale = v_u_2.PreferredInput == Enum.PreferredInput.Touch and 1.5 or 1
	v_u_23.Parent = v21
	v_u_2:GetPropertyChangedSignal("PreferredInput"):Connect(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_2
		v_u_23.Scale = v_u_2.PreferredInput == Enum.PreferredInput.Touch and 1.5 or 1
	end)
	return v20
end
local function v_u_31(p25, p26) -- name: UpdateFrame
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v27 = p26:GetAttribute("HatchedFrom") or "Egg"
	local v28 = p26:GetAttribute("TimeUntilHatch") or 0
	local v29 = v_u_5:GenerateColonFormatFromTime(v28)
	p25.BeeName.Text = v27
	local v30 = v_u_6.isMobile() and "Tap" or "Click"
	if v28 <= 0 then
		p25.TimeLeft.Text = ("%* to Hatch!"):format(v30)
	else
		p25.TimeLeft.Text = ("Hatching in %*<br/>[%* to Skip]"):format(v29, v30)
	end
end
function v9.Start(_) -- name: Start
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_24, (copy) v_u_11, (copy) v_u_7, (ref) v_u_10, (copy) v_u_31, (copy) v_u_2, (copy) v_u_1
	v_u_12 = Instance.new("Highlight")
	v_u_12.Name = "BeeEggHoverHighlight"
	v_u_12.FillTransparency = 1
	v_u_12.OutlineColor = Color3.fromRGB(255, 255, 255)
	v_u_12.OutlineTransparency = 0
	v_u_12.Parent = v_u_4
	local v_u_32 = v_u_24().EggInfo
	local function v37(p_u_33) -- name: TrackEgg
		-- upvalues: (ref) v_u_11, (ref) v_u_7, (ref) v_u_10, (ref) v_u_31, (copy) v_u_32, (ref) v_u_12
		if not v_u_11[p_u_33] and p_u_33:IsA("BasePart") then
			local v34 = p_u_33:FindFirstChildOfClass("ClickDetector")
			if not v34 then
				v34 = Instance.new("ClickDetector")
				v34.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
				v34.MaxActivationDistance = 32
				v34.Parent = p_u_33
			end
			v_u_11[p_u_33] = {
				v34.MouseHoverEnter:Connect(function(p35)
					-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) p_u_33, (ref) v_u_31, (ref) v_u_32, (ref) v_u_12
					if p35 == v_u_7 then
						v_u_10 = p_u_33
						v_u_31(v_u_32, p_u_33)
						v_u_32.Visible = true
						v_u_12.Adornee = p_u_33
					end
				end),
				v34.MouseHoverLeave:Connect(function(p36)
					-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) p_u_33, (ref) v_u_32, (ref) v_u_12
					if p36 == v_u_7 and v_u_10 == p_u_33 then
						v_u_10 = nil
						v_u_32.Visible = false
						v_u_12.Adornee = nil
					end
				end),
				p_u_33:GetAttributeChangedSignal("TimeUntilHatch"):Connect(function()
					-- upvalues: (ref) v_u_10, (copy) p_u_33, (ref) v_u_31, (ref) v_u_32
					if v_u_10 == p_u_33 then
						v_u_31(v_u_32, p_u_33)
					end
				end),
				p_u_33:GetAttributeChangedSignal("HatchedFrom"):Connect(function()
					-- upvalues: (ref) v_u_10, (copy) p_u_33, (ref) v_u_31, (ref) v_u_32
					if v_u_10 == p_u_33 then
						v_u_31(v_u_32, p_u_33)
					end
				end)
			}
		end
	end
	local function v41(p38) -- name: UntrackEgg
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_32, (ref) v_u_12
		local v39 = v_u_11[p38]
		if v39 then
			for _, v40 in v39 do
				v40:Disconnect()
			end
			v_u_11[p38] = nil
			if v_u_10 == p38 then
				v_u_10 = nil
				v_u_32.Visible = false
				v_u_12.Adornee = nil
			end
		end
	end
	v_u_2.InputChanged:Connect(function(p42)
		-- upvalues: (ref) v_u_2, (copy) v_u_32
		if p42.UserInputType == Enum.UserInputType.MouseMovement or p42.UserInputType == Enum.UserInputType.Touch then
			local v43 = v_u_2:GetMouseLocation()
			v_u_32.Position = UDim2.new(0, v43.X + 15, 0, v43.Y + 15)
		end
	end)
	for _, v44 in v_u_1:GetTagged("BeeSwarmEgg") do
		v37(v44)
	end
	v_u_1:GetInstanceAddedSignal("BeeSwarmEgg"):Connect(v37)
	v_u_1:GetInstanceRemovedSignal("BeeSwarmEgg"):Connect(v41)
end
return v9