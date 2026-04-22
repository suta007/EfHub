local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Data.SoundData)
local v_u_7 = require(v5.Modules.SoundPlayer)
require(v5.Modules.ScreenShakeCore)
local v_u_8 = require(v5.Modules.SkyboxManager)
local v_u_9 = script.Sky
v_u_8.AddSkybox(v_u_9)
local v_u_10 = game.Lighting.ColorCorrection:Clone()
v_u_10.Name = script.Name
v_u_10.Parent = game.Lighting
local _ = game.Players.LocalPlayer.Character
local v_u_11 = {}
local function v_u_14(p12, p13)
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6
	if p12 == true then
		if p13 then
			game.Lighting.ClockTime = 16
			v_u_3:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(138, 52, 52),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.3
			}):Play()
			v_u_3:Create(v_u_10, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(255, 183, 183),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_8.UpdateSkybox(v_u_9, 4)
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart)
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart2, {
				["PlaybackSpeed"] = 0.7
			})
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart3)
		else
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_8.UpdateSkybox(v_u_9, 4)
			game.Lighting.ClockTime = 3
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart)
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart2, {
				["PlaybackSpeed"] = 0.7
			})
			v_u_7:PlaySound(v_u_6.Events.BatAttack.EventStart3)
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 52, 52),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.3,
				["ClockTime"] = 16
			}):Play()
			v_u_3:Create(v_u_10, TweenInfo.new(5), {
				["Brightness"] = 0,
				["TintColor"] = Color3.fromRGB(255, 183, 183),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(10), {
				["Intensity"] = 0.01
			}):Play()
		end
	elseif not p13 then
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["ClockTime"] = 21
		}):Play()
		v_u_3:Create(v_u_10, TweenInfo.new(5), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(2), {
			["Intensity"] = 0
		}):Play()
		task.wait(5)
		v_u_8.UpdateSkybox(v_u_9, 0)
		game.Lighting.ClockTime = 3
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(138, 138, 138),
			["ExposureCompensation"] = 0.2,
			["Brightness"] = 2,
			["ClockTime"] = 14
		}):Play()
		task.delay(6, function()
			game.Lighting.SunRays.Enabled = false
		end)
	end
end
local v15 = game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC"
local v_u_16 = require(v5.Code.Bezier)
local v_u_17 = v15 == "Mobile" and 0.025 or 0.015
local function v_u_62(p18, p19, p20)
	local v21 = p18:PointToObjectSpace(p20)
	local v22 = Vector3.new(0, 0, 0)
	local v23 = p19.X / 2
	local v24 = v21.X
	local v25 = v23 - math.abs(v24)
	local v26 = p19.Y / 2
	local v27 = v21.Y
	local v28 = v26 - math.abs(v27)
	local v29 = p19.Z / 2
	local v30 = v21.Z
	local v31 = v29 - math.abs(v30)
	if v25 <= v28 and v25 <= v31 then
		local v32 = v21.X
		local v33 = math.sign(v32) * p19.X / 2
		local v34 = v21.Y
		local v35 = -p19.Y / 2
		local v36 = p19.Y / 2
		local v37 = math.clamp(v34, v35, v36)
		local v38 = v21.Z
		local v39 = -p19.Z / 2
		local v40 = p19.Z / 2
		local v41 = math.clamp(v38, v39, v40)
		v22 = Vector3.new(v33, v37, v41)
	elseif v28 <= v25 and v28 <= v31 then
		local v42 = v21.X
		local v43 = -p19.X / 2
		local v44 = p19.X / 2
		local v45 = math.clamp(v42, v43, v44)
		local v46 = v21.Y
		local v47 = math.sign(v46) * p19.Y / 2
		local v48 = v21.Z
		local v49 = -p19.Z / 2
		local v50 = p19.Z / 2
		local v51 = math.clamp(v48, v49, v50)
		v22 = Vector3.new(v45, v47, v51)
	elseif v31 <= v25 and v31 <= v28 then
		local v52 = v21.X
		local v53 = -p19.X / 2
		local v54 = p19.X / 2
		local v55 = math.clamp(v52, v53, v54)
		local v56 = v21.Y
		local v57 = -p19.Y / 2
		local v58 = p19.Y / 2
		local v59 = math.clamp(v56, v57, v58)
		local v60 = v21.Z
		local v61 = math.sign(v60) * p19.Z / 2
		v22 = Vector3.new(v55, v59, v61)
	end
	return p18:PointToWorldSpace(v22)
end
local function v_u_67(p63)
	-- upvalues: (ref) v_u_2, (copy) v_u_7, (copy) v_u_6, (copy) v_u_11, (copy) v_u_3, (copy) v_u_14
	if v_u_2 ~= true then
		v_u_2 = true
		local v64 = { 0.5, 0.1 }
		for v65 = 1, 2 do
			local v66 = v_u_7:PlaySound(v_u_6.Events.BatAttack["Ambience" .. v65])
			v_u_11[v65] = v66
			v_u_3:Create(v66, TweenInfo.new(5), {
				["Volume"] = v64[v65]
			}):Play()
		end
		v_u_14(true, p63)
	end
end
game:GetService("ReplicatedStorage").GameEvents.BatAttackEvent.OnClientEvent:Connect(function(p68, p69, p70)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_62, (copy) v_u_16, (copy) v_u_17
	local v71 = script.BatTemplate:Clone()
	v71.Name = "Bat"
	v71.Parent = workspace.WeatherVisuals
	v_u_4:AddItem(v71, p70 + 10)
	v71:PivotTo(CFrame.lookAt(p68, p69.PrimaryPart.Position))
	local v72 = v71:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(script.BatFlyAnim)
	v72:Play()
	v71.PrimaryPart.BatSpawn.Wave:Emit(1)
	v71.PrimaryPart.BatSpawn.Wave:Emit(2)
	v71.PrimaryPart.BatSpawn.Dust:Emit(10)
	v_u_7:PlaySound(v_u_6.Events.BatAttack.Spawn, {
		["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
		["Volume"] = 0.3
	}, nil, v71.PrimaryPart)
	v_u_7:PlaySound(v_u_6.Events.BatAttack.Spawn2, {
		["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
		["Volume"] = 0.3
	}, nil, v71.PrimaryPart)
	local v73 = v71.PrimaryPart.Position
	local v74 = (v73 - p69.PrimaryPart.Position).magnitude
	local v75, v76 = p69:GetBoundingBox()
	local v77 = v_u_62(v75, v76, v73)
	local v78 = CFrame.new(v77, v73).LookVector * 0.95
	local v79 = { v73, v73 + v78 * v74 / 2 + Vector3.new(0, 15, 0), v77 + v78 }
	local v80 = v_u_16.new(table.unpack(v79))
	local v81 = 0
	while v81 < p70 do
		local v82 = v81 + task.wait(v_u_17)
		local v83 = game:GetService("TweenService"):GetValue(v82 / p70, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local v84 = v80:Get((game:GetService("TweenService"):GetValue(v81 / p70, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
		local v85 = v80:Get(v83)
		v71:PivotTo((CFrame.new(v84, v85)))
		v81 = v82
	end
	v71:PivotTo(CFrame.new(v77 + v78, v77))
	local v86 = v71.PrimaryPart.Effect
	v86.Parent = workspace.Terrain
	if p69 and (not p69 or p69.PrimaryPart) then
		v86.WorldPosition = p69.PrimaryPart.Position
		v_u_7:PlaySound(v_u_6.Events.BatAttack.Bite, {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
			["Volume"] = 0.5
		}, nil, v86)
		v_u_7:PlaySound(v_u_6.Events.BatAttack.Bite2, {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
			["Volume"] = 0.5
		}, nil, v86)
		v86.Glow:Emit(1)
		v86.Wave:Emit(1)
		v86.Decay:Emit(1)
		v86.Bits:Emit(5)
		local v87 = v71.PrimaryPart.Position
		local v88 = math.random(-3, 3) * 50
		local v89 = math.random(-3, 3) * 50
		local v90 = v87 + Vector3.new(v88, 40, v89)
		v71:PivotTo(CFrame.lookAt(v71.PrimaryPart.Position, v90))
		local v91 = (v87 - v90).magnitude
		local v92 = CFrame.new(v90, v87).LookVector * 0.95
		local v93 = v87 + v92 * v91 / 2
		local v94 = math.random(-3, 3)
		local v95 = math.random
		local v96 = { v87, v93 + Vector3.new(v94, 15, v95(-3, 3)), v90 + v92 }
		local v97 = v80.new(table.unpack(v96))
		local v98 = 0
		while v98 < 3 do
			local v99 = v98 + task.wait(v_u_17)
			local v100 = game:GetService("TweenService"):GetValue(v99 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local v101 = v97:Get((game:GetService("TweenService"):GetValue(v98 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
			local v102 = v97:Get(v100)
			v71:PivotTo((CFrame.new(v101, v102)))
			v98 = v99
		end
		v71.PrimaryPart.BatSpawn.Wave:Emit(1)
		v71.PrimaryPart.BatSpawn.Wave:Emit(2)
		v71.PrimaryPart.BatSpawn.Dust:Emit(10)
		v_u_7:PlaySound(v_u_6.Events.BatAttack.Spawn, {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
			["Volume"] = 0.3
		}, nil, v71.PrimaryPart)
		v_u_7:PlaySound(v_u_6.Events.BatAttack.Spawn2, {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
			["Volume"] = 0.3
		}, nil, v71.PrimaryPart)
		for _, v103 in v71:GetDescendants() do
			if v103:IsA("BasePart") then
				v103.Transparency = 1
			end
		end
		task.wait(5)
		if v86 then
			v86:Destroy()
		end
		if v72 then
			v72:Destroy()
		end
		if v71 then
			v71:Destroy()
		end
	else
		if v86 then
			v86:Destroy()
		end
		if v72 then
			v72:Destroy()
		end
		if v71 then
			v71:Destroy()
		end
	end
end)
local function v_u_107(p104)
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_3, (copy) v_u_14
	if v_u_2 ~= false then
		v_u_2 = false
		for _, v105 in v_u_11 do
			v_u_3:Create(v105, TweenInfo.new(5), {
				["Volume"] = 0
			}):Play()
		end
		task.delay(5, function()
			-- upvalues: (ref) v_u_11
			for _, v106 in v_u_11 do
				v106:Stop()
			end
		end)
		v_u_14(false, p104)
	end
end
workspace:GetAttributeChangedSignal("BatAttack"):Connect(function()
	-- upvalues: (copy) v_u_67, (copy) v_u_107
	if workspace:GetAttribute("BatAttack") == true then
		v_u_67()
	else
		v_u_107()
	end
end)
if workspace:GetAttribute("BatAttack") == true then
	task.defer(function()
		-- upvalues: (copy) v_u_67
		v_u_67(true)
	end)
else
	v_u_107(true)
end
return v1