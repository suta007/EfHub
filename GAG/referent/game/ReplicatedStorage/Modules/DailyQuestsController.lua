local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v_u_1.Modules.Trove)
local v_u_3 = require(v_u_1.Modules.NumberUtil)
local v_u_4 = require(v_u_1.Modules.DataService)
require(v_u_1.Modules.ItemImageFinder)
require(v_u_1.Modules.GuiController)
local v_u_5 = require(v_u_1.Modules.QuestsController)
local v_u_6 = require(v_u_1.Modules.GardenGuideModules.ImageCycle)
local v_u_7 = require(v_u_1.Modules.MarketController)
local v_u_8 = require(v_u_1.Data.DevProductIds)
require(v_u_1.Data.QuestData.Types)
require(v_u_1.Data.QuestData.Types)
require(v_u_1.Modules.GiveServiceCommon)
local v_u_9 = require(v_u_1.Modules.GardenGuideModules.GGButtonEffects)
local v_u_10 = v2.LocalPlayer
local v11 = v_u_10.PlayerGui:WaitForChild("GardenGuide")
local v_u_12 = v11.MainMenu.MainMenuFrame.DailyQuestView
local v_u_13 = v_u_12.Main
local v_u_14 = v_u_13.Quests.Main
local v_u_15 = v_u_13.Progress
local v_u_16 = v11.MainMenu.TopBar
require(v_u_1.Modules.IsDev)
local v_u_17 = v_u_16.SkipQuests
local v18 = v_u_1.Modules.GardenGuideModules.Templates.DailyQuestTemplates
local v_u_19 = v18.RewardFrame
local v_u_20 = v18.Line
local v_u_21 = v18.DailyQuestTemplate
local v_u_22 = {}
local v23 = {}
local function v_u_27()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v24 = v_u_4:GetData()
	if v24 then
		local _ = v24.DailyQuests.DaysCompleted
		local v25 = v_u_5:GetContainerFromId(v24.DailyQuests.ContainerId)
		if v25 == nil then
			return true
		end
		if #v25.Quests <= 0 then
			return true
		end
		for _, v26 in v25.Quests do
			if v26.Completed == false then
				return false
			end
		end
		return true
	end
end
local function v_u_28()
	-- upvalues: (copy) v_u_9, (copy) v_u_27, (copy) v_u_7, (copy) v_u_8
	v_u_9.Click()
	if v_u_27() then
		warn("Trying to skip dailies when they are already complete. Aborting")
	else
		v_u_7:PromptPurchase(v_u_8.SkipDailyQuest.PurchaseID, Enum.InfoType.Product)
	end
end
local v_u_29 = false
function v23.Start(_)
	-- upvalues: (copy) v_u_17, (copy) v_u_27, (copy) v_u_12, (copy) v_u_28, (copy) v_u_6, (copy) v_u_22, (copy) v_u_1, (copy) v_u_4, (copy) v_u_5, (copy) v_u_21, (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_20, (copy) v_u_19, (copy) v_u_13, (ref) v_u_29, (copy) v_u_16, (copy) v_u_3
	local v_u_30 = {}
	local v_u_31 = {}
	v_u_17.SENSOR.Activated:Connect(v_u_28)
	local function v_u_43(p32, p33, p_u_34)
		-- upvalues: (ref) v_u_6, (ref) v_u_22, (ref) v_u_1
		local v35 = p32.REWARD_IMAGE
		p32.Visible = false
		local v36 = {}
		for _, v37 in p33 do
			if v37.Type then
				if v35 then
					local v38 = {
						["Quantity"] = v37.Data.Amount or 1,
						["Type"] = v37.Type,
						["Value"] = v37.Data.Type or "Normal"
					}
					table.insert(v36, v38)
				end
			else
				warn("No reward type")
			end
		end
		local v39 = p32.ITEM_NAME.REWARD_NAME
		local v40 = p32.ITEM_NAME.REWARD_NAME_SHADOW
		v_u_6.CycleRewardImages(v35, v39, v40, p32, v36)
		p32.Visible = true
		p32:FindFirstChild("ClaimedOverlay")
		local v41 = p32.SENSOR
		if not v_u_22[("Day%*Reward"):format(p_u_34)] then
			local v_u_42 = v41.Activated:Connect(function()
				-- upvalues: (ref) v_u_1, (copy) p_u_34
				v_u_1.GameEvents.DailyQuests.Claim:FireServer(p_u_34)
			end)
			v_u_22[("Day%*Reward"):format(p_u_34)] = v_u_42
			v41.Destroying:Once(function()
				-- upvalues: (ref) v_u_42
				if v_u_42 then
					v_u_42:Disconnect()
					v_u_42 = nil
				end
			end)
		end
	end
	local function v90()
		-- upvalues: (ref) v_u_4, (copy) v_u_30, (ref) v_u_5, (ref) v_u_21, (ref) v_u_14, (ref) v_u_10, (ref) v_u_15, (ref) v_u_20, (copy) v_u_31, (ref) v_u_19, (copy) v_u_43, (ref) v_u_13, (ref) v_u_17, (ref) v_u_27, (ref) v_u_12, (ref) v_u_29
		local v44 = v_u_4:GetData()
		if not v44 then
			return
		end
		if not (v44.DailyQuests and v44.DailyQuests.ContainerId) then
			for v45 in v_u_30 do
				local v46 = v_u_30[v45]
				if v46 then
					v46:Destroy()
					v_u_30[v45] = nil
				end
			end
			table.clear(v_u_30)
			return
		end
		local v47 = v_u_5:GetContainerFromId(v44.DailyQuests.ContainerId)
		if not v47 then
			return
		end
		local v48 = true
		for v49, v50 in v47.Quests do
			if not v50.Completed then
				v48 = false
			end
			local v51 = v_u_5:GetQuest(v50.Type)
			if v51 then
				local v52 = v_u_30[v50.Id]
				if not v52 then
					v52 = v_u_21:Clone()
					v52.Visible = true
					v52.LayoutOrder = v49 + 1
					v52.Parent = v_u_14
					v_u_30[v50.Id] = v52
				end
				local v53 = v51:Display(v50.Progress, v50.Target, v50.Arguments)
				v52.Main.QUEST_NAME.Text = v53.Title
				v52.Main.QUEST_NAME_SHADOW.Text = v53.Title
				if v53.Description then
					v52.Main.QUEST_OBJECTIVE.Text = v53.Description
					v52.Main.QUEST_OBJECTIVE_SHADOW.Text = v53.Description
				end
				local v54 = v52.Main.Progress.Bar_Actual
				local v55 = UDim2.fromScale
				local v56 = v50.Progress / v50.Target
				v54.Size = v55(math.clamp(v56, 0, 1), 1)
				v52.Main.Progress.VALUE.Text = v50.Progress >= v50.Target and "Completed!" or v53.Bar
				v52.Main.Progress.VALUE_SHADOW.Text = v50.Progress >= v50.Target and "Completed!" or v53.Bar
			end
		end
		for v57 in v_u_30 do
			local v58 = false
			for _, v59 in v47.Quests do
				if v59.Id == v57 then
					v58 = true
					break
				end
			end
			if not v58 then
				local v60 = v_u_30[v57]
				if v60 then
					v60:Destroy()
					v_u_30[v57] = nil
				end
			end
		end
		if v44.DailyQuests then
			local v_u_61 = v44.DailyQuests.DailyRewards
			local v62 = #v_u_61 - 1
			local v63 = v_u_15.Rewards
			local v64 = v_u_15.ProgressBar.IncrementLines
			local v65 = v64.AbsoluteSize.X * 0.85
			local v66 = v_u_20.AbsoluteSize.X
			local v67 = v66 * v62 - v65
			local v68 = math.abs(v67) / #v_u_61
			if #v64:GetChildren() <= v62 then
				local v69 = 0
				for v70 = 1, v62 do
					if not v_u_31[("RewardFrameDay%*"):format(v70)] then
						local v71 = v_u_20:Clone()
						v71.Visible = true
						v69 = v69 + v68 + v66 * 0.5
						local v72 = v69 / v64.AbsoluteSize.X
						v71.Position = UDim2.fromScale(v72, 0)
						v71.Parent = v64
						local v73 = v_u_19:Clone()
						v73.Visible = true
						v73.Position = UDim2.fromScale(v72, v73.Position.Y.Scale)
						v73.Name = ("RewardFrameDay%*"):format(v70)
						v73.Parent = v63
						v_u_31[v73.Name] = v73
						v_u_43(v73, v_u_61[v70].Rewards, v70)
					end
				end
				if not v_u_31.BigRewardFrame then
					local v74 = v62 + 1
					local v75 = v_u_61[v74].Rewards
					local v76 = v63:FindFirstChild("BigRewardFrame")
					v_u_31.BigRewardFrame = v76
					v_u_43(v76, v75, v74)
				end
			end
			local v_u_77 = v44.DailyQuests.DaysCompleted
			local v78 = v_u_77 / #v_u_61
			v_u_13.Progress.ProgressBar.Bar_Actual.Size = UDim2.fromScale(math.clamp(v78, 0, 1), 1)
			for v_u_79 = 1, #v_u_61 do
				local v80
				if v_u_79 == 7 then
					v80 = v63:FindFirstChild("BigRewardFrame")
				else
					v80 = v63:FindFirstChild((("RewardFrameDay%*"):format(v_u_79)))
				end
				local v_u_81 = v80.SENSOR
				local v_u_82 = v80:FindFirstChild("ClaimedOverlay")
				local v_u_83 = v80:FindFirstChild("HiddenOverlay")
				task.spawn(function()
					-- upvalues: (copy) v_u_83, (copy) v_u_79, (copy) v_u_77, (copy) v_u_81, (copy) v_u_61, (copy) v_u_82
					task.wait()
					v_u_83.Visible = v_u_77 < v_u_79
					local v84 = v_u_81
					local v85
					if v_u_79 <= v_u_77 then
						v85 = not v_u_61[v_u_79].Claimed
					else
						v85 = false
					end
					v84.Visible = v85
					local v86 = v_u_82
					local v87
					if v_u_79 <= v_u_77 then
						v87 = v_u_61[v_u_79].Claimed
					else
						v87 = false
					end
					v86.Visible = v87
				end)
			end
			local v88 = v_u_17
			local v89 = not v_u_27()
			if v89 then
				v89 = v_u_12.Visible
			end
			v88.Visible = v89
			if v44.DailyQuests.DailyRewards[v_u_77] then
				if v48 and not (v44.DailyQuests.DailyRewards[v_u_77].Claimed or (v_u_29 or v_u_10:GetAttribute("FirstTimePlayer"))) then
					v_u_29 = true
					require(game.ReplicatedStorage.Modules.Notification):CreateNotification("Daily Quests complete! You can now claim your prize!")
				elseif not v48 then
					v_u_29 = false
				end
			else
				return
			end
		else
			warn((("No dailyquest data for player %*"):format(v_u_10)))
			return
		end
	end
	v_u_12:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_12, (ref) v_u_17, (ref) v_u_27
		v_u_16.DailyQuestTimer.Visible = v_u_12.Visible
		local v91 = v_u_17
		local v92 = not v_u_27()
		if v92 then
			v92 = v_u_12.Visible
		end
		v91.Visible = v92
	end)
	task.spawn(v90)
	local v93 = v_u_4:GetPathSignal("DailyQuests/@")
	assert(v93, "Failed to listen for Daily Quests"):Connect(v90)
	local v94 = v_u_4:GetPathSignal("QuestContainers/@")
	assert(v94, "Failed to listen for Quest Containers"):Connect(v90)
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_3
		while true do
			local v95 = workspace:GetServerTimeNow()
			local v96 = ((v95 + 14400) // 86400 + 1) * 86400 - 14400
			v_u_16.DailyQuestTimer.TIME_REMAINING.Text = ("Daily quests reset in %*"):format((v_u_3.compactFormat(v96 - v95)))
			v_u_16.DailyQuestTimer.TIME_REMAINING_SHADOW.Text = ("Daily quests reset in %*"):format((v_u_3.compactFormat(v96 - v95)))
			task.wait(1)
		end
	end)
end
task.spawn(v23.Start, v23)
return v23