local v1 = {}
local v_u_2 = game.ReplicatedStorage.SnowParticle
local v_u_3 = Random.new()
local v_u_4 = workspace.CurrentCamera
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Modules.SoundPlayer)
local v_u_7 = require(v5.Data.SoundData)
local v_u_8 = RaycastParams.new()
v_u_8.FilterDescendantsInstances = { workspace.Terrain, workspace }
v_u_8.FilterType = Enum.RaycastFilterType.Include
local v_u_9 = {}
local v_u_10 = false
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local function v_u_15(p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_9
	local v13 = {
		["particle"] = v_u_2:Clone(),
		["position"] = p12,
		["spawnTime"] = os.clock(),
		["visible"] = false,
		["lastupdate"] = 0
	}
	game.TweenService:Create(v13.particle, TweenInfo.new(0.7), {
		["Transparency"] = 0.2
	}):Play()
	local v14 = v_u_9
	table.insert(v14, v13)
end
local function v_u_37(p16, p17, p18)
	-- upvalues: (copy) v_u_8
	local _ = p17 - p16.spawnTime + p18
	local v19 = p16.position
	local v20 = (Vector3.new(-7, 0, 0)).Unit * 45 * p18
	local v21 = p16.spawnTime * 90
	local v22 = math.rad(v21)
	local v23 = math.sin(v22)
	local v24 = p16.spawnTime * 90
	local v25 = math.rad(v24)
	local v26 = (math.sin(v25) + 1) / 2 * -5
	local v27 = p16.spawnTime * 90
	local v28 = math.rad(v27)
	local v29 = math.sin(v28)
	local v30 = v20 + Vector3.new(v23, v26, v29) * p18
	local v31 = p18 * 0.5
	local v32 = os.clock() * 35
	local v33 = math.rad(v32) + p16.spawnTime
	local v34 = v31 * math.sin(v33)
	local v35 = v30 + Vector3.new(v34, 0, 0)
	local v36 = workspace:Spherecast(v19, 0.15, v35 * p18, v_u_8)
	if v36 then
		return v36.Position, true
	end
	p16.position = v19 + v35 * p18
	return v19
end
local v_u_38 = script.Sky
local v_u_39 = require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_40 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_40.AddSkybox(v_u_38)
local function v_u_53()
	-- upvalues: (ref) v_u_10, (copy) v_u_6, (copy) v_u_7, (copy) v_u_39, (copy) v_u_40, (copy) v_u_38, (copy) v_u_11, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_15
	v_u_10 = true
	task.delay(0.4, function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_10, (ref) v_u_39
		local v41 = game.Players.LocalPlayer.Character
		if v41 and v41:IsDescendantOf(workspace) then
			local v42 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 30,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Looped"] = true,
				["Volume"] = 0
			}
			local v_u_43 = v_u_6:PlaySound(v_u_7.Weather.Frost.coldSound, v42, nil, v41.PrimaryPart)
			game.TweenService:Create(v_u_43, TweenInfo.new(1), {
				["Volume"] = 0.04
			}):Play()
			task.spawn(function()
				-- upvalues: (ref) v_u_10, (copy) v_u_43
				repeat
					task.wait(0.5)
				until not v_u_10
				game.TweenService:Create(v_u_43, TweenInfo.new(1), {
					["Volume"] = 0
				}):Play()
				game.Debris:AddItem(v_u_43, 1)
			end)
		end
		v_u_39.EnableShaking()
	end)
	v_u_40.UpdateSkybox(v_u_38, 2)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.493,
		["Glare"] = 0.85,
		["Haze"] = 2.11,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(131, 179, 255),
		["ExposureCompensation"] = 0.4,
		["Brightness"] = 1
	}):Play()
	game.TweenService:Create(v_u_11, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["Saturation"] = -0.2
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.777,
		["Density"] = 0.123,
		["Color"] = Color3.fromRGB(206, 238, 255)
	}):Play()
	local v_u_44 = game.ReplicatedStorage.WindyFrostEffect:Clone()
	v_u_44.Parent = workspace
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_9, (ref) v_u_3, (ref) v_u_4, (ref) v_u_15, (ref) v_u_40, (ref) v_u_38, (copy) v_u_44, (ref) v_u_39, (ref) v_u_11
		while v_u_10 do
			game:GetService("RunService").Heartbeat:Wait()
			if #v_u_9 <= 200 then
				for _ = 1, 3 do
					local v45 = v_u_3:NextNumber(10, 180)
					local v46 = 2 * v45
					local v47 = v_u_4.FieldOfView / 2
					local v48 = math.rad(v47)
					local v49 = v46 * math.tan(v48)
					local v50 = v49 * (v_u_4.ViewportSize.X / v_u_4.ViewportSize.Y)
					local v51 = v_u_4.CFrame * CFrame.new(v_u_3:NextNumber(-v50 / 2, v50 / 2), v_u_3:NextNumber(-v49 / 2, v49 / 2 + 20), -v45)
					if not workspace:Raycast(v51.Position, Vector3.new(0, 150, 0)) then
						v_u_15(v51.Position)
					end
				end
			end
		end
		v_u_40.UpdateSkybox(v_u_38, 0)
		for _, v52 in v_u_44:GetChildren() do
			v52.Enabled = false
		end
		task.delay(6, function()
			-- upvalues: (ref) v_u_44
			v_u_44:Destroy()
		end)
		v_u_39.DisableShaking()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Haze"] = 0,
			["Glare"] = 0,
			["Offset"] = 0
		}):Play()
		game.TweenService:Create(v_u_11, TweenInfo.new(3), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0,
			["Color"] = Color3.fromRGB(22, 40, 70)
		}):Play()
		task.delay(3, function()
			game.Workspace.Terrain.Clouds.Enabled = false
		end)
	end)
end
workspace:GetAttributeChangedSignal("FrostEvent"):Connect(function()
	-- upvalues: (copy) v_u_53, (ref) v_u_10
	if workspace:GetAttribute("FrostEvent") then
		v_u_53()
	else
		v_u_10 = false
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_37, (copy) v_u_4
	while true do
		local v54 = game:GetService("RunService").RenderStepped:Wait()
		local v55 = os.clock()
		local v56 = v54 * 3
		local v57 = v54 * 5
		local v58 = math.min(1, v57)
		local v59 = {}
		local v60 = {}
		for v61 = #v_u_9, 1, -1 do
			local v62 = v_u_9[v61]
			local v63, v64 = v_u_37(v62, v55, v58)
			local v65, v66 = v_u_4:WorldToScreenPoint(v63)
			local v67 = v62.visible
			local v68 = (v_u_4.CFrame.Position - v63).Magnitude / 120
			local v69 = v68 * v68
			local v70 = 1 / math.random(60, 120)
			local v71 = v56 * v69 + 0.016666666666666666
			if v68 > 1.5 then
				v62.particle:Destroy()
				table.remove(v_u_9, v61)
			elseif v55 - v62.lastupdate + v70 > v71 then
				v62.lastupdate = v55
				if v66 and v65.Z < 200 then
					v62.visible = true
					local v72 = v62.particle
					table.insert(v59, v72)
					local v73 = CFrame.new(v63, v_u_4.CFrame.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
					table.insert(v60, v73)
				else
					v62.visible = false
				end
				if v62.visible ~= v67 then
					if v62.visible then
						v62.particle.Parent = workspace.WeatherVisuals
					else
						v62.particle.Parent = nil
					end
				end
				if v64 then
					game.Debris:AddItem(v62.particle, 1)
					game.TweenService:Create(v62.particle, TweenInfo.new(1), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_9, v61)
				elseif os.clock() - v62.spawnTime > 7 then
					game.Debris:AddItem(v62.particle, 0.3)
					game.TweenService:Create(v62.particle, TweenInfo.new(0.3), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_9, v61)
				end
			end
		end
		debug.profilebegin("Weather_" .. script.Name)
		workspace:BulkMoveTo(v59, v60, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("FrostEvent") then
	task.defer(v_u_53)
else
	v_u_10 = false
end
return v1