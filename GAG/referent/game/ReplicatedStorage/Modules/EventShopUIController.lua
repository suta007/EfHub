local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ContentProvider")
local v_u_4 = game:GetService("UserInputService")
local v5 = v_u_1:WaitForChild("GameEvents")
local v_u_6 = game.Players.LocalPlayer
local v7 = v_u_6.PlayerGui
local v_u_8 = require(v_u_1.Modules.DataService)
local v9 = require(v_u_1.Modules.Signal)
local v_u_10 = require(v_u_1.Modules.FastTween)
require(v_u_1.Modules.DumpTable)
local v_u_11 = require(v_u_1.Modules.MarketController)
local v_u_12 = require(v_u_1.Modules.GiftController)
local v_u_13 = require(v_u_1.Modules.GuiController)
local v_u_14 = require(v_u_1.Modules.UpdateService)
local v_u_15 = require(v_u_1.Comma_Module)
local v_u_16 = require(v_u_1.Item_Module)
local v_u_17 = require(v_u_1.Modules.NumberUtil)
local v_u_18 = require(v_u_1.Modules.SeedPackOddsController)
local v_u_19 = require(v_u_1.Modules.PetEggOddsController)
local v_u_20 = require(v_u_1.Modules.CosmeticCrateOddsController)
local v_u_21 = require(v_u_1.Modules.UseDynamicPrices)
local v_u_22 = require(v_u_1.Modules.ItemImageFinder)
local v_u_23 = require(v_u_1.Modules.ItemDescriptionFinder)
local v_u_24 = require(v_u_1.Modules.TradeControllers.TradeWorldController)
local v25 = require(v_u_1.Modules.UITabHelperModule)
local v_u_26 = require(v_u_1.Modules.ShopTabHandler)
local v_u_27 = require(v_u_1.Modules.WatchButtonHold)
local v_u_28 = require(v_u_1.Code.Spr)
local v_u_29 = require(v_u_1.Data.CurrencyData)
local _ = require(v_u_1.Data.CosmeticRegistry).CosmeticList
local v_u_30 = require(v_u_1.Data.EventShopConfigData)
local v_u_31 = require(v_u_1.Modules.NPCLevelHandler)
local v_u_32 = require(v_u_1.Data.EventShopData)
local v_u_33 = v5.BuyEventShopStock
local _ = v5.BuyEventShopRestock
local v_u_34 = false
local v_u_35 = nil
local v_u_36 = v9.new()
local v_u_37 = v7:WaitForChild("EventShop_UI")
local v_u_38 = v_u_37:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
local v_u_39 = v_u_37:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("RestocksIn"):WaitForChild("Timer")
local v_u_40 = v_u_37:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("EventShopTitle")
local v_u_41 = v_u_37:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("EventShopTitle"):WaitForChild("EventShopTitle")
local v_u_42 = v_u_38:WaitForChild("ItemFrame")
v_u_42.Parent = script
local v_u_43 = v_u_38:WaitForChild("ItemPadding")
v_u_43.Parent = v_u_38
local v44 = v_u_37:WaitForChild("TabAnchor"):WaitForChild("TabList")
local v45 = v_u_1.UITemplates:WaitForChild("TabButtonTemplate")
local v_u_46 = v25.CreateOrGetTabHandler("EventShop", v44, v45)
local v_u_47 = {
	{
		["Name"] = "Main",
		["IsLocked"] = false
	},
	{
		["Name"] = "Friendship",
		["IsLocked"] = true
	}
}
local v_u_48 = {}
local v_u_49 = {}
local v_u_50 = {}
local v_u_51 = ""
local function v_u_55()
	-- upvalues: (copy) v_u_8, (ref) v_u_51, (copy) v_u_30
	local v52 = workspace:GetServerTimeNow()
	local v53 = v_u_8:GetData()
	if v53.EventShopStock[v_u_51] then
		local v54 = v53.EventShopStock[v_u_51].ForcedEventShopEndTimestamp and (v53.EventShopStock[v_u_51].ForcedEventShopEndTimestamp - v52 or -1) or -1
		if v54 >= 0 then
			return v54
		else
			return v_u_30.GetShopResetTime() - v52 % v_u_30.GetShopResetTime()
		end
	else
		return 999999999
	end
end
local v_u_56 = game.SoundService.Click
local v_u_57 = game.SoundService.Restock_SFX
local function v_u_59()
	-- upvalues: (copy) v_u_14, (copy) v_u_39, (ref) v_u_34, (copy) v_u_55, (copy) v_u_17, (copy) v_u_24, (copy) v_u_57
	if v_u_14:IsHiddenFromUpdate("Event Shop Timer") or v_u_14:IsHiddenAfterUpdate("Event Shop Timer") then
		v_u_39.Visible = false
		v_u_34 = false
		return
	end
	v_u_39.Visible = true
	if v_u_34 then
		return
	end
	v_u_34 = true
	while true do
		local v58 = v_u_55()
		v_u_39.Text = v58 <= 0 and "Restocking" or "Restocks in " .. v_u_17.compactFormat(v58)
		if v58 <= 1 and not v_u_24:IsInWorld() then
			v_u_57.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_57.TimePosition = 0
			v_u_57.Playing = true
			require(game.ReplicatedStorage.Modules.Notification):CreateNotification("<font color=\"#FFB6C1\"><b>Your Event Shop stock has restocked!</b></font>")
		end
		task.wait(1)
	end
end
local function v_u_62(p60)
	p60.Rarity_BG.UIGradient.Enabled = false
	p60.Rarity_BG.ImageColor3 = Color3.new(1, 1, 1)
	p60.Rarity_BG.TranscendantSparkles.Visible = false
	local v61 = p60.Rarity_Text
	if v61.UIStroke then
		v61.UIStroke.Color = Color3.new(0, 0, 0)
	end
end
local function v_u_92(p_u_63, p64)
	-- upvalues: (copy) v_u_62, (copy) v_u_2, (copy) v_u_37, (copy) v_u_49
	if p64 then
		local v65 = p64[1]
		local v66 = p64[2]
		local v67 = p64[3]
		v_u_62(p_u_63)
		p_u_63.Rarity_Text.Text = v65
		if v67 and v65 == "Prismatic" then
			local v_u_68 = nil
			v_u_68 = v_u_2.Heartbeat:Connect(function()
				-- upvalues: (ref) v_u_37, (copy) p_u_63, (ref) v_u_68
				if v_u_37.Enabled then
					if p_u_63 and p_u_63.Parent then
						local v69 = os.clock() * 0.1 % 1
						local v70 = Color3.fromHSV(v69, 1, 1)
						p_u_63.Rarity_BG.ImageColor3 = v70
						if p_u_63.Rarity_Text.UIStroke then
							local v71 = p_u_63.Rarity_Text.UIStroke
							local v72, v73, v74 = v70:ToHSV()
							v71.Color = Color3.fromHSV(v72, v73, v74 / 2)
						end
					elseif v_u_68 then
						v_u_68:Disconnect()
					end
				else
					return
				end
			end)
			local v75 = v_u_49
			local v76 = v_u_68
			table.insert(v75, v76)
			return
		elseif v65 == "Transcendent" then
			p_u_63.Rarity_BG.TranscendantSparkles.Visible = true
			p_u_63.Rarity_BG.ImageColor3 = Color3.new(1, 1, 1)
			p_u_63.Rarity_BG.UIGradient.Enabled = true
			p_u_63.Rarity_BG.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 149, 1), Color3.fromRGB(255, 238, 5))
			if p_u_63.Rarity_Text.UIStroke then
				local v77 = p_u_63.Rarity_Text.UIStroke
				local v78, v79, v80 = v66:ToHSV()
				v77.Color = Color3.fromHSV(v78, v79, v80 / 2)
			end
			local v_u_81 = 1
			local v_u_82 = nil
			v_u_82 = v_u_2.Heartbeat:Connect(function(p83)
				-- upvalues: (ref) v_u_37, (copy) p_u_63, (ref) v_u_82, (ref) v_u_81
				if v_u_37.Enabled then
					if p_u_63 and p_u_63.Parent then
						for _, v84 in p_u_63.Rarity_BG.TranscendantSparkles:GetChildren() do
							v84.Rotation = v84.Rotation + p83 * 10
							local v85 = v84.Size.X.Offset + v_u_81 * 1
							if v85 >= 50 then
								v85 = 50
								v_u_81 = -1
							elseif v85 <= 0 then
								v85 = 0
								v_u_81 = 1
							end
							v84.Size = UDim2.new(0, v85, 0, v85)
						end
					elseif v_u_82 then
						v_u_82:Disconnect()
					end
				else
					return
				end
			end)
			local v86 = v_u_49
			local v87 = v_u_82
			table.insert(v86, v87)
		else
			p_u_63.Rarity_BG.ImageColor3 = v66
			if p_u_63.Rarity_Text.UIStroke then
				local v88 = p_u_63.Rarity_Text.UIStroke
				local v89, v90, v91 = v66:ToHSV()
				v88.Color = Color3.fromHSV(v89, v90, v91 / 2)
			end
		end
	else
		return
	end
end
local function v_u_161()
	-- upvalues: (copy) v_u_59, (copy) v_u_49, (copy) v_u_48, (copy) v_u_32, (ref) v_u_51, (copy) v_u_4, (copy) v_u_22, (copy) v_u_3, (copy) v_u_14, (copy) v_u_46, (copy) v_u_42, (copy) v_u_16, (copy) v_u_92, (copy) v_u_6, (copy) v_u_17, (copy) v_u_23, (copy) v_u_38, (copy) v_u_43, (copy) v_u_33, (copy) v_u_27, (copy) v_u_28, (copy) v_u_11, (copy) v_u_56, (copy) v_u_12, (copy) v_u_10, (copy) v_u_18, (copy) v_u_37, (copy) v_u_19, (copy) v_u_20, (copy) v_u_29, (ref) v_u_35, (copy) v_u_36, (copy) v_u_21, (copy) v_u_15, (copy) v_u_8, (copy) v_u_31, (copy) v_u_30, (copy) v_u_1
	task.spawn(v_u_59)
	for _, v93 in ipairs(v_u_49) do
		if v93.Connected then
			v93:Disconnect()
		end
	end
	table.clear(v_u_49)
	for _, v94 in v_u_48 do
		if v94:IsA("Frame") then
			v94:Destroy()
		end
	end
	table.clear(v_u_48)
	local v95 = v_u_32[v_u_51]
	if v95 then
		if not v_u_4.TouchEnabled then
			local v_u_96 = {}
			for v97, v98 in v95 do
				if v98.DisplayInShop and v98.ItemType == "Seed" then
					local v99 = Instance.new("ImageLabel")
					v99.Image = v_u_22(v97, "Holdable")
					table.insert(v_u_96, v99)
				end
			end
			task.spawn(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_96
				v_u_3:PreloadAsync(v_u_96)
			end)
		end
		local v_u_100 = {}
		for v_u_101, v_u_102 in v95 do
			if v_u_102.DisplayInShop and (not v_u_14:IsHiddenFromUpdate(v_u_102.SeedName) and (not v_u_14:IsHiddenAfterUpdate(v_u_102.SeedName) and (not v_u_46.CurrentCategory or v_u_46.CurrentCategory == v_u_46.DefaultCategory))) then
				local v_u_103 = v_u_42:Clone()
				v_u_48[v_u_101] = v_u_103
				v_u_103.Name = v_u_101
				v_u_103.LayoutOrder = v_u_102.LayoutOrder * 10
				table.insert(v_u_100, v_u_103)
				local v_u_104 = v_u_103.Main_Frame
				local v105 = v_u_16.Return_Rarity_Data(v_u_102.SeedRarity)
				if v105 then
					v_u_92(v_u_104, v105)
				end
				v_u_104.Seed_Text.Text = v_u_102.SeedName
				v_u_104.Seed_Text_Shadow.Text = v_u_102.SeedName
				local v106 = v_u_6:GetAttribute("NewYearsEggPriceMultiplier")
				local v107 = v106 == "Multiplier_X0.1" and 0.1 or (v106 == "Multiplier_X10" and 10 or 1)
				local v_u_108
				if v_u_102.SpecialCurrencyType then
					v_u_108 = v_u_17.FormatCompactPrice(v_u_102.Price * v107) .. ""
				else
					v_u_108 = v_u_17.DisplaySheckles(v_u_102.Price * v107)
				end
				v_u_104.Description_Text.Text = v_u_23(v_u_102.SeedName, v_u_102.ItemType) or v_u_102.Description
				if v_u_104.Description_Text.Text == "" then
					v_u_104.InfoButton.Visible = false
					v_u_104.Seed_Text.Size = UDim2.fromScale(0.652, v_u_104.Seed_Text.Size.Y.Scale)
					v_u_104.Seed_Text_Shadow.Size = UDim2.fromScale(0.652, v_u_104.Seed_Text_Shadow.Size.Y.Scale)
				else
					v_u_104.Seed_Text.Size = UDim2.fromScale(0.57, v_u_104.Seed_Text.Size.Y.Scale)
					v_u_104.Seed_Text_Shadow.Size = UDim2.fromScale(0.57, v_u_104.Seed_Text_Shadow.Size.Y.Scale)
					v_u_104.Seed_Text.AnchorPoint = Vector2.new(0, 0.5)
					v_u_104.Seed_Text_Shadow.AnchorPoint = Vector2.new(0, 0.5)
					v_u_104.Seed_Text.Position = UDim2.fromScale(0.32, v_u_104.Seed_Text.Position.Y.Scale)
					v_u_104.Seed_Text_Shadow.Position = UDim2.fromScale(0.32, v_u_104.Seed_Text_Shadow.Position.Y.Scale)
					v_u_104.LargeDescriptionText.Text = v_u_23(v_u_102.SeedName, v_u_102.ItemType) or v_u_102.Description
					v_u_104.InfoButton.Visible = true
				end
				v_u_104.LargeDescriptionText.Visible = false
				local v_u_109 = false
				local function v110()
					-- upvalues: (ref) v_u_109, (copy) v_u_104
					v_u_109 = not v_u_109
					v_u_104.LargeDescriptionText.Visible = v_u_109
					v_u_104.Rarity_BG.Visible = not v_u_109
					v_u_104.Rarity_Text.Visible = not v_u_109
					v_u_104.Stock_Text.Visible = not v_u_109
					v_u_104.Cost_Text.Visible = not v_u_109
				end
				v_u_104.InfoButton.Activated:Connect(v110)
				if v_u_104.Cost_Text:FindFirstChild("TEXT") then
					v_u_104.Cost_Text.TEXT.Text = v_u_108
				else
					v_u_104.Cost_Text.Text = v_u_108
				end
				local v111 = v_u_104:FindFirstChild("ShopItem_Image", true)
				v111.Visible = true
				v111.Image = v_u_22(v_u_101, v_u_102.ItemType)
				v_u_103.Parent = v_u_38
				local v_u_112 = v_u_43:Clone()
				v_u_112.LayoutOrder = v_u_102.LayoutOrder * 10 + 1
				v_u_112.Name = ("%*_Padding"):format(v_u_101)
				v_u_112.Parent = v_u_38
				v_u_48[v_u_112.Name] = v_u_112
				local v_u_113 = v_u_103.Frame
				if v_u_113.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
					v_u_113.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_108
				else
					v_u_113.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_108
				end
				local function v114()
					-- upvalues: (ref) v_u_33, (copy) v_u_101, (ref) v_u_51
					v_u_33:FireServer(v_u_101, v_u_51)
				end
				local v_u_115 = false
				local v_u_116 = 0
				v_u_27(v_u_113.Sheckles_Buy, function(p117, p118)
					-- upvalues: (ref) v_u_116, (ref) v_u_115, (copy) v_u_113, (ref) v_u_28, (ref) v_u_33, (copy) v_u_101, (ref) v_u_51
					if workspace:GetAttribute("InTutorial") then
						return
					elseif p118 then
						v_u_116 = 0
						if v_u_115 then
							v_u_115 = false
							if v_u_113:FindFirstChild("Sheckles_Buy") then
								v_u_28.target(v_u_113.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(1, 1, 1)
								})
							end
						end
						return
					else
						if not v_u_115 then
							v_u_115 = true
							if v_u_113:FindFirstChild("Sheckles_Buy") then
								v_u_28.target(v_u_113.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
								})
							end
						end
						if os.clock() >= v_u_116 then
							local v119 = p117 * -0.3
							local v120 = ((1 - math.exp(v119)) * 24 + 8) // 1
							local v121 = math.max(v120, 1)
							v_u_116 = os.clock() + 0.125
							for _ = 1, v121 do
								v_u_33:FireServer(v_u_101, v_u_51)
							end
						end
					end
				end, {
					["minimumHoldTime"] = 1,
					["interval"] = 0.125
				})
				v_u_113.Sheckles_Buy.Activated:Connect(v114)
				v_u_113.Robux_Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_11, (copy) v_u_102
					v_u_11:PromptPurchase(v_u_102.PurchaseID, Enum.InfoType.Product)
				end)
				v_u_113.Gift.Visible = v_u_102.GiftPurchaseID ~= nil
				if v_u_102.GiftPurchaseID then
					v_u_113.Gift.Activated:Connect(function()
						-- upvalues: (ref) v_u_56, (ref) v_u_12, (copy) v_u_102
						v_u_56.PlaybackSpeed = 1 + math.random(-15, 15) / 100
						v_u_56.TimePosition = 0
						v_u_56.Playing = true
						v_u_12:PromptGiftFromGiftId(v_u_102.GiftPurchaseID)
					end)
				end
				if v_u_102.ItemType == "Seed" then
					local v_u_122 = nil
					local v_u_123 = nil
					v_u_104.MouseEnter:Connect(function()
						-- upvalues: (ref) v_u_122, (ref) v_u_10, (copy) v_u_103, (ref) v_u_123, (ref) v_u_22, (copy) v_u_101
						v_u_122 = v_u_10(v_u_103.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
							["Rotation"] = v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
						})
						v_u_123 = v_u_10(v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1.5
						})
						v_u_123.Completed:Connect(function(p124)
							-- upvalues: (ref) v_u_103, (ref) v_u_22, (ref) v_u_101
							if p124 == Enum.PlaybackState.Completed then
								if not v_u_103:IsDescendantOf(game) then
									return
								end
								v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_22(v_u_101, "Holdable")
							end
						end)
					end)
					v_u_104.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_122, (copy) v_u_103, (ref) v_u_22, (copy) v_u_101, (copy) v_u_102, (ref) v_u_10
						if v_u_122 then
							v_u_122:Cancel()
						end
						v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
						v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_22(v_u_101, v_u_102.ItemType)
						v_u_10(v_u_103.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1
						})
					end)
				end
				if v_u_102.ItemType == "Seed Pack" and v_u_102.ShowOdds then
					v_u_104.OddsButton.Visible = true
					v_u_104.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_18, (copy) v_u_102, (ref) v_u_37
						v_u_18:Open(v_u_102.SeedName, v_u_37)
					end)
				elseif v_u_102.ItemType == "Egg" and v_u_102.ShowOdds then
					v_u_104.OddsButton.Visible = true
					v_u_104.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_19, (copy) v_u_102, (ref) v_u_37
						v_u_19:Open(v_u_102.SeedName, v_u_37)
					end)
				elseif v_u_102.ItemType == "Crate" and v_u_102.ShowOdds then
					v_u_104.OddsButton.Visible = true
					v_u_104.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_20, (copy) v_u_102, (ref) v_u_37
						v_u_20:Open(v_u_102.SeedName, v_u_37)
					end)
				else
					v_u_104.OddsButton.Visible = false
				end
				if v_u_102.SpecialCurrencyType and v_u_29[v_u_102.SpecialCurrencyType] then
					v_u_104.Cost_Text.CurrencyImage.Image = v_u_29[v_u_102.SpecialCurrencyType].Icon
					v_u_113.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_29[v_u_102.SpecialCurrencyType].Icon
				else
					v_u_104.Cost_Text.CurrencyImage.Visible = false
					v_u_113.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
				end
				local function v125()
					-- upvalues: (ref) v_u_35, (copy) v_u_101, (copy) v_u_113, (ref) v_u_10, (copy) v_u_112
					if v_u_35 == v_u_101 then
						v_u_113.Visible = true
						v_u_10(v_u_113, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 1.3)
						})
						v_u_10(v_u_112, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.25)
						})
					else
						task.delay(0.25, function()
							-- upvalues: (ref) v_u_113
							if v_u_113.Position == UDim2.fromScale(0.5, 0.5) then
								v_u_113.Visible = false
							end
						end)
						v_u_10(v_u_113, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 0.5)
						})
						v_u_10(v_u_112, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.02)
						})
					end
				end
				v_u_36:Connect(v125)
				task.spawn(v125)
				local v_u_126 = false
				v_u_104.Activated:Connect(function()
					-- upvalues: (ref) v_u_10, (ref) v_u_38, (copy) v_u_103, (copy) v_u_100, (ref) v_u_35, (copy) v_u_101, (ref) v_u_36, (ref) v_u_126, (ref) v_u_21, (copy) v_u_102, (copy) v_u_113, (ref) v_u_11, (ref) v_u_15
					v_u_10(v_u_38, TweenInfo.new(0.35), {
						["CanvasPosition"] = Vector2.new(0, v_u_103.AbsoluteSize.Y * (table.find(v_u_100, v_u_103) - 1))
					})
					local v127
					if v_u_35 == v_u_101 then
						v127 = nil
					else
						v127 = v_u_101
					end
					v_u_35 = v127
					v_u_36:Fire()
					if not v_u_126 then
						if v_u_21 or v_u_102.FallbackPrice == nil then
							if not v_u_21 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_113:GetFullName()))))
							end
							v_u_11:SetPriceLabel(v_u_113.Robux_Buy.Price, v_u_102.PurchaseID, ":robux::value:")
						else
							v_u_113.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_15.Comma(v_u_102.FallbackPrice)))
						end
						v_u_126 = true
					end
				end)
				if v_u_35 == v_u_101 then
					task.spawn(function()
						-- upvalues: (ref) v_u_21, (copy) v_u_102, (copy) v_u_113, (ref) v_u_11, (ref) v_u_15, (ref) v_u_126
						if v_u_21 or v_u_102.FallbackPrice == nil then
							if not v_u_21 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_113:GetFullName()))))
							end
							v_u_11:SetPriceLabel(v_u_113.Robux_Buy.Price, v_u_102.PurchaseID, ":robux::value:")
						else
							v_u_113.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_15.Comma(v_u_102.FallbackPrice)))
						end
						v_u_126 = true
					end)
				end
				local v_u_128 = true
				local v_u_129 = Instance.new("NumberValue")
				v_u_129.Value = 0
				v_u_129.Parent = v_u_113
				local v131 = v_u_129.Changed:Connect(function(p130)
					-- upvalues: (copy) v_u_104
					if v_u_104.Stock_Text then
						v_u_104.Stock_Text.Text = ("X%* Stock"):format(p130 // 1)
					end
				end)
				local v132 = v_u_49
				table.insert(v132, v131)
				local function v_u_144()
					-- upvalues: (ref) v_u_8, (ref) v_u_51, (copy) v_u_101, (ref) v_u_31, (copy) v_u_102, (ref) v_u_128, (ref) v_u_115, (copy) v_u_129, (ref) v_u_28, (copy) v_u_104, (ref) v_u_30, (ref) v_u_1, (copy) v_u_113, (ref) v_u_108
					local v133 = v_u_8:GetData()
					local v134
					if v133 then
						v134 = v133.EventShopStock[v_u_51].Stocks[v_u_101]
					else
						v134 = v133
					end
					local v135 = v134 and v134.Stock or 0
					local v136 = not v_u_31:HasRequiredNPCLevels(v_u_102.LevelLocks)
					if v136 then
						v_u_28.stop(v_u_129)
						v_u_104.Stock_Text.Text = ""
					elseif v_u_128 or not v_u_115 then
						v_u_128 = false
						v_u_129.Value = v135
					else
						v_u_28.target(v_u_129, 1, 1.5, {
							["Value"] = v135
						})
					end
					local v137 = v133.UnlockedEventShopItems
					local v138
					if v_u_30.SHOP_LOCK_TYPE == "EVENT" then
						local _ = v_u_1.Data.ReplicatedGlobalStock.GiftsGiven
						v138 = false
					else
						v138 = not table.find(v137, v_u_101)
						if v138 then
							v138 = v_u_102.LockedInShop
						end
					end
					if v138 then
						v_u_104.LockedFrame.Visible = true
						v_u_104.LockedFrame.UnlockInfo.Text = v_u_102.UnlockText
					elseif v136 and v_u_102.LevelLocks then
						local v139 = next(v_u_102.LevelLocks)
						local v140 = v139 and v_u_102.LevelLocks[v139] or 1
						v_u_104.LockedFrame.Visible = true
						v_u_104.LockedFrame.UnlockInfo.Text = ("NPC Friend Level Needed: lvl%*"):format(v140)
					else
						v_u_104.LockedFrame.Visible = false
					end
					v_u_113.Sheckles_Buy.In_Stock.Visible = v135 > 0
					v_u_113.Sheckles_Buy.No_Stock.Visible = v135 <= 0
					v_u_113.Sheckles_Buy.HoverImage = v135 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
					v_u_113.Sheckles_Buy.Image = v135 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
					v_u_113.Sheckles_Buy.Visible = not v136
					local v141 = v_u_104.Cost_Text:FindFirstChild("TEXT") or v_u_104.Cost_Text
					if v136 and v_u_102.LevelLocks then
						local v142 = next(v_u_102.LevelLocks)
						v141.Text = ("LOCKED: lvl%*+"):format(v142 and v_u_102.LevelLocks[v142] or 1)
						v141.TextColor3 = Color3.fromRGB(255, 0, 0)
					else
						v141.Text = v135 <= 0 and "NO STOCK" or v_u_108
						local v143
						if v135 <= 0 then
							v143 = Color3.fromRGB(255, 0, 0)
						else
							v143 = Color3.fromRGB(0, 255, 0)
						end
						v141.TextColor3 = v143
					end
					if v_u_104.Cost_Text:FindFirstChild("CurrencyImage") and v_u_102.SpecialCurrencyType then
						v_u_104.Cost_Text.CurrencyImage.Visible = v135 > 0
					end
				end
				task.spawn(v_u_144)
				task.spawn(function()
					-- upvalues: (ref) v_u_8, (copy) v_u_144, (ref) v_u_49
					local v145 = v_u_8:GetPathSignal("EventShopStock/@")
					if v145 then
						local v146 = v145:Connect(v_u_144)
						local v147 = v_u_49
						table.insert(v147, v146)
					end
					local v148 = v_u_8:GetPathSignal("EventShopStock")
					if v148 then
						local v149 = v148:Connect(v_u_144)
						local v150 = v_u_49
						table.insert(v150, v149)
					end
					local v151 = v_u_8:GetPathSignal("UnlockedEventShopItems")
					if v151 then
						local v152 = v151:Connect(v_u_144)
						local v153 = v_u_49
						table.insert(v153, v152)
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_8, (ref) v_u_144, (ref) v_u_49
						local v154 = v_u_8:GetPathSignal("NPCPoints/@")
						if v154 then
							local v155 = v154:Connect(v_u_144)
							local v156 = v_u_49
							table.insert(v156, v155)
						end
					end)
				end)
			end
		end
		table.sort(v_u_100, function(p157, p158)
			local v159 = p157.LayoutOrder
			local v160 = p158.LayoutOrder
			if v159 == v160 then
				return p157.Name < p158.Name
			else
				return v159 < v160
			end
		end)
	end
end
local function v_u_167()
	-- upvalues: (copy) v_u_14, (copy) v_u_37, (copy) v_u_8, (ref) v_u_51, (copy) v_u_30, (copy) v_u_17
	if v_u_14:IsHiddenAfterUpdate("Event Shop Restock") or v_u_14:IsHiddenFromUpdate("Event Shop Restock") then
		v_u_37.Frame.Frame.RestockButton.Visible = true
		v_u_37.Frame.Frame.RestockInfo.Visible = true
		return
	else
		v_u_37.Frame.Frame.RestockButton.Visible = true
		v_u_37.Frame.Frame.RestockInfo.Visible = false
		local v162 = v_u_8:GetData()
		if v162 then
			if not v162.EventShopStock[v_u_51] then
				task.wait(2)
			end
			if v162.EventShopStock[v_u_51] then
				local v163 = v_u_37.Frame.Frame.RestockButton.TextLabel
				if v_u_30.RESTOCK_CURRENCY == "ROBUX" then
					v163.Text = "RESTOCK"
					return
				else
					local v164 = v_u_30.BASE_RESTOCK_COST
					local v165 = v162.EventShopStock[v_u_51].RestockCost
					local v166 = math.max(v164, v165)
					if v_u_30.RESTOCK_CURRENCY == "Sheckles" then
						v163.Text = ("RESTOCK: %*\194\162"):format((v_u_17.FormatCompactPrice(v166)))
					else
						v163.Text = ("RESTOCK: %*"):format((v_u_17.FormatCompactPrice(v166)))
					end
				end
			else
				v_u_37.Frame.Frame.RestockButton.Visible = false
				v_u_37.Frame.Frame.RestockInfo.Visible = false
				return
			end
		else
			return
		end
	end
end
local v168 = v_u_8:GetPathSignal("EventShopStock")
if v168 then
	v168:Connect(function()
		-- upvalues: (copy) v_u_167
		v_u_167()
	end)
end
local function v_u_171()
	-- upvalues: (copy) v_u_47, (copy) v_u_26, (copy) v_u_30, (copy) v_u_46
	for _, v169 in v_u_47 do
		local v170 = v_u_26:IsTabUnlocked(v_u_30.SHOP_TYPE, v169.Name)
		if v169.IsLocked and v170 then
			v_u_46.UnlockTab(v169.Name)
		end
	end
end
local function v172(_)
	-- upvalues: (copy) v_u_161, (ref) v_u_35, (copy) v_u_36
	v_u_161()
	v_u_35 = nil
	v_u_36:Fire()
end
v_u_46.OnCategoryChanged:Connect(v172)
function v_u_50.Recreate(_, p173)
	-- upvalues: (ref) v_u_51, (copy) v_u_161, (copy) v_u_167, (copy) v_u_50
	v_u_51 = p173
	v_u_161()
	v_u_167()
	v_u_50:SetTitle(p173)
end
function v_u_50.SetTitle(_, p174)
	-- upvalues: (copy) v_u_40, (copy) v_u_41, (copy) v_u_38
	v_u_40.Text = p174
	v_u_41.Text = p174
	v_u_38.CanvasPosition = Vector2.new(0, 0)
end
function v_u_50.Start(_)
	-- upvalues: (copy) v_u_13, (copy) v_u_37, (copy) v_u_11, (copy) v_u_167, (copy) v_u_59, (copy) v_u_161, (copy) v_u_8, (copy) v_u_171
	v_u_13:UsePopupAnims(v_u_37)
	v_u_37.Frame.Frame.CloseButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_13, (ref) v_u_37
		v_u_13:Close(v_u_37)
	end)
	v_u_37.Frame.Frame.RestockButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_167
		v_u_11:PromptPurchase(3471912100, Enum.InfoType.Product)
		task.spawn(function()
			-- upvalues: (ref) v_u_167
			task.wait(0.5)
			v_u_167()
		end)
	end)
	v_u_167()
	task.spawn(v_u_59)
	v_u_161()
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_171
		local v175 = v_u_8:GetPathSignal("ShopTabData/@")
		if v175 then
			v175:Connect(v_u_171)
		end
	end)
end
local v_u_176 = game.SoundService.Christmas_Bell_Shop_SFX
function v_u_50.Open(_, p177)
	-- upvalues: (copy) v_u_176, (copy) v_u_50, (copy) v_u_13, (copy) v_u_37
	v_u_176.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_176.TimePosition = 0
	v_u_176.Playing = true
	v_u_50:Recreate(p177)
	v_u_13:Open(v_u_37)
end
function v_u_50.GetCurrentIndex(_)
	-- upvalues: (ref) v_u_51
	return v_u_51
end
task.spawn(v_u_50.Start, v_u_50)
v_u_14.OnUpdated:Connect(function()
	-- upvalues: (copy) v_u_59, (copy) v_u_161
	task.spawn(v_u_59)
	v_u_161()
end)
return v_u_50