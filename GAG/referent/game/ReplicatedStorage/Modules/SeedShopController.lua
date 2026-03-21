local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ReplicatedFirst")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("ContentProvider")
game:GetService("TweenService")
local v_u_4 = game:GetService("AdService")
local v_u_5 = game.Players.LocalPlayer
local v_u_6 = v_u_5.PlayerGui:WaitForChild("Seed_Shop")
local v_u_7 = require(v_u_1.Modules.GuiController)
local v_u_8 = require(v_u_1.Modules.DataService)
local v_u_9 = require(v_u_1.Modules.UpdateService)
local v_u_10 = require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.Observers)
local v_u_11 = require(v_u_1.Comma_Module)
local v12 = require(v_u_1.Modules.Signal)
local v_u_13 = require(v_u_1.Modules.UseDynamicPrices)
local v_u_14 = require(v_u_1.Modules.WatchButtonHold)
local v_u_15 = require(v_u_1.Data.CurrencyData)
require(v_u_1.Code.Particle2D)
local v_u_16 = require(v_u_1.Modules.RebirthUnlocksSharedService)
local v_u_17 = require(v_u_1.Modules.TradeControllers.TradeWorldController)
local v_u_18 = require(v_u_1.Modules.FastTween)
local v_u_19 = require(v_u_1.Code.Spr)
local v_u_20 = require(v_u_1.Modules.MarketController)
local v_u_21 = require(v_u_1.Modules.GiftController)
local v_u_22 = require(v_u_1.Data.SeedShopConfigData)
local v_u_23 = require(v_u_1.Modules.ShopTabHandler)
local v_u_24 = require(v_u_1.Data.ShopTabData)
local v_u_25 = require(v_u_1.Modules.NPCLevelHandler)
local v_u_26 = require(v_u_1.Item_Module)
require(v_u_1.Modules.DumpTable)
require(v_u_1.Modules.PlantTraitsData)
local v_u_27 = require(v_u_1.Data.DevProductIds)
local v_u_28 = v_u_1.GameEvents:WaitForChild("RewardedAdEvent")
require(v_u_1.UserGenerated.Client.ClientABTests)
local v_u_29 = nil
local v_u_30 = v12.new()
local v_u_31 = v_u_6:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
v_u_31:WaitForChild("UIListLayout")
local v_u_32 = v_u_6:WaitForChild("Frame"):WaitForChild("Frame"):WaitForChild("Timer")
local v_u_33 = v_u_31:WaitForChild("ItemFrame")
v_u_33.Parent = script
local v_u_34 = v_u_31:WaitForChild("ItemPadding")
v_u_34.Parent = v_u_31
local v35 = require(game.ReplicatedStorage.Data.SeedShopData)
local v36 = require(game.ReplicatedStorage.Data.DailySeedShopData)
local v_u_37 = v_u_6:WaitForChild("Frame")
local v_u_38 = v_u_6:WaitForChild("Daily")
local v_u_39 = require(game.ReplicatedStorage.Data.SeedData)
local v_u_40 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_41 = require(game.ReplicatedStorage.Data.SoundData)
local v_u_42 = {}
local v_u_43 = {}
local v_u_44 = {}
local v45 = {}
local v_u_46 = require(v_u_1.Modules.Spring)
local v_u_47 = {}
local v_u_48 = false
local v_u_49 = nil
local v_u_50 = nil
local v_u_51 = {}
local v52 = require(v_u_1.Modules.UITabHelperModule)
local v53 = v_u_6:WaitForChild("TabAnchor"):WaitForChild("TabList")
local v54 = v_u_1.UITemplates:WaitForChild("TabButtonTemplate")
local v_u_55 = v52.CreateOrGetTabHandler("SeedShop", v53, v54)
v_u_55.DefaultCategory = "Shop"
v_u_55.CurrentCategory = "Shop"
local v_u_56 = {
	["Shop"] = v35,
	["Daily Deals"] = v36
}
local v_u_57 = {
	{
		["Name"] = "Shop",
		["IsLocked"] = false
	},
	{
		["Name"] = "Daily Deals",
		["IsLocked"] = false
	}
}
local function v_u_65()
	-- upvalues: (copy) v_u_8, (copy) v_u_55, (copy) v_u_24, (copy) v_u_22
	local v58 = workspace:GetServerTimeNow()
	local v59 = v_u_8:GetData()
	local v60 = v_u_55.CurrentCategory
	local v61 = v60 == "Daily Deals" and "Shop" or v60
	local v62 = v59.SeedStocks[v61]
	local v63 = v62 and v62.ForcedSeedEndTimestamp and (v62.ForcedSeedEndTimestamp - v58 or -1) or -1
	if v63 >= 0 then
		return v63
	end
	local v64 = (v_u_24.Seed[v61] or v_u_22).RefreshTime
	return v64 - v58 % v64
end
local v_u_66 = game:GetService("CollectionService")
local function v_u_70(p67)
	-- upvalues: (copy) v_u_66
	local v68 = v_u_66:GetTagged(p67)
	for _, v69 in ipairs(v68) do
		if v69:IsA("TextLabel") then
			return v69
		end
	end
	return nil
end
local v_u_71 = {}
function UPD_Restock_Timer_AB(p72)
	-- upvalues: (copy) v_u_70, (copy) v_u_71
	local v73 = p72:GetAttribute("AB_RestockTimer_NEW")
	local v74 = v73 == nil and "Not_Visible" or v73
	if v74 ~= "Not_Visible" then
		if v74 == "SeedShopRestock_1" then
			local v_u_75 = v_u_70("SeedShopRestock_1")
			if v_u_75 then
				local v_u_76 = v_u_75.Parent
				v_u_76.Enabled = true
				local v77 = v_u_71
				table.insert(v77, v_u_75)
				return function()
					-- upvalues: (copy) v_u_76, (ref) v_u_71, (copy) v_u_75
					v_u_76.Enabled = false
					local v78 = table.find(v_u_71, v_u_75)
					if v78 then
						table.remove(v_u_71, v78)
					end
				end
			end
		elseif v74 == "SeedShopRestock_2" then
			local v_u_79 = v_u_70("SeedShopRestock_2")
			if v_u_79 then
				local v_u_80 = v_u_79.Parent.Parent
				v_u_80.Enabled = true
				local v81 = v_u_71
				table.insert(v81, v_u_79)
				return function()
					-- upvalues: (copy) v_u_80, (ref) v_u_71, (copy) v_u_79
					v_u_80.Enabled = false
					local v82 = table.find(v_u_71, v_u_79)
					if v82 then
						table.remove(v_u_71, v82)
					end
				end
			end
		else
			local v_u_83 = v74 == "SeedShopRestock_3" and v_u_70("SeedShopRestock_3")
			if v_u_83 then
				local v_u_84 = v_u_83.Parent.Parent
				v_u_84.Enabled = true
				local v85 = v_u_71
				table.insert(v85, v_u_83)
				return function()
					-- upvalues: (copy) v_u_84, (ref) v_u_71, (copy) v_u_83
					v_u_84.Enabled = false
					local v86 = table.find(v_u_71, v_u_83)
					if v86 then
						table.remove(v_u_71, v86)
					end
				end
			end
		end
	end
end
UPD_Restock_Timer_AB(v_u_5)
v_u_5:GetAttributeChangedSignal("AB_RestockTimer_NEW"):Connect(function()
	-- upvalues: (copy) v_u_5
	UPD_Restock_Timer_AB(v_u_5)
end)
local _ = game.SoundService.Click
local v_u_87 = game.SoundService.Restock_SFX
local function v_u_90()
	-- upvalues: (copy) v_u_65, (copy) v_u_32, (copy) v_u_10, (copy) v_u_71, (copy) v_u_17, (copy) v_u_87
	local v88 = v_u_65()
	v_u_32.Text = v88 <= 0 and "Restocking" or "New seeds in " .. v_u_10.compactFormat(v88)
	for _, v89 in v_u_71 do
		v89.Text = v88 <= 0 and "Now" or v_u_10.compactFormat(v88)
	end
	if v88 <= 1 and not v_u_17:IsInWorld() then
		v_u_87.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_87.TimePosition = 0
		v_u_87.Playing = true
		require(game.ReplicatedStorage.Modules.Notification):CreateNotification("<font color=\"#ADD8E6\"><b>Your Seed Shop stock has restocked!</b></font>")
	end
end
local function v_u_91()
	-- upvalues: (copy) v_u_90
	while true do
		v_u_90()
		task.wait(1)
	end
end
local v_u_92 = game.SoundService.Click
task.spawn(function()
	-- upvalues: (copy) v_u_6
	local v_u_93 = game:GetService("TweenService")
	local v_u_94 = nil
	game.Workspace:GetAttributeChangedSignal("RestockFever"):Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_94, (copy) v_u_93
		local v95 = v_u_6:FindFirstChild("RainbowBackground")
		if v95 then
			local v96 = v95:FindFirstChild("UIGradient")
			if v96 then
				if v_u_94 then
					v_u_94:Cancel()
				end
				if game.Workspace:GetAttribute("RestockFever") then
					v95.Transparency = 0
					v_u_94 = v_u_93:Create(v96, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
						["Rotation"] = v96.Rotation + 360
					})
					v_u_94:Play()
				else
					if v_u_94 then
						v_u_94:Cancel()
					end
					v96.Rotation = 0
					v95.Transparency = 1
				end
			else
				return
			end
		else
			return
		end
	end)
end)
local function v_u_250()
	-- upvalues: (copy) v_u_43, (copy) v_u_44, (copy) v_u_42, (copy) v_u_2, (copy) v_u_56, (copy) v_u_55, (copy) v_u_3, (ref) v_u_49, (ref) v_u_48, (copy) v_u_23, (copy) v_u_9, (copy) v_u_5, (copy) v_u_1, (copy) v_u_33, (copy) v_u_26, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_31, (copy) v_u_18, (copy) v_u_34, (copy) v_u_8, (copy) v_u_14, (copy) v_u_19, (copy) v_u_20, (copy) v_u_92, (copy) v_u_21, (copy) v_u_15, (ref) v_u_29, (copy) v_u_30, (copy) v_u_13, (copy) v_u_46, (copy) v_u_51, (copy) v_u_40, (copy) v_u_41, (copy) v_u_39, (copy) v_u_47, (ref) v_u_50, (copy) v_u_25, (copy) v_u_16
	for _, v97 in ipairs(v_u_43) do
		if v97.Connected then
			v97:Disconnect()
		end
	end
	table.clear(v_u_43)
	for _, v98 in v_u_44 do
		if v98 then
			task.cancel(v98)
		end
	end
	table.clear(v_u_44)
	for _, v99 in v_u_42 do
		if v99:IsA("Frame") then
			v99:Destroy()
		end
	end
	table.clear(v_u_42)
	if not v_u_2.TouchEnabled then
		local v_u_100 = {}
		for _, v101 in v_u_56[v_u_55.CurrentCategory] do
			if v101.DisplayInShop and v101.Seed then
				local v102 = Instance.new("ImageLabel")
				v102.Image = v101.Seed.FruitIcon
				table.insert(v_u_100, v102)
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_100
			v_u_3:PreloadAsync(v_u_100)
			for _, v103 in v_u_100 do
				v103:Destroy()
			end
			table.clear(v_u_100)
		end)
	end
	local v_u_104 = {}
	for v_u_105, v_u_106 in v_u_56[v_u_55.CurrentCategory] do
		if v_u_106.DisplayInShop and v_u_106.Seed then
			if v_u_49 then
				task.cancel(v_u_49)
				v_u_48 = false
			end
			local v107 = v_u_23:IsItemLockedByTab("Seed", v_u_105)
			local v_u_108 = v_u_55.CurrentCategory
			if v107 then
				local v109 = false
				for _, v110 in v107 do
					if v_u_23:IsTabUnlocked("Seed", v110) then
						v109 = true
						break
					end
				end
				if table.find(v107, v_u_55.CurrentCategory) and v109 then
					goto l27
				end
			else
				::l27::
				if (v107 or (not v_u_55.CurrentCategory or v_u_55.CurrentCategory == v_u_55.DefaultCategory)) and not (v_u_9:IsHiddenFromUpdate(v_u_106.Seed.SeedName) or v_u_9:IsHiddenAfterUpdate(v_u_106.Seed.SeedName)) then
					if v_u_106.ABTestName then
						local v111 = v_u_5
						local v112 = v_u_106.ABTestName
						local v113 = require(v_u_1.UserGenerated.Client.ClientABTests)
						local v114
						if v113.GetAssignmentsAsync(v111, true) then
							v114 = v113.GetAttributeAsync(v111, v112, true) and true or false
						else
							v114 = false
						end
						if v114 then
							goto l40
						end
					else
						::l40::
						local v_u_115 = v_u_33:Clone()
						v_u_42[v_u_105] = v_u_115
						v_u_115.Name = v_u_105
						v_u_115.LayoutOrder = v_u_106.LayoutOrder * 10
						table.insert(v_u_104, v_u_115)
						local v_u_116 = v_u_115.Main_Frame
						local v117 = v_u_26.Return_Rarity_Data(v_u_106.Seed.SeedRarity)
						if v117 then
							local v118 = v117[1]
							local v119 = v117[2]
							local v120 = v117[3]
							v_u_116.Rarity_Text.Text = v118
							if v120 and v118 == "Prismatic" then
								local v_u_121 = nil
								v_u_121 = game:GetService("RunService").Heartbeat:Connect(function(_)
									-- upvalues: (ref) v_u_6, (copy) v_u_116, (ref) v_u_121
									if v_u_6.Enabled then
										if v_u_116 and v_u_116.Parent then
											local v122 = os.clock() * 0.1 % 1
											local v123 = Color3.fromHSV(v122, 1, 1)
											v_u_116.Rarity_BG.ImageColor3 = v123
											if v_u_116.Rarity_Text.UIStroke then
												local v124 = v_u_116.Rarity_Text.UIStroke
												local v125, v126, v127 = v123:ToHSV()
												v124.Color = Color3.fromHSV(v125, v126, v127 / 2)
											end
										else
											v_u_121:Disconnect()
										end
									else
										return
									end
								end)
							elseif v118 == "Transcendent" then
								v_u_116.Rarity_BG.TranscendantSparkles.Visible = true
								local v_u_128 = nil
								local v_u_129 = 1
								v_u_128 = game:GetService("RunService").Heartbeat:Connect(function(p130)
									-- upvalues: (ref) v_u_6, (copy) v_u_116, (ref) v_u_128, (ref) v_u_129
									if v_u_6.Enabled then
										if v_u_116 and v_u_116.Parent then
											Random.new()
											for _, v131 in v_u_116.Rarity_BG.TranscendantSparkles:GetChildren() do
												v131.Rotation = v131.Rotation + 10 * p130
												local v132 = v131.Size.X.Offset + v_u_129 * 1
												if v132 >= 50 then
													v132 = 50
													v_u_129 = -1
												elseif v132 <= 0 then
													v132 = 0
													v_u_129 = 1
												end
												v131.Size = UDim2.new(0, v132, 0, v132)
											end
										else
											v_u_128:Disconnect()
										end
									else
										return
									end
								end)
								if v_u_116.Rarity_Text.UIStroke then
									local v133 = v_u_116.Rarity_Text.UIStroke
									local v134, v135, v136 = v119:ToHSV()
									v133.Color = Color3.fromHSV(v134, v135, v136 / 2)
								end
								v_u_116.Rarity_BG.ImageColor3 = Color3.new(1, 1, 1)
								v_u_116.Rarity_BG.UIGradient.Enabled = true
								v_u_116.Rarity_BG.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 149, 1), Color3.fromRGB(255, 238, 5))
							else
								if v_u_116.Rarity_Text.UIStroke then
									local v137 = v_u_116.Rarity_Text.UIStroke
									local v138, v139, v140 = v119:ToHSV()
									v137.Color = Color3.fromHSV(v138, v139, v140 / 2)
								end
								v_u_116.Rarity_BG.ImageColor3 = v119
							end
						end
						v_u_116.Seed_Text.Text = v_u_106.Seed.SeedName
						v_u_116.Seed_Text_Shadow.Text = v_u_106.Seed.SeedName
						local v_u_141
						if v_u_106.SpecialCurrencyType then
							v_u_141 = v_u_11.Comma(v_u_106.Price) .. ""
						else
							v_u_141 = v_u_10.DisplaySheckles(v_u_106.Price)
						end
						if v_u_106.Description then
							v_u_116.LargeDescriptionText.Text = v_u_106.Description
							v_u_116.InfoButton.Visible = true
						else
							v_u_116.InfoButton.Visible = false
							v_u_116.Seed_Text.Size = UDim2.fromScale(0.652, v_u_116.Seed_Text.Size.Y.Scale)
							v_u_116.Seed_Text_Shadow.Size = UDim2.fromScale(0.652, v_u_116.Seed_Text_Shadow.Size.Y.Scale)
						end
						v_u_116.LargeDescriptionText.Visible = false
						local v_u_142 = false
						local function v143()
							-- upvalues: (ref) v_u_142, (copy) v_u_116
							v_u_142 = not v_u_142
							v_u_116.LargeDescriptionText.Visible = v_u_142
							v_u_116.Rarity_BG.Visible = not v_u_142
							v_u_116.Rarity_Text.Visible = not v_u_142
							v_u_116.Stock_Text.Visible = not v_u_142
							v_u_116.Cost_Text.Visible = not v_u_142
						end
						v_u_116.InfoButton.Activated:Connect(v143)
						if v_u_106.IsLimited then
							v_u_116.LimitedBanner.Visible = true
						end
						v_u_115.Parent = v_u_31
						v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_106.Seed.Asset
						local v_u_144 = nil
						local v_u_145 = nil
						v_u_116.MouseEnter:Connect(function()
							-- upvalues: (ref) v_u_144, (ref) v_u_18, (copy) v_u_115, (ref) v_u_145, (copy) v_u_106
							v_u_144 = v_u_18(v_u_115.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
								["Rotation"] = v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
							})
							v_u_145 = v_u_18(v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1.5
							})
							v_u_145.Completed:Connect(function(p146)
								-- upvalues: (ref) v_u_115, (ref) v_u_106
								if p146 == Enum.PlaybackState.Completed then
									if not v_u_115:IsDescendantOf(game) then
										return
									end
									v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_106.Seed.FruitIcon
								end
							end)
						end)
						v_u_116.MouseLeave:Connect(function()
							-- upvalues: (ref) v_u_144, (copy) v_u_115, (copy) v_u_106, (ref) v_u_18
							if v_u_144 then
								v_u_144:Cancel()
							end
							v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
							v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_106.Seed.Asset
							v_u_18(v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1
							})
						end)
						local v147 = v_u_6:GetPropertyChangedSignal("Enabled"):Connect(function()
							-- upvalues: (ref) v_u_6, (ref) v_u_144, (copy) v_u_115, (copy) v_u_106, (ref) v_u_18
							if not v_u_6.Enabled then
								if v_u_144 then
									v_u_144:Cancel()
								end
								v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
								v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_106.Seed.Asset
								v_u_18(v_u_115.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
									["Scale"] = 1
								})
							end
						end)
						local v148 = v_u_43
						table.insert(v148, v147)
						local v_u_149 = v_u_34:Clone()
						v_u_149.LayoutOrder = v_u_106.LayoutOrder * 10 + 1
						v_u_149.Name = ("%*_Padding"):format(v_u_105)
						v_u_149.Parent = v_u_31
						v_u_42[v_u_149.Name] = v_u_149
						local v_u_150 = v_u_115.Frame
						if v_u_150.Sheckles_Buy.In_Stock.Cost_Text:FindFirstChild("TEXT") then
							v_u_150.Sheckles_Buy.In_Stock.Cost_Text.TEXT.Text = v_u_141
						else
							v_u_150.Sheckles_Buy.In_Stock.Cost_Text.Text = v_u_141
						end
						if v_u_106.EndTime then
							local v152 = task.spawn(function()
								-- upvalues: (copy) v_u_106, (copy) v_u_116, (ref) v_u_10
								while true do
									local v151 = v_u_106.EndTime - workspace:GetServerTimeNow()
									v_u_116.LimitedBanner.Timer.Text = v_u_10.formatShopTime(v151)
									v_u_116.LimitedBanner.Timer.Visible = v151 > 0
									task.wait(1)
								end
							end)
							local v153 = v_u_44
							table.insert(v153, v152)
						end
						local function v_u_159()
							-- upvalues: (copy) v_u_105, (ref) v_u_48, (ref) v_u_8, (copy) v_u_115, (ref) v_u_1, (copy) v_u_108
							if not workspace:GetAttribute("InTutorial") or v_u_105 == "Carrot" then
								if v_u_48 then
									local v154 = v_u_8:GetData()
									if v154 then
										local v155 = v_u_105
										local v156 = v154.SeedStocks.Shop
										v154 = not v156.Stocks[v155] and {
											["MaxStock"] = 0,
											["Stock"] = 0
										} or v156.Stocks[v155]
									end
									local v157 = v154 and v154.Stock or 0
									local v158 = v_u_115.Main_Frame:GetAttribute("CurrentStock")
									if v158 and v158 < v157 then
										return
									end
								end
								v_u_1.GameEvents.BuySeedStock:FireServer(v_u_108 or "Shop", v_u_105)
							end
						end
						local v_u_160 = false
						local v_u_161 = 0
						v_u_14(v_u_150.Sheckles_Buy, function(p162, p163)
							-- upvalues: (ref) v_u_161, (ref) v_u_160, (copy) v_u_150, (ref) v_u_19, (copy) v_u_159
							if workspace:GetAttribute("InTutorial") then
								return
							elseif p163 then
								v_u_161 = 0
								if v_u_160 then
									v_u_160 = false
									if v_u_150:FindFirstChild("Sheckles_Buy") then
										v_u_19.target(v_u_150.Sheckles_Buy, 0.8, 2, {
											["ImageColor3"] = Color3.new(1, 1, 1)
										})
									end
								end
								return
							else
								if not v_u_160 then
									v_u_160 = true
									if v_u_150:FindFirstChild("Sheckles_Buy") then
										v_u_19.target(v_u_150.Sheckles_Buy, 0.8, 2, {
											["ImageColor3"] = Color3.new(0.5, 0.5, 0.5)
										})
									end
								end
								if os.clock() >= v_u_161 then
									local v164 = p162 * -0.3
									local v165 = ((1 - math.exp(v164)) * 24 + 8) // 1
									local v166 = math.max(v165, 1)
									v_u_161 = os.clock() + 0.125
									for _ = 1, v166 do
										v_u_159()
									end
								end
							end
						end, {
							["minimumHoldTime"] = 1,
							["interval"] = 0.125
						})
						v_u_150.Sheckles_Buy.Activated:Connect(v_u_159)
						v_u_150.Robux_Buy.Activated:Connect(function()
							-- upvalues: (ref) v_u_20, (copy) v_u_106
							v_u_20:PromptPurchase(v_u_106.PurchaseID, Enum.InfoType.Product)
						end)
						v_u_150.Gift.Visible = v_u_106.GiftPurchaseID ~= nil
						if v_u_106.GiftPurchaseID then
							v_u_150.Gift.Activated:Connect(function()
								-- upvalues: (ref) v_u_92, (ref) v_u_21, (copy) v_u_106
								v_u_92.PlaybackSpeed = 1 + math.random(-15, 15) / 100
								v_u_92.TimePosition = 0
								v_u_92.Playing = true
								v_u_21:PromptGiftFromGiftId(v_u_106.GiftPurchaseID)
							end)
						end
						if v_u_106.SpecialCurrencyType and v_u_15[v_u_106.SpecialCurrencyType] then
							v_u_116.Cost_Text.CurrencyImage.Image = v_u_15[v_u_106.SpecialCurrencyType].Icon
							v_u_150.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Image = v_u_15[v_u_106.SpecialCurrencyType].Icon
						else
							v_u_116.Cost_Text.CurrencyImage.Visible = false
							v_u_150.Sheckles_Buy.In_Stock.Cost_Text.CurrencyImage.Visible = false
						end
						local function v167()
							-- upvalues: (ref) v_u_29, (copy) v_u_105, (copy) v_u_150, (ref) v_u_18, (copy) v_u_149
							if v_u_29 == v_u_105 then
								v_u_150.Visible = true
								v_u_18(v_u_150, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["Position"] = UDim2.fromScale(0.5, 1.3)
								})
								v_u_18(v_u_149, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["Size"] = UDim2.fromScale(0.13, 0.25)
								})
							else
								v_u_150.Visible = false
								v_u_18(v_u_150, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["Position"] = UDim2.fromScale(0.5, 0.5)
								})
								v_u_18(v_u_149, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["Size"] = UDim2.fromScale(0.13, 0.02)
								})
							end
						end
						v_u_30:Connect(v167)
						task.spawn(v167)
						task.spawn(function()
							-- upvalues: (copy) v_u_116, (copy) v_u_104, (copy) v_u_115, (ref) v_u_29, (copy) v_u_105, (ref) v_u_31, (ref) v_u_18, (ref) v_u_30, (ref) v_u_13, (copy) v_u_106, (copy) v_u_150, (ref) v_u_20, (ref) v_u_11
							task.wait(0.5)
							local v_u_168 = false
							v_u_116.Activated:Connect(function()
								-- upvalues: (ref) v_u_104, (ref) v_u_115, (ref) v_u_29, (ref) v_u_105, (ref) v_u_116, (ref) v_u_31, (ref) v_u_18, (ref) v_u_30, (ref) v_u_168, (ref) v_u_13, (ref) v_u_106, (ref) v_u_150, (ref) v_u_20, (ref) v_u_11
								local v169 = table.find(v_u_104, v_u_115)
								if not workspace:GetAttribute("InTutorial") or (workspace:GetAttribute("InTutorialShopMovement") or v169 == 1 and v_u_29 ~= v_u_105) then
									local v170 = (v_u_116.AbsolutePosition.Y - v_u_31.AbsolutePosition.Y + v_u_31.CanvasPosition.Y + (v_u_115.AbsolutePosition.Y + v_u_115.AbsoluteSize.Y - v_u_31.AbsolutePosition.Y + v_u_31.CanvasPosition.Y)) / 2 - v_u_31.AbsoluteSize.Y / 2
									v_u_18(v_u_31, TweenInfo.new(0.35), {
										["CanvasPosition"] = Vector2.new(0, v170)
									})
									local v171
									if v_u_29 == v_u_105 then
										v171 = nil
									else
										v171 = v_u_105
									end
									v_u_29 = v171
									v_u_30:Fire()
									if not v_u_168 then
										if v_u_13 or v_u_106.FallbackPrice == nil then
											if not v_u_13 then
												warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_150:GetFullName()))))
											end
											v_u_20:SetPriceLabel(v_u_150.Robux_Buy.Price, v_u_106.PurchaseID, ":robux::value:")
										else
											v_u_150.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_11.Comma(v_u_106.FallbackPrice)))
										end
										v_u_168 = true
									end
								end
							end)
						end)
						local v_u_172 = Instance.new("NumberValue")
						v_u_172.Value = 0
						v_u_172.Parent = v_u_150
						local v174 = v_u_172.Changed:Connect(function(p173)
							-- upvalues: (copy) v_u_116, (ref) v_u_48
							if v_u_116 and (v_u_116:FindFirstChild("Stock_Text") and not v_u_48) then
								v_u_116.Stock_Text.Text = ("X%* Stock"):format(p173 // 1)
							end
						end)
						local v175 = v_u_43
						table.insert(v175, v174)
						local v_u_176 = true
						local function v_u_183(p177)
							local v178 = {}
							for v179 in pairs(p177) do
								table.insert(v178, v179)
							end
							table.sort(v178)
							local v180 = {}
							for v181, v182 in ipairs(v178) do
								v180[v181] = p177[v182]
							end
							return v180
						end
						local function v_u_191(p184, p185)
							-- upvalues: (ref) v_u_31, (ref) v_u_56, (ref) v_u_55, (ref) v_u_10
							local v186 = ("X%* Stock"):format(p185)
							if v_u_31:FindFirstChild(p184) then
								local v187 = v_u_31:FindFirstChild(p184).Main_Frame
								local v188 = v_u_31:FindFirstChild(p184).Frame
								v187.Stock_Text.Text = v186
								v188.Sheckles_Buy.In_Stock.Visible = p185 > 0
								v188.Sheckles_Buy.No_Stock.Visible = p185 <= 0
								v188.Sheckles_Buy.HoverImage = p185 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
								v188.Sheckles_Buy.Image = p185 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
								local v189 = v187.Cost_Text:FindFirstChild("TEXT") or v187.Cost_Text
								if v_u_56[v_u_55.CurrentCategory][p184] then
									v189.Text = p185 <= 0 and "NO STOCK" or v_u_10.DisplaySheckles(v_u_56[v_u_55.CurrentCategory][p184].Price)
								else
									v189.Text = "NO STOCK"
								end
								local v190
								if p185 <= 0 then
									v190 = Color3.fromRGB(255, 0, 0)
								else
									v190 = Color3.fromRGB(0, 255, 0)
								end
								v189.TextColor3 = v190
								v187:SetAttribute("CurrentStock", p185)
							end
						end
						local function v_u_197(p192, p193)
							-- upvalues: (ref) v_u_31, (ref) v_u_46
							local v194 = v_u_31:FindFirstChild(p192)
							if v194 then
								local v195 = v194.Main_Frame
								local v196 = Instance.new("Frame")
								v196.Size = UDim2.new(0.98, 0, 0.98, 0)
								v196.Position = UDim2.new(0.5, 0, 0.5, 0)
								v196.AnchorPoint = Vector2.new(0.5, 0.5)
								v196.Transparency = 0.4
								v196.BackgroundColor3 = p193
								v196.Parent = v195
								v_u_46.target(v196, 1, 1, {
									["Transparency"] = 1
								})
								game:GetService("Debris"):AddItem(v196, 2)
							end
						end
						local function v_u_214(p_u_198, _)
							-- upvalues: (ref) v_u_51, (ref) v_u_56, (ref) v_u_55, (ref) v_u_8, (ref) v_u_49, (ref) v_u_48, (copy) v_u_183, (copy) v_u_191, (ref) v_u_31, (ref) v_u_6, (ref) v_u_40, (ref) v_u_41, (ref) v_u_39, (copy) v_u_197
							if not table.find(v_u_51, p_u_198) then
								local v199 = v_u_51
								local v200 = v_u_56[v_u_55.CurrentCategory][p_u_198].LayoutOrder
								table.insert(v199, v200, p_u_198)
								local v_u_201 = v_u_8:GetData()
								if v_u_49 then
									task.cancel(v_u_49)
									v_u_48 = false
								end
								v_u_49 = task.delay(0.05, function()
									-- upvalues: (ref) v_u_48, (ref) v_u_183, (ref) v_u_51, (copy) v_u_201, (ref) v_u_191, (ref) v_u_31, (ref) v_u_6, (ref) v_u_40, (ref) v_u_41, (ref) v_u_39, (copy) p_u_198, (ref) v_u_197
									if not v_u_48 then
										v_u_48 = true
										local v_u_202 = v_u_183(v_u_51)
										local function v206()
											-- upvalues: (ref) v_u_48, (ref) v_u_51, (copy) v_u_202, (ref) v_u_201, (ref) v_u_191
											v_u_48 = false
											table.clear(v_u_51)
											for _, v203 in v_u_202 do
												local v204 = v_u_201
												if v204 then
													local v205 = v_u_201.SeedStocks.Shop
													v204 = not v205.Stocks[v203] and {
														["MaxStock"] = 0,
														["Stock"] = 0
													} or v205.Stocks[v203]
												end
												v_u_191(v203, v204 and v204.Stock or 0)
											end
										end
										for v207, v208 in v_u_202 do
											if v_u_31:FindFirstChild(v208) then
												if v_u_48 == false then
													v206()
													return
												end
												local v209 = v_u_201
												if v209 then
													local v210 = v_u_201.SeedStocks.Shop
													v209 = not v210.Stocks[v208] and {
														["MaxStock"] = 0,
														["Stock"] = 0
													} or v210.Stocks[v208]
												end
												local v211 = v209 and v209.Stock or 0
												if v211 > 0 then
													for v212 = 0, v211 do
														v_u_191(v208, v212)
														if v_u_6.Enabled then
															v_u_40:PlaySound(v_u_41.RestockAnimationSFX.Stock_Click)
														end
														task.wait(0.05)
														if v_u_48 == false then
															v206()
															return
														end
													end
													if v_u_6.Enabled then
														v_u_40:PlaySound(v_u_41.RestockAnimationSFX[v_u_39[p_u_198].SeedRarity or "Prismatic"])
													end
													v_u_197(v208, Color3.fromRGB(24, 255, 0))
												else
													if v_u_6.Enabled then
														v_u_40:PlaySound(v_u_41.RestockAnimationSFX.No_Restock)
													end
													v_u_197(v208, Color3.fromRGB(249, 0, 2))
													v_u_191(v208, 0)
												end
												if v_u_48 == false then
													v206()
													return
												end
												local v213 = 0.25 + (v207 - 1) * 0.02
												task.wait(v_u_48 and v213 and v213 or 0)
											end
										end
									end
								end)
							end
						end
						local v_u_215 = false
						local function v_u_233(p216)
							-- upvalues: (ref) v_u_8, (copy) v_u_108, (copy) v_u_105, (ref) v_u_47, (ref) v_u_50, (ref) v_u_55, (ref) v_u_215, (copy) v_u_116, (ref) v_u_48, (copy) v_u_214, (copy) v_u_150, (ref) v_u_141, (ref) v_u_176, (ref) v_u_160, (copy) v_u_172, (ref) v_u_19, (ref) v_u_25, (copy) v_u_106, (ref) v_u_16, (ref) v_u_5
							local v217 = v_u_8:GetData()
							local v218 = v_u_108 or "Shop"
							local v219 = v217.SeedStocks[v218]
							if v219 then
								if v217 then
									if v219 then
										v217 = v219.Stocks[v_u_105]
									else
										v217 = v219
									end
								end
								local v220 = v217 and v217.Stock or 0
								if not v_u_47[v218] then
									v_u_47[v218] = {}
								end
								if not v_u_47[v218][v_u_105] then
									v_u_47[v218][v_u_105] = v219.Seed
								end
								if p216 and (p216 == "SeedStocks" and (v_u_47[v218][v_u_105] ~= v219.Seed and (v_u_50 and v_u_50 == v_u_55.CurrentCategory))) then
									v_u_215 = true
									local v221 = v_u_116.Cost_Text:FindFirstChild("TEXT") or v_u_116.Cost_Text
									v221.Text = "NO STOCK"
									v221.TextColor3 = Color3.fromRGB(255, 0, 0)
									v_u_116.Stock_Text.Text = "X0 Stock"
									task.spawn(function()
										-- upvalues: (ref) v_u_116
										v_u_116.Parent.Frame.Sheckles_Buy.In_Stock.Visible = false
										v_u_116.Parent.Frame.Sheckles_Buy.No_Stock.Visible = true
										v_u_116.Parent.Frame.Sheckles_Buy.HoverImage = "rbxassetid://138411009141674"
										v_u_116.Parent.Frame.Sheckles_Buy.Image = "rbxassetid://104713419928195"
									end)
									if v_u_48 then
										v_u_48 = false
										task.wait(0.15)
										v_u_214(v_u_105, p216)
									else
										v_u_214(v_u_105, p216)
									end
									v_u_116:SetAttribute("CurrentSeed", v219.Seed)
									v_u_47[v218][v_u_105] = v219.Seed
									task.delay(0.05, function()
										-- upvalues: (ref) v_u_215
										v_u_215 = false
									end)
								elseif p216 == "SeedStocks" and (v_u_47[v218][v_u_105] == v219.Seed and not v_u_215) then
									local v222 = ("X%* Stock"):format(v220)
									v_u_116.Stock_Text.Text = v222
									v_u_150.Sheckles_Buy.In_Stock.Visible = v220 > 0
									v_u_150.Sheckles_Buy.No_Stock.Visible = v220 <= 0
									v_u_150.Sheckles_Buy.HoverImage = v220 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
									v_u_150.Sheckles_Buy.Image = v220 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
									local v223 = v_u_116.Cost_Text:FindFirstChild("TEXT") or v_u_116.Cost_Text
									v223.Text = v220 <= 0 and "NO STOCK" or v_u_141
									local v224
									if v220 <= 0 then
										v224 = Color3.fromRGB(255, 0, 0)
									else
										v224 = Color3.fromRGB(0, 255, 0)
									end
									v223.TextColor3 = v224
								elseif not v_u_215 then
									if v_u_176 or not v_u_160 then
										v_u_176 = false
										v_u_172.Value = v220
									else
										v_u_19.target(v_u_172, 1, 1.5, {
											["Value"] = v220
										})
									end
									local v225 = ("X%* Stock"):format(v220)
									v_u_116.Stock_Text.Text = v225
									v_u_150.Sheckles_Buy.In_Stock.Visible = v220 > 0
									v_u_150.Sheckles_Buy.No_Stock.Visible = v220 <= 0
									v_u_150.Sheckles_Buy.HoverImage = v220 > 0 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
									v_u_150.Sheckles_Buy.Image = v220 > 0 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
									local v226 = v_u_116.Cost_Text:FindFirstChild("TEXT") or v_u_116.Cost_Text
									v226.Text = v220 <= 0 and "NO STOCK" or v_u_141
									local v227
									if v220 <= 0 then
										v227 = Color3.fromRGB(255, 0, 0)
									else
										v227 = Color3.fromRGB(0, 255, 0)
									end
									v226.TextColor3 = v227
								end
								local v228 = not v_u_25:HasRequiredNPCLevels(v_u_106.LevelLocks)
								if v228 and v_u_106.LevelLocks then
									local v229 = next(v_u_106.LevelLocks)
									local v230 = v229 and v_u_106.LevelLocks[v229] or 1
									v_u_116.LockedFrame.Visible = true
									v_u_116.LockedFrame.UnlockInfo.Text = ("NPC Friend Level Needed: lvl%*"):format(v230)
								else
									v_u_116.LockedFrame.Visible = false
								end
								local v231 = v_u_116.Cost_Text:FindFirstChild("TEXT") or v_u_116.Cost_Text
								if v228 and v_u_106.LevelLocks then
									local v232 = next(v_u_106.LevelLocks)
									v231.Text = ("LOCKED: lvl%*+"):format(v232 and v_u_106.LevelLocks[v232] or 1)
									v231.TextColor3 = Color3.fromRGB(255, 0, 0)
								end
								if v_u_116.Cost_Text:FindFirstChild("CurrencyImage") and v_u_106.SpecialCurrencyType then
									v_u_116.Cost_Text.CurrencyImage.Visible = v220 > 0
								end
								if v_u_16:HasUnlockedShopItem(v_u_5, "Seed", v_u_105) then
									v_u_116.LockedFrame.Visible = false
									v_u_116.Interactable = true
								else
									v_u_116.LockedFrame.Visible = true
									v_u_116.Interactable = false
									v_u_116.LockedFrame.UnlockInfo.Text = ("Ascensions Required: %*"):format((v_u_16:GetRemainingRebirthsNeededForItem(v_u_5, "Seed", v_u_105)))
								end
							else
								return
							end
						end
						task.spawn(v_u_233)
						task.spawn(function()
							-- upvalues: (ref) v_u_8, (copy) v_u_233, (ref) v_u_43, (ref) v_u_16, (ref) v_u_5
							local v234 = v_u_8:GetPathSignal("SeedStocks/@")
							if v234 then
								local v235 = v234:Connect(v_u_233)
								local v236 = v_u_43
								table.insert(v236, v235)
							end
							local v237 = v_u_8:GetPathSignal("SeedStocks")
							if v237 then
								local v238 = v237:Connect(v_u_233)
								local v239 = v_u_43
								table.insert(v239, v238)
							end
							task.spawn(function()
								-- upvalues: (ref) v_u_8, (ref) v_u_233, (ref) v_u_43
								local v240 = v_u_8:GetPathSignal("NPCPoints/@")
								if v240 then
									local v241 = v240:Connect(v_u_233)
									local v242 = v_u_43
									table.insert(v242, v241)
								end
							end)
							local v243 = v_u_16:HasBeenAssignedABTest(v_u_5) and v_u_8:GetPathSignal("RebirthData/TotalRebirths")
							if v243 then
								local v244 = v243:Connect(v_u_233)
								local v245 = v_u_43
								table.insert(v245, v244)
							end
						end)
					end
				end
			end
		end
	end
	table.sort(v_u_104, function(p246, p247)
		local v248 = p246.LayoutOrder
		local v249 = p247.LayoutOrder
		if v248 == v249 then
			return p246.Name < p247.Name
		else
			return v248 < v249
		end
	end)
end
local function v_u_253()
	-- upvalues: (copy) v_u_57, (copy) v_u_23, (copy) v_u_55
	for _, v251 in v_u_57 do
		local v252 = v_u_23:IsTabUnlocked("Seed", v251.Name)
		if v251.IsLocked and v252 then
			v_u_55.UnlockTab(v251.Name)
		end
	end
end
local function v255(p254)
	-- upvalues: (copy) v_u_38, (copy) v_u_37, (copy) v_u_250, (ref) v_u_29, (copy) v_u_30, (copy) v_u_90
	if p254 == "Daily Deals" then
		v_u_38.Visible = true
		v_u_37.Visible = false
	else
		v_u_38.Visible = false
		v_u_37.Visible = true
		v_u_250()
	end
	v_u_29 = nil
	v_u_30:Fire()
	task.spawn(v_u_90)
end
v_u_55.OnCategoryChanged:Connect(v255)
local v_u_256 = {
	Enum.AdAvailabilityResult.PlayerIneligible,
	Enum.AdAvailabilityResult.DeviceIneligible,
	Enum.AdAvailabilityResult.PublisherIneligible,
	Enum.AdAvailabilityResult.ExperienceIneligible
}
function checkForAds()
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_256
	local v257, v258 = pcall(function()
		-- upvalues: (ref) v_u_4
		return v_u_4:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
	end)
	if v257 and v258.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
		v_u_6.Frame.Frame.RewardAd.Visible = true
		return
	end
	local v259 = v258.AdAvailabilityResult
	for _, v260 in ipairs(v_u_256) do
		if v259 == v260 then
			v261 = true
			::l7::
			if not v261 then
			end
		end
	end
	local v261 = false
	goto l7
end
v_u_6:GetPropertyChangedSignal("Enabled"):Connect(function()
	-- upvalues: (copy) v_u_6
	v_u_6.Frame.Frame.RewardAd.Visible = false
	if v_u_6.Enabled then
		checkForAds()
	end
end)
v_u_6.Frame.Frame.RewardAd.SENSOR.Activated:Connect(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_28
	v_u_6.Frame.Frame.RewardAd.Visible = false
	v_u_28:FireServer()
end)
v_u_28.OnClientEvent:Connect(function(_, p262)
	if p262 == Enum.ShowAdResult.ShowCompleted then
		checkForAds()
	end
end)
function v45.Start(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_28, (copy) v_u_27, (copy) v_u_20, (ref) v_u_50, (copy) v_u_55, (copy) v_u_9, (copy) v_u_250, (copy) v_u_8, (copy) v_u_57, (copy) v_u_253, (copy) v_u_91
	v_u_7:UsePopupAnims(v_u_6)
	v_u_6.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6
		v_u_7:Close(v_u_6)
	end)
	v_u_28.OnClientEvent:Connect(function(_, p263)
		if p263 == Enum.ShowAdResult.ShowCompleted then
			checkForAds()
		end
	end)
	v_u_6.Frame.Frame.Restock.Activated:Connect(function()
		-- upvalues: (ref) v_u_27, (ref) v_u_20, (ref) v_u_50, (ref) v_u_55
		v_u_20:PromptPurchase(v_u_27.SeedShopRestock.PurchaseID, Enum.InfoType.Product)
		v_u_50 = v_u_55.CurrentCategory
	end)
	if not v_u_9:IsUpdateDone() then
		task.delay(v_u_9:GetRemainingTimeUntilUpdate() + 1, function()
			-- upvalues: (ref) v_u_250
			v_u_250()
		end)
	end
	v_u_9.OnUpdated:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_55, (ref) v_u_57, (ref) v_u_253
		if not v_u_8:GetData().FirstTimeUser then
			v_u_55.SetCategories(v_u_57)
			v_u_55.DefaultCategory = "Shop"
			v_u_55.SetCurrentCategory(v_u_55.DefaultCategory)
			v_u_253()
		end
	end)
	if v_u_9:IsHiddenFromUpdate("Seed Shop Tabs") then
		task.delay(v_u_9:GetRemainingTimeUntilUpdate(), function()
			-- upvalues: (ref) v_u_9, (ref) v_u_8, (ref) v_u_55, (ref) v_u_57, (ref) v_u_253
			if v_u_9:IsUpdateDone() or workspace:GetServerTimeNow() >= v_u_9:GetUpdateTime() then
				if v_u_8:GetData().FirstTimeUser then
					return
				end
				v_u_55.SetCategories(v_u_57)
				v_u_55.DefaultCategory = "Shop"
				v_u_55.SetCurrentCategory(v_u_55.DefaultCategory)
				v_u_253()
			end
		end)
	elseif not v_u_8:GetData().FirstTimeUser then
		v_u_55.SetCategories(v_u_57)
		v_u_55.DefaultCategory = "Shop"
		v_u_55.SetCurrentCategory(v_u_55.DefaultCategory)
		v_u_253()
	end
	task.spawn(v_u_91)
	v_u_250()
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_253
		local v264 = v_u_8:GetPathSignal("ShopTabData/@")
		if v264 then
			v264:Connect(v_u_253)
		end
	end)
end
function v45.Redraw(_)
	-- upvalues: (copy) v_u_250
	v_u_250()
end
task.spawn(v45.Start, v45)
v_u_1.GameEvents.ABTestingEvents.ReSetupShopFrames.Event:Connect(function()
	-- upvalues: (copy) v_u_250
	task.wait(1)
	v_u_250()
end)
return v45