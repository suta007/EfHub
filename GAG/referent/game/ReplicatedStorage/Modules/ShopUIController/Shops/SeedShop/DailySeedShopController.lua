local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ReplicatedFirst")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("ContentProvider")
game:GetService("TweenService")
local v_u_4 = require(v_u_1.Modules.GuiController)
local v_u_5 = require(v_u_1.Modules.DataService)
local v_u_6 = require(v_u_1.Modules.UpdateService)
local v_u_7 = require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.Observers)
local v_u_8 = require(v_u_1.Comma_Module)
local v9 = require(v_u_1.Modules.Signal)
require(v_u_1.Modules.UseDynamicPrices)
require(v_u_1.Modules.WatchButtonHold)
require(v_u_1.Code.Particle2D)
local v_u_10 = require(v_u_1.Modules.MarketController)
require(v_u_1.Modules.GiftController)
require(v_u_1.Modules.ShopTabHandler)
local v_u_11 = require(v_u_1.Modules.NPCLevelHandler)
require(v_u_1.Modules.FastTween)
require(v_u_1.Code.Spr)
local v_u_12 = require(v_u_1.Item_Module)
require(v_u_1.Modules.DumpTable)
require(v_u_1.Modules.PlantTraitsData)
require(v_u_1.Modules.Spring)
local v_u_13 = require(v_u_1.Modules.TradeControllers.TradeWorldController)
local v_u_14 = require(v_u_1.Data.DevProductIds)
local v_u_15 = require(v_u_1.Data.ShopTabData)
local v_u_16 = require(v_u_1.Data.CurrencyData)
local v_u_17 = require(v_u_1.Data.SeedShopConfigData)
require(game.ReplicatedStorage.Data.SeedData)
require(game.ReplicatedStorage.Data.SeedShopData)
local v_u_18 = require(game.ReplicatedStorage.Data.DailySeedShopData)
local v_u_19 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Seed_Shop")
local v20 = v_u_19:WaitForChild("Daily"):WaitForChild("ScrollingFrame")
v20:WaitForChild("UIListLayout")
local v_u_21 = v_u_19:WaitForChild("Daily"):WaitForChild("ScrollingFrame"):WaitForChild("Timer"):WaitForChild("Title")
local _ = game.SoundService.Click
local v_u_22 = game.SoundService.Restock_SFX
local v_u_23 = v20:WaitForChild("FeaturedDeal")
local v_u_24 = {}
for _, v25 in v20:WaitForChild("Seeds"):GetChildren() do
	if not v25:IsA("UIListLayout") then
		table.insert(v_u_24, v25)
	end
end
local v26 = require(v_u_1.Modules.UITabHelperModule)
local v27 = v_u_19:WaitForChild("TabAnchor"):WaitForChild("TabList")
local v28 = v_u_1.UITemplates:WaitForChild("TabButtonTemplate")
local v29 = v26.CreateOrGetTabHandler("SeedShop", v27, v28)
local v_u_30 = nil
local v_u_31 = v9.new()
local v_u_32 = {}
local v_u_33 = {}
local v_u_34 = false
local v_u_35 = {}
local v36 = {}
local v_u_45 = {
	["UpdateStockDisplay"] = function(p37, p38)
		if p37 and (p37.Parent and p37:FindFirstChild("StockNum")) then
			p37.StockNum.Text = ("X%* Stock"):format(p38)
			local v39 = p37.StockNum
			local v40
			if p38 > 0 then
				v40 = Color3.fromRGB(235, 227, 143)
			else
				v40 = Color3.fromRGB(255, 0, 0)
			end
			v39.TextColor3 = v40
		end
	end,
	["UpdateButtonState"] = function(p41, p42)
		if p41 and p41.Parent then
			if p41.PurchaseButton.Main.SENSOR then
				local v43 = p41.PurchaseButton:FindFirstChild("Main")
				local v44 = p41.PurchaseButton:FindFirstChild("OutOfStock")
				if v43 then
					v43.Visible = p42 > 0
				end
				if v44 then
					v44.Visible = p42 <= 0
				end
			end
		else
			return
		end
	end,
	["UpdateLockedState"] = function(_, _, _) end
}
local function v_u_87(p_u_46, p_u_47, p48)
	-- upvalues: (copy) v_u_19, (copy) v_u_35
	if p48 then
		local v49 = p48[1]
		local v50 = p48[2]
		local v51 = p48[3]
		p_u_46.Rarity.ITEM_RARITY.Text = v49
		if p_u_46.Rarity:FindFirstChild("Details") then
			p_u_46.Rarity.Details.Visible = false
		end
		if v51 and v49 == "Prismatic" then
			local v_u_52 = nil
			v_u_52 = game:GetService("RunService").Heartbeat:Connect(function(_)
				-- upvalues: (ref) v_u_19, (copy) p_u_47, (ref) v_u_52, (copy) p_u_46
				if v_u_19.Enabled then
					if p_u_47 and p_u_47.Parent then
						local v53 = os.clock() * 0.1 % 1
						local v54 = Color3.fromHSV(v53, 1, 1)
						p_u_46.Rarity.BackgroundColor3 = v54
						if p_u_46.Rarity.ITEM_RARITY.UIStroke then
							local v55 = p_u_46.Rarity.ITEM_RARITY.UIStroke
							local v56, v57, v58 = v54:ToHSV()
							v55.Color = Color3.fromHSV(v56, v57, v58 / 2)
						end
						local v59 = p_u_47.Rarity.UIStroke
						local v60, v61, v62 = v54:ToHSV()
						v59.Color = Color3.fromHSV(v60, v61, v62 / 2)
					else
						v_u_52:Disconnect()
					end
				else
					return
				end
			end)
			local v63 = v_u_52
			if not v_u_35[p_u_46] then
				v_u_35[p_u_46] = {}
			end
			local v64 = v_u_35[p_u_46]
			table.insert(v64, v63)
			return
		elseif v49 == "Transcendent" then
			if p_u_46.Rarity:FindFirstChild("Details") then
				p_u_46.Rarity.Details.Visible = true
			end
			local v_u_65 = 1
			local v69 = game:GetService("RunService").Heartbeat:Connect(function(p66)
				-- upvalues: (ref) v_u_19, (copy) p_u_47, (copy) p_u_46, (ref) v_u_65
				if v_u_19.Enabled then
					if p_u_47 and p_u_47.Parent then
						if p_u_46.Rarity.Details then
							for _, v67 in p_u_46.Rarity.Details:GetChildren() do
								v67.Rotation = v67.Rotation + 10 * p66
								local v68 = v67.Size.X.Offset + v_u_65 * 1
								if v68 >= 50 then
									v68 = 50
									v_u_65 = -1
								elseif v68 <= 0 then
									v68 = 0
									v_u_65 = 1
								end
								v67.Size = UDim2.new(0, v68, 0, v68)
							end
						end
					else
						animationConnection:Disconnect()
					end
				else
					return
				end
			end)
			if not v_u_35[p_u_46] then
				v_u_35[p_u_46] = {}
			end
			local v70 = v_u_35[p_u_46]
			table.insert(v70, v69)
			if p_u_46.Rarity.ITEM_RARITY.UIStroke then
				local v71 = p_u_46.Rarity.ITEM_RARITY.UIStroke
				local v72, v73, v74 = v50:ToHSV()
				v71.Color = Color3.fromHSV(v72, v73, v74 / 2)
			end
			local v75 = p_u_46.Rarity.UIStroke
			local v76, v77, v78 = v50:ToHSV()
			v75.Color = Color3.fromHSV(v76, v77, v78 / 2)
			p_u_47.Rarity.BackgroundColor3 = Color3.new(1, 1, 1)
			p_u_47.Rarity.UIGradient.Enabled = true
			p_u_47.Rarity.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 149, 1), Color3.fromRGB(255, 238, 5))
		else
			if p_u_47.Rarity.ITEM_RARITY.UIStroke then
				local v79 = p_u_47.Rarity.ITEM_RARITY.UIStroke
				local v80, v81, v82 = v50:ToHSV()
				v79.Color = Color3.fromHSV(v80, v81, v82 / 2)
			end
			p_u_47.Rarity.BackgroundColor3 = v50
			local v83 = p_u_47.Rarity.UIStroke
			local v84, v85, v86 = v50:ToHSV()
			v83.Color = Color3.fromHSV(v84, v85, v86 / 2)
		end
	else
		return
	end
end
local function v_u_98(p88, p_u_89, _, p_u_90, _)
	-- upvalues: (copy) v_u_1, (copy) v_u_35
	local function v91()
		-- upvalues: (copy) p_u_90, (ref) v_u_1
		if not workspace:GetAttribute("InTutorial") or p_u_90 == "Carrot" then
			v_u_1.GameEvents.BuyDailySeedShopStock:FireServer(p_u_90)
		end
	end
	local v92 = p_u_89.PurchaseButton.Main.SENSOR.Activated:Connect(v91)
	local v93 = p_u_89.PurchaseButton.Main.MouseEnter:Connect(function()
		-- upvalues: (copy) p_u_89
		p_u_89.PurchaseButton.Main.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
	end)
	local v94 = p_u_89.PurchaseButton.Main.MouseLeave:Connect(function()
		-- upvalues: (copy) p_u_89
		p_u_89.PurchaseButton.Main.BackgroundColor3 = Color3.new(1, 1, 1)
	end)
	if not v_u_35[p88] then
		v_u_35[p88] = {}
	end
	local v95 = v_u_35[p88]
	table.insert(v95, v92)
	if not v_u_35[p88] then
		v_u_35[p88] = {}
	end
	local v96 = v_u_35[p88]
	table.insert(v96, v93)
	if not v_u_35[p88] then
		v_u_35[p88] = {}
	end
	local v97 = v_u_35[p88]
	table.insert(v97, v94)
end
local function v_u_115(p99, p_u_100, p_u_101, p_u_102, p_u_103, _)
	-- upvalues: (ref) v_u_34, (copy) v_u_45, (copy) v_u_35, (copy) v_u_5, (copy) v_u_33, (copy) v_u_11
	local v_u_104 = p99:FindFirstChild("_StockValue")
	if not v_u_104 then
		v_u_104 = Instance.new("NumberValue")
		v_u_104.Name = "_StockValue"
		v_u_104.Parent = p99
	end
	v_u_104.Value = 0
	local v106 = v_u_104.Changed:Connect(function(p105)
		-- upvalues: (ref) v_u_34, (ref) v_u_45, (copy) p_u_100
		if not v_u_34 then
			v_u_45.UpdateStockDisplay(p_u_100, p105)
			v_u_45.UpdateButtonState(p_u_100, p105)
		end
	end)
	if not v_u_35[p99] then
		v_u_35[p99] = {}
	end
	local v107 = v_u_35[p99]
	table.insert(v107, v106)
	return function(_)
		-- upvalues: (copy) p_u_100, (ref) v_u_5, (copy) p_u_103, (copy) p_u_102, (ref) v_u_33, (ref) v_u_104, (ref) v_u_45, (ref) v_u_11, (copy) p_u_101
		if p_u_100 and p_u_100.Parent then
			local v108 = v_u_5:GetData()
			if v108 then
				local v109 = v108.SeedStocks[p_u_103]
				if v109 then
					local v110 = v109.Stocks[p_u_102]
					local v111 = v110 and v110.Stock or 0
					if not v_u_33[p_u_103] then
						v_u_33[p_u_103] = {}
					end
					if not v_u_33[p_u_103][p_u_102] then
						v_u_33[p_u_103][p_u_102] = v109.Seed
					end
					v_u_104.Value = v111
					v_u_45.UpdateButtonState(p_u_100, v111)
					v_u_45.UpdateStockDisplay(p_u_100, v111)
					local v112 = not v_u_11:HasRequiredNPCLevels(p_u_101.LevelLocks)
					local v113
					if v112 and p_u_101.LevelLocks then
						local v114 = next(p_u_101.LevelLocks)
						v113 = v114 and p_u_101.LevelLocks[v114] or 1
					else
						v113 = nil
					end
					v_u_45.UpdateLockedState(p_u_100, v112, v113)
				end
			else
				return
			end
		else
			return
		end
	end
end
local function v_u_119(p116)
	-- upvalues: (copy) v_u_35
	if v_u_35[p116] then
		for _, v117 in v_u_35[p116] do
			if v117.Connected then
				v117:Disconnect()
			end
		end
		v_u_35[p116] = nil
	end
	if p116 then
		local v118 = p116:FindFirstChild("_StockValue")
		if v118 then
			v118:Destroy()
		end
	end
end
local function v_u_125(p120)
	-- upvalues: (copy) v_u_35
	if p120:FindFirstChild("Details") and p120:FindFirstChild("Details"):FindFirstChild("Sunray") then
		local v_u_121 = p120.Details.Sunray
		local v123 = game:GetService("RunService").RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_121
			local v122 = v_u_121
			v122.Rotation = v122.Rotation + 0.1
		end)
		if not v_u_35[p120] then
			v_u_35[p120] = {}
		end
		local v124 = v_u_35[p120]
		table.insert(v124, v123)
	end
end
local function v_u_139(p_u_126, p127, p128, p129, _)
	-- upvalues: (copy) v_u_119, (copy) v_u_87, (copy) v_u_12, (copy) v_u_125, (copy) v_u_8, (copy) v_u_7, (copy) v_u_16, (copy) v_u_98, (copy) v_u_115, (copy) v_u_5, (copy) v_u_35
	v_u_119(p_u_126)
	p_u_126.Name = p127
	p_u_126.SeedName.Text = p128.Seed.SeedName
	p_u_126.Item_Image.Image = p128.Seed.Asset
	p_u_126.Item_Image.Rotation = 0
	v_u_87(p_u_126, p_u_126, v_u_12.Return_Rarity_Data(p128.Seed.SeedRarity))
	local v130 = p128.Seed
	p_u_126.Item_Image.Image = v130.Asset
	v_u_125(p_u_126)
	local v131
	if p128.SpecialCurrencyType then
		v131 = v_u_8.Comma(p128.Price) .. ""
	else
		v131 = v_u_7.DisplaySheckles(p128.Price)
	end
	if p_u_126.PurchaseButton.Main:FindFirstChild("Price") then
		p_u_126.PurchaseButton.Main.Price.Text = v131
	end
	if p128.SpecialCurrencyType then
		local _ = v_u_16[p128.SpecialCurrencyType]
	end
	v_u_98(p_u_126, p_u_126, p128, p127, p129)
	local v_u_132 = v_u_115(p_u_126, p_u_126, p128, p127, p129, v131)
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_132, (copy) p_u_126, (ref) v_u_35
		for _, v133 in {
			{
				["Signal"] = v_u_5:GetPathSignal("SeedStocks/@"),
				["Source"] = "SeedStocks"
			},
			{
				["Signal"] = v_u_5:GetPathSignal("SeedStocks"),
				["Source"] = "SeedStocks"
			},
			{
				["Signal"] = v_u_5:GetPathSignal("NPCPoints/@"),
				["Source"] = "NPCPoints"
			}
		} do
			local v134 = v133.Signal
			local v_u_135 = v133.Source
			if v134 then
				local v136 = v134:Connect(function()
					-- upvalues: (ref) v_u_132, (copy) v_u_135
					v_u_132(v_u_135)
				end)
				local v137 = p_u_126
				if not v_u_35[v137] then
					v_u_35[v137] = {}
				end
				local v138 = v_u_35[v137]
				table.insert(v138, v136)
			end
		end
		task.wait(0.05)
		v_u_132()
	end)
	return p_u_126
end
local function v_u_146(p140)
	-- upvalues: (copy) v_u_2, (copy) v_u_18, (copy) v_u_3
	if not v_u_2.TouchEnabled then
		local v_u_141 = {}
		for v142, v143 in v_u_18 do
			if p140.Stocks[v142] then
				local v144 = Instance.new("ImageLabel")
				v144.Image = v143.Seed.Asset
				table.insert(v_u_141, v144)
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_141
			v_u_3:PreloadAsync(v_u_141)
			for _, v145 in v_u_141 do
				v145:Destroy()
			end
			table.clear(v_u_141)
		end)
	end
end
local function v_u_154()
	-- upvalues: (copy) v_u_32, (copy) v_u_5, (copy) v_u_146, (copy) v_u_18, (copy) v_u_6, (copy) v_u_23, (copy) v_u_24, (copy) v_u_139
	table.clear(v_u_32)
	local v147 = v_u_5:GetData()
	if v147 then
		local v148 = v147.SeedStocks["Daily Deals"]
		if v148 and v148.Stocks then
			v_u_146(v148)
			local v149 = {}
			local v150 = 1
			for v151, v152 in v_u_18 do
				if v148.Stocks[v151] and not (v_u_6:IsHiddenFromUpdate(v152.Seed.SeedName) or v_u_6:IsHiddenAfterUpdate(v152.Seed.SeedName)) then
					local v153 = v_u_23
					if not v148.Stocks[v151].IsGoodSeed then
						v153 = v_u_24[v150]
						v150 = v150 + 1
					end
					if v153 then
						v_u_139(v153, v151, v152, "Daily Deals", v149)
						table.insert(v149, v153)
						v_u_32[v151] = v153
						v153.Visible = true
					end
				end
			end
		end
	else
		return
	end
end
local v_u_155 = {}
local function v_u_161()
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_17, (copy) v_u_21, (copy) v_u_7, (copy) v_u_155, (copy) v_u_13, (copy) v_u_22
	local v156 = workspace:GetServerTimeNow()
	local v157 = v_u_5:GetData().SeedStocks["Daily Deals"]
	local v158 = v157 and v157.ForcedSeedEndTimestamp and (v157.ForcedSeedEndTimestamp - v156 or -1) or -1
	if v158 < 0 then
		local v159 = (v_u_15.Seed["Daily Deals"] or v_u_17).RefreshTime
		v158 = v159 - v156 % v159
	end
	v_u_21.Text = v158 <= 0 and "Restocking" or "New deals in " .. v_u_7.compactFormat(v158)
	for _, v160 in v_u_155 do
		v160.Text = v158 <= 0 and "Now" or v_u_7.compactFormat(v158)
	end
	if v158 <= 1 and not v_u_13:IsInWorld() then
		v_u_22.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_22.TimePosition = 0
		v_u_22.Playing = true
		require(game.ReplicatedStorage.Modules.Notification):CreateNotification("<font color=\"#ADD8E6\"><b>Your Daily Deals Shop stock has restocked!</b></font>")
	end
end
local function v_u_162()
	-- upvalues: (copy) v_u_161
	while true do
		v_u_161()
		task.wait(1)
	end
end
local function v164(p163)
	-- upvalues: (copy) v_u_154, (ref) v_u_30, (copy) v_u_31, (copy) v_u_161
	if p163 == "Daily Deals" then
		v_u_154()
		v_u_30 = nil
		v_u_31:Fire()
		task.spawn(v_u_161)
	end
end
v29.OnCategoryChanged:Connect(v164)
function v36.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_19, (copy) v_u_14, (copy) v_u_10, (copy) v_u_5, (copy) v_u_154, (copy) v_u_6, (copy) v_u_162
	v_u_4:UsePopupAnims(v_u_19)
	v_u_19.Daily.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_19
		v_u_4:Close(v_u_19)
	end)
	v_u_19.Daily.Frame.Restock.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_10
		v_u_10:PromptPurchase(v_u_14.DailySeedShopRestock.PurchaseID, Enum.InfoType.Product)
	end)
	v_u_19.Daily.Frame.Restock.MouseEnter:Connect(function()
		-- upvalues: (ref) v_u_19
		v_u_19.Daily.Frame.Restock.BackgroundColor3 = Color3.fromRGB(220, 180, 0)
	end)
	v_u_19.Daily.Frame.Restock.MouseLeave:Connect(function()
		-- upvalues: (ref) v_u_19
		v_u_19.Daily.Frame.Restock.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_154
		local v165 = v_u_5:GetPathSignal("SeedStocks/Daily Deals/@")
		if v165 then
			local v_u_166 = {}
			local v167 = v_u_5:GetData()
			if v167 and (v167.SeedStocks and v167.SeedStocks["Daily Deals"]) then
				v_u_166["Daily Deals"] = v167.SeedStocks["Daily Deals"].Seed
			end
			v165:Connect(function(_)
				-- upvalues: (ref) v_u_5, (copy) v_u_166, (ref) v_u_154
				local v168 = v_u_5:GetData()
				if v168 and v168.SeedStocks then
					local v169 = v168.SeedStocks["Daily Deals"]
					if v169 then
						local v170 = v_u_166["Daily Deals"] and v_u_166["Daily Deals"] ~= v169.Seed and true or false
						v_u_166["Daily Deals"] = v169.Seed
						if v170 then
							v_u_154()
						end
					end
				else
					return
				end
			end)
		end
	end)
	if not v_u_6:IsUpdateDone() then
		task.delay(v_u_6:GetRemainingTimeUntilUpdate() + 1, function()
			-- upvalues: (ref) v_u_154
			v_u_154()
		end)
	end
	task.spawn(v_u_162)
	v_u_154()
end
task.spawn(v36.Start, v36)
return v36