local v1 = {}
local v_u_2 = game.ReplicatedStorage.SheckleParticle
local v_u_3 = Random.new()
local v_u_4 = workspace.CurrentCamera
local v_u_5 = RaycastParams.new()
v_u_5.FilterDescendantsInstances = { workspace.Terrain, workspace }
v_u_5.FilterType = Enum.RaycastFilterType.Include
local v_u_6 = {}
local v_u_7 = false
local function v_u_11(p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	local v9 = {
		["particle"] = v_u_2:Clone(),
		["position"] = p8,
		["spawnTime"] = os.clock(),
		["visible"] = false,
		["lastupdate"] = 0
	}
	game.TweenService:Create(v9.particle, TweenInfo.new(0.7), {
		["Transparency"] = 0.2
	}):Play()
	local v10 = v_u_6
	table.insert(v10, v9)
end
local v_u_12 = game.ReplicatedStorage.SheckleRainEmitter:Clone()
v_u_12.Parent = workspace.WeatherVisuals
local v_u_13 = script.Sky
local v_u_14 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_14.AddSkybox(v_u_13)
local v_u_15 = game.Lighting.ColorCorrection:Clone()
v_u_15.Name = script.Name
v_u_15.Parent = game.Lighting
local function v_u_23()
	-- upvalues: (ref) v_u_7, (copy) v_u_12, (copy) v_u_14, (copy) v_u_13, (copy) v_u_15, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_11
	v_u_7 = true
	v_u_12.ParticleEmitter.Enabled = true
	v_u_14.UpdateSkybox(v_u_13, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(255, 206, 138),
		["ExposureCompensation"] = 0.4,
		["Brightness"] = 0.7
	}):Play()
	game.TweenService:Create(v_u_15, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(252, 255, 193)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.624,
		["Density"] = 1,
		["Color"] = Color3.fromRGB(255, 245, 167)
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_3, (ref) v_u_4, (ref) v_u_11, (ref) v_u_14, (ref) v_u_13, (ref) v_u_12, (ref) v_u_15
		while v_u_7 do
			task.wait(0.05)
			if #v_u_6 <= 400 then
				for _ = 1, 3 do
					local v16 = v_u_3:NextNumber(10, 180)
					local v17 = 2 * v16
					local v18 = v_u_4.FieldOfView / 2
					local v19 = math.rad(v18)
					local v20 = v17 * math.tan(v19)
					local v21 = v20 * (v_u_4.ViewportSize.X / v_u_4.ViewportSize.Y)
					local v22 = v_u_4.CFrame * CFrame.new(v_u_3:NextNumber(-v21 / 2, v21 / 2), v_u_3:NextNumber(-v20 / 2, v20 / 2 + 20), -v16)
					if not workspace:Raycast(v22.Position, Vector3.new(0, 150, 0)) then
						v_u_11(v22.Position)
					end
				end
			end
		end
		v_u_14.UpdateSkybox(v_u_13, 0)
		v_u_12.ParticleEmitter.Enabled = false
		game.TweenService:Create(v_u_15, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0
		}):Play()
		task.delay(3, function()
			game.Workspace.Terrain.Clouds.Enabled = false
		end)
	end)
end
workspace:GetAttributeChangedSignal("SheckleRain"):Connect(function()
	-- upvalues: (copy) v_u_23, (ref) v_u_7
	if workspace:GetAttribute("SheckleRain") then
		v_u_23()
	else
		v_u_7 = false
	end
end)
local v_u_24 = game.ReplicatedStorage.SheckleSplash:Clone()
v_u_24.Parent = workspace.WeatherVisuals
task.spawn(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_24, (copy) v_u_3
	while true do
		local v25 = game:GetService("RunService").RenderStepped:Wait()
		local v26 = os.clock()
		local v27 = v25 * 3
		local v28 = v25 * 5
		local v29 = math.min(1, v28)
		local v30 = {}
		local v31 = {}
		for v32, v33 in v_u_6 do
			local _ = v26 - v33.spawnTime + v29
			local v34 = v33.position
			local v35 = -5 * v29
			local v36 = Vector3.new(0, v35, 0)
			local v37 = workspace:Spherecast(v34, 0.15, v36, v_u_5)
			local v38
			if v37 then
				v34 = v37.Position
				v38 = true
			else
				v33.position = v34 + v36
				v38 = nil
			end
			local v39, v40 = v_u_4:WorldToScreenPoint(v34)
			local v41 = v33.visible
			local v42 = (v_u_4.CFrame.Position - v34).Magnitude / 120
			local v43 = v42 * v42
			local v44 = 1 / math.random(60, 120)
			local v45 = v27 * v43 + 0.016666666666666666
			if v42 > 1.5 then
				v33.particle:Destroy()
				table.remove(v_u_6, v32)
			elseif v26 - v33.lastupdate + v44 > v45 then
				v33.lastupdate = v26
				if v40 and v39.Z < 200 then
					v33.visible = true
					local v46 = v33.particle
					table.insert(v30, v46)
					local v47 = CFrame.new(v34, v_u_4.CFrame.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
					table.insert(v31, v47)
				else
					v33.visible = false
				end
				if v33.visible ~= v41 then
					if v33.visible then
						v33.particle.Parent = workspace.WeatherVisuals
					else
						v33.particle.Parent = nil
					end
				end
				if v38 then
					v33.particle:Destroy()
					v_u_24.CFrame = CFrame.new(v34)
					v_u_24.Attachment.ParticleEmitter:Emit(v_u_3:NextInteger(1, 2))
					table.remove(v_u_6, v32)
				elseif os.clock() - v33.spawnTime > 7 then
					game.Debris:AddItem(v33.particle, 0.3)
					game.TweenService:Create(v33.particle, TweenInfo.new(0.3), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_6, v32)
				end
			end
		end
		debug.profilebegin("Weather_" .. script.Name)
		workspace:BulkMoveTo(v30, v31, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("SheckleRain") then
	task.defer(v_u_23)
else
	v_u_7 = false
end
return v1