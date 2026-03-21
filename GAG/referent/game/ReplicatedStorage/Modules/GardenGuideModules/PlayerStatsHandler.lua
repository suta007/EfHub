local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Data.GardenLevel.GardenLevelData)
local v_u_5 = require(v1.Data.GardenLevel.GardenLevelRewardData)
local v_u_6 = require(v1.Modules.ItemImageFinder)
local v_u_7 = v3:GetData()
local v8 = v_u_2.LocalPlayer.PlayerGui.GardenGuide.MainMenu.MainMenuFrame.PlayerStatsView
local v_u_9 = v8.ScrollingFrame.Main.PlayerLevelFrame
local v_u_10 = v8.ScrollingFrame.Main.RewardsTracker
local v_u_11 = script.Parent.Templates.RewardTrackItemTemplate
local v12 = {}
local function v_u_19()
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5
	if v_u_7 then
		local v13 = v_u_7.GardenLevel.TotalExperience or 0
		local v14 = v_u_4.CalculateLevel(v13)
		local v15 = v_u_10.Main.ScrollingFrame.Content
		for v16, _ in v_u_5 do
			if v16 <= v14 then
				local v17 = v15:FindFirstChild((("%*"):format(v16)))
				v17.LockedOverlay.Visible = false
				v17.RewardedOverlay.Visible = true
			else
				local v18 = v15:FindFirstChild((("%*"):format(v16)))
				v18.LockedOverlay.Visible = true
				v18.RewardedOverlay.Visible = false
			end
		end
	else
		warn((("No player data for %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_39()
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_9
	if v_u_7 then
		local v20 = v_u_7.GardenLevel.TotalExperience or 0
		local v21 = v_u_4.CalculateLevel(v20)
		local v22 = v_u_4.GetTotalXPForNextLevel(v20)
		local v23 = v_u_4.GetXPEarnedCurrentLevel(v20)
		local v24 = v_u_9.Content.PlayerImage
		local v25 = v24.LEVEL_VALUE
		local v26 = v24.LEVEL_VALUE_SHADOW
		v25.Text = v21
		v26.Text = v21
		local v27 = v_u_9.Content.CurrentLevelDisplay
		local v28 = v27.PLAYER_LEVEL
		local v29 = v27.PLAYER_LEVEL_SHADOW
		local v30 = ("Level %*"):format(v21)
		v28.Text = v30
		v29.Text = v30
		local v31 = v_u_9.Content.EXP_REQUIRED
		local v32 = v_u_9.Content.EXP_REQUIRED_SHADOW
		local v33 = ("%* XP <font transparency=\".4\">to the Next Level</font>"):format(v22 - v23)
		v31.Text = v33
		v32.Text = v33
		local v34 = v_u_9.Content.XPBar
		local v35 = v34.Bar_Actual
		local v36 = v34.PROGRESS
		local v37 = v34.PROGRESS_SHADOW
		local v38 = ("%* / %*XP"):format(v23, v22)
		v35.Size = UDim2.fromScale(v23 / v22, 1)
		v36.Text = v38
		v37.Text = v38
	else
		warn((("No player data for %*"):format(v_u_2.LocalPlayer)))
	end
end
local function v_u_52()
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11, (copy) v_u_6
	if v_u_7 then
		local v40 = v_u_7.GardenLevel.TotalExperience or 0
		local v41 = v_u_4.CalculateLevel(v40)
		local v42 = v_u_10.Main.ScrollingFrame.Content
		local v43 = {}
		for v44, _ in v_u_5 do
			table.insert(v43, v44)
		end
		table.sort(v43)
		for _, v45 in v43 do
			local v46 = v_u_5[v45]
			local v47 = v_u_11:Clone()
			v47.Name = ("%*"):format(v45)
			local v48 = v46.ItemPlayerFacingName
			v47.Main.ITEM_NAME.REWARD_NAME.Text = v48
			v47.Main.ITEM_NAME.REWARD_NAME_SHADOW.Text = v48
			v47.Main.REWARD_IMAGE.Image = v_u_6(v46.ItemName, v46.ItemType)
			local v49 = v47.LockedOverlay
			v49.LEVEL_VALUE.Text = v45
			v49.LEVEL_VALUE_SHADOW.Text = v45
			if v45 <= v41 then
				v49.Visible = false
				v47.RewardedOverlay.Visible = true
			end
			v47.Parent = v42
		end
		local v50 = v_u_11:Clone()
		v50.Name = "?"
		v50.Main.ITEM_NAME.REWARD_NAME.Text = v50.Name
		v50.Main.ITEM_NAME.REWARD_NAME_SHADOW.Text = v50.Name
		local v51 = v50.LockedOverlay
		v51.LEVEL_VALUE.Text = v50.Name
		v51.LEVEL_VALUE_SHADOW.Text = v50.Name
		v51.SUB_TEXT.Text = "More coming soon..."
		v51.SUB_TEXT_SHADOW.Text = "More coming soon..."
		v50.Parent = v42
	else
		warn((("No player data for %*"):format(v_u_2.LocalPlayer)))
	end
end
function v12.CreatePlayerStatsPage()
	-- upvalues: (copy) v_u_52, (copy) v_u_39
	v_u_52()
	v_u_39()
end
v12.CreatePlayerStatsPage()
local v53 = v3:GetPathSignal("GardenLevel/TotalExperience")
if v53 then
	v53:Connect(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_19
		v_u_39()
		v_u_19()
	end)
end
return v12