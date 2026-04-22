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
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.SoundPlayer)
local v_u_8 = require(v6.Data.SoundData)
local v_u_9 = script.Sky
local v_u_10 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_10.AddSkybox(v_u_9)
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local function v_u_22(p12)
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	local v13 = game.ReplicatedStorage.ShootingStar:Clone()
	v13.CFrame = p12
	v13.Parent = workspace
	local v14 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 2
	}
	local v15 = v_u_7:PlaySound(v_u_8.Weather.DJ.Fire, v14, nil, nil)
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
		["Volume"] = 2
	}
	local v21 = v_u_7:PlaySound(v_u_8.Weather.DJ.Boom, v20, nil, nil)
	game.Debris:AddItem(v21, 5)
	game.Debris:AddItem(v18, 10)
end
local function v_u_56()
	-- upvalues: (ref) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_2, (copy) v_u_22, (copy) v_u_3
	v_u_5 = true
	game.TweenService:Create(v_u_11, TweenInfo.new(2), {
		["Brightness"] = 0.1
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(2), {
		["Ambient"] = Color3.fromRGB(60, 162, 230),
		["Brightness"] = 1
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0.436,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	v_u_10.UpdateSkybox(v_u_9, 2)
	local v_u_23 = workspace.Visuals:WaitForChild("DJJhai")
	local v_u_24 = v_u_23:GetPivot()
	local v_u_25 = v_u_24 * CFrame.new(0, 85, 0)
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
		while workspace:GetAttribute("DJJhai") do
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
	local v35 = { 104445637963020 }
	v_u_34.SoundId = "rbxassetid://" .. v35[Random.new():NextInteger(1, #v35)]
	v_u_34.Volume = 0.6
	v_u_34.Looped = true
	v_u_34.Parent = workspace
	v_u_34.SoundGroup = game.SoundService.Music.Tunes
	v_u_34:Play()
	local v_u_36 = v26:LoadAnimation(script.Up)
	local v_u_37 = 0
	local v_u_38 = false
	task.spawn(function()
		-- upvalues: (copy) v_u_34, (ref) v_u_38, (copy) v_u_23, (ref) v_u_2, (ref) v_u_37, (copy) v_u_36, (ref) v_u_11, (ref) v_u_22
		local v39 = nil
		while true do
			task.wait(0)
			local v40 = (v_u_34.PlaybackLoudness - 200) / 700
			local v41 = math.clamp(v40, 0, 1)
			if v39 and (v_u_34.PlaybackLoudness / 1000 - v39 > 0.2 and not v_u_38) then
				for _, v42 in v_u_23.jhailatte.HumanoidRootPart.Attachment:GetChildren() do
					v42:Emit(v42:GetAttribute("EmitCount"))
				end
				local _, v43 = v_u_2:WorldToScreenPoint(v_u_23:GetPivot().p)
				if v43 then
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
			v39 = v_u_34.PlaybackLoudness / 1000
			if v41 > 0.45 then
				local v_u_44 = tick()
				v_u_37 = v_u_44
				if not v_u_38 then
					v_u_38 = true
					v_u_36:Play()
					game.TweenService:Create(v_u_11, TweenInfo.new(0.3), {
						["TintColor"] = Color3.fromRGB(226, 192, 255),
						["Brightness"] = 0.5
					}):Play()
					game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
						["FieldOfView"] = 90
					}):Play()
					for _, v_u_45 in v_u_23.Pyro:GetDescendants() do
						if v_u_45:IsA("ParticleEmitter") then
							v_u_45.Enabled = true
							task.delay(1.5, function()
								-- upvalues: (copy) v_u_45
								v_u_45.Enabled = false
							end)
						end
					end
					for _, v46 in v_u_23.Confetti:GetDescendants() do
						v46:Emit(v46:GetAttribute("EmitCount"))
					end
					task.spawn(function()
						-- upvalues: (ref) v_u_23, (ref) v_u_22
						for _, v_u_47 in v_u_23.SpawnPoints:GetChildren() do
							task.spawn(function()
								-- upvalues: (ref) v_u_22, (copy) v_u_47
								v_u_22(v_u_47.CFrame)
							end)
							task.wait(0.1)
						end
					end)
					task.delay(3, function()
						-- upvalues: (ref) v_u_11
						game.TweenService:Create(v_u_11, TweenInfo.new(3), {
							["TintColor"] = Color3.fromRGB(255, 255, 255),
							["Brightness"] = 0.1
						}):Play()
					end)
					task.spawn(function()
						-- upvalues: (ref) v_u_38, (ref) v_u_23, (ref) v_u_2
						while v_u_38 do
							for _, v48 in v_u_23:WaitForChild("jhailatte").HumanoidRootPart.Attachment:GetChildren() do
								v48:Emit(v48:GetAttribute("EmitCount"))
							end
							local _, v49 = v_u_2:WorldToScreenPoint(v_u_23:GetPivot().p)
							if v49 then
								local v50 = {
									["FieldOfView"] = 68
								}
								game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), v50):Play()
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
					-- upvalues: (ref) v_u_37, (copy) v_u_44, (ref) v_u_38, (ref) v_u_36
					if v_u_37 == v_u_44 then
						v_u_38 = false
						v_u_36:Stop()
					end
				end)
			end
			for _, v51 in v_u_23.DJBooth.Speakers:GetChildren() do
				if v51:IsA("BasePart") then
					local v52 = v51.Mesh
					local v53 = v41 * -1.4
					v52.Offset = Vector3.new(0, v53, 0)
					v51.Mesh.Scale = Vector3.new(1, 1, 1) * (v41 * 0.4 + 1)
				end
			end
		end
	end)
	v_u_3.Start("DJJhai", {
		["priority"] = 12
	})
	task.spawn(function()
		-- upvalues: (copy) v_u_34, (copy) v_u_23, (copy) v_u_25, (copy) v_u_24, (copy) v_u_28, (copy) v_u_29, (ref) v_u_3, (copy) v_u_36, (copy) v_u_27, (ref) v_u_10, (ref) v_u_9, (ref) v_u_11
		repeat
			task.wait()
		until not workspace:GetAttribute("DJJhai")
		game.TweenService:Create(v_u_34, TweenInfo.new(1), {
			["Volume"] = 0
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_34
			v_u_34:Destroy()
		end)
		local v54 = 0
		while v54 < 2 do
			v54 = v54 + game:GetService("RunService").Heartbeat:Wait()
			local v55 = game.TweenService:GetValue(v54, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			v_u_23:PivotTo(v_u_25:Lerp(v_u_24, v55))
			v_u_28:PivotTo((v_u_29 * CFrame.new(0, 2, 0)):Lerp(v_u_29, v55))
		end
		v_u_3.Stop("DJJhai")
		v_u_28:Destroy()
		v_u_36:Destroy()
		v_u_27:Destroy()
		v_u_23:Destroy()
		v_u_10.UpdateSkybox(v_u_9, 0)
		game.TweenService:Create(v_u_11, TweenInfo.new(3), {
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
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
	end)
end
workspace:GetAttributeChangedSignal("DJJhai"):Connect(function()
	-- upvalues: (copy) v_u_56, (ref) v_u_5
	if workspace:GetAttribute("DJJhai") then
		v_u_56()
	else
		v_u_5 = false
	end
end)
if workspace:GetAttribute("DJJhai") then
	task.defer(v_u_56)
else
	v_u_5 = false
end
return v1