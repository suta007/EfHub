local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
game:GetService("RunService")
local v_u_4 = require(v1.Modules.DataService)
local v_u_5 = require(v1.Modules.SeasonPass.SeasonPassUtils)
local v_u_6 = require(v1.Modules.MarketController)
local v_u_7 = require(v1.Data.DevProductIds)
local v_u_8 = require(v1.Data.SeasonPass.SkipTierData)
local v_u_9 = require(v1.Data.SeasonPass.SeasonPassData)
local v_u_10 = require(v1.Modules.GardenGuideModules.ImageCycle)
local v_u_11 = require(v1.Modules.SeasonPass.SeasonPassButtonEffects)
local v_u_12 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v13 = v1.GameEvents
local v_u_14 = v13.SeasonPass.ClaimSeasonPassReward
local v15 = v13.SeasonPass.ProgressSeasonPassBar
local v_u_16 = v13.SeasonPass.ClaimSeasonPassInfReward
local v_u_17 = {}
local v_u_18 = v3.LocalPlayer
local v19 = v_u_18.PlayerGui.SeasonPassUI
local v_u_20 = v19.SeasonPassTemplates
local v_u_21 = v19.SeasonPassFrame.Main.Rewards.ScrollingFrame.Rewards
local v_u_22 = v_u_21.InfReward
local v_u_23 = v19.SeasonPassFrame.Main.Rewards.BPLevel
local v_u_24 = v_u_23.Fill
local v_u_25 = v_u_23.LvlDisplay.TextLabel
local v_u_26 = v19.SeasonPassFrame.Main.Quests.BPLevel
local v_u_27 = v_u_26.Fill
local v_u_28 = v_u_26.LvlDisplay.TextLabel
local v_u_29 = v19.SeasonPassFrame.Main.Rewards.ScrollingFrame.FillProg
local v_u_30 = v19.SeasonPassFrame.Main.Rewards.ScrollingFrame.Progress.Size.X.Scale
local v_u_31 = v19.SeasonPassFrame.Main.Rewards.SkipOptions
local v_u_32 = v_u_18.PlayerGui.Hud_UI.SideBtns.Pass.Notify
local v_u_33 = {}
local v_u_34 = {}
local v_u_35 = {}
local v_u_36 = 0
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = v_u_12.MAX_LEVEL
local function v_u_47(p42, p43, p44, p45)
	-- upvalues: (copy) v_u_2
	local v46 = math.sqrt(p45) * 0.05
	return v_u_2:Create(p42, TweenInfo.new(v46, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		["Size"] = UDim2.fromScale(math.clamp(p43, 0, p44), p42.Size.Y.Scale)
	})
end
local function v_u_62(p48)
	-- upvalues: (copy) v_u_5, (copy) v_u_31, (copy) v_u_24, (copy) v_u_27, (copy) v_u_23, (copy) v_u_26, (copy) v_u_22, (copy) v_u_4, (copy) v_u_41, (copy) v_u_9, (copy) v_u_12, (copy) v_u_2, (copy) v_u_33, (ref) v_u_36, (copy) v_u_32
	v_u_5.ToggleButton(v_u_31.All, false)
	v_u_24.Size = UDim2.fromScale(1, v_u_24.Size.Y.Scale)
	v_u_27.Size = UDim2.fromScale(v_u_24.Size.X.Scale, v_u_27.Size.Y.Scale)
	v_u_23.Exp.Text = "COMPLETED"
	v_u_26.Exp.Text = v_u_23.Exp.Text
	v_u_22.Image.Locked.Visible = false
	local v49 = v_u_4:GetData()
	if v49 then
		local v50 = p48 - v_u_5.CalculateXPForLevel(v_u_41)
		local v51 = v49.SeasonPass[v_u_9.CurrentSeason].InfRewardsClaimed
		local v52 = v_u_5.CalculateInfClaimCount(p48, v51)
		local v53 = v_u_12.INF_REWARD_XP
		local v54 = v50 - v51 * v53
		v_u_22.Image.Progress.Text = ("%*/%*XP"):format(math.clamp(v54, 0, v53), v53)
		local v55 = v_u_22.Image.ClaimInfReward
		local v_u_56 = v55.ClaimCountNotif
		local v57 = v_u_56.Count
		v_u_56.Visible = v52 >= 1
		v57.Text = v52
		task.spawn(function()
			-- upvalues: (copy) v_u_56, (ref) v_u_2, (ref) v_u_33
			local v58 = v_u_56:FindFirstChild("UIScale")
			local v59 = v_u_2:Create(v58, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["Scale"] = 1.25
			})
			local v60 = v_u_2:Create(v58, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				["Scale"] = 1
			})
			if not v_u_33[v_u_56.Name] then
				v_u_33[v_u_56.Name] = { v59, v60 }
				while v_u_33[v_u_56.Name] do
					v59:Play()
					v59.Completed:Wait()
					v60:Play()
					v60.Completed:Wait()
				end
			end
		end)
		v_u_5.ToggleButton(v55, v52 >= 1)
		local v61
		if v52 >= 1 then
			v61 = v_u_36 + 1
		else
			v61 = v_u_36
		end
		v_u_36 = v61
		v_u_32.Visible = v52 >= 1
	else
		warn("No player data")
	end
end
local function v_u_76(p63, p64)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_23, (copy) v_u_25, (copy) v_u_41, (copy) v_u_28, (copy) v_u_9, (copy) v_u_5, (ref) v_u_36, (copy) v_u_32
	local v65 = v_u_4:GetData()
	if v65 then
		local v66 = v_u_2:Create(v_u_23.LvlDisplay.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			["Scale"] = 1.15
		})
		v66:Play()
		v66.Completed:Wait()
		local v67 = v_u_25
		local v68 = p64 + 1
		local v69 = v_u_41
		v67.Text = math.min(v68, v69)
		v_u_28.Text = v_u_25.Text
		v_u_2:Create(v_u_23.LvlDisplay.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			["Scale"] = 1
		}):Play()
		local v70 = p63:FindFirstChild((("Premium%*"):format(p64)))
		local v71 = p63:FindFirstChild((("Free%*"):format(p64)))
		if not (v70 and v71) then
			warn((("Missing RewardFrames for Premium and/or Free Tier %*"):format(p64)))
		end
		local v72 = v70.Claim
		local v73 = v71.Claim
		local v74 = table.find(v65.SeasonPass[v_u_9.CurrentSeason].ClaimedLevelPremiumRewards, p64)
		if not table.find(v65.SeasonPass[v_u_9.CurrentSeason].ClaimedLevelFreeRewards, p64) then
			v71.Locked.Visible = false
			v71.Checkmark.Visible = false
			v_u_5.ToggleButton(v73, true)
			v_u_36 = v_u_36 + 1
			v_u_32.Visible = true
		end
		if not v74 and v65.SeasonPass[v_u_9.CurrentSeason].IsPremium then
			v70.Locked.Visible = false
			v70.Checkmark.Visible = false
			v_u_5.ToggleButton(v72, v65.SeasonPass[v_u_9.CurrentSeason].IsPremium)
			v_u_36 = v_u_36 + 1
			v_u_32.Visible = true
		end
		local v75 = p63:FindFirstChild((("Tier%*"):format(p64)))
		v75.Image = "rbxassetid://89980127975261"
		v75.Visible = true
	else
		warn("SeasonPassUIController | No player data")
	end
end
local function v_u_116()
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_20, (copy) v_u_10, (copy) v_u_35, (copy) v_u_11, (copy) v_u_14, (ref) v_u_36, (copy) v_u_32, (copy) v_u_41, (copy) v_u_34, (copy) v_u_21, (copy) v_u_76, (copy) v_u_25, (copy) v_u_28, (copy) v_u_47, (copy) v_u_29, (copy) v_u_30, (copy) v_u_24, (copy) v_u_27, (copy) v_u_23, (copy) v_u_26, (copy) v_u_22, (copy) v_u_12, (ref) v_u_37, (copy) v_u_62, (ref) v_u_40, (ref) v_u_39, (copy) v_u_16
	local v_u_77 = v_u_4:GetData()
	if v_u_77 then
		local v78 = v_u_77.SeasonPass[v_u_9.CurrentSeason].TotalExperience
		local v_u_79 = v_u_5.CalculateLevel(v78)
		local v_u_80 = v_u_20.RewardFrameTemplate
		local v_u_81 = v_u_20.FinalRewardFrameTemplate
		local function v_u_92(p_u_82, p83, p_u_84, p_u_85)
			-- upvalues: (ref) v_u_9, (ref) v_u_10, (copy) v_u_77, (ref) v_u_5, (ref) v_u_35, (ref) v_u_11, (ref) v_u_14, (ref) v_u_36, (ref) v_u_32
			local v86 = v_u_9[("%*Rewards"):format(p_u_85)][p_u_84]
			if v86 then
				p_u_82.Name = ("%*%*"):format(p_u_85, p_u_84)
				p_u_82.Visible = false
				local v87 = p_u_82.Vector
				v_u_10.CycleRewardImages(v87, p_u_82.TextLabel, nil, p_u_82, v86, true)
				p_u_82.Visible = true
				local v88 = table.find(v_u_77.SeasonPass[v_u_9.CurrentSeason][("ClaimedLevel%*Rewards"):format(p_u_85)], p_u_84) and true or false
				p_u_82.Checkmark.Visible = v88
				if p_u_85 == "Premium" then
					p_u_82.Locked.Visible = p83 < p_u_84 and true or not v_u_77.SeasonPass[v_u_9.CurrentSeason].IsPremium
				else
					p_u_82.Locked.Visible = p83 < p_u_84
				end
				v_u_5.ToggleButton(p_u_82.Claim, false)
				if v_u_35[("%*%*"):format(p_u_85, p_u_84)] then
					v_u_35[("%*%*"):format(p_u_85, p_u_84)][1]:Disconnect()
					v_u_35[("%*%*"):format(p_u_85, p_u_84)][2]:Disconnect()
					v_u_35[("%*%*"):format(p_u_85, p_u_84)] = nil
				end
				local v_u_89 = nil
				local v_u_90 = p_u_82.Claim.Activated:Once(function()
					-- upvalues: (ref) v_u_11, (ref) v_u_14, (copy) p_u_84, (copy) p_u_85, (copy) p_u_82, (ref) v_u_5, (ref) v_u_89, (ref) v_u_36, (ref) v_u_32
					v_u_11.Click()
					v_u_14:FireServer(p_u_84, p_u_85 == "Premium")
					p_u_82.Checkmark.Visible = true
					v_u_5.ToggleButton(p_u_82.Claim, false)
					v_u_89:Disconnect()
					v_u_36 = v_u_36 - 1
					v_u_32.Visible = v_u_36 > 0
				end)
				v_u_89 = p_u_82.Claim.MouseEnter:Connect(function()
					-- upvalues: (ref) v_u_11
					v_u_11.Hover()
				end)
				p_u_82.Claim.Destroying:Once(function()
					-- upvalues: (ref) v_u_90, (ref) v_u_89
					v_u_90:Disconnect()
					v_u_89:Disconnect()
				end)
				local v91 = { v_u_90, v_u_89 }
				v_u_35[("%*%*"):format(p_u_85, p_u_84)] = v91
			else
				warn((("No rewards for %* %*"):format(p_u_85, p_u_84)))
			end
		end
		for v_u_93 = 1, v_u_41 do
			task.spawn(function()
				-- upvalues: (copy) v_u_93, (ref) v_u_41, (copy) v_u_81, (copy) v_u_80, (ref) v_u_34, (ref) v_u_21, (copy) v_u_92, (copy) v_u_79, (ref) v_u_76
				local v94
				if v_u_93 == v_u_41 then
					v94 = v_u_81
				else
					v94 = v_u_80
				end
				local v95 = v_u_34[v_u_93]
				if not v95 then
					v95 = v94:Clone()
					v95.Name = ("Tier%*RewardFrame"):format(v_u_93)
					v95.LayoutOrder = v_u_93
					v95.Parent = v_u_21
					v_u_34[v_u_93] = v95
				end
				local v96 = v95:FindFirstChild("Free") or v95:FindFirstChild((("Free%*"):format(v_u_93)))
				local v97 = v95:FindFirstChild("Premium") or v95:FindFirstChild((("Premium%*"):format(v_u_93)))
				v_u_92(v96, v_u_79, v_u_93, "Free")
				v_u_92(v97, v_u_79, v_u_93, "Premium")
				v95.Visible = true
				local v98 = v95:FindFirstChild("Number") or v95:FindFirstChild((("Tier%*"):format(v_u_93)))
				v98.Name = ("Tier%*"):format(v_u_93)
				v98.Image = v_u_79 < v_u_93 and "rbxassetid://94566582297171" or "rbxassetid://89980127975261"
				v98:FindFirstChild("TextLabel").Text = ("%*"):format(v_u_93)
				v98.Visible = true
				if v_u_93 <= v_u_79 then
					v_u_76(v95, v_u_93)
				end
			end)
		end
		local v99 = v_u_25
		local v100 = v_u_79 + 1
		local v101 = v_u_41
		v99.Text = math.min(v100, v101)
		v_u_28.Text = v_u_25.Text
		v_u_47(v_u_29, (v_u_79 + v_u_5.GetXPFractionOfCurrentLevel(v78)) / v_u_41 * v_u_30, v_u_30, v_u_79):Play()
		local v102 = v_u_5.GetTotalXPForNextLevel(v78)
		local v103 = v_u_5.GetXPEarnedCurrentLevel(v78)
		local v104 = v103 / v102
		local v105 = math.clamp(v104, 0, 1)
		v_u_24.Size = UDim2.fromScale(v105, v_u_24.Size.Y.Scale)
		v_u_27.Size = UDim2.fromScale(v_u_24.Size.X.Scale, v_u_27.Size.Y.Scale)
		v_u_23.Exp.Text = ("%*/%*"):format(v103, v102)
		v_u_26.Exp.Text = v_u_23.Exp.Text
		local v_u_106 = v_u_41 + 1
		local v107 = v_u_22.Image.Vector
		local v108 = v_u_22.Image.TextLabel
		local v109 = v_u_9.InfRewards
		v_u_22.Visible = false
		v_u_10.CycleRewardImages(v107, v108, nil, v_u_22, v109, true)
		v_u_22.Visible = true
		v_u_22.Image.Locked.Visible = v_u_79 < v_u_106
		v_u_22.LayoutOrder = v_u_106
		local v110 = v78 - v_u_5.CalculateXPForLevel(v_u_41)
		local v111 = v_u_77.SeasonPass[v_u_9.CurrentSeason].InfRewardsClaimed
		local v112 = v_u_12.INF_REWARD_XP
		local v113 = v110 - v111 * v112
		v_u_22.Image.Progress.Text = ("%*/%*XP"):format(math.clamp(v113, 0, v112), v112)
		v_u_5.ToggleButton(v_u_22.Image.ClaimInfReward, false)
		if v_u_37 then
			v_u_37:Disconnect()
			local v114 = v_u_4:GetPathSignal((("SeasonPass/%*/InfRewardsClaimed/@"):format(v_u_9.CurrentSeason)))
			if v114 then
				v_u_37 = v114:Connect(function(_, _, _)
					-- upvalues: (ref) v_u_4, (ref) v_u_62, (ref) v_u_9
					local v115 = v_u_4:GetData()
					if v115 then
						v_u_62(v115.SeasonPass[v_u_9.CurrentSeason].TotalExperience)
					else
						warn("No player data")
					end
				end)
			end
		end
		if v_u_40 then
			v_u_40:Disconnect()
		end
		if v_u_39 then
			v_u_39:Disconnect()
		end
		v_u_40 = v_u_22.Image.ClaimInfReward.Activated:Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_16, (copy) v_u_106, (ref) v_u_22, (ref) v_u_12, (ref) v_u_5, (ref) v_u_39
			v_u_11.Click()
			v_u_16:FireServer(v_u_106, false)
			v_u_22.Image.Progress.Text = ("0/%*XP"):format(v_u_12.INF_REWARD_XP)
			v_u_5.ToggleButton(v_u_22.Image.ClaimInfReward, false)
			v_u_39:Disconnect()
		end)
		v_u_39 = v_u_22.Image.ClaimInfReward.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_11
			v_u_11.Hover()
		end)
		if v_u_41 <= v_u_79 then
			v_u_62(v78)
		end
	else
		warn("No player data")
	end
end
local v_u_117 = {}
local v_u_118 = {}
local function v_u_136()
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_9, (copy) v_u_31, (copy) v_u_117, (copy) v_u_11, (copy) v_u_7, (copy) v_u_6, (copy) v_u_41, (ref) v_u_118, (copy) v_u_8
	local v119 = v_u_4:GetData()
	if v119 then
		local v120 = v_u_5.CalculateLevel(v119.SeasonPass[v_u_9.CurrentSeason].TotalExperience)
		local v121 = v_u_31.Tier
		if #v_u_117 == 0 then
			local v123 = v121.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_7, (ref) v_u_6
				v_u_11.Click()
				local v122 = v_u_7.SkipSeasonPassTier.PurchaseID
				if v122 == 0 or not v122 then
					warn("Warning: DevProdID is 0")
				else
					v_u_6:PromptPurchase(v122, Enum.InfoType.Product)
				end
			end)
			local v124 = v121.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			local v125 = v_u_117
			table.insert(v125, v123)
			local v126 = v_u_117
			table.insert(v126, v124)
		end
		local v127 = v_u_31.All
		if v_u_41 <= v120 then
			v_u_5.ToggleButton(v127, false)
			if v_u_118[1] then
				v_u_118[1]:Disconnect()
				v_u_118[2]:Disconnect()
				v_u_118 = {}
			end
		else
			v_u_5.ToggleButton(v127, true, "Gold")
		end
		if #v_u_118 == 0 then
			local v132 = v127.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_4, (ref) v_u_9, (ref) v_u_5, (ref) v_u_8, (ref) v_u_6
				v_u_11.Click()
				local v128 = v_u_4:GetData()
				if v128 then
					local v129 = v128.SeasonPass[v_u_9.CurrentSeason].TotalExperience
					local v130 = v_u_5.CalculateLevel(v129)
					local v131 = v_u_8.GetSkipAllId(v130)
					if v131 and v131 ~= 0 then
						v_u_6:PromptPurchase(v131, Enum.InfoType.Product)
					end
				else
					warn("No player data")
					return
				end
			end)
			local v133 = v127.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Hover()
			end)
			local v134 = v_u_118
			table.insert(v134, v132)
			local v135 = v_u_118
			table.insert(v135, v133)
		end
	end
end
function v_u_17.Start()
	-- upvalues: (copy) v_u_4, (copy) v_u_116, (copy) v_u_136
	if v_u_4:GetData() then
		v_u_116()
		v_u_136()
	else
		warn("No player data")
	end
end
function v_u_17.UpdateRewardsTrack()
	-- upvalues: (copy) v_u_21, (copy) v_u_34, (copy) v_u_32, (ref) v_u_38, (copy) v_u_4, (copy) v_u_9, (copy) v_u_17, (copy) v_u_18, (ref) v_u_36, (copy) v_u_116, (copy) v_u_5, (copy) v_u_41, (copy) v_u_31
	for _, v137 in v_u_21:GetChildren() do
		if v137:IsA("Frame") and v137.Name ~= "InfReward" then
			v137:Destroy()
		end
	end
	table.clear(v_u_34)
	v_u_32.Visible = false
	if v_u_38 then
		v_u_38:Disconnect()
		local v138 = v_u_4:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_9.CurrentSeason)))
		if v138 then
			v_u_38 = v138:Connect(v_u_17.Start)
		end
	end
	task.wait(1)
	v_u_18.PlayerGui.Hud_UI.SideBtns.Pass.Activated:Once(function()
		-- upvalues: (ref) v_u_32
		v_u_32.Visible = false
	end)
	v_u_36 = 0
	v_u_116()
	local v139 = v_u_4:GetData()
	if v139 then
		local v140 = v139.SeasonPass[v_u_9.CurrentSeason].TotalExperience
		if v_u_5.CalculateLevel(v140) < v_u_41 then
			v_u_5.ToggleButton(v_u_31.All, true, "Gold")
		else
			v_u_5.ToggleButton(v_u_31.All, false)
		end
	else
		return
	end
end
v15.OnClientEvent:Connect(function(p_u_141, p_u_142)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_41, (copy) v_u_23, (copy) v_u_26, (copy) v_u_62, (copy) v_u_47, (copy) v_u_24, (copy) v_u_27, (copy) v_u_29, (copy) v_u_30, (copy) v_u_21, (copy) v_u_76
	task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) p_u_142, (copy) p_u_141, (ref) v_u_41, (ref) v_u_23, (ref) v_u_26, (ref) v_u_62, (ref) v_u_47, (ref) v_u_24, (ref) v_u_27, (ref) v_u_29, (ref) v_u_30, (ref) v_u_21, (ref) v_u_76
		if not v_u_4:GetData() then
			warn("SeasonPassUIController | No player data")
			return
		end
		local v143 = v_u_5.CalculateLevel(p_u_142)
		local v144 = v_u_5.CalculateLevel(p_u_141)
		local v145 = p_u_142 - p_u_141
		local v146 = p_u_141
		local function v150(p147)
			-- upvalues: (ref) v_u_5, (ref) v_u_41, (ref) v_u_23, (ref) v_u_26
			local v148 = v_u_5.CalculateXPForLevel(p147)
			local v149 = v_u_5.CalculateXPForLevel(p147 + 1) - v148
			if v_u_41 <= p147 then
				v_u_23.Exp.Text = "COMPLETED"
				v_u_26.Exp.Text = v_u_23.Exp.Text
			else
				v_u_23.Exp.Text = ("0/%*"):format(v149)
				v_u_26.Exp.Text = v_u_23.Exp.Text
			end
		end
		local v151 = v144
		while true do
			local v152 = v_u_5.GetXPEarnedCurrentLevel(v146)
			local v153 = v_u_5.GetTotalXPForNextLevel(v146)
			local v154 = v153 - v152
			if v145 - v154 <= 0 then
				v154 = v145
			end
			v146 = v146 + v154
			v145 = v145 - v154
			v150(v144)
			local v155 = v_u_5.CalculateLevel(v146)
			local v156 = v146 - v_u_5.CalculateXPForLevel(v_u_41)
			if v156 >= 1 then
				v_u_62(p_u_142)
				return
			end
			if v156 == 0 then
				v_u_62(p_u_142)
			end
			local v157 = (v152 + v154) / v153
			local v158 = math.clamp(v157, 0, 1)
			local v159 = v_u_47(v_u_24, v158, 1, v143)
			local v160 = v_u_47(v_u_27, v158, 1, v155)
			local v161 = v_u_47(v_u_29, (v155 + v_u_5.GetXPFractionOfCurrentLevel(v146)) / v_u_41 * v_u_30, v_u_30, v143)
			v160:Play()
			v159:Play()
			local v162 = v_u_5.CalculateXPForLevel(v155)
			local v163 = v_u_5.CalculateXPForLevel(v155 + 1) - v162
			v_u_23.Exp.Text = ("%*/%*"):format(v152 + v154, v163)
			v_u_26.Exp.Text = v_u_23.Exp.Text
			v161:Play()
			v161.Completed:Wait()
			if v151 < v155 then
				v150(v155)
				v_u_76(v_u_21:FindFirstChild((("Tier%*RewardFrame"):format(v155))), v155)
				v151 = v155
			end
			local v164 = math.sqrt(v143) * 0.01
			task.wait(v164 * 0.5)
			if v_u_24.Size.X.Scale == 1 and v155 < 50 then
				v_u_24.Size = UDim2.fromScale(0, v_u_24.Size.Y.Scale)
				v_u_27.Size = UDim2.fromScale(v_u_24.Size.X.Scale, v_u_27.Size.Y.Scale)
			end
			if v145 <= 0 then
				return
			end
		end
	end)
end)
local v165 = v_u_4:GetPathSignal((("SeasonPass/%*/IsPremium/@"):format(v_u_9.CurrentSeason)))
if v165 then
	v_u_38 = v165:Connect(function(_, _, _)
		-- upvalues: (copy) v_u_17
		v_u_17.UpdateRewardsTrack()
		v_u_17.Start()
	end)
end
local v166 = v_u_4:GetPathSignal((("SeasonPass/%*/InfRewardsClaimed/@"):format(v_u_9.CurrentSeason)))
if v166 then
	v_u_37 = v166:Connect(function(_, _, _)
		-- upvalues: (copy) v_u_4, (copy) v_u_62, (copy) v_u_9
		local v167 = v_u_4:GetData()
		if v167 then
			v_u_62(v167.SeasonPass[v_u_9.CurrentSeason].TotalExperience)
		else
			warn("No player data")
		end
	end)
end
return v_u_17