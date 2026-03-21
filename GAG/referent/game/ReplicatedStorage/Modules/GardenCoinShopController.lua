local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
local v_u_2 = game:GetService("ContentProvider")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("CollectionService")
local v5 = v_u_1:WaitForChild("GameEvents")
local v6 = game.Players.LocalPlayer.PlayerGui
local v_u_7 = require(v_u_1.Modules.DataService)
local v8 = require(v_u_1.Modules.Signal)
local v_u_9 = require(v_u_1.Modules.FastTween)
require(v_u_1.Modules.DumpTable)
local v_u_10 = require(v_u_1.Modules.GuiController)
local v_u_11 = require(v_u_1.Modules.UpdateService)
require(v_u_1.Comma_Module)
local v_u_12 = require(v_u_1.Item_Module)
local v_u_13 = require(v_u_1.Modules.NumberUtil)
local v_u_14 = require(v_u_1.Modules.SeedPackOddsController)
local v_u_15 = require(v_u_1.Modules.PetEggOddsController)
local v_u_16 = require(v_u_1.Modules.CosmeticCrateOddsController)
require(v_u_1.Modules.UseDynamicPrices)
local v_u_17 = require(v_u_1.Modules.ItemImageFinder)
local v_u_18 = require(v_u_1.Data.CurrencyData)
local v_u_19 = require(v_u_1.Modules.WatchButtonHold)
local v_u_20 = require(v_u_1.Code.Spr)
local _ = require(v_u_1.Data.CosmeticRegistry).CosmeticList
local v_u_21 = require(v_u_1.Data.GardenCoinShopData)
require(v_u_1.Data.GardenCoinShopConfigData)
local v_u_22 = v5.BuyGardenCoinShopStock
local v_u_23 = false
local v_u_24 = nil
local v_u_25 = v8.new()
local v_u_26 = v6:WaitForChild("GardenCoinShop_UI")
local v_u_27 = v_u_26:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
v_u_26:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("Timer").Visible = false
local v_u_28 = v_u_27:WaitForChild("ItemFrame")
v_u_28.Parent = script
local v_u_29 = v_u_27:WaitForChild("ItemPadding")
v_u_29.Parent = v_u_27
local v_u_30 = {}
local v_u_31 = {}
local v32 = {}
local _ = game.SoundService.Click
local function v_u_33()
	-- upvalues: (ref) v_u_23
	if not v_u_23 then
		v_u_23 = true
	end
end
local function v_u_36()
	-- upvalues: (copy) v_u_31, (copy) v_u_30
	for _, v34 in ipairs(v_u_31) do
		if v34.Connected then
			v34:Disconnect()
		end
	end
	table.clear(v_u_31)
	for _, v35 in v_u_30 do
		if v35:IsA("Frame") then
			v35:Destroy()
		end
	end
	table.clear(v_u_30)
end
local function v_u_93()
	-- upvalues: (copy) v_u_33, (copy) v_u_36, (copy) v_u_7, (copy) v_u_3, (copy) v_u_21, (copy) v_u_17, (copy) v_u_2, (copy) v_u_11, (copy) v_u_28, (copy) v_u_30, (copy) v_u_12, (copy) v_u_13, (copy) v_u_31, (copy) v_u_27, (copy) v_u_29, (copy) v_u_22, (copy) v_u_19, (copy) v_u_20, (copy) v_u_9, (copy) v_u_14, (copy) v_u_26, (copy) v_u_15, (copy) v_u_16, (copy) v_u_18, (ref) v_u_24, (copy) v_u_25, (copy) v_u_93
	task.spawn(v_u_33)
	v_u_36()
	local v37 = v_u_7:GetData()
	local _ = v37.GardenCoinShopStock.Stocks
	if not v_u_3.TouchEnabled then
		local v_u_38 = {}
		for v39, v40 in v_u_21 do
			if v40.DisplayInShop and v40.ItemType == "Seed" then
				local v41 = Instance.new("ImageLabel")
				v41.Image = v40.Icon or v_u_17(v39, "Holdable")
				table.insert(v_u_38, v41)
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) v_u_38
			v_u_2:PreloadAsync(v_u_38)
		end)
	end
	local v_u_42 = {}
	for v_u_43, v_u_44 in v_u_21 do
		if v_u_44.DisplayInShop and (not v_u_11:IsHiddenFromUpdate(v_u_44.SeedName) and (not v_u_44.HideAfterLifetimeLimitReached or (not v_u_44.LifetimeLimit or (v37.GardenCoinShopStats.LifetimePurchases[v_u_43] or 0) ~= v_u_44.LifetimeLimit))) then
			if v_u_44.LifetimeLimitDependancy then
				local v45 = v_u_21[v_u_44.LifetimeLimitDependancy]
				if (v37.GardenCoinShopStats.LifetimePurchases[v_u_44.LifetimeLimitDependancy] or 0) == v45.LifetimeLimit then
					goto l18
				end
			else
				::l18::
				local v_u_46 = v_u_28:Clone()
				v_u_30[v_u_43] = v_u_46
				v_u_46.Name = v_u_43
				v_u_46.LayoutOrder = v_u_44.LayoutOrder * 10
				table.insert(v_u_42, v_u_46)
				local v_u_47 = v_u_46.Main_Frame
				local v48 = v_u_12.Return_Rarity_Data(v_u_44.SeedRarity)
				if v48 then
					v_u_47.Rarity_Text.Text = v48[1]
					local v49 = v_u_47.Rarity_Text.UIStroke
					local v50, v51, v52 = v48[2]:ToHSV()
					v49.Color = Color3.fromHSV(v50, v51, v52 / 2)
					v_u_47.Rarity_BG.ImageColor3 = v48[2]
				end
				v_u_47.Seed_Text.Text = v_u_44.SeedName
				v_u_47.Seed_Text_Shadow.Text = v_u_44.SeedName
				local v_u_53
				if v_u_44.SpecialCurrencyType then
					v_u_53 = v_u_13.FormatCompactPrice(v_u_44.Price) .. ""
				else
					v_u_53 = v_u_13.DisplaySheckles(v_u_44.Price)
				end
				if v_u_47.Cost_Text:FindFirstChild("TEXT") then
					v_u_47.Cost_Text.TEXT.Text = v_u_53
				else
					v_u_47.Cost_Text.Text = v_u_53
				end
				if v_u_44.LifetimeLimit then
					local v54 = v37.GardenCoinShopStats.LifetimePurchases[v_u_43] or 0
					v_u_47.Description_Text.Text = v_u_44.Description .. (" (%*/%*)"):format(v54, v_u_44.LifetimeLimit)
					local v55 = v_u_31
					local v56 = v_u_7:GetPathSignal("GardenCoinShopStats/LifetimePurchases/@")
					local function v58()
						-- upvalues: (ref) v_u_7, (copy) v_u_43, (copy) v_u_47, (copy) v_u_44
						local v57 = v_u_7:GetData().GardenCoinShopStats.LifetimePurchases[v_u_43] or 0
						v_u_47.Description_Text.Text = v_u_44.Description .. (" (%*/%*)"):format(v57, v_u_44.LifetimeLimit)
					end
					table.insert(v55, v56:Connect(v58))
				else
					v_u_47.Description_Text.Text = v_u_44.Description
				end
				local v59 = v_u_47:FindFirstChild("ShopItem_Image", true)
				v59.Visible = true
				v59.Image = v_u_44.Icon or v_u_17(v_u_43, v_u_44.ItemType)
				v_u_46.Parent = v_u_27
				local v_u_60 = v_u_29:Clone()
				v_u_60.LayoutOrder = v_u_44.LayoutOrder * 10 + 1
				v_u_60.Name = ("%*_Padding"):format(v_u_43)
				v_u_60.Parent = v_u_27
				v_u_30[v_u_60.Name] = v_u_60
				local v_u_61 = v_u_46.Frame
				if v_u_61.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
					v_u_61.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_53
				else
					v_u_61.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_53
				end
				local function v62()
					-- upvalues: (ref) v_u_22, (copy) v_u_43
					v_u_22:FireServer(v_u_43)
				end
				local v_u_63 = false
				local v_u_64 = 0
				v_u_19(v_u_61.Sheckles_Buy, function(p65, p66)
					-- upvalues: (ref) v_u_64, (ref) v_u_63, (copy) v_u_61, (ref) v_u_20, (ref) v_u_22, (copy) v_u_43
					if workspace:GetAttribute("InTutorial") then
						return
					elseif p66 then
						v_u_64 = 0
						if v_u_63 then
							v_u_63 = false
							if v_u_61:FindFirstChild("Sheckles_Buy") then
								v_u_20.target(v_u_61.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(1, 1, 1)
								})
							end
						end
						return
					else
						if not v_u_63 then
							v_u_63 = true
							if v_u_61:FindFirstChild("Sheckles_Buy") then
								v_u_20.target(v_u_61.Sheckles_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
								})
							end
						end
						if os.clock() >= v_u_64 then
							local v67 = p65 * -0.3
							local v68 = ((1 - math.exp(v67)) * 24 + 8) // 1
							local v69 = math.max(v68, 1)
							v_u_64 = os.clock() + 0.125
							for _ = 1, v69 do
								v_u_22:FireServer(v_u_43)
							end
						end
					end
				end, {
					["minimumHoldTime"] = 1,
					["interval"] = 0.125
				})
				v_u_61.Sheckles_Buy.Activated:Connect(v62)
				if v_u_44.ItemType == "Seed" then
					local v_u_70 = nil
					local v_u_71 = nil
					v_u_47.MouseEnter:Connect(function()
						-- upvalues: (ref) v_u_70, (ref) v_u_9, (copy) v_u_46, (ref) v_u_71, (ref) v_u_17, (copy) v_u_43
						v_u_70 = v_u_9(v_u_46.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
							["Rotation"] = v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
						})
						v_u_71 = v_u_9(v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1.5
						})
						v_u_71.Completed:Connect(function(p72)
							-- upvalues: (ref) v_u_46, (ref) v_u_17, (ref) v_u_43
							if p72 == Enum.PlaybackState.Completed then
								if not v_u_46:IsDescendantOf(game) then
									return
								end
								v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_17(v_u_43, "Holdable")
							end
						end)
					end)
					v_u_47.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_70, (copy) v_u_46, (ref) v_u_17, (copy) v_u_43, (copy) v_u_44, (ref) v_u_9
						if v_u_70 then
							v_u_70:Cancel()
						end
						v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
						v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_17(v_u_43, v_u_44.ItemType)
						v_u_9(v_u_46.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1
						})
					end)
				end
				if v_u_44.ItemType == "Seed Pack" and v_u_44.ShowOdds then
					v_u_47.OddsButton.Visible = true
					v_u_47.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_14, (copy) v_u_44, (ref) v_u_26
						v_u_14:Open(v_u_44.SeedName, v_u_26)
					end)
				elseif v_u_44.ItemType == "Egg" and v_u_44.ShowOdds then
					v_u_47.OddsButton.Visible = true
					v_u_47.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_15, (copy) v_u_44, (ref) v_u_26
						v_u_15:Open(v_u_44.SeedName, v_u_26)
					end)
				elseif v_u_44.ItemType == "Crate" and v_u_44.ShowOdds then
					v_u_47.OddsButton.Visible = true
					v_u_47.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_16, (copy) v_u_44, (ref) v_u_26
						v_u_16:Open(v_u_44.SeedName, v_u_26)
					end)
				else
					v_u_47.OddsButton.Visible = false
				end
				if v_u_44.SpecialCurrencyType and v_u_18[v_u_44.SpecialCurrencyType] then
					v_u_47.Cost_Text.CurrencyImage.Image = v_u_18[v_u_44.SpecialCurrencyType].Icon
					v_u_61.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_18[v_u_44.SpecialCurrencyType].Icon
				else
					v_u_47.Cost_Text.CurrencyImage.Visible = false
					v_u_61.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
				end
				local function v73()
					-- upvalues: (ref) v_u_24, (copy) v_u_43, (copy) v_u_61, (ref) v_u_9, (copy) v_u_60
					if v_u_24 == v_u_43 then
						v_u_61.Visible = true
						v_u_9(v_u_61, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 1.3)
						})
						v_u_9(v_u_60, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.25)
						})
					else
						task.delay(0.25, function()
							-- upvalues: (ref) v_u_61
							if v_u_61.Position == UDim2.fromScale(0.5, 0.5) then
								v_u_61.Visible = false
							end
						end)
						v_u_9(v_u_61, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Position"] = UDim2.fromScale(0.5, 0.5)
						})
						v_u_9(v_u_60, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							["Size"] = UDim2.fromScale(0.13, 0.02)
						})
					end
				end
				v_u_25:Connect(v73)
				task.spawn(v73)
				v_u_47.Activated:Connect(function()
					-- upvalues: (ref) v_u_9, (ref) v_u_27, (copy) v_u_46, (copy) v_u_42, (ref) v_u_24, (copy) v_u_43, (ref) v_u_25
					v_u_9(v_u_27, TweenInfo.new(0.35), {
						["CanvasPosition"] = Vector2.new(0, v_u_46.AbsoluteSize.Y * (table.find(v_u_42, v_u_46) - 1 - 1))
					})
					local v74
					if v_u_24 == v_u_43 then
						v74 = nil
					else
						v74 = v_u_43
					end
					v_u_24 = v74
					v_u_25:Fire()
				end)
				local v_u_75 = true
				local v_u_76 = Instance.new("NumberValue")
				v_u_76.Value = 0
				v_u_76.Parent = v_u_61
				v_u_76.Changed:Connect(function(p77)
					-- upvalues: (copy) v_u_47
					v_u_47.Stock_Text.Text = ("X%* Stock"):format(p77 // 1)
				end)
				local function v_u_85()
					-- upvalues: (ref) v_u_7, (copy) v_u_43, (copy) v_u_47, (copy) v_u_44, (ref) v_u_93, (ref) v_u_75, (ref) v_u_63, (copy) v_u_76, (ref) v_u_20, (copy) v_u_61, (ref) v_u_53
					local v78 = v_u_7:GetData()
					local v79
					if v78 then
						v79 = v78.GardenCoinShopStock.Stocks[v_u_43]
					else
						v79 = v78
					end
					local v80 = v79 and v79.Stock or 0
					if v_u_47:FindFirstChild("Stock_Text", true) then
						if v_u_44.HideAfterLifetimeLimitReached and (v_u_44.LifetimeLimit and (v78.GardenCoinShopStats.LifetimePurchases[v_u_43] or 0) == v_u_44.LifetimeLimit) then
							v_u_93()
						else
							if v_u_75 or not v_u_63 then
								v_u_75 = false
								v_u_76.Value = v80
							else
								v_u_20.target(v_u_76, 1, 1.5, {
									["Value"] = v80
								})
							end
							v_u_61.Sheckles_Buy.In_Stock.Visible = v80 > 0
							v_u_61.Sheckles_Buy.No_Stock.Visible = v80 <= 0
							v_u_61.Sheckles_Buy.HoverImage = v80 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
							v_u_61.Sheckles_Buy.Image = v80 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
							if v_u_47.Cost_Text:FindFirstChild("TEXT") then
								v_u_47.Cost_Text.TEXT.Text = v80 <= 0 and "NO STOCK" or v_u_53
								local v81 = v_u_47.Cost_Text.TEXT
								local v82
								if v80 <= 0 then
									v82 = Color3.fromRGB(255, 0, 0)
								else
									v82 = Color3.fromRGB(0, 255, 0)
								end
								v81.TextColor3 = v82
							else
								v_u_47.Cost_Text.Text = v80 <= 0 and "NO STOCK" or v_u_53
								local v83 = v_u_47.Cost_Text
								local v84
								if v80 <= 0 then
									v84 = Color3.fromRGB(255, 0, 0)
								else
									v84 = Color3.fromRGB(0, 255, 0)
								end
								v83.TextColor3 = v84
							end
							if v_u_47.Cost_Text:FindFirstChild("CurrencyImage") and v_u_44.SpecialCurrencyType then
								v_u_47.Cost_Text.CurrencyImage.Visible = v80 > 0
							end
						end
					else
						return
					end
				end
				task.spawn(v_u_85)
				task.spawn(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_85, (ref) v_u_31
					local v86 = v_u_7:GetPathSignal("GardenCoinShopStock/@")
					if v86 then
						local v87 = v86:Connect(v_u_85)
						local v88 = v_u_31
						table.insert(v88, v87)
					end
				end)
			end
		end
	end
	table.sort(v_u_42, function(p89, p90)
		local v91 = p89.LayoutOrder
		local v92 = p90.LayoutOrder
		if v91 == v92 then
			return p89.Name < p90.Name
		else
			return v91 < v92
		end
	end)
end
function v32.Start(_)
	-- upvalues: (copy) v_u_10, (copy) v_u_26, (copy) v_u_93, (copy) v_u_7, (copy) v_u_4, (copy) v_u_1
	v_u_10:UsePopupAnims(v_u_26)
	v_u_26.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_26
		v_u_10:Close(v_u_26)
	end)
	v_u_93()
	task.wait(1)
	local v_u_94 = v_u_7:GetData()
	local function v97()
		-- upvalues: (ref) v_u_4, (copy) v_u_94, (ref) v_u_1
		for _, v95 in v_u_4:GetTagged("GardenCoinShop") do
			local v96
			if v_u_94.GardenCoinShopStats.UnlockedGardenCoins then
				v96 = workspace
			else
				v96 = v_u_1
			end
			v95.Parent = v96
		end
	end
	v_u_7:GetPathSignal("GardenCoinShopStats/UnlockedGardenCoins"):Connect(v97)
	for _, v98 in v_u_4:GetTagged("GardenCoinShop") do
		local v99
		if v_u_94.GardenCoinShopStats.UnlockedGardenCoins then
			v99 = workspace
		else
			v99 = v_u_1
		end
		v98.Parent = v99
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_93
	while v_u_11:IsUpdateDone() == false do
		task.wait(1)
	end
	task.wait(0.5)
	v_u_93()
end)
task.spawn(v32.Start, v32)
return v32