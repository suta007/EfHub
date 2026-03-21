local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local v_u_2 = game:GetService("ContentProvider")
local v_u_3 = game:GetService("UserInputService")
local v4 = v1:WaitForChild("GameEvents")
local v5 = game.Players.LocalPlayer.PlayerGui
local v_u_6 = require(v1.Modules.DataService)
local v7 = require(v1.Modules.Signal)
local v_u_8 = require(v1.Modules.FastTween)
require(v1.Modules.DumpTable)
local v_u_9 = require(v1.Modules.MarketController)
local v_u_10 = require(v1.Modules.GiftController)
local v_u_11 = require(v1.Modules.GuiController)
local v_u_12 = require(v1.Modules.UpdateService)
local v_u_13 = require(v1.Comma_Module)
local v_u_14 = require(v1.Item_Module)
local v_u_15 = require(v1.Modules.NumberUtil)
local v_u_16 = require(v1.Modules.SeedPackOddsController)
local v_u_17 = require(v1.Modules.PetEggOddsController)
local v_u_18 = require(v1.Modules.CosmeticCrateOddsController)
local v_u_19 = require(v1.Modules.UseDynamicPrices)
local v_u_20 = require(v1.Modules.ItemImageFinder)
local v_u_21 = require(v1.Modules.ItemDescriptionFinder)
require(v1.Modules.SelectiveAssetReplication)
local v_u_22 = require(v1.Data.CurrencyData)
local v_u_23 = require(v1.Modules.WatchButtonHold)
local v_u_24 = require(v1.Code.Spr)
local _ = require(v1.Data.CosmeticRegistry).CosmeticList
local v_u_25 = require(v1.Data.TravelingMerchant.TravelingMerchantData)
require(v1.Data.TravelingMerchant.TravelingMerchantShopConfigData)
require(v1.Data.EventShopConfigData)
local v_u_26 = v4.BuyTravelingMerchantShopStock
local v_u_27 = false
local v_u_28 = nil
local v_u_29 = v7.new()
local v_u_30 = v5:WaitForChild("TravelingMerchantShop_UI")
local v_u_31 = v_u_30:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
local v_u_32 = v_u_30:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("Timer")
local v_u_33 = v_u_31:WaitForChild("ItemFrame")
v_u_33.Parent = script
local v_u_34 = v_u_31:WaitForChild("ItemPadding")
v_u_34.Parent = v_u_31
local v_u_35 = v_u_30:FindFirstChild("ShopTitle", true)
local v_u_36 = {}
local v_u_37 = {}
local v38 = {}
local function v_u_41()
	-- upvalues: (copy) v_u_6, (copy) v_u_25
	workspace:GetServerTimeNow()
	local v39 = v_u_6:GetData()
	if not v39.TravelingMerchantShopStock.MerchantType then
		return 0
	end
	local v40 = v39.TravelingMerchantShopStock.MerchantStartTime + v_u_25[v39.TravelingMerchantShopStock.MerchantType].Duration - workspace:GetServerTimeNow()
	return v40 <= 0 and 0 or v40
end
local v_u_42 = game.SoundService.Click
local function v_u_44()
	-- upvalues: (ref) v_u_27, (copy) v_u_41, (copy) v_u_32, (copy) v_u_15
	if v_u_27 then
		return
	else
		v_u_27 = true
		while true do
			local v43 = v_u_41()
			v_u_32.Text = v43 <= 0 and "Restocking" or "Leaving: " .. v_u_15.compactFormat(v43)
			task.wait(1)
		end
	end
end
local function v_u_105()
	-- upvalues: (copy) v_u_44, (copy) v_u_37, (copy) v_u_36, (copy) v_u_6, (copy) v_u_35, (copy) v_u_25, (copy) v_u_3, (copy) v_u_20, (copy) v_u_2, (copy) v_u_12, (copy) v_u_33, (copy) v_u_14, (copy) v_u_15, (copy) v_u_21, (copy) v_u_31, (copy) v_u_34, (copy) v_u_26, (copy) v_u_23, (copy) v_u_24, (copy) v_u_9, (copy) v_u_42, (copy) v_u_10, (copy) v_u_8, (copy) v_u_16, (copy) v_u_30, (copy) v_u_17, (copy) v_u_18, (copy) v_u_22, (ref) v_u_28, (copy) v_u_29, (copy) v_u_19, (copy) v_u_13
	task.spawn(v_u_44)
	for _, v45 in ipairs(v_u_37) do
		if v45.Connected then
			v45:Disconnect()
		end
	end
	table.clear(v_u_37)
	for _, v46 in v_u_36 do
		if v46:IsA("Frame") then
			v46:Destroy()
		end
	end
	table.clear(v_u_36)
	local v47 = v_u_6:GetData()
	if v47.FirstTimeUser then
		return
	else
		local v48 = v47.TravelingMerchantShopStock.MerchantType
		local _ = v47.TravelingMerchantShopStock.Stocks
		if v48 then
			v_u_35.Text = ("%* Shop"):format(v_u_25[v48].Title)
			local v49 = v_u_25[v48].ShopData
			if not v_u_3.TouchEnabled then
				local v_u_50 = {}
				for v51, v52 in v49 do
					if v52.DisplayInShop and v52.ItemType == "Seed" then
						local v53 = Instance.new("ImageLabel")
						v53.Image = v_u_20(v51, "Holdable")
						table.insert(v_u_50, v53)
					end
				end
				task.spawn(function()
					-- upvalues: (ref) v_u_2, (copy) v_u_50
					v_u_2:PreloadAsync(v_u_50)
				end)
			end
			local v_u_54 = {}
			for v_u_55, v_u_56 in v49 do
				if v_u_56.DisplayInShop and not v_u_12:IsHiddenFromUpdate(v_u_56.SeedName) then
					local v_u_57 = v_u_33:Clone()
					v_u_36[v_u_55] = v_u_57
					v_u_57.Name = v_u_55
					v_u_57.LayoutOrder = v_u_56.LayoutOrder * 10
					table.insert(v_u_54, v_u_57)
					local v_u_58 = v_u_57.Main_Frame
					local v59 = v_u_14.Return_Rarity_Data(v_u_56.SeedRarity)
					if v59 then
						v_u_58.Rarity_Text.Text = v59[1]
						local v60 = v_u_58.Rarity_Text.UIStroke
						local v61, v62, v63 = v59[2]:ToHSV()
						v60.Color = Color3.fromHSV(v61, v62, v63 / 2)
						v_u_58.Rarity_BG.ImageColor3 = v59[2]
					end
					v_u_58.Seed_Text.Text = v_u_56.SeedName
					v_u_58.Seed_Text_Shadow.Text = v_u_56.SeedName
					local v_u_64
					if v_u_56.SpecialCurrencyType then
						v_u_64 = v_u_15.FormatCompactPrice(v_u_56.Price) .. ""
					else
						v_u_64 = v_u_15.DisplaySheckles(v_u_56.Price)
					end
					if v_u_58.Cost_Text:FindFirstChild("TEXT") then
						v_u_58.Cost_Text.TEXT.Text = v_u_64
					else
						v_u_58.Cost_Text.Text = v_u_64
					end
					v_u_58.Description_Text.Text = v_u_21(v_u_56.SeedName, v_u_56.ItemType) or v_u_56.Description
					local v65 = v_u_58:FindFirstChild("ShopItem_Image", true)
					v65.Visible = true
					v65.Image = v_u_20(v_u_55, v_u_56.ItemType)
					v_u_57.Parent = v_u_31
					local v_u_66 = UDim2.fromScale(0.13, 0.042)
					local v_u_67 = v_u_34:Clone()
					v_u_67.LayoutOrder = v_u_56.LayoutOrder * 10 + 1
					v_u_67.Name = ("%*_Padding"):format(v_u_55)
					v_u_67.Parent = v_u_31
					v_u_36[v_u_67.Name] = v_u_67
					local v_u_68 = v_u_57.Frame
					if v_u_68.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
						v_u_68.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_64
					else
						v_u_68.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_64
					end
					local function v69()
						-- upvalues: (ref) v_u_26, (copy) v_u_55
						v_u_26:FireServer(v_u_55)
					end
					local v_u_70 = false
					local v_u_71 = 0
					v_u_23(v_u_68.Sheckles_Buy, function(p72, p73)
						-- upvalues: (ref) v_u_71, (ref) v_u_70, (copy) v_u_68, (ref) v_u_24, (ref) v_u_26, (copy) v_u_55
						if workspace:GetAttribute("InTutorial") then
							return
						elseif p73 then
							v_u_71 = 0
							if v_u_70 then
								v_u_70 = false
								if v_u_68:FindFirstChild("Sheckles_Buy") then
									v_u_24.target(v_u_68.Sheckles_Buy, 0.8, 2, {
										["ImageColor3"] = Color3.new(1, 1, 1)
									})
								end
							end
							return
						else
							if not v_u_70 then
								v_u_70 = true
								if v_u_68:FindFirstChild("Sheckles_Buy") then
									v_u_24.target(v_u_68.Sheckles_Buy, 0.8, 2, {
										["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
									})
								end
							end
							if os.clock() >= v_u_71 then
								local v74 = p72 * -0.3
								local v75 = ((1 - math.exp(v74)) * 24 + 8) // 1
								local v76 = math.max(v75, 1)
								v_u_71 = os.clock() + 0.125
								for _ = 1, v76 do
									v_u_26:FireServer(v_u_55)
								end
							end
						end
					end, {
						["minimumHoldTime"] = 1,
						["interval"] = 0.125
					})
					v_u_68.Sheckles_Buy.Activated:Connect(v69)
					local v77 = v_u_56.PurchaseID ~= nil
					if v77 then
						v_u_68.Robux_Buy.Activated:Connect(function()
							-- upvalues: (ref) v_u_9, (copy) v_u_56
							v_u_9:PromptPurchase(v_u_56.PurchaseID, Enum.InfoType.Product)
						end)
					end
					v_u_68.Robux_Buy.Visible = v77
					v_u_68.Gift.Visible = v_u_56.GiftPurchaseID ~= nil
					if v_u_56.GiftPurchaseID then
						v_u_68.Gift.Activated:Connect(function()
							-- upvalues: (ref) v_u_42, (ref) v_u_10, (copy) v_u_56
							v_u_42.PlaybackSpeed = 1 + math.random(-15, 15) / 100
							v_u_42.TimePosition = 0
							v_u_42.Playing = true
							v_u_10:PromptGiftFromGiftId(v_u_56.GiftPurchaseID)
						end)
					end
					if v_u_56.ItemType == "Seed" then
						local v_u_78 = nil
						local v_u_79 = nil
						v_u_58.MouseEnter:Connect(function()
							-- upvalues: (ref) v_u_78, (ref) v_u_8, (copy) v_u_57, (ref) v_u_79, (ref) v_u_20, (copy) v_u_55
							v_u_78 = v_u_8(v_u_57.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
								["Rotation"] = v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
							})
							v_u_79 = v_u_8(v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1.5
							})
							v_u_79.Completed:Connect(function(p80)
								-- upvalues: (ref) v_u_57, (ref) v_u_20, (ref) v_u_55
								if p80 == Enum.PlaybackState.Completed then
									if not v_u_57:IsDescendantOf(game) then
										return
									end
									v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_20(v_u_55, "Holdable")
								end
							end)
						end)
						v_u_58.MouseLeave:Connect(function()
							-- upvalues: (ref) v_u_78, (copy) v_u_57, (ref) v_u_20, (copy) v_u_55, (copy) v_u_56, (ref) v_u_8
							if v_u_78 then
								v_u_78:Cancel()
							end
							v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
							v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_20(v_u_55, v_u_56.ItemType)
							v_u_8(v_u_57.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1
							})
						end)
					end
					if v_u_56.ItemType == "Seed Pack" and v_u_56.ShowOdds then
						v_u_58.OddsButton.Visible = true
						v_u_58.OddsButton.Activated:Connect(function()
							-- upvalues: (ref) v_u_16, (copy) v_u_56, (ref) v_u_30
							v_u_16:Open(v_u_56.SeedName, v_u_30)
						end)
					elseif v_u_56.ItemType == "Egg" and v_u_56.ShowOdds then
						v_u_58.OddsButton.Visible = true
						v_u_58.OddsButton.Activated:Connect(function()
							-- upvalues: (ref) v_u_17, (copy) v_u_56, (ref) v_u_30
							v_u_17:Open(v_u_56.SeedName, v_u_30)
						end)
					elseif v_u_56.ItemType == "Crate" and v_u_56.ShowOdds then
						v_u_58.OddsButton.Visible = true
						v_u_58.OddsButton.Activated:Connect(function()
							-- upvalues: (ref) v_u_18, (copy) v_u_56, (ref) v_u_30
							v_u_18:Open(v_u_56.SeedName, v_u_30)
						end)
					else
						v_u_58.OddsButton.Visible = false
					end
					if v_u_56.SpecialCurrencyType and v_u_22[v_u_56.SpecialCurrencyType] then
						v_u_58.Cost_Text.CurrencyImage.Image = v_u_22[v_u_56.SpecialCurrencyType].Icon
						v_u_68.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_22[v_u_56.SpecialCurrencyType].Icon
					else
						v_u_58.Cost_Text.CurrencyImage.Visible = false
						v_u_68.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
					end
					local function v82()
						-- upvalues: (ref) v_u_28, (copy) v_u_55, (copy) v_u_68, (ref) v_u_8, (copy) v_u_67, (copy) v_u_66
						if v_u_28 == v_u_55 then
							v_u_68.Visible = true
							v_u_8(v_u_68, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Position"] = UDim2.fromScale(0.5, 1.3)
							})
							v_u_8(v_u_67, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Size"] = UDim2.fromScale(0.13, 0.25)
							})
						else
							task.delay(0.25, function()
								-- upvalues: (ref) v_u_68
								if v_u_68.Position == UDim2.fromScale(0.5, 0.5) then
									v_u_68.Visible = false
								end
							end)
							v_u_8(v_u_68, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Position"] = UDim2.fromScale(0.5, 0.5)
							})
							local v81 = {
								["Size"] = v_u_66
							}
							v_u_8(v_u_67, TweenInfo.new(0.25), v81)
						end
					end
					v_u_29:Connect(v82)
					task.spawn(v82)
					local v_u_83 = false
					v_u_58.Activated:Connect(function()
						-- upvalues: (copy) v_u_54, (copy) v_u_57, (ref) v_u_8, (ref) v_u_31, (copy) v_u_66, (ref) v_u_28, (copy) v_u_55, (ref) v_u_29, (ref) v_u_83, (ref) v_u_19, (copy) v_u_56, (copy) v_u_68, (ref) v_u_9, (ref) v_u_13
						local v84 = table.find(v_u_54, v_u_57) or 1
						v_u_8(v_u_31, TweenInfo.new(0.35), {
							["CanvasPosition"] = Vector2.new(0, (v_u_57.AbsoluteSize.Y + v_u_66.Y.Scale * v_u_31.AbsoluteSize.Y) * (v84 - 1))
						})
						local v85
						if v_u_28 == v_u_55 then
							v85 = nil
						else
							v85 = v_u_55
						end
						v_u_28 = v85
						v_u_29:Fire()
						if not v_u_83 then
							if v_u_19 or v_u_56.FallbackPrice == nil then
								if not v_u_19 then
									warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_68:GetFullName()))))
								end
								v_u_9:SetPriceLabel(v_u_68.Robux_Buy.Price, v_u_56.PurchaseID, ":robux::value:")
							else
								v_u_68.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_13.Comma(v_u_56.FallbackPrice)))
							end
							v_u_83 = true
						end
					end)
					if v_u_28 == v_u_55 then
						task.spawn(function()
							-- upvalues: (ref) v_u_19, (copy) v_u_56, (copy) v_u_68, (ref) v_u_9, (ref) v_u_13, (ref) v_u_83
							if v_u_19 or v_u_56.FallbackPrice == nil then
								if not v_u_19 then
									warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_68:GetFullName()))))
								end
								v_u_9:SetPriceLabel(v_u_68.Robux_Buy.Price, v_u_56.PurchaseID, ":robux::value:")
							else
								v_u_68.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_13.Comma(v_u_56.FallbackPrice)))
							end
							v_u_83 = true
						end)
					end
					local v_u_86 = true
					local v_u_87 = Instance.new("NumberValue")
					v_u_87.Value = 0
					v_u_87.Parent = v_u_68
					local v89 = v_u_87.Changed:Connect(function(p88)
						-- upvalues: (copy) v_u_58
						v_u_58.Stock_Text.Text = ("X%* Stock"):format(p88 // 1)
					end)
					local v90 = v_u_37
					table.insert(v90, v89)
					local function v_u_97()
						-- upvalues: (ref) v_u_6, (copy) v_u_55, (copy) v_u_58, (ref) v_u_86, (ref) v_u_70, (copy) v_u_87, (ref) v_u_24, (copy) v_u_68, (ref) v_u_64, (copy) v_u_56
						local v91 = v_u_6:GetData()
						if v91 then
							v91 = v91.TravelingMerchantShopStock.Stocks[v_u_55]
						end
						local v92 = v91 and v91.Stock or 0
						if v_u_58:FindFirstChild("Stock_Text", true) then
							if v_u_86 or not v_u_70 then
								v_u_86 = false
								v_u_87.Value = v92
							else
								v_u_24.target(v_u_87, 1, 1.5, {
									["Value"] = v92
								})
							end
							v_u_68.Sheckles_Buy.In_Stock.Visible = v92 > 0
							v_u_68.Sheckles_Buy.No_Stock.Visible = v92 <= 0
							v_u_68.Sheckles_Buy.HoverImage = v92 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
							v_u_68.Sheckles_Buy.Image = v92 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
							if v_u_58.Cost_Text:FindFirstChild("TEXT") then
								v_u_58.Cost_Text.TEXT.Text = v92 <= 0 and "NO STOCK" or v_u_64
								local v93 = v_u_58.Cost_Text.TEXT
								local v94
								if v92 <= 0 then
									v94 = Color3.fromRGB(255, 0, 0)
								else
									v94 = Color3.fromRGB(0, 255, 0)
								end
								v93.TextColor3 = v94
							else
								v_u_58.Cost_Text.Text = v92 <= 0 and "NO STOCK" or v_u_64
								local v95 = v_u_58.Cost_Text
								local v96
								if v92 <= 0 then
									v96 = Color3.fromRGB(255, 0, 0)
								else
									v96 = Color3.fromRGB(0, 255, 0)
								end
								v95.TextColor3 = v96
							end
							if v_u_58.Cost_Text:FindFirstChild("CurrencyImage") and v_u_56.SpecialCurrencyType then
								v_u_58.Cost_Text.CurrencyImage.Visible = v92 > 0
							end
						end
					end
					task.spawn(v_u_97)
					task.spawn(function()
						-- upvalues: (ref) v_u_6, (copy) v_u_97, (ref) v_u_37
						local v98 = v_u_6:GetPathSignal("TravelingMerchantShopStock/@")
						if v98 then
							local v99 = v98:Connect(v_u_97)
							local v100 = v_u_37
							table.insert(v100, v99)
						end
					end)
				end
			end
			table.sort(v_u_54, function(p101, p102)
				local v103 = p101.LayoutOrder
				local v104 = p102.LayoutOrder
				if v103 == v104 then
					return p101.Name < p102.Name
				else
					return v103 < v104
				end
			end)
		end
	end
end
function v38.Start(_)
	-- upvalues: (copy) v_u_11, (copy) v_u_30, (copy) v_u_105, (copy) v_u_6
	v_u_11:UsePopupAnims(v_u_30)
	v_u_30.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_30
		v_u_11:Close(v_u_30)
	end)
	v_u_30.Frame.Frame.Restock.Activated:Connect(function() end)
	v_u_105()
	local v106 = v_u_6:GetPathSignal("TravelingMerchantShopStock/MerchantType")
	if v106 then
		v106:Connect(v_u_105)
	end
end
task.spawn(v38.Start, v38)
return v38