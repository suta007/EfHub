local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = v_u_4.new(Enum.RenderPriority.Camera.Value, function(p5)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p5
end)
v_u_6:Start()
local v_u_7 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_8 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_9 = require(game.ReplicatedStorage.Data.SoundData)
local v_u_10 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v_u_11 = workspace.CurrentCamera
local v_u_12 = nil
local function v_u_23(p13)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (ref) v_u_12
	game.ReplicatedStorage.Shooting_Stars.Value = true
	task.delay(10, function()
		-- upvalues: (ref) v_u_8, (ref) v_u_9
		if workspace:GetAttribute("SuperStorm") == true then
			while workspace:GetAttribute("SuperStorm") == true do
				task.spawn(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_9
					local v14 = game.ReplicatedStorage.ShootingStar:Clone()
					local v15 = math.random(350, 550)
					local v16 = math.random
					v14.Position = Vector3.new(-4000, v15, v16(-1000, 1000))
					v14.Parent = workspace.WeatherVisuals
					if math.random(1, 2) == 1 then
						v_u_8:PlaySound(v_u_9.Weather.ShootingStars.Starfall, {
							["PlaybackSpeed"] = 0.9 + math.random(-66, 15) * 0.01,
							["Looped"] = true
						}, nil, v14)
					end
					local v17 = math.random(13, 22)
					local v18 = game.TweenService
					local v19 = TweenInfo.new(v17, Enum.EasingStyle.Linear)
					local v20 = {}
					local v21 = v14.Position
					local v22 = math.random
					v20.Position = v21 + Vector3.new(8000, -100, v22(-50, 50))
					v18:Create(v14, v19, v20):Play()
					task.wait(v17)
					v14:Destroy()
				end)
				task.wait(math.random(25, 75) * 0.01)
			end
		end
	end)
	if p13 then
		v_u_12 = v_u_8:PlaySound(v_u_9.Weather.ShootingStars.Ambience, {
			["Looped"] = true,
			["Volume"] = 0.1
		}, nil, nil, { "LazyLoadSound" })
	else
		game.Lighting.SunRays.Enabled = true
		v_u_12 = v_u_8:PlaySound(v_u_9.Weather.ShootingStars.Ambience, {
			["Looped"] = true
		}, nil, nil, { "LazyLoadSound" })
		game.TweenService:Create(v_u_12, TweenInfo.new(1), {
			["Volume"] = 0.1
		}):Play()
	end
end
local function v_u_32(p24)
	-- upvalues: (copy) v_u_8
	local v25 = game.ReplicatedStorage.ShootingStar:Clone()
	v25.CFrame = p24
	v25.Parent = workspace
	local v26 = v_u_8:PlaySound("rbxassetid://113919877495546", {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 2
	}, nil, nil)
	game.Debris:AddItem(v26, 5)
	local v27 = 0
	while v27 < 1 do
		v27 = v27 + game:GetService("RunService").Heartbeat:Wait()
		v25:PivotTo(p24:Lerp(p24 * CFrame.new(0, 200, 0), v27))
	end
	for _, v28 in v25:GetDescendants() do
		if v28:IsA("BillboardGui") then
			v28.Enabled = false
		end
	end
	game.Debris:AddItem(v25, 4)
	local v29 = game.ReplicatedStorage.FireworkBoom:Clone()
	v29.Parent = workspace
	v29.CFrame = v25.CFrame
	for _, v30 in v29:GetDescendants() do
		if v30:IsA("ParticleEmitter") then
			v30:Emit(v30:GetAttribute("EmitCount"))
		end
	end
	local v31 = v_u_8:PlaySound("rbxassetid://4583102108", nil, nil, nil)
	game.Debris:AddItem(v31, 5)
	game.Debris:AddItem(v29, 10)
end
local function v_u_66()
	-- upvalues: (copy) v_u_11, (copy) v_u_32, (copy) v_u_10
	local v_u_33 = workspace.Visuals:WaitForChild("DJJhai")
	local v_u_34 = v_u_33:GetPivot()
	local v_u_35 = v_u_34 * CFrame.new(0, 85, 0)
	local v36 = v_u_33:WaitForChild("jhailatte"):WaitForChild("Humanoid"):WaitForChild("Animator")
	local v_u_37 = v36:LoadAnimation(script.Parent.DJJhai.Animation)
	v_u_37:Play()
	local v_u_38 = game.ReplicatedStorage.Assets.DanceFloor:Clone()
	local v_u_39 = v_u_38:GetPivot()
	v_u_38.Parent = workspace
	v_u_38:WaitForChild("Colour")
	local function v_u_41()
		-- upvalues: (copy) v_u_38
		for _, v40 in v_u_38.Colour:GetChildren() do
			v40.Color = Color3.fromHSV(Random.new():NextNumber(0, 1), Random.new():NextNumber(0, 1), 1)
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_41
		while workspace:GetAttribute("SuperStorm") == true do
			v_u_41()
			task.wait(1)
		end
	end)
	local v42 = 0
	while v42 < 2 do
		v42 = v42 + game:GetService("RunService").Heartbeat:Wait()
		local v43 = game.TweenService:GetValue(v42, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v_u_33:PivotTo(v_u_34:Lerp(v_u_35, v43))
		v_u_38:PivotTo(v_u_39:Lerp(v_u_39 * CFrame.new(0, 2, 0), v43))
	end
	local v_u_44 = Instance.new("Sound")
	local v45 = { 104445637963020 }
	v_u_44.SoundId = "rbxassetid://" .. v45[Random.new():NextInteger(1, #v45)]
	v_u_44.Volume = 0.6
	v_u_44.Looped = true
	v_u_44.Parent = workspace
	v_u_44.SoundGroup = game.SoundService.Music.Tunes
	v_u_44:Play()
	local v_u_46 = v36:LoadAnimation(script.Parent.DJJhai.Up)
	local v_u_47 = 0
	local v_u_48 = false
	task.spawn(function()
		-- upvalues: (copy) v_u_44, (ref) v_u_48, (copy) v_u_33, (ref) v_u_11, (ref) v_u_47, (copy) v_u_46, (ref) v_u_32
		local v49 = nil
		while true do
			task.wait(0)
			local v50 = (v_u_44.PlaybackLoudness - 200) / 700
			local v51 = math.clamp(v50, 0, 1)
			if v49 and (v_u_44.PlaybackLoudness / 1000 - v49 > 0.2 and not v_u_48) then
				for _, v52 in v_u_33.jhailatte.HumanoidRootPart.Attachment:GetChildren() do
					v52:Emit(v52:GetAttribute("EmitCount"))
				end
				local _, v53 = v_u_11:WorldToScreenPoint(v_u_33:GetPivot().p)
				if v53 then
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
						["FieldOfView"] = 68
					}):Play()
					task.delay(0.2, function()
						game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
							["FieldOfView"] = 70
						}):Play()
					end)
				end
			end
			v49 = v_u_44.PlaybackLoudness / 1000
			if v51 > 0.45 then
				local v_u_54 = tick()
				v_u_47 = v_u_54
				if not v_u_48 then
					v_u_48 = true
					v_u_46:Play()
					game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
						["FieldOfView"] = 90
					}):Play()
					for _, v_u_55 in v_u_33.Pyro:GetDescendants() do
						if v_u_55:IsA("ParticleEmitter") then
							v_u_55.Enabled = true
							task.delay(1.5, function()
								-- upvalues: (copy) v_u_55
								v_u_55.Enabled = false
							end)
						end
					end
					for _, v56 in v_u_33.Confetti:GetDescendants() do
						v56:Emit(v56:GetAttribute("EmitCount"))
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_33, (ref) v_u_32
						for _, v_u_57 in v_u_33.SpawnPoints:GetChildren() do
							task.spawn(function()
								-- upvalues: (ref) v_u_32, (copy) v_u_57
								v_u_32(v_u_57.CFrame)
							end)
							task.wait(0.1)
						end
					end)
					task.delay(3, function() end)
					task.spawn(function()
						-- upvalues: (ref) v_u_48, (ref) v_u_33, (ref) v_u_11
						while v_u_48 do
							for _, v58 in v_u_33:WaitForChild("jhailatte").HumanoidRootPart.Attachment:GetChildren() do
								v58:Emit(v58:GetAttribute("EmitCount"))
							end
							local _, v59 = v_u_11:WorldToScreenPoint(v_u_33:GetPivot().p)
							if v59 then
								local v60 = {
									["FieldOfView"] = 68
								}
								game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), v60):Play()
								task.delay(0.2, function()
									game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
										["FieldOfView"] = 70
									}):Play()
								end)
							end
							task.wait(0.5)
						end
					end)
				end
				task.delay(1, function()
					-- upvalues: (ref) v_u_47, (copy) v_u_54, (ref) v_u_48, (ref) v_u_46
					if v_u_47 == v_u_54 then
						v_u_48 = false
						v_u_46:Stop()
					end
				end)
			end
			v_u_33:WaitForChild("DJBooth")
			for _, v61 in v_u_33.DJBooth.Speakers:GetChildren() do
				if v61:IsA("BasePart") then
					local v62 = v61.Mesh
					local v63 = v51 * -1.4
					v62.Offset = Vector3.new(0, v63, 0)
					v61.Mesh.Scale = Vector3.new(1, 1, 1) * (v51 * 0.4 + 1)
				end
			end
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_44, (copy) v_u_33, (copy) v_u_35, (copy) v_u_34, (copy) v_u_38, (copy) v_u_39, (copy) v_u_46, (copy) v_u_37
		v_u_10.Start("SuperStorm", {
			["priority"] = 10
		})
		repeat
			task.wait()
		until workspace:GetAttribute("SuperStorm") ~= true
		game.TweenService:Create(v_u_44, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_44
			v_u_44:Destroy()
		end)
		local v64 = 0
		while v64 < 2 do
			v64 = v64 + game:GetService("RunService").Heartbeat:Wait()
			local v65 = game.TweenService:GetValue(v64, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			v_u_33:PivotTo(v_u_35:Lerp(v_u_34, v65))
			v_u_38:PivotTo((v_u_39 * CFrame.new(0, 2, 0)):Lerp(v_u_39, v65))
		end
		v_u_10.Stop("SuperStorm")
		v_u_38:Destroy()
		v_u_46:Destroy()
		v_u_37:Destroy()
		v_u_33:Destroy()
	end)
end
local function v_u_77()
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	local v67 = game.ReplicatedStorage.VolcanoUI:Clone()
	v67.Parent = game.Players.LocalPlayer.PlayerGui
	v67.LocalScript.Enabled = true
	game.Debris:AddItem(v67, 9)
	local v68 = workspace.Visuals:WaitForChild("Volcano")
	print(v68)
	local v69 = v68:GetAttribute("Pivot")
	local v70 = 0
	while v70 < 3 do
		v70 = v70 + game:GetService("RunService").Heartbeat:Wait()
		local v71 = game.TweenService:GetValue(v70 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v68:PivotTo(v69:Lerp(v68:GetAttribute("Pivot") * CFrame.new(0, 150, 0), v71))
	end
	v_u_6:Shake(v_u_4.Presets.Explosion)
	v_u_6:ShakeSustain(v_u_4.Presets.WeakEarthquake)
	for _, v72 in v68:GetDescendants() do
		if v72:IsA("Beam") or v72:IsA("ParticleEmitter") then
			v72.Enabled = true
		end
	end
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	repeat
		task.wait(1)
	until workspace:GetAttribute("SuperStorm") ~= true
	for _, v73 in v68:GetDescendants() do
		if v73:IsA("Beam") or v73:IsA("ParticleEmitter") then
			v73.Enabled = false
		end
	end
	v_u_6:StopSustained(1)
	local v74 = v68:GetAttribute("Pivot") * CFrame.new(0, 150, 0)
	local v75 = 0
	while v75 < 3 do
		v75 = v75 + game:GetService("RunService").Heartbeat:Wait()
		local v76 = game.TweenService:GetValue(v75 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v68:PivotTo(v74:Lerp(v68:GetAttribute("Pivot"), v76))
	end
	v68:Destroy()
end
local function v_u_105(p78)
	-- upvalues: (ref) v_u_2, (copy) v_u_7, (copy) v_u_77, (copy) v_u_23, (copy) v_u_66, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	if v_u_2 == true then
		return
	end
	v_u_2 = true
	v_u_7:CreateNotification("An earthquake is happening!")
	task.spawn(v_u_77, p78)
	task.spawn(v_u_23, p78)
	task.spawn(v_u_66, p78)
	local v_u_79 = nil
	local v_u_80 = v_u_8:PlaySound(v_u_9.Weather.Earthquake.EarthquakeLoop, {
		["Looped"] = true,
		["Volume"] = 0
	}, nil, nil)
	local v_u_81 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_3, (copy) v_u_80, (copy) v_u_81, (ref) v_u_79, (ref) v_u_8, (ref) v_u_9
		v_u_6:ShakeSustain(v_u_4.Presets.WeakEarthquake)
		local v82 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		v_u_3:Create(v_u_80, v_u_81, {
			["Volume"] = 0.2
		}):Play()
		v_u_79 = script.Parent.Earthquake.TopPlate:Clone()
		v_u_79.Parent = workspace
		v_u_79.Particle1.Enabled = true
		v_u_79.Particle2.Enabled = true
		local v83 = script.Parent.Earthquake.EarthquakeCracks:Clone()
		v83.Name = "EarthquakeVisuals"
		v83.Parent = workspace.WeatherVisuals
		for v84 = 1, 22 do
			v_u_6:Shake(v_u_4.Presets.Bump)
			local v_u_85 = v83:WaitForChild((tostring(v84)))
			local v86 = v_u_85.Position
			local v87 = v_u_85.Size
			v_u_85.CFrame = v_u_85.CFrame * CFrame.new(0, 0, v87.Z / 2)
			local v88 = v87.X
			local v89 = v87.Y
			v_u_85.Size = Vector3.new(v88, v89, 0)
			v_u_85.Transparency = 0
			v_u_3:Create(v_u_85, v82, {
				["Size"] = v87,
				["Position"] = v86
			}):Play()
			local v_u_90 = #v_u_85:GetChildren()
			if v_u_90 > 0 then
				task.delay(0.15, function()
					-- upvalues: (copy) v_u_90, (copy) v_u_85, (ref) v_u_3, (ref) v_u_8, (ref) v_u_9
					local v91 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
					for v92 = 1, v_u_90 do
						local v93 = v_u_85:WaitForChild((tostring(v92)))
						local v94 = v93.Position
						local v95 = v93.Size
						v93.CFrame = v93.CFrame * CFrame.new(0, 0, v95.Z / 2)
						local v96 = v95.X
						local v97 = v95.Y
						v93.Size = Vector3.new(v96, v97, 0)
						v93.Transparency = 0
						v_u_3:Create(v93, v91, {
							["Size"] = v95,
							["Position"] = v94
						}):Play()
						local v98 = script.Parent.Earthquake.Particle1:Clone()
						local v99 = script.Parent.Earthquake.Particle2:Clone()
						v98.Parent = v93
						v98.Enabled = true
						v99.Parent = v93
						v99.Enabled = true
						v_u_8:PlaySound(v_u_9.Weather.Earthquake.EarthquakeStart, {
							["PlaybackSpeed"] = math.random(7, 13) / 10
						}, nil, v93)
						task.wait(0.3)
						if v98 then
							v98.Enabled = false
						end
						if v99 then
							v99.Enabled = false
						end
					end
				end)
			end
			local v100 = script.Parent.Earthquake.Particle1:Clone()
			local v101 = script.Parent.Earthquake.Particle2:Clone()
			v100.Parent = v_u_85
			v100.Enabled = true
			v101.Parent = v_u_85
			v101.Enabled = true
			v_u_8:PlaySound(v_u_9.Weather.Earthquake.EarthquakeStart, {
				["PlaybackSpeed"] = math.random(7, 13) / 10
			}, nil, v_u_85)
			task.wait(0.3)
			if v100 then
				v100.Enabled = false
			end
			if v101 then
				v101.Enabled = false
			end
		end
		task.wait(1)
		if v_u_79 then
			v_u_79.Particle1.Enabled = false
			v_u_79.Particle2.Enabled = false
		end
		v_u_6:StopSustained()
		v_u_3:Create(v_u_80, v_u_81, {
			["Volume"] = 0
		}):Play()
		task.wait(2)
		v_u_80:Stop()
		task.wait(4)
		if v83 then
			for v102 = 1, 22 do
				local v103 = v83:WaitForChild((tostring(v102)))
				v103.Particle1:Destroy()
				v103.Particle2:Destroy()
			end
		end
	end)
	local v104 = v_u_79
	while workspace:GetAttribute("SuperStorm") == true do
		task.wait(15)
		if workspace:GetAttribute("SuperStorm") ~= true then
			break
		end
		v_u_6:ShakeSustain(v_u_4.Presets.Earthquake)
		if v104 then
			v104.Particle1.Rate = 0
			v104.Particle1.Enabled = true
			v104.Particle2.Rate = 0
			v104.Particle2.Enabled = true
			v_u_3:Create(v104.Particle1, v_u_81, {
				["Rate"] = 25
			}):Play()
			v_u_3:Create(v104.Particle2, v_u_81, {
				["Rate"] = 15
			}):Play()
		end
		v_u_80.Volume = 0
		v_u_80:Play()
		v_u_3:Create(v_u_80, v_u_81, {
			["Volume"] = 0.3
		}):Play()
		task.wait(4)
		if v104 then
			v104.Particle1.Enabled = false
			v104.Particle2.Enabled = false
		end
		v_u_6:StopSustained()
		v_u_3:Create(v_u_80, v_u_81, {
			["Volume"] = 0
		}):Play()
	end
	if v104 then
		v104:Destroy()
	end
end
local function v_u_113(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_12, (copy) v_u_3
	if v_u_2 ~= false then
		v_u_2 = false
		game.ReplicatedStorage.Shooting_Stars.Value = false
		task.delay(5, function()
			-- upvalues: (ref) v_u_12
			game.TweenService:Create(v_u_12, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.wait(1)
			v_u_12.Parent = script
			v_u_12:Stop()
			task.wait(6)
			game.Lighting.SunRays.Enabled = false
		end)
		local v106 = workspace.WeatherVisuals:FindFirstChild("EarthquakeVisuals")
		if v106 ~= nil then
			local v107 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
			for v108 = 1, 22 do
				local v_u_109 = v106:WaitForChild((tostring(v108)))
				local v_u_110 = #v_u_109:GetChildren()
				if v_u_110 > 0 then
					task.spawn(function()
						-- upvalues: (copy) v_u_110, (copy) v_u_109, (ref) v_u_3
						local v111 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
						for v112 = 1, v_u_110 do
							v_u_3:Create(v_u_109:WaitForChild((tostring(v112))), v111, {
								["Transparency"] = 1
							}):Play()
							task.wait(0.1)
						end
					end)
				end
				v_u_3:Create(v_u_109, v107, {
					["Transparency"] = 1
				}):Play()
				task.wait(0.1)
			end
			task.wait(4)
			if v106 then
				v106:Destroy()
			end
		end
	end
end
workspace:GetAttributeChangedSignal("SuperStorm"):Connect(function()
	-- upvalues: (copy) v_u_105, (copy) v_u_113
	if workspace:GetAttribute("SuperStorm") == true then
		v_u_105()
	else
		v_u_113()
	end
end)
if workspace:GetAttribute("SuperStorm") == true then
	task.defer(function()
		-- upvalues: (copy) v_u_105
		v_u_105(true)
	end)
else
	v_u_113(true)
end
return v1