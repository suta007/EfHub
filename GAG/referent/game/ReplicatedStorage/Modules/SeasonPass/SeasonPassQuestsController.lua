local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Modules.Trove)
local v_u_3 = require(v1.Modules.NumberUtil)
local v_u_4 = require(v1.Modules.DataService)
require(v1.Modules.ItemImageFinder)
require(v1.Modules.GuiController)
local v_u_5 = require(v1.Modules.QuestsController)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v_u_6 = require(v1.Modules.MarketController)
local v_u_7 = require(v1.Data.DevProductIds)
require(v1.Data.QuestData.Types)
require(v1.Data.QuestData.Types)
require(v1.Modules.GiveServiceCommon)
local v_u_8 = require(v1.Modules.GardenGuideModules.GGButtonEffects)
local v_u_9 = require(v1.Modules.SeasonPass.SeasonPassButtonEffects)
local v_u_10 = require(v1.Data.SeasonPass.SeasonPassData)
local v_u_11 = require(v1.Data.SeasonPass.SeasonPassStaticData)
require(v1.Modules.IsDev)
local v_u_12 = require(v1.Modules.SeasonPass.SPQuestsRewardOddsController)
local v13 = v1.GameEvents
local v_u_14 = v13.SeedPack.Open
local v_u_15 = v13.SeasonPass.ClaimSeasonPassQuest
local v_u_16 = v2.LocalPlayer.PlayerGui:WaitForChild("SeasonPassUI")
local v_u_17 = v_u_16.SeasonPassFrame.Main.Quests
local v_u_18 = v_u_17.List
local v_u_19 = v_u_17.SkipQuests
local v_u_20 = v_u_17.RollRewardsButton
local v_u_21 = v_u_17.InfoButton
local v_u_22 = v_u_17.InfoFrame
local v_u_23 = v_u_17.OddsButton
local v_u_24 = v_u_16.SeasonPassTemplates.SeasonPassQuestTemplate
local v25 = {}
local function v_u_29()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v26 = v_u_4:GetData()
	if v26 then
		local v27 = v_u_5:GetContainerFromId(v26.DailyQuests.ContainerId)
		if v27 == nil then
			return true
		end
		if #v27.Quests <= 0 then
			return true
		end
		for _, v28 in v27.Quests do
			if v28.Completed == false then
				return false
			end
		end
		return true
	end
end
local function v_u_30()
	-- upvalues: (copy) v_u_8, (copy) v_u_29, (copy) v_u_6, (copy) v_u_7
	v_u_8.Click()
	if v_u_29() then
		warn("Trying to skip dailies when they are already complete. Aborting")
	else
		v_u_6:PromptPurchase(v_u_7.SkipDailyQuest.PurchaseID, Enum.InfoType.Product)
	end
end
function v25.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_19, (copy) v_u_29, (copy) v_u_17, (copy) v_u_10, (copy) v_u_20, (copy) v_u_11, (copy) v_u_30, (copy) v_u_14, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_12, (copy) v_u_16, (copy) v_u_5, (copy) v_u_24, (copy) v_u_18, (copy) v_u_9, (copy) v_u_15, (copy) v_u_3
	local v_u_31 = v_u_4:GetData()
	if v_u_31 then
		local v_u_32 = {}
		local function v_u_38()
			-- upvalues: (ref) v_u_19, (ref) v_u_29, (ref) v_u_17, (copy) v_u_31, (ref) v_u_10, (ref) v_u_20, (ref) v_u_11
			local v33 = v_u_19
			local v34 = not v_u_29()
			if v34 then
				v34 = v_u_17.Visible
			end
			v33.Visible = v34
			local v35 = v_u_31.SeasonPass[v_u_10.CurrentSeason].QuestRewardClaimed
			v_u_20.Visible = v_u_29()
			if v35 then
				local v36 = v_u_11.ButtonColors.Gray
				v_u_20.BackgroundColor3 = v36.Background
				v_u_20.UIStroke.Color = v36.ButtonStroke
				v_u_20.TextLabel.UIStroke.Color = v36.TextStroke
				v_u_20.Interactable = false
			else
				local v37 = v_u_11.ButtonColors.Gold
				v_u_20.BackgroundColor3 = v37.Background
				v_u_20.UIStroke.Color = v37.ButtonStroke
				v_u_20.TextLabel.UIStroke.Color = v37.TextStroke
				v_u_20.Interactable = true
			end
		end
		v_u_19.Activated:Connect(v_u_30)
		v_u_20.Activated:Connect(function()
			-- upvalues: (ref) v_u_29, (ref) v_u_14, (copy) v_u_38
			if v_u_29() then
				v_u_14:FireServer("Season Pass Quests")
				task.wait(2)
				v_u_38()
			end
		end)
		v_u_21.Activated:Connect(function()
			-- upvalues: (ref) v_u_22
			v_u_22.Visible = not v_u_22.Visible
		end)
		v_u_23.Activated:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_16
			v_u_12:Open(v_u_16)
		end)
		local function v56()
			-- upvalues: (ref) v_u_4, (copy) v_u_32, (ref) v_u_5, (ref) v_u_24, (ref) v_u_18, (ref) v_u_9, (ref) v_u_15, (ref) v_u_11, (ref) v_u_10, (copy) v_u_38
			local v39 = v_u_4:GetData()
			if not v39 then
				return
			end
			if not (v39.DailyQuests and v39.DailyQuests.ContainerId) then
				for v40 in v_u_32 do
					local v41 = v_u_32[v40]
					if v41 then
						v41:Destroy()
						v_u_32[v40] = nil
					end
				end
				table.clear(v_u_32)
				return
			end
			local v42 = v_u_5:GetContainerFromId(v39.DailyQuests.ContainerId)
			if not v42 then
				return
			end
			for v43, v_u_44 in v42.Quests do
				local _ = v_u_44.Completed
				local v45 = v_u_5:GetQuest(v_u_44.Type)
				if v45 then
					local v_u_46 = v_u_32[v_u_44.Id]
					if not v_u_46 then
						v_u_46 = v_u_24:Clone()
						v_u_46.Visible = true
						v_u_46.LayoutOrder = v43 + 1
						v_u_46.Parent = v_u_18
						v_u_32[v_u_44.Id] = v_u_46
						v_u_46.Progress.Claim.Activated:Once(function()
							-- upvalues: (ref) v_u_9, (ref) v_u_15, (copy) v_u_44, (copy) v_u_46
							v_u_9.Click()
							v_u_15:FireServer(v_u_44.Id)
							v_u_46.Progress.Claim.Visible = false
						end)
						v_u_46.Progress.Claim.MouseEnter:Connect(function()
							-- upvalues: (ref) v_u_9
							v_u_9.Hover()
						end)
					end
					local v47 = v45:Display(v_u_44.Progress, v_u_44.Target, v_u_44.Arguments)
					v_u_46.Title.Text = v47.Title
					v_u_46.Desc.Text = v47.Description
					local v48 = v_u_46.Progress.Fill
					local v49 = UDim2.fromScale
					local v50 = v_u_44.Progress / v_u_44.Target
					v48.Size = v49(math.clamp(v50, 0, 1), 1)
					v_u_46.Progress.Amount.Text = v_u_44.Progress >= v_u_44.Target and "Completed!" or v47.Bar
					v_u_46.Vector.Image = "rbxassetid://75864975818271"
					v_u_46.Amount.Text = ("x%*"):format(v_u_11.DAILY_QUEST_XP)
					local v51 = v_u_46.Progress.Claim
					if v_u_44.Progress >= v_u_44.Target then
						v51.Visible = table.find(v39.SeasonPass[v_u_10.CurrentSeason].QuestsCompleted, v_u_44.Id) and not table.find(v39.SeasonPass[v_u_10.CurrentSeason].QuestsClaimed, v_u_44.Id) and true or false
					end
				end
			end
			for v52 in v_u_32 do
				local v53 = false
				for _, v54 in v42.Quests do
					if v54.Id == v52 then
						v53 = true
						break
					end
				end
				if not v53 then
					local v55 = v_u_32[v52]
					if v55 then
						v55:Destroy()
						v_u_32[v52] = nil
					end
				end
			end
			v_u_38()
		end
		v_u_17:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (ref) v_u_22, (copy) v_u_38
			v_u_22.Visible = false
			v_u_38()
		end)
		task.spawn(v56)
		local v57 = v_u_4:GetPathSignal("DailyQuests/@")
		assert(v57, "Failed to listen for Daily Quests"):Connect(v56)
		local v58 = v_u_4:GetPathSignal("QuestContainers/@")
		assert(v58, "Failed to listen for Quest Containers"):Connect(v56)
		task.spawn(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_3
			while true do
				local v59 = workspace:GetServerTimeNow()
				local v60 = ((v59 + 14400) // 86400 + 1) * 86400 - 14400
				v_u_17.Timer.Text = ("New quests in:  <font color=\"rgb(255, 78, 78)\">%*</font>"):format((v_u_3.compactFormat(v60 - v59)))
				task.wait(1)
			end
		end)
	end
end
return v25