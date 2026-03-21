local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("SoundService")
require(v1.Modules.GuiController)
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.UpdateService)
local v_u_5 = require(v1.Comma_Module)
local v6 = require(v1.Modules.Signal)
local v_u_7 = require(v1.Modules.FastTween)
local v_u_8 = require(v1.Code.Spr)
local v_u_9 = require(v1.Item_Module)
require(v1.Modules.RetryPcall)
local v_u_10 = require(v1.Modules.UseDynamicPrices)
local v_u_11 = require(v1.Modules.WatchButtonHold)
local v_u_12 = require(v1.Modules.MarketController)
require(v1.Modules.GiftController)
local v_u_13 = require(v1.Modules.NumberUtil)
local v_u_14 = require(v1.Data.DevProductIds)
require(v1.Modules.NPCLevelHandler)
require(v1.Modules.Notification)
local v_u_15 = require(v1.Data.SeasonPass.SeasonPassShopData)
local v_u_16 = require(v1.Data.SeasonPass.SeasonPassData)
local v_u_17 = require(v1.Modules.SeedPackOddsController)
local v_u_18 = require(v1.Modules.PetEggOddsController)
local v_u_19 = require(v1.Modules.CosmeticCrateOddsController)
require(v1.Modules.TradeControllers.TradeWorldController)
require(v1.Data.GearData)
local v_u_20 = require(v1.Data.SeedData)
local v21 = v1.GameEvents
local v_u_22 = v21.SeasonPass.BuySeasonPassStock
local v23 = v21:WaitForChild("ShecklesClient")
local v_u_24 = game.Players.LocalPlayer.PlayerGui:WaitForChild("SeasonPassUI")
local v_u_25 = v_u_24.SeasonPassFrame.Main.Store
local v_u_26 = v_u_25.ScrollingFrame
local v_u_27 = v_u_25.Timer
local v28 = v_u_24.SeasonPassTemplates
local v_u_29 = v28.SeasonPassShopItemTemplate
local v_u_30 = v28.SeasonPassShopPaddingTemplate
local v_u_31 = {}
local v_u_32 = {}
local v33 = {}
local v_u_34 = nil
local v_u_35 = v6.new()
local function v_u_39()
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_15
	local v36 = workspace:GetServerTimeNow()
	local v37 = v_u_3:GetData()
	if v37.SeasonPass[v_u_16.CurrentSeason] then
		local v38 = not v37.SeasonPass[v_u_16.CurrentSeason].ForcedItemEndTimestamp and -1 or v37.SeasonPass[v_u_16.CurrentSeason].ForcedItemEndTimestamp - v36
		if v38 >= 0 then
			return v38
		else
			return v_u_15.RefreshTime - v36 % v_u_15.RefreshTime
		end
	else
		return -1
	end
end
local _ = game.SoundService.Click
local function v_u_41()
	-- upvalues: (copy) v_u_39, (copy) v_u_27, (copy) v_u_13
	while true do
		local v40 = v_u_39()
		v_u_27.Text = v40 <= 0 and "Restocking" or "New item in " .. v_u_13.compactFormat(v40)
		task.wait(1)
	end
end
local function v_u_97()
	-- upvalues: (copy) v_u_32, (copy) v_u_31, (copy) v_u_16, (copy) v_u_4, (copy) v_u_29, (copy) v_u_9, (copy) v_u_24, (copy) v_u_5, (copy) v_u_17, (copy) v_u_19, (copy) v_u_18, (copy) v_u_26, (copy) v_u_30, (copy) v_u_22, (copy) v_u_11, (copy) v_u_8, (copy) v_u_12, (ref) v_u_34, (copy) v_u_7, (copy) v_u_35, (copy) v_u_10, (copy) v_u_20, (copy) v_u_3
	for _, v42 in ipairs(v_u_32) do
		if v42.Connected then
			v42:Disconnect()
		end
	end
	table.clear(v_u_32)
	for _, v43 in v_u_31 do
		if v43:IsA("Frame") then
			v43:Destroy()
		end
	end
	table.clear(v_u_31)
	local v_u_44 = {}
	for v_u_45, v_u_46 in v_u_16.ShopItems do
		if v_u_46.LayoutOrder ~= -1 then
			local v_u_47 = v_u_46.DisplayName or v_u_45
			local v48 = v_u_46.Rarity or "Empty Rarity"
			local v49 = v_u_46.Desc or ""
			local v50 = v_u_46.ImageId or "rbxassetid://6937742258"
			if not (v_u_4:IsHiddenFromUpdate(v_u_47) or v_u_4:IsHiddenAfterUpdate(v_u_47)) then
				local v_u_51 = v_u_29:Clone()
				v_u_31[v_u_45] = v_u_51
				v_u_51.Name = v_u_45
				v_u_51.LayoutOrder = v_u_46.LayoutOrder * 10
				table.insert(v_u_44, v_u_51)
				local v_u_52 = v_u_51.Main_Frame
				local v53 = v_u_9.Return_Rarity_Data(v48)
				if v53 then
					local v54 = v53[1]
					local v55 = v53[2]
					local v56 = v53[3]
					v_u_52.Rarity_Text.Text = v54
					if v56 and v54 == "Prismatic" then
						local v_u_57 = nil
						v_u_57 = game:GetService("RunService").Heartbeat:Connect(function(_)
							-- upvalues: (ref) v_u_24, (copy) v_u_52, (ref) v_u_57
							if v_u_24.Enabled then
								if v_u_52 and v_u_52.Parent then
									local v58 = os.clock() * 0.1 % 1
									local v59 = Color3.fromHSV(v58, 1, 1)
									v_u_52.Rarity_BG.ImageColor3 = v59
									if v_u_52.Rarity_Text.UIStroke then
										local v60 = v_u_52.Rarity_Text.UIStroke
										local v61, v62, v63 = v59:ToHSV()
										v60.Color = Color3.fromHSV(v61, v62, v63 / 2)
									end
								else
									v_u_57:Disconnect()
								end
							else
								return
							end
						end)
					else
						if v_u_52.Rarity_Text.UIStroke then
							local v64 = v_u_52.Rarity_Text.UIStroke
							local v65, v66, v67 = v55:ToHSV()
							v64.Color = Color3.fromHSV(v65, v66, v67 / 2)
						end
						v_u_52.Rarity_BG.ImageColor3 = v55
					end
				end
				v_u_52.Gear_Text.Text = v_u_47
				v_u_52.Gear_Text_Shadow.Text = v_u_47
				v_u_52.Description_Text.Text = v49
				v_u_52.Cost_Text.Text = v_u_5.Comma(v_u_46.Price)
				v_u_52:WaitForChild("Gear_Image").Image = v50
				if v_u_46.Type == "Seed Pack" then
					v_u_52.Gear_Image.OddsButton.Visible = true
					v_u_52.Gear_Image.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_17, (copy) v_u_47, (ref) v_u_24
						v_u_17:Open(v_u_47, v_u_24)
					end)
				elseif v_u_46.Type == "Crate" then
					v_u_52.Gear_Image.OddsButton.Visible = true
					v_u_52.Gear_Image.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_19, (copy) v_u_47, (ref) v_u_24
						v_u_19:Open(v_u_47, v_u_24)
					end)
				elseif v_u_46.Type == "Egg" then
					v_u_52.Gear_Image.OddsButton.Visible = true
					v_u_52.Gear_Image.OddsButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_18, (copy) v_u_47, (ref) v_u_24
						v_u_18:Open(v_u_47, v_u_24)
					end)
				else
					v_u_52.Gear_Image.OddsButton.Visible = false
				end
				v_u_51.Visible = true
				v_u_51.Parent = v_u_26.Content
				local v_u_68 = v_u_30:Clone()
				v_u_68.LayoutOrder = v_u_46.LayoutOrder * 10 + 1
				v_u_68.Name = v_u_45 .. "_Padding"
				v_u_68.Parent = v_u_26.Content
				v_u_31[v_u_68.Name] = v_u_68
				local v_u_69 = v_u_51.Frame
				v_u_69.Points_Buy.In_Stock.Cost_Text.Text = v_u_5.Comma(v_u_46.Price)
				local function v70()
					-- upvalues: (ref) v_u_22, (copy) v_u_45
					v_u_22:FireServer(v_u_45)
				end
				local v_u_71 = false
				local v_u_72 = 0
				v_u_11(v_u_69.Points_Buy, function(p73, p74)
					-- upvalues: (ref) v_u_72, (ref) v_u_71, (copy) v_u_69, (ref) v_u_8, (ref) v_u_22, (copy) v_u_45
					if workspace:GetAttribute("InTutorial") then
						return
					elseif p74 then
						v_u_72 = 0
						if v_u_71 then
							v_u_71 = false
							if v_u_69:FindFirstChild("Points_Buy") then
								v_u_8.target(v_u_69.Points_Buy, 0.8, 2, {
									["ImageColor3"] = Color3.new(1, 1, 1)
								})
							end
						end
						return
					else
						if not v_u_71 then
							v_u_71 = true
							if v_u_69:FindFirstChild("Points_Buy") then
								v_u_8.target(v_u_69.Points_Buy, 0.8, 2, {
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
								v_u_22:FireServer(v_u_45)
							end
						end
					end
				end, {
					["minimumHoldTime"] = 1,
					["interval"] = 0.125
				})
				v_u_69.Points_Buy.Activated:Connect(v70)
				v_u_69.Robux_Buy.Activated:Connect(function()
					-- upvalues: (ref) v_u_12, (copy) v_u_46
					v_u_12:PromptPurchase(v_u_46.PurchaseID, Enum.InfoType.Product)
				end)
				local function v78()
					-- upvalues: (ref) v_u_34, (copy) v_u_45, (copy) v_u_69, (ref) v_u_7, (copy) v_u_68
					if v_u_34 == v_u_45 then
						v_u_69.Visible = true
						v_u_7(v_u_69, TweenInfo.new(0.25), {
							["Position"] = UDim2.fromScale(0.5, 1.24)
						})
						v_u_7(v_u_68, TweenInfo.new(0.25), {
							["Size"] = UDim2.fromScale(0.13, 0.25)
						})
					else
						v_u_69.Visible = false
						v_u_7(v_u_69, TweenInfo.new(0.25), {
							["Position"] = UDim2.fromScale(0.5, 0.5)
						})
						v_u_7(v_u_68, TweenInfo.new(0.25), {
							["Size"] = UDim2.fromScale(0.13, 0.02)
						})
					end
				end
				v_u_35:Connect(v78)
				task.spawn(v78)
				local v_u_79 = false
				v_u_52.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (ref) v_u_26, (copy) v_u_51, (copy) v_u_44, (ref) v_u_34, (copy) v_u_45, (ref) v_u_35, (ref) v_u_79, (ref) v_u_10, (copy) v_u_46, (copy) v_u_69, (ref) v_u_12, (ref) v_u_5
					v_u_7(v_u_26, TweenInfo.new(0.35), {
						["CanvasPosition"] = Vector2.new(0, v_u_51.AbsoluteSize.Y * (table.find(v_u_44, v_u_51) - 1))
					})
					local v80
					if v_u_34 == v_u_45 then
						v80 = nil
					else
						v80 = v_u_45
					end
					v_u_34 = v80
					v_u_35:Fire()
					if not v_u_79 then
						if v_u_10 or v_u_46.FallbackPrice == nil then
							if not v_u_10 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_69:GetFullName()))))
							end
							v_u_12:SetPriceLabel(v_u_69.Robux_Buy.Price, v_u_46.PurchaseID, ":robux::value:")
						else
							v_u_69.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_5.Comma(v_u_46.FallbackPrice)))
						end
						v_u_79 = true
					end
				end)
				if v_u_46.Type == "Seed" then
					local v_u_81 = nil
					local v_u_82 = nil
					v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_20[v_u_47].Asset
					v_u_51.Main_Frame.CanvasGroup.Visible = true
					v_u_51.Main_Frame.Gear_Image.Visible = false
					v_u_52.MouseEnter:Connect(function()
						-- upvalues: (ref) v_u_81, (ref) v_u_7, (copy) v_u_51, (ref) v_u_82, (ref) v_u_20, (copy) v_u_47
						v_u_81 = v_u_7(v_u_51.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
							["Rotation"] = v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
						})
						v_u_82 = v_u_7(v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1.5
						})
						v_u_82.Completed:Connect(function(p83)
							-- upvalues: (ref) v_u_51, (ref) v_u_20, (ref) v_u_47
							if p83 == Enum.PlaybackState.Completed then
								if not v_u_51:IsDescendantOf(game) then
									return
								end
								v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_20[v_u_47].FruitIcon
							end
						end)
					end)
					v_u_52.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_81, (copy) v_u_51, (ref) v_u_20, (copy) v_u_47, (ref) v_u_7
						if v_u_81 then
							v_u_81:Cancel()
						end
						v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
						v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_20[v_u_47].Asset
						v_u_7(v_u_51.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Scale"] = 1
						})
					end)
				end
				local v_u_84 = Instance.new("NumberValue")
				v_u_84.Value = 0
				v_u_84.Parent = v_u_69
				v_u_84.Changed:Connect(function(p85)
					-- upvalues: (copy) v_u_52
					v_u_52.Stock_Text.Text = ("X%* Stock"):format(p85 // 1)
				end)
				local v_u_86 = true
				local function v_u_91()
					-- upvalues: (ref) v_u_3, (ref) v_u_16, (copy) v_u_45, (copy) v_u_46, (ref) v_u_86, (ref) v_u_71, (copy) v_u_84, (ref) v_u_8, (copy) v_u_52, (copy) v_u_69, (ref) v_u_12, (ref) v_u_5
					local v87 = v_u_3:GetData()
					if v87 then
						v87 = v87.SeasonPass[v_u_16.CurrentSeason].Stocks[v_u_45]
					end
					local v88 = v87 and v87.Stock or 0
					if v_u_46.RobuxOnly then
						v_u_8.stop(v_u_84)
						v_u_52.Stock_Text.Text = ""
					elseif v_u_86 or not v_u_71 then
						v_u_86 = false
						v_u_84.Value = v88
					else
						v_u_8.target(v_u_84, 1, 1.5, {
							["Value"] = v88
						})
					end
					v_u_69.Points_Buy.In_Stock.Visible = v88 > 0
					v_u_69.Points_Buy.No_Stock.Visible = v88 <= 0
					v_u_69.Points_Buy.HoverImage = v88 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
					v_u_69.Points_Buy.Image = v88 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
					v_u_69.Points_Buy.Visible = not v_u_46.RobuxOnly
					if v_u_46.RobuxOnly then
						v_u_52.Cost_Text.Text = "???"
						v_u_12:SetPriceLabel(v_u_52.Cost_Text, v_u_46.PurchaseID, ":robux::value:")
					else
						v_u_52.Cost_Text.Text = v88 <= 0 and "NO STOCK" or v_u_5.Comma(v_u_46.Price)
						local v89 = v_u_52.Cost_Text
						local v90
						if v88 <= 0 then
							v90 = Color3.fromRGB(255, 0, 0)
						else
							v90 = Color3.fromRGB(0, 255, 0)
						end
						v89.TextColor3 = v90
					end
				end
				task.spawn(v_u_91)
				task.spawn(function()
					-- upvalues: (ref) v_u_3, (ref) v_u_16, (copy) v_u_91, (ref) v_u_32
					local v92 = v_u_3:GetPathSignal((("SeasonPass/%*/@"):format(v_u_16.CurrentSeason)))
					if v92 then
						local v93 = v92:Connect(v_u_91)
						local v94 = v_u_32
						table.insert(v94, v93)
					end
				end)
			end
		end
	end
	table.sort(v_u_44, function(p95, p96)
		if p95.LayoutOrder == p96.LayoutOrder then
			return p95.Name < p96.Name
		else
			return p95.LayoutOrder < p96.LayoutOrder
		end
	end)
end
function v33.UpdateShopFrames()
	-- upvalues: (copy) v_u_97
	v_u_97()
end
function v33.Start(_)
	-- upvalues: (copy) v_u_25, (copy) v_u_14, (copy) v_u_12, (copy) v_u_4, (copy) v_u_97, (copy) v_u_41, (copy) v_u_3
	v_u_25.Refresh.Activated:Connect(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_12
		v_u_12:PromptPurchase(v_u_14.SeasonPassShopRestock.PurchaseID, Enum.InfoType.Product)
	end)
	if not v_u_4:IsUpdateDone() then
		task.delay(v_u_4:GetRemainingTimeUntilUpdate(), function()
			-- upvalues: (ref) v_u_97
			v_u_97()
		end)
	end
	task.spawn(v_u_41)
	v_u_97()
	local v98 = v_u_3:GetData()
	if v98 then
		local v99 = v98.SpecialCurrency.PassPoints
		v_u_25.Currency.TextLabel.Text = tostring(v99)
	else
		warn("No player data")
	end
end
v23.OnClientEvent:Connect(function(p100)
	-- upvalues: (copy) v_u_2
	if type(p100) == "string" then
		local v101 = v_u_2:FindFirstChild(p100, true)
		if v101 then
			v101.TimePosition = 0
			v101.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v101:Play()
		end
	else
		return
	end
end)
local v102 = v_u_3:GetPathSignal("SpecialCurrency/PassPoints/@")
if v102 then
	v102:Connect(function(_, _, _)
		-- upvalues: (copy) v_u_3, (copy) v_u_25
		local v103 = v_u_3:GetData()
		if v103 then
			local v104 = v103.SpecialCurrency.PassPoints
			v_u_25.Currency.TextLabel.Text = tostring(v104)
		else
			warn("No player data")
		end
	end)
end
return v33