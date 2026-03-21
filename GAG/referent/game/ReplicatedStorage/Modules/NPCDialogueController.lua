local v_u_1 = game:GetService("TweenService")
game:GetService("Debris")
local v_u_2 = require(game.ReplicatedStorage.Top_Text)
local v_u_3 = require(game.ReplicatedStorage.NPC_MOD)
local v_u_4 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local v5 = {}
local v_u_6 = false
function v5.Start(_, p_u_7)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_6, (copy) v_u_1, (copy) v_u_4
	local v_u_8 = p_u_7.ProximityPrompt
	local v_u_9 = p_u_7.SpeakingNPC
	local v_u_10 = p_u_7.PromptList
	local v_u_11 = p_u_7.OperationMap
	local v_u_12 = p_u_7.IntroLines
	local v_u_13 = game.Players.LocalPlayer
	local v_u_14 = p_u_7.RootPart or (v_u_9:FindFirstChild("HumanoidRootPart") or v_u_9)
	local v_u_15 = v_u_9:FindFirstChild("DialogueHighlight")
	if not v_u_15 then
		v_u_15 = Instance.new("Highlight")
		if v_u_15 and v_u_15:IsA("Highlight") then
			v_u_15.Name = "DialogueHighlight"
			v_u_15.DepthMode = Enum.HighlightDepthMode.Occluded
			v_u_15.FillTransparency = 1
			v_u_15.OutlineTransparency = 1
			v_u_15.Adornee = v_u_9
			v_u_15.Parent = v_u_9
		end
	end
	local v_u_16 = false
	local v_u_17 = false
	local v_u_18 = nil
	local v_u_19 = {}
	local function v_u_24(p20)
		-- upvalues: (ref) v_u_16, (ref) v_u_18, (copy) v_u_19, (ref) v_u_2, (copy) v_u_9, (copy) v_u_13, (ref) v_u_3, (ref) v_u_17, (ref) v_u_6, (copy) v_u_8
		if v_u_16 then
			if v_u_18 then
				task.cancel(v_u_18)
			end
			for _, v21 in v_u_19 do
				v21:Disconnect()
			end
			table.clear(v_u_19)
			v_u_2.TakeAwayResponses(v_u_9, v_u_13)
			v_u_2.RemovePlayerSideFrame(v_u_13)
			v_u_3.End_Speak(v_u_13)
			if p20.OnDialogueEnded then
				p20.OnDialogueEnded()
			end
			v_u_17 = false
			v_u_16 = false
			if v_u_9.Parent then
				v_u_9:SetAttribute("ConversationStarted", false)
			end
			v_u_6 = false
			task.wait(0.5)
			if v_u_8.Parent then
				local v22 = v_u_8
				local v23
				if v_u_9.Parent then
					v23 = not v_u_9:GetAttribute("DisableDialogue")
				else
					v23 = false
				end
				v22.Enabled = v23
			end
		end
	end
	local function v_u_39(p25)
		-- upvalues: (ref) v_u_6, (ref) v_u_16, (copy) v_u_9, (ref) v_u_3, (copy) v_u_13, (ref) v_u_17, (copy) v_u_8, (copy) v_u_12, (ref) v_u_2, (copy) v_u_24, (copy) v_u_10, (copy) v_u_19, (copy) v_u_11, (ref) v_u_18
		if v_u_6 then
			return
		elseif v_u_16 then
			return
		else
			local v26
			if v_u_9.Parent then
				v26 = not v_u_9:GetAttribute("DisableDialogue")
			else
				v26 = false
			end
			if v26 then
				v_u_16 = true
				v_u_9:SetAttribute("ConversationStarted", true)
				v_u_6 = true
				v_u_3.Start_Speak(v_u_13)
				v_u_17 = false
				v_u_8.Enabled = false
				if p25.OnDialogueStarted then
					p25.OnDialogueStarted()
				end
				if v_u_12 then
					if p25.RandomIntroLine then
						local v27 = Random.new()
						v_u_2.NpcText(v_u_9, v_u_12[v27:NextInteger(1, #v_u_12)], true)
						task.wait(0.5)
					else
						for _, v28 in v_u_12 do
							v_u_2.NpcText(v_u_9, v28, true)
							task.wait(0.5)
						end
					end
				end
				if v_u_16 and not v_u_17 then
					if #v_u_10 > 0 then
						local v29 = v_u_2.ShowChoices(v_u_13, v_u_10)
						local v_u_30 = ""
						if not v_u_16 or v_u_17 then
							v_u_24(p25)
							return
						end
						table.clear(v_u_19)
						for _, v31 in v29 do
							local v_u_32 = v31:FindFirstChild("Frame")
							if v_u_32 then
								local v33 = v_u_32:FindFirstChild("ImageButton")
								if v33 then
									local v34 = v_u_19
									local v35 = v33.MouseButton1Click
									table.insert(v34, v35:Connect(function()
										-- upvalues: (ref) v_u_30, (copy) v_u_32
										v_u_30 = v_u_32.Frame.Text_Element:GetAttribute("Text")
									end))
								end
							end
						end
						if not v_u_16 or v_u_17 then
							v_u_24(p25)
							return
						end
						while v_u_30 == "" do
							task.wait()
							if v_u_17 or not v_u_16 then
								for _, v36 in v_u_19 do
									v36:Disconnect()
								end
								return v_u_24(p25)
							end
						end
						for _, v37 in v_u_19 do
							v37:Disconnect()
						end
						v_u_2.RemovePlayerSideFrame(v_u_13)
						if v_u_13.Character then
							v_u_2.PlayerResponse(v_u_13.Character, v_u_30, true)
							local v38 = v_u_11[v_u_30]
							if v38 then
								v_u_18 = task.spawn(v38)
								repeat
									task.wait()
								until coroutine.status(v_u_18) == "dead"
							end
						end
					end
					v_u_24(p25)
				else
					v_u_24(p25)
				end
			else
				return
			end
		end
	end
	local v_u_40 = v_u_8.Triggered:Connect(function(_)
		-- upvalues: (copy) v_u_39, (copy) p_u_7
		v_u_39(p_u_7)
	end)
	local v_u_41 = v_u_8.MaxActivationDistance + 1
	local v_u_42 = v_u_9.Destroying:Connect(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_17, (copy) v_u_24, (copy) p_u_7
		if v_u_16 then
			v_u_17 = true
			v_u_24(p_u_7)
		end
	end)
	local v_u_48 = task.spawn(function()
		-- upvalues: (copy) v_u_9, (ref) v_u_16, (copy) v_u_24, (copy) p_u_7, (copy) v_u_13, (copy) v_u_14, (copy) v_u_41, (ref) v_u_2, (ref) v_u_42
		local v43 = false
		while true do
			if not v_u_9.Parent then
				if v_u_42 then
					v_u_42:Disconnect()
				end
				return
			end
			task.wait(0.1)
			if not v43 and v_u_16 then
				local v44
				if v_u_9.Parent then
					v44 = not v_u_9:GetAttribute("DisableDialogue")
				else
					v44 = false
				end
				if v44 then
					if v_u_9:IsDescendantOf(workspace) then
						if v_u_13.Character and v_u_13.Character.PrimaryPart then
							local v45 = nil
							if v_u_14 and v_u_14.Parent then
								if v_u_14:IsA("Part") then
									v45 = v_u_14.Position
								elseif v_u_14:IsA("Attachment") then
									v45 = v_u_14.WorldPosition
								elseif v_u_14:IsA("Model") then
									v45 = v_u_14:GetPivot().Position
								end
							end
							if v45 and (v_u_13.Character.PrimaryPart.Position - v45).Magnitude >= v_u_41 then
								if p_u_7.ExitLine then
									if p_u_7.RandomExitLine then
										local v46 = p_u_7.ExitLine
										if typeof(v46) == "table" then
											local v47 = Random.new()
											v_u_2.NpcText(v_u_9, p_u_7.ExitLine[v47:NextInteger(1, #p_u_7.ExitLine)], true)
											v43 = false
											goto l26
										end
									end
									v_u_2.NpcText(v_u_9, p_u_7.ExitLine, true)
									v43 = false
									goto l26
								end
								::l26::
								v_u_24(p_u_7)
							end
						end
					else
						v_u_24(p_u_7)
					end
				else
					v_u_24(p_u_7)
				end
			end
		end
	end)
	local v_u_50 = v_u_8.PromptShown:Connect(function()
		-- upvalues: (copy) v_u_9, (ref) v_u_1, (ref) v_u_15, (ref) v_u_4
		local v49
		if v_u_9.Parent then
			v49 = not v_u_9:GetAttribute("DisableDialogue")
		else
			v49 = false
		end
		if v49 then
			v_u_1:Create(v_u_15, v_u_4, {
				["OutlineTransparency"] = 0
			}):Play()
		end
	end)
	local v_u_51 = v_u_8.PromptHidden:Connect(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_4
		v_u_1:Create(v_u_15, v_u_4, {
			["OutlineTransparency"] = 1
		}):Play()
	end)
	return {
		["End"] = function(_)
			-- upvalues: (ref) v_u_16, (ref) v_u_17, (copy) v_u_24, (copy) p_u_7
			if v_u_16 then
				v_u_17 = true
				v_u_24(p_u_7)
			end
		end,
		["Destroy"] = function(_)
			-- upvalues: (ref) v_u_16, (ref) v_u_17, (copy) v_u_24, (copy) p_u_7, (ref) v_u_42, (ref) v_u_48, (ref) v_u_50, (ref) v_u_51, (ref) v_u_40
			if v_u_16 then
				v_u_17 = true
				v_u_24(p_u_7)
			end
			if v_u_42 then
				v_u_42:Disconnect()
				v_u_42 = nil
			end
			if v_u_48 then
				task.cancel(v_u_48)
				v_u_48 = nil
			end
			if v_u_50 then
				v_u_50:Disconnect()
				v_u_50 = nil
			end
			if v_u_51 then
				v_u_51:Disconnect()
				v_u_51 = nil
			end
			if v_u_40 then
				v_u_40:Disconnect()
				v_u_40 = nil
			end
		end,
		["IsActive"] = function(_)
			-- upvalues: (ref) v_u_16
			return v_u_16
		end
	}
end
return v5