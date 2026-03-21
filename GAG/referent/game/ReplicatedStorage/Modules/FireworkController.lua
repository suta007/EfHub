local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v_u_4.Data.SoundData)
local v_u_6 = require(v_u_4.Modules.SoundPlayer)
local v_u_7 = v_u_4.Assets
local v_u_8 = v_u_7.Fireworks
local v_u_9 = {
	["Bean"] = {
		["SFX"] = "rbxassetid://134973227001448",
		["Image"] = "rbxassetid://71279244204542"
	},
	["Green"] = {
		["SFX"] = "rbxassetid://138544319214265",
		["Image"] = "rbxassetid://81941215051346"
	}
}
local v_u_10 = {}
local function v_u_28(p11, p12)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_2
	local v13 = v_u_7.JulyAssets.JulyFirework:Clone()
	local v14 = math.random(-10, 10)
	local v15 = math.random(40, 80)
	local v16 = math.random
	local v17 = Vector3.new(v14, v15, v16(-10, 10))
	v13.CFrame = p11
	v13.Parent = workspace
	local v18 = p11.Position + v17
	local v19 = p11.Position
	local v20 = v17.Y
	local v21 = v19 + Vector3.new(0, v20, 0)
	local v22
	if workspace:GetAttribute("2026Fireworks") then
		if math.random(3) == 1 then
			local v_u_23 = { "269146157", "84355080907909", "139736861124279" }
			task.delay(2.5, function()
				-- upvalues: (ref) v_u_6, (copy) v_u_23
				v_u_6:PlaySound((("rbxassetid://%*"):format(v_u_23[math.random(#v_u_23)])))
			end)
			v22 = 0
		else
			v22 = 0
		end
	else
		v_u_6:PlaySound("rbxassetid://132449382613843")
		v22 = 0
	end
	while v22 < 1 do
		v22 = v22 + game:GetService("RunService").Heartbeat:Wait()
		local v24 = p11.Position:Lerp(v21, v22):Lerp(p11.Position:Lerp(v18, v22), v22 ^ 1.5)
		v13:PivotTo(CFrame.new(v24))
	end
	for _, v25 in v13:GetDescendants() do
		if v25:IsA("ParticleEmitter") then
			v25.Enabled = false
		end
	end
	v_u_3:AddItem(v13, 4)
	local v26 = v_u_7.JulyAssets.Boom:Clone()
	v26.Parent = workspace.Visuals
	v26.CFrame = v13.CFrame
	for _, v_u_27 in v26:GetDescendants() do
		if v_u_27:IsA("ParticleEmitter") then
			v_u_27:Emit(v_u_27:GetAttribute("EmitCount"))
		elseif v_u_27:IsA("BillboardGui") and not p12 then
			v_u_27.Enabled = true
			v_u_2:Create(v_u_27, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_27.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_27.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_27
				v_u_2:Create(v_u_27, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_27
				v_u_2:Create(v_u_27.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_27
				v_u_2:Create(v_u_27.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
				v_u_2:Create(v_u_27.ImageLabel.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v26, 10)
end
local v29 = {}
local function v38(p30, p31)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_2
	local v32 = v_u_7.JulyAssets.FireworkWithVFX:Clone()
	v32:PivotTo(p30)
	v32.Parent = workspace
	local v33 = 0
	while v33 < 1 do
		v33 = v33 + game:GetService("RunService").Heartbeat:Wait()
		local v34 = v33 / 1
		v32:PivotTo(p30:Lerp(p30 * CFrame.new(0, 120, 0), v34))
	end
	for _, v35 in v32:GetDescendants() do
		if v35:IsA("ParticleEmitter") then
			v35.Enabled = false
		elseif v35:IsA("BasePart") then
			v35.CanCollide = false
			v35.Transparency = 1
			v35.CanQuery = false
		end
	end
	v_u_3:AddItem(v32, 4)
	local v36 = v_u_7.JulyAssets.Boom:Clone()
	v36.Parent = workspace.Visuals
	v36.CFrame = v32:GetPivot()
	for _, v_u_37 in v36:GetDescendants() do
		if v_u_37:IsA("ParticleEmitter") then
			v_u_37:Emit(v_u_37:GetAttribute("EmitCount"))
		elseif v_u_37:IsA("BillboardGui") and not p31 then
			v_u_37.Enabled = true
			v_u_2:Create(v_u_37, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_37.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_37.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_37
				v_u_2:Create(v_u_37, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_37
				v_u_2:Create(v_u_37.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_37
				v_u_2:Create(v_u_37.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
				v_u_2:Create(v_u_37.ImageLabel.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v36, 10)
end
for v39, _ in v_u_9 do
	table.insert(v_u_10, v39)
end
local v_u_40 = {
	["Boo"] = {
		["SFX"] = "rbxassetid://12229501",
		["Image"] = "rbxassetid://0"
	}
}
local v_u_41 = {}
local function v_u_59(p42)
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_3, (copy) v_u_2
	local v43 = v_u_8.BeanstalkAssets
	local v44 = v43.BeanstalkFirework:Clone()
	local v45 = math.random(-10, 10)
	local v46 = math.random(40, 80)
	local v47 = math.random
	local v48 = Vector3.new(v45, v46, v47(-10, 10))
	v44.CFrame = p42
	v44.Parent = workspace
	local v49 = p42.Position + v48
	local v50 = p42.Position
	local v51 = v48.Y
	local v52 = v50 + Vector3.new(0, v51, 0)
	local v_u_53 = v_u_10[math.random(1, #v_u_10)]
	v_u_6:PlaySound("rbxassetid://132449382613843")
	task.delay(1.4, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_9, (copy) v_u_53
		v_u_6:PlaySound(v_u_9[v_u_53].SFX, {
			["PlaybackSpeed"] = math.random(90, 110) / 100
		})
	end)
	local v54 = 0
	while v54 < 1 do
		v54 = v54 + game:GetService("RunService").Heartbeat:Wait()
		local v55 = p42.Position:Lerp(v52, v54):Lerp(p42.Position:Lerp(v49, v54), v54 ^ 1.5)
		v44:PivotTo(CFrame.new(v55))
	end
	for _, v56 in v44:GetDescendants() do
		if v56:IsA("ParticleEmitter") then
			v56.Enabled = false
		end
	end
	v_u_3:AddItem(v44, 4)
	local v57 = v43.Boom:Clone()
	v57.Parent = workspace.Visuals
	v57.CFrame = v44.CFrame
	for _, v_u_58 in v57:GetDescendants() do
		if v_u_58:IsA("ParticleEmitter") then
			v_u_58:Emit(v_u_58:GetAttribute("EmitCount"))
		elseif v_u_58:IsA("BillboardGui") then
			v_u_58.Enabled = true
			v_u_58.ImageLabel.Image = v_u_9[v_u_53].Image
			v_u_2:Create(v_u_58, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_58.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_58.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_58
				v_u_2:Create(v_u_58, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_58
				v_u_2:Create(v_u_58.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_58
				v_u_2:Create(v_u_58.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v57, 10)
end
for v60, _ in v_u_40 do
	table.insert(v_u_41, v60)
end
local function v_u_78(p61)
	-- upvalues: (copy) v_u_8, (copy) v_u_41, (copy) v_u_6, (copy) v_u_40, (copy) v_u_3, (copy) v_u_2
	local v62 = v_u_8.HalloweenAssets
	local v_u_63 = v62.HalloweenFirework:Clone()
	local v64 = math.random(-10, 10)
	local v65 = math.random(40, 80)
	local v66 = math.random
	local v67 = Vector3.new(v64, v65, v66(-10, 10))
	v_u_63.CFrame = p61
	v_u_63.Parent = workspace
	local v68 = p61.Position + v67
	local v69 = p61.Position
	local v70 = v67.Y
	local v71 = v69 + Vector3.new(0, v70, 0)
	local v_u_72 = v_u_41[math.random(1, #v_u_41)]
	v_u_6:PlaySound("rbxassetid://132449382613843")
	task.delay(1.4, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_40, (copy) v_u_72, (copy) v_u_63
		v_u_6:PlaySound(v_u_40[v_u_72].SFX, {
			["PlaybackSpeed"] = math.random(90, 110) / 100
		}, v_u_63.CFrame.Position)
	end)
	local v73 = 0
	while v73 < 1 do
		v73 = v73 + game:GetService("RunService").Heartbeat:Wait()
		local v74 = p61.Position:Lerp(v71, v73):Lerp(p61.Position:Lerp(v68, v73), v73 ^ 1.5)
		v_u_63:PivotTo(CFrame.new(v74))
	end
	for _, v75 in v_u_63:GetDescendants() do
		if v75:IsA("ParticleEmitter") then
			v75.Enabled = false
		end
	end
	v_u_3:AddItem(v_u_63, 4)
	local v76 = v62.Boom:Clone()
	v76.Parent = workspace.Visuals
	v76.CFrame = v_u_63.CFrame
	for _, v_u_77 in v76:GetDescendants() do
		if v_u_77:IsA("ParticleEmitter") then
			v_u_77:Emit(v_u_77:GetAttribute("EmitCount"))
		elseif v_u_77:IsA("BillboardGui") then
			v_u_77.Enabled = true
			v_u_77.ImageLabel.Image = v_u_40[v_u_72].Image
			v_u_2:Create(v_u_77, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_77.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_77.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_77
				v_u_2:Create(v_u_77, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_77
				v_u_2:Create(v_u_77.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_77
				v_u_2:Create(v_u_77.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v76, 10)
end
local function v_u_108(p79)
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	local v80 = p79.Position
	local v81 = p79.LookVector
	local v82 = v81.X
	local v83 = v81.Z
	local v84 = Vector3.new(v82, 0, v83).Unit
	local v_u_85 = CFrame.new(v80, v80 + v84)
	local v_u_86 = v_u_8.SkyLantern.SkyLantern:Clone()
	v_u_86.Parent = workspace.Visuals
	v_u_86:PivotTo(v_u_85)
	local v87 = math.random(40, 80)
	local v_u_88 = math.random(8, 15)
	local v_u_89 = math.random(1, 3)
	local v_u_90 = math.random(1, 3)
	local v_u_91 = math.random(60, 100) / 100
	local v_u_92 = math.random(40, 80) / 100
	local v_u_93 = math.random(8, 20) / 100
	if math.random(0, 1) == 0 then
		v_u_93 = -v_u_93
	end
	local v_u_94 = v_u_85 * CFrame.new(0, v87, 0)
	v_u_3:AddItem(v_u_86, v_u_88)
	local v_u_95 = {}
	for _, v96 in v_u_86:GetDescendants() do
		if v96:IsA("Light") then
			table.insert(v_u_95, v96)
			v96:SetAttribute("BaseBrightness", v96.Brightness)
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_88, (ref) v_u_1, (copy) v_u_85, (copy) v_u_94, (copy) v_u_91, (copy) v_u_89, (copy) v_u_92, (copy) v_u_90, (ref) v_u_93, (copy) v_u_86, (copy) v_u_95
		local v97 = 0
		while v97 < v_u_88 do
			v97 = v97 + v_u_1.Heartbeat:Wait()
			local v98 = v97 / v_u_88
			local v99 = v_u_85:Lerp(v_u_94, (math.clamp(v98, 0, 1)))
			local v100 = v97 * v_u_91
			local v101 = math.sin(v100) * v_u_89
			local v102 = v97 * v_u_92
			local v103 = math.cos(v102) * v_u_90
			local v104 = CFrame.new(v101, 0, v103)
			local v105 = CFrame.Angles(0, v97 * v_u_93, 0)
			v_u_86:PivotTo(v99 * v104 * v105)
			for _, v106 in v_u_95 do
				v106.Brightness = (v106:GetAttribute("BaseBrightness") or v106.Brightness) * (1 + math.random(-10, 10) / 100)
			end
		end
	end)
	task.wait(v_u_88 - 3)
	for _, v107 in v_u_86:GetDescendants() do
		if v107:IsA("BasePart") then
			v_u_2:Create(v107, TweenInfo.new(3), {
				["Transparency"] = 1
			}):Play()
		elseif v107:IsA("ParticleEmitter") then
			v107.Enabled = false
		elseif v107:IsA("Light") then
			v_u_2:Create(v107, TweenInfo.new(3), {
				["Brightness"] = 0
			}):Play()
		end
	end
end
local function v_u_125(p109)
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	local v110 = v_u_8.ChristmasAssets
	local v_u_111 = v110.ChristmasFirework:Clone()
	local v112 = math.random(-10, 10)
	local v113 = math.random(40, 80)
	local v114 = math.random
	local v115 = Vector3.new(v112, v113, v114(-10, 10))
	v_u_111.CFrame = p109
	v_u_111.Parent = workspace
	local v116 = p109.Position + v115
	local v117 = p109.Position
	local v118 = v115.Y
	local v119 = v117 + Vector3.new(0, v118, 0)
	v_u_6:PlaySound("rbxassetid://132449382613843")
	task.delay(1.1, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_5, (copy) v_u_111
		v_u_6:PlaySound(v_u_5.Weather.FestiveNight.FestiveBells, {
			["FadeOutDuration"] = 3
		}, v_u_111.CFrame.Position)
	end)
	local v120 = 0
	while v120 < 1 do
		v120 = v120 + game:GetService("RunService").Heartbeat:Wait()
		local v121 = p109.Position:Lerp(v119, v120):Lerp(p109.Position:Lerp(v116, v120), v120 ^ 1.5)
		v_u_111:PivotTo(CFrame.new(v121))
	end
	for _, v122 in v_u_111:GetDescendants() do
		if v122:IsA("ParticleEmitter") then
			v122.Enabled = false
		end
	end
	v_u_3:AddItem(v_u_111, 4)
	local v123 = v110.Boom:Clone()
	v123.Parent = workspace.Visuals
	v123.CFrame = v_u_111.CFrame
	for _, v_u_124 in v123:GetDescendants() do
		if v_u_124:IsA("ParticleEmitter") then
			v_u_124:Emit(v_u_124:GetAttribute("EmitCount"))
		elseif v_u_124:IsA("BillboardGui") then
			v_u_124.Enabled = true
			v_u_124.ImageLabel.Image = "rbxassetid://0"
			v_u_2:Create(v_u_124, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_124.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_124.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_124
				v_u_2:Create(v_u_124, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_124
				v_u_2:Create(v_u_124.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_124
				v_u_2:Create(v_u_124.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v123, 10)
end
local function v_u_150(p126, _, p127)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	local v128 = require(v_u_4.Code.Bezier)
	local v129 = v_u_8.DragonsFireworkAssets
	local v_u_130 = v129.DragonsFirework:Clone()
	local v131 = math.random(-10, 10)
	local v132 = math.random(40, 80)
	local v133 = math.random
	local v134 = Vector3.new(v131, v132, v133(-10, 10))
	v_u_130.CFrame = p126
	v_u_130.Parent = workspace
	local v135 = p126.Position + v134
	local v136 = p126.Position
	local v137 = v134.Y
	local v138 = v136 + Vector3.new(0, v137, 0)
	v_u_6:PlaySound("rbxassetid://132449382613843", {
		["Volume"] = 1.3,
		["RollOffMinDistance"] = 25,
		["RollOffMaxDistance"] = 250
	}, nil, v_u_130)
	task.delay(1.1, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_5, (copy) v_u_130
		v_u_6:PlaySound(v_u_5.Weather.Volcano.FireBallVolcano_GrowAGarden, {
			["Volume"] = 1.3,
			["RollOffMinDistance"] = 25,
			["RollOffMaxDistance"] = 250,
			["FadeOutDuration"] = 1
		}, v_u_130.CFrame.Position)
	end)
	local v139 = 0
	if p127 then
		while v139 < 1 do
			v139 = v139 + game:GetService("RunService").Heartbeat:Wait()
			local v140 = p126.Position
			local v141 = p127.Position
			local v142 = (v140 + v141) / 4
			local v143 = v140.Y + 60
			local v144 = v142 + Vector3.new(0, v143, 0)
			local v145 = v128.new(v140, v144, v141):Get(game.TweenService:GetValue(v139 / 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) ^ 1.5)
			v_u_130:PivotTo(CFrame.new(v145))
		end
	else
		while v139 < 1 do
			v139 = v139 + game:GetService("RunService").Heartbeat:Wait()
			local v146 = p126.Position:Lerp(v138, v139):Lerp(p126.Position:Lerp(v135, v139), v139 ^ 1.5)
			v_u_130:PivotTo(CFrame.new(v146))
		end
	end
	for _, v147 in v_u_130:GetDescendants() do
		if v147:IsA("ParticleEmitter") then
			v147.Enabled = false
		end
	end
	v_u_3:AddItem(v_u_130, 4)
	local v148 = v129.Boom:Clone()
	v148.Parent = workspace.Visuals
	v148.CFrame = v_u_130.CFrame
	for _, v_u_149 in v148:GetDescendants() do
		if v_u_149:IsA("ParticleEmitter") then
			v_u_149:Emit(v_u_149:GetAttribute("EmitCount"))
		elseif v_u_149:IsA("BillboardGui") then
			v_u_149.Enabled = true
			v_u_149.ImageLabel.Image = "rbxassetid://0"
			v_u_2:Create(v_u_149, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_149.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_149.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_149
				v_u_2:Create(v_u_149, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_149
				v_u_2:Create(v_u_149.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_149
				v_u_2:Create(v_u_149.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v148, 10)
end
local v_u_151 = { Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 85, 0), Color3.fromRGB(255, 0, 0) }
local function v_u_168(p152, _)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_151, (copy) v_u_2
	require(v_u_4.Code.Bezier)
	local v153 = v_u_8.NewYearsFireworkAssets
	local v_u_154 = v153.NewYearsFirework:Clone()
	local v155 = math.random(-10, 10)
	local v156 = math.random(40, 80)
	local v157 = math.random
	local v158 = Vector3.new(v155, v156, v157(-10, 10))
	v_u_154.CFrame = p152
	v_u_154.Parent = workspace
	local v159 = p152.Position + v158
	local v160 = p152.Position
	local v161 = v158.Y
	local v162 = v160 + Vector3.new(0, v161, 0)
	v_u_6:PlaySound("rbxassetid://132449382613843", {
		["Volume"] = 1.3,
		["RollOffMinDistance"] = 25,
		["RollOffMaxDistance"] = 250
	}, nil, v_u_154)
	task.delay(1.1, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_5, (copy) v_u_154
		v_u_6:PlaySound(v_u_5.Weather.Stoplight.WinSound, {
			["Volume"] = 0.3,
			["RollOffMinDistance"] = 25,
			["RollOffMaxDistance"] = 250,
			["FadeOutDuration"] = 1,
			["PlaybackSpeed"] = math.random(95, 105) / 100
		}, v_u_154.CFrame.Position)
	end)
	local v163 = 0
	while v163 < 1 do
		v163 = v163 + game:GetService("RunService").Heartbeat:Wait()
		local v164 = p152.Position:Lerp(v162, v163):Lerp(p152.Position:Lerp(v159, v163), v163 ^ 1.5)
		v_u_154:PivotTo(CFrame.new(v164))
	end
	for _, v165 in v_u_154:GetDescendants() do
		if v165:IsA("ParticleEmitter") then
			v165.Enabled = false
		end
	end
	v_u_3:AddItem(v_u_154, 4)
	local v166 = v153.Boom:Clone()
	v166.Parent = workspace.Visuals
	v166.CFrame = v_u_154.CFrame
	for _, v_u_167 in v166:GetDescendants() do
		if v_u_167:IsA("ParticleEmitter") then
			v_u_167:Emit(v_u_167:GetAttribute("EmitCount"))
		elseif v_u_167:IsA("BillboardGui") then
			v_u_167.Enabled = true
			v_u_167.ImageLabel.Image = "rbxassetid://103894346519582"
			v_u_167.ImageLabel.ImageColor3 = v_u_151[math.random(1, #v_u_151)]
			v_u_2:Create(v_u_167, TweenInfo.new(0.3), {
				["Brightness"] = 25
			}):Play()
			v_u_2:Create(v_u_167.ImageLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Scale"] = 3
			}):Play()
			v_u_2:Create(v_u_167.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				["Position"] = UDim2.new(0.5, 0, 0.435, 0)
			}):Play()
			task.delay(0.3, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_167
				v_u_2:Create(v_u_167, TweenInfo.new(1), {
					["Brightness"] = 2
				}):Play()
			end)
			task.delay(0.5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_167
				v_u_2:Create(v_u_167.ImageLabel.UIScale, TweenInfo.new(5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Scale"] = 4
				}):Play()
			end)
			task.delay(5, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_167
				v_u_2:Create(v_u_167.ImageLabel, TweenInfo.new(1), {
					["ImageTransparency"] = 1
				}):Play()
			end)
		end
	end
	v_u_3:AddItem(v166, 10)
end
local v_u_177 = {
	["Firework"] = function(p169, ...)
		-- upvalues: (copy) v_u_28
		v_u_28(p169, ...)
	end,
	["4thOfJuly"] = function(p170, ...)
		-- upvalues: (copy) v_u_28
		v_u_28(p170, ...)
	end,
	["Beanworks"] = function(p171, ...)
		-- upvalues: (copy) v_u_59
		v_u_59(p171, ...)
	end,
	["Sky Lantern"] = function(p172, ...)
		-- upvalues: (copy) v_u_108
		v_u_108(p172, ...)
	end,
	["Frightwork"] = function(p173, ...)
		-- upvalues: (copy) v_u_78
		v_u_78(p173, ...)
	end,
	["Christmas Firework"] = function(p174, ...)
		-- upvalues: (copy) v_u_125
		v_u_125(p174, ...)
	end,
	["Dragon\'s Firework"] = function(p175, ...)
		-- upvalues: (copy) v_u_150
		v_u_150(p175, ...)
	end,
	["New Year\'s Firework"] = function(p176, ...)
		-- upvalues: (copy) v_u_168
		v_u_168(p176, ...)
	end
}
function v29.Force_Create_Firework(p178, p179, p180, ...)
	-- upvalues: (copy) v_u_177
	local v181 = v_u_177[p180 or "Firework"]
	if v181 then
		task.spawn(v181, p178, p179, ...)
	else
		warn("Firework Type does not exist!")
	end
end
v_u_4.GameEvents.FireworkVisual.OnClientEvent:Connect(function(p182, p183, p184, ...)
	-- upvalues: (copy) v_u_177
	local v185 = v_u_177[p184 or "Firework"]
	if v185 then
		task.spawn(v185, p182, p183, ...)
	else
		warn("Firework Type does not exist!")
	end
end)
v_u_4.GameEvents.PhysicalFirework.OnClientEvent:Connect(v38)
return v29