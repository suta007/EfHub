local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("CollectionService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("SoundService")
local v_u_7 = require(game.ReplicatedStorage.Modules.NPCDialogueController)
local v_u_8 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v_u_9 = require(game.ReplicatedStorage.Top_Text)
local v_u_10 = v4.LocalPlayer
local v_u_11 = workspace.CurrentCamera
local v_u_12 = game.ReplicatedStorage:WaitForChild("GameEvents")
local v_u_13 = false
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = nil
local v_u_18 = nil
local v19 = v_u_5:FindFirstChild("ColorCorrection")
local v_u_20
if v19 then
	v_u_20 = v19:Clone()
else
	v_u_20 = Instance.new("ColorCorrectionEffect")
end
v_u_20.Name = "JhaiWedding"
v_u_20.Parent = v_u_5
local v_u_21 = Random.new()
local function v_u_34(p22, p23, p24)
	-- upvalues: (copy) v_u_11, (copy) v_u_21, (copy) v_u_15, (copy) v_u_2
	local v25 = v_u_11.CFrame.Position
	for _ = 1, p22 do
		local v_u_26 = Instance.new("Part")
		local v27 = v_u_21:NextNumber(0.2, 0.5)
		local v28 = v_u_21
		v_u_26.Size = Vector3.new(v27, 0.05, v28:NextNumber(0.2, 0.5))
		v_u_26.Material = Enum.Material.Neon
		v_u_26.Color = Color3.fromHSV(v_u_21:NextNumber(), 0.7, 1)
		v_u_26.Anchored = false
		v_u_26.CanCollide = false
		v_u_26.CanQuery = false
		v_u_26.CastShadow = false
		v_u_26.CFrame = CFrame.new(v25.X + v_u_21:NextNumber(-p23, p23), v25.Y + p24 + v_u_21:NextNumber(0, 4), v25.Z + v_u_21:NextNumber(-p23, p23)) * CFrame.Angles(v_u_21:NextNumber(0, 6.283185307179586), v_u_21:NextNumber(0, 6.283185307179586), 0)
		local v29 = Instance.new("LinearVelocity")
		local v30 = v_u_21:NextNumber(-4, 4)
		local v31 = v_u_21:NextNumber(-2, 1)
		local v32 = v_u_21
		v29.VectorVelocity = Vector3.new(v30, v31, v32:NextNumber(-4, 4))
		v29.MaxForce = 10000
		v29.RelativeTo = Enum.ActuatorRelativeTo.World
		v29.Parent = v_u_26
		v_u_26.Parent = workspace.WeatherVisuals
		local v33 = v_u_15
		table.insert(v33, v_u_26)
		game:GetService("Debris"):AddItem(v_u_26, 6)
		task.delay(4, function()
			-- upvalues: (copy) v_u_26, (ref) v_u_2
			if v_u_26 and v_u_26.Parent then
				v_u_2:Create(v_u_26, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					["Transparency"] = 1
				}):Play()
			end
		end)
	end
end
local function v_u_36()
	-- upvalues: (copy) v_u_15
	for _, v35 in v_u_15 do
		if v35 and v35.Parent then
			v35:Destroy()
		end
	end
	table.clear(v_u_15)
end
local v_u_37 = nil
local v_u_38 = nil
local function v_u_41()
	-- upvalues: (ref) v_u_38, (ref) v_u_37, (copy) v_u_2
	if v_u_38 then
		task.cancel(v_u_38)
		v_u_38 = nil
	end
	if v_u_37 then
		local v39 = v_u_37
		v_u_37 = nil
		local v40 = v39:FindFirstChild("Toast")
		if v40 then
			v_u_2:Create(v40, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Position"] = UDim2.new(0.5, 0, 1.05, 0)
			}):Play()
		end
		game:GetService("Debris"):AddItem(v39, 0.5)
	end
end
local function v_u_49(p42, p43, p44)
	-- upvalues: (copy) v_u_41, (ref) v_u_37, (copy) v_u_10, (copy) v_u_2, (ref) v_u_38
	v_u_41()
	v_u_37 = Instance.new("ScreenGui")
	v_u_37.Name = "JhaiWeddingHud"
	v_u_37.ResetOnSpawn = false
	v_u_37.DisplayOrder = -20
	v_u_37.Parent = v_u_10.PlayerGui
	local v45 = Instance.new("Frame")
	v45.Name = "Toast"
	v45.AnchorPoint = Vector2.new(0.5, 1)
	v45.Size = UDim2.new(0.24, 0, 0.035, 0)
	v45.BackgroundColor3 = Color3.fromRGB(18, 14, 10)
	v45.BackgroundTransparency = 0.25
	v45.BorderSizePixel = 0
	v45.Position = UDim2.new(0.5, 0, 1.05, 0)
	v45.Parent = v_u_37
	local v46 = Instance.new("UICorner")
	v46.CornerRadius = UDim.new(0, 8)
	v46.Parent = v45
	local v47 = Instance.new("UIStroke")
	v47.Color = p43
	v47.Thickness = 1.5
	v47.Transparency = 0.3
	v47.Parent = v45
	local v48 = Instance.new("TextLabel")
	v48.Size = UDim2.new(1, -16, 1, 0)
	v48.Position = UDim2.new(0, 8, 0, 0)
	v48.BackgroundTransparency = 1
	v48.Text = p42
	v48.TextColor3 = p43
	v48.TextScaled = true
	v48.Font = Enum.Font.GothamBold
	v48.RichText = true
	v48.Parent = v45
	v_u_2:Create(v45, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		["Position"] = UDim2.new(0.5, 0, 0.92, 0)
	}):Play()
	v_u_38 = task.delay(p44 or 4, function()
		-- upvalues: (ref) v_u_38, (ref) v_u_41
		v_u_38 = nil
		v_u_41()
	end)
end
local function v_u_50()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_20
	v_u_2:Create(v_u_5, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
		["Ambient"] = Color3.fromRGB(90, 75, 60),
		["OutdoorAmbient"] = Color3.fromRGB(120, 100, 80),
		["ExposureCompensation"] = 0.1
	}):Play()
	v_u_2:Create(v_u_5.Atmosphere, TweenInfo.new(2.5), {
		["Density"] = 0.08,
		["Haze"] = 0.4,
		["Color"] = Color3.fromRGB(255, 230, 190),
		["Decay"] = Color3.fromRGB(240, 210, 170),
		["Glare"] = 0.1
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(2.5), {
		["TintColor"] = Color3.fromRGB(255, 245, 225),
		["Saturation"] = 0.18,
		["Contrast"] = 0.06,
		["Brightness"] = 0.06
	}):Play()
end
local function v_u_51()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_20
	v_u_2:Create(v_u_5, TweenInfo.new(4), {
		["Ambient"] = v_u_5:GetAttribute("DefaultAmbient") or Color3.fromRGB(70, 70, 70),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ExposureCompensation"] = v_u_5:GetAttribute("DefaultExposure") or 0,
		["Brightness"] = v_u_5:GetAttribute("DefaultBrightness") or 2
	}):Play()
	v_u_2:Create(v_u_5.Atmosphere, TweenInfo.new(4), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(4), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0,
		["Contrast"] = 0,
		["Brightness"] = 0
	}):Play()
end
local function v_u_70()
	-- upvalues: (copy) v_u_12, (ref) v_u_17, (ref) v_u_18, (copy) v_u_10, (copy) v_u_7, (copy) v_u_9, (copy) v_u_16
	local v52 = workspace:FindFirstChild("Visuals")
	if v52 then
		local v_u_53 = v_u_12:WaitForChild("JW_WrapGift", 10)
		local v_u_54 = v_u_12:WaitForChild("JW_GiveGift", 10)
		if v_u_53 and v_u_54 then
			local v_u_55 = v52:WaitForChild("Stage", 10)
			local v_u_56
			if v_u_55 then
				v_u_56 = v_u_55:WaitForChild("Officiant", 5)
			else
				v_u_56 = v_u_55
			end
			if v_u_55 then
				v_u_55 = v_u_55:WaitForChild("Officiant2", 5)
			end
			if v_u_56 and v_u_55 then
				local v57 = v_u_56:FindFirstChildWhichIsA("ProximityPrompt", true)
				local v58 = v_u_55:FindFirstChildWhichIsA("ProximityPrompt", true)
				if v57 and v58 then
					if v_u_10.Character and v_u_10.Character:FindFirstChild("Wedding Gift") or v_u_10.Backpack:FindFirstChild("Wedding Gift") then
						local v59 = not (v_u_18 and v_u_18.Parent) and script:FindFirstChild("GiveGift")
						if v59 then
							v_u_18 = v59:Clone()
							v_u_18.Parent = v_u_55.PrimaryPart or v_u_55:FindFirstChild("HumanoidRootPart")
						end
					else
						local v60 = workspace:GetAttribute("JhaiWedding_GiftActive") and not (v_u_17 and v_u_17.Parent) and script:FindFirstChild("WrapGift")
						if v60 then
							v_u_17 = v60:Clone()
							v_u_17.Parent = v_u_56.PrimaryPart or v_u_56:FindFirstChild("HumanoidRootPart")
						end
					end
					local v64 = v_u_7:Start({
						["ProximityPrompt"] = v57,
						["SpeakingNPC"] = v_u_56,
						["IntroLines"] = { "Hold out a plant and I\'ll wrap it up for the happy couple!" },
						["ExitLine"] = "Come back if you change your mind!",
						["PromptList"] = { "Wrap this", "Nevermind" },
						["OperationMap"] = {
							["Wrap this"] = function()
								-- upvalues: (ref) v_u_9, (copy) v_u_56, (copy) v_u_53, (ref) v_u_17, (ref) v_u_18, (copy) v_u_55
								v_u_9.NpcText(v_u_56, "Let me take a look...", true)
								local v61 = v_u_53:InvokeServer()
								if v61 and v61.ok then
									if v_u_17 then
										v_u_17:Destroy()
										v_u_17 = nil
									end
									if v_u_18 then
										v_u_18:Destroy()
										v_u_18 = nil
									end
									local v62 = not (v_u_18 and v_u_18.Parent) and script:FindFirstChild("GiveGift")
									if v62 then
										v_u_18 = v62:Clone()
										v_u_18.Parent = v_u_55.PrimaryPart or v_u_55:FindFirstChild("HumanoidRootPart")
									end
									v_u_9.NpcText(v_u_56, ("Oh wonderful - a %*! All wrapped up."):format(v61.plantName), true)
									task.wait(2.5)
									v_u_9.NpcText(v_u_56, "Now bring it to the gift attendant!", true)
									task.wait(1.5)
								else
									local v63 = v61 and v61.msg or "Something went wrong."
									if v63 ~= "" then
										v_u_9.NpcText(v_u_56, v63, true)
										task.wait(2.5)
									end
								end
							end
						},
						["OnDialogueStarted"] = function() end,
						["OnDialogueEnded"] = function() end
					})
					local v65 = v_u_16
					table.insert(v65, v64)
					local v68 = v_u_7:Start({
						["ProximityPrompt"] = v58,
						["SpeakingNPC"] = v_u_55,
						["IntroLines"] = { "Got a gift for the happy couple?" },
						["ExitLine"] = "No worries!",
						["PromptList"] = { "Give Gift", "Nevermind" },
						["OperationMap"] = {
							["Give Gift"] = function()
								-- upvalues: (ref) v_u_9, (copy) v_u_55, (copy) v_u_54, (ref) v_u_17, (ref) v_u_18
								v_u_9.NpcText(v_u_55, "One moment...", true)
								local v66 = v_u_54:InvokeServer()
								if v66 and v66.ok then
									if v_u_17 then
										v_u_17:Destroy()
										v_u_17 = nil
									end
									if v_u_18 then
										v_u_18:Destroy()
										v_u_18 = nil
									end
									v_u_9.NpcText(v_u_55, "Wonderful, they\'ll love it!", true)
									task.wait(2.5)
									v_u_9.NpcText(v_u_55, ("Here, take this %* and a %* seed as a thank you."):format(v66.reward, v66.seed), true)
									task.wait(2.5)
								else
									local v67 = v66 and v66.msg or "Something went wrong."
									if v67 ~= "" then
										v_u_9.NpcText(v_u_55, v67, true)
										task.wait(2.5)
									end
								end
							end
						},
						["OnDialogueStarted"] = function() end,
						["OnDialogueEnded"] = function() end
					})
					local v69 = v_u_16
					table.insert(v69, v68)
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
local function v_u_72()
	-- upvalues: (copy) v_u_16
	for _, v71 in v_u_16 do
		if v71 and v71.Destroy then
			v71:Destroy()
		end
	end
	table.clear(v_u_16)
end
local v_u_73 = {}
local function v_u_78()
	-- upvalues: (copy) v_u_73
	local v74 = workspace:FindFirstChild("Visuals")
	if v74 then
		v74 = workspace.Visuals:FindFirstChild("Stage")
	end
	if v74 then
		for _, v75 in { "Jhai", "Wife", "Pastor" } do
			local v76 = v74:FindFirstChild(v75)
			if v76 then
				for _, v77 in v76:GetDescendants() do
					if v77:IsA("BasePart") and v77.Name ~= "HumanoidRootPart" then
						v_u_73[v77] = v77.Transparency
						v77.Transparency = 1
					end
				end
			end
		end
	end
end
local v_u_79 = nil
local v_u_80 = nil
local function v_u_81()
	-- upvalues: (ref) v_u_79, (copy) v_u_10, (ref) v_u_80
	if not (v_u_79 and v_u_79.Parent) then
		v_u_79 = Instance.new("ScreenGui")
		v_u_79.Name = "JhaiWeddingCrossfade"
		v_u_79.DisplayOrder = 1000
		v_u_79.IgnoreGuiInset = true
		v_u_79.ResetOnSpawn = false
		v_u_79.Parent = v_u_10.PlayerGui
		v_u_80 = Instance.new("Frame")
		v_u_80.Size = UDim2.new(1, 0, 1, 0)
		v_u_80.BackgroundColor3 = Color3.new(0, 0, 0)
		v_u_80.BackgroundTransparency = 1
		v_u_80.BorderSizePixel = 0
		v_u_80.Parent = v_u_79
	end
end
local function v_u_83(p82)
	-- upvalues: (copy) v_u_81, (ref) v_u_80, (copy) v_u_2
	v_u_81()
	v_u_80.BackgroundTransparency = 1
	v_u_2:Create(v_u_80, TweenInfo.new(p82, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		["BackgroundTransparency"] = 0
	}):Play()
	task.wait(p82)
end
local function v_u_85(p84)
	-- upvalues: (copy) v_u_81, (ref) v_u_80, (copy) v_u_2
	v_u_81()
	v_u_80.BackgroundTransparency = 0
	v_u_2:Create(v_u_80, TweenInfo.new(p84, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["BackgroundTransparency"] = 1
	}):Play()
	task.wait(p84)
end
local function v_u_90()
	-- upvalues: (ref) v_u_13, (copy) v_u_72, (copy) v_u_14, (copy) v_u_36, (ref) v_u_17, (ref) v_u_18, (copy) v_u_41, (ref) v_u_79, (ref) v_u_80, (copy) v_u_73, (copy) v_u_51, (copy) v_u_3, (copy) v_u_8, (copy) v_u_2, (copy) v_u_11
	if v_u_13 then
		v_u_13 = false
		v_u_72()
		for _, v86 in v_u_14 do
			if typeof(v86) == "RBXScriptConnection" then
				v86:Disconnect()
			end
		end
		table.clear(v_u_14)
		v_u_36()
		if v_u_17 then
			v_u_17:Destroy()
			v_u_17 = nil
		end
		if v_u_18 then
			v_u_18:Destroy()
			v_u_18 = nil
		end
		v_u_41()
		if v_u_79 and v_u_79.Parent then
			v_u_79:Destroy()
		end
		v_u_79 = nil
		v_u_80 = nil
		for v87, v88 in v_u_73 do
			if v87 and v87.Parent then
				v87.Transparency = v88
			end
		end
		table.clear(v_u_73)
		cutsceneHandled = false
		v_u_51()
		for _, v89 in v_u_3:GetTagged("JhaiWeddingMusic") do
			if v89:IsA("Sound") then
				v89:Stop()
				v89:Destroy()
			end
		end
		v_u_8.Stop("JhaiWedding")
		v_u_2:Create(v_u_11, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["FieldOfView"] = 70
		}):Play()
	end
end
local function v_u_92()
	-- upvalues: (ref) v_u_13, (copy) v_u_72, (ref) v_u_17, (ref) v_u_18, (copy) v_u_49
	local v91 = workspace:GetAttribute("JhaiWedding_GiftActive")
	if v_u_13 then
		if not v91 then
			if v91 == false then
				v_u_72()
				if v_u_17 then
					v_u_17:Destroy()
					v_u_17 = nil
				end
				if v_u_18 then
					v_u_18:Destroy()
					v_u_18 = nil
				end
				if not (workspace:GetAttribute("JhaiWedding_Cutscene") or (workspace:GetAttribute("JhaiWedding_Hug") or workspace:GetAttribute("JhaiWedding_Celebration"))) then
					v_u_49("The ceremony is beginning...", Color3.fromRGB(220, 195, 130), 4)
				end
			end
		end
	else
		return
	end
end
local v_u_93 = false
local function v_u_104()
	-- upvalues: (ref) v_u_13, (ref) v_u_93, (copy) v_u_83, (copy) v_u_78, (copy) v_u_6, (copy) v_u_11, (copy) v_u_85, (copy) v_u_81, (copy) v_u_2, (ref) v_u_80, (copy) v_u_73, (ref) v_u_79
	if v_u_13 then
		if workspace:GetAttribute("JhaiWedding_Cutscene") then
			if v_u_93 then
				return
			else
				v_u_93 = true
				v_u_83(1.5)
				v_u_78()
				local v_u_94 = v_u_6:FindFirstChild("Music")
				local v95
				if v_u_94 then
					v_u_94.Volume = 1
					v95 = v_u_94:GetPropertyChangedSignal("Volume"):Connect(function()
						-- upvalues: (ref) v_u_13, (ref) v_u_93, (copy) v_u_94
						if v_u_13 and v_u_93 then
							v_u_94.Volume = 1
						end
					end)
				else
					v95 = nil
				end
				if not workspace:GetAttribute("JhaiWedding_CutsceneReady") then
					local v96 = 0
					while v_u_11.CameraType ~= Enum.CameraType.Scriptable and (not workspace:GetAttribute("JhaiWedding_CutsceneReady") and (v_u_13 and v96 < 10)) do
						task.wait(0.05)
						v96 = v96 + 0.05
					end
					if v_u_11.CameraType == Enum.CameraType.Scriptable then
						task.wait(1)
						v_u_85(1.5)
						local v97 = 0
						local v98 = false
						while v_u_11.CameraType == Enum.CameraType.Scriptable and (v_u_13 and v97 < 60) do
							task.wait(0.1)
							v97 = v97 + 0.1
							if v97 >= 1 and not v98 then
								v_u_81()
								v_u_2:Create(v_u_80, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
									["BackgroundTransparency"] = 0
								}):Play()
								v98 = true
							end
						end
						v_u_81()
						v_u_80.BackgroundTransparency = 0
					end
				end
				if v_u_13 then
					local v99 = 0
					while not workspace:GetAttribute("JhaiWedding_CutsceneReady") and (v_u_13 and v99 < 30) do
						task.wait(0.1)
						v99 = v99 + 0.1
					end
					if v95 then
						v95:Disconnect()
					end
					for v100, v101 in v_u_73 do
						if v100 and v100.Parent then
							v100.Transparency = v101
						end
					end
					table.clear(v_u_73)
					task.wait(0.3)
					v_u_85(1.5)
					if v_u_79 and v_u_79.Parent then
						v_u_79:Destroy()
					end
					v_u_79 = nil
					v_u_80 = nil
					v_u_93 = false
				else
					if v95 then
						v95:Disconnect()
					end
					for v102, v103 in v_u_73 do
						if v102 and v102.Parent then
							v102.Transparency = v103
						end
					end
					table.clear(v_u_73)
					if v_u_79 and v_u_79.Parent then
						v_u_79:Destroy()
					end
					v_u_79 = nil
					v_u_80 = nil
					v_u_93 = false
				end
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_105()
	-- upvalues: (ref) v_u_13, (copy) v_u_2, (copy) v_u_20, (copy) v_u_34
	if workspace:GetAttribute("JhaiWedding_Confetti") then
		if v_u_13 then
			v_u_2:Create(v_u_20, TweenInfo.new(0.07), {
				["Brightness"] = 0.55,
				["TintColor"] = Color3.fromRGB(255, 250, 240)
			}):Play()
			task.delay(0.12, function()
				-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) v_u_20
				if v_u_13 then
					v_u_2:Create(v_u_20, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
						["Brightness"] = 0.06,
						["TintColor"] = Color3.fromRGB(255, 245, 225)
					}):Play()
				end
			end)
			v_u_34(50, 20, 10)
		end
	else
		return
	end
end
local function v_u_106()
	-- upvalues: (ref) v_u_13, (copy) v_u_2, (copy) v_u_11, (copy) v_u_20, (copy) v_u_34
	if workspace:GetAttribute("JhaiWedding_Hug") then
		if v_u_13 then
			v_u_2:Create(v_u_11, TweenInfo.new(0.2), {
				["FieldOfView"] = 78
			}):Play()
			task.delay(0.25, function()
				-- upvalues: (ref) v_u_2, (ref) v_u_11
				v_u_2:Create(v_u_11, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					["FieldOfView"] = 70
				}):Play()
			end)
			v_u_2:Create(v_u_20, TweenInfo.new(0.08), {
				["Brightness"] = 0.8,
				["TintColor"] = Color3.fromRGB(255, 245, 200),
				["Saturation"] = 0.4
			}):Play()
			task.delay(0.15, function()
				-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) v_u_20
				if v_u_13 then
					v_u_2:Create(v_u_20, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
						["Brightness"] = 0.12,
						["TintColor"] = Color3.fromRGB(255, 240, 210),
						["Saturation"] = 0.25
					}):Play()
				end
			end)
			v_u_34(120, 28, 12)
		end
	else
		return
	end
end
local function v_u_107()
	-- upvalues: (ref) v_u_13, (copy) v_u_2, (copy) v_u_5, (copy) v_u_20, (copy) v_u_34, (copy) v_u_21
	if workspace:GetAttribute("JhaiWedding_Celebration") then
		if v_u_13 then
			v_u_2:Create(v_u_5, TweenInfo.new(2), {
				["Ambient"] = Color3.fromRGB(110, 90, 70),
				["OutdoorAmbient"] = Color3.fromRGB(140, 115, 90)
			}):Play()
			v_u_2:Create(v_u_20, TweenInfo.new(2), {
				["Brightness"] = 0.14,
				["Saturation"] = 0.25,
				["TintColor"] = Color3.fromRGB(255, 238, 200)
			}):Play()
			task.spawn(function()
				-- upvalues: (ref) v_u_13, (ref) v_u_34, (ref) v_u_21
				while v_u_13 and workspace:GetAttribute("JhaiWedding_Celebration") do
					v_u_34(30, 22, 10)
					task.wait(v_u_21:NextNumber(3, 5))
				end
			end)
		end
	else
		return
	end
end
local function v_u_119()
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	local v108 = script:FindFirstChild("WeddingSplash")
	if v108 then
		local v109 = v108:Clone()
		v109.Parent = v_u_10.PlayerGui
		local v110 = v109:FindFirstChild("Frame")
		local v111
		if v110 then
			v111 = v110:FindFirstChild("Main")
		else
			v111 = v110
		end
		if v111 then
			v111 = v111:FindFirstChild("Detail")
		end
		local v112
		if v111 then
			v112 = v111:FindFirstChild("Jhai")
		else
			v112 = v111
		end
		local v113
		if v111 then
			v113 = v111:FindFirstChild("Wife")
		else
			v113 = v111
		end
		local v114
		if v111 then
			v114 = v111:FindFirstChild("TreeLeft")
		else
			v114 = v111
		end
		if v111 then
			v111 = v111:FindFirstChild("TreeRight")
		end
		if v110 then
			v110.Position = UDim2.fromScale(0.5, 1.4)
			if v112 then
				v112.ImageTransparency = 1
				v112.Position = UDim2.new(-0.976, 0, -1.468, 0)
			end
			if v113 then
				v113.ImageTransparency = 1
				v113.Position = UDim2.new(0.726, 0, -1.468, 0)
			end
			if v114 then
				v114.Rotation = -60
			end
			if v111 then
				v111.Rotation = 60
			end
			local v115 = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			local v116 = TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local v117 = TweenInfo.new(2.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
			local v118 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			v_u_2:Create(v110, v115, {
				["Position"] = UDim2.fromScale(0.5, 0.7)
			}):Play()
			if v114 then
				v_u_2:Create(v114, v117, {
					["Rotation"] = 0
				}):Play()
			end
			if v111 then
				v_u_2:Create(v111, v117, {
					["Rotation"] = 0
				}):Play()
			end
			task.wait(0.5)
			if v112 then
				v_u_2:Create(v112, v116, {
					["ImageTransparency"] = 0,
					["Position"] = UDim2.new(-0.376, 0, -1.468, 0)
				}):Play()
			end
			if v113 then
				v_u_2:Create(v113, v116, {
					["ImageTransparency"] = 0,
					["Position"] = UDim2.new(-0.126, 0, -1.468, 0)
				}):Play()
			end
			task.wait(3)
			v_u_2:Create(v110, v118, {
				["Position"] = UDim2.fromScale(0.5, 1.4)
			}):Play()
			task.wait(0.7)
			v109:Destroy()
		else
			v109:Destroy()
		end
	else
		return
	end
end
local function v_u_135()
	-- upvalues: (ref) v_u_13, (copy) v_u_119, (copy) v_u_8, (copy) v_u_50, (copy) v_u_92, (copy) v_u_70, (copy) v_u_14, (copy) v_u_104, (copy) v_u_105, (copy) v_u_106, (copy) v_u_107, (copy) v_u_90
	if not v_u_13 then
		v_u_13 = true
		task.spawn(v_u_119)
		v_u_8.Start("JhaiWedding", {
			["priority"] = 10
		})
		v_u_50()
		task.defer(v_u_92)
		task.spawn(v_u_70)
		local v120 = workspace:GetAttributeChangedSignal("JhaiWedding_GiftActive")
		local v121 = v_u_92
		local v122 = v_u_14
		table.insert(v122, v120:Connect(v121))
		local v123 = workspace:GetAttributeChangedSignal("JhaiWedding_Cutscene")
		local v124 = v_u_104
		local v125 = v_u_14
		table.insert(v125, v123:Connect(v124))
		local v126 = workspace:GetAttributeChangedSignal("JhaiWedding_Confetti")
		local v127 = v_u_105
		local v128 = v_u_14
		table.insert(v128, v126:Connect(v127))
		local v129 = workspace:GetAttributeChangedSignal("JhaiWedding_Hug")
		local v130 = v_u_106
		local v131 = v_u_14
		table.insert(v131, v129:Connect(v130))
		local v132 = workspace:GetAttributeChangedSignal("JhaiWedding_Celebration")
		local v133 = v_u_107
		local v134 = v_u_14
		table.insert(v134, v132:Connect(v133))
		if workspace:GetAttribute("JhaiWedding_Cutscene") then
			task.defer(v_u_104)
		end
		if workspace:GetAttribute("JhaiWedding_Confetti") then
			task.defer(v_u_105)
		end
		if workspace:GetAttribute("JhaiWedding_Hug") then
			task.defer(v_u_106)
		end
		if workspace:GetAttribute("JhaiWedding_Celebration") then
			task.defer(v_u_107)
		end
		repeat
			task.wait(0.3)
		until not workspace:GetAttribute("JhaiWedding")
		v_u_90()
	end
end
workspace:GetAttributeChangedSignal("JhaiWedding"):Connect(function()
	-- upvalues: (copy) v_u_135, (copy) v_u_90
	if workspace:GetAttribute("JhaiWedding") then
		task.defer(v_u_135)
	else
		v_u_90()
	end
end)
if workspace:GetAttribute("JhaiWedding") then
	task.defer(v_u_135)
end
return v1