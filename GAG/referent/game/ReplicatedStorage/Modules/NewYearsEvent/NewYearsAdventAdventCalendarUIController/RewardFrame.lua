local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v1.Modules.Trove)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v_u_5 = require(v1.Modules.DataService)
require(v1.Modules.ConfirmationPromptController)
require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
require(v1.Data.NewYearsEvent.AdventCalendarRewardsData)
local v_u_6 = require(v1.Data.SharedCycleHandlerData).NewYearsAdventCalendar
local v_u_7 = v2.LocalPlayer.PlayerGui:WaitForChild("NewYears2025_StreakPetsReward_UI")
local v_u_8 = v1.GameEvents.NewYearsEvent.ClaimAdventCalendarDay
local v_u_9 = v1.GameEvents.NewYearsEvent.RobuxClaimAdventCalendarDay
local v_u_10 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_11 = {}
v_u_11.__index = v_u_11
function v_u_11.new(p_u_12, p13)
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_9
	local v14 = v_u_11
	local v15 = setmetatable({}, v14)
	v15._trove = v_u_4.new()
	v15._index = p_u_12
	v15._frame = v15._trove:Clone(v_u_7.Frame.Main.Content.SmallRewards.UIGridLayout.Template)
	v15._frame.Name = ("RewardFrame_%*"):format(p_u_12)
	local _ = (p_u_12 - 1) % 6 + 1
	v15._state = "Incomplete"
	v15._rewardDetails = v15._frame.Container.Content
	v15._rewardNameFrame = v15._frame.Container.Content.RewardName
	v15._rewardNameLabel = v15._frame.Container.Content.RewardName.RewardName
	v15._itemImageLabel = v15._frame.Container.Content.ITEM_IMAGE
	v15._claimButton = v15._frame.Container.Content.ClaimButton
	v15._overlay = v15._frame.Container.ExpiredOverlay
	v15._claimedOverlay = v15._frame.Container.Content.ClaimedDisplay
	v15._robuxClaimButton = v15._overlay.RecoverButton
	v15._backgroundFrame = v15._frame.Container
	v15._indexLabel = v15._frame.Container.Content.DayCounter.Counter
	v15._originalSize = v15._frame.Container.Content.Size
	v15._originalBackgroundColor = v15._backgroundFrame.BackgroundColor3
	v15._isCurrentDay = false
	v15._trove:Add(v15._claimButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_8, (copy) p_u_12
		require(script.Parent).UpdateAllRewardStates()
		v_u_8:FireServer(p_u_12)
	end))
	v15._trove:Add(v15._robuxClaimButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_5, (ref) v_u_9, (copy) p_u_12
		require(script.Parent).UpdateAllRewardStates()
		if v_u_5:GetData() then
			v_u_9:FireServer(p_u_12)
		end
	end))
	if p13 then
		v15._itemImageLabel.Image = p13.ImageId
		v15._rewardNameLabel.Text = p13.ItemName
	else
		v15._rewardNameLabel.Text = "NO REWARD"
	end
	v15._indexLabel.Text = ("%*"):format(v15._index)
	v15:UpdateState()
	v15:_applyState()
	return v15
end
function v_u_11.UpdateState(p16)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v17 = v_u_5:GetData().NewYearsEvent.Advent.Days[p16._index]
	p16._state = p16._index < v_u_6:GetCurrentCycle() and (v17 and v17.State == "Incomplete") and "Expired" or (not v17 and "Incomplete" or v17.State)
	p16:_applyState()
end
function v_u_11._applyState(p18)
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v19 = p18._index == v_u_6:GetCurrentCycle()
	v_u_5:GetData()
	if p18._state == "Incomplete" then
		p18._claimButton.Visible = false
		p18._robuxClaimButton.Visible = false
		p18._claimedOverlay.Visible = false
		p18._overlay.Visible = false
		p18._claimedOverlay.Visible = false
		if not v19 then
			p18._rewardNameFrame.Visible = true
		end
	elseif p18._state == "Complete" then
		p18._claimButton.Visible = true
		p18._robuxClaimButton.Visible = false
		p18._claimedOverlay.Visible = false
		p18._overlay.Visible = false
		p18._claimedOverlay.Visible = false
		p18._rewardDetails.Visible = true
		p18._rewardNameFrame.Visible = false
		return
	elseif p18._state == "Claimed" then
		p18._claimButton.Visible = false
		p18._robuxClaimButton.Visible = false
		p18._overlay.Visible = false
		p18._rewardNameFrame.Visible = false
		p18._claimedOverlay.Visible = true
		p18._rewardDetails.Visible = true
	elseif p18._state == "Expired" then
		p18._claimButton.Visible = false
		p18._robuxClaimButton.Visible = true
		p18._overlay.Visible = true
		p18._claimedOverlay.Visible = true
		p18._rewardDetails.Visible = true
		p18._rewardNameFrame.Visible = true
	end
end
function v_u_11.SetCurrentDay(p20, p21)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	if p20._isCurrentDay == p21 then
		return
	end
	p20._isCurrentDay = p21
	if p21 and p20._state ~= "Claimed" then
		local v22, v23, v24 = p20._originalBackgroundColor:ToHSV()
		local v25 = Color3.fromHSV
		local v26 = v23 * 0.8
		local v27 = math.min(v26, 1)
		local v28 = v24 * 1.5
		v29 = v25(v22, v27, (math.min(v28, 1)))
		if v29 then
			goto l6
		end
	end
	local v29 = p20._originalBackgroundColor
	::l6::
	local v30 = v_u_3:Create(p20._backgroundFrame, v_u_10, {
		["BackgroundColor3"] = v29
	})
	v_u_3:Create(p20._frame.Container, v_u_10, {
		["Size"] = p21 and p20._state ~= "Claimed" and UDim2.new(0.98, 0, 0.98, 0) or p20._originalSize
	}):Play()
	v30:Play()
end
function v_u_11.GetIndex(p31)
	return p31._index
end
function v_u_11.GetFrame(p32)
	return p32._frame
end
function v_u_11.Destroy(p33)
	p33._trove:Destroy()
end
return v_u_11