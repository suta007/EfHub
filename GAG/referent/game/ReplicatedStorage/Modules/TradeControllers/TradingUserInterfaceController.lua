local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("Debris")
require(script.TradeUIItemValueCalculators)
local v_u_8 = require(script.TradeUIStaticData)
local v_u_9 = require(script.TradeUIItemRenderers)
local v_u_10 = require(v2.Modules.TradeControllers.TradingController)
local v_u_11 = require(v2.Modules.GuiController)
local v_u_12 = require(v2.Modules.DataService)
local v_u_13 = require(v2.Modules.NumberUtil)
local v_u_14 = require(v2.Modules.FastTween)
local v_u_15 = require(v2.Data.TradeData)
local v_u_16 = require(v2.Modules.Spring)
local v17 = require(v2.Modules.Trove)
local v_u_18 = require(v2.Modules.NotifisController)
require(v2.Modules.TradeMenu.TradeMenuTypes)
local v_u_19 = require(v2.Comma_Module)
local v_u_20 = require(v2.Modules.TradeTokens.TokenRAPController)
local v_u_21 = require(v2.Modules.TradeControllers.TradeItemHoverController)
local v_u_22 = require(v2.Modules.UpdateService)
require(v2.Modules.TradeControllers.TradeWorldController)
local v_u_23 = v_u_6.LocalPlayer
local v_u_24 = v_u_23.PlayerGui
local v_u_25 = v_u_24:WaitForChild("TradingUI")
local v_u_26 = v_u_25.LiveTrade
local v_u_27 = v_u_24.TradeItemHover.TradeItemHover
local v_u_28 = v_u_26.Options.Accept
local v_u_29 = v_u_28.Label
local v_u_30 = v_u_26.Options.Decline
local v_u_31 = v_u_26.MyPlr
local v_u_32 = v_u_26.OtherPlr
local v_u_33 = v_u_31.ScrollingFrame.AddItemButtom.Btn
local v_u_34 = v_u_31.ScrollingFrame.ItemTemplate
local v_u_35 = v_u_32.Price
local v_u_36 = v_u_31.Price
local v_u_37 = v_u_26.Status
local v_u_38 = v_u_26.TokenCounter
local v_u_39 = v_u_24.TokensInfo
local v_u_40 = v_u_24.BuyTokens
local v_u_41 = v_u_24.TradeNotifs
local v_u_42 = v_u_24.UnfairTrade
local v43 = v2.Modules.TradeTokens.Templates
local v_u_44 = v43.ItemTemplate
local v_u_45 = v43.PastTradeTemplate
local v_u_46 = Enum.ThumbnailType.HeadShot
local v_u_47 = Enum.ThumbnailSize.Size420x420
local v_u_48 = false
v_u_34.Visible = false
local v_u_49 = {}
local v_u_50 = v17.new()
local v_u_51 = {}
local v_u_52 = nil
local v_u_53 = nil
local v_u_54 = v_u_28.Label.UIStroke.Color
local v_u_55 = v_u_28.UIStroke.Color
local v_u_56 = v_u_28.BackgroundColor3
local function v_u_63(p_u_57)
	-- upvalues: (copy) v_u_16
	if not p_u_57 then
		return nil
	end
	local v_u_58 = p_u_57.instance
	if not v_u_58:IsA("GuiButton") then
		return nil
	end
	local v_u_59 = v_u_58:FindFirstChildOfClass("UIScale")
	if not v_u_59 then
		return nil
	end
	local v_u_60 = p_u_57.speed or 10
	local v_u_61 = p_u_57.damping or 1
	local v_u_62 = p_u_57.offset or 0.065
	v_u_58.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_16, (copy) v_u_59, (copy) v_u_61, (copy) v_u_60, (copy) v_u_62
		if v_u_58:HasTag("TradeItemUI") and v_u_58:FindFirstAncestor("MyPlr") then
			v_u_58:FindFirstChild("TrashImg").Visible = true
		end
		v_u_16.target(v_u_59, v_u_61, v_u_60, {
			["Scale"] = 1 + (v_u_58.Active and v_u_62 or 0)
		})
	end)
	v_u_58.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_58, (ref) v_u_16, (copy) v_u_59, (copy) v_u_61, (copy) v_u_60
		if v_u_58:HasTag("TradeItemUI") and v_u_58:FindFirstAncestor("MyPlr") then
			v_u_58:FindFirstChild("TrashImg").Visible = false
		end
		v_u_16.target(v_u_59, v_u_61, v_u_60, {
			["Scale"] = 1
		})
	end)
	v_u_58.MouseButton1Down:Connect(function()
		-- upvalues: (ref) v_u_16, (copy) v_u_59, (copy) v_u_61, (copy) v_u_60, (copy) v_u_58, (copy) v_u_62
		v_u_16.target(v_u_59, v_u_61, v_u_60, {
			["Scale"] = 1 - (v_u_58.Active and v_u_62 or 0)
		})
	end)
	v_u_58.MouseButton1Up:Connect(function()
		-- upvalues: (ref) v_u_16, (copy) v_u_59, (copy) v_u_61, (copy) v_u_60, (copy) v_u_58, (copy) v_u_62
		v_u_16.target(v_u_59, v_u_61, v_u_60, {
			["Scale"] = 1 + (v_u_58.Active and v_u_62 or 0)
		})
	end)
	v_u_58.Activated:Connect(function()
		-- upvalues: (copy) p_u_57, (copy) v_u_58
		if p_u_57.onclick then
			p_u_57.onclick(v_u_58)
		end
	end)
	return v_u_58
end
local function v_u_66(p64)
	-- upvalues: (ref) v_u_53, (copy) v_u_28, (copy) v_u_16, (ref) v_u_54, (ref) v_u_56, (ref) v_u_55
	if v_u_53 ~= p64 then
		v_u_53 = p64
		v_u_28.Active = p64
		v_u_28.AutoButtonColor = p64
		local v65 = v_u_28
		v_u_16.target(v65.Label.UIStroke, 1, 2.5, {
			["Color"] = p64 and v_u_54 or Color3.fromRGB(75, 75, 75)
		})
		v_u_16.target(v65, 1, 2.5, {
			["BackgroundColor3"] = p64 and v_u_56 or Color3.fromRGB(125, 125, 125)
		})
		v_u_16.target(v65.UIStroke, 1, 2.5, {
			["Color"] = p64 and v_u_55 or Color3.fromRGB(50, 50, 50)
		})
		v_u_16.target(v65.UIScale, 1, 5, {
			["Scale"] = 1
		})
	end
end
local function v_u_81(p67)
	-- upvalues: (ref) v_u_52, (copy) v_u_30, (copy) v_u_14
	if v_u_52 ~= p67 then
		v_u_52 = p67
		v_u_30.Active = p67
		v_u_30.AutoButtonColor = p67
		local v68 = TweenInfo.new(0.15)
		local v69 = v_u_14
		local v70 = v_u_30.Label.UIStroke
		local v71 = {}
		local v72
		if p67 then
			v72 = Color3.fromRGB(118, 4, 7)
		else
			v72 = Color3.fromRGB(120, 120, 120)
		end
		v71.Color = v72
		v69(v70, v68, v71)
		local v73 = v_u_14
		local v74 = v_u_30
		local v75 = {}
		local v76
		if p67 then
			v76 = Color3.fromRGB(220, 29, 26)
		else
			v76 = Color3.fromRGB(125, 125, 125)
		end
		v75.BackgroundColor3 = v76
		v73(v74, v68, v75)
		local v77 = v_u_14
		local v78 = v_u_30.UIStroke
		local v79 = {}
		local v80
		if p67 then
			v80 = Color3.fromRGB(245, 29, 29)
		else
			v80 = Color3.fromRGB(120, 120, 120)
		end
		v79.Color = v80
		v77(v78, v68, v79)
	end
end
local function v_u_86(p82, p83, _)
	-- upvalues: (copy) v_u_20
	local v84 = 0
	for _, v85 in p82 do
		v84 = v84 + (v_u_20:GetRAP(v85.type, v85.data) or 0)
	end
	return v84 + (p83 or 0)
end
local function v_u_94(p87)
	-- upvalues: (copy) v_u_86
	local v88 = p87.offers[1]
	local v89 = p87.offers[2]
	local v90 = v_u_86(v88.items, v88.tokens, v88.sheckles)
	local v91 = v_u_86(v89.items, v89.tokens, v89.sheckles)
	local v92 = v90 - v91
	local v93 = math.abs(v92)
	if v91 < v90 then
		return p87.players[1], v93
	elseif v90 < v91 then
		return p87.players[2], v93
	else
		return nil, v93
	end
end
function v_u_49.CreatePastTrade(p95, p_u_96)
	-- upvalues: (copy) v_u_44, (copy) v_u_9, (copy) v_u_21, (copy) v_u_86, (copy) v_u_13, (copy) v_u_6, (copy) v_u_46, (copy) v_u_47, (copy) v_u_23, (copy) v_u_45, (copy) v_u_25, (copy) v_u_26, (copy) v_u_11
	local function v109(p97, p98, p99)
		-- upvalues: (ref) v_u_44, (ref) v_u_9, (ref) v_u_21, (ref) v_u_86, (ref) v_u_13, (ref) v_u_6, (ref) v_u_46, (ref) v_u_47
		local v100 = p97.items
		local v101 = p97.sheckles or 0
		local v102 = p97.tokens or 0
		local v103 = p98:FindFirstChild("ScrollingFrame")
		for _, v104 in v100 do
			local v105 = v104.type
			local v106 = v_u_44:Clone()
			local v107 = v_u_9.ItemRenderTypes[v105]
			if not v107 then
				warn("TradeMenuHistory | No item renderer")
				return
			end
			v106.AutoButtonColor = false
			v106.Interactable = false
			v106:SetAttribute("UUID", v104.id)
			v106:AddTag("TradingUserInterfaceTargetable")
			v_u_21:AddItemToData(v104.id, v104)
			v107(v106, v104)
			v106.Parent = v103
			v106.Visible = true
		end
		local v108 = v_u_86(v100, v102, v101)
		p98:FindFirstChild("Price"):FindFirstChild("Amount").Text = ("%*"):format(v108)
		p98:FindFirstChild("Sheckles"):FindFirstChild("Amount").Text = ("%*"):format((v_u_13.FormatCompactPrice(v101)))
		p98:FindFirstChild("Tokens"):FindFirstChild("Amount").Text = ("%*"):format(v102)
		p98:FindFirstChild("Headshot").Image = v_u_6:GetUserThumbnailAsync(p99, v_u_46, v_u_47)
	end
	local v110 = p95.users
	local v111 = v110[1].userId == v_u_23.UserId and 1 or 2
	local v112 = v111 == 1 and 2 or 1
	local v_u_113 = v_u_45:Clone()
	local v114 = v_u_113.UserFrame
	v114.Headshot.Image = v_u_6:GetUserThumbnailAsync(v110[v112].userId, v_u_46, v_u_47)
	v114.Username.Text = ("@%*"):format(v110[v112].username)
	v_u_113.OtherPlr.Price.Label.Text = ("@%*\'s Value:"):format(v110[v112].username)
	v109(p95.offers[v111], v_u_113.MyPlr, v110[v111].userId)
	v109(p95.offers[v112], v_u_113.OtherPlr, v110[v112].userId)
	v_u_113.Parent = v_u_25
	v_u_113.Visible = true
	v_u_26.Visible = false
	local v_u_115 = v_u_113.Close.Activated:Once(function()
		-- upvalues: (ref) v_u_11, (copy) p_u_96, (ref) v_u_25, (copy) v_u_113
		v_u_11:Open(p_u_96)
		v_u_11:Close(v_u_25)
		game.Debris:AddItem(v_u_113, 0.5)
	end)
	v_u_25:GetPropertyChangedSignal("Enabled"):Connect(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_113
		if not v_u_25.Enabled then
			game.Debris:AddItem(v_u_113, 0.5)
		end
	end)
	v_u_113.Destroying:Once(function()
		-- upvalues: (ref) v_u_115
		if v_u_115 then
			v_u_115:Disconnect()
			v_u_115 = nil
		end
	end)
	v_u_11:Open(v_u_25)
	v_u_11:Close(p_u_96)
end
function v_u_49.RenderValues(_)
	-- upvalues: (copy) v_u_10, (copy) v_u_86, (copy) v_u_23, (copy) v_u_36, (copy) v_u_35, (copy) v_u_3, (copy) v_u_7
	local v116 = v_u_10.CurrentTradeReplicator
	if v116 then
		local v117 = v116:GetData()
		if v117 then
			for v118, v119 in v117.players do
				local v120 = v117.offers[v118]
				local _ = v120.items
				local v121 = v_u_86(v120.items, v120.tokens, v120.sheckles)
				local v122 = v119 == v_u_23 and v_u_36 or v_u_35
				if v122.Amount.Text ~= v121 then
					v122.Amount.Text = v121
					local v123 = v122.Amount:Clone()
					local v124 = Instance.new("UIScale")
					v124.Parent = v123
					v_u_3:Create(v123, TweenInfo.new(0.5), {
						["TextTransparency"] = 1,
						["Position"] = UDim2.fromScale(0.5, 0.5)
					}):Play()
					v_u_3:Create(v124, TweenInfo.new(0.5), {
						["Scale"] = 1.5
					}):Play()
					v_u_3:Create(v123.UIStroke, TweenInfo.new(0.5), {
						["Transparency"] = 1
					}):Play()
					v123.Parent = v122
					v_u_7:AddItem(v123, 0.5)
				end
			end
		end
	else
		return
	end
end
local v_u_125 = {}
function v_u_49.Render(_)
	-- upvalues: (copy) v_u_10, (copy) v_u_23, (copy) v_u_15, (copy) v_u_28, (copy) v_u_29, (copy) v_u_37, (copy) v_u_66, (copy) v_u_81, (copy) v_u_31, (copy) v_u_32, (ref) v_u_51, (copy) v_u_125, (copy) v_u_16, (copy) v_u_35, (copy) v_u_33, (copy) v_u_13, (copy) v_u_21, (copy) v_u_9, (copy) v_u_50, (copy) v_u_34, (copy) v_u_63
	local v126 = v_u_10.CurrentTradeReplicator
	if v126 then
		local v127 = v126:GetData()
		if v127 then
			local v128 = workspace:GetServerTimeNow()
			local v129
			if v127.players[1] == v_u_23 then
				v129 = v127.players[2]
			else
				v129 = v127.players[1]
			end
			local v130 = v127.states[table.find(v127.players, v_u_23)]
			local v131 = v127.states[table.find(v127.players, v129)]
			local v132 = v128 - v127.lastChange
			if v132 < v_u_15.ButtonCooldown then
				v_u_28.Counter.Size = UDim2.fromScale((v_u_15.ButtonCooldown - v132) / v_u_15.ButtonCooldown, 1)
				v_u_28.Label.Text = ("%*s"):format((string.format("%0.1f", v_u_15.ButtonCooldown - v132)))
			elseif v130 == "None" then
				v_u_29.Text = "Accept"
			elseif v130 == "Processing" then
				v_u_29.Text = "Processing..."
			elseif v130 == "Confirmed" then
				v_u_29.Text = "Confirmed"
			elseif v130 == "Accepted" and v131 ~= "None" then
				v_u_29.Text = "Confirm"
			elseif v130 == "Accepted" then
				v_u_29.Text = "Accepted"
			end
			if v_u_15.ButtonCooldown <= v132 and v_u_28.Counter.Size ~= UDim2.fromScale(0, 1) then
				v_u_28.Counter.Size = UDim2.fromScale(0, 1)
			end
			if v130 == "Confirmed" and v131 ~= "Confirmed" then
				v_u_37.Text = ("Waiting for @%*"):format(v129.Name)
			elseif v130 == "Confirmed" or v131 ~= "Confirmed" then
				if v130 == "Accepted" and v131 ~= "Accepted" then
					v_u_37.Text = ("Waiting for @%*"):format(v129.Name)
				elseif v130 == "Accepted" or v131 ~= "Accepted" then
					if v130 == "Processing" or v131 == "Processing" then
						v_u_37.Text = ""
					elseif v130 == "None" or v131 == "None" then
						v_u_37.Text = "Waiting for both players to accept"
					elseif v130 == "Accepted" or v131 == "Accepted" then
						v_u_37.Text = "Waiting for both players to confirm"
					end
				else
					v_u_37.Text = ("@%* has accepted"):format(v129.Name)
				end
			else
				v_u_37.Text = ("@%* has confirmed"):format(v129.Name)
			end
			local v133 = v_u_66
			local v134
			if v132 >= 5 or v130 == "Accepted" and v131 ~= "Accepted" then
				v134 = v130 ~= "Processing"
			else
				v134 = false
			end
			v133(v134)
			v_u_81(v130 ~= "Processing")
			local v135
			if v_u_15.Fee == 0 then
				v135 = v_u_31.Sheckles
			else
				v135 = v_u_31.ShecklesFee
			end
			v135.TextBox.Active = v130 == "None" and true or v131 == "None"
			local v136 = v_u_31.Tokens
			for v137, v138 in v127.players do
				local v139
				if v138 == v_u_23 then
					v139 = v_u_31
				else
					v139 = v_u_32
				end
				local v140 = v_u_51[v138]
				if not v140 then
					v140 = {
						["OfferUIObjects"] = {}
					}
					v_u_51[v138] = v140
				end
				local v141 = v127.states[v137]
				v139.Ready.Visible = true
				local v142
				if v141 == "Accepted" and (v130 == "None" or v131 == "None") then
					v142 = true
				elseif v141 == "Confirmed" then
					v142 = v130 == "Accepted" and true or v131 == "Accepted"
				else
					v142 = false
				end
				if v_u_125[v137] ~= v142 then
					v_u_125[v137] = v142
					v_u_16.target(v139.Ready, 1, 5, {
						["BackgroundTransparency"] = v142 and 0.75 or 1
					})
					v_u_16.target(v139.Ready.Label, 1, 5, {
						["TextTransparency"] = v142 and 0 or 1
					})
					v_u_16.target(v139.Ready.Label.UIStroke, 1, 5, {
						["Transparency"] = v142 and 0 or 1
					})
					v_u_16.target(v139.Ready.Vector, 1, 5, {
						["ImageTransparency"] = v142 and 0 or 1
					})
				end
				v139.Ready.Label.Text = v141
				if v138 ~= v_u_23 then
					local v143 = ("@%*\'s Offer"):format(v138.Name)
					v139.Price.Label.Text = v143
					local v144 = ("@%*\'s Value"):format(v138.Name)
					v_u_35.Label.Text = v144
				end
				local v145 = v139.ScrollingFrame
				local v146 = v127.offers[v137]
				local v147 = v146.sheckles
				local v148 = v146.items
				local v149 = v146.tokens
				if v138 == v_u_23 then
					v_u_33.Visible = #v148 < v_u_15.ItemLimit
				end
				local v150 = v_u_15.ApplyFee(v147)
				if v138 == v_u_23 then
					v135.TextBox.PlaceholderText = v147 <= 0 and "Add Sheckles" or v_u_13.DisplaySheckles(v147)
					if v_u_15.Fee ~= 0 then
						v135.TextLabel.Text = ("<stroke color=\"rgb(21, 131, 34)\"><font color=\"rgb(41, 255, 66)\">%*</font></stroke> <font rgb=\"rgb(255, 52, 52)\">WITH FEE</font>"):format((v_u_13.DisplaySheckles(v150)))
					end
				else
					v_u_32.ShecklesOffer.Amount.Text = v_u_13.DisplaySheckles(v150)
				end
				v135.Visible = v_u_15.SheckleTradingEnabled
				if v138 == v_u_23 then
					v136.TextBox.PlaceholderText = v149 <= 0 and "Add Tokens" or v149
				else
					v_u_32.TokensOffer.Amount.Text = v149
				end
				local v151 = v140.OfferUIObjects
				local v152 = {}
				for _, v153 in v148 do
					v_u_21:AddItemToData(v153.id, v153)
					v152[v153.id] = v153
				end
				for v154, v155 in v151 do
					if not v152[v154] then
						v151[v154] = nil
						v155:Destroy()
						if v138 == v_u_23 then
							v_u_16.stop(v_u_33.UIScale, "Scale")
							v_u_33.UIScale.Scale = 0.5
							v_u_16.target(v_u_33.UIScale, 0.5, 5, {
								["Scale"] = 1
							})
						end
					end
				end
				for v156, v_u_157 in v152 do
					if not v151[v156] then
						local v158 = v_u_9.ItemRenderTypes[v_u_157.type]
						if v158 then
							local v159 = v_u_50:Add(v_u_34:Clone())
							v158(v159, v_u_157)
							v159.UIScale.Scale = 0.5
							v_u_16.target(v159.UIScale, 0.5, 5, {
								["Scale"] = 1
							})
							v159.Visible = true
							v159:SetAttribute("UUID", v156)
							v159:AddTag("TradingUserInterfaceTargetable")
							if v159.GuiState ~= Enum.GuiState.Hover then
								v_u_16.target(v159.UIScale, 1, 5, {
									["Scale"] = 1
								})
							end
							v_u_63({
								["instance"] = v159,
								["onclick"] = function()
									-- upvalues: (ref) v_u_10, (copy) v_u_157
									v_u_10:RemoveItem(v_u_157.type, v_u_157.id)
								end
							})
							v159.Parent = v145
							v151[v156] = v159
						else
							warn(v_u_157.type, "does not have associated item renderer!")
						end
					end
				end
			end
		end
	else
		return
	end
end
function v_u_49.Initialize(_)
	-- upvalues: (copy) v_u_12, (copy) v_u_10, (ref) v_u_51, (copy) v_u_21, (copy) v_u_23, (copy) v_u_6, (copy) v_u_31, (copy) v_u_32, (copy) v_u_38, (copy) v_u_50, (copy) v_u_49, (copy) v_u_25, (copy) v_u_26
	local v160 = v_u_12:GetData()
	if v160 then
		local v161 = v_u_10.CurrentTradeReplicator
		if v161 then
			local v162 = v161:GetDataAsync()
			if v162 and v_u_10.CurrentTradeReplicator == v161 then
				table.clear(v_u_51)
				v_u_51 = {}
				v_u_21:ClearItemsData()
				local v163
				if v162.players[1] == v_u_23 then
					v163 = v162.players[2]
				else
					v163 = v162.players[1]
				end
				local v164 = Enum.ThumbnailType.HeadShot
				local v165 = Enum.ThumbnailSize.Size420x420
				local v166, _ = v_u_6:GetUserThumbnailAsync(v_u_23.UserId, v164, v165)
				v_u_31.Headshot.Image = v166
				local v167, _ = v_u_6:GetUserThumbnailAsync(v163.UserId, v164, v165)
				v_u_32.Headshot.Image = v167
				local v168 = v160.TradeData.Tokens
				v_u_38.TokenCount.Text = ("Tokens: %*"):format(v168)
				v_u_50:Add(assert(v161:GetPathSignal("lastChange")):Connect(function()
					-- upvalues: (ref) v_u_49
					v_u_49:Render()
				end))
				v_u_50:Add(assert(v161:GetPathSignal("states/@")):Connect(function()
					-- upvalues: (ref) v_u_49
					v_u_49:Render()
					v_u_49:RenderValues()
				end))
				v_u_50:Add(assert(v161:GetPathSignal("offers/@")):Connect(function()
					-- upvalues: (ref) v_u_49
					v_u_49:Render()
					v_u_49:RenderValues()
				end))
				v_u_49:Render()
				v_u_49:RenderValues()
				v_u_50:Add(task.spawn(function()
					-- upvalues: (ref) v_u_49
					while true do
						task.wait(0.1)
						v_u_49:Render()
					end
				end))
				v_u_25.Enabled = true
				v_u_26.Visible = true
			end
		else
			return
		end
	else
		warn("TradingUserInterfaceController | No player data")
		return
	end
end
function v_u_49.Cleanup(_)
	-- upvalues: (copy) v_u_50, (copy) v_u_125, (ref) v_u_51
	v_u_50:Clean()
	table.clear(v_u_125)
	table.clear(v_u_51)
	v_u_51 = {}
end
function v_u_49.Start(_)
	-- upvalues: (copy) v_u_11, (copy) v_u_25, (copy) v_u_10, (copy) v_u_49, (copy) v_u_41, (copy) v_u_42, (copy) v_u_39, (copy) v_u_40, (copy) v_u_63, (copy) v_u_28, (copy) v_u_30, (copy) v_u_33, (ref) v_u_48, (copy) v_u_12, (copy) v_u_23, (copy) v_u_94, (copy) v_u_18, (copy) v_u_19, (copy) v_u_38, (copy) v_u_31, (copy) v_u_32, (copy) v_u_22, (copy) v_u_8, (copy) v_u_15, (copy) v_u_4, (copy) v_u_5, (copy) v_u_1, (copy) v_u_24, (copy) v_u_27
	local v_u_169 = v_u_11:GetStateForGui(v_u_25)
	v_u_11:UsePopupAnims(v_u_25)
	v_u_10.OnTradeCreated:Connect(function(_, _)
		-- upvalues: (ref) v_u_11, (ref) v_u_25, (ref) v_u_49
		v_u_11:Open(v_u_25)
		v_u_49:Initialize()
	end)
	v_u_10.OnTradeDestroyed:Connect(function(_)
		-- upvalues: (copy) v_u_169, (ref) v_u_11, (ref) v_u_25, (ref) v_u_41, (ref) v_u_42, (ref) v_u_39, (ref) v_u_40, (ref) v_u_49
		if v_u_169.Visible:Get() then
			v_u_11:Close(v_u_25)
		end
		v_u_11:Close(v_u_41)
		v_u_11:Close(v_u_42)
		v_u_11:Close(v_u_39)
		v_u_11:Close(v_u_40)
		v_u_49:Cleanup()
	end)
	local v170 = v_u_63({
		["instance"] = v_u_28
	})
	local v171 = v_u_63({
		["instance"] = v_u_30
	})
	local v172 = v_u_63({
		["instance"] = v_u_33
	})
	if v170 and (v171 and v172) then
		local function v_u_177(p_u_173, p174)
			-- upvalues: (ref) v_u_48, (ref) v_u_11, (ref) v_u_25, (ref) v_u_10
			local v_u_175 = p174.Activated:Once(function()
				-- upvalues: (ref) v_u_48, (ref) v_u_11, (copy) p_u_173, (ref) v_u_25
				v_u_48 = false
				v_u_11:Close(p_u_173)
				v_u_11:Open(v_u_25)
			end)
			local v_u_176 = nil
			v_u_176 = p_u_173:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (copy) p_u_173, (ref) v_u_175, (ref) v_u_176, (ref) v_u_48, (ref) v_u_10
				if p_u_173.Enabled == false then
					if v_u_175 then
						v_u_175:Disconnect()
						v_u_175 = nil
					end
					if v_u_176 then
						v_u_176:Disconnect()
						v_u_176 = nil
					end
					if v_u_48 then
						task.defer(v_u_10.Decline, v_u_10)
					end
				end
			end)
			v_u_48 = true
			v_u_11:Open(p_u_173)
		end
		v170.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_12, (ref) v_u_23, (ref) v_u_94, (ref) v_u_18, (ref) v_u_42, (ref) v_u_19, (copy) v_u_177
			local v178 = v_u_10.CurrentTradeReplicator
			if v178 then
				local v179 = v178:GetData()
				if v179 and v_u_10.CurrentTradeReplicator == v178 then
					local v180 = v_u_12:GetData()
					if v180 then
						if v179 and v179.states[table.find(v179.players, v_u_23)] == "Accepted" then
							v_u_10:Confirm()
						elseif v179 then
							local v181, v182 = v_u_94(v179)
							if v181 ~= v_u_23 or not v180.TradeData.UnfairTradeWarning then
								v_u_10:Accept()
								return
							end
							v_u_18:HideAllUI()
							local v183 = v_u_42.UnfairTrade
							local v184 = v183.Difference.Value
							if v182 <= 1000000000000 then
								v182 = v_u_19.Comma(v182)
							end
							v184.Text = ("%*"):format(v182)
							v183.Visible = true
							v_u_177(v_u_42, v_u_42.UnfairTrade.Options.No)
							v_u_177(v_u_42, v_u_42.UnfairTrade.Options.Yes)
						end
					else
						warn("TradingUserInterfaceController | No player data")
						return
					end
				else
					return
				end
			else
				return
			end
		end)
		v171.Activated:Connect(function()
			-- upvalues: (ref) v_u_10
			v_u_10:Decline()
		end)
		v_u_25:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_48, (ref) v_u_10
			if v_u_25.Enabled == false and not v_u_48 then
				v_u_10:Decline()
			end
		end)
		v172.Activated:Connect(function()
			-- upvalues: (ref) v_u_10
			v_u_10:RequestAddItem()
		end)
		v_u_25.LiveTrade.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_10
			v_u_10:Decline()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_38, (ref) v_u_31, (ref) v_u_32, (ref) v_u_22, (copy) v_u_177, (ref) v_u_40, (ref) v_u_39, (ref) v_u_10, (ref) v_u_12, (ref) v_u_23, (ref) v_u_8
			v_u_38.Visible = false
			v_u_31.Tokens.Visible = false
			v_u_32.TokensOffer.Visible = false
			while v_u_22:IsHiddenFromUpdate("Trade Tokens") do
				task.wait(1)
			end
			v_u_38.Visible = true
			v_u_31.Tokens.Visible = true
			v_u_32.TokensOffer.Visible = true
			v_u_38.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_177, (ref) v_u_40
				v_u_177(v_u_40, v_u_40.Frame.Close)
			end)
			v_u_38.Info.Activated:Connect(function()
				-- upvalues: (ref) v_u_177, (ref) v_u_39
				v_u_177(v_u_39, v_u_39.Frame.Close)
			end)
			local v_u_185 = v_u_31.Tokens
			v_u_185.TextBox.FocusLost:Connect(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_12, (ref) v_u_23, (ref) v_u_8, (copy) v_u_185
				local v186 = v_u_10.CurrentTradeReplicator
				if not v186 then
					return
				end
				local v187 = v186:GetData()
				if not v187 or v_u_10.CurrentTradeReplicator ~= v186 then
					return
				end
				local v188 = v_u_12:GetData()
				if not v188 then
					return
				end
				local _ = v187.offers[table.find(v187.players, v_u_23)]
				local v189 = v_u_8.Suffixes
				local v190 = string.upper(v_u_185.TextBox.Text)
				for v191 = #v189, 1, -1 do
					local v192 = string.match(v190, (("^([%%d%%.,]*)[%*]$"):format(v189[v191]))) or ""
					local v193 = tonumber(v192)
					if v193 then
						local v194 = v193 * 1000 ^ (#v189 - v191 + 1)
						v190 = tostring(v194)
						break
					end
				end
				local v195 = string.gsub(v190, "%D+", "")
				local v196 = tonumber(v195) or 0
				local v197 = v188.TradeData.Tokens
				v_u_10:SetTokens(math.clamp(v196, 0, v197) or 0)
				v_u_185.TextBox.Text = ""
			end)
		end)
		local v_u_198
		if v_u_15.Fee == 0 then
			v_u_198 = v_u_31.Sheckles
		else
			v_u_198 = v_u_31.ShecklesFee
		end
		v_u_31.ShecklesFee.Visible = v_u_198 == v_u_31.ShecklesFee
		v_u_31.Sheckles.Visible = v_u_198 == v_u_31.Sheckles
		v_u_198.TextBox.FocusLost:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_12, (ref) v_u_23, (ref) v_u_8, (copy) v_u_198
			local v199 = v_u_10.CurrentTradeReplicator
			if not v199 then
				return
			end
			local v200 = v199:GetData()
			if not v200 or v_u_10.CurrentTradeReplicator ~= v199 then
				return
			end
			local v201 = v_u_12:GetData()
			if not v201 then
				return
			end
			local _ = v200.offers[table.find(v200.players, v_u_23)]
			local v202 = v_u_8.Suffixes
			local v203 = string.upper(v_u_198.TextBox.Text)
			for v204 = #v202, 1, -1 do
				local v205 = string.match(v203, (("^([%%d%%.,]*)[%*]$"):format(v202[v204]))) or ""
				local v206 = tonumber(v205)
				if v206 then
					local v207 = v206 * 1000 ^ (#v202 - v204 + 1)
					v203 = tostring(v207)
					break
				end
			end
			local v208 = string.gsub(v203, "%D+", "")
			local v209 = tonumber(v208) or 0
			local v210 = v201.Sheckles
			v_u_10:SetSheckles(math.clamp(v209, 0, v210) or 0)
			v_u_198.TextBox.Text = ""
		end)
		local v_u_211 = v_u_25.LiveTrade.ShecklesHoverInfo
		v_u_211.Visible = false
		if v_u_198 == v_u_31.ShecklesFee then
			local v_u_212 = v_u_31.ShecklesFee.ExclamationMark
			v_u_4.PreRender:Connect(function(_)
				-- upvalues: (ref) v_u_25, (ref) v_u_5, (ref) v_u_1, (copy) v_u_211, (ref) v_u_24, (copy) v_u_212
				if v_u_25.Enabled then
					local v213 = v_u_5:GetGuiInset()
					local v214 = v_u_1:GetMouseLocation() - v213
					v_u_211.Position = UDim2.fromOffset(v214.X + 16, v214.Y + v213.Y)
					local v215 = v_u_24:GetGuiObjectsAtPosition(v214.X, v214.Y)
					v_u_211.Visible = table.find(v215, v_u_212) ~= nil
				end
			end)
		end
		v_u_27.CanvasGroup.GroupTransparency = 1
	else
		warn("Missing button", v170, v171, v172)
	end
end
task.spawn(v_u_49.Start, v_u_49)
return v_u_49