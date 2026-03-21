local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_2 = game:GetService("ContentProvider")
game:GetService("SoundService")
game:GetService("GuiService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v_u_1.Data.EventInfinitePackData)
local v_u_6 = require(v_u_1.Data.InfinitePackData)
require(v_u_1.Data.InfinitePackData.InfinitePackTypes)
require(v_u_1.Data.SeedPackData)
local v_u_7 = require(v_u_1.Data.SeedData)
local v_u_8 = require(v_u_1.Data.DiggingMinigame.DiggingEventConfigData)
local v_u_9 = require(v_u_1.Modules.SeedPackOddsController)
local v_u_10 = require(v_u_1.Modules.PetEggOddsController)
local v_u_11 = require(v_u_1.Modules.MarketController)
local v_u_12 = require(v_u_1.Modules.UseDynamicPrices)
local v_u_13 = require(v_u_1.Data.Packs.TwilightPackData)
local v_u_14 = require(v_u_1.Data.Packs.SaintPatricksBundleData)
local v_u_15 = require(v_u_1.Modules.GiftController)
local v_u_16 = require(v_u_1.Modules.PolicyService)
local v_u_17 = require(v_u_1.Modules.GuiController)
require(v_u_1.Modules.DataService)
local v_u_18 = require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.RetryPcall)
local v_u_19 = require(v_u_1.Modules.FastTween)
local v_u_20 = require(v_u_1.Modules.Notification)
local v_u_21 = require(v_u_1.Data.ExoticPackData)
require(v_u_1.Modules.CountDictionary)
require(v_u_1.Modules.InventoryService)
local v_u_22 = require(v_u_1.Modules.GiveServiceCommon)
local v_u_23 = require(v_u_1.Modules.PityHoverController)
local v_u_24 = require(v_u_1.Modules.DiggingUIController)
local v_u_25 = require(v_u_1.Modules.GardenGuideModules.ImageCycle)
local v_u_26 = require(v_u_1.Modules.ItemImageFinder)
local v_u_27 = require(v_u_1.Modules.ItemNameFinder)
local v_u_28 = require(v_u_1.Modules.UpdateService)
local v_u_29 = require(v_u_1.Data.DevProductIds)
local v_u_30 = require(v_u_1.Modules.DataService)
local v_u_31 = require(v_u_1.Comma_Module)
local v_u_32 = require(v_u_1.Data.PityData)
local v_u_33 = require(v_u_1.Modules.Trove)
local v_u_34 = require(v_u_1.Modules.Chalk)
local v_u_35 = require(v_u_1.Modules.SuperSeedRewardUIController)
local v_u_36 = require(v_u_1.UserGenerated.Client.ClientABTests)
local v_u_37 = require(script.PetProducts)
local v_u_38 = require(v_u_1.Modules.WeatherUtils)
require(v_u_1.UserGenerated.FastFlags)
local v_u_39 = v_u_5.ReplaceNormalPack
local v_u_40 = v_u_4.LocalPlayer
local v_u_41 = v_u_40.PlayerGui
local v_u_42 = v_u_41.Shop_UI
local v_u_43 = {}
local v_u_44 = {}
local v_u_45 = 0
function v_u_43._updateNotifications(_)
	-- upvalues: (copy) v_u_41, (copy) v_u_44
	v_u_41.Hud_UI.SideBtns.Shop.Notify.Visible = next(v_u_44) ~= nil
end
function v_u_43.Notify(_)
	-- upvalues: (ref) v_u_45, (copy) v_u_44, (copy) v_u_43
	local v46 = v_u_45 + 1
	v_u_45 = v46
	local v47 = v_u_44
	table.insert(v47, v46)
	v_u_43:_updateNotifications()
	return v46
end
function v_u_43.ClearNotification(_, p48)
	-- upvalues: (copy) v_u_44, (copy) v_u_43
	if not p48 then
		return false
	end
	local v49 = table.find(v_u_44, p48)
	if not v49 then
		return true
	end
	table.remove(v_u_44, v49)
	v_u_43:_updateNotifications()
	return true
end
function v_u_43._initTwilightPack(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_42, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15, (copy) v_u_12, (copy) v_u_31, (copy) v_u_28, (copy) v_u_18
	if v_u_30:GetData() then
		local v_u_50 = v_u_42.Frame.ScrollingFrame.TwilightPack
		v_u_50.Visible = true
		v_u_50.Frame.Buy.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_13
			v_u_11:PromptPurchase(v_u_13.ProductId, Enum.InfoType.Product)
		end)
		v_u_50.Frame.Gift.Activated:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_13
			v_u_15:PromptGiftFromGiftId(v_u_13.GiftId)
		end)
		if v_u_12 then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_50.Frame.Buy.Cost:GetFullName()))))
			end
			v_u_11:SetPriceLabel(v_u_50.Frame.Buy.Cost, v_u_13.ProductId)
		else
			v_u_50.Frame.Buy.Cost.Text = ("<font size=\"19\"><font weight=\"400\">%*</font>%*</font>"):format(utf8.char(57346), (v_u_31.Comma(299)))
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_28, (copy) v_u_50, (ref) v_u_13, (ref) v_u_18
			while not v_u_28:IsHiddenAfterUpdate("Shop Twilight Pack") do
				local v51 = v_u_13.EndTime.UnixTimestamp - workspace:GetServerTimeNow()
				v_u_50.Frame.Timer.Text = v_u_18.formatShopTime(v51)
				v_u_50.Visible = v51 > 0
				task.wait(1)
			end
			v_u_50.Visible = false
		end)
	end
end
function v_u_43._initSeedRain(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_42, (copy) v_u_30, (copy) v_u_36, (copy) v_u_40, (copy) v_u_29, (copy) v_u_38, (copy) v_u_20, (copy) v_u_11
	local v52 = require(v_u_1.Data.TradeWorldData)
	local v53 = game.PlaceId == v52.PlaceId and true or v52.ForceInWorld == true
	local v_u_54 = v_u_42.Frame.ScrollingFrame.SeedRain
	if v53 then
		v_u_54.Visible = false
		return
	elseif v_u_30:GetData() then
		if v_u_36.GetAttributeAsync(v_u_40, "AB_PurchaseSeedRain", false) then
			v_u_54.Visible = true
			local v_u_55 = {
				["Mythical"] = {
					["ProductId"] = v_u_29.MythicalSeedRain.PurchaseID,
					["WeatherAttribute"] = "MythicalSeedRain"
				},
				["Divine"] = {
					["ProductId"] = v_u_29.DivineSeedRain.PurchaseID,
					["WeatherAttribute"] = "DivineSeedRain"
				},
				["Prismatic"] = {
					["ProductId"] = v_u_29.PrismaticSeedRain.PurchaseID,
					["WeatherAttribute"] = "PrismaticSeedRain"
				}
			}
			local function v59(p_u_56)
				-- upvalues: (copy) v_u_55, (copy) v_u_54, (ref) v_u_38, (ref) v_u_20, (ref) v_u_11
				local v_u_57 = v_u_55[p_u_56]
				if v_u_57 then
					local v58 = v_u_54.List:FindFirstChild(p_u_56)
					v58.Buttons.Buy.Activated:Connect(function()
						-- upvalues: (ref) v_u_38, (copy) v_u_57, (ref) v_u_20, (copy) p_u_56, (ref) v_u_11
						if v_u_38.IsThisWeatherRunning(v_u_57.WeatherAttribute) then
							v_u_20:CreateNotification((("%* Seed Rain is already active / on cooldown!"):format(p_u_56)))
						else
							v_u_11:PromptPurchase(v_u_57.ProductId, Enum.InfoType.Product)
						end
					end)
					v_u_11:SetPriceLabel(v58.Buttons.Buy, v_u_57.ProductId)
				end
			end
			v59("Mythical")
			v59("Divine")
			v59("Prismatic")
		else
			v_u_54.Visible = false
		end
	else
		return
	end
end
function v_u_43._initSuperSeedPackV1(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_36, (copy) v_u_40, (copy) v_u_42, (copy) v_u_29, (copy) v_u_35, (copy) v_u_11, (copy) v_u_15
	if v_u_30:GetData() then
		local v60 = v_u_36.GetAttributeAsync(v_u_40, "AB_SuperSeedPack_V1", false)
		local v_u_61 = v_u_42.Frame.ScrollingFrame.SuperSeedPackV1
		if v60 then
			local v_u_62 = {
				[1] = {
					["ProductId"] = v_u_29.SuperSeed1.PurchaseID
				},
				[3] = {
					["ProductId"] = v_u_29.SuperSeed3.PurchaseID
				},
				[10] = {
					["ProductId"] = v_u_29.SuperSeed10.PurchaseID
				}
			}
			v_u_61.TitleFrame.InfoButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_35
				v_u_35:Open()
			end)
			v_u_61.Visible = true
			local function v66(p63)
				-- upvalues: (copy) v_u_62, (copy) v_u_61, (ref) v_u_11, (ref) v_u_15
				local v_u_64 = v_u_62[p63]
				if v_u_64 then
					local v65 = v_u_61.List:FindFirstChild(p63)
					v65.Buttons.Buy.Activated:Connect(function()
						-- upvalues: (ref) v_u_11, (copy) v_u_64
						v_u_11:PromptPurchase(v_u_64.ProductId, Enum.InfoType.Product)
					end)
					v65.Buttons.Gift.Activated:Connect(function()
						-- upvalues: (ref) v_u_15, (copy) v_u_64
						v_u_15:PromptGiftFromNormalId(v_u_64.ProductId)
					end)
					v_u_11:SetPriceLabel(v65.Buttons.Buy, v_u_64.ProductId)
				end
			end
			v66(1)
			v66(3)
			v66(10)
		else
			v_u_61.Visible = false
		end
	else
		return
	end
end
function v_u_43._initSuperSeedPackV2(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_36, (copy) v_u_40, (copy) v_u_42, (copy) v_u_11, (copy) v_u_29, (copy) v_u_15, (copy) v_u_35
	if v_u_30:GetData() then
		local v67 = v_u_36.GetAttributeAsync(v_u_40, "AB_SuperSeedPack_V2", false)
		local v68 = v_u_42.Frame.ScrollingFrame.SuperSeedPackV2
		if v67 then
			v68.Visible = true
			v68.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_29
				v_u_11:PromptPurchase(v_u_29.SuperSeed9.PurchaseID, Enum.InfoType.Product)
			end)
			v68.Gift.Activated:Connect(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_29
				v_u_15:PromptGiftFromNormalId(v_u_29.SuperSeed9.PurchaseID)
			end)
			v68.TitleFrame.InfoButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_35
				v_u_35:Open()
			end)
			v_u_11:SetPriceLabel(v68.Buy, v_u_29.SuperSeed9.PurchaseID)
		else
			v68.Visible = false
		end
	else
		return
	end
end
local v_u_69 = v_u_1.Data.ReplicatedGlobalStock.ChristmasLimitedSeed
function v_u_43._initChristmasLimitedSeed(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_36, (copy) v_u_40, (copy) v_u_42, (copy) v_u_1, (copy) v_u_69, (copy) v_u_15, (copy) v_u_29, (copy) v_u_11
	if v_u_30:GetData() then
		local v70 = v_u_36.GetAttributeAsync(v_u_40, "AB_ChristmasLimitedSeed", false)
		local v_u_71 = v_u_42.Frame.ScrollingFrame.LimitedStock
		if v70 then
			v_u_71.Visible = true
			v_u_71.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_1
				v_u_1.GameEvents.ChristmasEvent.PurchaseLimitedSeed:FireServer()
			end)
			v_u_71.Gift.Activated:Connect(function()
				-- upvalues: (ref) v_u_69, (ref) v_u_15, (ref) v_u_29
				if v_u_69.Value > 0 then
					v_u_15:PromptGiftFromNormalId(v_u_29.ChristmasLimitedSeed.PurchaseID)
				end
			end)
			v_u_71.Stock.Text = "Syncing..."
			v_u_71.Buy.Visible = false
			v_u_71.Gift.Visible = false
			v_u_69.Changed:Connect(function()
				-- upvalues: (ref) v_u_69, (copy) v_u_71
				if v_u_69.Value <= 0 then
					v_u_71.Buy.Visible = false
					v_u_71.Gift.Visible = false
					v_u_71.Stock.Text = "Out of Stock"
					v_u_71.Buy.Visible = false
					v_u_71.Gift.Visible = false
				else
					v_u_71.Buy.Visible = true
					v_u_71.Gift.Visible = true
					v_u_71.Stock.Text = ("%* / 500"):format(v_u_69.Value)
				end
			end)
			v_u_11:SetPriceLabel(v_u_71.Buy, v_u_29.ChristmasLimitedSeed.PurchaseID)
		else
			v_u_71.Visible = false
		end
	else
		return
	end
end
function v_u_43._initSaintPatricksPack(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_42, (copy) v_u_11, (copy) v_u_14, (copy) v_u_12, (copy) v_u_31, (copy) v_u_28, (copy) v_u_18
	if v_u_30:GetData() then
		local v_u_72 = v_u_42.Frame.ScrollingFrame.SaintPatricksPack
		v_u_72.Visible = true
		v_u_72.Buy.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_14
			v_u_11:PromptPurchase(v_u_14.ProductId, Enum.InfoType.Product)
		end)
		if v_u_12 then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_72.Buy.Cost:GetFullName()))))
			end
			v_u_11:SetPriceLabel(v_u_72.Buy, v_u_14.ProductId)
		else
			v_u_72.Buy.Text = ("<font size=\"19\"><font weight=\"400\">%*</font>%*</font>"):format(utf8.char(57346), (v_u_31.Comma(1199)))
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_28, (copy) v_u_72, (ref) v_u_14, (ref) v_u_18
			while not v_u_28:IsHiddenAfterUpdate("Saint Patricks") do
				local v73 = v_u_14.EndTime.UnixTimestamp - workspace:GetServerTimeNow()
				v_u_72.bg.Timer.Text = v_u_18.formatShopTime(v73)
				v_u_72.Visible = v73 > 0
				task.wait(1)
			end
			v_u_72.Visible = false
		end)
	end
end
local v_u_74 = v_u_42.Frame.ScrollingFrame.ExoticPack
v_u_74.Visible = false
local v_u_75 = {}
function v_u_43._createExoticPack(_, p_u_76, p77)
	-- upvalues: (copy) v_u_75, (copy) v_u_33, (copy) v_u_42, (copy) v_u_74, (copy) v_u_32, (copy) v_u_9, (copy) v_u_10, (copy) v_u_23, (copy) v_u_7, (copy) v_u_17, (copy) v_u_3, (copy) v_u_11, (copy) v_u_30, (copy) v_u_41, (copy) v_u_12, (copy) v_u_31, (copy) v_u_15, (copy) v_u_18
	local v_u_78 = v_u_75[p77]
	if v_u_78 then
		v_u_78:Clean()
	else
		v_u_78 = v_u_33.new()
		v_u_75[p77] = v_u_78
	end
	local v_u_79 = v_u_42.Frame.ScrollingFrame:FindFirstChild((("ExoticPack%*"):format(p77)))
	if not v_u_79 then
		v_u_79 = v_u_78:Clone(v_u_74)
		v_u_79.LayoutOrder = p77
		v_u_79.Parent = v_u_42.Frame.ScrollingFrame
	end
	v_u_79.Visible = true
	v_u_78:Add(function()
		-- upvalues: (ref) v_u_79
		v_u_79.Visible = false
	end)
	v_u_78:Add(v_u_79.Destroying:Once(function()
		-- upvalues: (ref) v_u_78
		v_u_78:Destroy()
	end))
	local v80
	if p_u_76.Pity then
		v80 = v_u_32[p_u_76.Pity]
	else
		v80 = nil
	end
	local v81 = {}
	local v82 = {}
	local v83 = {}
	for v84, v_u_85 in p_u_76.Items do
		local v86
		if p_u_76.BiggerTemplateIndex <= v84 then
			v86 = v_u_79.List.UIListLayout.TemplateBigger
		elseif p_u_76.MidTemplateIndex <= v84 or #p_u_76.Items <= 5 then
			v86 = v_u_79.List.UIListLayout.TemplateMid
		else
			v86 = v_u_79.List.UIListLayout.TemplateSmaller
		end
		local v_u_87 = v_u_78:Clone(v86)
		if v86 == v_u_79.List.UIListLayout.TemplateSmaller then
			table.insert(v82, v_u_87)
		elseif v86 == v_u_79.List.UIListLayout.TemplateMid then
			table.insert(v83, v_u_87)
		elseif v86 == v_u_79.List.UIListLayout.TemplateBigger then
			table.insert(v81, v_u_87)
		end
		local v88 = v_u_87.Odds
		local v89 = v_u_85.Chance * 100
		v88.Text = ("%*%%"):format(math.floor(v89) / 100)
		if v_u_85.Type == "Pack" then
			v_u_87.OddsButton.Visible = true
			v_u_78:Add(v_u_87.OddsButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (copy) v_u_85, (ref) v_u_42, (copy) p_u_76
				v_u_9:Open(v_u_85.RewardId, v_u_42, p_u_76.Pity)
			end))
		elseif v_u_85.Type == "Egg" then
			v_u_87.OddsButton.Visible = true
			v_u_78:Add(v_u_87.OddsButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_10, (copy) v_u_85, (ref) v_u_42, (copy) p_u_76
				v_u_10:Open(v_u_85.RewardId, v_u_42, p_u_76.Pity)
			end))
		else
			v_u_87.OddsButton.Visible = false
		end
		if v80 then
			local v90 = 0
			for _, v91 in v80.Items do
				if v91.RewardId == v_u_85.RewardId and v91.Type == v_u_85.Type then
					v90 = v91.Pity
					break
				end
			end
			if v90 > 0 then
				local v92 = v_u_87.Pity
				v92.Text = ("%**"):format(v90)
				v92.Visible = true
				v_u_23:AddGuiObject(v_u_87, v90, v80.DisplayPlural)
				v_u_78:Add(function()
					-- upvalues: (ref) v_u_23, (copy) v_u_87
					v_u_23:RemoveGuiObject(v_u_87)
				end)
			end
		end
		local v93 = v_u_87:FindFirstChild("VectorHolder") and v_u_87.VectorHolder:FindFirstChild("Vector") or v_u_87:FindFirstChild("Vector")
		if v_u_85.Icon then
			v93.Image = v_u_85.Icon
			if string.find(v_u_85.RewardId, "GIANT") then
				v93.Size = UDim2.fromScale(1.5, 1.5)
			end
			v93.Visible = true
		else
			local v94 = v_u_7[v_u_85.RewardId]
			if v94 and v94.Asset then
				v93.Visible = true
				v93.Image = v94.Asset
			end
		end
		if p_u_76.Title == "EXOTIC KITSUNE CHEST!" then
			v_u_87.Size = UDim2.fromScale(v_u_87.Size.X.Scale * 0.95, v_u_87.Size.Y.Scale * 0.95)
		end
		if v_u_85.RewardId == "Sunflower" or v_u_85.RewardId == "Shedletsky Gnome" then
			v_u_87.Odds.TextColor3 = Color3.fromRGB(255, 204, 1)
		elseif p_u_76.BiggerTemplateIndex <= v84 then
			local v95 = v_u_17:GetStateForGui(v_u_42)
			local v_u_96 = nil
			v_u_78:Add(v95.Visible:Observe(function(p97)
				-- upvalues: (ref) v_u_96, (ref) v_u_3, (copy) v_u_87
				if p97 then
					if not v_u_96 then
						v_u_96 = v_u_3.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_87
							v_u_87.Odds.TextColor3 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
						end)
						return
					end
				elseif v_u_96 then
					v_u_96:Disconnect()
					v_u_96 = nil
				end
			end))
			v_u_78:Add(function()
				-- upvalues: (ref) v_u_96
				if v_u_96 then
					v_u_96:Disconnect()
					v_u_96 = nil
				end
			end)
		end
		v_u_87.Parent = v_u_79.List
	end
	if p_u_76.Title == "EXOTIC SANTA\'S SURPRISE PRESENT!" then
		local v98 = v_u_78:Add(Instance.new("Frame"))
		v98.Name = "Sub"
		v98.BackgroundTransparency = 1
		v98.Size = UDim2.fromScale(1.3, 1.3)
		local v99 = v_u_78:Add(Instance.new("UIGridLayout"))
		v99.Name = "UIGridLayout"
		v99.CellPadding = UDim2.fromOffset(2, 2)
		v99.CellSize = UDim2.fromScale(0.45, 0.45)
		v99.HorizontalAlignment = Enum.HorizontalAlignment.Right
		v99.SortOrder = Enum.SortOrder.LayoutOrder
		v_u_78:Add(Instance.new("UIAspectRatioConstraint")).Parent = v99
		v99.Parent = v98
		local v100 = v_u_78:Add(Instance.new("UIAspectRatioConstraint"))
		v100.Name = "UIAspectRatioConstraint"
		v100.AspectRatio = 1.54
		v100.Parent = v98
		for _, v101 in v82 do
			v101.Parent = v98
		end
		v98.Parent = v_u_79.List
		for _, v102 in v83 do
			v102.Size = UDim2.fromScale(1.2, 1.2)
		end
		for _, v103 in v81 do
			v103.Size = UDim2.fromScale(1.3, 1.3)
		end
		local v_u_104 = v_u_79.List.Size
		local v_u_105 = v_u_79.List.Position
		local v_u_106 = v_u_79.List.UIListLayout.Padding
		v_u_79.List.Size = UDim2.fromScale(0.732, 0.3)
		v_u_79.List.Position = UDim2.fromScale(0.61, 0.4)
		v_u_79.List.UIListLayout.Padding = UDim.new(0.012, 0)
		v_u_78:Add(function()
			-- upvalues: (ref) v_u_79, (ref) v_u_42, (copy) v_u_104, (copy) v_u_105, (copy) v_u_106
			if v_u_79:IsDescendantOf(v_u_42) then
				v_u_79.List.Size = v_u_104
				v_u_79.List.Position = v_u_105
				v_u_79.List.UIListLayout.Padding = v_u_106
			end
		end)
	end
	v_u_11:RemovePriceLabel(v_u_79.Buttons.Buy1)
	local v_u_107 = nil
	local v_u_108 = nil
	local v_u_109 = v_u_78:Extend()
	local function v_u_114()
		-- upvalues: (copy) v_u_109, (ref) v_u_30, (ref) v_u_107, (ref) v_u_108, (ref) v_u_79, (ref) v_u_41, (copy) p_u_76
		v_u_109:Clean()
		v_u_30:GetData()
		if v_u_107 then
			v_u_107.Visible = true
		end
		if v_u_108 then
			v_u_108.Visible = true
		end
		local v_u_110 = v_u_79.Buttons.Position
		v_u_79.Buttons.Position = UDim2.fromScale(0.4, 0.79)
		v_u_109:Add(function()
			-- upvalues: (ref) v_u_79, (ref) v_u_41, (copy) v_u_110
			if v_u_79:FindFirstChild("Buttons") and v_u_79:IsDescendantOf(v_u_41) then
				v_u_79.Buttons.Position = v_u_110
			end
		end)
		for v111 in p_u_76.Products do
			local v_u_112 = v_u_79.Buttons:FindFirstChild((("Buy%*"):format(v111)))
			if v_u_112 then
				local v_u_113 = v_u_112.Size
				v_u_112.Size = UDim2.fromScale(0.22, 0.9)
				v_u_109:Add(function()
					-- upvalues: (copy) v_u_112, (copy) v_u_113
					v_u_112.Size = v_u_113
				end)
			end
		end
	end
	local v_u_115, v116
	if p_u_76.Products[50] then
		local v117 = v_u_78:Clone(v_u_79.Buttons.Buy10)
		v117.Name = "Buy50"
		v117.LayoutOrder = v_u_79.Buttons.Gift10.LayoutOrder + 1
		v117.Parent = v_u_79.Buttons
		v_u_107 = v117
		local v118 = v_u_78:Clone(v_u_79.Buttons.Gift10)
		v118.Name = "Gift50"
		v118.LayoutOrder = v117.LayoutOrder + 1
		v118.Parent = v_u_79.Buttons
		v_u_108 = v118
		v_u_115 = v_u_107
		v116 = v_u_108
	else
		v_u_115 = v_u_107
		v116 = v_u_108
	end
	v_u_78:Add(task.spawn(function()
		-- upvalues: (ref) v_u_78, (ref) v_u_30, (copy) v_u_114
		v_u_78:Add(v_u_30:GetPathSignal("TotalRobuxSpent"):Connect(function()
			-- upvalues: (ref) v_u_114
			v_u_114()
		end))
		v_u_78:Add(v_u_30:GetPathSignal("Transactions/@"):Connect(function()
			-- upvalues: (ref) v_u_114
			v_u_114()
		end))
	end))
	v_u_78:Add(task.spawn(v_u_114))
	for v119, v_u_120 in p_u_76.Products do
		local v121 = v_u_79.Buttons:FindFirstChild((("Buy%*"):format(v119)))
		if v121 then
			if v_u_12 or p_u_76.FallbackPrices[v119] == nil then
				if not v_u_12 then
					warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v121:GetFullName()))))
				end
				v_u_11:SetPriceLabel(v121, v_u_120)
			else
				local v122 = p_u_76.FallbackPrices[v119]
				v121.Text = ("<font size=\"19\"><font weight=\"400\">%*</font>%*</font>"):format(utf8.char(57346), (v_u_31.Comma(v122)))
			end
			local v123 = v121.Amount
			local v124 = "%* %*"
			local v125
			if v119 == 1 then
				v125 = p_u_76.Display
			else
				v125 = p_u_76.DisplayPlural
			end
			v123.Text = v124:format(v119, v125)
			v_u_78:Add(v121.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (copy) v_u_120
				v_u_11:PromptPurchase(v_u_120, Enum.InfoType.Product)
			end))
		end
	end
	v_u_78:Add(task.spawn(function()
		-- upvalues: (ref) v_u_79, (ref) v_u_115, (ref) v_u_12, (copy) p_u_76, (ref) v_u_11, (ref) v_u_31
		v_u_79.Buttons.Buy10.TextLabel.Visible = false
		if v_u_115 then
			v_u_115.TextLabel.Visible = false
		end
		if v_u_12 or p_u_76.FallbackPrices[1] == nil then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_79.Buttons.Buy10:GetFullName()))))
			end
			local v126, v127 = v_u_11:GetProductInfo(p_u_76.Products[1], Enum.InfoType.Product)
			if not v126 then
				return
			end
			v_u_79.Buttons.Buy10.TextLabel.Text = v_u_31.Comma(v127.PriceInRobux * 10)
			if v_u_115 then
				v_u_115.TextLabel.Text = v_u_31.Comma(v127.PriceInRobux * 50)
			end
		else
			v_u_79.Buttons.Buy10.TextLabel.Text = v_u_31.Comma(p_u_76.FallbackPrices[1] * 10)
			if v_u_115 then
				v_u_115.TextLabel.Text = v_u_31.Comma(p_u_76.FallbackPrices[1] * 50)
			end
		end
		v_u_79.Buttons.Buy10.TextLabel.Visible = true
		if v_u_115 then
			v_u_115.TextLabel.Visible = true
		end
	end))
	v_u_78:Add(v_u_79.Buttons.Gift1.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_76
		v_u_15:PromptGiftFromGiftId(p_u_76.GiftProducts[1])
	end))
	v_u_78:Add(v_u_79.Buttons.Gift3.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_76
		v_u_15:PromptGiftFromGiftId(p_u_76.GiftProducts[3])
	end))
	v_u_78:Add(v_u_79.Buttons.Gift10.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_76
		v_u_15:PromptGiftFromGiftId(p_u_76.GiftProducts[10])
	end))
	if v116 and p_u_76.GiftProducts[50] ~= nil then
		v_u_78:Add(v116.Activated:Connect(function()
			-- upvalues: (ref) v_u_15, (copy) p_u_76
			v_u_15:PromptGiftFromGiftId(p_u_76.GiftProducts[50])
		end))
	end
	v_u_78:Add(task.spawn(function()
		-- upvalues: (copy) p_u_76, (ref) v_u_79, (ref) v_u_18
		while true do
			local v128 = p_u_76.EndTime.UnixTimestamp - workspace:GetServerTimeNow()
			v_u_79.Timer.Text = v_u_18.formatShopTime(v128)
			if v128 <= 0 then
				v_u_79.Visible = false
			end
			task.wait(1)
		end
	end))
	v_u_79.Title.Text = p_u_76.Title
	v_u_79.Title.TitleShadow.Text = p_u_76.Title
	v_u_79.Image = p_u_76.BackgroundImage or "rbxassetid://138776814412466"
	v_u_79.Vector.Image = p_u_76.Vector
	v_u_79.Vector.Position = p_u_76.VectorPosition
	v_u_79.Vector.Size = p_u_76.VectorSize
	return v_u_79
end
function v_u_43._destroyExoticPack(_, p129)
	-- upvalues: (copy) v_u_75
	local v130 = v_u_75[p129]
	if v130 then
		v130:Destroy()
		v_u_75[p129] = nil
	end
end
local function v_u_196(p_u_131)
	-- upvalues: (copy) v_u_42, (copy) v_u_30, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_19, (copy) v_u_1, (copy) v_u_26, (copy) v_u_27, (copy) v_u_22, (copy) v_u_12, (copy) v_u_11, (copy) v_u_31, (copy) v_u_18, (copy) v_u_25
	local _ = v_u_42.Frame.ScrollingFrame.Infinite
	local v_u_132 = p_u_131 == "DEFAULT" or v_u_42.Frame.ScrollingFrame[("Infinite_%*"):format(p_u_131)]
	if v_u_132 then
		v_u_132.Visible = true
		local v_u_133 = v_u_132.INF.Holder
		local v_u_134 = v_u_133.Template
		local v_u_135 = nil
		local v_u_136 = Instance.new("NumberValue")
		local function v_u_167()
			-- upvalues: (ref) v_u_30, (copy) p_u_131, (ref) v_u_6, (ref) v_u_4, (ref) v_u_5, (ref) v_u_19, (copy) v_u_136, (copy) v_u_133, (copy) v_u_134, (ref) v_u_1, (ref) v_u_26, (ref) v_u_27, (ref) v_u_22, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
			local v_u_137 = v_u_30:GetData()
			if v_u_137 then
				local _ = v_u_137.InfinitePack.Depth
				local v138 = p_u_131 == "DEFAULT" or v_u_137.EventInfinitePack[p_u_131].Depth
				if v138 then
					local v139 = v_u_6.GetRewardsAsync(v_u_4.LocalPlayer, v_u_137.InfinitePack.Day, v138 + 5)
					if p_u_131 ~= "DEFAULT" then
						v139 = v_u_5.GetRewards(v_u_4.LocalPlayer, v_u_137.EventInfinitePack[p_u_131].Day, v138 + 5)
					end
					v_u_19(v_u_136, TweenInfo.new(0.2), {
						["Value"] = v138
					})
					for _, v_u_140 in v_u_133:GetChildren() do
						local v141 = v_u_140.Name
						local v142 = tonumber(v141)
						if v142 and v142 <= v138 then
							task.delay(0.2, function()
								-- upvalues: (copy) v_u_140
								v_u_140:Destroy()
							end)
						end
					end
					local v143 = #v139 - 5 + 1
					for v_u_144 = math.max(v143, 1), #v139 do
						local v145 = v139[v_u_144]
						local v_u_146 = v_u_133:FindFirstChild((tostring(v_u_144)))
						if not v_u_146 then
							v_u_146 = v_u_134:Clone()
							v_u_146.Name = tostring(v_u_144)
							v_u_146.Position = UDim2.fromScale((v_u_144 - 1) * 0.38, 0)
							v_u_146.LayoutOrder = v_u_144
							v_u_146.ZIndex = #v139 - v_u_144
							v_u_146.Position = UDim2.fromScale((v_u_144 - 1) * 0.38, 0)
							v_u_146.Visible = true
							local v_u_147 = v145.ProductId or 0
							if v_u_147 ~= 0 then
								v_u_146.CLAIM_BUTTON:Destroy()
								v_u_146.RBX_BUTTON.Name = "CLAIM_BUTTON"
							end
							v_u_146.CLAIM_BUTTON.SENSOR.Activated:Connect(function()
								-- upvalues: (ref) v_u_137, (ref) v_u_30, (ref) p_u_131, (copy) v_u_144, (ref) v_u_1
								v_u_137 = v_u_30:GetData()
								if p_u_131 == "DEFAULT" then
									if v_u_137.InfinitePack.Depth + 1 == v_u_144 then
										v_u_1.GameEvents.InfinitePack.Claim:FireServer()
									end
								elseif v_u_137.EventInfinitePack[p_u_131].Depth + 1 == v_u_144 then
									v_u_1.GameEvents.InfinitePack.EventClaim:FireServer()
								end
							end)
							if v145 then
								local v148 = v145.Rewards[1]
								v_u_146.IMAGE_CONTAINER.ITEM_IMAGE.Image = v_u_26(v148.RewardName, v148.Type)
								local v149 = ("%*%*"):format(v_u_27(v148.RewardName, v148.Type) or v148.RewardName, v148.Amount <= 1 and "" or (" x%*"):format(v148.Amount))
								v_u_146.IMAGE_CONTAINER.RewardName.Text = v149
								local v150 = v_u_22:GetRarityColor({
									["Type"] = v148.Type,
									["Value"] = v148.RewardName or "Normal",
									["Quantity"] = v148.Amount or 1
								})
								local v151 = v150 or Color3.fromRGB(127, 127, 127)
								local v152 = v_u_146.IMAGE_CONTAINER
								local v153, v154, v155 = v150:ToHSV()
								local v156 = Color3.fromHSV
								local v157 = v155 / 1.3
								v152.BackgroundColor3 = v156(v153, v154, (math.clamp(v157, 0, 1)))
								local v158 = v_u_146.IMAGE_CONTAINER.RewardName
								local v159, v160, v161 = v151:ToHSV()
								local v162 = Color3.fromHSV
								local v163 = v161 / 3
								v158.TextStrokeColor3 = v162(v159, v160, (math.clamp(v163, 0, 1)))
							end
							v_u_146.Parent = v_u_133
							local v_u_166 = task.spawn(function()
								-- upvalues: (ref) p_u_131, (ref) v_u_5, (copy) v_u_147, (ref) v_u_6, (copy) v_u_146, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
								local v164 = p_u_131 ~= "DEFAULT" and v_u_5.FallbackPrices[v_u_147] or v_u_6.FallbackPrices[v_u_147]
								if v_u_147 == 0 then
									v_u_146.CLAIM_BUTTON.CLAIM.Text = "FREE"
									v_u_146.CLAIM_BUTTON.CLAIM_BUTTON.Text = "FREE"
									return
								elseif v_u_12 or v164 == nil then
									if not v_u_12 then
										warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_146:GetFullName()))))
									end
									v_u_11:SetPriceLabel(v_u_146.CLAIM_BUTTON.CLAIM, v_u_147)
									v_u_11:SetPriceLabel(v_u_146.CLAIM_BUTTON.CLAIM_BUTTON, v_u_147)
									v_u_11:SetPriceLabel(v_u_146.CLAIM_BUTTON_DISABLED.CLAIM, v_u_147)
									v_u_11:SetPriceLabel(v_u_146.CLAIM_BUTTON_DISABLED.CLAIM_BUTTON, v_u_147)
								else
									local v165 = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v164)))
									v_u_146.CLAIM_BUTTON.CLAIM.Text = v165
									v_u_146.CLAIM_BUTTON.CLAIM_BUTTON.Text = v165
									v_u_146.CLAIM_BUTTON_DISABLED.CLAIM.Text = v165
									v_u_146.CLAIM_BUTTON_DISABLED.CLAIM_BUTTON.Text = v165
								end
							end)
							v_u_146.Destroying:Once(function()
								-- upvalues: (copy) v_u_166
								if coroutine.status(v_u_166) == "suspended" then
									pcall(task.cancel, v_u_166)
								end
							end)
						end
						v_u_146.ZIndex = #v139 - v_u_144
						if v_u_144 == (p_u_131 ~= "DEFAULT" and v_u_137.EventInfinitePack[p_u_131].Depth or v_u_137.InfinitePack.Depth) + 1 then
							v_u_146.CLAIM_BUTTON.Visible = true
							v_u_146.CLAIM_BUTTON_DISABLED.Visible = false
						else
							v_u_146.CLAIM_BUTTON.Visible = false
							v_u_146.CLAIM_BUTTON_DISABLED.Visible = true
						end
					end
				else
					warn("Current Infinite Pack type Data does not exist!")
				end
			else
				return
			end
		end
		local function v168()
			-- upvalues: (copy) v_u_133, (copy) v_u_136
			v_u_133.Position = UDim2.fromScale(-0.38 * v_u_136.Value, 0)
		end
		local v_u_169 = nil
		local function v173()
			-- upvalues: (ref) v_u_169, (copy) v_u_133, (copy) v_u_136
			if v_u_169 and coroutine.status(v_u_169) == "suspended" then
				task.cancel(v_u_169)
			end
			v_u_169 = task.delay(0.1, function()
				-- upvalues: (ref) v_u_133, (ref) v_u_136, (ref) v_u_169
				v_u_133.Position = UDim2.fromScale(-0.38 * v_u_136.Value, 0)
				for _, v170 in v_u_133:GetChildren() do
					local v171 = v170.Name
					local v172 = tonumber(v171)
					if v172 then
						v170.Position = UDim2.fromScale((v172 - 1) * 0.38, 0)
					end
				end
				v_u_169 = nil
			end)
		end
		local function v_u_178()
			-- upvalues: (ref) v_u_30, (copy) p_u_131, (ref) v_u_135, (copy) v_u_133, (copy) v_u_167
			local v174 = v_u_30:GetData()
			if v174 then
				local v175 = p_u_131 ~= "DEFAULT" and v174.EventInfinitePack[p_u_131].Day or v174.InfinitePack.Day
				if v_u_135 ~= v175 then
					for _, v176 in v_u_133:GetChildren() do
						if v176:IsA("GuiObject") then
							local v177 = v176.Name
							if tonumber(v177) then
								v176:Destroy()
							end
						end
					end
					v_u_135 = v175
					v_u_167()
				end
			else
				return
			end
		end
		v_u_136.Changed:Connect(v168)
		task.spawn(v168)
		v_u_133:GetPropertyChangedSignal("AbsoluteSize"):Connect(v173)
		task.spawn(v173)
		task.spawn(function()
			-- upvalues: (copy) v_u_178, (copy) p_u_131, (ref) v_u_30, (copy) v_u_167
			task.spawn(v_u_178)
			if p_u_131 == "DEFAULT" then
				local v179 = v_u_30
				assert(v179:GetPathSignal("InfinitePack/@")):Connect(function()
					-- upvalues: (ref) v_u_178, (ref) v_u_167
					v_u_178()
					v_u_167()
				end)
			else
				local v180 = v_u_30
				local v181 = ("EventInfinitePack/%*/@"):format(p_u_131)
				assert(v180:GetPathSignal(v181)):Connect(function()
					-- upvalues: (ref) v_u_178, (ref) v_u_167
					v_u_178()
					v_u_167()
				end)
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_18, (ref) v_u_132
			while true do
				local v182 = workspace:GetServerTimeNow()
				local v183 = (v182 // 86400 + 1) * 86400 - v182
				local v184 = v_u_18.compactFormat(v183)
				v_u_132.Header.Timer.Text = v184
				v_u_132.Header.Timer.TimerShadow.Text = v184
				task.wait(1)
			end
		end)
		local v185 = v_u_132.PossibleRewardsContainer:FindFirstChild("ForeverPackRewards")
		for _, v186 in v_u_132.PossibleRewardsContainer:GetChildren() do
			if string.match(v186.Name, "ForeverPackRewards") then
				v185 = v186
			end
		end
		local v187 = v185.REWARD_IMAGE
		v185.Visible = false
		local v188 = {}
		local v189 = v_u_6.Rewards
		if p_u_131 ~= "DEFAULT" then
			v189 = v_u_5.Rewards
		end
		if v189 then
			for _, v190 in v189.Free do
				if v190.Type then
					if v187 then
						local v191 = {
							["Type"] = v190.Type,
							["Value"] = v190.RewardName or "Normal",
							["Quantity"] = v190.Amount or 1
						}
						table.insert(v188, v191)
					end
				else
					warn("No reward type")
				end
			end
			for _, v192 in v189.Paid do
				if v192.Type then
					if v187 then
						local v193 = {
							["Type"] = v192.Type,
							["Value"] = v192.RewardName or "Normal",
							["Quantity"] = v192.Amount or 1
						}
						table.insert(v188, v193)
					end
				else
					warn("No reward type")
				end
			end
			local v194 = v185.ITEM_NAME.REWARD_NAME
			local v195 = v185.ITEM_NAME.REWARD_NAME_SHADOW
			v_u_25.CycleRewardImages(v187, v194, v195, v185, v188)
			v185.Visible = true
		else
			warn("Current Infinite Pack Type [packRewards] does not exist!")
		end
	else
		warn("Current Infinite Pack type UI does not exist!")
		return
	end
end
function v_u_43._initInfinitePack(_)
	-- upvalues: (copy) v_u_196
	v_u_196("DEFAULT")
end
function v_u_43._initEventInfinitePack(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_196
	local v197 = v_u_5.CurrentPack
	if v197 then
		v_u_196(v197)
	end
end
function v_u_43._initSheckles(_)
	-- upvalues: (copy) v_u_42, (copy) v_u_11, (copy) v_u_15, (copy) v_u_12, (copy) v_u_31
	for _, v198 in v_u_42.Frame.ScrollingFrame.Sheckles.List:GetChildren() do
		if v198:IsA("GuiObject") then
			local v199 = v198.Name
			local v_u_200 = tonumber(v199)
			if v_u_200 then
				v198.Buttons.Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_11, (copy) v_u_200
					v_u_11:PromptPurchase(v_u_200, Enum.InfoType.Product)
				end)
				v198.Buttons.Gift.Activated:Connect(function()
					-- upvalues: (ref) v_u_15, (copy) v_u_200
					v_u_15:PromptGiftFromNormalId(v_u_200)
				end)
				if v_u_12 or type(v198:GetAttribute("FallbackPrice")) ~= "number" then
					if not v_u_12 then
						warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v198.Buttons.Buy:GetFullName()))))
					end
					v_u_11:SetPriceLabel(v198.Buttons.Buy, v_u_200)
				else
					v198.Buttons.Buy.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v198:GetAttribute("FallbackPrice"))))
				end
			end
		end
	end
end
function v_u_43._initPetProducts(_)
	-- upvalues: (copy) v_u_42, (copy) v_u_30, (copy) v_u_37, (copy) v_u_12, (copy) v_u_11, (copy) v_u_31, (copy) v_u_20
	for _, v_u_201 in v_u_42.Frame.ScrollingFrame.PetProducts.List:GetChildren() do
		if v_u_201:IsA("GuiObject") and v_u_201.Name ~= "Free" then
			local v_u_202 = v_u_201:FindFirstChild("DataType").Value
			local v203 = ("PetsData/%*"):format(v_u_202)
			local v_u_204 = v_u_30:GetData().PetsData[v_u_202]
			local v_u_205 = v_u_37[v_u_201.Name][v_u_204 + 1]
			local v_u_206
			if v_u_205 then
				v_u_206 = v_u_205.ProductId
			else
				v_u_206 = nil
			end
			local v_u_207 = 0
			local function v209()
				-- upvalues: (ref) v_u_207, (ref) v_u_204, (ref) v_u_30, (copy) v_u_202, (ref) v_u_205, (ref) v_u_37, (copy) v_u_201, (ref) v_u_206, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
				v_u_207 = v_u_207 + 1
				v_u_204 = v_u_30:GetData().PetsData[v_u_202]
				v_u_205 = v_u_37[v_u_201.Name][v_u_204 + 1]
				local v208
				if v_u_205 then
					v208 = v_u_205.ProductId
				else
					v208 = nil
				end
				v_u_206 = v208
				if v_u_204 < 5 then
					if v_u_12 or v_u_205.FallbackPrice == nil then
						if not v_u_12 then
							warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_201:GetFullName()))))
						end
						v_u_11:SetPriceLabel(v_u_201.Buttons.Buy, v_u_206)
					else
						v_u_201.Buttons.Buy.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v_u_205.FallbackPrice)))
					end
				else
					v_u_201.Buttons.Buy.Text = "MAX!"
				end
				v_u_201.Amount.Text = ("%*/5 Extra!"):format(v_u_204)
			end
			local v210 = v_u_30
			assert(v210:GetPathSignal(v203)):Connect(v209)
			v209()
			v_u_201.Buttons.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_204, (ref) v_u_20, (ref) v_u_30, (copy) v_u_202, (ref) v_u_206, (ref) v_u_37, (copy) v_u_201, (ref) v_u_11
				if v_u_204 >= 5 then
					v_u_20:CreateNotification("Maximum Slots Purchased!")
				else
					v_u_204 = v_u_30:GetData().PetsData[v_u_202]
					v_u_206 = v_u_37[v_u_201.Name][v_u_204 + 1].ProductId
					v_u_11:PromptPurchase(v_u_206, Enum.InfoType.Product)
				end
			end)
		end
	end
end
function v_u_43._initFarmersMarket(_)
	-- upvalues: (copy) v_u_42, (copy) v_u_30, (copy) v_u_20, (copy) v_u_11, (copy) v_u_29, (copy) v_u_12, (copy) v_u_31
	if v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible then
		warn((("[%*]: Tried to initialise an already initialised group in Shop_UI : [FarmersMarket]"):format(script.Name)))
	else
		v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible = true
		local v_u_211 = v_u_30:GetData()
		local v212 = v_u_42.Frame.ScrollingFrame.FarmersMarket.Frame
		local v_u_213 = v212.Buy
		local function v_u_215()
			-- upvalues: (copy) v_u_213
			v_u_213.Text = "Purchased"
			v_u_213.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
			for _, v214 in v_u_213:GetChildren() do
				if v214:IsA("UIStroke") then
					v214.Color = Color3.fromRGB(24, 24, 24)
				end
			end
		end
		local v_u_216 = nil
		v_u_216 = v_u_30:GetPathSignal("PermanentGears/@"):Connect(function()
			-- upvalues: (copy) v_u_211, (copy) v_u_215, (ref) v_u_42, (ref) v_u_216
			if v_u_211.PermanentGears["Booth Sign"] then
				v_u_215()
				v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible = false
				if v_u_216 then
					v_u_216:Disconnect()
					v_u_216 = nil
				end
			end
		end)
		v_u_213.Activated:Connect(function()
			-- upvalues: (copy) v_u_211, (ref) v_u_20, (ref) v_u_11, (ref) v_u_29
			if v_u_211.PermanentGears["Booth Sign"] then
				v_u_20:CreateNotification("You\'ve already bought a Trade Sign!")
			else
				v_u_11:PromptPurchaseRobux(v_u_29.BuyBoothPack.PurchaseID, Enum.InfoType.Product)
			end
		end)
		if v_u_211.PermanentGears["Booth Sign"] then
			v_u_215()
			v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible = false
		elseif v_u_12 then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v212:GetFullName()))))
			end
			v_u_11:SetPriceLabel(v_u_213, v_u_29.BuyBoothPack.PurchaseID)
		else
			v_u_213.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(149)))
		end
	end
end
function v_u_43._initDiggingTreasure(_)
	-- upvalues: (copy) v_u_8, (copy) v_u_42, (copy) v_u_1, (copy) v_u_36, (copy) v_u_40, (copy) v_u_11, (copy) v_u_29, (copy) v_u_17, (copy) v_u_24, (copy) v_u_30, (copy) v_u_26, (copy) v_u_18, (copy) v_u_34
	local v_u_217 = v_u_8.GetCurrentTheme()
	if v_u_217 ~= "DISABLED" then
		local v_u_218 = v_u_42.Frame.ScrollingFrame.GraveDiggerPack
		local v_u_219 = require(v_u_1.Data.SharedCycleHandlerData).PermanentDigging
		local v_u_220 = require(v_u_1.Data.DiggingMinigame.DiggingRewardData)
		v_u_218.Visible = true
		if v_u_36.GetAttributeAsync(v_u_40, "AB_DiggingTypes", "Default") == "No_Free" then
			v_u_218.OfflineText.Visible = false
		else
			v_u_218.OfflineText.Visible = true
		end
		v_u_11:SetPriceLabel(v_u_218.Buttons.Buy10, v_u_29.DiggingBuy10Digs.PurchaseID)
		v_u_11:SetPriceLabel(v_u_218.Buttons.Buy20, v_u_29.DiggingBuy20Digs.PurchaseID)
		v_u_218.Buttons.Buy10.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29
			v_u_11:PromptPurchase(v_u_29.DiggingBuy10Digs.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_218.Buttons.Buy20.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29
			v_u_11:PromptPurchase(v_u_29.DiggingBuy20Digs.PurchaseID, Enum.InfoType.Product)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29, (copy) v_u_218
			local v221, v222 = v_u_11:GetProductInfo(v_u_29.DiggingBuyDigs.PurchaseID, Enum.InfoType.Product, 3)
			local v223 = not (v221 and v222.PriceInRobux) and 236 or (v222.PriceInRobux or 59) * 4
			v_u_218.Buttons.Buy20.TextLabel.Text = v223
		end)
		v_u_218.Buttons.Go.Activated:Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_42, (ref) v_u_24
			v_u_17:Close(v_u_42)
			task.wait(0.5)
			v_u_24:Open()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_30, (copy) v_u_217, (copy) v_u_220, (copy) v_u_218, (ref) v_u_26, (copy) v_u_219, (ref) v_u_18, (ref) v_u_34
			local v224 = v_u_30:GetData()
			if v_u_217 == "DISABLED" then
				return
			end
			local v225 = v_u_220.RewardSets[v_u_217] or {}
			table.sort(v225, function(p226, p227)
				return p226.Chance < p227.Chance
			end)
			local v228 = #v225
			for v229 = math.min(4, v228), 1, -1 do
				local v230 = v_u_218.Rewards[("Segment%*"):format(v229)]
				if v230 then
					v230.RewardImage.Image = v_u_26(v225[v229].Value, v225[v229].Type)
				end
			end
			while true do
				local v231 = v_u_219:GetTimeUntilNext()
				if v231 then
					local v232 = v_u_18.compactFormat(v231)
					local v233 = "Resets in: " .. v_u_34.red((("%*"):format(v232)))
					v_u_218.Background.Top.RestocksIn.Timer.Text = v233
				end
				if v224 then
					local v234 = v224.DiggingData.RemainingDigs
					v_u_218.Buttons.Go.Amount.Text = ("(%*) Digs Available"):format(v234)
				end
				task.wait(1)
			end
		end)
	end
end
function v_u_43.Start(_)
	-- upvalues: (copy) v_u_17, (copy) v_u_42, (copy) v_u_16, (copy) v_u_40, (copy) v_u_28, (copy) v_u_43, (copy) v_u_21, (copy) v_u_30, (copy) v_u_2, (copy) v_u_39, (copy) v_u_8, (copy) v_u_5, (copy) v_u_1
	local v_u_235 = v_u_17:GetStateForGui(v_u_42)
	v_u_17:UsePopupAnims(v_u_42)
	v_u_42.Frame.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_42
		v_u_17:Close(v_u_42)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_40, (ref) v_u_28, (ref) v_u_43, (ref) v_u_21, (ref) v_u_30, (ref) v_u_2, (copy) v_u_235
		local v236 = v_u_16:GetPolicyInfoForPlayerAsync(v_u_40)
		if not (v236 and v236.ArePaidRandomItemsRestricted) then
			local v237 = v_u_28:IsHiddenFromUpdate("Shop Exotic Buttercup Chest")
			if v237 then
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_BIRD_EGG, 1)
				end, warn)
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_CARNIVAL_EGG, 2)
				end, warn)
			end
			v_u_30:GetData()
			if v237 then
				task.spawn(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_2
					local v238 = {}
					for _, v239 in v_u_21.EXOTIC_BUTTERCUP_CHEST.Items do
						if v239.Icon then
							local v240 = Instance.new("ImageLabel")
							v240.Image = v239.Icon
							table.insert(v238, v240)
						end
					end
					v_u_2:PreloadAsync(v238)
					for _, v241 in v238 do
						v241:Destroy()
					end
					table.clear(v238)
				end)
			end
			while v_u_28:IsHiddenFromUpdate("Shop Exotic Buttercup Chest") do
				task.wait(1)
			end
			xpcall(function()
				-- upvalues: (ref) v_u_43, (ref) v_u_21
				v_u_43:_createExoticPack(v_u_21.EXOTIC_BUTTERCUP_CHEST, 1)
			end, warn)
			xpcall(function()
				-- upvalues: (ref) v_u_43, (ref) v_u_21
				v_u_43:_createExoticPack(v_u_21.PREMIUM_BIRD_EGG, 2)
			end, warn)
			if v237 and not v_u_235.Visible:Get() then
				local v_u_242 = v_u_43:Notify()
				local v_u_243 = nil
				v_u_243 = v_u_235.Visible:Listen(function(p244)
					-- upvalues: (copy) v_u_242, (ref) v_u_43, (ref) v_u_243
					if p244 then
						if v_u_242 then
							v_u_43:ClearNotification(v_u_242)
						end
						if v_u_243 then
							v_u_243:Disconnect()
							v_u_243 = nil
						end
					end
				end)
			end
		end
	end)
	if v_u_39 then
		v_u_42.Frame.ScrollingFrame.Infinite.Visible = false
		if v_u_42.Frame.ScrollingFrame.CanvasSize.Y.Scale > 1.775 then
			v_u_42.Frame.ScrollingFrame.CanvasSize = UDim2.fromScale(0, 1.775)
		end
	else
		task.spawn(v_u_43._initInfinitePack, v_u_43)
	end
	v_u_42.Frame.ScrollingFrame.GraveDiggerPack.Visible = false
	if v_u_8.GetCurrentTheme() ~= "DISABLED" then
		task.spawn(v_u_43._initDiggingTreasure, v_u_43)
	end
	if v_u_28:IsUpdateDone() then
		if v_u_28:IsHiddenFromUpdate("Booth Sign") then
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initFarmersMarket()
			end)
		end
	else
		if v_u_5.CurrentPack and v_u_5.CurrentPack ~= "None" then
			task.spawn(v_u_43._initEventInfinitePack, v_u_43)
		end
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_42, (ref) v_u_8, (ref) v_u_43
			v_u_42.Frame.ScrollingFrame.GraveDiggerPack.Visible = false
			if v_u_8.GetCurrentTheme() ~= "DISABLED" then
				task.spawn(v_u_43._initDiggingTreasure, v_u_43)
			end
		end)
	end
	if v_u_28:IsHiddenFromUpdate("Shop/Seed Rain") then
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_43
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initSeedRain()
			end)
		end)
	else
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initSeedRain()
		end)
	end
	if v_u_28:IsHiddenFromUpdate("Shop/Super Seed Pack V1") then
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_43
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initSuperSeedPackV1()
			end)
		end)
	else
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initSuperSeedPackV1()
		end)
	end
	if v_u_28:IsHiddenFromUpdate("Shop/Super Seed Pack V2") then
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_43
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initSuperSeedPackV2()
			end)
		end)
	else
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initSuperSeedPackV2()
		end)
	end
	if v_u_28:IsHiddenFromUpdate("Shop/Christmas Limited Seed") then
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_43
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initChristmasLimitedSeed()
			end)
		end)
	else
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initChristmasLimitedSeed()
		end)
	end
	if v_u_28:IsHiddenFromUpdate("Shop/Farmers Market") then
		v_u_28.OnUpdated:Once(function()
			-- upvalues: (ref) v_u_43
			task.spawn(function()
				-- upvalues: (ref) v_u_43
				v_u_43:_initFarmersMarket()
			end)
		end)
	else
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initFarmersMarket()
		end)
	end
	task.spawn(v_u_43._initPetProducts, v_u_43)
	task.spawn(function()
		-- upvalues: (ref) v_u_42, (ref) v_u_43
		v_u_42.Frame.ScrollingFrame.TwilightPack.Visible = false
		v_u_43:_initTwilightPack()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_42, (ref) v_u_43
		v_u_42.Frame.ScrollingFrame.SaintPatricksPack.Visible = true
		v_u_43:_initSaintPatricksPack()
	end)
	local v245 = require(v_u_1.Data.TradeWorldData)
	if game.PlaceId == v245.PlaceId and true or v245.ForceInWorld == true then
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initFarmersMarket()
		end)
	end
end
task.spawn(v_u_43.Start, v_u_43)
return v_u_43