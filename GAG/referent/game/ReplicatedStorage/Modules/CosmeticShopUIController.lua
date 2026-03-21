local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
game:GetService("ContentProvider")
game:GetService("TweenService")
local v_u_3 = require(v_u_2.Modules.GuiController)
local v_u_4 = require(v_u_2.Modules.DataService)
local v_u_5 = require(v_u_2.Modules.UpdateService)
require(v_u_2.Comma_Module)
require(v_u_2.Modules.Signal)
local v6 = require(v_u_2.Modules.WaitForDescendant)
local v_u_7 = require(v_u_2.Modules.NumberUtil)
require(v_u_2.Modules.CountDictionary)
require(v_u_2.Modules.FastTween)
local v_u_8 = require(v_u_2.Modules.MarketController)
require(v_u_2.Modules.GiftController)
local v_u_9 = require(v_u_2.Data.CosmeticShopConfigData)
local v_u_10 = require(v_u_2.Item_Module)
require(v_u_2.Modules.DumpTable)
require(v_u_2.Data.DecimalNumberFormat)
local v_u_11 = require(v_u_2.Modules.Notification)
require(v_u_2.Modules.CosmeticCrateOddsController)
local v_u_12 = require(v_u_2.Data.CosmeticRegistry).CosmeticList
local v_u_13 = require(v_u_2.Data.CosmeticCrateRegistry).CosmeticCrates
require(v_u_2.Data.CosmeticItemShopData)
require(v_u_2.Data.CosmeticCrateShopData)
local v_u_14 = require(v_u_2.Data.CosmeticShopTabData)
local v_u_15 = require(v_u_2.Data.FenceSkinRegistry)
require(v_u_2.Frame_Popup_Module)
require(v_u_2.Modules.UseDynamicPrices)
local v_u_16 = require(v_u_2.Data.DevProductIds)
local v17 = require(v_u_2.Modules.UITabHelperModule)
local v18 = game.Players.LocalPlayer.PlayerGui
local v_u_19 = v18:WaitForChild("CosmeticShop_UI")
local v20 = v_u_19:FindFirstChild("Frame", true)
local v_u_21 = v20:FindFirstChild("Cosmetics", true)
local v_u_22 = v20:FindFirstChild("Fences", true)
local v_u_23 = v_u_21:FindFirstChild("RegularCosmeticsContainer", true)
local v_u_24 = v_u_21:FindFirstChild("DailyCrateContainer", true)
local v_u_25 = script.BlueCosmeticTemplate
local v_u_26 = script.GreenCosmeticTemplate
local v_u_27 = script.FenceCosmeticTemplate
local v_u_28 = v20:FindFirstChild("FenceTimer", true)
local v_u_29 = v20:FindFirstChild("ExitButton", true)
local v_u_30 = v20:FindFirstChild("Restock", true)
local v31 = v_u_19:FindFirstChild("TabAnchor", true):FindFirstChild("TabList", true)
local v_u_32 = v18:WaitForChild("ShowCrateOdds")
v6(v_u_32, "CrateChanceDetails")
v6(v_u_32, "CrateItemTemplate")
v6(v_u_32, "HeaderTitle")
local v_u_33 = v6(v_u_32, "ExitButton")
local v34 = v_u_2.UITemplates:WaitForChild("TabButtonTemplate")
local v_u_35 = v17.CreateOrGetTabHandler("CosmeticShop", v31, v34)
v_u_35.DefaultCategory = "Cosmetics"
v_u_35.CurrentCategory = "Cosmetics"
local v_u_36 = false
local v_u_37 = {}
local function v_u_42(p38, p39, p40)
	-- upvalues: (copy) v_u_11
	for _, v41 in p38 do
		v_u_11:CreateNotification(v41, nil, p39)
		if p40 then
			task.wait(p40)
		end
	end
end
local function v_u_90(p_u_43, p_u_44, p_u_45, p_u_46)
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_12, (copy) v_u_10, (copy) v_u_7, (ref) v_u_36, (copy) v_u_2, (copy) v_u_35, (copy) v_u_4, (copy) v_u_42, (copy) v_u_5
	local v47 = nil
	if p_u_45 then
		local v_u_48 = p_u_45.FenceName ~= nil
		if p_u_46 then
			v47 = p_u_45.CrateName
		elseif not v_u_48 then
			v47 = p_u_45.CosmeticName
		end
		local v49
		if p_u_46 then
			v49 = v_u_13[v47]
		elseif v_u_48 then
			v49 = v_u_15[p_u_44]
			v47 = v49.DisplayName
		else
			v49 = v_u_12[v47]
		end
		p_u_43:FindFirstChild("Title", true).Text = v47
		local v50 = p_u_43:FindFirstChild("Rarity_BG", true)
		local v51 = v50:FindFirstChild("Rarity_Text", true)
		local v52 = p_u_46 and p_u_45.CrateRarity or v49.Rarity
		local v53 = v_u_10.Return_Rarity_Data(v52)
		if v53 then
			local v54 = v53[1]
			local v55 = v53[2]
			local _ = v53[3]
			v51.Text = v54
			v50.ImageColor3 = v55
			local v56 = v51.UIStroke
			local v57, v58, v59 = v55:ToHSV()
			v56.Color = Color3.fromHSV(v57, v58, v59 / 2)
		end
		local v60 = p_u_43:FindFirstChild("Vector", true)
		if v_u_48 then
			v60.Image = "rbxassetid://" .. v49.Icon
		else
			v60.Image = v49.Icon
		end
		local v_u_61 = p_u_43:FindFirstChild("CashBuy", true)
		v_u_61:FindFirstChild("Label", true).Text = v_u_7.DisplaySheckles(p_u_45.Price)
		v_u_61.Activated:Connect(function()
			-- upvalues: (copy) p_u_44, (ref) v_u_36, (copy) p_u_46, (ref) v_u_2, (ref) v_u_35, (copy) v_u_48, (copy) p_u_45, (ref) v_u_4, (ref) v_u_42
			if workspace:GetAttribute("InTutorial") and p_u_44 ~= "Carrot" or v_u_36 then
				return
			end
			v_u_36 = true
			if p_u_46 then
				v_u_2.GameEvents.BuyCosmeticCrate:FireServer(p_u_44, v_u_35.CurrentCategory)
				::l7::
				if p_u_45.PurchaseNotification then
					task.spawn(function()
						-- upvalues: (ref) v_u_42, (ref) p_u_45
						task.wait(1)
						v_u_42(p_u_45.PurchaseNotification, 10, 1.5)
					end)
				end
				task.wait(0.5)
				v_u_36 = false
				return
			else
				if v_u_48 then
					local v62 = p_u_45.FenceName
					local v63 = v_u_4:GetData()
					local v64
					if v63 then
						local v65 = v63.FenceSkinData
						if v65 then
							local v66 = v65.OwnedFences
							if v66 then
								v64 = v66[v62] == true
							else
								v64 = false
							end
						else
							v64 = false
						end
					else
						v64 = false
					end
					if not v64 then
						v_u_2.GameEvents.BuyCosmeticShopFence:FireServer(p_u_44, v_u_35.CurrentCategory)
						goto l7
					end
				end
				v_u_2.GameEvents.BuyCosmeticItem:FireServer(p_u_44, v_u_35.CurrentCategory)
				goto l7
			end
		end)
		if p_u_45.LayoutOrder then
			p_u_43.LayoutOrder = p_u_45.LayoutOrder
		end
		local function v89()
			-- upvalues: (ref) v_u_4, (copy) p_u_46, (ref) v_u_35, (copy) v_u_48, (copy) p_u_44, (copy) p_u_43, (copy) p_u_45, (copy) v_u_61
			local v67 = v_u_4:GetData()
			local v68
			if p_u_46 then
				v68 = v67.CosmeticStock.TabStocks[v_u_35.CurrentCategory].CrateStocks
			elseif v_u_48 then
				v68 = v67.CosmeticStock.TabStocks[v_u_35.CurrentCategory].FenceStocks
			else
				v68 = v67.CosmeticStock.TabStocks[v_u_35.CurrentCategory].ItemStocks
			end
			if v67 then
				v67 = v68[p_u_44]
			end
			local v69 = v67 and v67.Stock or 0
			local v70 = v69 > 0
			local v71 = p_u_43:FindFirstChild("StockTxt", true)
			local v72 = v71:FindFirstChild("UIStroke", true)
			if not v72:GetAttribute("OriginalColor") then
				v72:SetAttribute("OriginalColor", v72.Color)
			end
			if v_u_48 then
				local v73 = p_u_45.FenceName
				local v74 = v_u_4:GetData()
				local v75
				if v74 then
					local v76 = v74.FenceSkinData
					if v76 then
						local v77 = v76.OwnedFences
						if v77 then
							v75 = v77[v73] == true
						else
							v75 = false
						end
					else
						v75 = false
					end
				else
					v75 = false
				end
				v71.Text = v75 and "OWNED" or "UNOWNED"
				v71.TextColor3 = v75 and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
				local v78 = v_u_61
				local v79 = p_u_45.FenceName
				local v80 = v_u_4:GetData()
				local v81
				if v80 then
					local v82 = v80.FenceSkinData
					if v82 then
						local v83 = v82.OwnedFences
						if v83 then
							v81 = v83[v79] == true
						else
							v81 = false
						end
					else
						v81 = false
					end
				else
					v81 = false
				end
				v78.Active = not v81
			else
				v71.Text = v70 and ("X%* Stock"):format(v69) or "NO STOCK"
				v71.TextColor3 = v70 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 56, 83)
				v71.UIStroke.Color = v70 and v72:GetAttribute("OriginalColor") or Color3.fromRGB(0, 0, 0)
			end
			if v_u_48 then
				local v84 = p_u_45.FenceName
				local v85 = v_u_4:GetData()
				local v86
				if v85 then
					local v87 = v85.FenceSkinData
					if v87 then
						local v88 = v87.OwnedFences
						if v88 then
							v86 = v88[v84] == true
						else
							v86 = false
						end
					else
						v86 = false
					end
				else
					v86 = false
				end
				v70 = not v86
			end
			v_u_61.BackgroundColor3 = v70 and Color3.fromRGB(255, 204, 0) or Color3.fromRGB(100, 100, 100)
			v_u_61.UIStroke.Color = v70 and Color3.fromRGB(150, 116, 31) or Color3.fromRGB(60, 60, 60)
			v_u_61.Label.UIStroke.Color = v70 and Color3.fromRGB(122, 81, 0) or Color3.fromRGB(60, 60, 60)
		end
		task.spawn(v89)
		if v_u_5:IsHiddenFromUpdate(v47) then
			p_u_43.Visible = false
			task.delay(v_u_5:GetRemainingTimeUntilUpdate(), function()
				-- upvalues: (copy) p_u_43
				p_u_43.Visible = true
			end)
		end
	end
end
local function v_u_111()
	-- upvalues: (copy) v_u_37, (copy) v_u_4, (copy) v_u_5, (copy) v_u_35, (copy) v_u_14, (copy) v_u_90, (copy) v_u_24, (copy) v_u_12, (copy) v_u_26, (copy) v_u_23, (copy) v_u_25, (copy) v_u_27, (copy) v_u_22
	for _, v91 in v_u_37 do
		v91:Destroy()
	end
	local v92 = {}
	local v93 = v_u_4:GetData()
	if not v_u_5:IsHiddenFromUpdate("Cosmetic Tab Fences") or v_u_35.CurrentCategory == v_u_35.DefaultCategory then
		local v94 = v93.CosmeticStock.TabStocks[v_u_35.CurrentCategory]
		if not v94 then
			return
		end
		local v95 = v94.ItemStocks
		local v96 = v94.CrateStocks
		local v97 = v94.FenceStocks
		if not v_u_14.Tabs[v_u_35.CurrentCategory] then
			return
		end
		for v98, _ in pairs(v96) do
			local v99 = v_u_14.Tabs[v_u_35.CurrentCategory].Crates[v98]
			v_u_90(v_u_24.DailyCrateTemplate, v98, v99, true)
		end
		for v100, _ in pairs(v95) do
			local v101 = v_u_14.Tabs[v_u_35.CurrentCategory].Items[v100]
			local v102 = v_u_12[v100]
			local v103
			if v102.Rarity == "Common" or v102.Rarity == "Uncommon" then
				v103 = v_u_26:Clone()
				v103.Parent = v_u_23.Green
			else
				v103 = v_u_25:Clone()
				v103.Parent = v_u_23.Blue
			end
			v_u_37[v100] = v103
			v103.Name = v100
			table.insert(v92, v103)
			v_u_90(v103, v100, v101)
		end
		for v104, _ in pairs(v97) do
			local v105 = v_u_14.Tabs[v_u_35.CurrentCategory].Fences[v104]
			local v106 = v_u_27:Clone()
			v106.Parent = v_u_22.Green
			v_u_37[v104] = v106
			v106.Name = v104
			table.insert(v92, v106)
			v_u_90(v106, v104, v105)
		end
	end
	table.sort(v92, function(p107, p108)
		local v109 = p107.LayoutOrder
		local v110 = p108.LayoutOrder
		if v109 == v110 then
			return p107.Name < p108.Name
		else
			return v109 < v110
		end
	end)
	if not v_u_5:IsHiddenFromUpdate("Cosmetic Shop Tabs") then
		v_u_35.RebuildCategoryList()
	end
end
local function v_u_113(p112)
	-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_111
	v_u_21.Visible = p112 == "Cosmetics"
	v_u_22.Visible = p112 == "Fences"
	v_u_111()
end
local function v_u_114()
	-- upvalues: (copy) v_u_35
	v_u_35.SetCategories({
		{
			["Name"] = "Cosmetics",
			["IsLocked"] = false
		},
		{
			["Name"] = "Fences",
			["IsLocked"] = false
		}
	})
	v_u_35.DefaultCategory = "Cosmetics"
	v_u_35.SetCurrentCategory(v_u_35.DefaultCategory)
end
function v1.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_28, (copy) v_u_11, (copy) v_u_7, (copy) v_u_29, (copy) v_u_3, (copy) v_u_19, (copy) v_u_30, (copy) v_u_16, (copy) v_u_8, (copy) v_u_33, (copy) v_u_32, (copy) v_u_111, (copy) v_u_114, (copy) v_u_35, (copy) v_u_113, (copy) v_u_21, (copy) v_u_22
	task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_28, (ref) v_u_11, (ref) v_u_7
		while true do
			local v115 = workspace:GetServerTimeNow()
			local v116 = v_u_4:GetData()
			local v117 = v116.CosmeticStock.ForcedCosmeticEndTimestamp and (v116.CosmeticStock.ForcedCosmeticEndTimestamp - v115 or -1) or -1
			if v117 < 0 then
				v117 = v_u_9.RefreshTime - v115 % v_u_9.RefreshTime
			end
			if v117 <= 1 then
				v_u_28.Text = "Restocking"
				v_u_11:CreateNotification("Your Cosmetic Shop stock has been reset!")
			else
				v_u_28.Text = "RESETS IN: " .. v_u_7.compactFormat(v117)
			end
			task.wait(1)
		end
	end)
	v_u_29.Activated:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_19
		v_u_3:Close(v_u_19)
		v_u_19.Enabled = false
	end)
	v_u_30.Activated:Connect(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_8
		v_u_8:PromptPurchase(v_u_16.CosmeticShopRestock.PurchaseID, Enum.InfoType.Product)
	end)
	v_u_33.Activated:Connect(function()
		-- upvalues: (ref) v_u_32
		v_u_32.Enabled = false
	end)
	local v118 = v_u_4:GetPathSignal("CosmeticStock/@")
	if v118 then
		v118:Connect(v_u_111)
	end
	local v119 = v_u_4:GetPathSignal("CosmeticStock")
	if v119 then
		v119:Connect(v_u_111)
	end
	v_u_114()
	v_u_35.OnCategoryChanged:Connect(v_u_113)
	local v120 = v_u_35.DefaultCategory
	v_u_21.Visible = v120 == "Cosmetics"
	v_u_22.Visible = v120 == "Fences"
	v_u_111()
end
task.spawn(v1.Start, v1)
return v1