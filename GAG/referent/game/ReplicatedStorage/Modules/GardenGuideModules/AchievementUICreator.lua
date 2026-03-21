local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Code.Spr)
local v_u_4 = require(v1.Data.AchievementsData)
local v_u_5 = require(v1.Modules.AchievementsController)
require(v1.Data.FenceSkinRegistry)
require(v1.Data.AchievementsData.Types)
local v6 = v1.Modules.GardenGuideModules
local v_u_7 = require(v6.ImageCycle)
local v_u_8 = require(v6.GGButtonEffects)
require(v6.GGUI)
local v_u_9 = require(v6.DataModules.GGStaticData)
local v_u_10 = require(v6.AchievementUtils)
local v_u_11 = v1.Modules.GardenGuideModules.Templates.AchTemplates
local v_u_12 = v_u_11.SeasonCellTemplate
local v_u_13 = v_u_11.SeasonSetsTemplate
local v_u_14 = v_u_11.SetCellTemplate
local v_u_15 = v_u_11.SetQuestsTemplate
local v_u_16 = v_u_11.QuestCellTemplate
local v17 = v2.LocalPlayer.PlayerGui.GardenGuide
local v_u_18 = v17.MainMenu.MainMenuFrame
local v_u_19 = v17.MainMenu.MainMenuFrame.AchievementsView.SeasonsView
local v_u_149 = {
	["CreateSeasonCell"] = function(p20, p21)
		-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_19, (copy) v_u_4, (copy) v_u_10
		local v22 = p21.SeasonName
		local v23 = v_u_12:Clone()
		v23.Name = v22
		v23.Main.TITLE.Text = ("%*"):format(v22)
		v23.Main.TITLE_SHADOW.Text = ("%*"):format(v22)
		v23.Main.SUB_TEXT.Text = ("%*"):format(p21.SeasonDescription)
		local v24 = v_u_11.SeasonBackgrounds:FindFirstChild((("%*Background"):format(p20))):Clone()
		if v24 then
			v24.Parent = v23.Main
		else
			warn((("No season background for Season %*"):format(p20)))
		end
		local v25 = v23.SELECT_BUTTON
		v25.TEXT.Text = "Explore"
		v25.TEXT_SHADOW.Text = "Explore"
		v23.Parent = v_u_19.ScrollingFrame.Content
		for v26, _ in v_u_4.Seasons[p20].Sets do
			local v27 = v_u_10.CheckForUnclaimed(p20, v26)
			if v27 then
				v23.Main:FindFirstChild("NotifMark").Visible = v27
				return v23
			end
		end
		return v23
	end,
	["CreateSeasonSets"] = function(p_u_28, p29, p_u_30, p31)
		-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_7, (copy) v_u_18, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3
		local v32 = v_u_13:Clone()
		v32.Name = p29.SeasonName
		local v33 = v32.SeasonReward.Main.TITLE
		local v34 = v32.SeasonReward.Main.TITLE_SHADOW
		v33.Text = p29.SeasonAwardHeading or "Grand Prize!"
		v34.Text = p29.SeasonAwardHeading or "Grand Prize!"
		v32.SeasonReward.Main.SUB_TEXT.Text = p29.SeasonAwardSubHeading or "Sub Text Placeholder"
		local v35 = v32.SeasonReward.Main.Rewards.SeasonRewardFrame
		local v36 = v35.REWARD_IMAGE
		local v37 = v35.ITEM_NAME.REWARD_NAME
		local v38 = v35.ITEM_NAME.REWARD_NAME_SHADOW
		local v39 = v_u_4.Seasons[p_u_28].Rewards
		if #v39 == 0 then
			v35.Visible = false
		else
			v_u_7.CycleRewardImages(v36, v37, v38, v32, v39)
		end
		if tonumber(p_u_28) == 3 then
			v32.SeasonReward.Visible = false
			v32.Progress.Visible = false
			local v40 = v32.Sets.Position
			local v41 = v32.Sets.Size
			v32.Sets.Position = UDim2.fromScale(v40.X.Scale, 0.2)
			v32.Sets.Size = UDim2.fromScale(v41.X.Scale, 0.75)
			local v42 = v32.Sets.ScrollingFrame.Content.UIGridLayout
			local v43 = v42.CellSize.X.Scale
			v42.CellSize = UDim2.fromScale(v43, 0.4)
		end
		v32.Parent = v_u_18
		local v_u_44 = v32.ClaimSeason
		local v_u_45 = v_u_44.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_5, (copy) p_u_28, (copy) v_u_44
			v_u_8.Click()
			v_u_5:Claim("Season", { p_u_28 })
			v_u_44.Visible = false
		end)
		v_u_44.Destroying:Once(function()
			-- upvalues: (copy) p_u_30, (copy) p_u_28, (ref) v_u_45
			p_u_30[p_u_28] = nil
			v_u_45:Disconnect()
			v_u_45 = nil
		end)
		local v46 = v_u_4.Seasons[p_u_28].Sets
		if v46 then
			local v47 = 0
			for _, v48 in v46 do
				for _, _ in v48.Quests do
					v47 = v47 + 1
				end
			end
			local v49 = p31 / v47
			local v50 = math.clamp(v49, 0, 1)
			local v51 = v50 == 1 and "Completed" or ("%* / %*"):format(p31, v47)
			if v_u_5:IsCompleted("Season", { p_u_28 }) then
				local v52 = v32.ClaimSeason
				if v_u_5:IsClaimed("Season", { p_u_28 }) then
					v52.Interactable = false
					v52.Visible = false
					v52.RARITY.Text = "Completed"
					v52.RARITY_SHADOW.Text = "Completed"
				elseif tonumber(p_u_28) ~= 3 then
					v52.Interactable = true
					v52.Visible = true
				end
			end
			local v53 = v32.Progress.ProgressBar
			v53.PROGRESS.Text = v51
			v53.PROGRESS_SHADOW.Text = v51
			v_u_3.target(v53.Bar_Actual, 0.9, 1, {
				["Size"] = UDim2.fromScale(v50, 1)
			})
			return v32
		end
		warn((("No AchievementData for season (%*) sets"):format(p_u_28)))
	end,
	["CreateSetCell"] = function(p_u_54, p_u_55, p56, p57)
		-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_5
		local v58 = v_u_14:Clone()
		v58.Name = ("%*%*Set"):format(p_u_54, p_u_55)
		v58.LayoutOrder = v_u_9.RarityLayoutMap[p_u_55] or -1
		local v59 = ("%* Achievements"):format(p_u_55)
		v58.SET_TEXT.Text = v59
		v58.SET_TEXT_SHADOW.Text = v59
		if v_u_4.Seasons[p_u_54].Sets[p_u_55].IsBlocked then
			v58.Expired.Visible = true
		end
		local v60 = v_u_4.Seasons[p_u_54].Sets[p_u_55].Rewards
		local v61 = v_u_10.GetRewardString(v60)
		v58.REWARD_TEXT.Text = ("Rewards: %*"):format(v61)
		v58.Background.Image = v_u_9.RarityBackground[p_u_55] or "rbxassetid://87011838248935"
		local v62 = v_u_10.CheckForUnclaimed(p_u_54, p_u_55)
		v58:FindFirstChild("NotifMark").Visible = v62
		local v63 = v_u_4.Seasons[p_u_54].Sets[p_u_55]
		if v63 then
			local v64 = p57 / #v63.Quests
			local v65 = math.clamp(v64, 0, 1)
			if v65 == 1 then
				v58.CLAIM_BUTTON.Visible = true
				v58.PROGRESS.PROGRESS.Text = "Completed"
				v58.PROGRESS.PROGRESS_SHADOW.Text = "Completed"
			else
				v58.CLAIM_BUTTON.Visible = false
				local v66 = v65 == 1 and "Completed" or ("%* / %*"):format(p57, #v63.Quests)
				local v67 = v58.PROGRESS
				local v68
				if v65 == 1 then
					v68 = Color3.fromRGB(129, 129, 129)
				else
					v68 = Color3.fromRGB(255, 255, 255)
				end
				v67.BackgroundColor3 = v68
				v58.PROGRESS.PROGRESS.Text = v66
				v58.PROGRESS.PROGRESS_SHADOW.Text = v66
			end
			v58.Parent = p56.Sets.ScrollingFrame.Content
			local v_u_69 = v58.CLAIM_BUTTON.SENSOR
			local v_u_70 = v_u_69.Activated:Connect(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_5, (copy) p_u_54, (copy) p_u_55, (copy) v_u_69
				v_u_8.Click()
				v_u_5:Claim("Set", { p_u_54, p_u_55 })
				v_u_69.Visible = false
			end)
			v_u_69.Destroying:Once(function()
				-- upvalues: (ref) v_u_70
				v_u_70:Disconnect()
				v_u_70 = nil
			end)
			return v58
		end
		warn((("No AchievementData for season (%*) sets"):format(p_u_54)))
	end,
	["CreateSetQuests"] = function(p_u_71, p_u_72, p73, _, p74)
		-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_18
		local v75 = v_u_15:Clone()
		v75.Name = ("%*%*Quests"):format(p_u_71, p_u_72)
		local v76 = v75.TitleFrame.Main
		local v77 = ("%* Achievements"):format(p_u_72)
		v76.TITLE.Text = v77
		v76.TITLE_SHADOW.Text = v77
		if v_u_4.Seasons[p_u_71].Sets[p_u_72].IsBlocked then
			v75.TitleFrame.Expired.Visible = true
		end
		v75.Visible = false
		local v78 = v76.Rewards.RewardFrame
		local v79 = v78.REWARD_IMAGE
		local v80 = v78.ITEM_NAME.REWARD_NAME
		local v81 = v78.ITEM_NAME.REWARD_NAME_SHADOW
		local v82 = v_u_4.Seasons[p_u_71].Sets[p_u_72].Rewards
		if #v82 == 0 then
			v78.Visible = false
		else
			v_u_7.CycleRewardImages(v79, v80, v81, v75, v82)
		end
		local v_u_83 = p73.Sets.ScrollingFrame.Content[("%*%*Set"):format(p_u_71, p_u_72)].CLAIM_BUTTON
		local v_u_84 = v_u_83.SENSOR.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_5, (copy) p_u_71, (copy) p_u_72, (copy) v_u_83
			v_u_8.Click()
			v_u_5:Claim("Set", { p_u_71, p_u_72 })
			v_u_83.Visible = false
		end)
		v_u_83.Destroying:Once(function()
			-- upvalues: (ref) v_u_84
			v_u_84:Disconnect()
			v_u_84 = nil
		end)
		v_u_8.AddHoverEffect(v_u_83.SENSOR)
		local v85 = v_u_4.Seasons[p_u_71].Sets[p_u_72]
		if v85 then
			local v86 = p74 / #v85.Quests
			local v87 = math.clamp(v86, 0, 1)
			local v88 = v87 == 1 and "Completed" or ("%* / %*"):format(p74, #v85.Quests)
			local v89 = v75.TitleFrame.Main.Progress.ProgressBar
			v89.PROGRESS.Text = v88
			v89.PROGRESS_SHADOW.Text = v88
			v_u_3.target(v89.Bar_Actual, 0.9, 1, {
				["Size"] = UDim2.fromScale(v87, 1)
			})
			v75.Parent = v_u_18
			return v75
		end
		warn((("No AchievementData for season (%*) sets"):format(p_u_71)))
	end,
	["PopulateSetQuests"] = function(p_u_90, p_u_91, p_u_92, p_u_93)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_149, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3
		local v94 = v_u_5:GetSeasonData(p_u_90)
		if v94 then
			local v95 = v_u_4.Seasons[p_u_90].Sets[p_u_91]
			if v95 then
				for v_u_96, v97 in v95.Quests do
					local v98 = v94.Sets[p_u_91]
					if v98 then
						local v99 = v98.Quests[v97.Id]
						local v_u_100 = ("%*_%*_%*"):format(p_u_90, p_u_91, v97.Id)
						local v101 = p_u_93[v_u_100]
						if not v101 then
							local v_u_102 = v_u_149.CreateQuestCell(p_u_90, p_u_91, v97, p_u_92)
							p_u_93[v_u_100] = v_u_102
							local v103 = v_u_102.CLAIM_BUTTON.SENSOR
							local v_u_104 = v103.Activated:Connect(function()
								-- upvalues: (ref) v_u_8, (ref) v_u_5, (copy) p_u_90, (copy) p_u_91, (copy) v_u_96, (ref) v_u_102
								v_u_8.Click()
								v_u_5:Claim("Quest", { p_u_90, p_u_91, v_u_96 })
								v_u_102.CLAIM_BUTTON.Visible = false
							end)
							v103.Destroying:Once(function()
								-- upvalues: (copy) p_u_92, (copy) p_u_90, (copy) p_u_91, (copy) p_u_93, (copy) v_u_100, (ref) v_u_104
								p_u_92[("%*%*"):format(p_u_90, p_u_91)] = nil
								p_u_93[v_u_100] = nil
								v_u_104:Disconnect()
								v_u_104 = nil
							end)
							v_u_8.AddHoverEffect(v103)
							v101 = v_u_102
						end
						local v105 = v101.PROGRESS
						local v106 = not v99 and 0 or v99.Progress
						local v107 = v97.Target
						if v107 <= v106 then
							v101.CLAIM_BUTTON.Visible = not v99.Claimed
							if v_u_5:IsClaimed("Quest", { p_u_90, p_u_91, v_u_96 }) then
								v101:FindFirstChild("UIGradient").Color = v_u_9.GoldColorSequence
								v101.Details.GoldenFrame.Visible = true
								v101.Details.NormalFrame.Visible = false
							else
								v101:FindFirstChild("UIGradient").Color = v_u_9.NormalColorSequence
								v101.Details.GoldenFrame.Visible = false
								v101.Details.NormalFrame.Visible = true
							end
							v101.PROGRESS.PROGRESS.Text = "Completed"
							v101.PROGRESS.PROGRESS_SHADOW.Text = "Completed"
						else
							v101.CLAIM_BUTTON.Visible = false
							local v108 = ("%* / %*"):format(math.round(v106), v107)
							v105.PROGRESS.Text = v108
							v105.PROGRESS_SHADOW.Text = v108
							local v109 = v_u_3.target
							local v110 = v105.Bar_Actual
							local v111 = {}
							local v112 = UDim2.fromScale
							local v113 = v106 / v107
							v111.Size = v112(math.clamp(v113, 0, 1), 1)
							v109(v110, 0.9, 1, v111)
						end
					else
						warn((("No set data for %* found!"):format(p_u_91)))
					end
				end
			else
				warn((("No AchievementData for season (%*) sets"):format(p_u_90)))
			end
		else
			warn((("No season data for %* found!"):format(p_u_90)))
			return
		end
	end,
	["UpdateSetPage"] = function(p114, p115, p116, p117, p118)
		-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_10, (copy) v_u_5
		local v119 = v_u_4.Seasons[p114].Sets[p115]
		if v119 then
			if p117[("%*%*"):format(p114, p115)] then
				local v120 = p117[("%*%*"):format(p114, p115)]
				local v121 = p118 / #v119.Quests
				local v122 = math.clamp(v121, 0, 1)
				local v123 = v122 == 1 and "Completed" or ("%* / %*"):format(p118, #v119.Quests)
				local v124 = v120.TitleFrame.Main.Progress.ProgressBar
				v124.PROGRESS.Text = v123
				v124.PROGRESS_SHADOW.Text = v123
				v_u_3.target(v124.Bar_Actual, 0.9, 1, {
					["Size"] = UDim2.fromScale(v122, 1)
				})
			end
			for _, v125 in p116[p114].Sets.ScrollingFrame.Content:GetChildren() do
				if v125:IsA("Frame") and v125.Name == ("%*%*Set"):format(p114, p115) then
					v125:FindFirstChild("NotifMark").Visible = v_u_10.CheckForUnclaimed(p114, p115)
					local v126 = v_u_5:IsCompleted("Set", { p114, p115 })
					if v126 then
						local v127 = v125.PROGRESS
						local v128
						if v126 then
							v128 = Color3.fromRGB(129, 129, 129)
						else
							v128 = Color3.fromRGB(255, 255, 255)
						end
						v127.BackgroundColor3 = v128
					end
				end
			end
		else
			warn((("No AchievementData for season (%*) sets"):format(p114)))
		end
	end,
	["CreateQuestCell"] = function(p129, p130, p131, p132)
		-- upvalues: (copy) v_u_16, (copy) v_u_9
		local v133 = v_u_16:Clone()
		v133.Name = ("%*_%*_%*"):format(p129, p130, p131.Id)
		v133.SET.Text = p131.Display
		v133.SET_SHADOW.Text = p131.Display
		v133.Background.Image = v_u_9.RarityBackground[p130] or "rbxassetid://87011838248935"
		v133.Parent = p132[("%*%*"):format(p129, p130)].QuestGridView.ScrollingFrame.QuestGridHolder
		return v133
	end,
	["UpdateQuestCells"] = function(p134, p135, _, _, p136, p137)
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_9, (copy) v_u_3
		for v138, v139 in v_u_4.Seasons[p134].Sets[p135].Quests do
			local v140 = v139.Id
			local v141 = v139.Target
			if p136[("%*_%*_%*"):format(p134, p135, v140)] and p137[v140] then
				local v142 = p137[v140].Progress
				local v143 = math.round(v142)
				local v144 = v143 / v141
				local v145 = math.clamp(v144, 0, 1)
				local v146 = v145 == 1 and "Completed" or ("%* / %*"):format(v143, v141)
				local v147 = p136[("%*_%*_%*"):format(p134, p135, v140)]
				local v148 = v147.PROGRESS
				v148.PROGRESS.Text = v146
				v148.PROGRESS_SHADOW.Text = v146
				if v145 == 1 then
					if v_u_5:IsClaimed("Quest", { p134, p135, v138 }) then
						v147.CLAIM_BUTTON.Visible = false
						v148:FindFirstChild("Bar_Actual").Visible = false
						v147:FindFirstChild("UIGradient").Color = v_u_9.GoldColorSequence
						v147.Details.GoldenFrame.Visible = true
						v147.Details.NormalFrame.Visible = false
					else
						v147.CLAIM_BUTTON.Visible = true
						v148:FindFirstChild("Bar_Actual").Visible = false
						v147:FindFirstChild("UIGradient").Color = v_u_9.NormalColorSequence
						v147.Details.GoldenFrame.Visible = false
						v147.Details.NormalFrame.Visible = true
					end
				else
					v_u_3.target(v148.Bar_Actual, 0.9, 1, {
						["Size"] = UDim2.fromScale(v145, 1)
					})
				end
			end
		end
	end
}
return v_u_149