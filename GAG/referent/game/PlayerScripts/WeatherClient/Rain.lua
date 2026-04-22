local v1 = {}
local v_u_2 = game.ReplicatedStorage.RainParticle
local v_u_3 = Random.new()
local v_u_4 = workspace.CurrentCamera
local v_u_5 = RaycastParams.new()
v_u_5.FilterDescendantsInstances = { workspace.Terrain, workspace }
v_u_5.FilterType = Enum.RaycastFilterType.Include
local v_u_6 = {}
local v_u_7 = false
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
local function v_u_12(p9)
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	local v10 = {
		["particle"] = v_u_2:Clone(),
		["position"] = p9,
		["spawnTime"] = os.clock(),
		["visible"] = false,
		["lastupdate"] = 0
	}
	game.TweenService:Create(v10.particle, TweenInfo.new(0.7), {
		["Transparency"] = 0.2
	}):Play()
	local v11 = v_u_6
	table.insert(v11, v10)
end
local v_u_13 = script.Sky
local v_u_14 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_14.AddSkybox(v_u_13)
local function v_u_22()
	-- upvalues: (ref) v_u_7, (copy) v_u_14, (copy) v_u_13, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_12
	v_u_7 = true
	v_u_14.UpdateSkybox(v_u_13, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(196, 240, 255),
		["ExposureCompensation"] = 0.4,
		["Brightness"] = 0.7
	}):Play()
	game.TweenService:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(215, 240, 255)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.905,
		["Density"] = 0.083
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_3, (ref) v_u_4, (ref) v_u_12, (ref) v_u_14, (ref) v_u_13, (ref) v_u_8
		while v_u_7 do
			task.wait(0.05)
			if #v_u_6 <= 50 then
				for _ = 1, 3 do
					local v15 = v_u_3:NextNumber(10, 180)
					local v16 = 2 * v15
					local v17 = v_u_4.FieldOfView / 2
					local v18 = math.rad(v17)
					local v19 = v16 * math.tan(v18)
					local v20 = v19 * (v_u_4.ViewportSize.X / v_u_4.ViewportSize.Y)
					local v21 = v_u_4.CFrame * CFrame.new(v_u_3:NextNumber(-v20 / 2, v20 / 2), v_u_3:NextNumber(-v19 / 2, v19 / 2 + 20), -v15)
					if not workspace:Raycast(v21.Position, Vector3.new(0, 150, 0)) then
						v_u_12(v21.Position)
					end
				end
			end
		end
		v_u_14.UpdateSkybox(v_u_13, 0)
		game.TweenService:Create(v_u_8, TweenInfo.new(3), {
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
workspace:GetAttributeChangedSignal("RainEvent"):Connect(function()
	-- upvalues: (copy) v_u_22, (ref) v_u_7
	if workspace:GetAttribute("RainEvent") then
		v_u_22()
	else
		v_u_7 = false
	end
end)
local v_u_23 = game.ReplicatedStorage.RainSplash:Clone()
v_u_23.Parent = workspace.WeatherVisuals
task.spawn(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_23, (copy) v_u_3
	while true do
		repeat
			local v24 = game:GetService("RunService").RenderStepped:Wait()
		until #v_u_6 > 0
		local v25 = os.clock()
		local v26 = v24 * 3
		local v27 = v24 * 5
		local v28 = math.min(1, v27)
		debug.profilebegin("Weather_" .. script.Name)
		local v29 = {}
		local v30 = {}
		for v31, v32 in v_u_6 do
			local _ = v25 - v32.spawnTime + v28
			local v33 = v32.position
			local v34 = -20 * v28
			local v35 = Vector3.new(0, v34, 0)
			local v36 = workspace:Spherecast(v33, 0.15, v35, v_u_5)
			local v37
			if v36 then
				v33 = v36.Position
				v37 = true
			else
				v32.position = v33 + v35
				v37 = nil
			end
			local v38, v39 = v_u_4:WorldToScreenPoint(v33)
			local v40 = v32.visible
			local v41 = (v_u_4.CFrame.Position - v33).Magnitude / 120
			local v42 = v41 * v41
			local v43 = 1 / math.random(60, 120)
			local v44 = v26 * v42 + 0.016666666666666666
			if v41 > 1.5 then
				v32.particle:Destroy()
				table.remove(v_u_6, v31)
			elseif v25 - v32.lastupdate + v43 > v44 then
				v32.lastupdate = v25
				if v39 and v38.Z < 200 then
					v32.visible = true
					local v45 = v32.particle
					table.insert(v29, v45)
					local v46 = CFrame.new(v33, v_u_4.CFrame.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
					table.insert(v30, v46)
				else
					v32.visible = false
				end
				if v32.visible ~= v40 then
					if v32.visible then
						v32.particle.Parent = workspace.WeatherVisuals
					else
						v32.particle.Parent = nil
					end
				end
				if v37 then
					v32.particle:Destroy()
					v_u_23.CFrame = CFrame.new(v33)
					v_u_23.Attachment.ParticleEmitter:Emit(v_u_3:NextInteger(1, 2))
					table.remove(v_u_6, v31)
				elseif os.clock() - v32.spawnTime > 7 then
					game.Debris:AddItem(v32.particle, 0.3)
					game.TweenService:Create(v32.particle, TweenInfo.new(0.3), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_6, v31)
				end
			end
		end
		workspace:BulkMoveTo(v29, v30, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("RainEvent") then
	task.defer(v_u_22)
else
	v_u_7 = false
end
return v1