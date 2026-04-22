local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.SoundPlayer)
local v_u_4 = require(v2.Data.SoundData)
local v_u_5 = game.ReplicatedStorage.TropicalRainParticle
local v_u_6 = Random.new()
local v_u_7 = workspace.CurrentCamera
local v_u_8 = RaycastParams.new()
v_u_8.FilterDescendantsInstances = { workspace.Terrain, workspace }
v_u_8.FilterType = Enum.RaycastFilterType.Include
local v_u_9 = {}
local v_u_10 = false
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local function v_u_15(p12)
	-- upvalues: (copy) v_u_5, (copy) v_u_9
	local v13 = {
		["particle"] = v_u_5:Clone(),
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
local v_u_16 = script.Sky
local v_u_17 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_17.AddSkybox(v_u_16)
local function v_u_33()
	-- upvalues: (ref) v_u_10, (copy) v_u_17, (copy) v_u_16, (copy) v_u_11, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_15
	v_u_10 = true
	game.ReplicatedStorage.Tropical_Rain.Value = true
	local v_u_18 = script.TropicalWaterEffect:Clone()
	v_u_18.Parent = workspace.WeatherVisuals
	for _, v19 in v_u_18:GetChildren() do
		if v19.Name == "TropicalPuddle" then
			local v20 = v19.Decal.Transparency
			v19.Decal.Transparency = 1
			game.TweenService:Create(v19.Decal, TweenInfo.new(10), {
				["Transparency"] = v20
			}):Play()
		end
	end
	v_u_17.UpdateSkybox(v_u_16, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(120, 181, 174),
		["ExposureCompensation"] = 0.4,
		["Brightness"] = 0.7
	}):Play()
	game.TweenService:Create(v_u_11, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(170, 255, 204)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.95,
		["Density"] = 0.2,
		["Color"] = Color3.fromRGB(40, 70, 40)
	}):Play()
	game.TweenService:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(49, 131, 72),
		["Reflectance"] = 0.1
	}):Play()
	local v_u_21 = false
	local v_u_22 = v_u_18.tropicalWater.splashATT
	local v_u_24 = v_u_18.tropicalWater.Touched:Connect(function(p23)
		-- upvalues: (ref) v_u_21, (copy) v_u_22, (ref) v_u_3, (ref) v_u_4
		if v_u_21 ~= true then
			v_u_21 = true
			task.delay(0.2, function()
				-- upvalues: (ref) v_u_21
				v_u_21 = false
			end)
			game.Players:GetPlayerFromCharacter(p23.Parent)
			v_u_22.WorldCFrame = CFrame.new(p23.Position.X, 0.125, p23.Position.Z)
			v_u_22.Ground:Emit(1)
			v_u_3:PlaySound(v_u_4.Weather.TropicalRain.SplashATTSound, {
				["PlaybackSpeed"] = 2
			}, nil, v_u_22)
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_9, (ref) v_u_6, (ref) v_u_7, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (copy) v_u_18, (ref) v_u_11, (ref) v_u_24
		while v_u_10 do
			task.wait(0.03)
			if #v_u_9 <= 70 then
				for _ = 1, 3 do
					local v25 = v_u_6:NextNumber(10, 180)
					local v26 = 2 * v25
					local v27 = v_u_7.FieldOfView / 2
					local v28 = math.rad(v27)
					local v29 = v26 * math.tan(v28)
					local v30 = v29 * (v_u_7.ViewportSize.X / v_u_7.ViewportSize.Y)
					local v31 = v_u_7.CFrame * CFrame.new(v_u_6:NextNumber(-v30 / 2, v30 / 2), v_u_6:NextNumber(-v29 / 2, v29 / 2 + 20), -v25)
					if not workspace:Raycast(v31.Position, Vector3.new(0, 150, 0)) then
						v_u_15(v31.Position)
					end
				end
			end
		end
		v_u_17.UpdateSkybox(v_u_16, 0)
		game.ReplicatedStorage.Tropical_Rain.Value = false
		v_u_18.tropicalPARTICLE.Ground.Enabled = false
		game.TweenService:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(91, 154, 76),
			["Reflectance"] = 0
		}):Play()
		for _, v32 in v_u_18:GetChildren() do
			if v32.Name == "TropicalPuddle" then
				game.TweenService:Create(v32.Decal, TweenInfo.new(1), {
					["Transparency"] = 1
				}):Play()
			end
		end
		game.TweenService:Create(v_u_11, TweenInfo.new(3), {
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
			["Density"] = 0,
			["Color"] = Color3.fromRGB(22, 40, 70)
		}):Play()
		if v_u_24 then
			v_u_24:Disconnect()
		end
		task.delay(3, function()
			-- upvalues: (ref) v_u_18
			v_u_18:Destroy()
			game.Workspace.Terrain.Clouds.Enabled = false
		end)
	end)
end
workspace:GetAttributeChangedSignal("TropicalRain"):Connect(function()
	-- upvalues: (copy) v_u_33, (ref) v_u_10
	if workspace:GetAttribute("TropicalRain") then
		v_u_33()
	else
		v_u_10 = false
	end
end)
local v_u_34 = game.ReplicatedStorage.TRRainSplash:Clone()
v_u_34.Parent = workspace.WeatherVisuals
task.spawn(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_34, (copy) v_u_6
	while true do
		local v35 = game:GetService("RunService").RenderStepped:Wait()
		local v36 = os.clock()
		local v37 = v35 * 3
		local v38 = v35 * 5
		local v39 = math.min(1, v38)
		debug.profilebegin("Weather_" .. script.Name)
		local v40 = {}
		local v41 = {}
		for v42, v43 in v_u_9 do
			local _ = v36 - v43.spawnTime + v39
			local v44 = v43.position
			local v45 = -30 * v39
			local v46 = Vector3.new(0, v45, 0)
			local v47 = workspace:Spherecast(v44, 0.15, v46, v_u_8)
			local v48
			if v47 then
				v44 = v47.Position
				v48 = true
			else
				v43.position = v44 + v46
				v48 = nil
			end
			local v49, v50 = v_u_7:WorldToScreenPoint(v44)
			local v51 = v43.visible
			local v52 = (v_u_7.CFrame.Position - v44).Magnitude / 180
			local v53 = v52 * v52
			local v54 = 1 / math.random(60, 120)
			local v55 = v37 * v53 + 0.016666666666666666
			if v52 > 1.5 then
				v43.particle:Destroy()
				table.remove(v_u_9, v42)
			elseif v36 - v43.lastupdate + v54 > v55 then
				v43.lastupdate = v36
				if v50 and v49.Z < 200 then
					v43.visible = true
					local v56 = v43.particle
					table.insert(v40, v56)
					local v57 = CFrame.new(v44, v_u_7.CFrame.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
					table.insert(v41, v57)
				else
					v43.visible = false
				end
				if v43.visible ~= v51 then
					if v43.visible then
						v43.particle.Parent = workspace.WeatherVisuals
					else
						v43.particle.Parent = nil
					end
				end
				if v48 then
					v43.particle:Destroy()
					v_u_34.CFrame = CFrame.new(v44)
					v_u_34.Attachment.ParticleEmitter:Emit(v_u_6:NextInteger(1, 2))
					table.remove(v_u_9, v42)
				elseif os.clock() - v43.spawnTime > 7 then
					game.Debris:AddItem(v43.particle, 0.3)
					game.TweenService:Create(v43.particle, TweenInfo.new(0.3), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_9, v42)
				end
			end
		end
		workspace:BulkMoveTo(v40, v41, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("TropicalRain") then
	task.defer(v_u_33)
else
	v_u_10 = false
end
return v1