local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = game:GetService("ContentProvider")
local v_u_7 = game:GetService("CollectionService")
local v_u_8 = v5.LocalPlayer
local v_u_9 = v_u_8:WaitForChild("PlayerGui")
local v_u_10 = require(v_u_1.Data.BeeEvent.BeeEggRegistry)
local v_u_11 = require(v_u_1.Modules.CreateTagHandler)
local v_u_12 = require(v_u_1.Modules.DataService)
local v_u_13 = require(v_u_1.Comma_Module)
local v_u_14 = require(v_u_1.Modules.RaycastClickDetectorService)
require(v_u_1.Modules.GeneralTargettingService)
local v_u_15 = require(v_u_1.Modules.Trove)
local v_u_16 = require(script.Config)
local v_u_17 = require(v_u_1.Modules.BeeEventV2Controllers.EggInfoFader)
local v_u_18 = require(v_u_1.Modules.ConfirmationPromptController)
local v_u_19 = v_u_1.Assets.Models.BeeEggs
local v_u_20 = Color3.fromRGB(255, 255, 255)
local v_u_21 = Color3.fromRGB(140, 140, 140)
local v_u_22 = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function v26(p23) -- name: preloadModel
	-- upvalues: (copy) v_u_6
	local v24 = {}
	for _, v25 in p23:GetDescendants() do
		if v25:IsA("UnionOperation") or (v25:IsA("MeshPart") or v25:IsA("SpecialMesh")) then
			table.insert(v24, v25)
		end
	end
	v_u_6:PreloadAsync(v24)
end
local v_u_27 = 0
local v_u_28 = {
	["States"] = nil,
	["HoverHighlight"] = nil,
	["ShopInfos"] = nil,
	["HoveredShopHitbox"] = nil,
	["MagnitudeShopHitbox"] = nil,
	["ActiveShopHitbox"] = nil,
	["RightTriggerConnection"] = nil,
	["RightTriggerEndedConn"] = nil,
	["RightTriggerHeld"] = false,
	["States"] = {},
	["ShopInfos"] = {}
}
for _, v29 in v_u_19:GetChildren() do
	if v29:IsA("Model") then
		v26(v29)
	end
end
local v_u_30 = v_u_2:GetLastInputType()
local function v_u_33(p31) -- name: GetInputScreenPosition
	-- upvalues: (copy) v_u_2
	if p31.UserInputType == Enum.UserInputType.Touch then
		return Vector2.new(p31.Position.X, p31.Position.Y)
	end
	local v32 = v_u_2:GetMouseLocation()
	return Vector2.new(v32.X, v32.Y)
end
local function v_u_35(p34) -- name: IsGuiObjectShown
	-- upvalues: (copy) v_u_9
	while p34 and p34 ~= v_u_9 do
		if p34:IsA("GuiObject") and not p34.Visible then
			return false
		end
		if p34:IsA("LayerCollector") and not p34.Enabled then
			return false
		end
		p34 = p34.Parent
	end
	return true
end
local function v_u_37(p36) -- name: IsGuiButtonOrTextBox
	-- upvalues: (copy) v_u_9
	while p36 and p36 ~= v_u_9 do
		if p36:IsA("GuiButton") or p36:IsA("TextBox") then
			return true
		end
		p36 = p36.Parent
	end
	return false
end
local function v_u_40(p38) -- name: IsPositionOverBlockingGui
	-- upvalues: (copy) v_u_9, (copy) v_u_35, (copy) v_u_37
	for _, v39 in v_u_9:GetGuiObjectsAtPosition(p38.X, p38.Y) do
		if v39:IsDescendantOf(v_u_9) and (v_u_35(v39) and v_u_37(v39)) then
			return true
		end
	end
	return false
end
local function v_u_43(p41, p42) -- name: UpdateWorldClickBlock
	-- upvalues: (copy) v_u_40, (copy) v_u_33, (ref) v_u_27
	if p41.UserInputType == Enum.UserInputType.MouseButton1 or p41.UserInputType == Enum.UserInputType.Touch then
		if p42 or v_u_40(v_u_33(p41)) then
			v_u_27 = os.clock() + 0.35
		else
			v_u_27 = 0
		end
	else
		return
	end
end
v_u_2.LastInputTypeChanged:Connect(function(p44)
	-- upvalues: (ref) v_u_30, (copy) v_u_28
	v_u_30 = p44
	for _, v45 in v_u_28.ShopInfos do
		if v45.EggInfo then
			local v46 = v45.EggInfo:FindFirstChild("Action")
			if v46 then
				v46.Text = ("[%* To Purchase]"):format(v_u_30.Name:find("Gamepad") and "L2" or (v_u_30 == Enum.UserInputType.Touch and "Tap" or "Click"))
			end
		end
	end
end)
local v_u_47 = nil
local v_u_48 = false
local function v_u_50(p49) -- name: TweenHighlightColor
	-- upvalues: (copy) v_u_28, (ref) v_u_47, (copy) v_u_3, (copy) v_u_22
	if v_u_28.HoverHighlight then
		if v_u_47 then
			v_u_47:Cancel()
		end
		v_u_47 = v_u_3:Create(v_u_28.HoverHighlight, v_u_22, {
			["OutlineColor"] = p49
		})
		v_u_47:Play()
	end
end
v_u_2.InputBegan:Connect(function(p51, p52)
	-- upvalues: (copy) v_u_43, (ref) v_u_27, (copy) v_u_28, (ref) v_u_48, (copy) v_u_50, (copy) v_u_21
	v_u_43(p51, p52)
	if p52 then
		return
	elseif p51.UserInputType == Enum.UserInputType.MouseButton1 then
		if os.clock() <= v_u_27 then
			return
		elseif v_u_28.HoverHighlight and v_u_28.HoverHighlight.Adornee then
			v_u_48 = true
			v_u_50(v_u_21)
		end
	else
		return
	end
end)
v_u_2.InputEnded:Connect(function(p53)
	-- upvalues: (ref) v_u_48, (copy) v_u_50, (copy) v_u_20
	if p53.UserInputType == Enum.UserInputType.MouseButton1 then
		if v_u_48 then
			v_u_48 = false
			v_u_50(v_u_20)
		end
	else
		return
	end
end)
local function v_u_62(p54) -- name: SetActiveShopHitbox
	-- upvalues: (copy) v_u_28, (copy) v_u_17, (ref) v_u_48, (copy) v_u_21, (copy) v_u_20, (copy) v_u_2
	if v_u_28.ActiveShopHitbox == p54 then
		return
	else
		if v_u_28.ActiveShopHitbox and v_u_28.ShopInfos[v_u_28.ActiveShopHitbox] then
			v_u_17.Hide(v_u_28.ShopInfos[v_u_28.ActiveShopHitbox].EggInfo)
		end
		v_u_28.ActiveShopHitbox = p54
		if p54 and v_u_28.ShopInfos[p54] then
			local v55 = v_u_28.ShopInfos[p54]
			v_u_17.Show(v55.EggInfo)
			if v_u_28.HoverHighlight then
				local v56 = v_u_28.HoverHighlight
				local v57
				if v_u_48 then
					v57 = v_u_21
				else
					v57 = v_u_20
				end
				v56.OutlineColor = v57
				v_u_28.HoverHighlight.Adornee = v55.EggModel
			end
			if not v_u_28.RightTriggerConnection then
				v_u_28.RightTriggerConnection = v_u_2.InputBegan:Connect(function(p58, p59)
					-- upvalues: (ref) v_u_28
					if p59 then
						return
					elseif p58.KeyCode == Enum.KeyCode.ButtonL2 then
						if v_u_28.ActiveShopHitbox then
							if v_u_28.HoverHighlight and v_u_28.HoverHighlight.Adornee then
								local v60 = v_u_28.ActiveShopHitbox
								if v60 then
									local v61 = v_u_28.ShopInfos[v60]
									if v61 then
										if not v61.Purchase then
											return
										end
										v61.Purchase()
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
				end)
			end
		else
			if v_u_28.HoverHighlight then
				v_u_28.HoverHighlight.Adornee = nil
				if v_u_28.RightTriggerConnection then
					v_u_28.RightTriggerConnection:Disconnect()
					v_u_28.RightTriggerConnection = nil
				end
				v_u_28.RightTriggerHeld = false
			end
			return
		end
	end
end
local function v_u_69() -- name: GetClosestShopHitbox
	-- upvalues: (copy) v_u_8, (copy) v_u_28
	local v63 = v_u_8.Character
	if not v63 then
		return nil
	end
	local v64 = v63:FindFirstChild("HumanoidRootPart")
	if not (v64 and v64:IsA("BasePart")) then
		return nil
	end
	local v65 = 16
	local v66 = nil
	for v67 in v_u_28.ShopInfos do
		if v67:IsDescendantOf(workspace) then
			local v68 = (v64.Position - v67.Position).Magnitude
			if v68 <= v65 then
				v66 = v67
				v65 = v68
			end
		end
	end
	return v66
end
local v_u_70 = {}
local function v_u_76(p_u_71, p72) -- name: TweenGlow
	-- upvalues: (copy) v_u_70, (copy) v_u_3
	local v73 = p_u_71:FindFirstChild("Misc")
	if v73 then
		v73 = v73:FindFirstChild("Glow")
	end
	if v73 then
		local v74 = v_u_70[p_u_71]
		if v74 then
			v74:Cancel()
			v_u_70[p_u_71] = nil
		end
		local v_u_75 = v_u_3:Create(v73, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["Color"] = p72
		})
		v_u_70[p_u_71] = v_u_75
		v_u_75.Completed:Once(function()
			-- upvalues: (ref) v_u_70, (copy) p_u_71, (copy) v_u_75
			if v_u_70[p_u_71] == v_u_75 then
				v_u_70[p_u_71] = nil
			end
		end)
		v_u_75:Play()
	end
end
local function v_u_83(p_u_77, p78, p79) -- name: SpringScale
	-- upvalues: (copy) v_u_3
	local v_u_80 = p79:Add(Instance.new("NumberValue"))
	v_u_80.Value = p_u_77:GetScale()
	v_u_80.Parent = p_u_77
	p79:Add(v_u_80:GetPropertyChangedSignal("Value"):Connect(function()
		-- upvalues: (copy) p_u_77, (copy) v_u_80
		local v81 = p_u_77
		local v82 = v_u_80.Value
		v81:ScaleTo((math.max(v82, 0.001)))
	end))
	p79:Add(v_u_3:Create(v_u_80, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		["Value"] = p78
	})):Play()
	return v_u_80
end
local function v_u_92(p_u_84, p_u_85) -- name: RemoveEggFromNode
	-- upvalues: (copy) v_u_28, (copy) v_u_17, (copy) v_u_62, (copy) v_u_3
	local v86 = p_u_84:FindFirstChild("Hitbox")
	if v86 and v86:IsA("BasePart") then
		v86.CanQuery = false
		if v_u_28.HoveredShopHitbox == v86 then
			v_u_28.HoveredShopHitbox = nil
		end
		if v_u_28.MagnitudeShopHitbox == v86 then
			v_u_28.MagnitudeShopHitbox = nil
		end
		v_u_28.ShopInfos[v86] = nil
		if v_u_28.ActiveShopHitbox == v86 then
			if v_u_28.ActiveShopHitbox ~= nil then
				if v_u_28.ActiveShopHitbox and v_u_28.ShopInfos[v_u_28.ActiveShopHitbox] then
					v_u_17.Hide(v_u_28.ShopInfos[v_u_28.ActiveShopHitbox].EggInfo)
				end
				v_u_28.ActiveShopHitbox = nil
				if v_u_28.HoverHighlight then
					v_u_28.HoverHighlight.Adornee = nil
					if v_u_28.RightTriggerConnection then
						v_u_28.RightTriggerConnection:Disconnect()
						v_u_28.RightTriggerConnection = nil
					end
					v_u_28.RightTriggerHeld = false
				end
			end
		else
			v_u_62(v_u_28.HoveredShopHitbox or v_u_28.MagnitudeShopHitbox)
		end
	end
	local v_u_87 = Instance.new("NumberValue")
	v_u_87.Value = p_u_84:GetScale()
	v_u_87.Parent = p_u_84
	local v_u_90 = v_u_87:GetPropertyChangedSignal("Value"):Connect(function()
		-- upvalues: (copy) p_u_84, (copy) v_u_87
		if p_u_84.Parent then
			local v88 = p_u_84
			local v89 = v_u_87.Value
			v88:ScaleTo((math.max(v89, 0.001)))
		end
	end)
	local v91 = v_u_3:Create(v_u_87, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		["Value"] = 0.001
	})
	v91:Play()
	v91.Completed:Connect(function()
		-- upvalues: (copy) v_u_90, (copy) v_u_87, (copy) p_u_84, (copy) p_u_85
		v_u_90:Disconnect()
		v_u_87:Destroy()
		if p_u_84.Parent then
			p_u_84:Destroy()
		end
		p_u_85()
	end)
end
local function v_u_118(p_u_93, p_u_94, p_u_95, _, p_u_96, p_u_97) -- name: SpawnEggInNode
	-- upvalues: (copy) v_u_19, (copy) v_u_10, (ref) v_u_30, (copy) v_u_13, (copy) v_u_7, (copy) v_u_14, (copy) v_u_28, (copy) v_u_62, (copy) v_u_1, (copy) v_u_76, (copy) v_u_92, (ref) v_u_27, (copy) v_u_2, (copy) v_u_18, (copy) v_u_83
	local v98 = p_u_94:FindFirstChild("Holder", true) or p_u_94:WaitForChild("Holder", 10)
	if v98 then
		local v99 = v_u_19:FindFirstChild(p_u_95)
		if v99 then
			local v100 = v_u_10.Entries[p_u_95]
			local v_u_101 = p_u_96:Add(v99:Clone())
			v_u_101.Name = "EggModel"
			v_u_101:SetAttribute("EggName", p_u_95)
			v_u_101:SetAttribute("Bought", false)
			for _, v102 in v_u_101:QueryDescendants("BasePart") do
				v102.Anchored = true
				v102.CanCollide = true
			end
			local v103 = v_u_101:FindFirstChildOfClass("ProximityPrompt")
			if v103 then
				v103:Destroy()
			end
			local v104, v105 = v_u_101:GetBoundingBox()
			local v_u_106 = Instance.new("Part")
			v_u_106.Name = "Hitbox"
			v_u_106.Size = v105 * 1.025
			v_u_106.CFrame = v104
			v_u_106.Transparency = 1
			v_u_106.CanCollide = false
			v_u_106.Anchored = true
			v_u_106.Parent = v_u_101
			if not v100 then
				warn((("Couldn\'t find entry for %*!!"):format(p_u_95)))
			end
			local v107 = script.EggInfo:Clone()
			v107.Item.Text = p_u_95
			v107.Action.Text = ("[%* To Purchase]"):format(v_u_30.Name:find("Gamepad") and "L2" or (v_u_30 == Enum.UserInputType.Touch and "Tap" or "Click"))
			if v100 and v100.Color then
				v107.Item.TextColor3 = v100.Color
			end
			v107.Price.Label.Visible = true
			v107.Price.Detail.Visible = false
			if v100 and v100.Price then
				v107.Price.Label.Text = v_u_13.Comma((("%*"):format(v100.Price)))
			else
				v107.Price.Visible = false
			end
			v107.Enabled = false
			v107.Parent = v_u_106
			local v108 = RaycastParams.new()
			v108.FilterDescendantsInstances = v_u_7:GetTagged("BeeSwarmEggShop")
			v108.FilterType = Enum.RaycastFilterType.Include
			local v109 = v_u_14.bind(v_u_106, {
				["MaxDistance"] = 50,
				["params"] = nil,
				["params"] = v108
			})
			v109.MouseHoverEnter:Connect(function()
				-- upvalues: (ref) v_u_28, (copy) v_u_106, (ref) v_u_62
				v_u_28.HoveredShopHitbox = v_u_106
				v_u_62(v_u_28.HoveredShopHitbox or v_u_28.MagnitudeShopHitbox)
			end)
			v109.MouseHoverLeave:Connect(function()
				-- upvalues: (ref) v_u_28, (copy) v_u_106, (ref) v_u_62
				if v_u_28.HoveredShopHitbox == v_u_106 then
					v_u_28.HoveredShopHitbox = nil
					v_u_62(v_u_28.HoveredShopHitbox or v_u_28.MagnitudeShopHitbox)
				end
			end)
			local function v_u_110() -- name: DoPurchase
				-- upvalues: (copy) v_u_101, (ref) v_u_1, (copy) p_u_95, (copy) p_u_97, (copy) p_u_93, (copy) p_u_94, (ref) v_u_76, (copy) p_u_96, (ref) v_u_92
				if v_u_101:GetAttribute("Bought") or v_u_101:GetAttribute("Buying") then
					return
				else
					v_u_101:SetAttribute("Buying", true)
					if v_u_1.GameEvents.BeeColonyEggShopService.BuyBeeEggStock:InvokeServer(p_u_95) then
						if not p_u_97.BoughtOutNodes then
							p_u_97.BoughtOutNodes = {}
						end
						p_u_97.BoughtOutNodes[p_u_93] = true
						v_u_101:SetAttribute("Bought", true)
						v_u_76(p_u_94, Color3.fromRGB(0, 0, 0))
						if p_u_97.NodeTroves[p_u_93] == p_u_96 then
							p_u_97.NodeTroves[p_u_93] = nil
							p_u_97.NodeEggs[p_u_93] = nil
						end
						v_u_92(v_u_101, function()
							-- upvalues: (ref) p_u_96
							p_u_96:Clean()
						end)
					else
						v_u_101:SetAttribute("Buying", false)
					end
				end
			end
			local function v_u_115() -- name: PurchaseThisEgg
				-- upvalues: (copy) v_u_101, (ref) v_u_27, (ref) v_u_2, (ref) v_u_10, (copy) p_u_95, (ref) v_u_13, (ref) v_u_18, (copy) v_u_110
				if v_u_101:GetAttribute("Bought") or v_u_101:GetAttribute("Buying") then
					return
				elseif os.clock() <= v_u_27 then
					return
				elseif v_u_2.PreferredInput == Enum.PreferredInput.Touch then
					local v111 = v_u_10.Entries[p_u_95]
					local v112
					if v111 and v111.Price then
						local v113 = v_u_13.Comma
						local v114 = v111.Price
						v112 = v113((tostring(v114)))
					else
						v112 = "?"
					end
					v_u_18:Open({
						["Title"] = "Purchase Bee Egg",
						["Header"] = nil,
						["Middle"] = nil,
						["Footer"] = "This action cannot be undone.",
						["ConfirmText"] = "Buy",
						["RejectText"] = "Cancel",
						["Header"] = p_u_95,
						["Middle"] = ("Are you sure you want to buy this egg for %* Honey Coins?"):format(v112)
					}, {
						["ConfirmCallback"] = function() -- name: ConfirmCallback
							-- upvalues: (ref) v_u_101, (ref) v_u_110
							if not (v_u_101:GetAttribute("Bought") or v_u_101:GetAttribute("Buying")) then
								v_u_110()
							end
						end
					})
				else
					v_u_110()
				end
			end
			v109.MouseClick:Connect(function()
				-- upvalues: (ref) v_u_30, (copy) v_u_115
				if not v_u_30.Name:find("Gamepad") then
					v_u_115()
				end
			end)
			local v116 = v_u_101:GetScale()
			v_u_101:ScaleTo(0.001)
			v_u_101:PivotTo(v98:GetPivot() * CFrame.Angles(3.141592653589793, 0, 0))
			v_u_101.Parent = p_u_94
			v_u_28.ShopInfos[v_u_106] = {
				["EggInfo"] = v107,
				["EggModel"] = v_u_101,
				["Purchase"] = v_u_115
			}
			v107.Enabled = false
			v_u_83(v_u_101, v116, p_u_96)
			local v117 = v_u_10.Entries[p_u_95]
			if v117 then
				v_u_76(p_u_94, v117.Color)
				return v_u_101
			end
			warn((("No BeeEggRegistry entry for %*"):format(p_u_95)))
			v_u_76(p_u_94, Color3.fromRGB(0, 0, 0))
			return v_u_101
		end
		warn("No egg model found for:", p_u_95)
	else
		warn("No holder found in node", p_u_94.Name)
	end
end
local function v_u_143(p119, p120, p121) -- name: UpdateShopDisplay
	-- upvalues: (copy) v_u_12, (copy) v_u_76, (copy) v_u_92, (copy) v_u_118
	if not p121.NodeTroves then
		p121.NodeTroves = {}
	end
	if not p121.NodeEggs then
		p121.NodeEggs = {}
	end
	if not p121.BoughtOutNodes then
		p121.BoughtOutNodes = {}
	end
	local v122 = v_u_12:GetData()
	local v123 = v122 and v122.BeeEggShopStock
	if v123 then
		v123 = v122.BeeEggShopStock.Egg
	end
	if p121.LastShopSeed ~= v123 then
		p121.LastShopSeed = v123
		table.clear(p121.BoughtOutNodes)
	end
	local v124 = {}
	for v125, v126 in p120 do
		for _ = 1, v126.Stock do
			table.insert(v124, v125)
		end
	end
	local function v134(p127, p128) -- name: ShuffleWithSeed
		local v129 = Random.new(p128)
		for v130 = #p127, 2, -1 do
			local v131 = v129:NextInteger(1, v130)
			local v132 = p127[v131]
			local v133 = p127[v130]
			p127[v130] = v132
			p127[v131] = v133
		end
	end
	if v123 then
		v134(v124, v123)
	end
	local v135 = 1
	for v136 = 1, 6 do
		local v137 = p119:FindFirstChild((tostring(v136)))
		if v137 then
			local v138 = p121.NodeEggs[v136]
			local v139
			if p121.BoughtOutNodes[v136] then
				v139 = nil
			else
				v139 = v124[v135]
				v135 = v135 + 1
			end
			if v139 then
				if v138 ~= v139 then
					if p121.NodeTroves[v136] then
						local v_u_140 = p121.NodeTroves[v136]
						local v141 = v137:FindFirstChild("EggModel")
						v_u_76(v137, Color3.fromRGB(0, 0, 0))
						if v141 then
							v_u_92(v141, function()
								-- upvalues: (copy) v_u_140
								v_u_140:Clean()
							end)
						else
							v_u_140:Clean()
						end
						p121.NodeTroves[v136] = nil
						p121.NodeEggs[v136] = nil
					end
					if v139 then
						local v142 = p121.Trove:Extend()
						p121.NodeTroves[v136] = v142
						p121.NodeEggs[v136] = v139
						v_u_118(v136, v137, v139, p120[v139], v142, p121)
					else
						v_u_76(v137, Color3.fromRGB(0, 0, 0))
					end
				end
			else
				v_u_76(v137, Color3.fromRGB(0, 0, 0))
			end
		end
	end
end
function v_u_28.Start() -- name: Start
	-- upvalues: (copy) v_u_28, (copy) v_u_62, (copy) v_u_8, (copy) v_u_4, (copy) v_u_69, (copy) v_u_11, (copy) v_u_15, (copy) v_u_20, (copy) v_u_1, (copy) v_u_12, (copy) v_u_143, (copy) v_u_16
	task.spawn(function()
		-- upvalues: (ref) v_u_28, (ref) v_u_62, (ref) v_u_8
		local function v_u_145(p144) -- name: onChildAdded
			-- upvalues: (ref) v_u_28, (ref) v_u_62
			if p144:IsA("Tool") then
				if v_u_28.HoverHighlight and v_u_28.HoverHighlight.Parent then
					v_u_28.HoverHighlight.Adornee = nil
					v_u_62(v_u_28.HoveredShopHitbox or v_u_28.MagnitudeShopHitbox)
				end
			else
				return
			end
		end
		if v_u_8.Character then
			v_u_8.Character.ChildAdded:Connect(v_u_145)
		end
		v_u_8.CharacterAdded:Connect(function(p146)
			-- upvalues: (copy) v_u_145
			p146.ChildAdded:Connect(v_u_145)
		end)
	end)
	v_u_4.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_69, (ref) v_u_28, (ref) v_u_62
		local v147 = v_u_69()
		if v_u_28.MagnitudeShopHitbox ~= v147 then
			v_u_28.MagnitudeShopHitbox = v147
			v_u_62(v_u_28.HoveredShopHitbox or v_u_28.MagnitudeShopHitbox)
		end
	end)
	v_u_11({
		["Tag"] = "BeeSwarmEggShop",
		["OnInstanceAdded"] = nil,
		["OnInstanceRemoved"] = nil,
		["OnInstanceAdded"] = function(p_u_148) -- name: OnInstanceAdded
			-- upvalues: (ref) v_u_15, (ref) v_u_28, (ref) v_u_20, (ref) v_u_1, (ref) v_u_12, (ref) v_u_143, (ref) v_u_16
			local v149 = v_u_15.new()
			local v_u_150 = {
				["Trove"] = v149,
				["NodeTroves"] = {},
				["NodeEggs"] = {}
			}
			v_u_28.States[p_u_148] = {
				["Trove"] = v149,
				["State"] = v_u_150
			}
			v149:Add(function()
				-- upvalues: (ref) v_u_28, (copy) p_u_148
				v_u_28.States[p_u_148] = nil
				if not next(v_u_28.States) and v_u_28.HoverHighlight then
					v_u_28.HoverHighlight:Destroy()
					v_u_28.HoverHighlight = nil
				end
			end)
			if not v_u_28.HoverHighlight then
				local v151 = Instance.new("Highlight")
				v151.Name = "BeeColonyEggShopController"
				v151.FillTransparency = 1
				v151.OutlineColor = v_u_20
				v151.Adornee = nil
				v151.DepthMode = Enum.HighlightDepthMode.Occluded
				v151.Parent = v_u_1
				v_u_28.HoverHighlight = v151
			end
			local v_u_152 = p_u_148:WaitForChild("Nodes")
			local v153 = v_u_12:GetData()
			v_u_143(v_u_152, v153 and (v153.BeeEggShopStock and v153.BeeEggShopStock.Stocks) or {}, v_u_150)
			local v154 = v_u_12:GetPathSignal("BeeEggShopStock/Stocks")
			if v154 then
				v149:Add(v154:Connect(function()
					-- upvalues: (ref) v_u_12, (ref) v_u_143, (copy) v_u_152, (copy) v_u_150
					local v155 = v_u_12:GetData()
					v_u_143(v_u_152, v155 and (v155.BeeEggShopStock and v155.BeeEggShopStock.Stocks) or {}, v_u_150)
				end))
			end
			local v_u_156 = p_u_148:FindFirstChild("RestockSign")
			if v_u_156 then
				v_u_156 = v_u_156:FindFirstChild("Sign_Part")
			end
			if v_u_156 then
				v_u_156 = v_u_156:FindFirstChild("RestockTimer")
			end
			if v_u_156 then
				v_u_156 = v_u_156:FindFirstChild("label")
			end
			if v_u_156 then
				v149:Add(task.spawn(function()
					-- upvalues: (ref) v_u_12, (ref) v_u_16, (copy) v_u_156
					while true do
						local v157 = DateTime.now().UnixTimestamp
						local v158 = v_u_12:GetData()
						if v158 then
							v158 = v158.BeeEggShopStock
						end
						if not v158 then
							break
						end
						local v159 = v158.ForcedEggEndTimestamp
						if not v159 or v157 >= v159 then
							break
						end
						v166 = v159 - v157
						::l7::
						local v160 = v_u_156
						local v161 = "Restock: %*"
						local v162 = math.floor(v166)
						local v163 = math.max(0, v162)
						local v164
						if v163 < 60 then
							v164 = ("%*s"):format(v163)
						else
							v164 = string.format("%d:%02d", v163 // 60, v163 % 60)
						end
						v160.Text = v161:format(v164)
						task.wait(1)
					end
					local v165 = v_u_16.RefreshTime
					local v166 = v165 - v157 % v165
					goto l7
				end))
			end
		end,
		["OnInstanceRemoved"] = function(p167) -- name: OnInstanceRemoved
			-- upvalues: (ref) v_u_28
			local v168 = v_u_28.States[p167]
			if v168 then
				v168.Trove:Clean()
			end
		end
	})
end
task.spawn(v_u_28.Start)
return v_u_28