local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Code.Spr)
local v_u_4 = require(v1.Modules.DataService)
local v_u_5 = require(v1.Modules.AchievementsController)
local v_u_6 = require(v1.Data.AchievementsData)
require(v1.Data.AchievementsData.Types)
local v_u_7 = require(v1.Modules.UpdateService)
local v8 = v1.Modules.GardenGuideModules
local v_u_9 = require(v8.GGUI)
local v_u_10 = require(v8.GGButtonEffects)
local v_u_11 = require(v8.AchievementUICreator)
require(v8.DataModules.GGStaticData)
local v_u_12 = require(v8.AchievementUtils)
local v13 = v2.LocalPlayer.PlayerGui.GardenGuide
local _ = v13.MainMenu.MainMenuFrame
local v_u_14 = v13.MainMenu.MainMenuFrame.AchievementsView
local v_u_15 = v_u_14.SeasonsView
local v79 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_12, (copy) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_14, (copy) v_u_15
		local v_u_16 = v_u_4:GetData()
		local v_u_17 = {}
		local v_u_18 = {}
		local v_u_19 = {}
		local function v_u_40(p20, p21)
			-- upvalues: (ref) v_u_6, (copy) v_u_19, (ref) v_u_5, (ref) v_u_3
			if p21 then
				local _ = v_u_6.Seasons[p20].SeasonName
				local v22 = v_u_19[p20]
				if v22 then
					local v23 = v_u_5:IsCompleted("Season", { p20 })
					if v23 then
						local v24 = v22.ClaimSeason
						if v_u_5:IsClaimed("Season", { p20 }) then
							v24.Interactable = false
							v24.Visible = false
							v24.RARITY.Text = "Completed"
							v24.RARITY_SHADOW.Text = "Completed"
						elseif tonumber(p20) ~= 3 then
							v24.Interactable = true
							v24.Visible = true
						end
					end
					local v25 = 0
					local v26 = 0
					for v27, v28 in p21.Sets do
						local v29 = v_u_6.Seasons[p20].Sets[v27]
						if v29 then
							for _, v30 in v29.Quests do
								v25 = v25 + 1
								if (v28.Quests[v30.Id] and (v28.Quests[v30.Id].Progress or 0) or 0) >= v30.Target then
									v26 = v26 + 1
								end
							end
						else
							warn(("AchievementsInterfaceController | No AchData for %*:"):format(v27), v29)
						end
					end
					local v31 = v22.Progress.ProgressBar
					local v32 = v31.Bar_Actual
					local v33 = v31.PROGRESS
					local v34 = v31.PROGRESS_SHADOW
					local v35 = ("%* / %*"):format(v26, v25)
					v33.Text = v35
					v34.Text = v35
					if v23 and v_u_5:IsClaimed("Season", { p20 }) then
						v33.Text = "Completed"
						v34.Text = "Completed"
					end
					local v36 = v_u_3.target
					local v37 = {}
					local v38 = UDim2.fromScale
					local v39 = v26 / v25
					v37.Size = v38(math.clamp(v39, 0, 1), 1)
					v36(v32, 0.9, 1, v37)
				end
			else
				return
			end
		end
		local function v_u_58(p_u_41, p_u_42, p43)
			-- upvalues: (ref) v_u_7, (ref) v_u_6, (copy) v_u_19, (copy) v_u_16, (ref) v_u_12, (ref) v_u_11, (copy) v_u_18, (copy) v_u_17, (ref) v_u_9, (ref) v_u_10, (ref) v_u_5
			if p43 then
				if v_u_7:IsHiddenFromUpdate(p_u_42) then
					return
				else
					local _ = v_u_6.Seasons[p_u_41].SeasonName
					local v_u_44 = v_u_19[p_u_41]
					if v_u_44 then
						local v45 = v_u_6.Seasons[p_u_41].Sets[p_u_42]
						if v45 then
							local v46 = v_u_16.Achievements.Seasons[("Season_%*"):format(p_u_41)].Sets[p_u_42].Quests
							local v47 = v_u_12.CalculateSetProgress(p_u_41, p_u_42, v46)
							local v48 = v_u_44.Sets.ScrollingFrame.Content:FindFirstChild((("%*%*Set"):format(p_u_41, p_u_42)))
							if v48 then
								local v49 = v47 / #v45.Quests
								local v50 = math.clamp(v49, 0, 1)
								local v51 = v50 == 1 and "Completed" or ("%* / %*"):format(v47, #v45.Quests)
								local v52 = v48.PROGRESS
								local v53
								if v50 == 1 then
									v53 = Color3.fromRGB(129, 129, 129)
								else
									v53 = Color3.fromRGB(255, 255, 255)
								end
								v52.BackgroundColor3 = v53
								v48.PROGRESS.PROGRESS.Text = v51
								v48.PROGRESS.PROGRESS_SHADOW.Text = v51
							else
								v48 = v_u_11.CreateSetCell(p_u_41, p_u_42, v_u_44, v47)
								v48.SENSOR.Activated:Connect(function()
									-- upvalues: (ref) v_u_18, (copy) p_u_41, (copy) p_u_42, (ref) v_u_16, (ref) v_u_12, (ref) v_u_11, (copy) v_u_44, (ref) v_u_17, (ref) v_u_9
									local v54 = v_u_18[("%*%*"):format(p_u_41, p_u_42)]
									if not v54 then
										local v55 = v_u_16.Achievements.Seasons[("Season_%*"):format(p_u_41)].Sets[p_u_42].Quests
										local v56 = v_u_12.CalculateSetProgress(p_u_41, p_u_42, v55)
										v54 = v_u_11.CreateSetQuests(p_u_41, p_u_42, v_u_44, v_u_18, v56)
										v_u_18[("%*%*"):format(p_u_41, p_u_42)] = v54
									end
									v_u_11.PopulateSetQuests(p_u_41, p_u_42, v_u_18, v_u_17)
									v_u_9.CurrentDetail = v54
									v_u_9.ChangeTopBar(("%* Achievements"):format(p_u_42), false)
									v_u_9.GoNextPage(v54, v_u_44)
								end)
								v_u_10.AddHoverEffect(v48.SENSOR)
							end
							if v_u_5:IsCompleted("Set", { p_u_41, p_u_42 }) then
								local v57 = v48.CLAIM_BUTTON
								if v_u_5:IsClaimed("Set", { p_u_41, p_u_42 }) then
									v57.SENSOR.Interactable = false
									v57.Visible = false
									v48.Effect.Visible = false
									v48.Underglow.Visible = false
								else
									v57.SENSOR.Interactable = true
									v57.Visible = true
									v48.Effect.Visible = true
									v48.Underglow.Visible = true
								end
							end
							v_u_11.UpdateSetPage(p_u_41, p_u_42, v_u_19, v_u_18, v47)
							v_u_11.UpdateQuestCells(p_u_41, p_u_42, v_u_19, v_u_18, v_u_17, v46)
						else
							warn((("No AchievementData for season (%*) sets"):format(p_u_41)))
						end
					else
						return
					end
				end
			else
				return
			end
		end
		v_u_14:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_6, (ref) v_u_7, (ref) v_u_15, (ref) v_u_11, (copy) v_u_19, (copy) v_u_16, (ref) v_u_12, (copy) v_u_58, (ref) v_u_9, (ref) v_u_10
			if v_u_14.Visible then
				for v_u_59, v_u_60 in v_u_6.Seasons do
					if not (v_u_7:IsHiddenFromUpdate(v_u_60.SeasonName) or v_u_15.ScrollingFrame.Content:FindFirstChild(v_u_60.SeasonName)) then
						local v61 = v_u_11.CreateSeasonCell(v_u_59, v_u_60).SELECT_BUTTON.SENSOR
						v61.Activated:Connect(function()
							-- upvalues: (ref) v_u_19, (copy) v_u_59, (ref) v_u_16, (ref) v_u_12, (ref) v_u_11, (copy) v_u_60, (ref) v_u_58, (ref) v_u_9, (ref) v_u_14
							local v62 = v_u_19[v_u_59]
							local v63 = v_u_16.Achievements.Seasons[("Season_%*"):format(v_u_59)].Sets
							local v64 = v_u_12.CalculateSeasonProgress(v_u_59, v63)
							if not v62 then
								v62 = v_u_11.CreateSeasonSets(v_u_59, v_u_60, v_u_19, v64)
								v_u_19[v_u_59] = v62
							end
							for v65 in v_u_60.Sets do
								v_u_58(v_u_59, v65, v_u_60)
							end
							v_u_9.CurrentDetail = v62
							v_u_9.ChangeTopBar(("%*"):format(v_u_60.SeasonName), false)
							v_u_9.GoNextPage(v62, v_u_14)
						end)
						v_u_10.AddHoverEffect(v61)
					end
				end
			else
				for _, v66 in v_u_15.ScrollingFrame.Content:GetChildren() do
					if v66:IsA("Frame") then
						v66:Destroy()
					end
				end
			end
		end)
		for v_u_67, v_u_68 in v_u_6.Seasons do
			local v_u_69 = nil
			v_u_5:Observe("Season", { v_u_67 }, function(p70)
				-- upvalues: (ref) v_u_69, (copy) v_u_40, (copy) v_u_67, (copy) v_u_68, (ref) v_u_5, (copy) v_u_58
				local v71 = v_u_69
				if type(v71) == "function" then
					v_u_69()
				end
				v_u_40(v_u_67, p70)
				local v_u_72 = {}
				for v_u_73 in v_u_68.Sets do
					local v74 = v_u_5
					local v75 = { v_u_67, v_u_73 }
					local function v77(p76)
						-- upvalues: (ref) v_u_58, (ref) v_u_67, (copy) v_u_73
						v_u_58(v_u_67, v_u_73, p76)
					end
					table.insert(v_u_72, v74:Observe("Set", v75, v77))
				end
				v_u_69 = function()
					-- upvalues: (copy) v_u_72
					for _, v78 in v_u_72 do
						if type(v78) == "function" then
							v78()
						end
					end
				end
			end)
		end
	end
}
task.spawn(v79.Start, v79)
return v79