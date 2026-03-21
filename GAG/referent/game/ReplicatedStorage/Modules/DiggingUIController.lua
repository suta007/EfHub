local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("MarketplaceService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("GamepadService")
local v_u_6 = game:GetService("GuiService")
local v7 = game:GetService("Players")
local v_u_8 = require(v1.Modules.Icon)
local v_u_9 = require(v1.Code.VFXUtils)
local v_u_10 = require(v1.Modules.Backpack)
local v_u_11 = require(v1.Modules.NumberUtil)
local v_u_12 = require(v1.Modules.DataService)
local v_u_13 = require(v1.Data.DevProductIds)
require(v1.Modules.GiveServiceCommon)
local v_u_14 = require(v1.Modules.GuiController)
local v_u_15 = require(v1.Modules.UpdateService)
local v_u_16 = require(v1.Modules.ItemImageFinder)
local v_u_17 = require(v1.Modules.MarketController)
local v_u_18 = require(v1.Modules.UseDynamicPrices)
local v19 = require(v1.Code.CircularTransition)
local v_u_20 = require(v1.Modules.GiveServiceCommon)
local v_u_21 = require(v1.Modules.DiggingRewardsUIController)
local v_u_22 = require(v1.Modules.ProximityPromptController)
local v_u_23 = require(v1.UserGenerated.Client.ClientABTests)
local v_u_24 = require(v1.Data.DiggingMinigame.DiggingConfigData)
local v_u_25 = require(v1.Data.DiggingMinigame.DiggingEventConfigData)
local v_u_26 = v1.GameEvents.DiggingMiniGame.RestartDiggingSheckles
local v_u_27 = {
	["IsInDigPrompt"] = false
}
local v_u_28 = workspace.CurrentCamera
local v_u_29 = v7.LocalPlayer
local v30 = v_u_29.PlayerGui
local v_u_31 = v30:WaitForChild("Digging_UI")
local v_u_32 = v30:WaitForChild("DiggingRewards_UI")
local v_u_33 = v30:WaitForChild("Teleport_UI")
local v_u_34 = v30:WaitForChild("Hud_UI")
local v_u_35 = v30:WaitForChild("FriendBoost")
local v_u_36 = v30:WaitForChild("Sheckles_UI")
local v_u_37 = v30:WaitForChild("GardenCoinCurrency_UI")
local v_u_38 = v30:WaitForChild("Honey_UI")
local v_u_39 = v_u_31:WaitForChild("DiggingEventReward")
v_u_39:FindFirstChild("REWARD_TITLE_TEXT", true)
v_u_39:FindFirstChild("REWARD_TITLE_TEXT_SHADOW", true)
local v_u_40 = v_u_39:FindFirstChild("REWARD_TEXT", true)
local v_u_41 = v_u_39:FindFirstChild("REWARD_TEXT_SHADOW", true)
local v_u_42 = v_u_39:FindFirstChild("REWARD_IMAGE", true)
local v_u_43 = v_u_31:FindFirstChild("DIG_TIME_LEFT", true)
local v_u_44 = v_u_31:FindFirstChild("DIG_TIME_LEFT_SHADOW", true)
local v_u_45 = v_u_31:FindFirstChild("TIMER_ICON", true)
local v_u_46 = v_u_31:FindFirstChild("DIGS_REMAINING", true)
local v_u_47 = v_u_31:FindFirstChild("DIGS_REMAINING_SHADOW", true)
local v_u_48 = v_u_31:FindFirstChild("TREASURES_LEFT", true)
local v_u_49 = v_u_31:FindFirstChild("TREASURES_LEFT_SHADOW", true)
local v_u_50 = v_u_31:FindFirstChild("EVENT_TIME_LEFT", true)
local v_u_51 = v_u_31:FindFirstChild("EVENT_TIME_LEFT_SHADOW", true)
local v_u_52 = v_u_31:FindFirstChild("DiggingCompleteFrame", true)
local v_u_53 = v_u_31:FindFirstChild("RESTART_SHECKLES", true)
local v_u_54 = v_u_31:FindFirstChild("RESTART_ROBUX", true)
local v_u_55 = v_u_31:FindFirstChild("OddsButton", true)
local v_u_56 = v19.new(game.Players.LocalPlayer)
local v_u_57 = require(v1.Data.SharedCycleHandlerData)
local v_u_58 = v_u_25.IsPermanentEvent() and v_u_57.PermanentDigging or v_u_57.Gravedigger
local function v_u_64()
	-- upvalues: (copy) v_u_12, (copy) v_u_46, (copy) v_u_24, (copy) v_u_47, (copy) v_u_48, (copy) v_u_49, (copy) v_u_25, (copy) v_u_52
	local v_u_59 = v_u_12:GetData()
	if v_u_59 then
		local v60 = v_u_59.DiggingData
		v_u_46.Text = ("%*/%*"):format(v60.RemainingDigs, v_u_24.MAX_DIGS_AVALIABLE)
		v_u_47.Text = v_u_46.Text
		local v61 = #v60.TreasureData
		local v62 = 0
		for _, v63 in v60.TreasureData do
			if v63.TreasureClaimed then
				v62 = v62 + 1
			end
		end
		if v62 < v61 then
			v_u_48.Text = ("%*/%*"):format(v62, v61)
		else
			v_u_48.Text = "All treasures found!"
		end
		v_u_49.Text = v_u_48.Text
		if v_u_59.DiggingData.DigComplete then
			task.spawn(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_52, (copy) v_u_59
				task.wait(4)
				if v_u_25.IsPermanentEvent() then
					v_u_52.Visible = v_u_59.DiggingData.DigComplete
				else
					v_u_52.Visible = true
				end
			end)
		else
			v_u_52.Visible = false
		end
	else
		return
	end
end
local function v_u_68()
	-- upvalues: (copy) v_u_2, (copy) v_u_56, (copy) v_u_28
	local v65 = v_u_2:GetTagged("DiggingCameraPart")
	local v66 = v_u_2:GetTagged("DiggingCameraPart")[1]
	for _, v67 in v65 do
		if v67:IsDescendantOf(workspace) then
			v66 = v67
			break
		end
	end
	v_u_56:Close()
	task.wait(0.5)
	v_u_28.CameraType = Enum.CameraType.Scriptable
	v_u_28.CFrame = v66.CFrame
	task.wait(0.5)
	v_u_56:Open()
end
local function v_u_69()
	-- upvalues: (copy) v_u_29, (copy) v_u_56, (copy) v_u_28
	if v_u_29:GetAttribute("PlayerDigging") ~= nil then
		v_u_56:Close()
	end
	task.wait(0.5)
	v_u_28.CameraType = Enum.CameraType.Custom
	v_u_28.CameraSubject = v_u_29.Character:WaitForChild("Humanoid")
	task.wait(0.5)
	if v_u_29:GetAttribute("PlayerDigging") ~= nil then
		v_u_56:Open()
	end
end
local function v_u_74()
	-- upvalues: (copy) v_u_12, (copy) v_u_23, (copy) v_u_29, (copy) v_u_43, (copy) v_u_45, (copy) v_u_44, (copy) v_u_24, (copy) v_u_11
	while true do
		while true do
			task.wait(1)
			local v70 = v_u_12:GetData()
			if v_u_23.GetAttributeAsync(v_u_29, "AB_DiggingTypes", "Default") == "No_Free" then
				break
			end
			v_u_45.Visible = true
			if v70 then
				if v70.DiggingData.RemainingDigs >= v_u_24.MAX_DIGS_AVALIABLE or v70.DiggingData.NextDiggingGainTime < 0 then
					v_u_43.Text = "MAX"
					v_u_44.Text = v_u_43.Text
				else
					local v71 = workspace:GetServerTimeNow()
					local v72 = v70.DiggingData.NextDiggingGainTime - v71
					local v73 = math.max(v72, 0)
					v_u_43.Text = v_u_11.compactFormat(v73)
					v_u_44.Text = v_u_43.Text
				end
			end
		end
		v_u_43.Visible = false
		v_u_45.Visible = false
		v_u_44.Visible = false
	end
end
local function v_u_75()
	-- upvalues: (ref) v_u_58, (copy) v_u_50, (copy) v_u_11, (copy) v_u_51
	while true do
		workspace:GetServerTimeNow()
		if v_u_58:IsRunning() and v_u_58:IsCycleActive() then
			v_u_50.Text = v_u_11.compactFormat(v_u_58:GetTimeRemaining() or 0)
			v_u_51.Text = v_u_50.Text
		end
		task.wait(1)
	end
end
function v_u_27.PromptDigProductPurchase(_)
	-- upvalues: (copy) v_u_27, (copy) v_u_3, (copy) v_u_29, (copy) v_u_17, (copy) v_u_13
	if v_u_27.IsInDigPrompt then
		return nil
	end
	v_u_27.IsInDigPrompt = true
	local v_u_76 = nil
	local function v77()
		-- upvalues: (ref) v_u_76, (ref) v_u_27
		if v_u_76 then
			v_u_76:Disconnect()
			v_u_76 = nil
		end
		task.wait(1)
		v_u_27.IsInDigPrompt = false
		return nil
	end
	v_u_76 = v_u_3.PromptProductPurchaseFinished:Connect(v77)
	local v_u_78 = nil
	v_u_78 = v_u_29.PlayerGui.TradeNotifs:GetPropertyChangedSignal("Enabled"):Connect(function()
		-- upvalues: (ref) v_u_29, (ref) v_u_78, (ref) v_u_27
		if not v_u_29.PlayerGui.TradeNotifs.Enabled then
			if v_u_78 then
				v_u_78:Disconnect()
				v_u_78 = nil
			end
			task.wait(1)
			v_u_27.IsInDigPrompt = false
		end
	end)
	v_u_17:PromptPurchase(v_u_13.DiggingBuyDigs.PurchaseID, Enum.InfoType.Product)
	return nil
end
function v_u_27.Open(_)
	-- upvalues: (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37, (copy) v_u_38, (copy) v_u_8, (copy) v_u_10, (copy) v_u_31, (copy) v_u_22, (copy) v_u_64, (copy) v_u_68, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_29
	v_u_33.Enabled = false
	v_u_34.Enabled = false
	v_u_35.Enabled = false
	v_u_36.Enabled = false
	v_u_37.Enabled = false
	v_u_38.Enabled = false
	v_u_8.setTopbarEnabled(false)
	v_u_10:SetBackpackEnabled(false)
	v_u_31.Enabled = true
	v_u_22:AddDisabler("DiggingMinigame")
	v_u_64()
	v_u_68()
	if v_u_4.PreferredInput == Enum.PreferredInput.Gamepad then
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_5, (ref) v_u_31, (ref) v_u_6
			v_u_5:EnableGamepadCursor(v_u_31.VirtualCusor)
			v_u_6.SelectedObject = nil
		end)
	end
	v_u_29:SetAttribute("PlayerDigging", true)
end
function v_u_27.Close(_)
	-- upvalues: (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37, (copy) v_u_38, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4, (copy) v_u_5, (copy) v_u_31, (copy) v_u_22, (copy) v_u_69, (copy) v_u_29
	v_u_33.Enabled = true
	v_u_34.Enabled = true
	v_u_35.Enabled = true
	v_u_36.Enabled = true
	v_u_37.Enabled = true
	v_u_38.Enabled = true
	v_u_8.setTopbarEnabled(true)
	v_u_10:SetBackpackEnabled(true)
	if v_u_4.PreferredInput == Enum.PreferredInput.Gamepad then
		v_u_5:DisableGamepadCursor()
	end
	v_u_31.Enabled = false
	v_u_22:RemoveDisabler("DiggingMinigame")
	v_u_69()
	v_u_29:SetAttribute("PlayerDigging", nil)
end
local v_u_79 = v_u_9:GetDescendantTransparency(v_u_39)
local v_u_80 = false
local v_u_81 = false
function v_u_27.Start(p_u_82)
	-- upvalues: (copy) v_u_25, (ref) v_u_81, (copy) v_u_64, (ref) v_u_58, (copy) v_u_27, (copy) v_u_74, (copy) v_u_75, (copy) v_u_31, (copy) v_u_39, (ref) v_u_80, (copy) v_u_9, (copy) v_u_53, (copy) v_u_26, (copy) v_u_54, (copy) v_u_17, (copy) v_u_13, (copy) v_u_18, (copy) v_u_11, (copy) v_u_24, (copy) v_u_55, (copy) v_u_32, (copy) v_u_14, (copy) v_u_21, (copy) v_u_52
	if v_u_25.GetCurrentTheme() ~= "DISABLED" then
		v_u_81 = true
		v_u_64()
		v_u_58.EventEnd:Connect(function()
			-- upvalues: (ref) v_u_27
			v_u_27:Close()
		end)
		task.spawn(v_u_74)
		task.spawn(v_u_75)
		v_u_31.DiggingEvent.ShovelAmount.Option3.Purchase.Main.SENSOR.Activated:Connect(function()
			-- upvalues: (copy) p_u_82
			p_u_82:PromptDigProductPurchase()
		end)
		v_u_31.DiggingEvent.EventHeaders.Option3.ExitButton.Activated:Connect(function()
			-- upvalues: (ref) v_u_27
			v_u_27:Close()
		end)
		v_u_39.Reward.ConfirmReward.Main.SENSOR.Activated:Connect(function()
			-- upvalues: (ref) v_u_80, (ref) v_u_9, (ref) v_u_39
			if not v_u_80 then
				v_u_80 = true
				v_u_9:SetDescendantTransparency(v_u_39, 1, 0.5, function()
					-- upvalues: (ref) v_u_39, (ref) v_u_80
					v_u_39.Visible = false
					v_u_80 = false
				end)
			end
		end)
		v_u_53.Activated:Connect(function()
			-- upvalues: (ref) v_u_26
			v_u_26:FireServer()
		end)
		v_u_54.Activated:Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_13
			v_u_17:PromptPurchase(v_u_13.RestartDigging.PurchaseID, Enum.InfoType.Product)
		end)
		if v_u_18 then
			v_u_17:SetPriceLabel(v_u_54.Price, v_u_13.RestartDigging.PurchaseID, ":value:R$")
		else
			v_u_54.Price.Text = "99R$"
		end
		v_u_53.In_Stock.Cost_Text.Text = v_u_11.FormatCompactPrice(v_u_24.RESTART_SHECKLES_COST) .. "\194\162"
		v_u_55.Activated:Connect(function()
			-- upvalues: (ref) v_u_32, (ref) v_u_14, (ref) v_u_21
			if v_u_32.Enabled then
				v_u_14:Close(v_u_32)
			else
				v_u_14:Open(v_u_32)
				v_u_21:Open()
			end
		end)
		v_u_39.Visible = false
		v_u_9:SetDescendantTransparency(v_u_39, 1)
		v_u_52.Visible = false
		if not v_u_58:IsRunning() then
			v_u_58:Start()
		end
	end
end
function v_u_27.DisplayReward(_, p_u_83)
	-- upvalues: (copy) v_u_40, (copy) v_u_20, (copy) v_u_41, (copy) v_u_42, (copy) v_u_16, (copy) v_u_39, (copy) v_u_9, (copy) v_u_79, (ref) v_u_80
	task.spawn(function()
		-- upvalues: (ref) v_u_40, (ref) v_u_20, (copy) p_u_83, (ref) v_u_41, (ref) v_u_42, (ref) v_u_16, (ref) v_u_39, (ref) v_u_9, (ref) v_u_79, (ref) v_u_80
		v_u_40.Text = v_u_20:Format(p_u_83)
		v_u_41.Text = v_u_40.Text
		v_u_42.Image = v_u_16(p_u_83.Value, p_u_83.Type)
		v_u_39.Visible = true
		v_u_9:SetDescendantTransparency(v_u_39, v_u_79, 0.25)
		task.wait(4)
		v_u_80 = true
		v_u_9:SetDescendantTransparency(v_u_39, 1, 0.5, function()
			-- upvalues: (ref) v_u_39, (ref) v_u_80
			v_u_39.Visible = false
			v_u_80 = false
		end)
	end)
end
v_u_12:GetPathSignal("DiggingData/@"):Connect(function()
	-- upvalues: (copy) v_u_64
	v_u_64()
end)
function SwapCycle()
	-- upvalues: (copy) v_u_25, (ref) v_u_58, (copy) v_u_27, (copy) v_u_57, (copy) v_u_29, (copy) v_u_56, (copy) v_u_55
	if v_u_25.PREVIOUS_THEME == v_u_25.NEXT_THEME then
		return
	else
		v_u_58:Stop()
		v_u_58:Destroy()
		if v_u_25.GetCurrentTheme() == "DISABLED" then
			v_u_27:Close()
		else
			v_u_58 = v_u_57.PermanentDigging
			v_u_58.EventEnd:Connect(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_29, (ref) v_u_56, (ref) v_u_27
				if v_u_25.IsPermanentEvent() and v_u_29:GetAttribute("PlayerDigging") ~= nil then
					v_u_56:Close()
					task.wait(3)
					v_u_56:Open()
				else
					v_u_27:Close()
				end
			end)
			v_u_55.Visible = true
			v_u_58:Start()
		end
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_25, (ref) v_u_81, (copy) v_u_27, (copy) v_u_15
	if v_u_25.GetCurrentTheme() ~= "DISABLED" then
		if not v_u_81 then
			task.spawn(v_u_27.Start, v_u_27)
		end
		if v_u_15:IsUpdateDone() then
			SwapCycle()
		end
	end
end)
v_u_15.OnUpdated:Once(function()
	-- upvalues: (ref) v_u_81, (copy) v_u_25, (copy) v_u_27
	if not v_u_81 and v_u_25.GetCurrentTheme() ~= "DISABLED" then
		task.spawn(v_u_27.Start, v_u_27)
	end
	SwapCycle()
end)
return v_u_27