local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.QuestsController)
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.Trove)
require(v1.Modules.Signal)
local v_u_5 = require(v1.Modules.Notification)
local v_u_6 = game.ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Quests").Claim
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new(p8)
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	local v9 = v_u_7
	local v10 = setmetatable({}, v9)
	v10._parent = p8.Parent
	v10._template = p8.Template
	v10._containerID = p8.ContainerID
	v10._autoUpdate = p8.AutoUpdate == nil and true or p8.AutoUpdate
	v10._showCompleted = p8.ShowCompleted == nil and true or p8.ShowCompleted
	v10._IsIndividual = false
	v10._trove = v_u_4.new()
	v10._refreshTrove = v_u_4.new()
	v10._cachedCells = {}
	if v10._autoUpdate then
		v10:_setupAutoUpdate()
	end
	if v10._containerID then
		v10:Rebuild()
	end
	return v10
end
function v_u_7.SetContainer(p11, p12)
	p11._containerID = p12
	p11:Rebuild()
end
function v_u_7.GetContainer(p13)
	return p13._containerID
end
function v_u_7.Rebuild(p14)
	-- upvalues: (copy) v_u_2
	p14:_clearCurrentQuests()
	if p14._containerID then
		local v15 = v_u_2:GetContainerFromId(p14._containerID)
		if v15 then
			if v15.IsIndividual then
				p14._IsIndividual = true
			end
			p14._refreshTrove:Clean()
			for _, v16 in v15.Quests do
				local v17 = p14:_getOrCreateCell(v16.Id)
				p14:_configureCell(v16.Id, v17)
				v17.Parent = p14._parent
			end
			local v18 = {}
			for _, v19 in v15.Quests do
				v18[v19.Id] = true
			end
			for v20, v21 in p14._cachedCells do
				if not v18[v20] then
					v21:Destroy()
					p14._cachedCells[v20] = nil
				end
			end
		else
			warn((("[QuestView] No quest container found for ID: %*"):format(p14._containerID)))
		end
	else
		return
	end
end
function v_u_7.UpdateQuest(p22, p23)
	local v24 = p22._cachedCells[p23]
	p22._refreshTrove:Clean()
	if v24 then
		p22:_configureCell(p23, v24)
	end
end
function v_u_7.AreAllQuestsCompleted(p25)
	-- upvalues: (copy) v_u_2
	if not p25._containerID then
		return false
	end
	local v26 = v_u_2:GetContainerFromId(p25._containerID)
	if not v26 then
		return false
	end
	for _, v27 in v26.Quests do
		if not v27.Completed then
			return false
		end
	end
	return true
end
function v_u_7.GetProgress(p28)
	-- upvalues: (copy) v_u_2
	if not p28._containerID then
		return {
			["Completed"] = 0,
			["Total"] = 0,
			["Percentage"] = 0
		}
	end
	local v29 = v_u_2:GetContainerFromId(p28._containerID)
	if not v29 then
		return {
			["Completed"] = 0,
			["Total"] = 0,
			["Percentage"] = 0
		}
	end
	local v30 = #v29.Quests
	local v31 = 0
	for _, v32 in v29.Quests do
		if v32.Completed then
			v31 = v31 + 1
		end
	end
	return {
		["Completed"] = v31,
		["Total"] = v30,
		["Percentage"] = v30 <= 0 and 0 or v31 / v30 * 100
	}
end
function v_u_7.Destroy(p33)
	p33._trove:Destroy()
	p33._refreshTrove:Destroy()
	for _, v34 in p33._cachedCells do
		v34:Destroy()
	end
	p33._cachedCells = {}
	if p33.OnQuestCompleted then
		p33.OnQuestCompleted:Destroy()
	end
end
function v_u_7._setupAutoUpdate(p_u_35)
	-- upvalues: (copy) v_u_3
	p_u_35._trove:Add(v_u_3:GetPathSignal("QuestContainers/@"):Connect(function()
		-- upvalues: (copy) p_u_35
		p_u_35:Rebuild()
	end))
end
function v_u_7._configureCellIndividual(p_u_36, p_u_37, p38)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	local v39 = v_u_2:GetQuestFromId(p_u_37)
	if v39 then
		local v_u_40 = v_u_2:GetQuest(v39.Type):Display(v39.Progress, v39.Target, v39.Arguments)
		local v_u_41 = v39.Progress >= v39.Target
		local v_u_42 = v39.Claimed or false
		local v43 = v39.ImageId and p38.Contents:FindFirstChild("QuestImage")
		if v43 then
			v43.Image = v39.ImageId
		end
		local v44 = p38.Contents:FindFirstChild("ClaimButton")
		if v44 and v39.Rewards then
			v44.ImageRectOffset = v_u_41 and Vector2.new(0, 258) or Vector2.new(0, 602)
			v44.Amount.TextLabel.UIStroke.Color = v_u_41 and Color3.fromRGB(28, 58, 21) or Color3.fromRGB(56, 56, 57)
			v44.Amount.TextLabel.Text = ("x%*"):format(v39.Rewards[1].Data.Amount)
			if v_u_42 then
				v44.Visible = false
			end
			p_u_36._refreshTrove:Add(v44.Activated:Connect(function()
				-- upvalues: (copy) v_u_41, (ref) v_u_5, (copy) v_u_40, (copy) v_u_42, (copy) p_u_36, (ref) v_u_6, (copy) p_u_37
				if v_u_41 then
					if v_u_41 and (not v_u_42 and p_u_36._containerID) then
						v_u_6:FireServer(p_u_36._containerID, p_u_37)
					end
				else
					v_u_5:CreateNotification((("%*"):format(v_u_40.Title)))
				end
			end))
		end
		local v45 = p38.Contents:FindFirstChild("ClaimedDisplay")
		if v45 then
			v45.Visible = v_u_42 or false
		end
	end
end
function v_u_7._configureCell(p46, p47, p48)
	-- upvalues: (copy) v_u_2
	local v49 = v_u_2:GetQuestFromId(p47)
	if v49 then
		local v50 = v_u_2:GetQuest(v49.Type):Display(v49.Progress, v49.Target, v49.Arguments)
		local v51 = v49.Progress >= v49.Target
		local v52 = v51 and "Completed!" or v50.Bar
		p48.Contents.TASK_NAME.Text = v50.Title
		p48.Contents.Progress.ProgressBar.PROGRESS.Text = v52
		p48.Contents.Progress.ProgressBar.PROGRESS_SHADOW.Text = v52
		local v53 = v49.Progress / v49.Target
		local v54 = math.clamp(v53, 0, 1)
		p48.Contents.Progress.ProgressBar.Bar_Actual.Size = UDim2.new(v54, 0, 1, 0)
		p48.Contents.Progress.Details.Underglow.Size = UDim2.new(v54 * 1.296, 0, v54 * 6.504, 0)
		if p46._IsIndividual then
			p46:_configureCellIndividual(p47, p48)
		end
		if p46._showCompleted or not v51 then
			p48.Visible = true
		else
			p48.Visible = false
		end
	else
		return
	end
end
function v_u_7._getOrCreateCell(p55, p56)
	if p55._cachedCells[p56] then
		return p55._cachedCells[p56]
	end
	local v57 = p55._template:Clone()
	p55._cachedCells[p56] = v57
	return v57
end
function v_u_7._clearCurrentQuests(p58)
	for _, v59 in p58._cachedCells do
		v59.Parent = nil
	end
end
return v_u_7