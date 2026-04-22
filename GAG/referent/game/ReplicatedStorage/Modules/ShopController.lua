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
function v_u_43._initRainbowShovelPack(_)
	-- upvalues: (copy) v_u_30, (copy) v_u_42, (copy) v_u_20, (copy) v_u_11, (copy) v_u_29, (copy) v_u_12, (copy) v_u_28, (copy) v_u_18
	local v74 = v_u_30:GetData()
	if v74 then
		local v_u_75 = v_u_42.Frame.ScrollingFrame.RainbowShovel
		v_u_75.Visible = true
		local v76 = v_u_30:GetData()
		if v76 and v76.PermanentGears["Rainbow Shovel"] then
			v_u_75.Buy.Text = "OWNED"
			v_u_75.Buy.Active = false
		end
		v_u_30:GetPathSignal("PermanentGears/@"):Connect(function()
			-- upvalues: (ref) v_u_30, (copy) v_u_75
			local v77 = v_u_30:GetData()
			if v77 and v77.PermanentGears["Rainbow Shovel"] then
				v_u_75.Buy.Text = "OWNED"
				v_u_75.Buy.Active = false
			end
		end)
		v_u_75.Buy.Activated:Connect(function()
			-- upvalues: (ref) v_u_30, (ref) v_u_20, (ref) v_u_11, (ref) v_u_29
			local v78 = v_u_30:GetData()
			if v78 and v78.PermanentGears["Rainbow Shovel"] then
				v_u_20:CreateNotification("You already own the Rainbow Shovel Pack!")
			else
				v_u_11:PromptPurchase(v_u_29.RainbowShovelPack.PurchaseID, Enum.InfoType.Product)
			end
		end)
		if not v74.PermanentGears["Rainbow Shovel"] and v_u_12 then
			v_u_11:SetPriceLabel(v_u_75.Buy, v_u_29.RainbowShovelPack.PurchaseID)
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_28, (copy) v_u_75, (ref) v_u_18
			while true do
				local v79 = v_u_28:GetRemainingTimeUntilUpdate()
				if v79 <= 0 then
					break
				end
				v_u_75.bg.Timer.Text = v_u_18.formatShopTime(v79)
				task.wait(1)
			end
			v_u_75.Visible = false
		end)
	end
end
local v_u_80 = v_u_42.Frame.ScrollingFrame.ExoticPack
v_u_80.Visible = false
local v_u_81 = {}
function v_u_43._createExoticPack(_, p_u_82, p83)
	-- upvalues: (copy) v_u_81, (copy) v_u_33, (copy) v_u_42, (copy) v_u_80, (copy) v_u_32, (copy) v_u_9, (copy) v_u_10, (copy) v_u_23, (copy) v_u_7, (copy) v_u_17, (copy) v_u_3, (copy) v_u_11, (copy) v_u_30, (copy) v_u_41, (copy) v_u_12, (copy) v_u_31, (copy) v_u_15, (copy) v_u_18
	local v_u_84 = v_u_81[p83]
	if v_u_84 then
		v_u_84:Clean()
	else
		v_u_84 = v_u_33.new()
		v_u_81[p83] = v_u_84
	end
	local v_u_85 = v_u_42.Frame.ScrollingFrame:FindFirstChild((("ExoticPack%*"):format(p83)))
	if not v_u_85 then
		v_u_85 = v_u_84:Clone(v_u_80)
		v_u_85.LayoutOrder = p83
		v_u_85.Parent = v_u_42.Frame.ScrollingFrame
	end
	v_u_85.Visible = true
	v_u_84:Add(function()
		-- upvalues: (ref) v_u_85
		v_u_85.Visible = false
	end)
	v_u_84:Add(v_u_85.Destroying:Once(function()
		-- upvalues: (ref) v_u_84
		v_u_84:Destroy()
	end))
	local v86
	if p_u_82.Pity then
		v86 = v_u_32[p_u_82.Pity]
	else
		v86 = nil
	end
	local v87 = {}
	local v88 = {}
	local v89 = {}
	for v90, v_u_91 in p_u_82.Items do
		local v92
		if p_u_82.BiggerTemplateIndex <= v90 then
			v92 = v_u_85.List.UIListLayout.TemplateBigger
		elseif p_u_82.MidTemplateIndex <= v90 or #p_u_82.Items <= 5 then
			v92 = v_u_85.List.UIListLayout.TemplateMid
		else
			v92 = v_u_85.List.UIListLayout.TemplateSmaller
		end
		local v_u_93 = v_u_84:Clone(v92)
		if v92 == v_u_85.List.UIListLayout.TemplateSmaller then
			table.insert(v88, v_u_93)
		elseif v92 == v_u_85.List.UIListLayout.TemplateMid then
			table.insert(v89, v_u_93)
		elseif v92 == v_u_85.List.UIListLayout.TemplateBigger then
			table.insert(v87, v_u_93)
		end
		local v94 = v_u_93.Odds
		local v95 = v_u_91.Chance * 100
		v94.Text = ("%*%%"):format(math.floor(v95) / 100)
		if v_u_91.Type == "Pack" then
			v_u_93.OddsButton.Visible = true
			v_u_84:Add(v_u_93.OddsButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (copy) v_u_91, (ref) v_u_42, (copy) p_u_82
				v_u_9:Open(v_u_91.RewardId, v_u_42, p_u_82.Pity)
			end))
		elseif v_u_91.Type == "Egg" then
			v_u_93.OddsButton.Visible = true
			v_u_84:Add(v_u_93.OddsButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_10, (copy) v_u_91, (ref) v_u_42, (copy) p_u_82
				v_u_10:Open(v_u_91.RewardId, v_u_42, p_u_82.Pity)
			end))
		else
			v_u_93.OddsButton.Visible = false
		end
		if v86 then
			local v96 = 0
			for _, v97 in v86.Items do
				if v97.RewardId == v_u_91.RewardId and v97.Type == v_u_91.Type then
					v96 = v97.Pity
					break
				end
			end
			if v96 > 0 then
				local v98 = v_u_93.Pity
				v98.Text = ("%**"):format(v96)
				v98.Visible = true
				v_u_23:AddGuiObject(v_u_93, v96, v86.DisplayPlural)
				v_u_84:Add(function()
					-- upvalues: (ref) v_u_23, (copy) v_u_93
					v_u_23:RemoveGuiObject(v_u_93)
				end)
			end
		end
		local v99 = v_u_93:FindFirstChild("VectorHolder") and v_u_93.VectorHolder:FindFirstChild("Vector") or v_u_93:FindFirstChild("Vector")
		if v_u_91.Icon then
			v99.Image = v_u_91.Icon
			if string.find(v_u_91.RewardId, "GIANT") then
				v99.Size = UDim2.fromScale(1.5, 1.5)
			end
			v99.Visible = true
		else
			local v100 = v_u_7[v_u_91.RewardId]
			if v100 and v100.Asset then
				v99.Visible = true
				v99.Image = v100.Asset
			end
		end
		if p_u_82.Title == "EXOTIC KITSUNE CHEST!" then
			v_u_93.Size = UDim2.fromScale(v_u_93.Size.X.Scale * 0.95, v_u_93.Size.Y.Scale * 0.95)
		end
		if v_u_91.RewardId == "Sunflower" or v_u_91.RewardId == "Shedletsky Gnome" then
			v_u_93.Odds.TextColor3 = Color3.fromRGB(255, 204, 1)
		elseif p_u_82.BiggerTemplateIndex <= v90 then
			local v101 = v_u_17:GetStateForGui(v_u_42)
			local v_u_102 = nil
			v_u_84:Add(v101.Visible:Observe(function(p103)
				-- upvalues: (ref) v_u_102, (ref) v_u_3, (copy) v_u_93
				if p103 then
					if not v_u_102 then
						v_u_102 = v_u_3.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_93
							v_u_93.Odds.TextColor3 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
						end)
						return
					end
				elseif v_u_102 then
					v_u_102:Disconnect()
					v_u_102 = nil
				end
			end))
			v_u_84:Add(function()
				-- upvalues: (ref) v_u_102
				if v_u_102 then
					v_u_102:Disconnect()
					v_u_102 = nil
				end
			end)
		end
		v_u_93.Parent = v_u_85.List
	end
	if p_u_82.Title == "EXOTIC SANTA\'S SURPRISE PRESENT!" then
		local v104 = v_u_84:Add(Instance.new("Frame"))
		v104.Name = "Sub"
		v104.BackgroundTransparency = 1
		v104.Size = UDim2.fromScale(1.3, 1.3)
		local v105 = v_u_84:Add(Instance.new("UIGridLayout"))
		v105.Name = "UIGridLayout"
		v105.CellPadding = UDim2.fromOffset(2, 2)
		v105.CellSize = UDim2.fromScale(0.45, 0.45)
		v105.HorizontalAlignment = Enum.HorizontalAlignment.Right
		v105.SortOrder = Enum.SortOrder.LayoutOrder
		v_u_84:Add(Instance.new("UIAspectRatioConstraint")).Parent = v105
		v105.Parent = v104
		local v106 = v_u_84:Add(Instance.new("UIAspectRatioConstraint"))
		v106.Name = "UIAspectRatioConstraint"
		v106.AspectRatio = 1.54
		v106.Parent = v104
		for _, v107 in v88 do
			v107.Parent = v104
		end
		v104.Parent = v_u_85.List
		for _, v108 in v89 do
			v108.Size = UDim2.fromScale(1.2, 1.2)
		end
		for _, v109 in v87 do
			v109.Size = UDim2.fromScale(1.3, 1.3)
		end
		local v_u_110 = v_u_85.List.Size
		local v_u_111 = v_u_85.List.Position
		local v_u_112 = v_u_85.List.UIListLayout.Padding
		v_u_85.List.Size = UDim2.fromScale(0.732, 0.3)
		v_u_85.List.Position = UDim2.fromScale(0.61, 0.4)
		v_u_85.List.UIListLayout.Padding = UDim.new(0.012, 0)
		v_u_84:Add(function()
			-- upvalues: (ref) v_u_85, (ref) v_u_42, (copy) v_u_110, (copy) v_u_111, (copy) v_u_112
			if v_u_85:IsDescendantOf(v_u_42) then
				v_u_85.List.Size = v_u_110
				v_u_85.List.Position = v_u_111
				v_u_85.List.UIListLayout.Padding = v_u_112
			end
		end)
	end
	v_u_11:RemovePriceLabel(v_u_85.Buttons.Buy1)
	local v_u_113 = nil
	local v_u_114 = nil
	local v_u_115 = v_u_84:Extend()
	local function v_u_123()
		-- upvalues: (copy) v_u_115, (ref) v_u_30, (copy) p_u_82, (ref) v_u_113, (ref) v_u_114, (ref) v_u_85, (ref) v_u_41
		v_u_115:Clean()
		local v116 = v_u_30:GetData()
		local v117 = false
		if p_u_82.Title == "PREMIUM GOLDEN EGG!" or p_u_82.Title == "PREMIUM SPRINGTIDE EGG!" then
			for _, v118 in v116.Transactions do
				if v118.ProductId == p_u_82.Products[10] then
					v117 = true
					break
				end
			end
		end
		if v_u_113 then
			v_u_113.Visible = v117
		end
		if v_u_114 then
			v_u_114.Visible = v117
		end
		if v117 then
			local v_u_119 = v_u_85.Buttons.Position
			v_u_85.Buttons.Position = UDim2.fromScale(0.4, 0.79)
			v_u_115:Add(function()
				-- upvalues: (ref) v_u_85, (ref) v_u_41, (copy) v_u_119
				if v_u_85:FindFirstChild("Buttons") and v_u_85:IsDescendantOf(v_u_41) then
					v_u_85.Buttons.Position = v_u_119
				end
			end)
			for v120 in p_u_82.Products do
				local v_u_121 = v_u_85.Buttons:FindFirstChild((("Buy%*"):format(v120)))
				if v_u_121 then
					local v_u_122 = v_u_121.Size
					v_u_121.Size = UDim2.fromScale(0.22, 0.9)
					v_u_115:Add(function()
						-- upvalues: (copy) v_u_121, (copy) v_u_122
						v_u_121.Size = v_u_122
					end)
				end
			end
		end
	end
	local v_u_124, v125
	if p_u_82.Products[50] then
		local v126 = v_u_84:Clone(v_u_85.Buttons.Buy10)
		v126.Name = "Buy50"
		v126.LayoutOrder = v_u_85.Buttons.Gift10.LayoutOrder + 1
		v126.Parent = v_u_85.Buttons
		v_u_113 = v126
		local v127 = v_u_84:Clone(v_u_85.Buttons.Gift10)
		v127.Name = "Gift50"
		v127.LayoutOrder = v126.LayoutOrder + 1
		v127.Parent = v_u_85.Buttons
		v_u_114 = v127
		v_u_124 = v_u_113
		v125 = v_u_114
	else
		v_u_124 = v_u_113
		v125 = v_u_114
	end
	v_u_84:Add(task.spawn(function()
		-- upvalues: (ref) v_u_84, (ref) v_u_30, (copy) v_u_123
		v_u_84:Add(v_u_30:GetPathSignal("TotalRobuxSpent"):Connect(function()
			-- upvalues: (ref) v_u_123
			v_u_123()
		end))
		v_u_84:Add(v_u_30:GetPathSignal("Transactions/@"):Connect(function()
			-- upvalues: (ref) v_u_123
			v_u_123()
		end))
	end))
	v_u_84:Add(task.spawn(v_u_123))
	for v128, v_u_129 in p_u_82.Products do
		local v130 = v_u_85.Buttons:FindFirstChild((("Buy%*"):format(v128)))
		if v130 then
			if v_u_12 or p_u_82.FallbackPrices[v128] == nil then
				if not v_u_12 then
					warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v130:GetFullName()))))
				end
				v_u_11:SetPriceLabel(v130, v_u_129)
			else
				local v131 = p_u_82.FallbackPrices[v128]
				v130.Text = ("<font size=\"19\"><font weight=\"400\">%*</font>%*</font>"):format(utf8.char(57346), (v_u_31.Comma(v131)))
			end
			local v132 = v130.Amount
			local v133 = "%* %*"
			local v134
			if v128 == 1 then
				v134 = p_u_82.Display
			else
				v134 = p_u_82.DisplayPlural
			end
			v132.Text = v133:format(v128, v134)
			v_u_84:Add(v130.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (copy) v_u_129
				v_u_11:PromptPurchase(v_u_129, Enum.InfoType.Product)
			end))
		end
	end
	v_u_84:Add(task.spawn(function()
		-- upvalues: (ref) v_u_85, (ref) v_u_124, (ref) v_u_12, (copy) p_u_82, (ref) v_u_11, (ref) v_u_31
		v_u_85.Buttons.Buy10.TextLabel.Visible = false
		if v_u_124 then
			v_u_124.TextLabel.Visible = false
		end
		if v_u_12 or p_u_82.FallbackPrices[1] == nil then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_85.Buttons.Buy10:GetFullName()))))
			end
			local v135, v136 = v_u_11:GetProductInfo(p_u_82.Products[1], Enum.InfoType.Product)
			if not v135 then
				return
			end
			v_u_85.Buttons.Buy10.TextLabel.Text = v_u_31.Comma(v136.PriceInRobux * 10)
			if v_u_124 then
				v_u_124.TextLabel.Text = v_u_31.Comma(v136.PriceInRobux * 50)
			end
		else
			v_u_85.Buttons.Buy10.TextLabel.Text = v_u_31.Comma(p_u_82.FallbackPrices[1] * 10)
			if v_u_124 then
				v_u_124.TextLabel.Text = v_u_31.Comma(p_u_82.FallbackPrices[1] * 50)
			end
		end
		v_u_85.Buttons.Buy10.TextLabel.Visible = true
		if v_u_124 then
			v_u_124.TextLabel.Visible = true
		end
	end))
	v_u_84:Add(v_u_85.Buttons.Gift1.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_82
		v_u_15:PromptGiftFromGiftId(p_u_82.GiftProducts[1])
	end))
	v_u_84:Add(v_u_85.Buttons.Gift3.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_82
		v_u_15:PromptGiftFromGiftId(p_u_82.GiftProducts[3])
	end))
	v_u_84:Add(v_u_85.Buttons.Gift10.Activated:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_82
		v_u_15:PromptGiftFromGiftId(p_u_82.GiftProducts[10])
	end))
	if v125 and p_u_82.GiftProducts[50] ~= nil then
		v_u_84:Add(v125.Activated:Connect(function()
			-- upvalues: (ref) v_u_15, (copy) p_u_82
			v_u_15:PromptGiftFromGiftId(p_u_82.GiftProducts[50])
		end))
	end
	v_u_84:Add(task.spawn(function()
		-- upvalues: (copy) p_u_82, (ref) v_u_85, (ref) v_u_18
		while true do
			local v137 = p_u_82.EndTime.UnixTimestamp - workspace:GetServerTimeNow()
			v_u_85.Timer.Text = v_u_18.formatShopTime(v137)
			if v137 <= 0 then
				v_u_85.Visible = false
			end
			task.wait(1)
		end
	end))
	v_u_85.Title.Text = p_u_82.Title
	v_u_85.Title.TitleShadow.Text = p_u_82.Title
	v_u_85.Image = p_u_82.BackgroundImage or "rbxassetid://138776814412466"
	v_u_85.Vector.Image = p_u_82.Vector
	v_u_85.Vector.Position = p_u_82.VectorPosition
	v_u_85.Vector.Size = p_u_82.VectorSize
	return v_u_85
end
function v_u_43._destroyExoticPack(_, p138)
	-- upvalues: (copy) v_u_81
	local v139 = v_u_81[p138]
	if v139 then
		v139:Destroy()
		v_u_81[p138] = nil
	end
end
local function v_u_205(p_u_140)
	-- upvalues: (copy) v_u_42, (copy) v_u_30, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_19, (copy) v_u_1, (copy) v_u_26, (copy) v_u_27, (copy) v_u_22, (copy) v_u_12, (copy) v_u_11, (copy) v_u_31, (copy) v_u_18, (copy) v_u_25
	local _ = v_u_42.Frame.ScrollingFrame.Infinite
	local v_u_141 = p_u_140 == "DEFAULT" or v_u_42.Frame.ScrollingFrame[("Infinite_%*"):format(p_u_140)]
	if v_u_141 then
		v_u_141.Visible = true
		local v_u_142 = v_u_141.INF.Holder
		local v_u_143 = v_u_142.Template
		local v_u_144 = nil
		local v_u_145 = Instance.new("NumberValue")
		local function v_u_176()
			-- upvalues: (ref) v_u_30, (copy) p_u_140, (ref) v_u_6, (ref) v_u_4, (ref) v_u_5, (ref) v_u_19, (copy) v_u_145, (copy) v_u_142, (copy) v_u_143, (ref) v_u_1, (ref) v_u_26, (ref) v_u_27, (ref) v_u_22, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
			local v_u_146 = v_u_30:GetData()
			if v_u_146 then
				local _ = v_u_146.InfinitePack.Depth
				local v147 = p_u_140 == "DEFAULT" or v_u_146.EventInfinitePack[p_u_140].Depth
				if v147 then
					local v148 = v_u_6.GetRewardsAsync(v_u_4.LocalPlayer, v_u_146.InfinitePack.Day, v147 + 5)
					if p_u_140 ~= "DEFAULT" then
						v148 = v_u_5.GetRewards(v_u_4.LocalPlayer, v_u_146.EventInfinitePack[p_u_140].Day, v147 + 5)
					end
					v_u_19(v_u_145, TweenInfo.new(0.2), {
						["Value"] = v147
					})
					for _, v_u_149 in v_u_142:GetChildren() do
						local v150 = v_u_149.Name
						local v151 = tonumber(v150)
						if v151 and v151 <= v147 then
							task.delay(0.2, function()
								-- upvalues: (copy) v_u_149
								v_u_149:Destroy()
							end)
						end
					end
					local v152 = #v148 - 5 + 1
					for v_u_153 = math.max(v152, 1), #v148 do
						local v154 = v148[v_u_153]
						local v_u_155 = v_u_142:FindFirstChild((tostring(v_u_153)))
						if not v_u_155 then
							v_u_155 = v_u_143:Clone()
							v_u_155.Name = tostring(v_u_153)
							v_u_155.Position = UDim2.fromScale((v_u_153 - 1) * 0.38, 0)
							v_u_155.LayoutOrder = v_u_153
							v_u_155.ZIndex = #v148 - v_u_153
							v_u_155.Position = UDim2.fromScale((v_u_153 - 1) * 0.38, 0)
							v_u_155.Visible = true
							local v_u_156 = v154.ProductId or 0
							if v_u_156 ~= 0 then
								v_u_155.CLAIM_BUTTON:Destroy()
								v_u_155.RBX_BUTTON.Name = "CLAIM_BUTTON"
							end
							v_u_155.CLAIM_BUTTON.SENSOR.Activated:Connect(function()
								-- upvalues: (ref) v_u_146, (ref) v_u_30, (ref) p_u_140, (copy) v_u_153, (ref) v_u_1
								v_u_146 = v_u_30:GetData()
								if p_u_140 == "DEFAULT" then
									if v_u_146.InfinitePack.Depth + 1 == v_u_153 then
										v_u_1.GameEvents.InfinitePack.Claim:FireServer()
									end
								elseif v_u_146.EventInfinitePack[p_u_140].Depth + 1 == v_u_153 then
									v_u_1.GameEvents.InfinitePack.EventClaim:FireServer()
								end
							end)
							if v154 then
								local v157 = v154.Rewards[1]
								v_u_155.IMAGE_CONTAINER.ITEM_IMAGE.Image = v_u_26(v157.RewardName, v157.Type)
								local v158 = ("%*%*"):format(v_u_27(v157.RewardName, v157.Type) or v157.RewardName, v157.Amount <= 1 and "" or (" x%*"):format(v157.Amount))
								v_u_155.IMAGE_CONTAINER.RewardName.Text = v158
								local v159 = v_u_22:GetRarityColor({
									["Type"] = v157.Type,
									["Value"] = v157.RewardName or "Normal",
									["Quantity"] = v157.Amount or 1
								})
								local v160 = v159 or Color3.fromRGB(127, 127, 127)
								local v161 = v_u_155.IMAGE_CONTAINER
								local v162, v163, v164 = v159:ToHSV()
								local v165 = Color3.fromHSV
								local v166 = v164 / 1.3
								v161.BackgroundColor3 = v165(v162, v163, (math.clamp(v166, 0, 1)))
								local v167 = v_u_155.IMAGE_CONTAINER.RewardName
								local v168, v169, v170 = v160:ToHSV()
								local v171 = Color3.fromHSV
								local v172 = v170 / 3
								v167.TextStrokeColor3 = v171(v168, v169, (math.clamp(v172, 0, 1)))
							end
							v_u_155.Parent = v_u_142
							local v_u_175 = task.spawn(function()
								-- upvalues: (ref) p_u_140, (ref) v_u_5, (copy) v_u_156, (ref) v_u_6, (copy) v_u_155, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
								local v173 = p_u_140 ~= "DEFAULT" and v_u_5.FallbackPrices[v_u_156] or v_u_6.FallbackPrices[v_u_156]
								if v_u_156 == 0 then
									v_u_155.CLAIM_BUTTON.CLAIM.Text = "FREE"
									v_u_155.CLAIM_BUTTON.CLAIM_BUTTON.Text = "FREE"
									return
								elseif v_u_12 or v173 == nil then
									if not v_u_12 then
										warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_155:GetFullName()))))
									end
									v_u_11:SetPriceLabel(v_u_155.CLAIM_BUTTON.CLAIM, v_u_156)
									v_u_11:SetPriceLabel(v_u_155.CLAIM_BUTTON.CLAIM_BUTTON, v_u_156)
									v_u_11:SetPriceLabel(v_u_155.CLAIM_BUTTON_DISABLED.CLAIM, v_u_156)
									v_u_11:SetPriceLabel(v_u_155.CLAIM_BUTTON_DISABLED.CLAIM_BUTTON, v_u_156)
								else
									local v174 = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v173)))
									v_u_155.CLAIM_BUTTON.CLAIM.Text = v174
									v_u_155.CLAIM_BUTTON.CLAIM_BUTTON.Text = v174
									v_u_155.CLAIM_BUTTON_DISABLED.CLAIM.Text = v174
									v_u_155.CLAIM_BUTTON_DISABLED.CLAIM_BUTTON.Text = v174
								end
							end)
							v_u_155.Destroying:Once(function()
								-- upvalues: (copy) v_u_175
								if coroutine.status(v_u_175) == "suspended" then
									pcall(task.cancel, v_u_175)
								end
							end)
						end
						v_u_155.ZIndex = #v148 - v_u_153
						if v_u_153 == (p_u_140 ~= "DEFAULT" and v_u_146.EventInfinitePack[p_u_140].Depth or v_u_146.InfinitePack.Depth) + 1 then
							v_u_155.CLAIM_BUTTON.Visible = true
							v_u_155.CLAIM_BUTTON_DISABLED.Visible = false
						else
							v_u_155.CLAIM_BUTTON.Visible = false
							v_u_155.CLAIM_BUTTON_DISABLED.Visible = true
						end
					end
				else
					warn("Current Infinite Pack type Data does not exist!")
				end
			else
				return
			end
		end
		local function v177()
			-- upvalues: (copy) v_u_142, (copy) v_u_145
			v_u_142.Position = UDim2.fromScale(-0.38 * v_u_145.Value, 0)
		end
		local v_u_178 = nil
		local function v182()
			-- upvalues: (ref) v_u_178, (copy) v_u_142, (copy) v_u_145
			if v_u_178 and coroutine.status(v_u_178) == "suspended" then
				task.cancel(v_u_178)
			end
			v_u_178 = task.delay(0.1, function()
				-- upvalues: (ref) v_u_142, (ref) v_u_145, (ref) v_u_178
				v_u_142.Position = UDim2.fromScale(-0.38 * v_u_145.Value, 0)
				for _, v179 in v_u_142:GetChildren() do
					local v180 = v179.Name
					local v181 = tonumber(v180)
					if v181 then
						v179.Position = UDim2.fromScale((v181 - 1) * 0.38, 0)
					end
				end
				v_u_178 = nil
			end)
		end
		local function v_u_187()
			-- upvalues: (ref) v_u_30, (copy) p_u_140, (ref) v_u_144, (copy) v_u_142, (copy) v_u_176
			local v183 = v_u_30:GetData()
			if v183 then
				local v184 = p_u_140 ~= "DEFAULT" and v183.EventInfinitePack[p_u_140].Day or v183.InfinitePack.Day
				if v_u_144 ~= v184 then
					for _, v185 in v_u_142:GetChildren() do
						if v185:IsA("GuiObject") then
							local v186 = v185.Name
							if tonumber(v186) then
								v185:Destroy()
							end
						end
					end
					v_u_144 = v184
					v_u_176()
				end
			else
				return
			end
		end
		v_u_145.Changed:Connect(v177)
		task.spawn(v177)
		v_u_142:GetPropertyChangedSignal("AbsoluteSize"):Connect(v182)
		task.spawn(v182)
		task.spawn(function()
			-- upvalues: (copy) v_u_187, (copy) p_u_140, (ref) v_u_30, (copy) v_u_176
			task.spawn(v_u_187)
			if p_u_140 == "DEFAULT" then
				local v188 = v_u_30
				assert(v188:GetPathSignal("InfinitePack/@")):Connect(function()
					-- upvalues: (ref) v_u_187, (ref) v_u_176
					v_u_187()
					v_u_176()
				end)
			else
				local v189 = v_u_30
				local v190 = ("EventInfinitePack/%*/@"):format(p_u_140)
				assert(v189:GetPathSignal(v190)):Connect(function()
					-- upvalues: (ref) v_u_187, (ref) v_u_176
					v_u_187()
					v_u_176()
				end)
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_18, (ref) v_u_141
			while true do
				local v191 = workspace:GetServerTimeNow()
				local v192 = (v191 // 86400 + 1) * 86400 - v191
				local v193 = v_u_18.compactFormat(v192)
				v_u_141.Header.Timer.Text = v193
				v_u_141.Header.Timer.TimerShadow.Text = v193
				task.wait(1)
			end
		end)
		local v194 = v_u_141.PossibleRewardsContainer:FindFirstChild("ForeverPackRewards")
		for _, v195 in v_u_141.PossibleRewardsContainer:GetChildren() do
			if string.match(v195.Name, "ForeverPackRewards") then
				v194 = v195
			end
		end
		local v196 = v194.REWARD_IMAGE
		v194.Visible = false
		local v197 = {}
		local v198 = v_u_6.Rewards
		if p_u_140 ~= "DEFAULT" then
			v198 = v_u_5.Rewards
		end
		if v198 then
			for _, v199 in v198.Free do
				if v199.Type then
					if v196 then
						local v200 = {
							["Type"] = v199.Type,
							["Value"] = v199.RewardName or "Normal",
							["Quantity"] = v199.Amount or 1
						}
						table.insert(v197, v200)
					end
				else
					warn("No reward type")
				end
			end
			for _, v201 in v198.Paid do
				if v201.Type then
					if v196 then
						local v202 = {
							["Type"] = v201.Type,
							["Value"] = v201.RewardName or "Normal",
							["Quantity"] = v201.Amount or 1
						}
						table.insert(v197, v202)
					end
				else
					warn("No reward type")
				end
			end
			local v203 = v194.ITEM_NAME.REWARD_NAME
			local v204 = v194.ITEM_NAME.REWARD_NAME_SHADOW
			v_u_25.CycleRewardImages(v196, v203, v204, v194, v197)
			v194.Visible = true
		else
			warn("Current Infinite Pack Type [packRewards] does not exist!")
		end
	else
		warn("Current Infinite Pack type UI does not exist!")
		return
	end
end
function v_u_43._initInfinitePack(_)
	-- upvalues: (copy) v_u_205
	v_u_205("DEFAULT")
end
function v_u_43._initEventInfinitePack(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_205
	local v206 = v_u_5.CurrentPack
	if v206 then
		v_u_205(v206)
	end
end
function v_u_43._initSheckles(_)
	-- upvalues: (copy) v_u_42, (copy) v_u_11, (copy) v_u_15, (copy) v_u_12, (copy) v_u_31
	for _, v207 in v_u_42.Frame.ScrollingFrame.Sheckles.List:GetChildren() do
		if v207:IsA("GuiObject") then
			local v208 = v207.Name
			local v_u_209 = tonumber(v208)
			if v_u_209 then
				v207.Buttons.Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_11, (copy) v_u_209
					v_u_11:PromptPurchase(v_u_209, Enum.InfoType.Product)
				end)
				v207.Buttons.Gift.Activated:Connect(function()
					-- upvalues: (ref) v_u_15, (copy) v_u_209
					v_u_15:PromptGiftFromNormalId(v_u_209)
				end)
				if v_u_12 or type(v207:GetAttribute("FallbackPrice")) ~= "number" then
					if not v_u_12 then
						warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v207.Buttons.Buy:GetFullName()))))
					end
					v_u_11:SetPriceLabel(v207.Buttons.Buy, v_u_209)
				else
					v207.Buttons.Buy.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v207:GetAttribute("FallbackPrice"))))
				end
			end
		end
	end
end
function v_u_43._initPetProducts(_)
	-- upvalues: (copy) v_u_42, (copy) v_u_30, (copy) v_u_37, (copy) v_u_12, (copy) v_u_11, (copy) v_u_31, (copy) v_u_20
	for _, v_u_210 in v_u_42.Frame.ScrollingFrame.PetProducts.List:GetChildren() do
		if v_u_210:IsA("GuiObject") and v_u_210.Name ~= "Free" then
			local v_u_211 = v_u_210:FindFirstChild("DataType").Value
			local v212 = ("PetsData/%*"):format(v_u_211)
			local v_u_213 = v_u_30:GetData().PetsData[v_u_211]
			local v_u_214 = v_u_37[v_u_210.Name][v_u_213 + 1]
			local v_u_215
			if v_u_214 then
				v_u_215 = v_u_214.ProductId
			else
				v_u_215 = nil
			end
			local v_u_216 = 0
			local function v218()
				-- upvalues: (ref) v_u_216, (ref) v_u_213, (ref) v_u_30, (copy) v_u_211, (ref) v_u_214, (ref) v_u_37, (copy) v_u_210, (ref) v_u_215, (ref) v_u_12, (ref) v_u_11, (ref) v_u_31
				v_u_216 = v_u_216 + 1
				v_u_213 = v_u_30:GetData().PetsData[v_u_211]
				v_u_214 = v_u_37[v_u_210.Name][v_u_213 + 1]
				local v217
				if v_u_214 then
					v217 = v_u_214.ProductId
				else
					v217 = nil
				end
				v_u_215 = v217
				if v_u_213 < 5 then
					if v_u_12 or v_u_214.FallbackPrice == nil then
						if not v_u_12 then
							warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_210:GetFullName()))))
						end
						v_u_11:SetPriceLabel(v_u_210.Buttons.Buy, v_u_215)
					else
						v_u_210.Buttons.Buy.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(v_u_214.FallbackPrice)))
					end
				else
					v_u_210.Buttons.Buy.Text = "MAX!"
				end
				v_u_210.Amount.Text = ("%*/5 Extra!"):format(v_u_213)
			end
			local v219 = v_u_30
			assert(v219:GetPathSignal(v212)):Connect(v218)
			v218()
			v_u_210.Buttons.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_213, (ref) v_u_20, (ref) v_u_30, (copy) v_u_211, (ref) v_u_215, (ref) v_u_37, (copy) v_u_210, (ref) v_u_11
				if v_u_213 >= 5 then
					v_u_20:CreateNotification("Maximum Slots Purchased!")
				else
					v_u_213 = v_u_30:GetData().PetsData[v_u_211]
					v_u_215 = v_u_37[v_u_210.Name][v_u_213 + 1].ProductId
					v_u_11:PromptPurchase(v_u_215, Enum.InfoType.Product)
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
		local v_u_220 = v_u_30:GetData()
		local v221 = v_u_42.Frame.ScrollingFrame.FarmersMarket.Frame
		local v_u_222 = v221.Buy
		local function v_u_224()
			-- upvalues: (copy) v_u_222
			v_u_222.Text = "Purchased"
			v_u_222.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
			for _, v223 in v_u_222:GetChildren() do
				if v223:IsA("UIStroke") then
					v223.Color = Color3.fromRGB(24, 24, 24)
				end
			end
		end
		local v_u_225 = nil
		v_u_225 = v_u_30:GetPathSignal("PermanentGears/@"):Connect(function()
			-- upvalues: (copy) v_u_220, (copy) v_u_224, (ref) v_u_42, (ref) v_u_225
			if v_u_220.PermanentGears["Booth Sign"] then
				v_u_224()
				v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible = false
				if v_u_225 then
					v_u_225:Disconnect()
					v_u_225 = nil
				end
			end
		end)
		v_u_222.Activated:Connect(function()
			-- upvalues: (copy) v_u_220, (ref) v_u_20, (ref) v_u_11, (ref) v_u_29
			if v_u_220.PermanentGears["Booth Sign"] then
				v_u_20:CreateNotification("You\'ve already bought a Trade Sign!")
			else
				v_u_11:PromptPurchaseRobux(v_u_29.BuyBoothPack.PurchaseID, Enum.InfoType.Product)
			end
		end)
		if v_u_220.PermanentGears["Booth Sign"] then
			v_u_224()
			v_u_42.Frame.ScrollingFrame.FarmersMarket.Visible = false
		elseif v_u_12 then
			if not v_u_12 then
				warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v221:GetFullName()))))
			end
			v_u_11:SetPriceLabel(v_u_222, v_u_29.BuyBoothPack.PurchaseID)
		else
			v_u_222.Text = ("%*%*"):format(utf8.char(57346), (v_u_31.Comma(149)))
		end
	end
end
function v_u_43._initDiggingTreasure(_)
	-- upvalues: (copy) v_u_8, (copy) v_u_42, (copy) v_u_1, (copy) v_u_36, (copy) v_u_40, (copy) v_u_11, (copy) v_u_29, (copy) v_u_17, (copy) v_u_24, (copy) v_u_30, (copy) v_u_26, (copy) v_u_18, (copy) v_u_34
	local v_u_226 = v_u_8.GetCurrentTheme()
	if v_u_226 ~= "DISABLED" then
		local v_u_227 = v_u_42.Frame.ScrollingFrame.GraveDiggerPack
		local v_u_228 = require(v_u_1.Data.SharedCycleHandlerData).PermanentDigging
		local v_u_229 = require(v_u_1.Data.DiggingMinigame.DiggingRewardData)
		v_u_227.Visible = true
		if v_u_36.GetAttributeAsync(v_u_40, "AB_DiggingTypes", "Default") == "No_Free" then
			v_u_227.OfflineText.Visible = false
		else
			v_u_227.OfflineText.Visible = true
		end
		v_u_11:SetPriceLabel(v_u_227.Buttons.Buy10, v_u_29.DiggingBuy10Digs.PurchaseID)
		v_u_11:SetPriceLabel(v_u_227.Buttons.Buy20, v_u_29.DiggingBuy20Digs.PurchaseID)
		v_u_227.Buttons.Buy10.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29
			v_u_11:PromptPurchase(v_u_29.DiggingBuy10Digs.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_227.Buttons.Buy20.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29
			v_u_11:PromptPurchase(v_u_29.DiggingBuy20Digs.PurchaseID, Enum.InfoType.Product)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_29, (copy) v_u_227
			local v230, v231 = v_u_11:GetProductInfo(v_u_29.DiggingBuyDigs.PurchaseID, Enum.InfoType.Product, 3)
			local v232 = not (v230 and v231.PriceInRobux) and 236 or (v231.PriceInRobux or 59) * 4
			v_u_227.Buttons.Buy20.TextLabel.Text = v232
		end)
		v_u_227.Buttons.Go.Activated:Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_42, (ref) v_u_24
			v_u_17:Close(v_u_42)
			task.wait(0.5)
			v_u_24:Open()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_30, (copy) v_u_226, (copy) v_u_229, (copy) v_u_227, (ref) v_u_26, (copy) v_u_228, (ref) v_u_18, (ref) v_u_34
			local v233 = v_u_30:GetData()
			if v_u_226 == "DISABLED" then
				return
			end
			local v234 = v_u_229.RewardSets[v_u_226] or {}
			table.sort(v234, function(p235, p236)
				return p235.Chance < p236.Chance
			end)
			local v237 = #v234
			for v238 = math.min(4, v237), 1, -1 do
				local v239 = v_u_227.Rewards[("Segment%*"):format(v238)]
				if v239 then
					v239.RewardImage.Image = v_u_26(v234[v238].Value, v234[v238].Type)
				end
			end
			while true do
				local v240 = v_u_228:GetTimeUntilNext()
				if v240 then
					local v241 = v_u_18.compactFormat(v240)
					local v242 = "Resets in: " .. v_u_34.red((("%*"):format(v241)))
					v_u_227.Background.Top.RestocksIn.Timer.Text = v242
				end
				if v233 then
					local v243 = v233.DiggingData.RemainingDigs
					v_u_227.Buttons.Go.Amount.Text = ("(%*) Digs Available"):format(v243)
				end
				task.wait(1)
			end
		end)
	end
end
function v_u_43.Start(_)
	-- upvalues: (copy) v_u_17, (copy) v_u_42, (copy) v_u_16, (copy) v_u_40, (copy) v_u_28, (copy) v_u_43, (copy) v_u_21, (copy) v_u_2, (copy) v_u_39, (copy) v_u_8, (copy) v_u_5, (copy) v_u_1
	local v_u_244 = v_u_17:GetStateForGui(v_u_42)
	v_u_17:UsePopupAnims(v_u_42)
	v_u_42.Frame.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_42
		v_u_17:Close(v_u_42)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_40, (ref) v_u_28, (ref) v_u_43, (ref) v_u_21, (ref) v_u_2, (copy) v_u_244
		local v245 = v_u_16:GetPolicyInfoForPlayerAsync(v_u_40)
		if not (v245 and v245.ArePaidRandomItemsRestricted) then
			local v246 = v_u_28:IsHiddenFromUpdate("Premium Springtide Egg")
			if v246 then
				task.spawn(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_2
					local v247 = {}
					for _, v248 in v_u_21.PREMIUM_SPRINGTIDE_EGG.Items do
						if v248.Icon then
							local v249 = Instance.new("ImageLabel")
							v249.Image = v248.Icon
							table.insert(v247, v249)
						end
					end
					v_u_2:PreloadAsync(v247)
					for _, v250 in v247 do
						v250:Destroy()
					end
					table.clear(v247)
				end)
				task.spawn(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_2
					local v251 = {}
					for _, v252 in v_u_21.PREMIUM_GOLDEN_EGG.Items do
						if v252.Icon then
							local v253 = Instance.new("ImageLabel")
							v253.Image = v252.Icon
							table.insert(v251, v253)
						end
					end
					v_u_2:PreloadAsync(v251)
					for _, v254 in v251 do
						v254:Destroy()
					end
					table.clear(v251)
				end)
			else
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_SPRINGTIDE_EGG, 1)
				end, warn)
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_GOLDEN_EGG, 2)
				end, warn)
			end
			if v246 then
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_GOLDEN_EGG, 2)
				end, warn)
				while v_u_28:IsHiddenFromUpdate("Premium Springtide Egg") do
					task.wait(1)
				end
				xpcall(function()
					-- upvalues: (ref) v_u_43, (ref) v_u_21
					v_u_43:_createExoticPack(v_u_21.PREMIUM_SPRINGTIDE_EGG, 1)
				end, warn)
				if v246 and not v_u_244.Visible:Get() then
					local v_u_255 = v_u_43:Notify()
					local v_u_256 = nil
					v_u_256 = v_u_244.Visible:Listen(function(p257)
						-- upvalues: (copy) v_u_255, (ref) v_u_43, (ref) v_u_256
						if p257 then
							if v_u_255 then
								v_u_43:ClearNotification(v_u_255)
							end
							if v_u_256 then
								v_u_256:Disconnect()
								v_u_256 = nil
							end
						end
					end)
				end
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
	if v_u_28:IsHiddenFromUpdate("Easter") then
		v_u_42.Frame.ScrollingFrame.RainbowShovel.Visible = true
		v_u_43:_initRainbowShovelPack()
	else
		v_u_42.Frame.ScrollingFrame.RainbowShovel.Visible = false
	end
	local v258 = require(v_u_1.Data.TradeWorldData)
	if game.PlaceId == v258.PlaceId and true or v258.ForceInWorld == true then
		task.spawn(function()
			-- upvalues: (ref) v_u_43
			v_u_43:_initFarmersMarket()
		end)
	end
end
task.spawn(v_u_43.Start, v_u_43)
return v_u_43