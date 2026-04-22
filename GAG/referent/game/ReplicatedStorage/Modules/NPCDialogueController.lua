local v_u_1 = game:GetService("TweenService")
game:GetService("Debris")
local v_u_2 = require(game.ReplicatedStorage.Top_Text)
local v_u_3 = require(game.ReplicatedStorage.NPC_MOD)
local v_u_4 = require(game.ReplicatedStorage.Modules.UpdateService)
local v_u_5 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local v6 = {}
local v_u_7 = false
function v6.Start(_, p_u_8)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_7, (copy) v_u_4, (copy) v_u_1, (copy) v_u_5
	local v_u_9 = p_u_8.ProximityPrompt
	local v_u_10 = p_u_8.SpeakingNPC
	local v_u_11 = p_u_8.PromptList
	local v_u_12 = p_u_8.OperationMap
	local v_u_13 = p_u_8.IntroLines
	local v_u_14 = game.Players.LocalPlayer
	local v_u_15 = p_u_8.RootPart or (v_u_10:FindFirstChild("HumanoidRootPart") or v_u_10)
	local v_u_16 = v_u_10:FindFirstChild("DialogueHighlight")
	if not v_u_16 then
		v_u_16 = Instance.new("Highlight")
		if v_u_16 and v_u_16:IsA("Highlight") then
			v_u_16.Name = "DialogueHighlight"
			v_u_16.DepthMode = Enum.HighlightDepthMode.Occluded
			v_u_16.FillTransparency = 1
			v_u_16.OutlineTransparency = 1
			v_u_16.Adornee = v_u_10
			v_u_16.Parent = v_u_10
		end
	end
	local v_u_17 = false
	local v_u_18 = false
	local v_u_19 = nil
	local v_u_20 = {}
	local function v_u_25(p21)
		-- upvalues: (ref) v_u_17, (ref) v_u_19, (copy) v_u_20, (ref) v_u_2, (copy) v_u_10, (copy) v_u_14, (ref) v_u_3, (ref) v_u_18, (ref) v_u_7, (copy) v_u_9
		if v_u_17 then
			if v_u_19 then
				task.cancel(v_u_19)
			end
			for _, v22 in v_u_20 do
				v22:Disconnect()
			end
			table.clear(v_u_20)
			v_u_2.TakeAwayResponses(v_u_10, v_u_14)
			v_u_2.RemovePlayerSideFrame(v_u_14)
			v_u_3.End_Speak(v_u_14)
			if p21.OnDialogueEnded then
				p21.OnDialogueEnded()
			end
			v_u_18 = false
			v_u_17 = false
			if v_u_10.Parent then
				v_u_10:SetAttribute("ConversationStarted", false)
			end
			v_u_7 = false
			task.wait(0.5)
			if v_u_9.Parent then
				local v23 = v_u_9
				local v24
				if v_u_10.Parent then
					v24 = not v_u_10:GetAttribute("DisableDialogue")
				else
					v24 = false
				end
				v23.Enabled = v24
			end
		end
	end
	local function v_u_40(p26)
		-- upvalues: (ref) v_u_7, (ref) v_u_17, (copy) v_u_10, (ref) v_u_3, (copy) v_u_14, (ref) v_u_18, (copy) v_u_9, (copy) v_u_13, (ref) v_u_2, (copy) v_u_25, (copy) v_u_11, (copy) v_u_20, (copy) v_u_12, (ref) v_u_19
		if v_u_7 then
			return
		end
		if v_u_17 then
			return
		end
		local v27
		if v_u_10.Parent then
			v27 = not v_u_10:GetAttribute("DisableDialogue")
		else
			v27 = false
		end
		if not v27 then
			return
		end
		v_u_17 = true
		v_u_10:SetAttribute("ConversationStarted", true)
		v_u_7 = true
		v_u_3.Start_Speak(v_u_14)
		v_u_18 = false
		v_u_9.Enabled = false
		if p26.OnDialogueStarted then
			p26.OnDialogueStarted()
		end
		if v_u_13 then
			if p26.RandomIntroLine then
				local v28 = Random.new()
				v_u_2.NpcText(v_u_10, v_u_13[v28:NextInteger(1, #v_u_13)], true)
				task.wait(0.5)
			else
				for _, v29 in v_u_13 do
					if not v_u_17 or v_u_18 then
						break
					end
					v_u_2.NpcText(v_u_10, v29, true)
					task.wait(0.5)
				end
			end
		end
		if v_u_17 and not v_u_18 then
			if #v_u_11 > 0 then
				v_u_2.TakeAwayResponses(v_u_10, v_u_14)
				local v30 = v_u_2.ShowChoices(v_u_14, v_u_11)
				local v_u_31 = ""
				if not v_u_17 or v_u_18 then
					v_u_25(p26)
					return
				end
				table.clear(v_u_20)
				for _, v32 in v30 do
					local v_u_33 = v32:FindFirstChild("Frame")
					if v_u_33 then
						local v34 = v_u_33:FindFirstChild("ImageButton")
						if v34 then
							local v35 = v_u_20
							local v36 = v34.Activated
							table.insert(v35, v36:Connect(function()
								-- upvalues: (ref) v_u_31, (copy) v_u_33
								v_u_31 = v_u_33.Frame.Text_Element:GetAttribute("Text")
							end))
						end
					end
				end
				if not v_u_17 or v_u_18 then
					v_u_25(p26)
					return
				end
				while v_u_31 == "" do
					task.wait()
					if v_u_18 or not v_u_17 then
						for _, v37 in v_u_20 do
							v37:Disconnect()
						end
						return v_u_25(p26)
					end
				end
				for _, v38 in v_u_20 do
					v38:Disconnect()
				end
				v_u_2.RemovePlayerSideFrame(v_u_14)
				if v_u_14.Character then
					v_u_2.PlayerResponse(v_u_14.Character, v_u_31, true)
					local v39 = v_u_12[v_u_31]
					if v39 then
						v_u_19 = task.spawn(v39)
						repeat
							task.wait()
						until coroutine.status(v_u_19) == "dead"
					end
				end
			end
			v_u_25(p26)
		else
			v_u_25(p26)
		end
	end
	local v_u_41 = v_u_9.Triggered:Connect(function(_)
		-- upvalues: (copy) v_u_40, (copy) p_u_8
		v_u_40(p_u_8)
	end)
	local v_u_42 = v_u_9.MaxActivationDistance + 1
	local function v43()
		-- upvalues: (ref) v_u_17, (ref) v_u_18, (copy) v_u_25, (copy) p_u_8
		if v_u_17 then
			v_u_18 = true
			v_u_25(p_u_8)
		end
	end
	local v_u_44 = v_u_10.Destroying:Connect(v43)
	local v_u_45 = v_u_4.OnUpdated:Connect(v43)
	local v_u_51 = task.spawn(function()
		-- upvalues: (copy) v_u_10, (ref) v_u_17, (copy) v_u_25, (copy) p_u_8, (copy) v_u_14, (copy) v_u_15, (copy) v_u_42, (ref) v_u_2, (ref) v_u_44, (copy) v_u_45
		local v46 = false
		while true do
			if not v_u_10.Parent then
				if v_u_44 then
					v_u_44:Disconnect()
				end
				if v_u_45 then
					v_u_45:Disconnect()
				end
				return
			end
			task.wait(0.1)
			if not v46 and v_u_17 then
				local v47
				if v_u_10.Parent then
					v47 = not v_u_10:GetAttribute("DisableDialogue")
				else
					v47 = false
				end
				if v47 then
					if v_u_10:IsDescendantOf(workspace) then
						if v_u_14.Character and v_u_14.Character.PrimaryPart then
							local v48 = nil
							if v_u_15 and v_u_15.Parent then
								if v_u_15:IsA("Part") then
									v48 = v_u_15.Position
								elseif v_u_15:IsA("Attachment") then
									v48 = v_u_15.WorldPosition
								elseif v_u_15:IsA("Model") then
									v48 = v_u_15:GetPivot().Position
								end
							end
							if v48 and (v_u_14.Character.PrimaryPart.Position - v48).Magnitude >= v_u_42 then
								if p_u_8.ExitLine then
									if p_u_8.RandomExitLine then
										local v49 = p_u_8.ExitLine
										if typeof(v49) == "table" then
											local v50 = Random.new()
											v_u_2.NpcText(v_u_10, p_u_8.ExitLine[v50:NextInteger(1, #p_u_8.ExitLine)], true)
											v46 = false
											goto l26
										end
									end
									v_u_2.NpcText(v_u_10, p_u_8.ExitLine, true)
									v46 = false
									goto l26
								end
								::l26::
								v_u_25(p_u_8)
							end
						end
					else
						v_u_25(p_u_8)
					end
				else
					v_u_25(p_u_8)
				end
			end
		end
	end)
	local v_u_53 = v_u_9.PromptShown:Connect(function()
		-- upvalues: (copy) v_u_10, (ref) v_u_1, (ref) v_u_16, (ref) v_u_5
		local v52
		if v_u_10.Parent then
			v52 = not v_u_10:GetAttribute("DisableDialogue")
		else
			v52 = false
		end
		if v52 then
			v_u_1:Create(v_u_16, v_u_5, {
				["OutlineTransparency"] = 0
			}):Play()
		end
	end)
	local v_u_54 = v_u_9.PromptHidden:Connect(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_16, (ref) v_u_5
		v_u_1:Create(v_u_16, v_u_5, {
			["OutlineTransparency"] = 1
		}):Play()
	end)
	return {
		["End"] = function(_)
			-- upvalues: (ref) v_u_17, (ref) v_u_18, (copy) v_u_25, (copy) p_u_8
			if v_u_17 then
				v_u_18 = true
				v_u_25(p_u_8)
			end
		end,
		["Destroy"] = function(_)
			-- upvalues: (ref) v_u_17, (ref) v_u_18, (copy) v_u_25, (copy) p_u_8, (ref) v_u_44, (copy) v_u_45, (ref) v_u_51, (ref) v_u_53, (ref) v_u_54, (ref) v_u_41
			if v_u_17 then
				v_u_18 = true
				v_u_25(p_u_8)
			end
			if v_u_44 then
				v_u_44:Disconnect()
				v_u_44 = nil
			end
			if v_u_45 then
				v_u_45:Disconnect()
			end
			if v_u_51 then
				task.cancel(v_u_51)
				v_u_51 = nil
			end
			if v_u_53 then
				v_u_53:Disconnect()
				v_u_53 = nil
			end
			if v_u_54 then
				v_u_54:Disconnect()
				v_u_54 = nil
			end
			if v_u_41 then
				v_u_41:Disconnect()
				v_u_41 = nil
			end
		end,
		["IsActive"] = function(_)
			-- upvalues: (ref) v_u_17
			return v_u_17
		end
	}
end
return v6