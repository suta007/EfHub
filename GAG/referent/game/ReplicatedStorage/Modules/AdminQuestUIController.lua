local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.DataService)
local v_u_3 = require(v_u_1.Modules.Notification)
game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = require(v_u_1.Modules.GuiController)
local v_u_5 = require(v_u_1.Modules.QuestsController)
require(v_u_1.Data.QuestData.Types)
local v_u_6 = require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.ItemImageFinder)
local v_u_7 = require(v_u_1.Modules.MarketController)
require(v_u_1.Modules.IsDev)
local v_u_8 = require(v_u_1.Data.DevProductIds)
require(v_u_1.Modules.EventService)
require(v_u_1.Modules.GardenGuideModules.ImageCycle)
require(v_u_1.Data.SeedData)
require(v_u_1.Modules.ReplicationClass.DeepClone)
require(v_u_1.Modules.UpdateService)
local v_u_9 = require(v_u_1.Modules.AdminQuestRewardsUIController)
local v10 = require(v_u_1.Modules.Signal)
require(v_u_1.Data.SharedCycleHandlerData)
local v_u_11 = game.Players.LocalPlayer.PlayerGui:WaitForChild("AdminQuests_UI")
local v_u_12 = v_u_11.Frame.Main
local v13 = v_u_12.Holder.Header
local v_u_14 = v_u_12.Holder.Content.Tasks
local v_u_15 = v13.SkipQuestsButton
local v_u_16 = v13.OddsButton
local v_u_17 = v13.Exit.SENSOR
local v_u_18 = v13.Resets
local v_u_19 = v_u_14.UIListLayout.Segment
local v_u_20 = {}
local v_u_21 = {
	["Notif"] = false,
	["OnNotifStateChanged"] = v10.new()
}
local v_u_22 = {
	["ContainerID"] = nil,
	["CompletedQuests"] = {},
	["AllComplete"] = false,
	["Claimed"] = false
}
local function v_u_30(p23, p24)
	-- upvalues: (copy) v_u_5
	local v25 = v_u_5:GetQuestFromId(p23)
	if v25 then
		local v26 = v_u_5:GetQuest(v25.Type):Display(v25.Progress, v25.Target, v25.Arguments)
		local v27 = v25.Progress >= v25.Target and "Completed!" or v26.Bar
		p24.Contents.TASK_NAME.Text = v26.Title
		p24.Contents.Progress.ProgressBar.PROGRESS.Text = v27
		p24.Contents.Progress.ProgressBar.PROGRESS_SHADOW.Text = v27
		local v28 = v25.Progress / v25.Target
		local v29 = math.clamp(v28, 0, 1)
		p24.Contents.Progress.ProgressBar.Bar_Actual.Size = UDim2.new(v29, 0, 1, 0)
		p24.Contents.Progress.Details.Underglow.Size = UDim2.new(v29 * 1.296, 0, v29 * 6.504, 0)
		p24.Visible = true
	end
end
local function v_u_35()
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v31 = v_u_2:GetData()
	if not v31 then
		return false
	end
	local v32 = v31.AdminQuest
	if not v32 then
		return false
	end
	local v33 = v_u_5:GetContainerFromId(v32.ContainerID)
	if not v33 then
		return false
	end
	for _, v34 in v33.Quests do
		if not v34.Completed then
			return false
		end
	end
	return true
end
local function v_u_43()
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_2, (copy) v_u_5, (copy) v_u_22, (copy) v_u_35
	if v_u_4:GetStateForGui(v_u_11).Visible:Get() then
		return false
	end
	local v36 = v_u_2:GetData()
	if not (v36 and v36.AdminQuest) then
		return false
	end
	local v37 = v36.AdminQuest
	local v38 = v37.ContainerID
	local v39 = v_u_5:GetContainerFromId(v38)
	if not v39 then
		return false
	end
	if v_u_22.ContainerID and v_u_22.ContainerID ~= v38 then
		return true
	end
	for _, v40 in v39.Quests do
		local v41 = v_u_22.CompletedQuests[v40.Id]
		if v40.Completed and not v41 then
			return true
		end
	end
	local v42 = v_u_35()
	if v42 then
		v42 = not v37.Claimed
	end
	return v42 and not v_u_22.AllComplete and true or false
end
local function v_u_49()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_22, (copy) v_u_35
	local v44 = v_u_2:GetData()
	if v44 and v44.AdminQuest then
		local v45 = v44.AdminQuest
		local v46 = v45.ContainerID
		local v47 = v_u_5:GetContainerFromId(v46)
		if v46 and v47 then
			v_u_22.ContainerID = v46
			v_u_22.Claimed = v45.Claimed or false
			v_u_22.AllComplete = v_u_35()
			v_u_22.CompletedQuests = {}
			for _, v48 in v47.Quests do
				v_u_22.CompletedQuests[v48.Id] = v48.Completed
			end
		end
	else
		return
	end
end
local function v_u_62()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_20, (copy) v_u_19, (copy) v_u_30, (copy) v_u_14, (copy) v_u_35, (copy) v_u_12
	local v50 = v_u_2:GetData().AdminQuest
	if v50 then
		local v51 = v50.ContainerID
		local v52 = v_u_5:GetContainerFromId((tostring(v51)))
		if v52 ~= nil then
			for _, v53 in v52.Quests do
				local v54 = v53.Id
				local v55
				if v_u_20[v54] then
					v55 = v_u_20[v54]
				else
					v55 = v_u_19:Clone()
					v_u_20[v54] = v55
				end
				v_u_30(v53.Id, v55)
				v55.Parent = v_u_14
			end
			local v56 = {}
			for _, v57 in v52.Quests do
				v56[v57.Id] = true
			end
			for v58, _ in v_u_20 do
				if not v56[v58] then
					v_u_20[v58]:Destroy()
					v_u_20[v58] = nil
				end
			end
			local v59 = v_u_35()
			local v60 = v50.Claimed
			v_u_12.TasksCompleteOverlay.Visible = v59 or v60
			local v61 = v_u_12.TasksCompleteOverlay.Complete
			if v59 then
				v59 = not v60
			end
			v61.Visible = v59
			v_u_12.TasksCompleteOverlay.Claimed.Visible = v60
		end
	else
		return
	end
end
function v_u_21.Open(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_21, (copy) v_u_49
	v_u_4:Open(v_u_11)
	if v_u_21.Notif ~= false then
		v_u_21.Notif = false
		v_u_21.OnNotifStateChanged:Fire(false)
	end
	v_u_49()
end
function v_u_21.Close(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_11
	v_u_4:Close(v_u_11)
end
function v_u_21.Toggle(p63)
	-- upvalues: (copy) v_u_4, (copy) v_u_11
	if v_u_4:GetStateForGui(v_u_11).Visible:Get() then
		p63:Close()
	else
		p63:Open()
	end
end
function v_u_21.Start(p_u_64)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_17, (copy) v_u_15, (copy) v_u_35, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_16, (copy) v_u_9, (copy) v_u_2, (copy) v_u_62, (copy) v_u_43, (copy) v_u_21, (copy) v_u_49, (copy) v_u_18, (copy) v_u_6, (copy) v_u_12, (copy) v_u_1
	v_u_4:GetStateForGui(v_u_11)
	v_u_17.Activated:Connect(function()
		-- upvalues: (copy) p_u_64
		p_u_64:Close()
	end)
	v_u_15.Activated:Connect(function()
		-- upvalues: (ref) v_u_35, (ref) v_u_3, (ref) v_u_7, (ref) v_u_8
		if v_u_35() then
			v_u_3:CreateNotification("You\'ve already completed the quests!")
		else
			v_u_7:PromptPurchase(v_u_8.SkipAdminQuest.PurchaseID, Enum.InfoType.Product)
		end
	end)
	v_u_16.Activated:Connect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_11
		v_u_9:Open(v_u_11, true)
	end)
	local v65 = v_u_2:GetPathSignal("AdminQuest/@")
	assert(v65, "Failed to listen for Admin Quests"):Connect(function()
		-- upvalues: (ref) v_u_62, (ref) v_u_43, (ref) v_u_21, (ref) v_u_49
		v_u_62()
		if v_u_43() and v_u_21.Notif ~= true then
			v_u_21.Notif = true
			v_u_21.OnNotifStateChanged:Fire(true)
		end
		v_u_49()
	end)
	local v66 = v_u_2:GetPathSignal("QuestContainers/@")
	assert(v66, "Failed to listen for Admin Quest Containers"):Connect(function()
		-- upvalues: (ref) v_u_62, (ref) v_u_43, (ref) v_u_21, (ref) v_u_49
		v_u_62()
		if v_u_43() and v_u_21.Notif ~= true then
			v_u_21.Notif = true
			v_u_21.OnNotifStateChanged:Fire(true)
		end
		v_u_49()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_18, (ref) v_u_6
		while true do
			local v67 = v_u_2:GetData()
			if v67.AdminQuest then
				local v68 = (v67.AdminQuest.EndTime or 0) - os.time()
				local v69 = math.max(0, v68)
				v_u_18.Text = "Ends in " .. v_u_6.toHMS(v69 or 0)
			else
				v_u_18.Text = "No Admin Quest active!"
			end
			task.wait(1)
		end
	end)
	v_u_12.TasksCompleteOverlay.Complete.ClaimButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_1
		v_u_1.GameEvents.ClaimAdminQuestReward:FireServer()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_49
		task.wait(0.5)
		v_u_49()
	end)
	task.spawn(v_u_62)
end
task.spawn(v_u_21.Start, v_u_21)
return v_u_21