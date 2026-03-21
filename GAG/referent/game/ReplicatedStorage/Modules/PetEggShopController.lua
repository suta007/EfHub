local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("ServerScriptService")
local v2 = game:GetService("CollectionService")
local v_u_3 = game.Players.LocalPlayer
local v4 = v_u_3.PlayerGui
local v_u_5 = require(v_u_1.Modules.DataService)
local v_u_6 = require(v_u_1.Modules.GiftController)
local v_u_7 = require(v_u_1.Modules.MarketController)
local v_u_8 = require(v_u_1.Modules.GuiController)
local v_u_9 = require(v_u_1.Modules.NumberUtil)
local v_u_10 = require(v_u_1.Data.DecimalNumberFormat)
require(v_u_1.Modules.CommaFormatNumber)
local v_u_11 = require(v_u_1.Modules.RebirthUnlocksSharedService)
require(v_u_1.Item_Module)
require(v_u_1.Comma_Module)
local v_u_12 = require(v_u_1.Data.PetEggShopData)
local v_u_13 = require(v_u_1.Data.PetEggData)
local v_u_14 = require(v_u_1.Data.PetRegistry)
local v_u_15 = require(v_u_1.Frame_Popup_Module)
local v_u_16 = require(v_u_1.Data.DevProductIds)
local v_u_17 = v_u_14.PetList
local v18 = {}
local v_u_19 = v_u_1:WaitForChild("Assets"):WaitForChild("Models"):WaitForChild("EggModels")
local v_u_20 = v2:GetTagged("PhysicalEggPetStandModel")[1]
local v_u_21 = v_u_20:WaitForChild("Timer"):WaitForChild("SurfaceGui"):WaitForChild("ResetTimeLabel")
local v_u_22 = v_u_20:WaitForChild("RefreshSign"):FindFirstChildWhichIsA("ProximityPrompt", true)
local v_u_23 = v4:WaitForChild("ConfirmPetEggPurchase")
local v_u_24 = v_u_23.Container.Content.Purchase
local v_u_25 = v_u_24.Gift.GiftButton
local v_u_26 = v_u_24.PurchaseRobux.RobuxButton
local v_u_27 = v_u_24.PurchaseCash.ShecklesButton
local v_u_28 = v_u_24.Display.PetChanceDetails
local v_u_29 = v_u_28.PetItemTemplate
local v_u_30 = 0
local v_u_31 = nil
local function v_u_36(p32)
	-- upvalues: (copy) v_u_36
	local v33 = {}
	for v34, v35 in p32 do
		if type(v35) == "table" then
			v33[v34] = v_u_36(v35)
		else
			v33[v34] = v35
		end
	end
	return v33
end
local function v_u_75()
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_23, (copy) v_u_20, (copy) v_u_36, (copy) v_u_13, (copy) v_u_19, (copy) v_u_14, (copy) v_u_9, (copy) v_u_24, (copy) v_u_28, (copy) v_u_29, (copy) v_u_17, (copy) v_u_10, (copy) v_u_27, (copy) v_u_7, (copy) v_u_26, (ref) v_u_31, (ref) v_u_30, (copy) v_u_15
	local v37 = v_u_5:GetData()
	v_u_8:Close(v_u_23)
	local v38 = v_u_20.EggLocations:GetChildren()
	for _, v39 in ipairs(v38) do
		if v39:IsA("Model") then
			v39:Destroy()
		end
	end
	local v40 = v_u_36(v37.PetEggStock.Stocks)
	table.sort(v40, function(p41, p42)
		-- upvalues: (ref) v_u_13
		local v43 = v_u_13[p41.EggName]
		local v44 = v_u_13[p42.EggName]
		return v43.StockChance > v44.StockChance
	end)
	for v_u_45, v46 in ipairs(v40) do
		local v_u_47 = v_u_13[v46.EggName]
		if v_u_45 > 3 then
			return
		end
		if v46 then
			local v48 = v_u_19:FindFirstChild(v_u_47.EggName)
			if v48 then
				local v_u_49 = v48:Clone()
				v_u_49.Parent = v_u_20.EggLocations
				v_u_49:PivotTo(v38[v_u_45].CFrame)
				v_u_49.HitBox.Anchored = true
				if v46.Stock <= 0 then
					v_u_49:SetAttribute("RobuxEggOnly", true)
					for _, v50 in v_u_49:GetDescendants() do
						if v50:IsA("BasePart") and v50.Name ~= "HitBox" then
							v50.Transparency = 0.65
						end
					end
				end
				local v_u_51 = v38[v_u_45]:FindFirstChild("SurfaceGui", true)
				local v52 = v_u_51:WaitForChild("EggNameTextLabel")
				local v53 = v_u_51:WaitForChild("RarityTextLabel")
				local v54 = v_u_51:WaitForChild("PriceTextLabel")
				local v55 = v_u_14.PetEggs[v_u_47.EggName]
				local v56 = v55 and v55.Color or Color3.new(1, 1, 1)
				v52.Text = v_u_47.EggName
				v53.Text = v_u_47.EggRarity
				v53.TextColor3 = v56
				v54.Text = ("%*"):format((v_u_9.DisplaySheckles(v_u_47.Price)))
				local v57 = Instance.new("ProximityPrompt")
				v57:SetAttribute("Theme", "ShadowedPrompt")
				v57.Parent = v_u_49
				v57.ActionText = "Buy Egg"
				v57.HoldDuration = 0
				v57.Style = Enum.ProximityPromptStyle.Custom
				v57.Enabled = true
				v57.MaxActivationDistance = 6
				v57.Triggered:Connect(function()
					-- upvalues: (ref) v_u_24, (ref) v_u_14, (copy) v_u_47, (ref) v_u_28, (ref) v_u_29, (ref) v_u_17, (ref) v_u_10, (ref) v_u_27, (ref) v_u_9, (ref) v_u_7, (ref) v_u_26, (ref) v_u_31, (ref) v_u_30, (copy) v_u_45, (copy) v_u_49, (ref) v_u_15, (ref) v_u_23, (ref) v_u_8
					local _ = v_u_24.PetName
					local v58 = v_u_24.Rarity
					local v59 = v_u_24.HeaderTitle
					local v60 = v_u_14.PetEggs
					if not v60 then
						return warn((("PetEggShopController:GenerateStall | Cannot find Pet Rarity Data for \"%*\"!"):format(v_u_47.EggName)))
					end
					local v61 = v60[v_u_47.EggName]
					local v62 = v61.Color
					local v63 = v61.RarityData.Items
					local v64 = v62.R * 255
					local v65 = math.floor(v64)
					local v66 = v62.G * 255
					local v67 = math.floor(v66)
					local v68 = v62.B * 255
					local v69 = math.floor(v68)
					local v70 = string.format("#%02X%02X%02X", v65, v67, v69)
					v58.TextColor3 = v62
					v59.Text = string.format("Purchase <font color=\"%s\">%s</font>", v70, v_u_47.EggName)
					for _, v71 in v_u_28:GetChildren() do
						if v71:IsA("Frame") and v71.Visible then
							v71:Destroy()
						end
					end
					for v72, v73 in v63 do
						local v74 = v_u_29:Clone()
						v74.Parent = v_u_28
						v74.Visible = true
						if v_u_17[v72] and v_u_17[v72].Icon then
							v74.Detail.PetImageLabel.Image = v_u_17[v72].Icon
						end
						v74.PetChance.Text = ("%*%%"):format((v_u_10(v73.NormalizedOdd)))
						v74.LayoutOrder = 100 / v73.NormalizedOdd
						v74.PetName.Text = v73.Name
					end
					v_u_27.Text = v_u_9.DisplaySheckles(v_u_47.Price)
					task.spawn(function()
						-- upvalues: (ref) v_u_7, (ref) v_u_26, (ref) v_u_47
						v_u_7:SetPriceLabel(v_u_26, v_u_47.PurchaseID, ":robux::value:")
					end)
					v_u_31 = v_u_47
					v_u_30 = v_u_45
					if v_u_49:GetAttribute("RobuxEggOnly") then
						v_u_27.Text = "NO STOCK"
						v_u_27.UIStroke.Color = Color3.fromRGB(85, 0, 0)
						v_u_27.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
						v_u_27.Parent.UIStroke.Color = Color3.fromRGB(85, 0, 0)
					else
						v_u_27.Text = v_u_9.DisplaySheckles(v_u_47.Price)
						v_u_27.UIStroke.Color = Color3.fromRGB(30, 100, 14)
						v_u_27.Parent.BackgroundColor3 = Color3.fromRGB(37, 238, 38)
						v_u_27.Parent.UIStroke.Color = Color3.fromRGB(30, 100, 14)
					end
					v_u_27.AutoButtonColor = not v_u_49:GetAttribute("RobuxEggOnly")
					v_u_27.Active = not v_u_49:GetAttribute("RobuxEggOnly")
					v_u_15.Show(v_u_23)
					v_u_8:Open(v_u_23)
				end)
				v57.PromptShown:Connect(function()
					-- upvalues: (copy) v_u_51
					v_u_51.Enabled = true
				end)
				v57.PromptHidden:Connect(function()
					-- upvalues: (copy) v_u_51
					v_u_51.Enabled = false
				end)
			else
				warn((("GenerateStall | No egg model found for name \"%*\"!"):format(v_u_47.EggName)))
			end
		else
			warn((("GenerateStall | No egg found for egg \"%*\"!"):format(v_u_47.EggName)))
		end
	end
end
local function v_u_76()
	-- upvalues: (copy) v_u_24, (copy) v_u_8, (copy) v_u_23, (copy) v_u_26, (copy) v_u_7, (ref) v_u_31, (copy) v_u_25, (copy) v_u_6, (copy) v_u_27, (copy) v_u_1, (ref) v_u_30
	v_u_24.Exit.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_23
		v_u_8:Close(v_u_23)
	end)
	v_u_26.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_31, (ref) v_u_8, (ref) v_u_23
		v_u_7:PromptPurchase(v_u_31.PurchaseID, Enum.InfoType.Product)
		v_u_8:Close(v_u_23)
	end)
	v_u_25.Activated:Connect(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_6, (ref) v_u_8, (ref) v_u_23
		if v_u_31.GiftPurchaseID then
			v_u_6:PromptGiftFromGiftId(v_u_31.GiftPurchaseID)
		end
		v_u_8:Close(v_u_23)
	end)
	v_u_27.Activated:Connect(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_30, (ref) v_u_8, (ref) v_u_23
		v_u_1.GameEvents.BuyPetEgg:FireServer(v_u_30)
		v_u_8:Close(v_u_23)
	end)
end
function v18.Start(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_75, (copy) v_u_76, (copy) v_u_22, (copy) v_u_16, (copy) v_u_7, (copy) v_u_11, (copy) v_u_3, (copy) v_u_12, (copy) v_u_21, (copy) v_u_9
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_75
		local v77 = v_u_5:GetPathSignal("PetEggStock/@")
		if v77 then
			v77:Connect(v_u_75)
		end
		local v78 = v_u_5:GetPathSignal("PetEggStock")
		if v78 then
			v78:Connect(v_u_75)
		end
	end)
	task.spawn(v_u_75)
	task.spawn(v_u_76)
	task.spawn(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_16, (ref) v_u_7, (ref) v_u_11, (ref) v_u_3
		v_u_22.Triggered:Connect(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_7
			v_u_7:PromptPurchase(v_u_16.RefreshPetShop.PurchaseID, Enum.InfoType.Product)
		end)
		if not v_u_11:HasUnlockedFeature(v_u_3, "PET_STAND") then
			v_u_22.Enabled = false
			local v_u_79 = nil
			v_u_79 = v_u_11.OnRebirthUnlock:Connect(function(p80, p81)
				-- upvalues: (ref) v_u_3, (ref) v_u_22, (ref) v_u_79
				if p80 == v_u_3 then
					if p81 == "PET_STAND" then
						v_u_22.Enabled = true
						if v_u_79 then
							v_u_79:Disconnect()
							v_u_79 = nil
						end
					end
				else
					return
				end
			end)
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_21, (ref) v_u_9
		while true do
			local v82 = workspace:GetServerTimeNow()
			local v83 = v_u_5:GetData()
			local v84 = v83.PetEggStock.ForcedEggEndTimestamp and (v83.PetEggStock.ForcedEggEndTimestamp - v82 or -1) or -1
			if v84 < 0 then
				v84 = v_u_12.RefreshTime - v82 % v_u_12.RefreshTime
			end
			v_u_21.Text = v84 <= 0 and "Restocking" or v_u_9.compactFormat(v84)
			task.wait(1)
		end
	end)
end
task.spawn(v18.Start, v18)
local v85 = require(v_u_1.UserGenerated.Client.ClientABTests)
local v86 = v85.GetAssignmentsAsync(v_u_3, true) and v85.GetAttributes(v_u_3)
if v86 then
	local v87 = v2:GetTagged("PetStandModel")[1]
	local v88 = v2:GetTagged("PhysicalEggPetStandModel")[1]
	if v86.AB_PhysicalEggShop == true then
		v87.Parent = script
		v88.Parent = workspace.NPCS
		v2:GetTagged("PetMutationMachine")[1]:PivotTo(CFrame.new(Vector3.new(-242.354, 1.05, 25.4)) * CFrame.fromEulerAngles(0, 90, 0))
	else
		v87.Parent = workspace.NPCS
		v88.Parent = script
		v2:GetTagged("PetMutationMachine")[1]:PivotTo(CFrame.new(Vector3.new(-242.354, 1.05, 17.4)) * CFrame.fromEulerAngles(0, 90, 0))
	end
end
return v18