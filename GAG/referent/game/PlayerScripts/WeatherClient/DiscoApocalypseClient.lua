local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
local v5 = game:GetService("Players")
local v6 = game:GetService("ReplicatedStorage")
local v7 = v6:WaitForChild("Modules")
local v_u_8 = require(v7.Trove)
local v_u_9 = require(v7.SkyboxManager)
local v_u_10 = require(v6.Modules.WeatherMusicManager)
local v_u_11 = require(v6.Data.SoundData)
local v_u_12 = require(v6.Code.GroundCrack)
local v_u_13 = require(v6.Code.SebasUtil)
local v14 = require(game.ReplicatedStorage.Code.CameraShaker)
require(game.ReplicatedStorage.Code.CameraShaker.CameraShakeInstance)
local v_u_15 = v5.LocalPlayer
local v_u_16 = workspace.CurrentCamera
local v_u_17 = v6:WaitForChild("GameEvents")
local v_u_18 = script:WaitForChild("Assets")
local v_u_19 = workspace:WaitForChild("WeatherVisuals")
local v_u_20 = v_u_4.ColorCorrection:Clone()
v_u_20.Name = "DiscoApocalypse"
v_u_20.Parent = v_u_4
local v_u_21 = script.Assets:FindFirstChild("Sky")
if v_u_21 then
	v_u_9.AddSkybox(v_u_21)
end
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_33 = v14.new(Enum.RenderPriority.Last.Value, function(p31)
	-- upvalues: (copy) v_u_16
	local v32 = v_u_16
	v32.CFrame = v32.CFrame * p31
end)
v_u_33:Start()
local v_u_34 = Random.new(os.clock())
local function v_u_35()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_20
	v_u_2:Create(v_u_4, TweenInfo.new(3, Enum.EasingStyle.Sine), {
		["Ambient"] = Color3.fromRGB(80, 10, 10),
		["OutdoorAmbient"] = Color3.fromRGB(60, 10, 10),
		["ExposureCompensation"] = -0.4
	}):Play()
	v_u_2:Create(v_u_4.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.35,
		["Haze"] = 0.8,
		["Color"] = Color3.fromRGB(180, 60, 60),
		["Decay"] = Color3.fromRGB(120, 30, 30)
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(3), {
		["TintColor"] = Color3.fromRGB(255, 180, 180),
		["Saturation"] = 0.3,
		["Contrast"] = 0.1,
		["Brightness"] = -0.1
	}):Play()
end
local function v_u_36()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_20, (copy) v_u_21, (copy) v_u_9
	v_u_2:Create(v_u_4, TweenInfo.new(2), {
		["Ambient"] = Color3.fromRGB(60, 162, 230),
		["Brightness"] = 1
	}):Play()
	v_u_2:Create(v_u_4.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0.436,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(2), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0,
		["Contrast"] = 0
	}):Play()
	if v_u_21 then
		v_u_9.UpdateSkybox(v_u_21, 2)
	end
end
local v_u_37 = {
	Color3.fromRGB(255, 80, 200),
	Color3.fromRGB(60, 120, 255),
	Color3.fromRGB(255, 220, 50),
	Color3.fromRGB(60, 220, 100)
}
local function v_u_41()
	-- upvalues: (copy) v_u_37, (copy) v_u_4, (copy) v_u_2
	for v_u_38 = 1, #v_u_37 do
		task.delay((v_u_38 - 1) * 0.14, function()
			-- upvalues: (ref) v_u_37, (copy) v_u_38, (ref) v_u_4, (ref) v_u_2
			local v_u_39 = Instance.new("ColorCorrectionEffect")
			v_u_39.TintColor = v_u_37[v_u_38]
			v_u_39.Brightness = 0.9
			v_u_39.Saturation = 1
			v_u_39.Parent = v_u_4
			local v40 = v_u_2:Create(v_u_39, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Brightness"] = 0,
				["Saturation"] = 0,
				["TintColor"] = Color3.new(1, 1, 1)
			})
			v40:Play()
			v40.Completed:Once(function()
				-- upvalues: (copy) v_u_39
				v_u_39:Destroy()
			end)
		end)
	end
end
local function v_u_44()
	-- upvalues: (copy) v_u_4, (copy) v_u_37, (copy) v_u_34, (copy) v_u_2
	local v_u_42 = Instance.new("ColorCorrectionEffect")
	v_u_42.Parent = v_u_4
	v_u_42.TintColor = v_u_37[v_u_34:NextInteger(1, #v_u_37)]
	v_u_2:Create(v_u_42, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Brightness"] = 1,
		["Saturation"] = -1,
		["Contrast"] = 1
	}):Play()
	task.delay(0.08, function()
		-- upvalues: (ref) v_u_2, (copy) v_u_42
		local v43 = v_u_2:Create(v_u_42, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["Contrast"] = 0
		})
		v43:Play()
		v43.Completed:Once(function()
			-- upvalues: (ref) v_u_42
			v_u_42:Destroy()
		end)
	end)
end
local function v_u_45()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_20, (copy) v_u_21, (copy) v_u_9
	v_u_2:Create(v_u_4, TweenInfo.new(4), {
		["Ambient"] = v_u_4:GetAttribute("DefaultAmbient") or Color3.fromRGB(70, 70, 70),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ExposureCompensation"] = v_u_4:GetAttribute("DefaultExposure") or 0,
		["Brightness"] = v_u_4:GetAttribute("DefaultBrightness") or 2
	}):Play()
	v_u_2:Create(v_u_4.Atmosphere, TweenInfo.new(4), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	v_u_2:Create(v_u_20, TweenInfo.new(4), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0,
		["Contrast"] = 0,
		["Brightness"] = 0
	}):Play()
	if v_u_21 then
		v_u_9.UpdateSkybox(v_u_21, 0)
	end
end
local function v_u_124(p_u_46)
	-- upvalues: (copy) v_u_35, (copy) v_u_21, (copy) v_u_9, (ref) v_u_27, (copy) v_u_18, (copy) v_u_19, (ref) v_u_28, (copy) v_u_3, (copy) v_u_16, (copy) v_u_13, (copy) v_u_33, (ref) v_u_23, (copy) v_u_2, (copy) v_u_41, (copy) v_u_36, (ref) v_u_29, (ref) v_u_30, (copy) v_u_15, (ref) v_u_25, (copy) v_u_17, (ref) v_u_26, (copy) v_u_10, (copy) v_u_11, (copy) v_u_34
	local v47 = workspace:GetAttribute("DiscoApocalypse_Phase")
	if v47 == "apocalypse" then
		v_u_35()
		if v_u_21 then
			v_u_9.UpdateSkybox(v_u_21, 0)
		end
		v_u_27 = p_u_46:Add(v_u_18.RiftScreenEffect:Clone())
		v_u_27.Parent = v_u_19
		v_u_28 = p_u_46:Add(v_u_3.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_27, (ref) v_u_16
			if v_u_27 and v_u_27.Parent then
				v_u_27.CFrame = v_u_16.CFrame * CFrame.new(0, 0, -1.7)
			end
		end))
		return
	elseif v47 == "twist" then
		local v48 = p_u_46:Add(v_u_18.RiftColorEffect:Clone())
		v48.Parent = v_u_19
		v_u_13:EmitAll(v48)
		v_u_33:ShakeOnce(6, 8, 0, 0.5)
		v_u_35()
		if v_u_21 then
			v_u_9.UpdateSkybox(v_u_21, 0)
		end
		p_u_46:Add(task.spawn(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_2, (ref) v_u_27
			local v49 = {
				Color3.fromRGB(255, 60, 60),
				Color3.fromRGB(255, 140, 0),
				Color3.fromRGB(255, 220, 50),
				Color3.fromRGB(60, 220, 100),
				Color3.fromRGB(60, 120, 255),
				Color3.fromRGB(180, 60, 255),
				Color3.fromRGB(255, 80, 200)
			}
			local v50 = 1
			while true do
				if v_u_23 then
					local v51 = v_u_23.Model
					if v51 then
						v51 = v_u_23.Model.PrimaryPart
					end
					if v51 and v51.Parent then
						v_u_2:Create(v51, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
							["Color"] = v49[v50]
						}):Play()
					end
				end
				v50 = v50 % #v49 + 1
				if v_u_27 and v_u_27.Parent then
					local v52 = v_u_27.Attachment
					if v52 then
						v52 = v_u_27.Attachment.Particle
					end
					if v52 then
						v52.Color = ColorSequence.new(v49[v50])
					end
				end
				task.wait(0.6)
			end
		end), task.cancel)
		p_u_46:Add(task.spawn(function()
			-- upvalues: (ref) v_u_19
			local v53 = {}
			local v54 = 0
			for _, v55 in v_u_19:GetChildren() do
				if v55.Name:match("^RiftBranch_") then
					for _, v56 in v55:GetDescendants() do
						if v56:IsA("BasePart") and v56.Name ~= "BlackPart" then
							local v57 = v56:GetAttribute("Depth")
							if v57 then
								if not v53[v57] then
									v53[v57] = {}
								end
								local v58 = v53[v57]
								table.insert(v58, v56)
								if v54 < v57 then
									v54 = v57
								end
							end
						end
					end
				end
			end
			if v54 ~= 0 then
				local v59 = v54 * 2
				local v60 = math.max(2, v59)
				local v61 = os.clock()
				while true do
					local v62 = os.clock() - v61
					if v62 >= 21.1 then
						break
					end
					local v63 = (v62 / 21.1) ^ 2
					local v64 = v62 * math.lerp(0.4, 16, v63)
					for v65 = v54, 1, -1 do
						local v66 = v53[v65]
						if v66 then
							local v67 = (v54 - v65 + v64) % v60 / v60
							local v68 = Color3.fromHSV(v67, 1, 1)
							for _, v69 in v66 do
								if v69.Parent then
									v69.Color = v68
									for _, v70 in v69:GetChildren() do
										if v70:IsA("Beam") then
											v70.Color = ColorSequence.new(v68)
										elseif v70:IsA("ParticleEmitter") then
											v70.Color = ColorSequence.new(v68)
										end
									end
								end
							end
						end
					end
					task.wait(0.05)
				end
			end
		end), task.cancel)
		return
	elseif v47 == "disco" then
		p_u_46:Add(task.spawn(function()
			-- upvalues: (ref) v_u_23, (ref) v_u_41, (ref) v_u_28, (ref) v_u_27, (ref) v_u_36, (ref) v_u_33, (ref) v_u_29, (copy) p_u_46, (ref) v_u_18, (ref) v_u_19, (ref) v_u_30, (ref) v_u_3, (ref) v_u_16, (ref) v_u_15, (ref) v_u_25, (ref) v_u_17, (ref) v_u_26, (ref) v_u_10, (ref) v_u_11, (ref) v_u_2
			if v_u_23 then
				v_u_23:Destroy()
			end
			v_u_23 = nil
			v_u_41()
			if v_u_28 then
				v_u_28:Disconnect()
			end
			if v_u_27 then
				v_u_27:Destroy()
				v_u_27 = nil
			end
			v_u_36()
			v_u_33:ShakeOnce(12, 10, 0, 1)
			v_u_29 = p_u_46:Add(v_u_18.DiscoScreenEffect:Clone())
			v_u_29.Parent = v_u_19
			v_u_30 = p_u_46:Add(v_u_3.RenderStepped:Connect(function()
				-- upvalues: (ref) v_u_29, (ref) v_u_16
				if v_u_29 and v_u_29.Parent then
					v_u_29.CFrame = v_u_16.CFrame * CFrame.new(0, 0, -1.7)
				end
			end))
			local v71 = v_u_19:WaitForChild("DiscoMap", 30)
			if v71 then
				local v_u_72 = v71:WaitForChild("Disco Ball")
				if v_u_72 then
					p_u_46:Add(v_u_3.RenderStepped:Connect(function(p73)
						-- upvalues: (copy) v_u_72
						if v_u_72 and v_u_72.Parent then
							v_u_72:PivotTo(v_u_72:GetPivot() * CFrame.Angles(0, 1.5707963267948966 * p73, 0))
						end
					end))
					local v_u_74 = nil
					local v_u_75 = nil
					local v_u_76 = nil
					local v77 = v71:FindFirstChild("BW_DJ_Set")
					v77 = v77
					local v78
					if v77 then
						v78 = v77:FindFirstChild("jhailatte")
					else
						v78 = v77
					end
					if v78 then
						local v79 = v78:FindFirstChildOfClass("Humanoid")
						if v79 then
							v79 = v79:FindFirstChildOfClass("Animator")
						end
						if v79 then
							local v80 = v79:LoadAnimation(v_u_18.Animation)
							v80.Looped = true
							v80:Play()
							v_u_74 = v79:LoadAnimation(v_u_18.Up)
						end
						v_u_75 = v78:FindFirstChild("HumanoidRootPart")
						if v_u_75 then
							v_u_75 = v_u_75:FindFirstChild("Emit")
						end
					end
					local v81 = v77
					if v81 then
						v81 = v77:FindFirstChild("DJJhai")
					end
					if v81 then
						v_u_76 = v81:FindFirstChild("DJBooth")
						if v_u_76 then
							v_u_76 = v_u_76:FindFirstChild("Speakers")
						end
					end
					local v_u_82 = false
					local v_u_83 = Instance.new("ScreenGui")
					v_u_83.Name = "DA_RoundCounter"
					v_u_83.DisplayOrder = 997
					v_u_83.ResetOnSpawn = false
					v_u_83.IgnoreGuiInset = true
					v_u_83.Parent = v_u_15.PlayerGui
					v_u_25 = v_u_83
					local v84 = Instance.new("Frame")
					v84.AnchorPoint = Vector2.new(0.5, 0)
					v84.Position = UDim2.new(0.5, 0, 0.06, 0)
					v84.Size = UDim2.new(0, 230, 0, 48)
					v84.BackgroundColor3 = Color3.new(0, 0, 0)
					v84.BackgroundTransparency = 0.35
					v84.BorderSizePixel = 0
					v84.Parent = v_u_83
					local v85 = Instance.new("UICorner")
					v85.CornerRadius = UDim.new(0, 10)
					v85.Parent = v84
					local v_u_86 = Instance.new("TextLabel")
					v_u_86.Size = UDim2.new(1, -16, 1, 0)
					v_u_86.Position = UDim2.new(0, 8, 0, 0)
					v_u_86.BackgroundTransparency = 1
					v_u_86.Text = ""
					v_u_86.TextColor3 = Color3.new(1, 1, 1)
					v_u_86.Font = Enum.Font.GothamBold
					v_u_86.TextScaled = true
					v_u_86.Parent = v84
					local v87 = Instance.new("UIStroke")
					v87.Color = Color3.new(0, 0, 0)
					v87.Thickness = 2
					v87.Transparency = 0
					v87.Parent = v_u_86
					local function v_u_90()
						-- upvalues: (copy) v_u_83, (ref) v_u_82, (copy) v_u_86
						if v_u_83.Parent then
							if v_u_82 then
								v_u_86.Text = "ELIMINATED"
								v_u_86.TextColor3 = Color3.fromRGB(255, 60, 60)
							else
								local v88 = workspace:GetAttribute("DiscoApocalypse_Round")
								local v89 = workspace:GetAttribute("DiscoApocalypse_TotalRounds")
								if v88 and v89 then
									v_u_86.Text = "Round " .. v88 .. " / " .. v89
									v_u_86.TextColor3 = Color3.new(1, 1, 1)
								end
							end
						else
							return
						end
					end
					p_u_46:Connect(workspace:GetAttributeChangedSignal("DiscoApocalypse_Round"), v_u_90)
					v_u_90()
					local v91 = v_u_17:WaitForChild("DA_Eliminated", 15)
					if v91 then
						p_u_46:Connect(v91.OnClientEvent, function()
							-- upvalues: (ref) v_u_82, (copy) v_u_90
							v_u_82 = true
							v_u_90()
						end)
					end
					v_u_26 = v_u_10.Start("DiscoApocalypse", {
						["soundId"] = v_u_11.Weather.DiscoApocalypse.Music,
						["priority"] = 14,
						["volume"] = 0.7
					})
					local v_u_92 = false
					local v_u_93 = 0
					p_u_46:Add(task.spawn(function()
						-- upvalues: (ref) v_u_26, (ref) v_u_92, (ref) v_u_75, (ref) v_u_2, (ref) v_u_16, (ref) v_u_93, (ref) v_u_74, (ref) v_u_76
						local v94 = nil
						while v_u_26 and v_u_26.Parent do
							task.wait(0)
							local v95 = (v_u_26.PlaybackLoudness - 200) / 700
							local v96 = math.clamp(v95, 0, 1)
							if v94 and (v_u_26.PlaybackLoudness / 1000 - v94 > 0.2 and not v_u_92) then
								if v_u_75 then
									for _, v97 in v_u_75:GetChildren() do
										if v97:IsA("ParticleEmitter") then
											v97:Emit(v97:GetAttribute("EmitCount") or 1)
										end
									end
								end
								v_u_2:Create(v_u_16, TweenInfo.new(0.2), {
									["FieldOfView"] = 68
								}):Play()
								task.delay(0.2, function()
									-- upvalues: (ref) v_u_2, (ref) v_u_16
									v_u_2:Create(v_u_16, TweenInfo.new(0.3), {
										["FieldOfView"] = 70
									}):Play()
								end)
							end
							v94 = v_u_26.PlaybackLoudness / 1000
							if v96 > 0.25 then
								local v_u_98 = tick()
								v_u_93 = v_u_98
								if not v_u_92 then
									v_u_92 = true
									if v_u_74 then
										v_u_74:Play()
									end
									v_u_2:Create(v_u_16, TweenInfo.new(0.5), {
										["FieldOfView"] = 85
									}):Play()
									task.spawn(function()
										-- upvalues: (ref) v_u_92, (ref) v_u_75, (ref) v_u_2, (ref) v_u_16
										while v_u_92 do
											if v_u_75 then
												for _, v99 in v_u_75:GetChildren() do
													if v99:IsA("ParticleEmitter") then
														v99:Emit(v99:GetAttribute("EmitCount") or 1)
													end
												end
											end
											v_u_2:Create(v_u_16, TweenInfo.new(0.2), {
												["FieldOfView"] = 68
											}):Play()
											task.delay(0.2, function()
												-- upvalues: (ref) v_u_2, (ref) v_u_16
												v_u_2:Create(v_u_16, TweenInfo.new(0.3), {
													["FieldOfView"] = 70
												}):Play()
											end)
											task.wait(0.5)
										end
									end)
								end
								task.delay(1, function()
									-- upvalues: (ref) v_u_93, (copy) v_u_98, (ref) v_u_92, (ref) v_u_74, (ref) v_u_2, (ref) v_u_16
									if v_u_93 == v_u_98 then
										v_u_92 = false
										if v_u_74 then
											v_u_74:Stop()
										end
										v_u_2:Create(v_u_16, TweenInfo.new(3), {
											["FieldOfView"] = 70
										}):Play()
									end
								end)
							end
							if v_u_76 then
								for _, v100 in v_u_76:GetChildren() do
									if v100:IsA("BasePart") then
										local v101 = v100:FindFirstChildOfClass("BlockMesh")
										if v101 then
											local v102 = v96 * -1.4
											v101.Offset = Vector3.new(0, v102, 0)
											v101.Scale = Vector3.new(1, 1, 1) * (v96 * 0.4 + 1)
										end
									end
								end
							end
						end
					end), task.cancel)
				else
					warn("Disco Ball not found in DiscoMap")
				end
			else
				warn("DiscoMap not found")
				return
			end
		end), task.cancel)
	elseif v47 == "pinata" then
		if v_u_25 then
			v_u_25:Destroy()
			v_u_25 = nil
		end
		v_u_36()
		p_u_46:Add(task.spawn(function()
			-- upvalues: (ref) v_u_17, (copy) p_u_46, (ref) v_u_34, (ref) v_u_2, (ref) v_u_33, (ref) v_u_13
			local v103 = v_u_17:WaitForChild("DA_PinataHit", 20)
			local v104 = v_u_17:WaitForChild("DA_PinataBroken", 20)
			if v103 and v104 then
				local v_u_105 = workspace:WaitForChild("WeatherVisuals"):WaitForChild("Pinata", 15)
				if v_u_105 then
					local v_u_106 = Instance.new("Highlight")
					v_u_106.FillTransparency = 1
					v_u_106.OutlineColor = Color3.new(1, 1, 1)
					v_u_106.OutlineTransparency = 1
					v_u_106.Parent = v_u_105
					p_u_46:Add(v_u_106)
					local v107 = v_u_105:FindFirstChildWhichIsA("ProximityPrompt", true)
					if v107 then
						p_u_46:Connect(v107.PromptShown, function()
							-- upvalues: (copy) v_u_106
							v_u_106.OutlineTransparency = 0
						end)
						p_u_46:Connect(v107.PromptHidden, function()
							-- upvalues: (copy) v_u_106
							v_u_106.OutlineTransparency = 1
						end)
					end
				end
				local v_u_108 = {}
				if v_u_105 then
					for _, v109 in v_u_105:GetDescendants() do
						if v109:IsA("BasePart") then
							v_u_108[v109] = v109.CFrame
						end
					end
				end
				local v_u_110 = false
				local v_u_111 = false
				local function v_u_121()
					-- upvalues: (ref) v_u_110, (copy) v_u_105, (copy) v_u_108, (ref) v_u_34, (ref) v_u_2
					if not v_u_110 and v_u_105 then
						v_u_110 = true
						local v112 = v_u_105:GetPivot().Position
						for v113, v114 in v_u_108 do
							if v113.Parent then
								local v115 = v113.Position - v112
								local v116
								if v115.Magnitude > 0.01 then
									v116 = v115.Unit
								else
									local v117 = v_u_34:NextNumber(-1, 1)
									local v118 = v_u_34
									v116 = Vector3.new(v117, 0, v118:NextNumber(-1, 1)).Unit
								end
								v_u_2:Create(v113, TweenInfo.new(0.055, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["CFrame"] = v114 + v116 * 0.6
								}):Play()
							end
						end
						task.delay(0.055, function()
							-- upvalues: (ref) v_u_108, (ref) v_u_2, (ref) v_u_110
							for v119, v120 in v_u_108 do
								if v119.Parent then
									v_u_2:Create(v119, TweenInfo.new(0.13, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
										["CFrame"] = v120
									}):Play()
								end
							end
							task.delay(0.13, function()
								-- upvalues: (ref) v_u_110
								v_u_110 = false
							end)
						end)
					end
				end
				p_u_46:Connect(v103.OnClientEvent, function(_)
					-- upvalues: (ref) v_u_33, (ref) v_u_111, (copy) v_u_121, (copy) v_u_105, (ref) v_u_13
					v_u_33:ShakeOnce(3, 8, 0, 0.25)
					if not v_u_111 then
						v_u_121()
						local v122 = v_u_105
						if v122 then
							v122 = v_u_105:FindFirstChild("VFX")
						end
						if v122 then
							v122 = v122:FindFirstChild("Click_HitFx")
						end
						if v122 then
							v_u_13:EmitAll(v122)
						end
					end
				end)
				p_u_46:Connect(v104.OnClientEvent, function()
					-- upvalues: (ref) v_u_111, (ref) v_u_33, (copy) v_u_105, (ref) v_u_13
					v_u_111 = true
					v_u_33:ShakeOnce(14, 10, 0, 1.5)
					local v123 = v_u_105
					if v123 then
						v123 = v_u_105:FindFirstChild("VFX")
					end
					if v123 then
						v123 = v123:FindFirstChild("Expo")
					end
					if v123 then
						v_u_13:EmitAll(v123)
					end
				end)
			end
		end), task.cancel)
	end
end
local v_u_125 = {
	["RED"] = Color3.fromRGB(255, 60, 60),
	["BLUE"] = Color3.fromRGB(60, 120, 255),
	["GREEN"] = Color3.fromRGB(60, 220, 100),
	["YELLOW"] = Color3.fromRGB(255, 220, 50),
	["PINK"] = Color3.fromRGB(255, 80, 200)
}
local function v_u_131()
	-- upvalues: (ref) v_u_24, (copy) v_u_125, (copy) v_u_15, (copy) v_u_2
	local v126 = workspace:GetAttribute("DiscoApocalypse_Color")
	if v_u_24 then
		v_u_24:Destroy()
		v_u_24 = nil
	end
	if v126 then
		local v127 = v_u_125[v126] or Color3.new(1, 1, 1)
		local v_u_128 = Instance.new("ScreenGui")
		v_u_128.Name = "DA_ColorAnnounce"
		v_u_128.DisplayOrder = 998
		v_u_128.IgnoreGuiInset = true
		v_u_128.ResetOnSpawn = false
		v_u_128.Parent = v_u_15.PlayerGui
		v_u_24 = v_u_128
		local v_u_129 = Instance.new("TextLabel")
		v_u_129.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_129.Size = UDim2.new(0.55, 0, 0, 90)
		v_u_129.Position = UDim2.new(0.5, 0, 0.4, 0)
		v_u_129.BackgroundTransparency = 1
		v_u_129.Text = v126 .. "!"
		v_u_129.TextColor3 = v127
		v_u_129.Font = Enum.Font.GothamBold
		v_u_129.TextScaled = true
		v_u_129.Parent = v_u_128
		local v_u_130 = Instance.new("UIStroke")
		v_u_130.Color = Color3.new(0, 0, 0)
		v_u_130.Thickness = 3
		v_u_130.Transparency = 0
		v_u_130.Parent = v_u_129
		task.delay(2.5, function()
			-- upvalues: (copy) v_u_128, (ref) v_u_2, (copy) v_u_129, (copy) v_u_130, (ref) v_u_24
			if v_u_128.Parent then
				v_u_2:Create(v_u_129, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
					["TextTransparency"] = 1
				}):Play()
				v_u_2:Create(v_u_130, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
					["Transparency"] = 1
				}):Play()
				task.delay(0.5, function()
					-- upvalues: (ref) v_u_24, (ref) v_u_128
					if v_u_24 == v_u_128 then
						v_u_128:Destroy()
						v_u_24 = nil
					end
				end)
			end
		end)
	end
end
local function v_u_132()
	-- upvalues: (ref) v_u_22, (copy) v_u_41, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (ref) v_u_26, (copy) v_u_10, (copy) v_u_45, (copy) v_u_2, (copy) v_u_16
	if v_u_22 then
		v_u_41()
		game:GetService("SoundService").DiscoApocalypse.RainbowCrackSFX_NormalGarden_GAG:Play()
		if v_u_23 then
			v_u_23:Destroy()
		end
		v_u_23 = nil
		if v_u_24 then
			v_u_24:Destroy()
		end
		v_u_24 = nil
		if v_u_25 then
			v_u_25:Destroy()
		end
		v_u_25 = nil
		v_u_26 = nil
		v_u_10.Stop("DiscoApocalypse")
		v_u_22:Destroy()
		v_u_22 = nil
		v_u_45()
		v_u_2:Create(v_u_16, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["FieldOfView"] = 70
		}):Play()
	end
end
local function v_u_141()
	-- upvalues: (ref) v_u_22, (copy) v_u_8, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_33, (copy) v_u_34, (copy) v_u_13, (copy) v_u_12, (ref) v_u_23, (copy) v_u_44, (copy) v_u_124, (copy) v_u_131, (copy) v_u_132
	if not v_u_22 then
		v_u_22 = v_u_8.new()
		local v_u_133 = v_u_22
		local v134 = v_u_17:WaitForChild("DA_CrackCamShake", 20)
		local v135 = v_u_17:WaitForChild("DA_GroundCrack", 20)
		local v136 = v_u_17:WaitForChild("DA_TwistEnd", 20)
		local v_u_137 = v_u_18.DustParticles:Clone()
		v_u_133:Add(v_u_137)
		v_u_137.Parent = v_u_19
		v_u_133:Connect(v134.OnClientEvent, function()
			-- upvalues: (ref) v_u_33, (ref) v_u_34, (ref) v_u_13, (copy) v_u_137
			v_u_33:ShakeOnce(v_u_34:NextNumber(4, 6), 8, 0, 0.5)
			v_u_13:EmitAll(v_u_137)
		end)
		v_u_133:Connect(v135.OnClientEvent, function()
			-- upvalues: (ref) v_u_33, (ref) v_u_12, (ref) v_u_18, (ref) v_u_23
			v_u_33:ShakeOnce(10, 10, 0, 1)
			local v138 = v_u_12.new(v_u_18.GroundCrack:Clone(), v_u_18.CrackSpawn.CFrame * CFrame.new(0, 0.1, 0))
			local v139 = v_u_18.GroundCrack:GetExtentsSize().X / 2 - 5
			local v140 = v_u_18.GroundCrack:GetExtentsSize().Z / 2 - 5
			v138:setSize((Vector3.new(v139, 0.1, v140)))
			v_u_23 = v138
		end)
		v_u_133:Connect(v136.OnClientEvent, function()
			-- upvalues: (ref) v_u_44
			v_u_44()
		end)
		v_u_133:Connect(workspace:GetAttributeChangedSignal("DiscoApocalypse_Phase"), function()
			-- upvalues: (ref) v_u_124, (copy) v_u_133
			v_u_124(v_u_133)
		end)
		v_u_133:Connect(workspace:GetAttributeChangedSignal("DiscoApocalypse_Color"), v_u_131)
		if workspace:GetAttribute("DiscoApocalypse_Phase") then
			task.defer(v_u_124, v_u_133)
		end
		if workspace:GetAttribute("DiscoApocalypse_Color") then
			task.defer(v_u_131)
		end
		repeat
			task.wait(0.3)
		until not workspace:GetAttribute("DiscoApocalypse")
		v_u_132()
	end
end
workspace:GetAttributeChangedSignal("DiscoApocalypse"):Connect(function()
	-- upvalues: (copy) v_u_141, (copy) v_u_132
	if workspace:GetAttribute("DiscoApocalypse") then
		task.defer(v_u_141)
	else
		v_u_132()
	end
end)
if workspace:GetAttribute("DiscoApocalypse") then
	task.defer(v_u_141)
end
return v1