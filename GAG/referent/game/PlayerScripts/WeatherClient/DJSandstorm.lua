local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local v_u_2 = workspace.CurrentCamera
require(game.ReplicatedStorage.Code.CameraShaker)
require(game.ReplicatedStorage.Code.LightningBolt)
local v_u_3 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v_u_6 = script.Sky
local v_u_7 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_7.AddSkybox(v_u_6)
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
local v9 = game:GetService("ReplicatedStorage")
local v_u_10 = require(v9.Modules.SoundPlayer)
local v_u_11 = require(v9.Data.SoundData)
local function v_u_22(p12)
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v13 = game.ReplicatedStorage.ShootingStar:Clone()
	v13.CFrame = p12
	v13.Parent = workspace
	local v14 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 4
	}
	local v15 = v_u_10:PlaySound(v_u_11.Weather.DJ.Fire, v14, nil, nil)
	game.Debris:AddItem(v15, 5)
	local v16 = 0
	while v16 < 1 do
		v16 = v16 + game:GetService("RunService").Heartbeat:Wait()
		v13:PivotTo(p12:Lerp(p12 * CFrame.new(0, 200, 0), v16))
	end
	for _, v17 in v13:GetDescendants() do
		if v17:IsA("BillboardGui") then
			v17.Enabled = false
		end
	end
	game.Debris:AddItem(v13, 4)
	local v18 = game.ReplicatedStorage.FireworkBoom:Clone()
	v18.Parent = workspace
	v18.CFrame = v13.CFrame
	for _, v19 in v18:GetDescendants() do
		if v19:IsA("ParticleEmitter") then
			v19:Emit(v19:GetAttribute("EmitCount"))
		end
	end
	local v20 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 4
	}
	local v21 = v_u_10:PlaySound(v_u_11.Weather.DJ.Fire, v20, nil, nil)
	game.Debris:AddItem(v21, 5)
	game.Debris:AddItem(v18, 10)
end
local function v_u_57()
	-- upvalues: (ref) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_2, (copy) v_u_22, (copy) v_u_3
	v_u_5 = true
	game.TweenService:Create(v_u_8, TweenInfo.new(2), {
		["Brightness"] = 0
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(56, 156, 54),
		["Brightness"] = 1
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0.392,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(73, 156, 67),
		["Decay"] = Color3.fromRGB(73, 156, 67),
		["Glare"] = 1,
		["Haze"] = 1
	}):Play()
	v_u_7.UpdateSkybox(v_u_6, 2)
	local v_u_23 = workspace.Visuals:WaitForChild("DJJhai")
	local v_u_24 = v_u_23:GetPivot()
	local v_u_25 = v_u_24 * CFrame.new(0, 100, 0)
	local v26 = v_u_23:WaitForChild("jhailatte"):WaitForChild("Humanoid"):WaitForChild("Animator")
	local v_u_27 = v26:LoadAnimation(script.Animation)
	v_u_27:Play()
	local v_u_28 = game.ReplicatedStorage.Assets.DanceFloor:Clone()
	local v_u_29 = v_u_28:GetPivot()
	v_u_28.Parent = workspace
	local function v_u_31()
		-- upvalues: (copy) v_u_28
		for _, v30 in v_u_28.Colour:GetChildren() do
			v30.Color = Color3.fromHSV(Random.new():NextNumber(0, 1), Random.new():NextNumber(0, 1), 1)
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_31
		while workspace:GetAttribute("DJSandstorm") do
			v_u_31()
			task.wait(1)
		end
	end)
	local v32 = 0
	while v32 < 2 do
		v32 = v32 + game:GetService("RunService").Heartbeat:Wait()
		local v33 = game.TweenService:GetValue(v32, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v_u_23:PivotTo(v_u_24:Lerp(v_u_25, v33))
		v_u_28:PivotTo(v_u_29:Lerp(v_u_29 * CFrame.new(0, 2, 0), v33))
	end
	local v_u_34 = Instance.new("Sound")
	local v35 = { 114782160581561 }
	v_u_34.SoundId = "rbxassetid://" .. v35[Random.new():NextInteger(1, #v35)]
	v_u_34.Volume = 1.5
	v_u_34.Looped = true
	v_u_34.Parent = workspace
	v_u_34.SoundGroup = game.SoundService.Music.Tunes
	v_u_34:Play()
	task.delay(44, function()
		local v36 = game.ReplicatedStorage.FruitRain:Clone()
		v36.Parent = workspace.Visuals
		print("spawnedIn")
		repeat
			task.wait()
		until not workspace:GetAttribute("DJSandstorm")
		v36.ParticleEmitter.Enabled = false
		game.Debris:AddItem(v36, 4)
	end)
	local v_u_37 = v26:LoadAnimation(script.Up)
	local v_u_38 = 0
	local v_u_39 = false
	task.spawn(function()
		-- upvalues: (copy) v_u_34, (ref) v_u_39, (copy) v_u_23, (ref) v_u_2, (ref) v_u_38, (copy) v_u_37, (ref) v_u_8, (ref) v_u_22
		local v40 = nil
		while true do
			task.wait(0)
			local v41 = v_u_34.PlaybackLoudness / 300
			local v42 = math.clamp(v41, 0, 1)
			if v40 and (v_u_34.PlaybackLoudness / 300 - v40 > 0.2 and not v_u_39) then
				for _, v43 in v_u_23.jhailatte.HumanoidRootPart.Attachment:GetChildren() do
					v43:Emit(v43:GetAttribute("EmitCount"))
				end
				local _, v44 = v_u_2:WorldToScreenPoint(v_u_23:GetPivot().p)
				if v44 then
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
			v40 = v_u_34.PlaybackLoudness / 300
			if v42 > 0.45 then
				local v_u_45 = tick()
				v_u_38 = v_u_45
				if not v_u_39 then
					v_u_39 = true
					v_u_37:Play()
					game.TweenService:Create(v_u_8, TweenInfo.new(0.3), {
						["TintColor"] = Color3.fromRGB(194, 255, 161),
						["Brightness"] = 0.2
					}):Play()
					game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
						["FieldOfView"] = 90
					}):Play()
					for _, v_u_46 in v_u_23.Pyro:GetDescendants() do
						if v_u_46:IsA("ParticleEmitter") then
							v_u_46.Enabled = true
							task.delay(1.5, function()
								-- upvalues: (copy) v_u_46
								v_u_46.Enabled = false
							end)
						end
					end
					for _, v47 in v_u_23.Confetti:GetDescendants() do
						v47:Emit(v47:GetAttribute("EmitCount"))
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_23, (ref) v_u_22
						for _, v_u_48 in v_u_23.SpawnPoints:GetChildren() do
							task.spawn(function()
								-- upvalues: (ref) v_u_22, (copy) v_u_48
								v_u_22(v_u_48.CFrame)
							end)
							task.wait(0.1)
						end
					end)
					task.delay(3, function()
						-- upvalues: (ref) v_u_8
						game.TweenService:Create(v_u_8, TweenInfo.new(3), {
							["TintColor"] = Color3.fromRGB(255, 255, 255),
							["Brightness"] = 0.1
						}):Play()
					end)
					task.spawn(function()
						-- upvalues: (ref) v_u_39, (ref) v_u_23, (ref) v_u_2
						while v_u_39 do
							for _, v49 in v_u_23:WaitForChild("jhailatte").HumanoidRootPart.Attachment:GetChildren() do
								v49:Emit(v49:GetAttribute("EmitCount"))
							end
							local _, v50 = v_u_2:WorldToScreenPoint(v_u_23:GetPivot().p)
							if v50 then
								local v51 = {
									["FieldOfView"] = 68
								}
								game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), v51):Play()
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
					-- upvalues: (ref) v_u_38, (copy) v_u_45, (ref) v_u_39, (ref) v_u_37
					if v_u_38 == v_u_45 then
						v_u_39 = false
						v_u_37:Stop()
					end
				end)
			end
			if v_u_23 and v_u_23:FindFirstChild("DJBooth") then
				for _, v52 in v_u_23.DJBooth.Speakers:GetChildren() do
					if v52:IsA("BasePart") then
						local v53 = v52.Mesh
						local v54 = v42 * -1.4
						v53.Offset = Vector3.new(0, v54, 0)
						v52.Mesh.Scale = Vector3.new(1, 1, 1) * (v42 * 0.4 + 1)
					end
				end
			end
		end
	end)
	v_u_3.Start("DJSandstorm", {
		["priority"] = 12
	})
	task.spawn(function()
		-- upvalues: (copy) v_u_34, (copy) v_u_23, (copy) v_u_25, (copy) v_u_24, (copy) v_u_28, (copy) v_u_29, (ref) v_u_3, (copy) v_u_37, (copy) v_u_27, (ref) v_u_7, (ref) v_u_6, (ref) v_u_8
		repeat
			task.wait()
		until not workspace:GetAttribute("DJSandstorm")
		game.TweenService:Create(v_u_34, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_34
			v_u_34:Destroy()
		end)
		local v55 = 0
		while v55 < 2 do
			v55 = v55 + game:GetService("RunService").Heartbeat:Wait()
			local v56 = game.TweenService:GetValue(v55, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			v_u_23:PivotTo(v_u_25:Lerp(v_u_24, v56))
			v_u_28:PivotTo((v_u_29 * CFrame.new(0, 2, 0)):Lerp(v_u_29, v56))
		end
		v_u_3.Stop("DJSandstorm")
		v_u_28:Destroy()
		v_u_37:Destroy()
		v_u_27:Destroy()
		v_u_23:Destroy()
		v_u_7.UpdateSkybox(v_u_6, 0)
		game.TweenService:Create(v_u_8, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255),
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
	end)
end
workspace:GetAttributeChangedSignal("DJSandstorm"):Connect(function()
	-- upvalues: (copy) v_u_57, (ref) v_u_5
	if workspace:GetAttribute("DJSandstorm") then
		v_u_57()
	else
		v_u_5 = false
	end
end)
if workspace:GetAttribute("DJSandstorm") then
	task.defer(v_u_57)
else
	v_u_5 = false
end
return v1