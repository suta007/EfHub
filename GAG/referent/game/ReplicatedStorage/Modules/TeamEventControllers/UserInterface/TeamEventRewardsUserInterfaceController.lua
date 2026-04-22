local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ContextActionService")
local v_u_6 = v1.LocalPlayer
local v_u_7 = v_u_6:WaitForChild("PlayerGui"):WaitForChild("TeamEventRewards_UI")
local v_u_8 = v_u_7.Rewards.Main.TierRewards
local v_u_9 = {
	["Basic"] = v_u_8:WaitForChild("BasicTemplate"),
	["Mid"] = v_u_8:WaitForChild("MidTemplate"),
	["Best"] = v_u_8:WaitForChild("BestTemplate")
}
local _ = v_u_9.Basic
local v_u_10 = v_u_7.Rewards.Main.ProgressHolder.ProgressionContainer
local v_u_11 = v_u_7.Rewards.Header.CloseButton
local v12 = v_u_7.Rewards.Header.YourRewardsButton
local v13 = v_u_7.Rewards.Header.TeamRewardsButton
local v_u_14 = v_u_7.Rewards.Header.TitleText
local v_u_15 = v_u_7.Rewards.Main.ProgressHolder
local v_u_16 = v_u_7.Rewards.Main.ProgressHolder.ProgressBar
local v_u_17 = v_u_7.Rewards.Main.NotInTeam
local v_u_18 = v_u_7.Rewards
local v_u_19 = v_u_18.Size
local v_u_20 = v_u_7.Rewards.Shadow
local v_u_21 = v_u_20:WaitForChild("TeamRewardsCountdownTitle")
local v_u_22 = v_u_21:WaitForChild("UIStroke")
local v_u_23 = require(v2.Modules.TeamEventControllers.TeamEventController)
local v_u_24 = require(v2.Modules.TeamEventHelper)
local v_u_25 = require(v2.Modules.GuiController)
local v_u_26 = require(v2.Field_Of_View_Module)
local v_u_27 = require(v2.Blur_Module)
local v_u_28 = require(v2.Modules.DataService)
local v_u_29 = require(v2.Modules.SetupButton)
local v_u_30 = require(v2.Modules.ItemImageFinder)
local v_u_31 = require(v2.Modules.SeedPackOddsController)
local v_u_32 = require(v2.Modules.PetEggOddsController)
local v_u_33 = require(v2.Modules.CosmeticCrateOddsController)
local v_u_34 = require(v2.Modules.TimeHelper)
local v_u_35 = v_u_25:GetStateForGui(v_u_7)
v_u_35.ChangeEnabled:Set(true)
local v_u_36 = Color3.fromRGB(0, 255, 21)
local v_u_37 = Color3.fromRGB(191, 107, 70)
local v_u_38 = {
	["State"] = {
		["Visible"] = false,
		["GeneratedFrames"] = {},
		["SelectedEvent"] = "CandyPackaging",
		["SelectedRewardView"] = "YourRewards",
		["LerpConnection"] = nil,
		["ActivatedTiers"] = {},
		["CountdownConnection"] = nil,
		["ScrollOffset"] = 0,
		["TotalRewardsCount"] = 0,
		["OddsConnections"] = {}
	}
}
local function v_u_43()
	-- upvalues: (copy) v_u_38, (copy) v_u_24, (copy) v_u_21, (copy) v_u_23, (copy) v_u_6, (copy) v_u_17, (copy) v_u_34
	local v39 = v_u_38.State
	local v40 = v_u_24.Events[v39.SelectedEvent]
	if v40 then
		local v41 = v40.EndTime - workspace:GetServerTimeNow()
		if v41 <= 0 then
			if v_u_23:GetTeamId(v39.SelectedEvent, v_u_6) ~= nil then
				v_u_21.Text = "Team rewards have been delivered!"
			else
				v_u_21.Text = "Rewards have been given to those in teams!"
				local v42 = v_u_17:FindFirstChild("Subtext")
				if v42 then
					v42.Text = "Event ended: Can\'t join team anymore"
				end
			end
		else
			v_u_21.Text = ("Team rewards arrive in %*"):format((v_u_34:GetLargestTime(v41, "floor", 2)))
			return
		end
	else
		v_u_21.Text = ""
		return
	end
end
local function v_u_47(p44)
	-- upvalues: (copy) v_u_3
	local v45 = p44:FindFirstChildWhichIsA("Frame")
	local v46
	if v45 then
		v46 = v45:FindFirstChildWhichIsA("ImageLabel")
	else
		v46 = v45
	end
	p44.BackgroundTransparency = 1
	p44.Visible = true
	v_u_3:Create(p44, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["BackgroundTransparency"] = 0.55
	}):Play()
	if v45 then
		v45.Size = UDim2.fromScale(0, 0)
		v45.Rotation = -15
		v_u_3:Create(v45, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["Size"] = UDim2.fromScale(0.4, 0.4),
			["Rotation"] = 0
		}):Play()
	end
	if v46 then
		v46.ImageColor3 = Color3.fromRGB(100, 255, 100)
		v_u_3:Create(v46, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["ImageColor3"] = Color3.fromRGB(255, 255, 255)
		}):Play()
	end
end
local function v_u_50(p_u_48)
	-- upvalues: (copy) v_u_3
	local v49 = p_u_48:FindFirstChildWhichIsA("Frame")
	v_u_3:Create(p_u_48, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		["BackgroundTransparency"] = 1
	}):Play()
	if v49 then
		v_u_3:Create(v49, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			["Size"] = UDim2.fromScale(0, 0),
			["Rotation"] = 15
		}):Play()
	end
	task.delay(0.25, function()
		-- upvalues: (copy) p_u_48
		p_u_48.Visible = false
	end)
end
local function v_u_53(p51)
	-- upvalues: (copy) v_u_3
	local v52 = p51:FindFirstChildWhichIsA("ImageLabel")
	p51.BackgroundTransparency = 1
	p51.Visible = true
	v_u_3:Create(p51, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["BackgroundTransparency"] = 0.55
	}):Play()
	if v52 then
		v52.ImageTransparency = 1
		v_u_3:Create(v52, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["ImageTransparency"] = 0
		}):Play()
	end
end
local function v_u_56(p_u_54)
	-- upvalues: (copy) v_u_3
	v_u_3:Create(p_u_54, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		["BackgroundTransparency"] = 1
	}):Play()
	local v55 = p_u_54:FindFirstChildWhichIsA("ImageLabel")
	if v55 then
		v_u_3:Create(v55, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["ImageTransparency"] = 1
		}):Play()
	end
	task.delay(0.25, function()
		-- upvalues: (copy) p_u_54
		p_u_54.Visible = false
	end)
end
local function v_u_61(p57, p58)
	-- upvalues: (copy) v_u_56, (copy) v_u_47, (copy) v_u_50, (copy) v_u_53
	local v59 = p57.CompletedFrame
	local v60 = p57:FindFirstChild("WillGetFrame")
	if p58 == "completed" then
		if v60 then
			v_u_56(v60)
		end
		v_u_47(v59)
	elseif p58 == "willget" then
		v_u_50(v59)
		if v60 then
			v_u_53(v60)
		end
	end
end
local function v_u_68(p62, p63)
	local v64 = p62.CompletedFrame
	local v65 = p62:FindFirstChild("WillGetFrame")
	if p63 == "completed" then
		v64.BackgroundTransparency = 0.55
		v64.Visible = true
		local v66 = v64:FindFirstChildWhichIsA("Frame")
		if v66 then
			v66.Size = UDim2.fromScale(0.4, 0.4)
			v66.Rotation = 0
		end
		if v65 then
			v65.Visible = false
			return
		end
	elseif p63 == "willget" then
		v64.Visible = false
		if v65 then
			v65.BackgroundTransparency = 0.55
			v65.Visible = true
			local v67 = v65:FindFirstChildWhichIsA("ImageLabel")
			if v67 then
				v67.ImageTransparency = 0
				return
			end
		end
	else
		v64.Visible = false
		if v65 then
			v65.Visible = false
		end
	end
end
local v_u_81 = {
	["YourRewards"] = {
		["Button"] = v12,
		["PageText"] = "Your Rewards",
		["RewardIndexer"] = "PersonalRewards",
		["AgregatePoints"] = function()
			-- upvalues: (copy) v_u_38, (copy) v_u_28
			local v69 = v_u_38.State.SelectedEvent
			local v70 = v_u_28:GetData().TeamEventData[v69] or {}
			return v70 and v70.Points or 0
		end
	},
	["TeamRewards"] = {
		["Button"] = v13,
		["PageText"] = "Team Rewards",
		["RewardIndexer"] = "TeamRewards",
		["AgregatePoints"] = function()
			-- upvalues: (copy) v_u_38, (copy) v_u_23, (copy) v_u_6
			local v71 = v_u_38.State
			local v72 = v71.SelectedEvent
			local _ = v71.SelectedRewardView
			local v73 = v_u_23:GetCachedData() or {}
			local v74 = v73 and v73[v72] or {}
			for v77, v76 in v74 do
				if v76.members[v_u_6.UserId] ~= nil then
					goto l9
				end
			end
			local v77 = nil
			::l9::
			local v78 = v74 and v74[v77] or {}
			local v79 = 0
			for _, v80 in v78 and v78.members or {} do
				v79 = v79 + v80
			end
			return v79
		end
	}
}
local function v_u_85(p82)
	local v83 = 0
	for v84 in p82 do
		if string.match(v84, "^Tier%d+$") then
			v83 = v83 + 1
		end
	end
	return v83
end
function v_u_38.ScrollTo(_, p86)
	-- upvalues: (copy) v_u_38
	local v87 = v_u_38.State
	local v88 = v87.TotalRewardsCount - 8
	local v89 = math.max(0, v88)
	local v90 = math.clamp(p86, 0, v89)
	if v90 ~= v87.ScrollOffset then
		v87.ScrollOffset = v90
		if v87.LerpConnection then
			v87.LerpConnection:Disconnect()
			v87.LerpConnection = nil
		end
		v_u_38:Render(true)
	end
end
function v_u_38.Render(_, p91)
	-- upvalues: (copy) v_u_38, (copy) v_u_81, (copy) v_u_3, (copy) v_u_24, (copy) v_u_85, (copy) v_u_23, (copy) v_u_6, (copy) v_u_28, (copy) v_u_17, (copy) v_u_9, (copy) v_u_8, (copy) v_u_30, (copy) v_u_31, (copy) v_u_7, (copy) v_u_32, (copy) v_u_33, (copy) v_u_10, (copy) v_u_36, (copy) v_u_68, (copy) v_u_37, (copy) v_u_15, (copy) v_u_16, (copy) v_u_4, (copy) v_u_61, (copy) v_u_50, (copy) v_u_56, (copy) v_u_14, (copy) v_u_20, (copy) v_u_43, (copy) v_u_21, (copy) v_u_22
	local v_u_92 = v_u_38.State
	local v93 = v_u_92.SelectedEvent
	local v94 = v_u_92.SelectedRewardView
	for v95, v96 in v_u_81 do
		if v95 ~= v94 then
			local v97 = v96.Button:FindFirstChild("Claim")
			if v97 then
				v97 = v97:FindFirstChildWhichIsA("UIStroke")
			end
			if v97 then
				v_u_3:Create(v97, TweenInfo.new(0.2), {
					["Color"] = v97:GetAttribute("DefaultStrokeColor")
				}):Play()
			end
		end
	end
	local v98 = v_u_81[v94] or {}
	local v99 = v98.Button
	if v99 then
		v99 = v99:FindFirstChild("Claim")
	end
	if v99 then
		v99 = v99:FindFirstChildWhichIsA("UIStroke")
	end
	if v99 then
		v_u_3:Create(v99, TweenInfo.new(0.2), {
			["Color"] = v99:GetAttribute("DefaultStrokeColor"):Lerp(Color3.fromRGB(255, 255, 255), 0.8)
		}):Play()
	end
	local v100 = (v_u_24.Events[v93] or {})[v98.RewardIndexer] or {}
	local v101 = v_u_85(v100)
	v_u_92.TotalRewardsCount = v101
	local v102 = v_u_92.ScrollOffset
	if v_u_38.LeftArrow then
		v_u_38.LeftArrow.Visible = v102 > 0
	end
	if v_u_38.RightArrow then
		local v103 = v_u_38.RightArrow
		local v104 = v101 - 8
		v103.Visible = v102 < math.max(0, v104)
	end
	local v105 = v98.AgregatePoints and (v98.AgregatePoints() or 0) or 0
	local v106 = v94 == "TeamRewards"
	local v107 = v_u_23:GetTeamId(v93, v_u_6) ~= nil
	local v108
	if v106 then
		v108 = v_u_28:GetData()
		if v108 then
			v108 = v108.TeamEventData[v93]
		end
		if v108 then
			v108 = v108.Awarded == true
		end
	else
		v108 = false
	end
	local v109 = v_u_17
	local v110
	if v106 then
		v110 = not v107
	else
		v110 = v106
	end
	v109.Visible = v110
	local v111 = 0
	local v_u_112 = {}
	local v_u_113 = {}
	for v114 = 1, 8 do
		local v115 = v114 + v102
		local v116 = v100[("Tier%*"):format(v115)]
		local v117 = v_u_9[v116 and (v116.Template or "Basic") or "Basic"] or v_u_9.Basic
		local v118 = v_u_92.GeneratedFrames[v114]
		if v118 and v118:GetAttribute("TemplateType") ~= (v116 and (v116.Template or "Basic") or "Basic") then
			v118:Destroy()
			v118 = v117:Clone()
			v118:SetAttribute("TemplateType", v116 and (v116.Template or "Basic") or "Basic")
			v118.LayoutOrder = v114
			v118.Visible = true
			v118.Parent = v_u_8
			v_u_92.GeneratedFrames[v114] = v118
		end
		if v118 then
			v118.Visible = v116 ~= nil
			if v116 then
				local v119 = v116.RequiredPoints or 0
				v118.Inner:WaitForChild("PointAmountText").Text = v119
				local v120 = ""
				for _, v121 in v116.Rewards do
					local v122
					if v121.Variant then
						v122 = ("%* %*"):format(v121.Variant, v121.Value)
					else
						v122 = v121.Value
					end
					v120 = v120 .. ("x%* %*, "):format(v121.Quantity or 1, v122)
				end
				local v123 = (" %* "):format((v120:sub(1, #v120 - 2)))
				v118.Inner:WaitForChild("RewardNameText").Text = v123
				local v124 = v118.Inner:FindFirstChild("Vector")
				if v124 and v116.Rewards[1] then
					local v125 = v116.Rewards[1]
					v124.Image = v125.CustomImage or v_u_30(v125.Value, v125.Type)
				end
				if v_u_92.OddsConnections[v114] then
					v_u_92.OddsConnections[v114]:Disconnect()
					v_u_92.OddsConnections[v114] = nil
				end
				local v126 = v118.Inner:FindFirstChild("OddsButton")
				if v126 and v116.Rewards[1] then
					local v127 = v116.Rewards[1]
					local v_u_128 = v127.Type
					local v_u_129 = v127.Value
					if v_u_128 == "Seed Pack" or (v_u_128 == "Egg" or v_u_128 == "Crate") then
						v126.Visible = true
						v_u_92.OddsConnections[v114] = v126.Activated:Connect(function()
							-- upvalues: (copy) v_u_128, (ref) v_u_31, (copy) v_u_129, (ref) v_u_7, (ref) v_u_32, (ref) v_u_33
							if v_u_128 == "Seed Pack" then
								v_u_31:Open(v_u_129, v_u_7)
								return
							elseif v_u_128 == "Egg" then
								v_u_32:Open(v_u_129, v_u_7)
							elseif v_u_128 == "Crate" then
								v_u_33:Open(v_u_129, v_u_7)
							end
						end)
					else
						v126.Visible = false
					end
				end
				local v130 = v_u_10:FindFirstChild(v114)
				local v131 = v130 and (v130:FindFirstChildWhichIsA("TextLabel", true) or v130:FindFirstChildWhichIsA("TextButton", true))
				if v131 then
					v131.Text = ("%*."):format(v115)
				end
				local v132 = v119 <= v105
				local v133 = v132 and (v106 and not v108 and "willget" or "completed") or "none"
				if p91 then
					if v132 then
						if v130 then
							v130.Dot.Container.BackgroundColor3 = v_u_36
						end
						v_u_68(v118, v133)
						v_u_92.ActivatedTiers[v114] = true
					else
						if v130 then
							v130.Dot.Container.BackgroundColor3 = v_u_37
						end
						local v134 = v118.CompletedFrame
						local v135 = v118:FindFirstChild("WillGetFrame")
						v134.Visible = false
						if v135 then
							v135.Visible = false
						end
						v_u_92.ActivatedTiers[v114] = nil
					end
				else
					local v136 = v_u_92.ActivatedTiers[v114] == true
					if v132 and not v136 then
						if v130 then
							v130.Dot.Container.BackgroundColor3 = v_u_37
						end
						local v137 = v118.CompletedFrame
						local v138 = v118:FindFirstChild("WillGetFrame")
						v137.Visible = false
						if v138 then
							v138.Visible = false
						end
						table.insert(v_u_112, {
							["DotHolder"] = v130,
							["RewardFrame"] = v118,
							["FrameIndex"] = v114,
							["Activated"] = false,
							["OverlayType"] = v133
						})
					elseif v132 or not v136 then
						if not v132 then
							if v130 then
								v130.Dot.Container.BackgroundColor3 = v_u_37
							end
							local v139 = v118.CompletedFrame
							local v140 = v118:FindFirstChild("WillGetFrame")
							v139.Visible = false
							if v140 then
								v140.Visible = false
							end
						end
					else
						table.insert(v_u_113, {
							["DotHolder"] = v130,
							["RewardFrame"] = v118,
							["FrameIndex"] = v114,
							["Deactivated"] = false
						})
					end
				end
				if v132 and v111 < v114 then
					v111 = v114
				end
			else
				v_u_92.ActivatedTiers[v114] = nil
			end
		end
	end
	if v_u_92.LerpConnection then
		v_u_92.LerpConnection:Disconnect()
		v_u_92.LerpConnection = nil
	end
	local v141 = v_u_15.AbsolutePosition.X
	local v142 = v_u_15.AbsoluteSize.X
	local v_u_143 = {}
	local v144 = {}
	for v145 = 1, 8 do
		local v146 = v_u_10:FindFirstChild(v145)
		if v146 then
			v_u_143[v145] = (v146.AbsolutePosition.X + v146.AbsoluteSize.X / 2 - v141) / v142
		end
		local v147 = v100[("Tier%*"):format(v145 + v102)]
		if v147 then
			v144[v145] = v147.RequiredPoints or 0
		end
	end
	local v148 = v101 - v102
	local v_u_149
	if math.min(8, v148) <= v111 then
		v_u_149 = 1
	elseif v111 == 0 then
		local v150 = v105 / (v144[1] or 1)
		v_u_149 = math.clamp(v150, 0, 1) * (v_u_143[1] or 0)
	else
		local v151 = v_u_143[v111] or 0
		local v152 = v111 + 1
		local v153 = v_u_143[v152] or 1
		local v154 = v144[v111] or 0
		local v155 = (v144[v152] or v154) - v154
		local v156
		if v155 > 0 then
			local v157 = (v105 - v154) / v155
			v156 = math.clamp(v157, 0, 1)
		else
			v156 = 1
		end
		v_u_149 = v151 + (v153 - v151) * v156
	end
	if p91 then
		v_u_16.Size = UDim2.fromScale(v_u_149, 1)
	else
		local v_u_158 = v_u_16.Size.X.Scale
		v_u_92.LerpConnection = v_u_4.RenderStepped:Connect(function(p159)
			-- upvalues: (ref) v_u_158, (ref) v_u_149, (ref) v_u_16, (copy) v_u_112, (copy) v_u_143, (copy) v_u_92, (ref) v_u_3, (ref) v_u_36, (ref) v_u_61, (copy) v_u_113, (ref) v_u_37, (ref) v_u_50, (ref) v_u_56
			local v160 = v_u_158
			local v161 = v_u_149 - v_u_158
			local v162 = 5 * p159
			v_u_158 = v160 + v161 * math.min(1, v162)
			v_u_16.Size = UDim2.fromScale(v_u_158, 1)
			for _, v163 in v_u_112 do
				if not v163.Activated and v_u_158 >= (v_u_143[v163.FrameIndex] or 0) - 0.005 then
					v163.Activated = true
					v_u_92.ActivatedTiers[v163.FrameIndex] = true
					local v164 = {
						["BackgroundColor3"] = v_u_36
					}
					v_u_3:Create(v163.DotHolder.Dot.Container, TweenInfo.new(0.1), v164):Play()
					v_u_61(v163.RewardFrame, v163.OverlayType)
				end
			end
			for _, v165 in v_u_113 do
				if not v165.Deactivated and v_u_158 < (v_u_143[v165.FrameIndex] or 0) then
					v165.Deactivated = true
					v_u_92.ActivatedTiers[v165.FrameIndex] = nil
					local v166 = {
						["BackgroundColor3"] = v_u_37
					}
					v_u_3:Create(v165.DotHolder.Dot.Container, TweenInfo.new(0.2), v166):Play()
					local v167 = v165.RewardFrame
					v_u_50(v167.CompletedFrame)
					local v168 = v167:FindFirstChild("WillGetFrame")
					if v168 then
						v_u_56(v168)
					end
				end
			end
			local v169 = v_u_149 - v_u_158
			if math.abs(v169) < 0.001 then
				v_u_16.Size = UDim2.fromScale(v_u_149, 1)
				for _, v170 in v_u_112 do
					if not v170.Activated then
						v170.Activated = true
						v_u_92.ActivatedTiers[v170.FrameIndex] = true
						local v171 = {
							["BackgroundColor3"] = v_u_36
						}
						v_u_3:Create(v170.DotHolder.Dot.Container, TweenInfo.new(0.1), v171):Play()
						v_u_61(v170.RewardFrame, v170.OverlayType)
					end
				end
				for _, v172 in v_u_113 do
					if not v172.Deactivated then
						v172.Deactivated = true
						v_u_92.ActivatedTiers[v172.FrameIndex] = nil
						local v173 = {
							["BackgroundColor3"] = v_u_37
						}
						v_u_3:Create(v172.DotHolder.Dot.Container, TweenInfo.new(0.2), v173):Play()
						local v174 = v172.RewardFrame
						v_u_50(v174.CompletedFrame)
						local v175 = v174:FindFirstChild("WillGetFrame")
						if v175 then
							v_u_56(v175)
						end
					end
				end
				v_u_92.LerpConnection:Disconnect()
				v_u_92.LerpConnection = nil
			end
		end)
	end
	v_u_14.Text = v98 and v98.PageText or "Invalid Page"
	local v176 = v94 == "TeamRewards"
	if v_u_92.CountdownConnection then
		v_u_92.CountdownConnection:Disconnect()
		v_u_92.CountdownConnection = nil
	end
	if v176 then
		v_u_20.Visible = true
		v_u_43()
		v_u_3:Create(v_u_20, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["ImageTransparency"] = 0.5
		}):Play()
		v_u_3:Create(v_u_21, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["TextTransparency"] = 0
		}):Play()
		v_u_3:Create(v_u_22, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["Transparency"] = 0.43
		}):Play()
		local v_u_177 = 0
		v_u_92.CountdownConnection = v_u_4.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_177, (ref) v_u_43
			local v178 = os.clock()
			if v178 - v_u_177 >= 1 then
				v_u_177 = v178
				v_u_43()
			end
		end)
	else
		v_u_3:Create(v_u_20, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["ImageTransparency"] = 1
		}):Play()
		v_u_3:Create(v_u_21, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["TextTransparency"] = 1
		}):Play()
		v_u_3:Create(v_u_22, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Transparency"] = 1
		}):Play()
		task.delay(0.25, function()
			-- upvalues: (ref) v_u_38, (ref) v_u_20
			if v_u_38.State.SelectedRewardView ~= "TeamRewards" then
				v_u_20.Visible = false
			end
		end)
	end
end
function v_u_38.Toggle(_, p179)
	-- upvalues: (copy) v_u_38, (copy) v_u_16, (copy) v_u_10, (copy) v_u_37, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_5, (copy) v_u_25, (copy) v_u_7
	local v180 = v_u_38.State
	if p179 == nil then
		p179 = not v_u_38.State.Visible
	end
	v180.Visible = p179
	if v_u_38.State.Visible then
		local v181 = v_u_38.State
		if v181.LerpConnection then
			v181.LerpConnection:Disconnect()
			v181.LerpConnection = nil
		end
		v181.ActivatedTiers = {}
		v_u_16.Size = UDim2.fromScale(0, 1)
		for v182 = 1, 8 do
			local v183 = v_u_10:FindFirstChild(v182)
			if v183 then
				v183.Dot.Container.BackgroundColor3 = v_u_37
			end
		end
		for _, v184 in v181.GeneratedFrames do
			local v185 = v184.CompletedFrame
			local v186 = v184:FindFirstChild("WillGetFrame")
			v185.Visible = false
			if v186 then
				v186.Visible = false
			end
		end
		if v181.CountdownConnection then
			v181.CountdownConnection:Disconnect()
			v181.CountdownConnection = nil
		end
		v_u_20.Visible = false
		v_u_20.ImageTransparency = 1
		v_u_21.TextTransparency = 1
		v_u_22.Transparency = 1
		v181.ScrollOffset = 0
		v_u_5:BindActionAtPriority("TeamEventRewardsBlockZoom", function()
			return Enum.ContextActionResult.Sink
		end, false, 3000, Enum.UserInputType.MouseWheel)
		v_u_25:Open(v_u_7)
		task.delay(0.35, function()
			-- upvalues: (ref) v_u_38
			v_u_38:Render()
		end)
	else
		if v_u_38.State.CountdownConnection then
			v_u_38.State.CountdownConnection:Disconnect()
			v_u_38.State.CountdownConnection = nil
		end
		v_u_5:UnbindAction("TeamEventRewardsBlockZoom")
		v_u_25:Close(v_u_7)
	end
end
function v_u_38.Start(_)
	-- upvalues: (copy) v_u_81, (copy) v_u_29, (copy) v_u_38, (copy) v_u_16, (copy) v_u_10, (copy) v_u_37, (copy) v_u_9, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_8, (copy) v_u_7, (copy) v_u_11, (copy) v_u_35, (copy) v_u_26, (copy) v_u_27, (copy) v_u_5, (copy) v_u_18, (copy) v_u_3, (copy) v_u_19, (copy) v_u_28, (copy) v_u_23
	for v_u_187, v188 in v_u_81 do
		local v189 = v188.Button
		v_u_29({
			["instance"] = v189,
			["legacy"] = true,
			["onclick"] = function()
				-- upvalues: (ref) v_u_38, (copy) v_u_187, (ref) v_u_16, (ref) v_u_10, (ref) v_u_37
				local v190 = v_u_38.State
				v190.SelectedRewardView = v_u_187
				v190.ActivatedTiers = {}
				if v190.LerpConnection then
					v190.LerpConnection:Disconnect()
					v190.LerpConnection = nil
				end
				v_u_16.Size = UDim2.fromScale(0, 1)
				for v191 = 1, 8 do
					local v192 = v_u_10:FindFirstChild(v191)
					if v192 then
						v192.Dot.Container.BackgroundColor3 = v_u_37
					end
				end
				for _, v193 in v190.GeneratedFrames do
					local v194 = v193.CompletedFrame
					local v195 = v193:FindFirstChild("WillGetFrame")
					v194.Visible = false
					if v195 then
						v195.Visible = false
					end
				end
				v190.ScrollOffset = 0
				v_u_38:Render(true)
			end
		})
		local v196 = v189:FindFirstChild("Claim")
		if v196 then
			v196 = v196:FindFirstChildWhichIsA("UIStroke")
		end
		if v196 then
			v196:SetAttribute("DefaultStrokeColor", v196.Color)
		end
	end
	v_u_38.State.SelectedRewardView = "YourRewards"
	for _, v197 in v_u_9 do
		v197.Visible = false
	end
	v_u_20.Visible = false
	v_u_20.ImageTransparency = 1
	v_u_21.TextTransparency = 1
	v_u_22.Transparency = 1
	for v198 = 1, 8 do
		local v199 = v_u_9.Basic:Clone()
		v199.Visible = true
		v199.LayoutOrder = v198
		v199:SetAttribute("TemplateType", "Basic")
		v199.Parent = v_u_8
		v_u_38.State.GeneratedFrames[v198] = v199
	end
	local v_u_200 = v_u_7.Rewards.Main
	v_u_200.MouseWheelForward:Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:ScrollTo(v_u_38.State.ScrollOffset - 1)
	end)
	v_u_200.MouseWheelBackward:Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:ScrollTo(v_u_38.State.ScrollOffset + 1)
	end)
	local v_u_201 = nil
	local v_u_202 = nil
	v_u_200.InputBegan:Connect(function(p203)
		-- upvalues: (ref) v_u_201, (ref) v_u_202, (ref) v_u_38
		if p203.UserInputType == Enum.UserInputType.Touch then
			v_u_201 = p203.Position.X
			v_u_202 = v_u_38.State.ScrollOffset
		end
	end)
	v_u_200.InputChanged:Connect(function(p204)
		-- upvalues: (ref) v_u_201, (copy) v_u_200, (ref) v_u_38, (ref) v_u_202
		if p204.UserInputType == Enum.UserInputType.Touch and v_u_201 then
			local v205 = (v_u_201 - p204.Position.X) / (v_u_200.AbsoluteSize.X / 8)
			v_u_38:ScrollTo(v_u_202 + math.round(v205))
		end
	end)
	v_u_200.InputEnded:Connect(function(p206)
		-- upvalues: (ref) v_u_201, (ref) v_u_202
		if p206.UserInputType == Enum.UserInputType.Touch then
			v_u_201 = nil
			v_u_202 = nil
		end
	end)
	local v207 = Instance.new("TextButton")
	v207.Name = "ScrollLeftArrow"
	v207.Text = "\226\151\128"
	v207.Size = UDim2.fromOffset(32, 32)
	v207.AnchorPoint = Vector2.new(0.5, 0.5)
	v207.Position = UDim2.new(0, 6, 0.35, 0)
	v207.BackgroundColor3 = Color3.fromRGB(70, 50, 35)
	v207.BackgroundTransparency = 0.15
	v207.TextColor3 = Color3.fromRGB(255, 255, 255)
	v207.TextSize = 18
	v207.Font = Enum.Font.GothamBold
	v207.ZIndex = 10
	v207.Visible = false
	v207.AutoButtonColor = true
	v207.Parent = v_u_200
	local v208 = Instance.new("UICorner")
	v208.CornerRadius = UDim.new(0, 6)
	v208.Parent = v207
	local v209 = Instance.new("TextButton")
	v209.Name = "ScrollRightArrow"
	v209.Text = "\226\150\182"
	v209.Size = UDim2.fromOffset(32, 32)
	v209.AnchorPoint = Vector2.new(0.5, 0.5)
	v209.Position = UDim2.new(1, -6, 0.35, 0)
	v209.BackgroundColor3 = Color3.fromRGB(70, 50, 35)
	v209.BackgroundTransparency = 0.15
	v209.TextColor3 = Color3.fromRGB(255, 255, 255)
	v209.TextSize = 18
	v209.Font = Enum.Font.GothamBold
	v209.ZIndex = 10
	v209.Visible = false
	v209.AutoButtonColor = true
	v209.Parent = v_u_200
	local v210 = Instance.new("UICorner")
	v210.CornerRadius = UDim.new(0, 6)
	v210.Parent = v209
	v207.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:ScrollTo(v_u_38.State.ScrollOffset - 1)
	end)
	v209.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:ScrollTo(v_u_38.State.ScrollOffset + 1)
	end)
	v_u_38.LeftArrow = v207
	v_u_38.RightArrow = v209
	v_u_29({
		["instance"] = v_u_11,
		["legacy"] = true,
		["onclick"] = function()
			-- upvalues: (ref) v_u_38
			v_u_38:Toggle(false)
		end
	})
	v_u_35.Visible:Observe(function(p211)
		-- upvalues: (ref) v_u_26, (ref) v_u_27, (ref) v_u_5, (ref) v_u_7, (ref) v_u_18, (ref) v_u_3, (ref) v_u_19
		v_u_26.Change_FOV(p211 and 60 or 70)
		v_u_27.Blur(p211 and 15 or 0, 0.1)
		if not p211 then
			v_u_5:UnbindAction("TeamEventRewardsBlockZoom")
		end
		v_u_7.Enabled = p211
		if p211 then
			v_u_18.Size = UDim2.fromScale(0, 0)
			local v212 = {
				["Size"] = v_u_19
			}
			v_u_3:Create(v_u_18, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), v212):Play()
		end
	end)
	v_u_28:GetPathSignal("TeamEventData/@"):Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:Render()
	end)
	v_u_23.DataUpdated:Connect(function()
		-- upvalues: (ref) v_u_38
		v_u_38:Render()
	end)
	v_u_38:Render()
end
task.spawn(function()
	-- upvalues: (copy) v_u_38
	v_u_38:Start()
end)
return v_u_38