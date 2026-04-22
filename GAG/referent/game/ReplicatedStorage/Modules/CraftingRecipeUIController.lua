local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
game:GetService("RunService")
game:GetService("ContentProvider")
game:GetService("UserInputService")
v1:WaitForChild("GameEvents")
local v_u_2 = game.Players.LocalPlayer
local v3 = v_u_2.PlayerGui
local v_u_4 = require(v1.Modules.DataService)
local v5 = require(v1.Modules.Signal)
local v_u_6 = require(v1.Modules.FastTween)
require(v1.Modules.DumpTable)
local v_u_7 = require(v1.Modules.MarketController)
require(v1.Modules.GiftController)
local v_u_8 = require(v1.Modules.GuiController)
local v_u_9 = require(v1.Modules.UpdateService)
local v_u_10 = require(v1.Modules.WaitForDescendant)
local v_u_11 = require(v1.Modules.NumberUtil)
local v_u_12 = require(v1.Comma_Module)
require(v1.Item_Module)
local v_u_13 = require(v1.Modules.NumberUtil)
local v_u_14 = require(v1.Modules.SeedPackOddsController)
local v_u_15 = require(v1.Modules.PetEggOddsController)
local v_u_16 = require(v1.Modules.CosmeticCrateOddsController)
local v_u_17 = require(v1.Modules.UseDynamicPrices)
local v_u_18 = require(v1.Modules.ItemImageFinder)
local v_u_19 = require(v1.Modules.StringUtils)
local v_u_20 = require(v1.Data.CosmeticRegistry).CosmeticList
local v21 = require(v1.Data.PetRegistry)
local v_u_22 = v21.PetList
local v_u_23 = v21.PetEggs
local v_u_24 = require(v1.Data.SeedData)
local v_u_25 = require(v1.Data.SeedPackData)
local v_u_26 = require(v1.Data.GearData)
local v_u_27 = require(v1.Data.CurrencyData)
local v_u_28 = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
local v_u_29 = require(v1.Data.CraftingData.CraftingRecipeRegistry)
local v_u_30 = require(v1.Modules.GearUtil)
local v_u_31 = v1.GameEvents.SelectCraftingRecipeBindableEvent
local v32 = v1.GameEvents.OpenRecipeBindableEvent
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = v5.new()
local v_u_36 = v3:WaitForChild("RecipeSelection_UI")
local v_u_37 = v_u_36:WaitForChild("Frame"):WaitForChild("ScrollingFrame")
local v_u_38 = v_u_37:WaitForChild("ItemFrame")
v_u_38.Parent = script
local v_u_39 = v_u_37:WaitForChild("ItemPadding")
v_u_39.Parent = v_u_37
local v_u_40 = nil
local v_u_41 = {}
local v_u_42 = {}
local v43 = {}
local function v_u_47(p44, p45)
	-- upvalues: (copy) v_u_22, (copy) v_u_30, (copy) v_u_26, (copy) v_u_25, (copy) v_u_23, (copy) v_u_28, (copy) v_u_20
	if p45 == "Pet" then
		return v_u_22[p44].Description
	elseif v_u_30.IsItemTypeGear(p45) then
		local v46 = v_u_26[p44]
		if v46 ~= nil then
			return v46.GearDescription
		end
		if game:GetService("RunService"):IsStudio() then
			warn((("CraftingRecipeUIController:FindItemDescription | Couldn\'t find %* Description!"):format(p45)))
		end
		return nil
	elseif p45 == "Seed Pack" then
		return v_u_25.Packs[p44].Description
	elseif p45 == "PetEgg" or p45 == "Egg" then
		return v_u_23[p44].Description
	elseif p45 == "CosmeticCrate" or p45 == "Crate" then
		return v_u_28[p44].Description
	elseif p45 == "Cosmetic" then
		return v_u_20[p44].Description
	else
		return nil
	end
end
local function v_u_94(p48)
	-- upvalues: (copy) v_u_29, (copy) v_u_41, (copy) v_u_42, (copy) v_u_4, (copy) v_u_2, (copy) v_u_9, (copy) v_u_38, (copy) v_u_10, (copy) v_u_18, (copy) v_u_27, (copy) v_u_13, (copy) v_u_11, (copy) v_u_47, (copy) v_u_37, (copy) v_u_39, (copy) v_u_31, (ref) v_u_40, (copy) v_u_7, (copy) v_u_19, (copy) v_u_24, (copy) v_u_6, (copy) v_u_25, (copy) v_u_14, (copy) v_u_36, (copy) v_u_23, (copy) v_u_15, (copy) v_u_28, (copy) v_u_16, (ref) v_u_34, (copy) v_u_35, (copy) v_u_17, (copy) v_u_12
	local v49 = v_u_29.RecipiesSortedByMachineType[p48]
	if not v49 then
		return warn("CraftingRecipeUIController:SetupFrames| Cannot find valid Crafting Station Type")
	end
	for _, v50 in v_u_41 do
		if v50:IsA("Frame") then
			v50:Destroy()
		end
	end
	table.clear(v_u_41)
	for _, v51 in v_u_42 do
		if v51:IsA("Frame") then
			v51:Destroy()
		end
	end
	table.clear(v_u_41)
	for v_u_52, v_u_53 in v49 do
		if v_u_53.DisplayInCrafting ~= false then
			local v54 = v_u_4:GetData()
			if not v54 then
				return warn((("No PlayerData for %*!"):format(v_u_2)))
			end
			if not v_u_53.IsUnlockable or table.find(v54.UnlockedRecipes, v_u_52) then
				local v55 = v_u_53.Inputs
				local v56 = v_u_53.Outputs[1]
				local v57 = v_u_53.TimeToCraft
				local v58 = v56.ItemData.ItemName
				local v59 = v56.ItemType
				if not (v_u_9:IsHiddenFromUpdate(v_u_52) or v_u_9:IsHiddenAfterUpdate(v_u_52)) then
					local v_u_60 = v_u_38:Clone()
					local v61 = v_u_10(v_u_60, "RecipeDetails")
					local v62 = v_u_10(v_u_60, "RequiredItemTemplate")
					for _, v63 in v55 do
						local v64 = v62:Clone()
						v64.Parent = v61
						v64.Visible = true
						local v65 = v_u_18(v63.ItemData.ItemName, v63.ItemType)
						if v65 then
							v64.Detail.ItemImageLabel.Image = v65
						end
						v64.Detail.ItemImageLabel.Visible = true
						v64.ItemName.Text = ("%*%*"):format(v63.ItemData.ItemName, v63.ItemType == "Seed" and " Seed" or "")
						v64.ItemAmount.Visible = false
					end
					local v66 = v_u_53.Cost and v_u_27[v_u_53.Cost.CurrencyType]
					if v66 then
						local v67 = v62:Clone()
						v67.Parent = v61
						v67.Visible = true
						v67.ItemName.Text = v66.CurrencyName
						v67.ItemAmount.Text = "x" .. v_u_13.FormatCompactPrice(v_u_53.Cost.Amount)
						v67.Detail.ItemImageLabel.Image = v66.Icon
						v67.Detail.ItemImageLabel.Visible = true
						v67.Detail.ItemImageLabel.ImageColor3 = v66.Color
					end
					local v68 = v_u_41
					table.insert(v68, v_u_60)
					v_u_60.Name = v58
					v_u_60.LayoutOrder = v_u_53.LayoutOrder
					local v_u_69 = v_u_60.Main_Frame
					local v70 = v56.ItemData.Quantity or 1
					local v71
					if v70 > 1 then
						v71 = ("%* x%*"):format(v58, v70)
					else
						v71 = v58
					end
					v_u_69.CanvasGroup.Item_Text.Text = v71
					v_u_69.CanvasGroup.Item_Text_Shadow.Text = v71
					v_u_69.Cost_Text.Text = ("Craft Time: %*"):format((v_u_11.compactFormat(v57)))
					v_u_69.Cost_Text_Shadow.Text = ("Craft Time: %*"):format((v_u_11.compactFormat(v57)))
					local v72 = v_u_47(v58, v59)
					if v72 then
						v_u_69.LargeDescriptionText.Text = v72
						v_u_69.InfoButton.Visible = true
					else
						v_u_69.InfoButton.Visible = false
					end
					v_u_69.LargeDescriptionText.Visible = false
					local v_u_73 = false
					local function v74()
						-- upvalues: (ref) v_u_73, (copy) v_u_69
						v_u_73 = not v_u_73
						v_u_69.LargeDescriptionText.Visible = v_u_73
						v_u_69.Cost_Text.Visible = not v_u_73
						v_u_69.Display.Visible = not v_u_73
					end
					v_u_69.InfoButton.Activated:Connect(v74)
					v_u_69:FindFirstChild("ShopItem_Image", true).Visible = true
					v_u_60.Parent = v_u_37
					local v_u_75 = v_u_39:Clone()
					v_u_75.LayoutOrder = v_u_53.LayoutOrder + 1
					v_u_75.Name = ("%*_Padding"):format(v_u_52)
					v_u_75.Parent = v_u_37
					local v76 = v_u_42
					table.insert(v76, v_u_75)
					local v_u_77 = v_u_60.Frame
					v_u_77.CraftButton.Activated:Connect(function()
						-- upvalues: (ref) v_u_31, (ref) v_u_40, (copy) v_u_52, (copy) v_u_53
						v_u_31:Fire(v_u_40, v_u_52, v_u_53)
					end)
					local v_u_78 = v_u_53.PurchaseID ~= 0
					v_u_77.Robux_Buy.Visible = v_u_78
					if v_u_78 then
						v_u_77.Robux_Buy.Activated:Connect(function()
							-- upvalues: (ref) v_u_7, (copy) v_u_53
							v_u_7:PromptPurchase(v_u_53.PurchaseID, Enum.InfoType.Product)
						end)
					end
					local v79 = v_u_19:NormalizeRecipeName(v_u_52)
					local v_u_80 = v_u_18(v79, v59)
					local v_u_81
					if v59 == "Seed" then
						v_u_81 = v_u_24[v79].FruitIcon
					else
						v_u_81 = nil
					end
					if v_u_80 then
						v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_80
					end
					if v56.ItemType == "Seed" then
						local v_u_82 = nil
						local v_u_83 = nil
						v_u_69.MouseEnter:Connect(function()
							-- upvalues: (ref) v_u_82, (ref) v_u_6, (copy) v_u_60, (ref) v_u_83, (ref) v_u_81
							v_u_82 = v_u_6(v_u_60.Main_Frame.CanvasGroup.ShopItem_Image, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0), {
								["Rotation"] = v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.Rotation + 10
							})
							v_u_83 = v_u_6(v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1.5
							})
							v_u_83.Completed:Connect(function(p84)
								-- upvalues: (ref) v_u_60, (ref) v_u_81
								if p84 == Enum.PlaybackState.Completed then
									if not v_u_60:IsDescendantOf(game) then
										return
									end
									v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_81
								end
							end)
						end)
						v_u_69.MouseLeave:Connect(function()
							-- upvalues: (ref) v_u_82, (copy) v_u_60, (copy) v_u_80, (ref) v_u_6
							if v_u_82 then
								v_u_82:Cancel()
							end
							v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.Rotation = 0
							v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.Image = v_u_80
							v_u_6(v_u_60.Main_Frame.CanvasGroup.ShopItem_Image.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Scale"] = 1
							})
						end)
					end
					local v_u_85 = v56.ItemData.ItemName
					local v86 = v_u_69:FindFirstChild("OddsButton")
					if v86 then
						v86.Visible = false
						if v56.ItemType == "Seed Pack" and v_u_25.Packs[v_u_85] then
							v86.Visible = true
							v86.Activated:Connect(function()
								-- upvalues: (ref) v_u_14, (copy) v_u_85, (ref) v_u_36
								v_u_14:Open(v_u_85, v_u_36)
							end)
						elseif v56.ItemType == "PetEgg" and v_u_23[v_u_85] then
							v86.Visible = true
							v86.Activated:Connect(function()
								-- upvalues: (ref) v_u_15, (copy) v_u_85, (ref) v_u_36
								v_u_15:Open(v_u_85, v_u_36)
							end)
						elseif v56.ItemType == "CosmeticCrate" and v_u_28[v_u_85] then
							v86.Visible = true
							v86.Activated:Connect(function()
								-- upvalues: (ref) v_u_16, (copy) v_u_85, (ref) v_u_36
								v_u_16:Open(v_u_85, v_u_36)
							end)
						end
					end
					local function v87()
						-- upvalues: (ref) v_u_34, (copy) v_u_52, (copy) v_u_77, (ref) v_u_6, (copy) v_u_75
						if v_u_34 == v_u_52 then
							v_u_77.Visible = true
							v_u_6(v_u_77, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Position"] = UDim2.fromScale(0.5, 1.3)
							})
							v_u_6(v_u_75, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Size"] = UDim2.fromScale(0.13, 0.25)
							})
						else
							task.delay(0.25, function()
								-- upvalues: (ref) v_u_77
								if v_u_77.Position == UDim2.fromScale(0.5, 0.5) then
									v_u_77.Visible = false
								end
							end)
							v_u_6(v_u_77, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Position"] = UDim2.fromScale(0.5, 0.5)
							})
							v_u_6(v_u_75, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Size"] = UDim2.fromScale(0.13, 0.02)
							})
						end
					end
					v_u_35:Connect(v87)
					task.spawn(v87)
					local v_u_88 = false
					v_u_69.Activated:Connect(function()
						-- upvalues: (ref) v_u_6, (ref) v_u_37, (copy) v_u_60, (ref) v_u_41, (ref) v_u_34, (copy) v_u_52, (ref) v_u_35, (ref) v_u_88, (copy) v_u_78, (ref) v_u_17, (copy) v_u_53, (copy) v_u_77, (ref) v_u_7, (ref) v_u_12
						v_u_6(v_u_37, TweenInfo.new(0.35), {
							["CanvasPosition"] = Vector2.new(0, v_u_60.AbsoluteSize.Y * (table.find(v_u_41, v_u_60) - 1))
						})
						local v89
						if v_u_34 == v_u_52 then
							v89 = nil
						else
							v89 = v_u_52
						end
						v_u_34 = v89
						v_u_35:Fire()
						if not v_u_88 and v_u_78 then
							if v_u_17 or v_u_53.RobuxPrice == nil then
								if not v_u_17 then
									warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_77:GetFullName()))))
								end
								v_u_7:SetPriceLabel(v_u_77.Robux_Buy.Price, v_u_53.PurchaseID, ":robux::value:")
							else
								v_u_77.Robux_Buy.Price.Text = ("%*%*"):format(utf8.char(57346), (v_u_12.Comma(v_u_53.RobuxPrice)))
							end
							v_u_88 = true
						end
					end)
				end
			end
		end
	end
	table.sort(v_u_41, function(p90, p91)
		local v92 = p90.LayoutOrder
		local v93 = p91.LayoutOrder
		if v92 == v93 then
			return p90.Name < p91.Name
		else
			return v92 < v93
		end
	end)
end
function v43.Start(_)
	-- upvalues: (copy) v_u_8, (copy) v_u_36
	v_u_8:UsePopupAnims(v_u_36)
	v_u_36.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_36
		v_u_8:Close(v_u_36)
	end)
end
v32.Event:Connect(function(p95)
	-- upvalues: (copy) v_u_8, (copy) v_u_36, (copy) v_u_9, (ref) v_u_33, (copy) v_u_94, (ref) v_u_40
	v_u_8:Open(v_u_36)
	local v_u_96 = p95:GetAttribute("CraftingObjectType")
	if not v_u_96 or typeof(v_u_96) ~= "string" then
		return warn("CraftingObjectType is not valid")
	end
	if not (v_u_9:IsUpdateDone() or v_u_33) then
		v_u_33 = task.delay(v_u_9:GetRemainingTimeUntilUpdate() + 1, function()
			-- upvalues: (ref) v_u_94, (copy) v_u_96
			v_u_94(v_u_96)
		end)
	end
	v_u_94(v_u_96)
	v_u_40 = p95
end)
task.spawn(v43.Start, v43)
return v43