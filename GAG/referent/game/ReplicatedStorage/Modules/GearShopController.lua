local v_u_1 = game:GetService("Debris")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_4 = v2.LocalPlayer
local v_u_5 = v_u_4:WaitForChild("PlayerGui"):WaitForChild("Gear_Shop")
local v_u_6 = require(v_u_3.Modules.GuiController)
local v_u_7 = require(v_u_3.Modules.DataService)
local v_u_8 = require(v_u_3.Modules.UpdateService)
local v_u_9 = require(v_u_3.Comma_Module)
local v10 = require(v_u_3.Modules.Signal)
local v_u_11 = require(v_u_3.Modules.FastTween)
local v_u_12 = require(v_u_3.Code.Spr)
local v_u_13 = require(v_u_3.Modules.Spring)
local v_u_14 = require(v_u_3.Data.GearShopData)
local v_u_15 = require(v_u_3.Data.GearShopData)
local v_u_16 = require(v_u_3.Item_Module)
require(v_u_3.Modules.RetryPcall)
local v_u_17 = require(v_u_3.Modules.UseDynamicPrices)
local v_u_18 = require(v_u_3.Modules.WatchButtonHold)
local v_u_19 = require(v_u_3.Modules.RebirthUnlocksSharedService)
local v_u_20 = require(v_u_3.Modules.TradeControllers.TradeWorldController)
local v_u_21 = require(v_u_3.Modules.MarketController)
local v_u_22 = require(v_u_3.Modules.GiftController)
local v_u_23 = require(v_u_3.Modules.NumberUtil)
local v_u_24 = require(v_u_3.Data.DevProductIds)
local v_u_25 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_26 = require(game.ReplicatedStorage.Data.SoundData)
local v_u_27 = require(v_u_3.Modules.NPCLevelHandler)
local v_u_28 = v_u_5:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
v_u_28:WaitForChild("UIListLayout")
local v_u_29 = v_u_5:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("Timer")
local v_u_30 = v_u_28:WaitForChild("ItemFrame")
v_u_30.Parent = script
local v_u_31 = v_u_28:WaitForChild("ItemPadding")
v_u_31.Parent = v_u_28
local v_u_32 = {}
local v_u_33 = {}
local v34 = {}
local v_u_35 = nil
local v_u_36 = v10.new()
local v_u_37 = {}
local v_u_38 = game.SoundService.Click
local v_u_39 = game.SoundService.Restock_SFX
local function v_u_43()
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_29, (copy) v_u_23, (copy) v_u_20, (copy) v_u_39, (copy) v_u_3
	while true do
		local v40 = workspace:GetServerTimeNow()
		local v41 = v_u_7:GetData()
		local v42 = v41.GearStock.ForcedGearEndTimestamp and (v41.GearStock.ForcedGearEndTimestamp - v40 or -1) or -1
		if v42 < 0 then
			v42 = v_u_14.RefreshTime - v40 % v_u_14.RefreshTime
		end
		v_u_29.Text = v42 <= 0 and "Restocking" or "New gear in " .. v_u_23.compactFormat(v42)
		if v42 <= 1 and not v_u_20:IsInWorld() then
			v_u_39.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_39.TimePosition = 0
			v_u_39.Playing = true
			require(v_u_3.Modules.Notification):CreateNotification("<font color=\"#90EE90\"><b>Your Gear Shop stock has restocked!</b></font>")
		end
		task.wait(1)
	end
end
local function v_u_106()
	-- upvalues: (copy) v_u_33, (copy) v_u_32, (copy) v_u_15, (copy) v_u_8, (copy) v_u_30, (copy) v_u_16, (copy) v_u_5, (copy) v_u_23, (copy) v_u_28, (copy) v_u_31, (copy) v_u_37, (copy) v_u_3, (copy) v_u_18, (copy) v_u_12, (copy) v_u_21, (copy) v_u_38, (copy) v_u_22, (ref) v_u_35, (copy) v_u_11, (copy) v_u_36, (copy) v_u_17, (copy) v_u_9, (copy) v_u_7, (copy) v_u_27, (copy) v_u_19, (copy) v_u_4
	for _, v44 in ipairs(v_u_33) do
		if v44.Connected then
			v44:Disconnect()
		end
	end
	table.clear(v_u_33)
	for _, v45 in v_u_32 do
		if v45:IsA("Frame") then
			v45:Destroy()
		end
	end
	table.clear(v_u_32)
	local v_u_46 = {}
	for v_u_47, v_u_48 in v_u_15.Gear do
		if v_u_48.LayoutOrder ~= -1 and not (v_u_8:IsHiddenFromUpdate(v_u_48.Gear.GearName) or v_u_8:IsHiddenAfterUpdate(v_u_48.Gear.GearName)) then
			local v_u_49 = v_u_30:Clone()
			v_u_32[v_u_47] = v_u_49
			v_u_49.Name = v_u_47
			v_u_49.LayoutOrder = v_u_48.LayoutOrder * 10
			table.insert(v_u_46, v_u_49)
			local v_u_50 = v_u_49.Main_Frame
			local v51 = v_u_16.Return_Rarity_Data(v_u_48.Gear.GearRarity)
			if v51 then
				local v52 = v51[1]
				local v53 = v51[2]
				local v54 = v51[3]
				v_u_50.Rarity_Text.Text = v52
				if v54 and v52 == "Prismatic" then
					local v_u_55 = nil
					v_u_55 = game:GetService("RunService").Heartbeat:Connect(function(_)
						-- upvalues: (ref) v_u_5, (copy) v_u_50, (ref) v_u_55
						if v_u_5.Enabled then
							if v_u_50 and v_u_50.Parent then
								local v56 = os.clock() * 0.1 % 1
								local v57 = Color3.fromHSV(v56, 1, 1)
								v_u_50.Rarity_BG.ImageColor3 = v57
								if v_u_50.Rarity_Text.UIStroke then
									local v58 = v_u_50.Rarity_Text.UIStroke
									local v59, v60, v61 = v57:ToHSV()
									v58.Color = Color3.fromHSV(v59, v60, v61 / 2)
								end
							else
								v_u_55:Disconnect()
							end
						else
							return
						end
					end)
				else
					if v_u_50.Rarity_Text.UIStroke then
						local v62 = v_u_50.Rarity_Text.UIStroke
						local v63, v64, v65 = v53:ToHSV()
						v62.Color = Color3.fromHSV(v63, v64, v65 / 2)
					end
					v_u_50.Rarity_BG.ImageColor3 = v53
				end
			end
			v_u_50.Gear_Text.Text = v_u_48.Gear.GearName
			v_u_50.Gear_Text_Shadow.Text = v_u_48.Gear.GearName
			v_u_50.LargeDescriptionText.Text = v_u_48.Gear.GearDescription
			v_u_50.LargeDescriptionText.Visible = false
			local v_u_66 = false
			local function v67()
				-- upvalues: (ref) v_u_66, (copy) v_u_50
				v_u_66 = not v_u_66
				v_u_50.LargeDescriptionText.Visible = v_u_66
				v_u_50.Rarity_BG.Visible = not v_u_66
				v_u_50.Rarity_Text.Visible = not v_u_66
				v_u_50.Stock_Text.Visible = not v_u_66
				v_u_50.Cost_Text.Visible = not v_u_66
			end
			v_u_50.InfoButton.Activated:Connect(v67)
			v_u_50.Cost_Text.Text = v_u_23.DisplaySheckles(v_u_48.Price)
			v_u_50:WaitForChild("Gear_Image").Image = v_u_48.Gear.Asset
			v_u_49.Parent = v_u_28
			local v_u_68 = UDim2.fromScale(0.13, 0.042)
			local v_u_69 = v_u_31:Clone()
			v_u_69.LayoutOrder = v_u_48.LayoutOrder * 10 + 1
			v_u_69.Name = v_u_47 .. "_Padding"
			v_u_69.Parent = v_u_28
			v_u_32[v_u_69.Name] = v_u_69
			local v_u_70 = v_u_49.Frame
			v_u_70.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_23.DisplaySheckles(v_u_48.Price)
			local function v71()
				-- upvalues: (ref) v_u_37, (copy) v_u_47, (ref) v_u_3
				if v_u_37[v_u_47] then
					require(v_u_3.Modules.Notification):CreateNotification("Restocking. Please wait...")
				else
					v_u_3.GameEvents.BuyGearStock:FireServer(v_u_47)
				end
			end
			local v_u_72 = false
			local v_u_73 = 0
			v_u_18(v_u_70.Sheckles_Buy, function(p74, p75)
				-- upvalues: (ref) v_u_73, (ref) v_u_72, (copy) v_u_70, (ref) v_u_12, (ref) v_u_37, (copy) v_u_47, (ref) v_u_3
				if workspace:GetAttribute("InTutorial") then
					return
				elseif p75 then
					v_u_73 = 0
					if v_u_72 then
						v_u_72 = false
						if v_u_70:FindFirstChild("Sheckles_Buy") then
							v_u_12.target(v_u_70.Sheckles_Buy, 0.8, 2, {
								["ImageColor3"] = Color3.new(1, 1, 1)
							})
						end
					end
					return
				else
					if not v_u_72 then
						v_u_72 = true
						if v_u_70:FindFirstChild("Sheckles_Buy") then
							v_u_12.target(v_u_70.Sheckles_Buy, 0.8, 2, {
								["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
							})
						end
					end
					if os.clock() >= v_u_73 then
						local v76 = p74 * -0.3
						local v77 = ((1 - math.exp(v76)) * 24 + 8) // 1
						local v78 = math.max(v77, 1)
						v_u_73 = os.clock() + 0.125
						for _ = 1, v78 do
							if v_u_37[v_u_47] then
								require(v_u_3.Modules.Notification):CreateNotification("Restocking. Please wait...")
							else
								v_u_3.GameEvents.BuyGearStock:FireServer(v_u_47)
							end
						end
					end
				end
			end, {
				["minimumHoldTime"] = 1,
				["interval"] = 0.125
			})
			v_u_70.Sheckles_Buy.Activated:Connect(v71)
			v_u_70.Robux_Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_21, (copy) v_u_48
				v_u_21:PromptPurchase(v_u_48.PurchaseID, Enum.InfoType.Product)
			end)
			v_u_70.Gift.Visible = v_u_48.GiftPurchaseID ~= nil
			if v_u_48.GiftPurchaseID then
				v_u_70.Gift.Activated:Connect(function()
					-- upvalues: (ref) v_u_38, (ref) v_u_22, (copy) v_u_48
					v_u_38.PlaybackSpeed = 1 + math.random(-15, 15) / 100
					v_u_38.TimePosition = 0
					v_u_38.Playing = true
					v_u_22:PromptGiftFromGiftId(v_u_48.GiftPurchaseID)
				end)
			end
			local function v80()
				-- upvalues: (ref) v_u_35, (copy) v_u_47, (copy) v_u_70, (ref) v_u_11, (copy) v_u_69, (copy) v_u_68
				if v_u_35 == v_u_47 then
					v_u_70.Visible = true
					v_u_11(v_u_70, TweenInfo.new(0.25), {
						["Position"] = UDim2.fromScale(0.515, 1.38)
					})
					v_u_11(v_u_69, TweenInfo.new(0.25), {
						["Size"] = UDim2.fromScale(0.13, 0.28)
					})
				else
					v_u_70.Visible = false
					v_u_11(v_u_70, TweenInfo.new(0.25), {
						["Position"] = UDim2.fromScale(0.5, 0.5)
					})
					local v79 = {
						["Size"] = v_u_68
					}
					v_u_11(v_u_69, TweenInfo.new(0.25), v79)
				end
			end
			v_u_36:Connect(v80)
			task.spawn(v80)
			local v_u_81 = false
			v_u_50.Activated:Connect(function()
				-- upvalues: (copy) v_u_46, (copy) v_u_49, (ref) v_u_11, (ref) v_u_28, (copy) v_u_68, (ref) v_u_35, (copy) v_u_47, (ref) v_u_36, (ref) v_u_81, (ref) v_u_17, (copy) v_u_48, (copy) v_u_70, (ref) v_u_21, (ref) v_u_9
				local v82 = table.find(v_u_46, v_u_49) or 1
				v_u_11(v_u_28, TweenInfo.new(0.35), {
					["CanvasPosition"] = Vector2.new(0, (v_u_49.AbsoluteSize.Y + v_u_68.Y.Scale * v_u_28.AbsoluteSize.Y) * (v82 - 1))
				})
				local v83
				if v_u_35 == v_u_47 then
					v83 = nil
				else
					v83 = v_u_47
				end
				v_u_35 = v83
				v_u_36:Fire()
				if not v_u_81 then
					if v_u_17 or v_u_48.FallbackPrice == nil then
						if not v_u_17 then
							warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_70:GetFullName()))))
						end
						v_u_21:SetPriceLabel(v_u_70.Robux_Buy.Price, v_u_48.PurchaseID, ":robux::value:")
					else
						v_u_70.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_9.Comma(v_u_48.FallbackPrice)))
					end
					v_u_81 = true
				end
			end)
			local v_u_84 = Instance.new("NumberValue")
			v_u_84.Value = 0
			v_u_84.Parent = v_u_70
			v_u_84.Changed:Connect(function(p85)
				-- upvalues: (copy) v_u_50
				v_u_50.Stock_Text.Text = ("X%* Stock"):format(p85 // 1)
			end)
			local v_u_86 = true
			local function v_u_94()
				-- upvalues: (ref) v_u_7, (copy) v_u_47, (ref) v_u_27, (copy) v_u_48, (ref) v_u_86, (ref) v_u_72, (copy) v_u_84, (ref) v_u_12, (copy) v_u_50, (copy) v_u_70, (ref) v_u_21, (ref) v_u_23, (ref) v_u_19, (ref) v_u_4
				local v87 = v_u_7:GetData()
				if v87 then
					v87 = v87.GearStock.Stocks[v_u_47]
				end
				local v88 = v87 and v87.Stock or 0
				local v89 = not v_u_27:HasRequiredNPCLevels(v_u_48.LevelLocks)
				if v_u_48.RobuxOnly or v89 then
					v_u_12.stop(v_u_84)
					v_u_50.Stock_Text.Text = ""
				elseif v_u_86 or not v_u_72 then
					v_u_86 = false
					v_u_84.Value = v88
				else
					v_u_12.target(v_u_84, 1, 1.5, {
						["Value"] = v88
					})
				end
				v_u_70.Sheckles_Buy.In_Stock.Visible = v88 > 0
				v_u_70.Sheckles_Buy.No_Stock.Visible = v88 <= 0
				v_u_70.Sheckles_Buy.HoverImage = v88 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
				v_u_70.Sheckles_Buy.Image = v88 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
				v_u_70.Sheckles_Buy.Visible = not (v_u_48.RobuxOnly or v89)
				if v89 and v_u_48.LevelLocks then
					local v90 = next(v_u_48.LevelLocks)
					local v91 = v90 and v_u_48.LevelLocks[v90] or 1
					v_u_50.Cost_Text.Text = ("LOCKED: lvl%*+"):format(v91)
					v_u_50.Cost_Text.TextColor3 = Color3.fromRGB(255, 0, 0)
				elseif v_u_48.RobuxOnly then
					v_u_50.Cost_Text.Text = "???"
					v_u_21:SetPriceLabel(v_u_50.Cost_Text, v_u_48.PurchaseID, ":robux::value:")
				else
					v_u_50.Cost_Text.Text = v88 <= 0 and "NO STOCK" or v_u_23.DisplaySheckles(v_u_48.Price)
					local v92 = v_u_50.Cost_Text
					local v93
					if v88 <= 0 then
						v93 = Color3.fromRGB(255, 0, 0)
					else
						v93 = Color3.fromRGB(0, 255, 0)
					end
					v92.TextColor3 = v93
				end
				if v_u_19:HasUnlockedShopItem(v_u_4, "Gear", v_u_47) then
					v_u_50.LockedFrame.Visible = false
					v_u_50.Interactable = true
				else
					v_u_50.LockedFrame.Visible = true
					v_u_50.Interactable = false
					v_u_50.LockedFrame.UnlockInfo.Text = ("Ascensions Required: %*"):format((v_u_19:GetRemainingRebirthsNeededForItem(v_u_4, "Gear", v_u_47)))
				end
			end
			task.spawn(v_u_94)
			task.spawn(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_94, (ref) v_u_33
				local v95 = v_u_7:GetPathSignal("GearStock/@")
				if v95 then
					local v96 = v95:Connect(v_u_94)
					local v97 = v_u_33
					table.insert(v97, v96)
				end
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_94, (ref) v_u_33
				local v98 = v_u_7:GetPathSignal("NPCPoints/@")
				if v98 then
					local v99 = v98:Connect(v_u_94)
					local v100 = v_u_33
					table.insert(v100, v99)
				end
			end)
			task.spawn(function()
				-- upvalues: (ref) v_u_19, (ref) v_u_4, (ref) v_u_7, (copy) v_u_94, (ref) v_u_33
				local v101 = v_u_19:HasBeenAssignedABTest(v_u_4) and v_u_7:GetPathSignal("RebirthData/TotalRebirths")
				if v101 then
					local v102 = v101:Connect(v_u_94)
					local v103 = v_u_33
					table.insert(v103, v102)
				end
			end)
		end
	end
	table.sort(v_u_46, function(p104, p105)
		if p104.LayoutOrder == p105.LayoutOrder then
			return p104.Name < p105.Name
		else
			return p104.LayoutOrder < p105.LayoutOrder
		end
	end)
end
function v34.Start(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_24, (copy) v_u_21, (copy) v_u_8, (copy) v_u_106, (copy) v_u_43, (copy) v_u_7, (copy) v_u_28, (copy) v_u_15, (copy) v_u_23, (copy) v_u_13, (copy) v_u_1, (copy) v_u_37, (copy) v_u_25, (copy) v_u_26
	v_u_6:UsePopupAnims(v_u_5)
	v_u_5.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_5
		v_u_6:Close(v_u_5)
	end)
	v_u_5.Frame.Frame.Restock.Activated:Connect(function()
		-- upvalues: (ref) v_u_24, (ref) v_u_21
		v_u_21:PromptPurchase(v_u_24.GearShopRestock.PurchaseID, Enum.InfoType.Product)
	end)
	if not v_u_8:IsUpdateDone() then
		task.delay(v_u_8:GetRemainingTimeUntilUpdate(), function()
			-- upvalues: (ref) v_u_106
			v_u_106()
		end)
	end
	task.spawn(v_u_43)
	v_u_106()
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_28, (ref) v_u_15, (ref) v_u_23, (ref) v_u_13, (ref) v_u_1, (ref) v_u_5, (ref) v_u_37, (ref) v_u_25, (ref) v_u_26
		local v107 = v_u_7:GetPathSignal("GearStock/@")
		if v107 then
			local function v_u_117(p108, p109)
				-- upvalues: (ref) v_u_28, (ref) v_u_15, (ref) v_u_23
				local v110 = v_u_28:FindFirstChild(p108)
				if v110 then
					local v111 = v_u_15.Gear[p108]
					if v111 then
						local v112 = v110.Main_Frame
						local v113 = v110.Frame
						local v114 = v112.Cost_Text
						local v115 = ("X%* Stock"):format(p109)
						local v116 = p109 > 0
						v112.Stock_Text.Text = v115
						v113.Sheckles_Buy.In_Stock.Visible = v116
						v113.Sheckles_Buy.No_Stock.Visible = not v116
						v113.Sheckles_Buy.HoverImage = v116 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
						v113.Sheckles_Buy.Image = v116 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
						if v116 then
							v114.Text = v_u_23.DisplaySheckles(v111.Price)
							v114.TextColor3 = Color3.fromRGB(0, 255, 0)
						else
							v114.Text = "NO STOCK"
							v114.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						warn((("No gear info found for id: %*"):format(p108)))
						return
					end
				else
					return
				end
			end
			local function v_u_123(p118, p119)
				-- upvalues: (ref) v_u_28, (ref) v_u_13, (ref) v_u_1
				local v120 = v_u_28:FindFirstChild(p118)
				if v120 then
					local v121 = v120.Main_Frame
					local v_u_122 = Instance.new("Frame")
					v_u_122.Size = UDim2.fromScale(0.98, 0.98)
					v_u_122.Position = UDim2.fromScale(0.5, 0.5)
					v_u_122.AnchorPoint = Vector2.new(0.5, 0.5)
					v_u_122.Transparency = 0.4
					v_u_122.BackgroundColor3 = p119
					v_u_122.ZIndex = 1000
					v_u_122.Parent = v121
					v_u_13.target(v_u_122, 1, 1, {
						["Transparency"] = 1
					})
					v_u_1:AddItem(v_u_122, 2.1)
					task.delay(2, function()
						-- upvalues: (copy) v_u_122
						if v_u_122 and v_u_122.Parent then
							v_u_122:Destroy()
						end
					end)
				end
			end
			local function v_u_132(p124)
				-- upvalues: (ref) v_u_28
				local v125 = {}
				for v126, _ in p124 do
					table.insert(v125, v126)
				end
				table.sort(v125, function(p127, p128)
					-- upvalues: (ref) v_u_28
					local v129 = v_u_28:FindFirstChild(p127)
					local v130 = not v129 and 0 or v129.LayoutOrder
					local v131 = v_u_28:FindFirstChild(p128)
					return v130 < (not v131 and 0 or v131.LayoutOrder)
				end)
				return v125
			end
			local function v_u_142(p133)
				-- upvalues: (ref) v_u_7, (copy) v_u_132, (ref) v_u_28, (ref) v_u_37, (copy) v_u_117, (ref) v_u_5, (ref) v_u_25, (ref) v_u_26, (ref) v_u_15, (copy) v_u_123
				local v134 = v_u_7:GetData()
				if v134 then
					local v135 = v_u_132(p133)
					table.clear(p133)
					for v136, v137 in v135 do
						if v_u_28:FindFirstChild(v137) then
							v_u_37[v137] = true
							local v138 = v134.GearStock.Stocks[v137] or {
								["MaxStock"] = 0,
								["Stock"] = 0
							}
							local v139 = v138 and v138.Stock or 0
							if v139 > 0 then
								for v140 = 0, v139 do
									v_u_117(v137, v140)
									if v_u_5.Enabled then
										v_u_25:PlaySound(v_u_26.RestockAnimationSFX.Stock_Click)
									end
									task.wait(0.05)
								end
								local v141 = not v_u_15.Gear[v137] and "Prismatic" or v_u_15.Gear[v137].Gear.GearRarity
								if v_u_5.Enabled then
									v_u_25:PlaySound(v_u_26.RestockAnimationSFX[v141 or "Prismatic"])
								end
								v_u_123(v137, Color3.fromRGB(24, 255, 0))
								v_u_117(v137, v139)
							else
								if v_u_5.Enabled then
									v_u_25:PlaySound(v_u_26.RestockAnimationSFX.No_Restock)
								end
								v_u_123(v137, Color3.fromRGB(249, 0, 2))
								v_u_117(v137, 0)
							end
							task.wait((v136 - 1) * 0.02 + 0.25)
							v_u_37[v137] = nil
						end
					end
				end
			end
			local v_u_143 = v_u_7:GetData()
			local v_u_144 = v_u_143.GearStock.Stocks
			local v_u_145 = nil
			v107:Connect(function()
				-- upvalues: (copy) v_u_143, (ref) v_u_144, (ref) v_u_15, (ref) v_u_145, (copy) v_u_142
				if not v_u_143 then
					return
				end
				if v_u_144 then
					local v146 = false
					for v147, v148 in v_u_143.GearStock.Stocks do
						if not v_u_144[v147] or v148.MaxStock ~= v_u_144[v147].MaxStock then
							v146 = true
							break
						end
					end
					if not v146 then
						return
					end
				end
				v_u_144 = v_u_143.GearStock.Stocks
				local v149 = {}
				for v150, _ in v_u_15.Gear do
					v149[v150] = true
				end
				if v_u_145 then
					task.cancel(v_u_145)
				end
				v_u_145 = task.delay(0.15, v_u_142, v149)
			end)
		end
	end)
end
task.spawn(v34.Start, v34)
return v34