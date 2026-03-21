task.wait(3)
local v_u_1 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local v2 = game:GetService("UserInputService")
require(game.ReplicatedStorage.Modules.Icon)
local v3 = game.ReplicatedStorage
require(v3.Modules.GuiController)
game:GetService("UserInputService")
game:GetService("RunService")
local v4 = v_u_1:WaitForChild("Shop_UI")
local v5 = v_u_1:WaitForChild("GardenGuide")
local v6 = v_u_1:WaitForChild("SeasonPassUI")
local v7 = v_u_1:WaitForChild("EventShop_UI")
local v8 = v_u_1:WaitForChild("Gear_Shop")
local v9 = v_u_1:WaitForChild("TravelingMerchantShop_UI")
local v10 = v_u_1:WaitForChild("PetShop_UI")
local v11 = v_u_1:WaitForChild("PetMutationOdds_UI")
local v12 = v_u_1:WaitForChild("PetEquipSlots_UI")
local v13 = v_u_1:WaitForChild("CosmeticShop_UI")
local v14 = v_u_1:WaitForChild("RecipeSelection_UI")
local v15 = v_u_1:WaitForChild("SettingsUI")
local v16 = v_u_1:WaitForChild("GardenCoinShop_UI")
local v17 = v_u_1:WaitForChild("FenceSkinSelector")
local v18 = v_u_1:WaitForChild("SaveSlotUI")
local v19 = v_u_1:WaitForChild("Hud_UI")
local v20 = v_u_1:WaitForChild("StarterPack_UI")
local v21 = v_u_1:WaitForChild("TradeMenu")
local v22 = v_u_1:WaitForChild("BuyTokens")
local v23 = v_u_1:WaitForChild("TokensInfo")
local v24 = v_u_1:WaitForChild("TradePlazaIndex")
local v25 = v_u_1:WaitForChild("TradeBoothSkinSelector")
local v26 = v_u_1:WaitForChild("TradeBooth")
local v27 = v_u_1:WaitForChild("TradeBoothInventory")
local v28 = v_u_1:WaitForChild("TradeBoothHistory")
local v29 = v_u_1:WaitForChild("TradeBoothCreateListing")
local v30 = v_u_1:WaitForChild("TradeBoothRemoveListing")
local v31 = v_u_1:WaitForChild("TradeBoothBuyItem")
local v32 = v_u_1:WaitForChild("GenericRewards_UI")
local v33 = v_u_1:WaitForChild("NewYears2025_StreakPetsReward_UI")
local v34 = v_u_1:WaitForChild("TheGardenGames_QuestUI")
local v35 = v_u_1:WaitForChild("TheGardenGames_SpinWheel")
local v36 = v_u_1:WaitForChild("BuyCarrotsUI")
local v37 = v_u_1:WaitForChild("ButtercupEvent_QuestUI")
local v38 = v_u_1:WaitForChild("ButtercupCoinShop_UI")
local v39 = v_u_1:WaitForChild("BuyButtercupCrate")
local v40 = v_u_1:WaitForChild("ValentinesEvent_UI")
local v41 = v_u_1:WaitForChild("ValentinesEvent2_UI")
local v_u_42 = v_u_1:WaitForChild("Hud_UI")
local v43 = v_u_1:WaitForChild("Seed_Shop")
local v_u_44 = {
	v4,
	v5,
	v6,
	v8,
	v9,
	v10,
	v11,
	v12,
	v13,
	v14,
	v15,
	v43,
	v7,
	v16,
	v17,
	v18,
	v20,
	v21,
	v22,
	v23,
	v24,
	v25,
	v26,
	v27,
	v28,
	v29,
	v30,
	v31,
	v32,
	v33,
	v34,
	v35,
	v36,
	v37,
	v38,
	v39,
	v40,
	v41
}
local v45 = v_u_1:FindFirstChild("ChristmasGiftRewards_UI")
local v46 = v_u_1:FindFirstChild("ChristmasGiftV2Rewards_UI")
local v47 = v_u_1:FindFirstChild("ChristmasTreeRewards_UI")
local v48 = v_u_1:FindFirstChild("ChristmasTreeRewardList_UI")
if v45 then
	table.insert(v_u_44, v45)
end
if v46 then
	table.insert(v_u_44, v46)
end
if v47 then
	table.insert(v_u_44, v47)
end
if v48 then
	table.insert(v_u_44, v48)
end
local v_u_49 = v_u_1:WaitForChild("BackpackGui")
v43.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v43.TabAnchor.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v43.Daily.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v5.MainMenu.Position = UDim2.new(0.54, 0, 0.54, 0)
v6.SeasonPassFrame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
if v2.TouchEnabled == true then
	v7.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	v7.TabAnchor.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
end
v8.TabAnchor.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v8.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v9.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v10.TabAnchor.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v10.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v11.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v13.CosmeticShop.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v14.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v15.SettingsFrame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v15.SettingsFrame.UIScale.Scale = 1.2
v5.MainMenu.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v16.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v17.SkinSelector.UIScale.Scale = 1.1
v18.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v19.SideBtns.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v19.SideBtns.UIScale.Scale = 1.1
v20.Frame.Variant1.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v20.Frame.Variant2.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v21.TradeMenuFrame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v32.Frame.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
v32.Frame.Size = UDim2.new(0.47, 0, 0.47, 0)
v32.Frame.Position = UDim2.new(0.5, 0, 0.575, 0)
if v45 then
	local v50 = v45.Frame
	v50.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	v50.Size = UDim2.new(0.47, 0, 0.47, 0)
	v50.Position = UDim2.new(0.5, 0, 0.575, 0)
end
if v46 then
	local v51 = v46.Frame
	v51.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	v51.Size = UDim2.new(0.47, 0, 0.47, 0)
	v51.Position = UDim2.new(0.5, 0, 0.575, 0)
end
if v47 then
	local v52 = v47.Frame
	v52.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	v52.Size = UDim2.new(0.47, 0, 0.47, 0)
	v52.Position = UDim2.new(0.5, 0, 0.575, 0)
end
if v48 then
	local v53 = v48.Frame
	v53.UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	v53.Size = UDim2.new(0.47, 0, 0.47, 0)
	v53.Position = UDim2.new(0.5, 0, 0.575, 0)
end
function UPD()
	-- upvalues: (copy) v_u_44, (copy) v_u_1, (copy) v_u_42, (copy) v_u_49
	local v54 = false
	for _, v55 in pairs(v_u_44) do
		if v55.Enabled == true then
			v54 = true
		end
	end
	if v54 == true then
		local v56 = v_u_1:WaitForChild("Teleport_UI")
		if v56 then
			v56.Enabled = false
		end
	else
		local v57 = v_u_1:WaitForChild("Teleport_UI")
		if v57 then
			v57.Enabled = true
		end
	end
	v_u_42.Enabled = not v54
	v_u_49.Enabled = not v54
end
UPD()
for _, v58 in pairs(v_u_44) do
	v58:GetPropertyChangedSignal("Enabled"):Connect(function()
		UPD()
	end)
end