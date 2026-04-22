local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("Players")
game:GetService("RunService")
local v_u_3 = require(v1.Modules.SeasonPass.SeasonPassRewardsController)
local v_u_4 = require(v1.Modules.SeasonPass.SeasonPassQuestsController)
local v_u_5 = require(v1.Modules.SeasonPass.SeasonPassShopController)
local v_u_6 = require(v1.Modules.NumberUtil)
local v_u_7 = require(v1.Modules.SeasonPass.SeasonPassToggler)
local v_u_8 = require(v1.Data.DevProductIds)
local v_u_9 = require(v1.Modules.MarketController)
local v_u_10 = require(v1.Modules.DataService)
local v_u_11 = require(v1.Modules.SeasonPass.SeasonPassButtonEffects)
local v_u_12 = require(v1.Modules.GiftController)
local v_u_13 = require(v1.Data.SeasonPass.SeasonPassData)
local v_u_14 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_15 = require(v1.Modules.UpdateService)
local v_u_16 = require(v1.Modules.GuiController)
local v_u_17 = require(v1.Modules.SeasonPass.SeasonPassUtils)
local v_u_18 = require(v1.Modules.Notification)
local v19 = v1.GameEvents.SeasonPass.UpdateSeasonPass
local v20 = {}
local v_u_21 = v_u_2.LocalPlayer.PlayerGui.SeasonPassUI
local v_u_22 = v_u_21.SeasonPassFrame.Main
local v_u_23 = v_u_21.SeasonPassFrame.TopBtns
local v_u_24 = v_u_21.SeasonPassFrame.Close
local v_u_25 = v_u_21.SeasonPassFrame.PremiumSection
local v_u_26 = v_u_21.SeasonPassTemplates
local v_u_27 = v_u_26.IncludesTextTemplate
local v_u_28 = v_u_13.CurrentSeason
local v_u_29 = nil
local v_u_30 = v_u_2.LocalPlayer.PlayerGui.Hud_UI.SideBtns.Pass
local v_u_31 = -1
local function v_u_39()
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_14, (copy) v_u_25
	local v32 = v_u_10:GetData()
	if v32 then
		local v33 = v32.SeasonPass[v_u_13.CurrentSeason].IsPremium
		local v34 = v_u_14.ButtonColors.Gray.Background
		local v35 = v_u_14.ButtonColors.White.Background
		local v36 = v_u_25.Buy
		local v37 = v_u_25.Buy.TextLabel
		local v38
		if v33 then
			v38 = v34
		else
			v38 = v35
		end
		v37.TextColor3 = v38
		if v33 then
			v35 = v34
		end
		v36.ImageColor3 = v35
		v36.Interactable = not v33
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_61()
	-- upvalues: (copy) v_u_13, (copy) v_u_25, (copy) v_u_26, (copy) v_u_14, (copy) v_u_27, (copy) v_u_21, (copy) v_u_10, (copy) v_u_2
	local v40 = v_u_13.PreviousSeason and v_u_25:FindFirstChild((("%*ImageBackground"):format((v_u_13.PreviousSeason:gsub(" ", "")))))
	if v40 then
		v40.Visible = false
		v40.Parent = v_u_26.ImageBackgrounds
	end
	local v41 = v_u_13.CurrentSeason:gsub(" ", "")
	local v42 = v_u_26.ImageBackgrounds:FindFirstChild((("%*ImageBackground"):format(v41)))
	if v42 then
		v42.Parent = v_u_25
		v42.Visible = true
	elseif not v_u_25:FindFirstChild((("%*ImageBackground"):format(v41))) then
		warn((("No image background found for %*: %*"):format(v41, v42)))
	end
	local v43 = v_u_25.Includes
	for _, v44 in v43:GetChildren() do
		if v44:IsA("TextLabel") and v44.Name ~= "Top" then
			v44:Destroy()
		end
	end
	local v45 = v_u_14.ButtonColors.Gold.Text
	local v46 = v_u_14.ButtonColors.White.Text
	local v47 = v_u_13.IncludesItems
	for v48, v49 in v47 do
		local v50 = v_u_27:Clone()
		v50.Text = v49
		v50.LayoutOrder = v48
		local v51
		if v48 <= 2 then
			v51 = v45
		else
			v51 = v46
		end
		v50.TextColor3 = v51
		local v52
		if v48 <= 2 then
			v52 = 0
		else
			local v53 = 0 - v48 / #v47
			v52 = math.abs(v53) - 0.5
		end
		v50.TextTransparency = v52
		v50.UIStroke.Transparency = v50.TextTransparency
		v50.Visible = true
		v50.Parent = v43
	end
	v_u_21.SeasonPassFrame.Title.Text = v_u_13.CurrentSeason
	local v54 = v_u_10:GetData()
	if v54 then
		task.wait(2)
		local v55 = v_u_25.Buy.TextLabel
		local v56 = v_u_25.Buy
		local v57 = v_u_14.ButtonColors.Gray.Background
		local v58 = v_u_14.ButtonColors.White.Background
		local v59 = v54.SeasonPass[v_u_13.CurrentSeason].IsPremium
		local v60
		if v59 then
			v60 = v57
		else
			v60 = v58
		end
		v55.TextColor3 = v60
		if v59 then
			v58 = v57
		end
		v56.ImageColor3 = v58
		v56.Interactable = not v59
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_73()
	-- upvalues: (copy) v_u_22, (copy) v_u_23, (copy) v_u_11, (copy) v_u_14, (copy) v_u_24, (copy) v_u_7
	local v_u_62 = {
		["Rewards"] = v_u_22.Rewards,
		["Quests"] = v_u_22.Quests,
		["Store"] = v_u_22.Store
	}
	for _, v63 in v_u_23:GetChildren() do
		if v63:IsA("ImageButton") then
			local v_u_64 = v63.Name
			v_u_62[v_u_64].Visible = false
			v63.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (copy) v_u_62, (copy) v_u_64, (ref) v_u_14, (ref) v_u_23
				v_u_11.Click()
				for v65, v66 in v_u_62 do
					v66.Visible = v65 == v_u_64
					local v67 = v_u_14.ButtonColors.Yellow.Background
					local v68 = v_u_14.ButtonColors.Yellow.ButtonStroke
					local v69 = v_u_14.ButtonColors.Green.TextStroke
					local v70 = v_u_14.ButtonColors.Green.ButtonStroke
					local v71 = v_u_23:FindFirstChild(v65)
					if not v66.Visible then
						v67 = v69
					end
					v71.BackgroundColor3 = v67
					local v72 = v71.UIStroke
					if v66.Visible then
						v70 = v68
					end
					v72.Color = v70
				end
			end)
			v63.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
		end
	end
	v_u_62.Rewards.Visible = true
	v_u_24.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_7
		v_u_11.Click()
		v_u_7:Toggle()
	end)
end
local function v_u_82()
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_25, (copy) v_u_14, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_12, (copy) v_u_61
	local v74 = v_u_10:GetData()
	if v74 then
		if v74.SeasonPass[v_u_13.CurrentSeason] then
			local v75 = v74.SeasonPass[v_u_13.CurrentSeason].IsPremium
			local v76 = v_u_25.Buy.TextLabel
			local v77 = v_u_25.Buy
			local v78 = v_u_14.ButtonColors.Gray.Background
			local v79 = v_u_14.ButtonColors.White.Background
			v_u_9:SetPriceLabel(v76, v_u_8.BuySeasonPassPremium.PurchaseID, ":robux::value:")
			v77.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_8, (ref) v_u_9
				v_u_11.Click()
				v_u_9:PromptPurchase(v_u_8.BuySeasonPassPremium.PurchaseID, Enum.InfoType.Product)
			end)
			v77.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			local v80
			if v75 then
				v80 = v78
			else
				v80 = v79
			end
			v76.TextColor3 = v80
			if v75 then
				v79 = v78
			end
			v77.ImageColor3 = v79
			v77.Interactable = not v75
			local v81 = v_u_25.Gift
			v81.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_8, (ref) v_u_12
				v_u_11.Click()
				v_u_12:PromptGiftFromGiftId(v_u_8.GiftSeasonPass.PurchaseID)
			end)
			v81.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			v_u_61()
		else
			warn((("SeasonPassUIController | Missing season pass data: %*"):format(v_u_13.CurrentSeason)))
		end
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
		return
	end
end
local function v_u_86()
	-- upvalues: (copy) v_u_21, (copy) v_u_17, (copy) v_u_6
	local v_u_83 = v_u_21.SeasonPassFrame.Timer
	task.spawn(function()
		-- upvalues: (ref) v_u_17, (copy) v_u_83, (ref) v_u_6
		while true do
			local v84 = workspace:GetServerTimeNow()
			local v85 = v_u_17.GetResetTime(v84)
			v_u_83.Text = ("(Season ends in <font color=\"rgb(255, 78, 78)\">%*</font>)"):format((v_u_6.compactFormat(v85 - v84)))
			task.wait(1)
		end
	end)
end
local function v_u_89()
	-- upvalues: (copy) v_u_10, (ref) v_u_31, (copy) v_u_13, (ref) v_u_28, (copy) v_u_3, (copy) v_u_5, (ref) v_u_29, (copy) v_u_39, (copy) v_u_73, (copy) v_u_82, (copy) v_u_86, (copy) v_u_4
	local v87 = v_u_10:GetData()
	if v87 then
		v_u_31 = v_u_13.CurrentSeasonNum
		if v87.SeasonPass[v_u_13.CurrentSeason] then
			v_u_13.SwitchToNewSeason(v_u_31)
			v_u_28 = v_u_13.CurrentSeason
			v_u_3.UpdateRewardsTrack()
			v_u_5.UpdateShopFrames()
			if v_u_29 then
				v_u_29:Disconnect()
				local v88 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
				if v88 then
					v_u_29 = v88:Connect(v_u_39)
				end
			end
		end
		task.wait(1)
		task.spawn(v_u_73)
		task.spawn(v_u_82)
		task.spawn(v_u_86)
		task.spawn(v_u_3.Start)
		task.spawn(v_u_4.Start, v_u_4)
		task.spawn(v_u_5.Start, v_u_5)
	else
		warn("SeasonPassUIController | No player data")
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_89
	v_u_89()
end)
local v90 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
if v90 then
	v_u_29 = v90:Connect(v_u_39)
end
local v_u_91 = false
v19.OnClientEvent:Connect(function(p92)
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (ref) v_u_31, (copy) v_u_16, (copy) v_u_21, (ref) v_u_28, (copy) v_u_61, (copy) v_u_3, (copy) v_u_5, (ref) v_u_29, (copy) v_u_39, (copy) v_u_15, (copy) v_u_30, (ref) v_u_91, (copy) v_u_18
	if v_u_10:GetData() then
		if v_u_13.CurrentSeason ~= ("Season %*"):format(p92) then
			v_u_31 = p92
			v_u_16:Close(v_u_21)
			v_u_13.SwitchToNewSeason(p92)
			v_u_28 = v_u_13.CurrentSeason
			v_u_61()
			v_u_3.UpdateRewardsTrack()
			v_u_5.UpdateShopFrames()
			if v_u_29 then
				v_u_29:Disconnect()
				local v93 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
				if v93 then
					v_u_29 = v93:Connect(v_u_39)
				end
			end
			v_u_30.Visible = not v_u_15:IsHiddenFromUpdate("SeasonPassButton")
			if v_u_30.Visible then
				if v_u_91 then
					return
				end
				v_u_91 = true
				v_u_18:CreateNotification("<font color=\"rgb(245, 185, 32)\">New Season Pass Available\226\157\151</font>")
				v_u_30.Notify.Visible = true
			end
		end
	else
		warn("SeasonPassUIController | No player data")
		return
	end
end)
v_u_30.Visible = not v_u_15:IsHiddenFromUpdate("SeasonPassButton")
v_u_15.OnUpdated:Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_30
	v_u_30.Visible = not v_u_15:IsHiddenFromUpdate("SeasonPassButton")
end)
return v20