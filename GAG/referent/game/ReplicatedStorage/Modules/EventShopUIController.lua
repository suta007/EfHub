local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local v_u_2 = game:GetService("ContentProvider")
local v_u_3 = game:GetService("UserInputService")
local v4 = v_u_1:WaitForChild("GameEvents")
local v_u_5 = game.Players.LocalPlayer
local v6 = v_u_5.PlayerGui
local v_u_7 = require(v_u_1.Modules.DataService)
local v8 = require(v_u_1.Modules.Signal)
local v_u_9 = require(v_u_1.Modules.FastTween)
require(v_u_1.Modules.DumpTable)
local v_u_10 = require(v_u_1.Modules.MarketController)
local v_u_11 = require(v_u_1.Modules.GiftController)
local v_u_12 = require(v_u_1.Modules.GuiController)
local v_u_13 = require(v_u_1.Modules.UpdateService)
local v_u_14 = require(v_u_1.Comma_Module)
local v_u_15 = require(v_u_1.Item_Module)
local v_u_16 = require(v_u_1.Modules.NumberUtil)
local v_u_17 = require(v_u_1.Modules.SeedPackOddsController)
local v_u_18 = require(v_u_1.Modules.PetEggOddsController)
local v_u_19 = require(v_u_1.Modules.CosmeticCrateOddsController)
local v_u_20 = require(v_u_1.Modules.UseDynamicPrices)
local v_u_21 = require(v_u_1.Modules.ItemImageFinder)
local v_u_22 = require(v_u_1.Modules.ItemDescriptionFinder)
local v_u_23 = require(v_u_1.Modules.TradeControllers.TradeWorldController)
local v24 = require(v_u_1.Modules.UITabHelperModule)
local v_u_25 = require(v_u_1.Modules.ShopTabHandler)
local v_u_26 = require(v_u_1.Modules.WatchButtonHold)
local v_u_27 = require(v_u_1.Code.Spr)
local v_u_28 = require(v_u_1.Data.CurrencyData)
local _ = require(v_u_1.Data.CosmeticRegistry).CosmeticList
local v_u_29 = require(v_u_1.Data.EventShopConfigData)
local v_u_30 = require(v_u_1.Modules.NPCLevelHandler)
local v_u_31 = require(v_u_1.Data.EventShopData)
local v_u_32 = v4.BuyEventShopStock
local _ = v4.BuyEventShopRestock
local v_u_33 = false
local v_u_34 = nil
local v_u_35 = v8.new()
local v_u_36 = v6:WaitForChild("EventShop_UI")
local v_u_37 = v_u_36:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
local v_u_38 = v_u_36:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("RestocksIn"):WaitForChild("Timer")
local v_u_39 = v_u_36:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("EventShopTitle")
local v_u_40 = v_u_36:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("EventShopTitle"):WaitForChild("EventShopTitle")
local v_u_41 = v_u_37:WaitForChild("ItemFrame")
v_u_41.Parent = script
local v_u_42 = v_u_37:WaitForChild("ItemPadding")
v_u_42.Parent = v_u_37
local v43 = v_u_36:WaitForChild("TabAnchor"):WaitForChild("TabList")
local v44 = v_u_1.UITemplates:WaitForChild("TabButtonTemplate")
local v_u_45 = v24.CreateOrGetTabHandler("EventShop", v43, v44)
local v_u_46 = {
	{
		["Name"] = "Main",
		["IsLocked"] = false
	},
	{
		["Name"] = "Friendship",
		["IsLocked"] = true
	}
}
local v_u_47 = {}
local v_u_48 = {}
local v_u_49 = {}
local v_u_50 = ""
local function v_u_54()
	-- upvalues: (copy) v_u_7, (ref) v_u_50, (copy) v_u_29
	local v51 = workspace:GetServerTimeNow()
	local v52 = v_u_7:GetData()
	if v52.EventShopStock[v_u_50] then
		local v53 = v52.EventShopStock[v_u_50].ForcedEventShopEndTimestamp and (v52.EventShopStock[v_u_50].ForcedEventShopEndTimestamp - v51 or -1) or -1
		if v53 >= 0 then
			return v53
		else
			return v_u_29.GetShopResetTime() - v51 % v_u_29.GetShopResetTime()
		end
	else
		return 999999999
	end
end
local v_u_55 = game.SoundService.Click
local function v_u_57()
	-- upvalues: (copy) v_u_13, (copy) v_u_38, (ref) v_u_33, (copy) v_u_54, (copy) v_u_16, (copy) v_u_23
	if v_u_13:IsHiddenFromUpdate("Event Shop Timer") or v_u_13:IsHiddenAfterUpdate("Event Shop Timer") then
		v_u_38.Visible = false
		v_u_33 = false
		return
	end
	v_u_38.Visible = true
	if v_u_33 then
		return
	end
	v_u_33 = true
	while true do
		local v56 = v_u_54()
		v_u_38.Text = v56 <= 0 and "Restocking" or "Restocks in " .. v_u_16.compactFormat(v56)
		if v56 <= 1 and (not v_u_23:IsInWorld() and workspace:GetServerTimeNow() < v_u_13:GetUpdateTime()) then
			require(game.ReplicatedStorage.Modules.Notification):CreateNotification("<font color=\"#FFB6C1\"><b>Your Event Shop stock has restocked!</b></font>")
		end
		task.wait(1)
	end
end
local function v_u_135()
	-- upvalues: (copy) v_u_57, (copy) v_u_48, (copy) v_u_47, (copy) v_u_31, (ref) v_u_50, (copy) v_u_3, (copy) v_u_21, (copy) v_u_2, (copy) v_u_13, (copy) v_u_45, (copy) v_u_41, (copy) v_u_15, (copy) v_u_36, (copy) v_u_5, (copy) v_u_16, (copy) v_u_22, (copy) v_u_37, (copy) v_u_42, (copy) v_u_32, (copy) v_u_26, (copy) v_u_27, (copy) v_u_10, (copy) v_u_55, (copy) v_u_11, (copy) v_u_9, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_28, (ref) v_u_34, (copy) v_u_35, (copy) v_u_20, (copy) v_u_14, (copy) v_u_7, (copy) v_u_30, (copy) v_u_29, (copy) v_u_1
	task.spawn(v_u_57)
	for _, v58 in ipairs(v_u_48) do
		if v58.Connected then
			v58:Disconnect()
		end
	end
	table.clear(v_u_48)
	for _, v59 in v_u_47 do
		if v59:IsA("Frame") then
			v59:Destroy()
		end
	end
	table.clear(v_u_47)
	local v60 = v_u_31[v_u_50]
	if v60 then
		if not v_u_3.TouchEnabled then
			local v_u_61 = {}
			for v62, v63 in v60 do
				if v63.DisplayInShop and v63.ItemType == "Seed" then
					local v64 = Instance.new("ImageLabel")
					v64.Image = v_u_21(v62, "Holdable")
					table.insert(v_u_61, v64)
				end
			end
			task.spawn(function()
				-- upvalues: (ref) v_u_2, (copy) v_u_61
				v_u_2:PreloadAsync(v_u_61)
			end)
		end
		local v_u_65 = {}
		for v_u_66, v_u_67 in v60 do
			if v_u_67.DisplayInShop and (not v_u_13:IsHiddenFromUpdate(v_u_67.SeedName) and (not v_u_13:IsHiddenAfterUpdate(v_u_67.SeedName) and (not v_u_45.CurrentCategory or v_u_45.CurrentCategory == v_u_45.DefaultCategory))) then
				local v_u_68 = v_u_41:Clone()
				v_u_47[v_u_66] = v_u_68
				v_u_68.Name = v_u_66
				v_u_68.LayoutOrder = v_u_67.LayoutOrder * 10
				table.insert(v_u_65, v_u_68)
				local v_u_69 = v_u_68.Main_Frame
				local v70 = v_u_15.Return_Rarity_Data(v_u_67.SeedRarity)
				if v70 then
					v_u_69.Rarity_Text.Text = v70[1]
					local v71 = v_u_69.Rarity_Text.UIStroke
					local v72, v73, v74 = v70[2]:ToHSV()
					v71.Color = Color3.fromHSV(v72, v73, v74 / 2)
					v_u_69.Rarity_BG.ImageColor3 = v70[2]
					if v70[1] == "Transcendent" then
						v_u_69.Rarity_BG.TranscendantSparkles.Visible = true
						local v_u_75 = nil
						local v_u_76 = 1
						v_u_75 = game:GetService("RunService").Heartbeat:Connect(function(p77)
							-- upvalues: (ref) v_u_36, (copy) v_u_69, (ref) v_u_75, (ref) v_u_76
							if v_u_36.Enabled then
								if v_u_69 and v_u_69.Parent then
									Random.new()
									for _, v78 in v_u_69.Rarity_BG.TranscendantSparkles:GetChildren() do
										v78.Rotation = v78.Rotation + 10 * p77
										local v79 = v78.Size.X.Offset + v_u_76 * 1
										if v79 >= 50 then
											v79 = 50
											v_u_76 = -1
										elseif v79 <= 0 then
											v79 = 0
											v_u_76 = 1
										end
										v78.Size = UDim2.new(0, v79, 0, v79)
									end
								else
									v_u_75:Disconnect()
								end
							else
								return
							end
						end)
						v_u_69.Rarity_BG.ImageColor3 = Color3.new(1, 1, 1)
						v_u_69.Rarity_BG.UIGradient.Enabled = true
						v_u_69.Rarity_BG.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 149, 1), Color3.fromRGB(255, 238, 5))
					end
				end
				v_u_69.Seed_Text.Text = v_u_67.SeedName
				v_u_69.Seed_Text_Shadow.Text = v_u_67.SeedName
				local v80 = v_u_5:GetAttribute("NewYearsEggPriceMultiplier")
				local v81 = v80 == "Multiplier_X0.1" and 0.1 or (v80 == "Multiplier_X10" and 10 or 1)
				local v_u_82
				if v_u_67.SpecialCurrencyType then
					v_u_82 = v_u_16.FormatCompactPrice(v_u_67.Price * v81) .. ""
				else
					v_u_82 = v_u_16.DisplaySheckles(v_u_67.Price * v81)
				end
				v_u_69.Description_Text.Text = v_u_22(v_u_67.SeedName, v_u_67.ItemType) or v_u_67.Description
				if v_u_69.Description_Text.Text == "" then
					v_u_69.InfoButton.Visible = false
					v_u_69.Seed_Text.Size = UDim2.fromScale(0.652, v_u_69.Seed_Text.Size.Y.Scale)
					v_u_69.Seed_Text_Shadow.Size = UDim2.fromScale(0.652, v_u_69.Seed_Text_Shadow.Size.Y.Scale)
				else
					v_u_69.Seed_Text.Size = UDim2.fromScale(0.57, v_u_69.Seed_Text.Size.Y.Scale)
					v_u_69.Seed_Text_Shadow.Size = UDim2.fromScale(0.57, v_u_69.Seed_Text_Shadow.Size.Y.Scale)
					v_u_69.Seed_Text.AnchorPoint = Vector2.new(0, 0.5)
					v_u_69.Seed_Text_Shadow.AnchorPoint = Vector2.new(0, 0.5)
					v_u_69.Seed_Text.Position = UDim2.fromScale(0.32, v_u_69.Seed_Text.Position.Y.Scale)
					v_u_69.Seed_Text_Shadow.Position = UDim2.fromScale(0.32, v_u_69.Seed_Text_Shadow.Position.Y.Scale)
					v_u_69.LargeDescriptionText.Text = v_u_22(v_u_67.SeedName, v_u_67.ItemType) or v_u_67.Description
					v_u_69.InfoButton.Visible = true
				end
				v_u_69.LargeDescriptionText.Visible = false
				local v_u_83 = false
				local function v84()
					-- upvalues: (ref) v_u_83, (copy) v_u_69
					v_u_83 = not v_u_83
					v_u_69.LargeDescriptionText.Visible = v_u_83
					v_u_69.Rarity_BG.Visible = not v_u_83
					v_u_69.Rarity_Text.Visible = not v_u_83
					v_u_69.Stock_Text.Visible = not v_u_83
					v_u_69.Cost_Text.Visible = not v_u_83
				end
				v_u_69.InfoButton.Activated:Connect(v84)
				if v_u_69.Cost_Text:FindFirstChild("TEXT") then
					v_u_69.Cost_Text.TEXT.Text = v_u_82
				else
					v_u_69.Cost_Text.Text = v_u_82
				end
				local v85 = v_u_69:FindFirstChild("ShopItem_Image", true)
				v85.Visible = true
				v85.Image = v_u_21(v_u_66, v_u_67.ItemType)
				v_u_68.Parent = v_u_37
				local v_u_86 = v_u_42:Clone()
				v_u_86.LayoutOrder = v_u_67.LayoutOrder * 10 + 1
				v_u_86.Name = ("%*_Padding"):format(v_u_66)
				v_u_86.Parent = v_u_37
				v_u_47[v_u_86.Name] = v_u_86
				local v_u_87 = v_u_68.Frame
				if v_u_87.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
					v_u_87.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_82
				else
					v_u_87.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_82
				end
				local function v88()
					-- upvalues: (ref) v_u_32, (copy) v_u_66, (ref) v_u_50
					v_u_32:FireServer(v_u_66, v_u_50)
				end
				local v_u_89 = false
				local v_u_90 = 0
				v_u_26(v_u_87.Sheckles_Buy, function(p91, p92)
					-- upvalues: (ref) v_u_90, (ref) v_u_89, (copy) v_u_87, (ref) v_u_27, (ref) v_u_32, (copy) v_u_66, (ref) v_u_50
					if workspace:GetAttribute("InTutorial") then
						return
					elseif p92 then
						v_u_90 = 0
						if v_u_89 then
							v_u_89 = false
							if v_u_87:FindFirstChild("Sheckles_Buy") then
								v_u_27.target(v_u_87.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(1, 1, 1)
								})
							end
						end
						return
					else
						if not v_u_89 then
							v_u_89 = true
							if v_u_87:FindFirstChild("Sheckles_Buy") then
								v_u_27.target(v_u_87.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
								})
							end
						end
						if os.clock() >= v_u_90 then
							local v93 = p91 * -0.3
							local v94 = ((1 - math.exp(v93)) * 24 + 8) // 1
							local v95 = math.max(v94, 1)
							v_u_90 = os.clock() + 0.125
							for _ = 1, v95 do
								v_u_32:FireServer(v_u_66, v_u_50)
							end
						end
					end
				end, {
					["minimumHoldTime"] = 1,
					["interval"] = 0.125
				})
				v_u_87.Sheckles_Buy.Activated:Connect(v88)
				v_u_87.Robux_Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_10, (copy) v_u_67
					v_u_10:PromptPurchase(v_u_67.PurchaseID, Enum.InfoType.Product)
				end)
				v_u_87.Gift.Visible = v_u_67.GiftPurchaseID ~= nil
				if v_u_67.GiftPurchaseID then
					v_u_87.Gift.Activated:Connect(function()
						-- upvalues: (ref) v_u_55, (ref) v_u_11, (copy) v_u_67
						v_u_55.PlaybackSpeed = 1 + math.random(-15, 15) / 100
						v_u_55.TimePosition = 0
						v_u_55.Playing = true
						v_u_11:PromptGiftFromGiftId(v_u_67.GiftPurchaseID)
					end)
				end
				if v_u_67.ItemType == "Seed" then
					local v_u_96 = nil
					local v_u_97 = nil
					v_u_69.MouseEnter:Connect(function()
						-- upvalues: (ref) v_u_96, (ref) v_u_9, (copy) v_u_68, (ref) v_u_97, (ref) v_u_21, (copy) v_u_66
						v_u_96 = v_u_9(v_u_68.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
							["Rotation"] = v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
						})
						v_u_97 = v_u_9(v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1.5
						})
						v_u_97.Completed:Connect(function(p98)
							-- upvalues: (ref) v_u_68, (ref) v_u_21, (ref) v_u_66
							if p98 == Enum.PlaybackState.Completed then
								if not v_u_68:IsDescendantOf(game) then
									return
								end
								v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_21(v_u_66, "Holdable")
							end
						end)
					end)
					v_u_69.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_96, (copy) v_u_68, (ref) v_u_21, (copy) v_u_66, (copy) v_u_67, (ref) v_u_9
						if v_u_96 then
							v_u_96:Cancel()
						end
						v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
						v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_21(v_u_66, v_u_67.ItemType)
						v_u_9(v_u_68.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1
						})
					end)
				end
				if v_u_67.ItemType == "Seed Pack" and v_u_67.ShowOdds then
					v_u_69.OddsButton.Visible = true
					v_u_69.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_17, (copy) v_u_67, (ref) v_u_36
						v_u_17:Open(v_u_67.SeedName, v_u_36)
					end)
				elseif v_u_67.ItemType == "Egg" and v_u_67.ShowOdds then
					v_u_69.OddsButton.Visible = true
					v_u_69.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_18, (copy) v_u_67, (ref) v_u_36
						v_u_18:Open(v_u_67.SeedName, v_u_36)
					end)
				elseif v_u_67.ItemType == "Crate" and v_u_67.ShowOdds then
					v_u_69.OddsButton.Visible = true
					v_u_69.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_19, (copy) v_u_67, (ref) v_u_36
						v_u_19:Open(v_u_67.SeedName, v_u_36)
					end)
				else
					v_u_69.OddsButton.Visible = false
				end
				if v_u_67.SpecialCurrencyType and v_u_28[v_u_67.SpecialCurrencyType] then
					v_u_69.Cost_Text.CurrencyImage.Image = v_u_28[v_u_67.SpecialCurrencyType].Icon
					v_u_87.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_28[v_u_67.SpecialCurrencyType].Icon
				else
					v_u_69.Cost_Text.CurrencyImage.Visible = false
					v_u_87.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
				end
				local function v99()
					-- upvalues: (ref) v_u_34, (copy) v_u_66, (copy) v_u_87, (ref) v_u_9, (copy) v_u_86
					if v_u_34 == v_u_66 then
						v_u_87.Visible = true
						v_u_9(v_u_87, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 1.3)
						})
						v_u_9(v_u_86, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.25)
						})
					else
						task.delay(0.25, function()
							-- upvalues: (ref) v_u_87
							if v_u_87.Position == UDim2.fromScale(0.5, 0.5) then
								v_u_87.Visible = false
							end
						end)
						v_u_9(v_u_87, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 0.5)
						})
						v_u_9(v_u_86, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.02)
						})
					end
				end
				v_u_35:Connect(v99)
				task.spawn(v99)
				local v_u_100 = false
				v_u_69.Activated:Connect(function()
					-- upvalues: (ref) v_u_9, (ref) v_u_37, (copy) v_u_68, (copy) v_u_65, (ref) v_u_34, (copy) v_u_66, (ref) v_u_35, (ref) v_u_100, (ref) v_u_20, (copy) v_u_67, (copy) v_u_87, (ref) v_u_10, (ref) v_u_14
					v_u_9(v_u_37, TweenInfo.new(0.35), {
						["CanvasPosition"] = Vector2.new(0, v_u_68.AbsoluteSize.Y * (table.find(v_u_65, v_u_68) - 1))
					})
					local v101
					if v_u_34 == v_u_66 then
						v101 = nil
					else
						v101 = v_u_66
					end
					v_u_34 = v101
					v_u_35:Fire()
					if not v_u_100 then
						if v_u_20 or v_u_67.FallbackPrice == nil then
							if not v_u_20 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_87:GetFullName()))))
							end
							v_u_10:SetPriceLabel(v_u_87.Robux_Buy.Price, v_u_67.PurchaseID, ":robux::value:")
						else
							v_u_87.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_14.Comma(v_u_67.FallbackPrice)))
						end
						v_u_100 = true
					end
				end)
				if v_u_34 == v_u_66 then
					task.spawn(function()
						-- upvalues: (ref) v_u_20, (copy) v_u_67, (copy) v_u_87, (ref) v_u_10, (ref) v_u_14, (ref) v_u_100
						if v_u_20 or v_u_67.FallbackPrice == nil then
							if not v_u_20 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_87:GetFullName()))))
							end
							v_u_10:SetPriceLabel(v_u_87.Robux_Buy.Price, v_u_67.PurchaseID, ":robux::value:")
						else
							v_u_87.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_14.Comma(v_u_67.FallbackPrice)))
						end
						v_u_100 = true
					end)
				end
				local v_u_102 = true
				local v_u_103 = Instance.new("NumberValue")
				v_u_103.Value = 0
				v_u_103.Parent = v_u_87
				local v105 = v_u_103.Changed:Connect(function(p104)
					-- upvalues: (copy) v_u_69
					if v_u_69.Stock_Text then
						v_u_69.Stock_Text.Text = ("X%* Stock"):format(p104 // 1)
					end
				end)
				local v106 = v_u_48
				table.insert(v106, v105)
				local function v_u_118()
					-- upvalues: (ref) v_u_7, (ref) v_u_50, (copy) v_u_66, (ref) v_u_30, (copy) v_u_67, (ref) v_u_102, (ref) v_u_89, (copy) v_u_103, (ref) v_u_27, (copy) v_u_69, (ref) v_u_29, (ref) v_u_1, (copy) v_u_87, (ref) v_u_82
					local v107 = v_u_7:GetData()
					local v108
					if v107 then
						v108 = v107.EventShopStock[v_u_50].Stocks[v_u_66]
					else
						v108 = v107
					end
					local v109 = v108 and v108.Stock or 0
					local v110 = not v_u_30:HasRequiredNPCLevels(v_u_67.LevelLocks)
					if v110 then
						v_u_27.stop(v_u_103)
						v_u_69.Stock_Text.Text = ""
					elseif v_u_102 or not v_u_89 then
						v_u_102 = false
						v_u_103.Value = v109
					else
						v_u_27.target(v_u_103, 1, 1.5, {
							["Value"] = v109
						})
					end
					local v111 = v107.UnlockedEventShopItems
					local v112
					if v_u_29.SHOP_LOCK_TYPE == "EVENT" then
						local _ = v_u_1.Data.ReplicatedGlobalStock.GiftsGiven
						v112 = false
					else
						v112 = not table.find(v111, v_u_66)
						if v112 then
							v112 = v_u_67.LockedInShop
						end
					end
					if v112 then
						v_u_69.LockedFrame.Visible = true
						v_u_69.LockedFrame.UnlockInfo.Text = v_u_67.UnlockText
					elseif v110 and v_u_67.LevelLocks then
						local v113 = next(v_u_67.LevelLocks)
						local v114 = v113 and v_u_67.LevelLocks[v113] or 1
						v_u_69.LockedFrame.Visible = true
						v_u_69.LockedFrame.UnlockInfo.Text = ("NPC Friend Level Needed: lvl%*"):format(v114)
					else
						v_u_69.LockedFrame.Visible = false
					end
					v_u_87.Sheckles_Buy.In_Stock.Visible = v109 > 0
					v_u_87.Sheckles_Buy.No_Stock.Visible = v109 <= 0
					v_u_87.Sheckles_Buy.HoverImage = v109 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
					v_u_87.Sheckles_Buy.Image = v109 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
					v_u_87.Sheckles_Buy.Visible = not v110
					local v115 = v_u_69.Cost_Text:FindFirstChild("TEXT") or v_u_69.Cost_Text
					if v110 and v_u_67.LevelLocks then
						local v116 = next(v_u_67.LevelLocks)
						v115.Text = ("LOCKED: lvl%*+"):format(v116 and v_u_67.LevelLocks[v116] or 1)
						v115.TextColor3 = Color3.fromRGB(255, 0, 0)
					else
						v115.Text = v109 <= 0 and "NO STOCK" or v_u_82
						local v117
						if v109 <= 0 then
							v117 = Color3.fromRGB(255, 0, 0)
						else
							v117 = Color3.fromRGB(0, 255, 0)
						end
						v115.TextColor3 = v117
					end
					if v_u_69.Cost_Text:FindFirstChild("CurrencyImage") and v_u_67.SpecialCurrencyType then
						v_u_69.Cost_Text.CurrencyImage.Visible = v109 > 0
					end
				end
				task.spawn(v_u_118)
				task.spawn(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_118, (ref) v_u_48
					local v119 = v_u_7:GetPathSignal("EventShopStock/@")
					if v119 then
						local v120 = v119:Connect(v_u_118)
						local v121 = v_u_48
						table.insert(v121, v120)
					end
					local v122 = v_u_7:GetPathSignal("EventShopStock")
					if v122 then
						local v123 = v122:Connect(v_u_118)
						local v124 = v_u_48
						table.insert(v124, v123)
					end
					local v125 = v_u_7:GetPathSignal("UnlockedEventShopItems")
					if v125 then
						local v126 = v125:Connect(v_u_118)
						local v127 = v_u_48
						table.insert(v127, v126)
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_7, (ref) v_u_118, (ref) v_u_48
						local v128 = v_u_7:GetPathSignal("NPCPoints/@")
						if v128 then
							local v129 = v128:Connect(v_u_118)
							local v130 = v_u_48
							table.insert(v130, v129)
						end
					end)
				end)
			end
		end
		table.sort(v_u_65, function(p131, p132)
			local v133 = p131.LayoutOrder
			local v134 = p132.LayoutOrder
			if v133 == v134 then
				return p131.Name < p132.Name
			else
				return v133 < v134
			end
		end)
	end
end
local function v_u_140()
	-- upvalues: (copy) v_u_13, (copy) v_u_36, (copy) v_u_7, (ref) v_u_50, (copy) v_u_29, (copy) v_u_16, (copy) v_u_21
	if v_u_13:IsHiddenAfterUpdate("Event Shop Restock") or v_u_13:IsHiddenFromUpdate("Event Shop Restock") then
		v_u_36.Frame.Frame.RestockButton.Visible = true
		v_u_36.Frame.Frame.RestockInfo.Visible = true
		return
	else
		v_u_36.Frame.Frame.RestockButton.Visible = true
		v_u_36.Frame.Frame.RestockInfo.Visible = false
		local v136 = v_u_7:GetData()
		if v136 then
			if not v136.EventShopStock[v_u_50] then
				task.wait(2)
			end
			if v136.EventShopStock[v_u_50] then
				local v137 = v_u_29.BASE_RESTOCK_COST
				local v138 = v136.EventShopStock[v_u_50].RestockCost
				local v139 = math.max(v137, v138)
				if v_u_29.RESTOCK_CURRENCY == "Sheckles" then
					v_u_36.Frame.Frame.RestockButton.TextLabel.Text = ("RESTOCK: %*\194\162"):format((v_u_16.FormatCompactPrice(v139)))
				else
					v_u_36.Frame.Frame.RestockButton.TextLabel.Text = ("RESTOCK: %*"):format((v_u_16.FormatCompactPrice(v139)))
					v_u_36.Frame.Frame.RestockButton.CurrencyImage.Image = v_u_21(v_u_29.RESTOCK_CURRENCY, "Currency")
				end
			else
				v_u_36.Frame.Frame.RestockButton.Visible = false
				v_u_36.Frame.Frame.RestockInfo.Visible = false
				return
			end
		else
			return
		end
	end
end
local v141 = v_u_7:GetPathSignal("EventShopStock")
if v141 then
	v141:Connect(function()
		-- upvalues: (copy) v_u_140
		v_u_140()
	end)
end
local function v_u_144()
	-- upvalues: (copy) v_u_46, (copy) v_u_25, (copy) v_u_29, (copy) v_u_45
	for _, v142 in v_u_46 do
		local v143 = v_u_25:IsTabUnlocked(v_u_29.SHOP_TYPE, v142.Name)
		if v142.IsLocked and v143 then
			v_u_45.UnlockTab(v142.Name)
		end
	end
end
local function v145(_)
	-- upvalues: (copy) v_u_135, (ref) v_u_34, (copy) v_u_35
	v_u_135()
	v_u_34 = nil
	v_u_35:Fire()
end
v_u_45.OnCategoryChanged:Connect(v145)
function v_u_49.Recreate(_, p146)
	-- upvalues: (ref) v_u_50, (copy) v_u_135, (copy) v_u_140, (copy) v_u_49
	v_u_50 = p146
	v_u_135()
	v_u_140()
	v_u_49:SetTitle(p146)
end
function v_u_49.SetTitle(_, p147)
	-- upvalues: (copy) v_u_39, (copy) v_u_40, (copy) v_u_37
	v_u_39.Text = p147
	v_u_40.Text = p147
	v_u_37.CanvasPosition = Vector2.new(0, 0)
end
function v_u_49.Start(_)
	-- upvalues: (copy) v_u_12, (copy) v_u_36, (copy) v_u_10, (copy) v_u_140, (copy) v_u_57, (copy) v_u_135, (copy) v_u_7, (copy) v_u_144
	v_u_12:UsePopupAnims(v_u_36)
	v_u_36.Frame.Frame.CloseButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_12, (ref) v_u_36
		v_u_12:Close(v_u_36)
	end)
	v_u_36.Frame.Frame.RestockButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_140
		v_u_10:PromptPurchase(3471912100, Enum.InfoType.Product)
		task.spawn(function()
			-- upvalues: (ref) v_u_140
			task.wait(0.5)
			v_u_140()
		end)
	end)
	v_u_140()
	task.spawn(v_u_57)
	v_u_135()
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_144
		local v148 = v_u_7:GetPathSignal("ShopTabData/@")
		if v148 then
			v148:Connect(v_u_144)
		end
	end)
end
local v_u_149 = game.SoundService.Christmas_Bell_Shop_SFX
function v_u_49.Open(_, p150)
	-- upvalues: (copy) v_u_149, (copy) v_u_49, (copy) v_u_12, (copy) v_u_36
	v_u_149.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_149.TimePosition = 0
	v_u_149.Playing = true
	v_u_49:Recreate(p150)
	v_u_12:Open(v_u_36)
end
function v_u_49.GetCurrentIndex(_)
	-- upvalues: (ref) v_u_50
	return v_u_50
end
task.spawn(v_u_49.Start, v_u_49)
v_u_13.OnUpdated:Connect(function()
	-- upvalues: (copy) v_u_57, (copy) v_u_135
	task.spawn(v_u_57)
	v_u_135()
end)
return v_u_49