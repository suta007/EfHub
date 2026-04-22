local v1 = game:GetService("RunService")
local v2 = game:GetService("Players")
local v3 = game:GetService("CollectionService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = require(v4.Modules.NPCDialogueController)
local v_u_6 = require(v4.Top_Text)
local v_u_7 = require(v4.Data.SeedData)
local v_u_8 = require(v4.Item_Module)
local v_u_9 = require(v4.Modules.StringUtils)
local v_u_10 = require(v4.Modules.GenericRewardsUIController)
local v11 = require(v4.Modules.EasterEvent.EvilBunnyRewardData)
require(v4.Modules.GuiController)
local v_u_12 = require(v4.Modules.MarketController)
local v_u_13 = require(v4.Data.DevProductIds)
local v14 = v2.LocalPlayer:WaitForChild("PlayerGui")
local v_u_15 = v14:WaitForChild("EvilBunnyRewards_UI")
local v16 = v4:WaitForChild("GameEvents"):WaitForChild("EvilBunny")
v1:IsStudio()
local v_u_17 = v1:IsStudio() and 30 or 3600
local v18 = v14:WaitForChild("Billboard_UI"):WaitForChild("Objects")
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = v3:GetTagged("EvilBunnyNPC")[1]
if v_u_21 then
	local v22 = v_u_21:FindFirstChild("AnimationController"):FindFirstChild("Animator")
	local v_u_23
	if v22 then
		v22:LoadAnimation(script.Animations.Idle):Play()
		v_u_23 = v22:LoadAnimation(script.Animations.Laugh)
	else
		v_u_23 = nil
	end
	local v24 = v_u_21:WaitForChild("Torso")
	local v25 = v24:WaitForChild("EvilBunnyInteract")
	if v25 then
		local v_u_26 = v16:WaitForChild("EvilBunnyInteract")
		local v_u_27 = v16:WaitForChild("EvilBunnyGiveQuest")
		local v_u_28 = v16:WaitForChild("EvilBunnyClaim")
		local v29 = v16:WaitForChild("EvilBunnyQuestComplete")
		local v30 = game:GetService("MarketplaceService")
		local v_u_31 = nil
		local v32, v33 = pcall(function()
			return workspace:WaitForChild("Interaction", 10):WaitForChild("Easter2026", 10):WaitForChild("EvilBunny", 10)
		end)
		if v32 then
			v_u_31 = v33
		else
			warn("EvilBunnyClient: couldn\'t find workspace.Interaction.Easter2026.EvilBunny for sign home")
		end
		local v_u_34 = nil
		local function v40(p35)
			-- upvalues: (ref) v_u_34, (copy) v_u_26, (ref) v_u_31
			if not v_u_34 and p35:IsA("Model") then
				v_u_34 = p35
				local v36, v37 = pcall(function()
					-- upvalues: (ref) v_u_26
					return v_u_26:InvokeServer()
				end)
				if v36 then
					if type(v37) ~= "table" then
						return
					end
					local v38 = v37.QuestState == "Active"
					if v_u_34 then
						if not v_u_31 then
							return
						end
						local v39
						if v38 then
							v39 = v_u_31
						else
							v39 = nil
						end
						if v_u_34.Parent ~= v39 then
							v_u_34.Parent = v39
						end
					end
				end
			end
		end
		for _, v41 in v3:GetTagged("EvilBunnySign") do
			if not v_u_34 and v41:IsA("Model") then
				v_u_34 = v41
				local v42, v43 = pcall(function()
					-- upvalues: (copy) v_u_26
					return v_u_26:InvokeServer()
				end)
				if v42 and type(v43) == "table" then
					local v44 = v43.QuestState == "Active"
					if v_u_34 and v_u_31 then
						local v45
						if v44 then
							v45 = v_u_31
						else
							v45 = nil
						end
						if v_u_34.Parent ~= v45 then
							v_u_34.Parent = v45
						end
					end
				end
			end
			if v_u_34 then
				break
			end
		end
		v3:GetInstanceAddedSignal("EvilBunnySign"):Connect(v40)
		v30.PromptProductPurchaseFinished:Connect(function()
			-- upvalues: (copy) v_u_26, (ref) v_u_34, (ref) v_u_31
			task.wait(0.5)
			local v46, v47 = pcall(function()
				-- upvalues: (ref) v_u_26
				return v_u_26:InvokeServer()
			end)
			if v46 then
				if type(v47) ~= "table" then
					return
				end
				local v48 = v47.QuestState == "Active"
				if v_u_34 then
					if not v_u_31 then
						return
					end
					local v49
					if v48 then
						v49 = v_u_31
					else
						v49 = nil
					end
					if v_u_34.Parent ~= v49 then
						v_u_34.Parent = v49
					end
				end
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_26, (ref) v_u_34, (ref) v_u_31
			while true do
				repeat
					task.wait(30)
					local v50, v51 = pcall(function()
						-- upvalues: (ref) v_u_26
						return v_u_26:InvokeServer()
					end)
				until v50 and type(v51) == "table"
				local v52 = v51.QuestState == "Active"
				if v_u_34 and v_u_31 then
					local v53
					if v52 then
						v53 = v_u_31
					else
						v53 = nil
					end
					if v_u_34.Parent ~= v53 then
						v_u_34.Parent = v53
					end
				end
			end
		end)
		local v_u_54 = {}
		local function v_u_61(p55)
			-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_8
			local v56 = v_u_9:StipFlavourText(p55)
			local v57 = v_u_7[v56]
			if not v57 then
				return v56
			end
			local v58 = v57.SeedRarity
			if v58 == "Prismatic" or v58 == "Transcendent" then
				return v56
			end
			local v59 = v_u_8.Return_Rarity_Data(v58)
			if not (v59 and v59[2]) then
				return v56
			end
			local v60 = v59[2]
			return ("<font color=\"%*\">%*</font>"):format(string.format("#%02X%02X%02X", v60.R * 255, v60.G * 255, v60.B * 255), v56)
		end
		local v_u_62 = {}
		local v_u_63 = 1
		local v64 = script:FindFirstChild("DialogueSFX")
		if v64 then
			for _, v65 in v64:GetChildren() do
				if v65:IsA("Sound") then
					table.insert(v_u_62, v65)
				end
			end
			table.sort(v_u_62, function(p66, p67)
				return p66.Name < p67.Name
			end)
		end
		local v_u_68 = {}
		for _, v69 in v11 do
			local v70 = {
				["Weight"] = v69.Chance,
				["Reward"] = {
					["Type"] = v69.RewardType,
					["Value"] = v69.Name,
					["Quantity"] = v69.Quantity
				}
			}
			table.insert(v_u_68, v70)
		end
		v5:Start({
			["ProximityPrompt"] = v25,
			["SpeakingNPC"] = v_u_21,
			["PromptList"] = v_u_54,
			["OperationMap"] = {
				["I\'ll do it!"] = function()
					-- upvalues: (copy) v_u_27, (ref) v_u_34, (ref) v_u_31, (copy) v_u_61, (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
					local v71, v72 = v_u_27:InvokeServer()
					if v71 then
						if v_u_34 and v_u_31 then
							local v73 = v_u_31
							if v_u_34.Parent ~= v73 then
								v_u_34.Parent = v73
							end
						end
						local v74 = v_u_61(v71)
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, ("<font color=\"#c0392b\">Destroy</font> the %* with your Shovel."):format(v74), true)
						task.wait(3)
						return
					elseif v72 == "NotEnoughPlants" then
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, "Pathetic! Grow at least 5 plants before wasting my time!", true)
						task.wait(2.5)
					else
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, "No eligible plants. Grow something first!", true)
						task.wait(2)
					end
				end,
				["Which plant again?"] = function()
					-- upvalues: (copy) v_u_26, (copy) v_u_61, (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
					local v75 = v_u_26:InvokeServer().TargetPlantName or "???"
					if v75 ~= "???" then
						v75 = v_u_61(v75) or v75
					end
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, ("%*."):format(v75), true)
					task.wait(1.5)
				end,
				["I did it. Give me my reward."] = function()
					-- upvalues: (copy) v_u_28, (ref) v_u_34, (ref) v_u_31, (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
					local v76 = v_u_28:InvokeServer()
					if v76 then
						if v_u_34 and (v_u_31 and v_u_34.Parent ~= nil) then
							v_u_34.Parent = nil
						end
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, "...acceptable.", true)
						task.wait(1.5)
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, ("You earned: <font color=\"#ff9800\">%*</font>. Now GO."):format(v76), true)
						task.wait(2.5)
					else
						if #v_u_62 > 0 then
							v_u_62[v_u_63]:Play()
							v_u_63 = v_u_63 + 1
							if v_u_63 > #v_u_62 then
								v_u_63 = 1
							end
						end
						v_u_6.NpcText(v_u_21, "You haven\'t done anything yet, fool!", true)
						task.wait(2)
					end
				end,
				["How does this work?"] = function()
					-- upvalues: (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "I pick a planted plant. You <font color=\"#c0392b\">destroy</font> it with your Shovel.", true)
					task.wait(2.5)
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "Rarer plant and better variants = better and boosted reward odds!", true)
					task.wait(3)
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "Rewards include seeds, easter crates, golden eggs, pets and if very lucky... the Easter Sprout Seed!", true)
					task.wait(3.5)
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "60s cooldown. Single-harvest & favorited plants excluded.", true)
					task.wait(2)
				end,
				["View Rewards"] = function()
					-- upvalues: (copy) v_u_68, (copy) v_u_10, (copy) v_u_15
					local v_u_77 = #v_u_68
					v_u_10:Open({
						["Title"] = "Evil Bunny Rewards",
						["RewardData"] = v_u_68,
						["DisplayOdds"] = false,
						["Information"] = "The rarer and better variant of the plant destroyed = boosts your odds for better rewards!",
						["RewardsUIOverride"] = v_u_15,
						["RewardFrameCreatedCallback"] = function(p78, _, p79)
							-- upvalues: (copy) v_u_77, (ref) v_u_15
							local v80 = p79 == v_u_77 - 1
							local v81 = p79 == v_u_77
							if v80 or v81 then
								local v_u_82 = game:GetService("TweenService")
								local v83 = v_u_15.Frame.Main.Holder.RewardScrollingFrame.UIListLayout:FindFirstChild(v81 and "REWARDTRACK_FINAL" or "REWARDTRACK_SPECIAL")
								if v83 then
									local v84 = p78:FindFirstChild("Frame")
									if v84 then
										local v85 = v84:FindFirstChild("RewardName")
										local v86 = v84:FindFirstChild("Odds")
										local v87 = v84:FindFirstChild("ITEM_IMAGE")
										local v88 = v84:FindFirstChild("OddsButton")
										v84:Destroy()
										v83.Frame:Clone().Parent = p78
										local v89 = p78:FindFirstChild("Frame")
										if v89 then
											local v90 = v89:FindFirstChild("RewardName")
											local v91 = v89:FindFirstChild("Odds")
											local v92 = v89:FindFirstChild("ITEM_IMAGE")
											local v93 = v89:FindFirstChild("OddsButton")
											if v90 and v85 then
												v90.Text = v85.Text
												v90.TextColor3 = v85.TextColor3
												local v94 = v85:FindFirstChildWhichIsA("UIStroke")
												local v95 = v90:FindFirstChildWhichIsA("UIStroke")
												if v94 and v95 then
													v95.Color = v94.Color
												end
											end
											if v91 and v86 then
												v91.Text = v86.Text
												v91.Visible = v86.Visible
												v91.TextColor3 = v86.TextColor3
											end
											if v92 and v87 then
												v92.Image = v87.Image
												v92.ImageColor3 = v87.ImageColor3
											end
											if v93 and (v88 and (v93:IsA("GuiButton") and v88:IsA("GuiButton"))) then
												v93.Visible = v88.Visible
											end
											if v92 then
												v_u_82:Create(v92, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
													["Position"] = v92.Position + UDim2.new(0, 0, 0, -4)
												}):Play()
											end
											for _, v96 in v89:GetChildren() do
												if v96.Name == "InnerGlow" and v96:IsA("ImageLabel") then
													v_u_82:Create(v96, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
														["ImageTransparency"] = 1
													}):Play()
												end
											end
											local v97 = v89:FindFirstChild("Detail")
											if v97 then
												for _, v98 in v97:GetChildren() do
													if v98.Name == "Sunrays" and v98:IsA("ImageLabel") then
														local function v_u_102(p_u_99)
															-- upvalues: (copy) v_u_82, (copy) v_u_102
															p_u_99.Rotation = 0
															local v100 = v_u_82:Create(p_u_99, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 1, false), {
																["Rotation"] = 360
															})
															v100.Completed:Connect(function(p101)
																-- upvalues: (ref) v_u_102, (copy) p_u_99
																if p101 == Enum.PlaybackState.Completed then
																	v_u_102(p_u_99)
																end
															end)
															v100:Play()
														end
														v_u_102(v98)
													elseif v98.Name == "Stars" and v98:IsA("GuiObject") then
														v_u_82:Create(v98, TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
															["Position"] = v98.Position + UDim2.new(0, 0, 0, -5)
														}):Play()
													end
												end
											end
										end
									else
										return
									end
								else
									return
								end
							else
								return
							end
						end
					})
				end,
				["Skip Quest"] = function()
					-- upvalues: (copy) v_u_12, (copy) v_u_13
					v_u_12:PromptPurchase(v_u_13.SkipEvilBunnyQuest.PurchaseID, Enum.InfoType.Product)
				end,
				["Goodbye"] = function()
					-- upvalues: (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "...leave my sight.", true)
					task.wait(0.8)
				end,
				["Quest Timer"] = function() end,
				["Cooldown Timer"] = function() end
			},
			["ExitLine"] = "...leave my sight.",
			["RootPart"] = v24,
			["DeactivationDistance"] = 15,
			["OnDialogueStarted"] = function()
				-- upvalues: (copy) v_u_26, (ref) v_u_19, (ref) v_u_20, (ref) v_u_34, (ref) v_u_31, (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21, (copy) v_u_54, (ref) v_u_23
				local v103 = v_u_26:InvokeServer()
				local v104 = v103.QuestState
				local v105 = v103.CooldownRemaining
				v_u_19 = nil
				v_u_20 = nil
				local v106 = v104 == "Active"
				if v_u_34 and v_u_31 then
					local v107
					if v106 then
						v107 = v_u_31
					else
						v107 = nil
					end
					if v_u_34.Parent ~= v107 then
						v_u_34.Parent = v107
					end
				end
				if v104 == "Cooldown" then
					v_u_20 = os.time() + v105
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, ("Come back in %* seconds... I need to digest."):format((math.ceil(v105))), true)
					task.wait(1.5)
					table.clear(v_u_54)
					for _, v108 in { "Cooldown Timer", "View Rewards", "Goodbye" } do
						local v109 = v_u_54
						table.insert(v109, v108)
					end
					return
				elseif v104 == "Active" then
					v_u_19 = v103.QuestStartTime
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "DO WHAT I SAID OR ELSE!", true)
					task.wait(1)
					if v_u_19 then
						table.clear(v_u_54)
						for _, v110 in {
							"Quest Timer",
							"Which plant again?",
							"Skip Quest",
							"View Rewards",
							"Goodbye"
						} do
							local v111 = v_u_54
							table.insert(v111, v110)
						end
					else
						table.clear(v_u_54)
						for _, v112 in {
							"Which plant again?",
							"Skip Quest",
							"View Rewards",
							"Goodbye"
						} do
							local v113 = v_u_54
							table.insert(v113, v112)
						end
					end
				elseif v104 == "Complete" then
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "Hmm... you actually did it.", true)
					v_u_23:Play()
					task.wait(1)
					table.clear(v_u_54)
					for _, v114 in { "I did it. Give me my reward.", "View Rewards", "Goodbye" } do
						local v115 = v_u_54
						table.insert(v115, v114)
					end
				else
					if #v_u_62 > 0 then
						v_u_62[v_u_63]:Play()
						v_u_63 = v_u_63 + 1
						if v_u_63 > #v_u_62 then
							v_u_63 = 1
						end
					end
					v_u_6.NpcText(v_u_21, "MWAHAHAHA! Sacrifice a garden plant for me...", true)
					task.wait(1)
					table.clear(v_u_54)
					for _, v116 in {
						"I\'ll do it!",
						"View Rewards",
						"How does this work?",
						"Goodbye"
					} do
						local v117 = v_u_54
						table.insert(v117, v116)
					end
				end
			end,
			["OnDialogueEnded"] = function() end
		})
		v18.ChildAdded:Connect(function(p_u_118)
			-- upvalues: (ref) v_u_19, (copy) v_u_17
			local v119 = p_u_118:FindFirstChild("Frame")
			local v120
			if v119 then
				local v121 = v119:FindFirstChild("Frame")
				if v121 then
					v120 = v121:FindFirstChild("Text_Element")
				else
					v120 = nil
				end
			else
				v120 = nil
			end
			local v122
			if v120 then
				v122 = v120:GetAttribute("Text") == "Quest Timer"
			else
				v122 = false
			end
			if v122 then
				local v123 = p_u_118:FindFirstChild("Frame")
				local v_u_124
				if v123 then
					local v125 = v123:FindFirstChild("Frame")
					if v125 then
						v_u_124 = v125:FindFirstChild("Text_Element")
					else
						v_u_124 = nil
					end
				else
					v_u_124 = nil
				end
				if v_u_124 then
					local v_u_126 = v_u_124.Parent and v_u_124.Parent.Parent
					if v_u_126 then
						v_u_126 = v_u_124.Parent.Parent:FindFirstChildWhichIsA("ImageButton")
					end
					local function v_u_136()
						-- upvalues: (ref) v_u_19, (ref) v_u_17, (copy) v_u_124, (copy) v_u_126
						if v_u_19 then
							local v127 = v_u_19 + v_u_17 - os.time()
							local v128 = v_u_124
							local v129 = "[\""
							local v130 = math.floor(v127)
							local v131 = math.max(v130, 0)
							local v132
							if v131 <= 0 then
								v132 = "Quest Expired"
							else
								local v133 = v131 / 60
								local v134 = math.floor(v133)
								local v135 = v131 % 60
								v132 = string.format("Quest expires in %d:%02d", v134, v135)
							end
							v128.Text = v129 .. v132 .. "\"]"
							v_u_124:SetAttribute("Text", "Quest Timer")
							if v127 > 0 then
								v_u_124.TextColor3 = Color3.fromRGB(255, 180, 180)
							else
								v_u_124.TextColor3 = Color3.fromRGB(130, 130, 130)
							end
							if v_u_126 then
								v_u_126.Active = false
							end
						end
					end
					v_u_136()
					local v_u_137 = task.spawn(function()
						-- upvalues: (copy) p_u_118, (copy) v_u_136, (ref) v_u_19, (ref) v_u_17
						while true do
							task.wait(1)
							if not p_u_118.Parent then
								break
							end
							v_u_136()
							if not v_u_19 or v_u_19 + v_u_17 - os.time() <= 0 then
								break
							end
						end
					end)
					p_u_118.Destroying:Connect(function()
						-- upvalues: (copy) v_u_137
						pcall(task.cancel, v_u_137)
					end)
				end
			else
				return
			end
		end)
		v18.ChildAdded:Connect(function(p_u_138)
			-- upvalues: (ref) v_u_20
			local v139 = p_u_138:FindFirstChild("Frame")
			local v140
			if v139 then
				local v141 = v139:FindFirstChild("Frame")
				if v141 then
					v140 = v141:FindFirstChild("Text_Element")
				else
					v140 = nil
				end
			else
				v140 = nil
			end
			local v142
			if v140 then
				v142 = v140:GetAttribute("Text") == "Cooldown Timer"
			else
				v142 = false
			end
			if v142 then
				local v143 = p_u_138:FindFirstChild("Frame")
				local v_u_144
				if v143 then
					local v145 = v143:FindFirstChild("Frame")
					if v145 then
						v_u_144 = v145:FindFirstChild("Text_Element")
					else
						v_u_144 = nil
					end
				else
					v_u_144 = nil
				end
				if v_u_144 then
					local v_u_146 = v_u_144.Parent and v_u_144.Parent.Parent
					if v_u_146 then
						v_u_146 = v_u_144.Parent.Parent:FindFirstChildWhichIsA("ImageButton")
					end
					local function v_u_157(p147)
						-- upvalues: (copy) v_u_144, (copy) v_u_146
						local v148 = p147 <= 0
						if v148 then
							v_u_144.Text = "[\"I\'ll do it!\"]"
							v_u_144:SetAttribute("Text", "I\'ll do it!")
							v_u_144.TextColor3 = Color3.fromRGB(255, 255, 255)
						else
							local v149 = v_u_144
							local v150 = "[\""
							local v151 = math.floor(p147)
							local v152 = math.max(v151, 0)
							local v153
							if v152 <= 0 then
								v153 = "Quest Ready!"
							else
								local v154 = v152 / 60
								local v155 = math.floor(v154)
								local v156 = v152 % 60
								if v155 > 0 then
									v153 = string.format("Quest Ready in %d:%02d", v155, v156)
								else
									v153 = string.format("Quest Ready in %ds", v156)
								end
							end
							v149.Text = v150 .. v153 .. "\"]"
							v_u_144:SetAttribute("Text", "Cooldown Timer")
							v_u_144.TextColor3 = Color3.fromRGB(180, 180, 255)
						end
						if v_u_146 then
							v_u_146.Active = v148
						end
					end
					v_u_157(v_u_20 and v_u_20 - os.time() or 0)
					local v_u_159 = task.spawn(function()
						-- upvalues: (copy) p_u_138, (ref) v_u_20, (copy) v_u_157
						while true do
							task.wait(1)
							if not (p_u_138.Parent and v_u_20) then
								break
							end
							local v158 = v_u_20 - os.time()
							v_u_157(v158)
							if v158 <= 0 then
								v_u_20 = nil
								return
							end
						end
					end)
					p_u_138.Destroying:Connect(function()
						-- upvalues: (copy) v_u_159
						pcall(task.cancel, v_u_159)
					end)
				end
			else
				return
			end
		end)
		v29.OnClientEvent:Connect(function()
			-- upvalues: (ref) v_u_34, (ref) v_u_31, (copy) v_u_62, (ref) v_u_63, (copy) v_u_6, (copy) v_u_21
			if v_u_34 and (v_u_31 and v_u_34.Parent ~= nil) then
				v_u_34.Parent = nil
			end
			if #v_u_62 > 0 then
				v_u_62[v_u_63]:Play()
				v_u_63 = v_u_63 + 1
				if v_u_63 > #v_u_62 then
					v_u_63 = 1
				end
			end
			v_u_6.NpcText(v_u_21, "YESSS! Now return to me for your REWARD...", true)
			task.wait(2)
		end)
	else
		warn("EvilBunnyClient: no ProximityPrompt found inside EvilBunny model!")
	end
else
	warn("EvilBunnyClient: no model tagged EvilBunnyNPC found in workspace!")
	return
end