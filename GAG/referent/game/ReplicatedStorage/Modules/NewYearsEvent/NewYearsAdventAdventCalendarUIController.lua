local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
game:GetService("TweenService")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
local v_u_4 = require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
local v_u_5 = require(v1.Modules.DataService)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v6 = require(v1.Modules.EventService)
require(v1.Modules.QuestsController)
require(v1.Modules.MarketController)
local v_u_7 = require(script.RewardFrame)
require(v1.Modules.UIComponents.QuestView)
local v_u_8 = require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
local v_u_9 = require(v1.Data.NewYearsEvent.AdventCalendarRewardsData)
local v_u_10 = require(v1.Data.SharedCycleHandlerData).NewYearsAdventCalendar
require(v1.Data.DevProductIds)
local v_u_11 = v2.LocalPlayer.PlayerGui:WaitForChild("NewYears2025_StreakPetsReward_UI")
local v_u_12 = v_u_11.Frame.Main.Header.Resets.Timer
local v_u_13 = v_u_11.Frame.Main.Content.FINALREWARD_FRAME
local _ = v1.GameEvents.NewYearsEvent.ClaimAdventCalendarDay
local v_u_14 = v1.GameEvents.NewYearsEvent.ClaimAdventCalendarFinalReward
local v_u_15 = nil
local v_u_16 = {}
local v_u_17 = nil
local v_u_18 = v6.new("NewYearsAdventAdventCalendarUIController", "New Years Advent Calendar")
local function v_u_24()
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_16, (copy) v_u_11, (copy) v_u_13, (ref) v_u_17, (copy) v_u_14, (copy) v_u_18
	local v19 = 0
	for v20 = 1, v_u_8.DAY_COUNT do
		if v_u_9.Rewards[v20] then
			local v21 = v_u_9.Rewards[v20]
			local v22 = v_u_7.new(v20, v21)
			v_u_16[v20] = v22
			local v23 = v22:GetFrame()
			v23.Parent = v_u_11.Frame.Main.Content.SmallRewards
			v23.LayoutOrder = v19
			v19 = v19 + 100
		end
	end
	v_u_13.RewardName.Text = v_u_9.FinalReward.ItemName
	v_u_13.ITEM_IMAGE.Image = v_u_9.FinalReward.ImageId
	v_u_17 = v_u_13.ClaimButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14:FireServer()
	end)
	v_u_18.UpdateAllRewardStates()
	UpdateCurrentDayHighlight()
end
function v_u_18.UpdateClaimCount(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_8
	local v25 = 0
	for _, v26 in v_u_5:GetData().NewYearsEvent.Advent.Days do
		if v26.State == "Complete" or v26.State == "Claimed" then
			v25 = v25 + 1
		end
	end
	v_u_13.Requirement.Counter.Text = ("Login %*/%* Days"):format(v25, v_u_8.DAY_COUNT)
end
function v_u_18.UpdateAllRewardStates()
	-- upvalues: (copy) v_u_16, (copy) v_u_5, (copy) v_u_13, (copy) v_u_8, (copy) v_u_18
	for _, v27 in v_u_16 do
		v27:UpdateState()
	end
	local v28 = v_u_5:GetData()
	local v29 = 0
	if v28.NewYearsEvent.Advent.FinalRewardClaimed then
		v_u_13.ClaimedDisplay.Visible = true
		v_u_13.ClaimButton.Visible = false
		v_u_13.Requirement.Visible = false
	else
		v_u_13.ClaimedDisplay.Visible = false
		for _, v30 in v28.NewYearsEvent.Advent.Days do
			if v30.State == "Complete" or v30.State == "Claimed" then
				v29 = v29 + 1
			end
		end
		if v_u_8.DAY_COUNT <= v29 then
			if v28.NewYearsEvent.Advent.FinalRewardClaimed then
				v_u_13.ClaimButton.Visible = false
				v_u_13.Requirement.Visible = false
			else
				v_u_13.ClaimButton.Visible = true
				v_u_13.Requirement.Visible = false
			end
		else
			v_u_13.ClaimButton.Visible = false
			v_u_13.Requirement.Visible = true
		end
	end
	v_u_18:UpdateClaimCount()
end
function UpdateCurrentDayHighlight()
	-- upvalues: (copy) v_u_10, (copy) v_u_16
	local v31 = v_u_10:GetCurrentCycle()
	for v32, v33 in v_u_16 do
		v33:SetCurrentDay(v32 == v31)
	end
end
function v_u_18.OnStarted(p34)
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_18, (copy) v_u_24, (copy) v_u_5, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4
	if not v_u_10:IsRunning() then
		v_u_10:Start(v_u_8.START_TIMESTAMP)
	end
	p34:Bind(v_u_10.IntervalChanged:Connect(function(_, _)
		-- upvalues: (ref) v_u_18, (ref) v_u_10, (ref) v_u_8
		UpdateCurrentDayHighlight()
		v_u_18.UpdateAllRewardStates()
		local _ = v_u_10:GetCurrentCycle() >= v_u_8.DAY_COUNT
	end))
	v_u_24()
	p34:Bind(v_u_5:GetPathSignal("NewYearsEvent/Advent/Days/@"):Connect(function()
		-- upvalues: (ref) v_u_18
		v_u_18.UpdateAllRewardStates()
	end))
	p34:Bind(v_u_5:GetPathSignal("NewYearsEvent/Advent/FinalRewardClaimed"):Connect(function()
		-- upvalues: (ref) v_u_13
		v_u_13.ClaimButton.Visible = false
		v_u_13.ClaimedDisplay.Visible = true
	end))
	v_u_18.UpdateAllRewardStates()
	print(v_u_5:GetData().NewYearsEvent)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_8, (ref) v_u_12, (ref) v_u_4
		while task.wait(1) do
			local v35 = v_u_10:GetCurrentCycle()
			if v35 == v_u_8.DAY_COUNT then
				v_u_12.Text = "Happy new years!"
			else
				if v_u_8.DAY_COUNT < v35 then
					v_u_12.Visible = false
					return
				end
				local v36 = v_u_10:GetTimeUntilNext()
				v_u_12.Text = ("New Day in %*"):format((v_u_4.toHMS(v36 or 0)))
			end
		end
	end)
end
function v_u_18.OnEnded(_)
	-- upvalues: (ref) v_u_15
	v_u_15 = nil
end
function v_u_18.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_11
	v_u_3:Open(v_u_11)
end
function v_u_18.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_11
	v_u_3:Close(v_u_11)
end
v_u_3:UsePopupAnims(v_u_11)
return v_u_18