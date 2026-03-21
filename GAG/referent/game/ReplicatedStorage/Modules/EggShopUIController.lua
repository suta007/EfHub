local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
game:GetService("ContentProvider")
game:GetService("UserInputService")
local v3 = v_u_2:WaitForChild("GameEvents")
local v_u_4 = game.Players.LocalPlayer
local v5 = v_u_4.PlayerGui
local v_u_6 = require(v_u_2.Modules.DataService)
local v7 = require(v_u_2.Modules.Signal)
local v_u_8 = require(v_u_2.Modules.FastTween)
require(v_u_2.Modules.DumpTable)
local v_u_9 = require(v_u_2.Modules.MarketController)
local v_u_10 = require(v_u_2.Modules.GiftController)
local v_u_11 = require(v_u_2.Modules.GuiController)
local v_u_12 = require(v_u_2.Modules.UpdateService)
local v_u_13 = require(v_u_2.Modules.WatchButtonHold)
local v_u_14 = require(v_u_2.Code.Spr)
require(v_u_2.Modules.ShopTabHandler)
require(v_u_2.Data.ShopTabData)
local v_u_15 = require(v_u_2.Modules.NPCLevelHandler)
local v_u_16 = require(v_u_2.Modules.Spring)
local v_u_17 = require(v_u_2.Modules.RebirthUnlocksSharedService)
local v_u_18 = require(v_u_2.Comma_Module)
local v_u_19 = require(v_u_2.Item_Module)
local v_u_20 = require(v_u_2.Modules.NumberUtil)
require(v_u_2.Modules.SeedPackOddsController)
local v_u_21 = require(v_u_2.Modules.PetEggOddsController)
require(v_u_2.Modules.CosmeticCrateOddsController)
local v_u_22 = require(v_u_2.Modules.UseDynamicPrices)
local v_u_23 = require(v_u_2.Modules.ItemImageFinder)
local v_u_24 = require(v_u_2.Data.CurrencyData)
local v_u_25 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_26 = require(game.ReplicatedStorage.Data.SoundData)
local v_u_27 = require(v_u_2.Modules.TradeControllers.TradeWorldController)
local _ = require(v_u_2.Data.CosmeticRegistry).CosmeticList
require(v_u_2.Data.EventShopConfigData)
local v_u_28 = require(v_u_2.Data.PetEggData)
local v_u_29 = require(v_u_2.Data.PetEggShopData)
local v_u_30 = require(v_u_2.Data.DevProductIds)
local v_u_31 = v3.BuyPetEgg
local v_u_32 = false
local v_u_33 = nil
local v_u_34 = v7.new()
local v_u_35 = {}
local v_u_36 = v5:WaitForChild("PetShop_UI")
local v_u_37 = v_u_36:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
local v_u_38 = v_u_36:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("Timer")
local v_u_39 = v_u_37:WaitForChild("ItemFrame")
v_u_39.Parent = script
local v_u_40 = v_u_37:WaitForChild("ItemPadding")
v_u_40.Parent = v_u_37
local v_u_41 = {}
local v_u_42 = {}
local v43 = {}
local v44 = game.SoundService
local v_u_45 = v44.Click
local v_u_46 = v44.Restock_SFX
local function v_u_50()
	-- upvalues: (ref) v_u_32, (copy) v_u_6, (copy) v_u_29, (copy) v_u_38, (copy) v_u_20, (copy) v_u_27, (copy) v_u_46
	if v_u_32 then
		return
	end
	v_u_32 = true
	while true do
		local v47 = workspace:GetServerTimeNow()
		local v48 = v_u_6:GetData()
		local v49 = v48.PetEggStock.ForcedEggEndTimestamp and (v48.PetEggStock.ForcedEggEndTimestamp - v47 or -1) or -1
		if v49 < 0 then
			v49 = v_u_29.RefreshTime - v47 % v_u_29.RefreshTime
		end
		v_u_38.Text = v49 <= 0 and "Restocking" or "Restock: " .. v_u_20.compactFormat(v49)
		if v49 <= 1 and not v_u_27:IsInWorld() then
			v_u_46.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_46.TimePosition = 0
			v_u_46.Playing = true
			require(game.ReplicatedStorage.Modules.Notification):CreateNotification("<font color=\"#FFB6C1\"><b>Your Pet Shop stock has restocked!</b></font>")
		end
		task.wait(1)
	end
end
local function v_u_113()
	-- upvalues: (copy) v_u_50, (copy) v_u_42, (copy) v_u_41, (copy) v_u_28, (copy) v_u_12, (copy) v_u_39, (copy) v_u_19, (copy) v_u_20, (copy) v_u_23, (copy) v_u_37, (copy) v_u_40, (copy) v_u_35, (copy) v_u_2, (copy) v_u_31, (copy) v_u_13, (copy) v_u_14, (copy) v_u_9, (copy) v_u_45, (copy) v_u_10, (copy) v_u_21, (copy) v_u_36, (copy) v_u_24, (ref) v_u_33, (copy) v_u_8, (copy) v_u_34, (copy) v_u_22, (copy) v_u_18, (copy) v_u_6, (copy) v_u_15, (copy) v_u_17, (copy) v_u_4
	task.spawn(v_u_50)
	for _, v51 in ipairs(v_u_42) do
		if v51.Connected then
			v51:Disconnect()
		end
	end
	table.clear(v_u_42)
	for _, v52 in v_u_41 do
		if v52:IsA("Frame") then
			v52:Destroy()
		end
	end
	table.clear(v_u_41)
	local v_u_53 = {}
	for v_u_54, v_u_55 in v_u_28 do
		if not v_u_12:IsHiddenFromUpdate(v_u_55.EggName) and (not v_u_12:IsHiddenAfterUpdate(v_u_55.EggName) and v_u_55.DisplayInShop ~= false) then
			local v_u_56 = v_u_39:Clone()
			v_u_41[v_u_54] = v_u_56
			v_u_56.Name = v_u_54
			v_u_56.LayoutOrder = v_u_55.LayoutOrder * 10
			table.insert(v_u_53, v_u_56)
			local v_u_57 = v_u_56.Main_Frame
			local v58 = v_u_19.Return_Rarity_Data(v_u_55.EggRarity)
			if v58 then
				v_u_57.Rarity_Text.Text = v58[1]
				local v59 = v_u_57.Rarity_Text.UIStroke
				local v60, v61, v62 = v58[2]:ToHSV()
				v59.Color = Color3.fromHSV(v60, v61, v62 / 2)
				v_u_57.Rarity_BG.ImageColor3 = v58[2]
			end
			v_u_57.Seed_Text.Text = v_u_55.EggName
			v_u_57.Seed_Text_Shadow.Text = v_u_55.EggName
			local v_u_63
			if v_u_55.SpecialCurrencyType then
				v_u_63 = v_u_20.FormatCompactPrice(v_u_55.Price) .. ""
			else
				v_u_63 = v_u_20.DisplaySheckles(v_u_55.Price)
			end
			if v_u_57.Cost_Text:FindFirstChild("TEXT") then
				v_u_57.Cost_Text.TEXT.Text = v_u_63
			else
				v_u_57.Cost_Text.Text = v_u_63
			end
			if v_u_55.PetEggDescription and v_u_55.PetEggDescription ~= "" then
				v_u_57.LargeDescriptionText.Text = v_u_55.PetEggDescription
				v_u_57.InfoButton.Visible = true
			else
				v_u_57.InfoButton.Visible = false
				v_u_57.Seed_Text.Size = UDim2.fromScale(0.652, v_u_57.Seed_Text.Size.Y.Scale)
				v_u_57.Seed_Text_Shadow.Size = UDim2.fromScale(0.652, v_u_57.Seed_Text_Shadow.Size.Y.Scale)
			end
			if v_u_55.Limited == true then
				v_u_56.Main_Frame.LimitedBanner.Visible = true
			else
				v_u_56.Main_Frame.LimitedBanner.Visible = false
			end
			v_u_57.LargeDescriptionText.Visible = false
			local v_u_64 = false
			local function v65()
				-- upvalues: (ref) v_u_64, (copy) v_u_57
				v_u_64 = not v_u_64
				v_u_57.LargeDescriptionText.Visible = v_u_64
				v_u_57.Rarity_BG.Visible = not v_u_64
				v_u_57.Rarity_Text.Visible = not v_u_64
				v_u_57.Stock_Text.Visible = not v_u_64
				v_u_57.Cost_Text.Visible = not v_u_64
			end
			v_u_57.InfoButton.Activated:Connect(v65)
			local v66 = v_u_57:FindFirstChild("ShopItem_Image", true)
			v66.Visible = true
			local v67 = v_u_55.ItemType or "Egg"
			v66.Image = v_u_23(v_u_54, v67)
			v_u_56.Parent = v_u_37
			local v_u_68 = v_u_40:Clone()
			v_u_68.LayoutOrder = v_u_55.LayoutOrder * 10 + 1
			v_u_68.Name = ("%*_Padding"):format(v_u_54)
			v_u_68.Parent = v_u_37
			v_u_41[v_u_68.Name] = v_u_68
			local v_u_69 = v_u_56.Frame
			if v_u_69.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
				v_u_69.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_63
			else
				v_u_69.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_63
			end
			local function v70()
				-- upvalues: (ref) v_u_35, (copy) v_u_54, (ref) v_u_2, (ref) v_u_31
				if v_u_35[v_u_54] then
					require(v_u_2.Modules.Notification):CreateNotification("Restocking. Please wait...")
				else
					v_u_31:FireServer(v_u_54)
				end
			end
			local v_u_71 = false
			local v_u_72 = 0
			v_u_13(v_u_69.Sheckles_Buy, function(p73, p74)
				-- upvalues: (ref) v_u_72, (ref) v_u_71, (copy) v_u_69, (ref) v_u_14, (ref) v_u_35, (copy) v_u_54, (ref) v_u_2, (ref) v_u_31
				if workspace:GetAttribute("InTutorial") then
					return
				elseif p74 then
					v_u_72 = 0
					if v_u_71 then
						v_u_71 = false
						if v_u_69:FindFirstChild("Sheckles_Buy") then
							v_u_14.target(v_u_69.Sheckles_Buy, 0.8, 2, {
								["ImageColor3"] = Color3.new(1, 1, 1)
							})
						end
					end
					return
				else
					if not v_u_71 then
						v_u_71 = true
						if v_u_69:FindFirstChild("Sheckles_Buy") then
							v_u_14.target(v_u_69.Sheckles_Buy, 0.8, 2, {
								["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
							})
						end
					end
					if os.clock() >= v_u_72 then
						local v75 = p73 * -0.3
						local v76 = ((1 - math.exp(v75)) * 24 + 8) // 1
						local v77 = math.max(v76, 1)
						v_u_72 = os.clock() + 0.125
						for _ = 1, v77 do
							if v_u_35[v_u_54] then
								require(v_u_2.Modules.Notification):CreateNotification("Restocking. Please wait...")
							else
								v_u_31:FireServer(v_u_54)
							end
						end
					end
				end
			end, {
				["minimumHoldTime"] = 1,
				["interval"] = 0.125
			})
			v_u_69.Sheckles_Buy.Activated:Connect(v70)
			local v78 = v_u_69.Robux_Buy
			local v79
			if v_u_55.PurchaseID == nil then
				v79 = false
			else
				v79 = v_u_55.PurchaseID > 0
			end
			v78.Visible = v79
			if v_u_55.PurchaseID then
				v_u_69.Robux_Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_9, (copy) v_u_55
					v_u_9:PromptPurchase(v_u_55.PurchaseID, Enum.InfoType.Product)
				end)
			end
			v_u_69.Gift.Visible = v_u_55.GiftPurchaseID ~= nil
			if v_u_55.GiftPurchaseID then
				v_u_69.Gift.Activated:Connect(function()
					-- upvalues: (ref) v_u_45, (ref) v_u_10, (copy) v_u_55
					v_u_45.PlaybackSpeed = 1 + math.random(-15, 15) / 100
					v_u_45.TimePosition = 0
					v_u_45.Playing = true
					v_u_10:PromptGiftFromGiftId(v_u_55.GiftPurchaseID)
				end)
			end
			if v67 == "Egg" then
				v_u_57.OddsButton.Visible = true
				v_u_57.OddsButton.Activated:Connect(function()
					-- upvalues: (ref) v_u_21, (copy) v_u_55, (ref) v_u_36
					v_u_21:Open(v_u_55.EggName, v_u_36)
				end)
			else
				v_u_57.OddsButton.Visible = false
			end
			if v_u_55.SpecialCurrencyType and v_u_24[v_u_55.SpecialCurrencyType] then
				v_u_57.Cost_Text.CurrencyImage.Image = v_u_24[v_u_55.SpecialCurrencyType].Icon
				v_u_69.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_24[v_u_55.SpecialCurrencyType].Icon
			else
				v_u_57.Cost_Text.CurrencyImage.Visible = false
				v_u_69.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
			end
			local function v80()
				-- upvalues: (ref) v_u_33, (copy) v_u_54, (copy) v_u_69, (ref) v_u_8, (copy) v_u_68
				if v_u_33 == v_u_54 then
					v_u_69.Visible = true
					v_u_8(v_u_69, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						["Position"] = UDim2.fromScale(0.5, 1.3)
					})
					v_u_8(v_u_68, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						["Size"] = UDim2.fromScale(0.13, 0.25)
					})
				else
					task.delay(0.25, function()
						-- upvalues: (ref) v_u_69
						if v_u_69.Position == UDim2.fromScale(0.5, 0.5) then
							v_u_69.Visible = false
						end
					end)
					v_u_8(v_u_69, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						["Position"] = UDim2.fromScale(0.5, 0.5)
					})
					v_u_8(v_u_68, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						["Size"] = UDim2.fromScale(0.13, 0.02)
					})
				end
			end
			v_u_34:Connect(v80)
			task.spawn(v80)
			local v_u_81 = false
			v_u_57.Activated:Connect(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_37, (copy) v_u_56, (copy) v_u_53, (ref) v_u_33, (copy) v_u_54, (ref) v_u_34, (ref) v_u_81, (ref) v_u_22, (copy) v_u_55, (copy) v_u_69, (ref) v_u_9, (ref) v_u_18
				v_u_8(v_u_37, TweenInfo.new(0.35), {
					["CanvasPosition"] = Vector2.new(0, v_u_56.AbsoluteSize.Y * (table.find(v_u_53, v_u_56) - 1))
				})
				local v82
				if v_u_33 == v_u_54 then
					v82 = nil
				else
					v82 = v_u_54
				end
				v_u_33 = v82
				v_u_34:Fire()
				if not v_u_81 then
					if v_u_22 or v_u_55.FallbackPrice == nil then
						if not v_u_22 then
							warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_69:GetFullName()))))
						end
						v_u_9:SetPriceLabel(v_u_69.Robux_Buy.Price, v_u_55.PurchaseID, ":robux::value:")
					else
						v_u_69.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_18.Comma(v_u_55.FallbackPrice)))
					end
					v_u_81 = true
				end
			end)
			if v_u_33 == v_u_54 then
				task.spawn(function()
					-- upvalues: (ref) v_u_22, (copy) v_u_55, (copy) v_u_69, (ref) v_u_9, (ref) v_u_18, (ref) v_u_81
					if v_u_22 or v_u_55.FallbackPrice == nil then
						if not v_u_22 then
							warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_69:GetFullName()))))
						end
						v_u_9:SetPriceLabel(v_u_69.Robux_Buy.Price, v_u_55.PurchaseID, ":robux::value:")
					else
						v_u_69.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_18.Comma(v_u_55.FallbackPrice)))
					end
					v_u_81 = true
				end)
			end
			local v_u_83 = true
			local v_u_84 = Instance.new("NumberValue")
			v_u_84.Value = 0
			v_u_84.Parent = v_u_69
			v_u_84.Changed:Connect(function(p85)
				-- upvalues: (copy) v_u_57
				if v_u_57 and v_u_57:FindFirstChild("Stock_Text") then
					v_u_57.Stock_Text.Text = ("X%* Stock"):format(p85 // 1)
				end
			end)
			local function v_u_99()
				-- upvalues: (ref) v_u_6, (copy) v_u_54, (ref) v_u_83, (ref) v_u_71, (copy) v_u_84, (ref) v_u_14, (copy) v_u_69, (copy) v_u_57, (ref) v_u_63, (ref) v_u_15, (copy) v_u_55, (ref) v_u_17, (ref) v_u_4
				local v86 = v_u_6:GetData()
				if v86 then
					local v87 = 0
					for _, v88 in v86.PetEggStock.Stocks do
						if v88.EggName == v_u_54 then
							v87 = v87 + v88.Stock
						end
					end
					if v_u_83 or not v_u_71 then
						v_u_83 = false
						v_u_84.Value = v87
					else
						v_u_14.target(v_u_84, 1, 1.5, {
							["Value"] = v87
						})
					end
					v_u_69.Sheckles_Buy.In_Stock.Visible = v87 > 0
					v_u_69.Sheckles_Buy.No_Stock.Visible = v87 <= 0
					v_u_69.Sheckles_Buy.HoverImage = v87 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
					v_u_69.Sheckles_Buy.Image = v87 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
					if v_u_57.Cost_Text:FindFirstChild("TEXT") then
						v_u_57.Cost_Text.TEXT.Text = v87 <= 0 and "NO STOCK" or v_u_63
						local v89 = v_u_57.Cost_Text.TEXT
						local v90
						if v87 <= 0 then
							v90 = Color3.fromRGB(255, 0, 0)
						else
							v90 = Color3.fromRGB(0, 255, 0)
						end
						v89.TextColor3 = v90
					else
						v_u_57.Cost_Text.Text = v87 <= 0 and "NO STOCK" or v_u_63
						local v91 = v_u_57.Cost_Text
						local v92
						if v87 <= 0 then
							v92 = Color3.fromRGB(255, 0, 0)
						else
							v92 = Color3.fromRGB(0, 255, 0)
						end
						v91.TextColor3 = v92
					end
					local v93 = not v_u_15:HasRequiredNPCLevels(v_u_55.LevelLocks)
					if v93 then
						v_u_14.stop(v_u_84)
						v_u_57.Stock_Text.Text = ""
					elseif v_u_83 or not v_u_71 then
						v_u_83 = false
						v_u_84.Value = v87
					else
						v_u_14.target(v_u_84, 1, 1.5, {
							["Value"] = v87
						})
					end
					if v93 and v_u_55.LevelLocks then
						local v94 = next(v_u_55.LevelLocks)
						local v95 = v94 and v_u_55.LevelLocks[v94] or 1
						v_u_57.LockedFrame.Visible = true
						v_u_57.LockedFrame.UnlockInfo.Text = ("NPC Friend Level Needed: lvl%*"):format(v95)
					else
						v_u_57.LockedFrame.Visible = false
					end
					v_u_69.Sheckles_Buy.In_Stock.Visible = v87 > 0
					v_u_69.Sheckles_Buy.No_Stock.Visible = v87 <= 0
					v_u_69.Sheckles_Buy.HoverImage = v87 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
					v_u_69.Sheckles_Buy.Image = v87 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
					v_u_69.Sheckles_Buy.Visible = not v93
					local v96 = v_u_57.Cost_Text:FindFirstChild("TEXT") or v_u_57.Cost_Text
					if v93 and v_u_55.LevelLocks then
						local v97 = next(v_u_55.LevelLocks)
						v96.Text = ("LOCKED: lvl%*+"):format(v97 and v_u_55.LevelLocks[v97] or 1)
						v96.TextColor3 = Color3.fromRGB(255, 0, 0)
					else
						v96.Text = v87 <= 0 and "NO STOCK" or v_u_63
						local v98
						if v87 <= 0 then
							v98 = Color3.fromRGB(255, 0, 0)
						else
							v98 = Color3.fromRGB(0, 255, 0)
						end
						v96.TextColor3 = v98
					end
					if v_u_57.Cost_Text:FindFirstChild("CurrencyImage") and v_u_55.SpecialCurrencyType then
						v_u_57.Cost_Text.CurrencyImage.Visible = v87 > 0
					end
					if v_u_17:HasUnlockedShopItem(v_u_4, "Egg", v_u_54) then
						v_u_57.LockedFrame.Visible = false
						v_u_57.Interactable = true
					else
						v_u_57.LockedFrame.Visible = true
						v_u_57.Interactable = false
						v_u_57.LockedFrame.UnlockInfo.Text = ("Ascensions Required: %*"):format((v_u_17:GetRemainingRebirthsNeededForItem(v_u_4, "Egg", v_u_54)))
					end
				else
					return
				end
			end
			task.spawn(v_u_99)
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (copy) v_u_99, (ref) v_u_42, (ref) v_u_17, (ref) v_u_4
				local v100 = v_u_6:GetPathSignal("PetEggStock/@")
				if v100 then
					local v101 = v100:Connect(v_u_99)
					local v102 = v_u_42
					table.insert(v102, v101)
				end
				local v103 = v_u_6:GetPathSignal("PetEggStock")
				if v103 then
					local v104 = v103:Connect(v_u_99)
					local v105 = v_u_42
					table.insert(v105, v104)
				end
				local v106 = v_u_17:HasBeenAssignedABTest(v_u_4) and v_u_6:GetPathSignal("RebirthData/TotalRebirths")
				if v106 then
					local v107 = v106:Connect(v_u_99)
					local v108 = v_u_42
					table.insert(v108, v107)
				end
			end)
		end
	end
	table.sort(v_u_53, function(p109, p110)
		local v111 = p109.LayoutOrder
		local v112 = p110.LayoutOrder
		if v111 == v112 then
			return p109.Name < p110.Name
		else
			return v111 < v112
		end
	end)
end
function v43.Start(_)
	-- upvalues: (copy) v_u_11, (copy) v_u_36, (copy) v_u_30, (copy) v_u_9, (copy) v_u_12, (copy) v_u_113, (copy) v_u_6, (copy) v_u_37, (copy) v_u_28, (copy) v_u_18, (copy) v_u_16, (copy) v_u_1, (copy) v_u_35, (copy) v_u_25, (copy) v_u_26
	v_u_11:UsePopupAnims(v_u_36)
	v_u_36.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_36
		v_u_11:Close(v_u_36)
		v_u_36.Enabled = false
	end)
	v_u_36.Frame.Frame.Restock.Activated:Connect(function()
		-- upvalues: (ref) v_u_30, (ref) v_u_9
		v_u_9:PromptPurchase(v_u_30.RefreshPetShop.PurchaseID, Enum.InfoType.Product)
	end)
	if not v_u_12:IsUpdateDone() then
		task.delay(v_u_12:GetRemainingTimeUntilUpdate() + 1, function()
			-- upvalues: (ref) v_u_113
			v_u_113()
		end)
	end
	v_u_113()
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_37, (ref) v_u_28, (ref) v_u_18, (ref) v_u_16, (ref) v_u_1, (ref) v_u_36, (ref) v_u_35, (ref) v_u_25, (ref) v_u_26
		local v114 = v_u_6:GetPathSignal("PetEggStock/@")
		if v114 then
			local function v_u_124(p115, p116)
				-- upvalues: (ref) v_u_37, (ref) v_u_28, (ref) v_u_18
				local v117 = v_u_37:FindFirstChild(p115)
				if v117 then
					local v118 = v_u_28[p115]
					if v118 then
						local v119 = v117.Main_Frame
						local v120 = v117.Frame
						local v121 = v119.Cost_Text
						local v122 = ("X%* Stock"):format(p116)
						local v123 = p116 > 0
						v119.Stock_Text.Text = v122
						v120.Sheckles_Buy.In_Stock.Visible = v123
						v120.Sheckles_Buy.No_Stock.Visible = not v123
						v120.Sheckles_Buy.HoverImage = v123 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
						v120.Sheckles_Buy.Image = v123 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
						if v123 then
							v121.Text = v_u_18.Comma(v118.Price) .. "\194\162"
							v121.TextColor3 = Color3.fromRGB(0, 255, 0)
						else
							v121.Text = "NO STOCK"
							v121.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						warn((("No pet info found for id: %*"):format(p115)))
						return
					end
				else
					return
				end
			end
			local function v_u_130(p125, p126)
				-- upvalues: (ref) v_u_37, (ref) v_u_16, (ref) v_u_1
				local v127 = v_u_37:FindFirstChild(p125)
				if v127 then
					local v128 = v127.Main_Frame
					local v_u_129 = Instance.new("Frame")
					v_u_129.Size = UDim2.fromScale(0.98, 0.98)
					v_u_129.Position = UDim2.fromScale(0.5, 0.5)
					v_u_129.AnchorPoint = Vector2.new(0.5, 0.5)
					v_u_129.Transparency = 0.4
					v_u_129.BackgroundColor3 = p126
					v_u_129.ZIndex = 1000
					v_u_129.Parent = v128
					v_u_16.target(v_u_129, 1, 1, {
						["Transparency"] = 1
					})
					v_u_1:AddItem(v_u_129, 2.1)
					task.delay(2, function()
						-- upvalues: (copy) v_u_129
						if v_u_129 and v_u_129.Parent then
							v_u_129:Destroy()
						end
					end)
				end
			end
			local function v_u_139(p131)
				-- upvalues: (ref) v_u_37
				local v132 = {}
				for v133, _ in p131 do
					table.insert(v132, v133)
				end
				table.sort(v132, function(p134, p135)
					-- upvalues: (ref) v_u_37
					local v136 = v_u_37:FindFirstChild(p134)
					local v137 = not v136 and 0 or v136.LayoutOrder
					local v138 = v_u_37:FindFirstChild(p135)
					return v137 < (not v138 and 0 or v138.LayoutOrder)
				end)
				return v132
			end
			local function v_u_149(p140)
				-- upvalues: (ref) v_u_6, (copy) v_u_139, (ref) v_u_37, (ref) v_u_35, (copy) v_u_124, (ref) v_u_36, (ref) v_u_25, (ref) v_u_26, (ref) v_u_28, (copy) v_u_130
				local v141 = v_u_6:GetData()
				if v141 then
					local v142 = v_u_139(p140)
					table.clear(p140)
					for v143, v144 in v142 do
						if v_u_37:FindFirstChild(v144) then
							v_u_35[v144] = true
							local v145 = 0
							for _, v146 in v141.PetEggStock.Stocks do
								if v146.EggName == v144 then
									v145 = v145 + 1
								end
							end
							if v145 > 0 then
								for v147 = 0, v145 do
									v_u_124(v144, v147)
									if v_u_36.Enabled then
										v_u_25:PlaySound(v_u_26.RestockAnimationSFX.Stock_Click)
									end
									task.wait(0.05)
								end
								local v148 = not v_u_28[v144] and "Prismatic" or v_u_28[v144].EggRarity
								if v_u_36.Enabled then
									v_u_25:PlaySound(v_u_26.RestockAnimationSFX[v148 or "Prismatic"])
								end
								v_u_130(v144, Color3.fromRGB(24, 255, 0))
								v_u_124(v144, v145)
							else
								if v_u_36.Enabled then
									v_u_25:PlaySound(v_u_26.RestockAnimationSFX.No_Restock)
								end
								v_u_130(v144, Color3.fromRGB(249, 0, 2))
								v_u_124(v144, 0)
							end
							task.wait((v143 - 1) * 0.02 + 0.25)
							v_u_35[v144] = nil
						end
					end
				end
			end
			local v_u_150 = v_u_6:GetData()
			local v_u_151 = v_u_150.PetEggStock.Egg
			local v_u_152 = nil
			v114:Connect(function()
				-- upvalues: (copy) v_u_150, (ref) v_u_151, (ref) v_u_28, (ref) v_u_152, (copy) v_u_149
				if v_u_150 then
					if not v_u_151 or v_u_151 ~= v_u_150.PetEggStock.Egg then
						v_u_151 = v_u_150.PetEggStock.Egg
						local v153 = {}
						for v154, _ in v_u_28 do
							v153[v154] = true
						end
						if v_u_152 then
							task.cancel(v_u_152)
						end
						v_u_152 = task.delay(0.15, v_u_149, v153)
					end
				else
					return
				end
			end)
		end
	end)
end
task.spawn(v43.Start, v43)
return v43