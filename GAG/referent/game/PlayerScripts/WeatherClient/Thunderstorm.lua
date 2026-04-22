local v1 = {}
local v_u_2 = game.ReplicatedStorage.RainParticle
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
local v_u_12 = script.Sky
local v_u_13 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_13.AddSkybox(v_u_12)
local v_u_14 = game.Lighting.ColorCorrection:Clone()
v_u_14.Name = script.Name
v_u_14.Parent = game.Lighting
local function v_u_22()
	-- upvalues: (ref) v_u_7, (copy) v_u_13, (copy) v_u_12, (copy) v_u_14, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_11
	v_u_7 = true
	v_u_13.UpdateSkybox(v_u_12, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(170, 237, 255),
		["ExposureCompensation"] = 0.45,
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(v_u_14, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(221, 248, 255)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.925,
		["Density"] = 0.183
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_3, (ref) v_u_4, (ref) v_u_11, (ref) v_u_13, (ref) v_u_12, (ref) v_u_14
		while v_u_7 do
			task.wait(0)
			if #v_u_6 <= 77 then
				for _ = 1, 3 do
					local v15 = v_u_3:NextNumber(10, 180)
					local v16 = 2 * v15
					local v17 = v_u_4.FieldOfView / 2
					local v18 = math.rad(v17)
					local v19 = v16 * math.tan(v18)
					local v20 = v19 * (v_u_4.ViewportSize.X / v_u_4.ViewportSize.Y)
					local v21 = v_u_4.CFrame * CFrame.new(v_u_3:NextNumber(-v20 / 2, v20 / 2), v_u_3:NextNumber(-v19 / 2, v19 / 2 + 20), -v15)
					if not workspace:Raycast(v21.Position, Vector3.new(0, 150, 0)) then
						v_u_11(v21.Position)
					end
				end
			end
		end
		v_u_13.UpdateSkybox(v_u_12, 0)
		game.TweenService:Create(v_u_14, TweenInfo.new(3), {
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
workspace:GetAttributeChangedSignal("Thunderstorm"):Connect(function()
	-- upvalues: (copy) v_u_22, (ref) v_u_7
	if workspace:GetAttribute("Thunderstorm") then
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
		local v24 = game:GetService("RunService").RenderStepped:Wait()
		local v25 = os.clock()
		local v26 = v24 * 1.5
		local v27 = v24 * 5
		local v28 = math.min(1, v27)
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
		debug.profilebegin("Weather_" .. script.Name)
		workspace:BulkMoveTo(v29, v30, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("Thunderstorm") then
	task.defer(v_u_22)
else
	v_u_7 = false
end
local v47 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_48 = require(game.ReplicatedStorage.Code.LightningBolt)
local v_u_50 = v47.new(Enum.RenderPriority.Camera.Value, function(p49)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p49
end)
local function v_u_59(p51, p52, p53, p54)
	-- upvalues: (copy) v_u_48, (copy) v_u_50, (copy) v_u_14
	local v55 = v_u_48.new(p51, p52, 30)
	v55.Thickness = 1.5
	v55.Color = p53 or Color3.fromRGB(139, 205, 255)
	v55.Frequency = 15
	v55.MinThicknessMultiplier = 0.1
	v55.MaxThicknessMultiplier = 1
	task.wait(0.65)
	v_u_50:Shake(v_u_50.Presets.Explosion)
	local v56 = game.ReplicatedStorage.LightningHit:Clone()
	v56.CFrame = CFrame.new(p52.WorldPosition)
	local v57 = workspace:Raycast(v56.CFrame.p, Vector3.new(-0, -50, -0))
	if v57 and v57.Position then
		v56.CFrame = CFrame.new(v57.Position)
	end
	v56.Parent = workspace.WeatherVisuals
	if not p54 then
		v_u_14.Brightness = 0.3
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_14
			v_u_14.Brightness = 0.1
		end)
	end
	for _, v58 in pairs(v56:GetDescendants()) do
		if v58:IsA("ParticleEmitter") then
			v58:Emit(v58:GetAttribute("EmitCount"))
		elseif v58:IsA("Sound") then
			v58:Play()
		elseif v58:IsA("PointLight") then
			game.TweenService:Create(v58, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	v55:DestroyDissipate(0.7)
	game.Debris:AddItem(v56, 3)
end
game:GetService("ReplicatedStorage"):WaitForChild("GameEvents").LightningBolt.OnClientEvent:Connect(function(p60, p61, p62)
	-- upvalues: (copy) v_u_59
	local v_u_63 = Instance.new("Attachment")
	local v_u_64 = Instance.new("Attachment")
	v_u_63.Parent = workspace.Terrain
	v_u_64.Parent = workspace.Terrain
	v_u_64.WorldPosition = p60 + Vector3.new(0, 200, 0)
	v_u_63.WorldPosition = p60
	v_u_59(v_u_64, v_u_63, p61, p62)
	task.delay(5, function()
		-- upvalues: (copy) v_u_64, (copy) v_u_63
		v_u_64:Destroy()
		v_u_63:Destroy()
	end)
end)
return v1