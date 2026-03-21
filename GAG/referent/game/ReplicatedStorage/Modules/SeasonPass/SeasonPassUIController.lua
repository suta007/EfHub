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
require(v1.Modules.UpdateService)
local v_u_15 = require(v1.Modules.GuiController)
local v_u_16 = require(v1.Modules.SeasonPass.SeasonPassUtils)
local v_u_17 = require(v1.Modules.Notification)
local v18 = v1.GameEvents.SeasonPass.UpdateSeasonPass
local v19 = {}
local v_u_20 = v_u_2.LocalPlayer.PlayerGui.SeasonPassUI
local v_u_21 = v_u_20.SeasonPassFrame.Main
local v_u_22 = v_u_20.SeasonPassFrame.TopBtns
local v_u_23 = v_u_20.SeasonPassFrame.Close
local v_u_24 = v_u_20.SeasonPassFrame.PremiumSection
local v_u_25 = v_u_20.SeasonPassTemplates
local v_u_26 = v_u_25.IncludesTextTemplate
local v_u_27 = v_u_13.CurrentSeason
local v_u_28 = nil
local v_u_29 = -1
local function v_u_37()
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_14, (copy) v_u_24
	local v30 = v_u_10:GetData()
	if v30 then
		local v31 = v30.SeasonPass[v_u_13.CurrentSeason].IsPremium
		local v32 = v_u_14.ButtonColors.Gray.Background
		local v33 = v_u_14.ButtonColors.White.Background
		local v34 = v_u_24.Buy
		local v35 = v_u_24.Buy.TextLabel
		local v36
		if v31 then
			v36 = v32
		else
			v36 = v33
		end
		v35.TextColor3 = v36
		if v31 then
			v33 = v32
		end
		v34.ImageColor3 = v33
		v34.Interactable = not v31
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_59()
	-- upvalues: (copy) v_u_13, (copy) v_u_24, (copy) v_u_25, (copy) v_u_14, (copy) v_u_26, (copy) v_u_20, (copy) v_u_10, (copy) v_u_2
	local v38 = v_u_13.PreviousSeason and v_u_24:FindFirstChild((("%*ImageBackground"):format((v_u_13.PreviousSeason:gsub(" ", "")))))
	if v38 then
		v38.Visible = false
		v38.Parent = v_u_25.ImageBackgrounds
	end
	local v39 = v_u_13.CurrentSeason:gsub(" ", "")
	local v40 = v_u_25.ImageBackgrounds:FindFirstChild((("%*ImageBackground"):format(v39)))
	if v40 then
		v40.Parent = v_u_24
		v40.Visible = true
	elseif not v_u_24:FindFirstChild((("%*ImageBackground"):format(v39))) then
		warn((("No image background found for %*: %*"):format(v39, v40)))
	end
	local v41 = v_u_24.Includes
	for _, v42 in v41:GetChildren() do
		if v42:IsA("TextLabel") and v42.Name ~= "Top" then
			v42:Destroy()
		end
	end
	local v43 = v_u_14.ButtonColors.Gold.Text
	local v44 = v_u_14.ButtonColors.White.Text
	local v45 = v_u_13.IncludesItems
	for v46, v47 in v45 do
		local v48 = v_u_26:Clone()
		v48.Text = v47
		v48.LayoutOrder = v46
		local v49
		if v46 <= 2 then
			v49 = v43
		else
			v49 = v44
		end
		v48.TextColor3 = v49
		local v50
		if v46 <= 2 then
			v50 = 0
		else
			local v51 = 0 - v46 / #v45
			v50 = math.abs(v51) - 0.5
		end
		v48.TextTransparency = v50
		v48.UIStroke.Transparency = v48.TextTransparency
		v48.Visible = true
		v48.Parent = v41
	end
	v_u_20.SeasonPassFrame.Title.Text = v_u_13.CurrentSeason
	local v52 = v_u_10:GetData()
	if v52 then
		task.wait(2)
		local v53 = v_u_24.Buy.TextLabel
		local v54 = v_u_24.Buy
		local v55 = v_u_14.ButtonColors.Gray.Background
		local v56 = v_u_14.ButtonColors.White.Background
		local v57 = v52.SeasonPass[v_u_13.CurrentSeason].IsPremium
		local v58
		if v57 then
			v58 = v55
		else
			v58 = v56
		end
		v53.TextColor3 = v58
		if v57 then
			v56 = v55
		end
		v54.ImageColor3 = v56
		v54.Interactable = not v57
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_71()
	-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_11, (copy) v_u_14, (copy) v_u_23, (copy) v_u_7
	local v_u_60 = {
		["Rewards"] = v_u_21.Rewards,
		["Quests"] = v_u_21.Quests,
		["Store"] = v_u_21.Store
	}
	for _, v61 in v_u_22:GetChildren() do
		if v61:IsA("ImageButton") then
			local v_u_62 = v61.Name
			v_u_60[v_u_62].Visible = false
			v61.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (copy) v_u_60, (copy) v_u_62, (ref) v_u_14, (ref) v_u_22
				v_u_11.Click()
				for v63, v64 in v_u_60 do
					v64.Visible = v63 == v_u_62
					local v65 = v_u_14.ButtonColors.Yellow.Background
					local v66 = v_u_14.ButtonColors.Yellow.ButtonStroke
					local v67 = v_u_14.ButtonColors.Green.TextStroke
					local v68 = v_u_14.ButtonColors.Green.ButtonStroke
					local v69 = v_u_22:FindFirstChild(v63)
					if not v64.Visible then
						v65 = v67
					end
					v69.BackgroundColor3 = v65
					local v70 = v69.UIStroke
					if v64.Visible then
						v68 = v66
					end
					v70.Color = v68
				end
			end)
			v61.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
		end
	end
	v_u_60.Rewards.Visible = true
	v_u_23.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_7
		v_u_11.Click()
		v_u_7:Toggle()
	end)
end
local function v_u_80()
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_24, (copy) v_u_14, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_12, (copy) v_u_59
	local v72 = v_u_10:GetData()
	if v72 then
		if v72.SeasonPass[v_u_13.CurrentSeason] then
			local v73 = v72.SeasonPass[v_u_13.CurrentSeason].IsPremium
			local v74 = v_u_24.Buy.TextLabel
			local v75 = v_u_24.Buy
			local v76 = v_u_14.ButtonColors.Gray.Background
			local v77 = v_u_14.ButtonColors.White.Background
			v_u_9:SetPriceLabel(v74, v_u_8.BuySeasonPassPremium.PurchaseID, ":robux::value:")
			v75.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_8, (ref) v_u_9
				v_u_11.Click()
				v_u_9:PromptPurchase(v_u_8.BuySeasonPassPremium.PurchaseID, Enum.InfoType.Product)
			end)
			v75.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			local v78
			if v73 then
				v78 = v76
			else
				v78 = v77
			end
			v74.TextColor3 = v78
			if v73 then
				v77 = v76
			end
			v75.ImageColor3 = v77
			v75.Interactable = not v73
			local v79 = v_u_24.Gift
			v79.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_8, (ref) v_u_12
				v_u_11.Click()
				v_u_12:PromptGiftFromGiftId(v_u_8.GiftSeasonPass.PurchaseID)
			end)
			v79.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			v_u_59()
		else
			warn((("SeasonPassUIController | Missing season pass data: %*"):format(v_u_13.CurrentSeason)))
		end
	else
		warn((("No player data %*"):format(v_u_2.LocalPlayer)))
		return
	end
end
local function v_u_84()
	-- upvalues: (copy) v_u_20, (copy) v_u_16, (copy) v_u_6
	local v_u_81 = v_u_20.SeasonPassFrame.Timer
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (copy) v_u_81, (ref) v_u_6
		while true do
			local v82 = workspace:GetServerTimeNow()
			local v83 = v_u_16.GetResetTime(v82)
			v_u_81.Text = ("(Season ends in <font color=\"rgb(255, 78, 78)\">%*</font>)"):format((v_u_6.compactFormat(v83 - v82)))
			task.wait(1)
		end
	end)
end
local function v_u_87()
	-- upvalues: (copy) v_u_10, (ref) v_u_29, (copy) v_u_13, (ref) v_u_27, (copy) v_u_3, (copy) v_u_5, (ref) v_u_28, (copy) v_u_37, (copy) v_u_71, (copy) v_u_80, (copy) v_u_84, (copy) v_u_4
	local v85 = v_u_10:GetData()
	if v85 then
		v_u_29 = v_u_13.CurrentSeasonNum
		if v85.SeasonPass[v_u_13.CurrentSeason] then
			v_u_13.SwitchToNewSeason(v_u_29)
			v_u_27 = v_u_13.CurrentSeason
			v_u_3.UpdateRewardsTrack()
			v_u_5.UpdateShopFrames()
			if v_u_28 then
				v_u_28:Disconnect()
				local v86 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
				if v86 then
					v_u_28 = v86:Connect(v_u_37)
				end
			end
		end
		task.wait(1)
		task.spawn(v_u_71)
		task.spawn(v_u_80)
		task.spawn(v_u_84)
		task.spawn(v_u_3.Start)
		task.spawn(v_u_4.Start, v_u_4)
		task.spawn(v_u_5.Start, v_u_5)
	else
		warn("SeasonPassUIController | No player data")
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_87
	v_u_87()
end)
local v88 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
if v88 then
	v_u_28 = v88:Connect(v_u_37)
end
v18.OnClientEvent:Connect(function(p89)
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (ref) v_u_29, (copy) v_u_15, (copy) v_u_20, (ref) v_u_27, (copy) v_u_59, (copy) v_u_3, (copy) v_u_5, (ref) v_u_28, (copy) v_u_37, (copy) v_u_17, (copy) v_u_2
	if v_u_10:GetData() then
		if v_u_13.CurrentSeason ~= ("Season %*"):format(p89) then
			v_u_29 = p89
			v_u_15:Close(v_u_20)
			v_u_13.SwitchToNewSeason(p89)
			v_u_27 = v_u_13.CurrentSeason
			v_u_59()
			v_u_3.UpdateRewardsTrack()
			v_u_5.UpdateShopFrames()
			if v_u_28 then
				v_u_28:Disconnect()
				local v90 = v_u_10:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_13.CurrentSeason)))
				if v90 then
					v_u_28 = v90:Connect(v_u_37)
				end
			end
			v_u_17:CreateNotification("<font color=\"rgb(245, 185, 32)\">New Season Pass Available\226\157\151</font>")
			v_u_2.LocalPlayer.PlayerGui.Hud_UI.SideBtns.Pass.Notify.Visible = true
		end
	else
		warn("SeasonPassUIController | No player data")
		return
	end
end)
return v19