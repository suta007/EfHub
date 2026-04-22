local v1 = {}
local v_u_2 = game.ReplicatedStorage.CookieCrumbParticle
local v_u_3 = game.ReplicatedStorage.MilkDropParticle
local v_u_4 = Random.new()
local v_u_5 = workspace.CurrentCamera
local v_u_6 = RaycastParams.new()
v_u_6.FilterDescendantsInstances = { workspace.Terrain, workspace }
v_u_6.FilterType = Enum.RaycastFilterType.Include
local v_u_7 = {}
local v_u_8 = false
local v_u_9 = game.Lighting.ColorCorrection:Clone()
v_u_9.Name = script.Name
v_u_9.Parent = game.Lighting
local function v_u_27(p10)
	-- upvalues: (copy) v_u_4
	local v_u_11 = p10.particle
	local v12 = p10.position
	local v13
	if math.random() < 0.5 then
		v13 = v_u_4:NextNumber(-3, -0.5)
	else
		v13 = v_u_4:NextNumber(0.5, 3)
	end
	local v14 = math.random(175, 275) / 100
	local v15 = v12 + Vector3.new(v13, v14, 0)
	local v16 = v12 + Vector3.new(v13, 0, 0)
	local v17 = v13 * 0.3
	local v18 = v_u_11.Size.X / 2
	local v19 = game.TweenService:Create(v_u_11, TweenInfo.new(0.15, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
		["Position"] = v15
	})
	local v20 = game.TweenService
	local v21 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local v22 = {}
	local v23 = v16.X + v17
	local v24 = v16.Z
	v22.Position = Vector3.new(v23, v18, v24)
	local v_u_25 = v20:Create(v_u_11, v21, v22)
	v19:Play()
	v19.Completed:Connect(function()
		-- upvalues: (copy) v_u_25, (copy) v_u_11
		v_u_25:Play()
		v_u_25.Completed:Connect(function()
			-- upvalues: (ref) v_u_11
			local v26 = game.TweenService:Create(v_u_11, TweenInfo.new(0.6), {
				["Transparency"] = 1
			})
			v26:Play()
			v26.Completed:Connect(function()
				-- upvalues: (ref) v_u_11
				v_u_11:Destroy()
			end)
		end)
	end)
end
local function v_u_37(p28)
	local v_u_29 = p28.particle
	local v30 = v_u_29.Size
	local _ = p28.particle.Position
	local v31 = v30.X * 1.5
	local v32 = v30.Y
	local v33 = v30.Z * 0.15
	local v34 = {
		["Size"] = Vector3.new(v31, v32, v33)
	}
	local v35 = game.TweenService:Create(v_u_29, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v34)
	v35:Play()
	v35.Completed:Connect(function()
		-- upvalues: (copy) v_u_29
		local v36 = game.TweenService:Create(v_u_29, TweenInfo.new(0.2), {
			["Transparency"] = 1
		})
		v36:Play()
		v36.Completed:Connect(function()
			-- upvalues: (ref) v_u_29
			v_u_29:Destroy()
		end)
	end)
end
local function v_u_52(p38)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
	local v39 = math.random(1, 2) == 1
	local v40 = v39 and 15 or 20
	local v41 = (v39 and v_u_2 or v_u_3):Clone()
	if v39 then
		local v42 = v41.SurfaceAppearance
		local v43, v44, v45 = v41.SurfaceAppearance.Color:ToHSV()
		local v46 = 0.1 or 0.05
		local v47 = v45 + v_u_4:NextNumber(-v46, v46)
		local v48 = math.clamp(v47, 0.01, 0.99)
		v42.Color = Color3.fromHSV(v43, v44, v48)
		local v49 = v_u_4:NextNumber(1, 2.5)
		v41.Size = Vector3.new(v49, 0, v49)
	end
	local v50 = {
		["particle"] = v41,
		["position"] = p38,
		["spawnTime"] = os.clock(),
		["travelTime"] = v40,
		["visible"] = false,
		["lastupdate"] = 0
	}
	game.TweenService:Create(v50.particle, TweenInfo.new(0.7), {
		["Transparency"] = 0.2
	}):Play()
	local v51 = v_u_7
	table.insert(v51, v50)
end
local function v_u_61(p53, p54, p55)
	-- upvalues: (copy) v_u_6
	local _ = p54 - p53.spawnTime + p55
	local v56 = p53.position
	local v57 = -p53.travelTime * p55
	local v58 = Vector3.new(0, v57, 0)
	local v59 = workspace:Spherecast(v56, 0.15, v58, v_u_6)
	if v59 then
		local v60 = p53.particle.Size.X / 2
		return v59.Position + Vector3.new(0, v60, 0), true
	else
		p53.position = v56 + v58
		return v56
	end
end
local v_u_62 = script.Sky
local v_u_63 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_63.AddSkybox(v_u_62)
local function v_u_71()
	-- upvalues: (ref) v_u_8, (copy) v_u_63, (copy) v_u_62, (copy) v_u_9, (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_52
	v_u_8 = true
	v_u_63.UpdateSkybox(v_u_62, 2)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.3,
		["Glare"] = 0.8,
		["Haze"] = 1.25,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(255, 248, 251),
		["Decay"] = Color3.fromRGB(255, 234, 248)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(255, 247, 243),
		["ExposureCompensation"] = 0.2,
		["Brightness"] = 1.5
	}):Play()
	game.TweenService:Create(v_u_9, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(215, 240, 255)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.905,
		["Density"] = 0.083
	}):Play()
	game.TweenService:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(166, 161, 150),
		["Reflectance"] = 0.1
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_7, (ref) v_u_4, (ref) v_u_5, (ref) v_u_52, (ref) v_u_63, (ref) v_u_62, (ref) v_u_9
		while v_u_8 do
			task.wait(0.05)
			if #v_u_7 <= 80 then
				for _ = 1, 3 do
					local v64 = v_u_4:NextNumber(10, 180)
					local v65 = 2 * v64
					local v66 = v_u_5.FieldOfView / 2
					local v67 = math.rad(v66)
					local v68 = v65 * math.tan(v67)
					local v69 = v68 * (v_u_5.ViewportSize.X / v_u_5.ViewportSize.Y)
					local v70 = v_u_5.CFrame * CFrame.new(v_u_4:NextNumber(-v69 / 2, v69 / 2), v_u_4:NextNumber(-v68 / 2, v68 / 2 + 20), -v64)
					if not workspace:Raycast(v70.Position, Vector3.new(0, 150, 0)) then
						v_u_52(v70.Position)
					end
				end
			end
		end
		v_u_63.UpdateSkybox(v_u_62, 0)
		game.TweenService:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(255, 255, 255),
			["Reflectance"] = 0
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Haze"] = 0,
			["Glare"] = 0,
			["Offset"] = 0
		}):Play()
		game.TweenService:Create(v_u_9, TweenInfo.new(3), {
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
workspace:GetAttributeChangedSignal("MilkAndCookiesEvent"):Connect(function()
	-- upvalues: (copy) v_u_71, (ref) v_u_8
	if workspace:GetAttribute("MilkAndCookiesEvent") then
		v_u_71()
	else
		v_u_8 = false
	end
end)
local v_u_72 = game.ReplicatedStorage.TRRainSplash:Clone()
v_u_72.Parent = workspace.WeatherVisuals
local v_u_73 = script.tropicalWater.splashATT:Clone()
v_u_73.Parent = workspace.WeatherVisuals
task.spawn(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_61, (copy) v_u_5, (copy) v_u_27, (copy) v_u_37, (copy) v_u_72, (copy) v_u_4, (copy) v_u_73
	while true do
		repeat
			local v74 = game:GetService("RunService").RenderStepped:Wait()
		until #v_u_7 > 0
		local v75 = os.clock()
		local v76 = v74 * 3
		local v77 = v74 * 5
		local v78 = math.min(1, v77)
		debug.profilebegin("Weather_" .. script.Name)
		local v79 = {}
		local v80 = {}
		for v81, v82 in v_u_7 do
			local v83, v84 = v_u_61(v82, v75, v78)
			local v85, v86 = v_u_5:WorldToScreenPoint(v83)
			local v87 = v82.visible
			local v88 = (v_u_5.CFrame.Position - v83).Magnitude / 120
			local v89 = v88 * v88
			local v90 = 1 / math.random(60, 120)
			local v91 = v76 * v89 + 0.016666666666666666
			if v88 > 1.5 then
				v82.particle:Destroy()
				table.remove(v_u_7, v81)
			elseif v75 - v82.lastupdate + v90 > v91 then
				v82.lastupdate = v75
				if v86 and v85.Z < 200 then
					v82.visible = true
					local v92 = v82.particle
					table.insert(v79, v92)
					local v93 = CFrame.new(v83, v_u_5.CFrame.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
					table.insert(v80, v93)
				else
					v82.visible = false
				end
				if v82.visible ~= v87 then
					if v82.visible and v82.particle then
						v82.particle.Parent = workspace.WeatherVisuals
					else
						v82.particle.Parent = nil
					end
				end
				if v84 then
					if v82.particle.Name == "CookieCrumbParticle" then
						v_u_27(v82)
					elseif v82.particle.Name == "MilkDropParticle" then
						v_u_37(v82)
						v_u_72.CFrame = CFrame.new(v83)
						v_u_72.Attachment.ParticleEmitter:Emit(v_u_4:NextInteger(1, 2))
						v_u_73.CFrame = CFrame.new(v83)
						v_u_73.Ground:Emit(1)
					end
					table.remove(v_u_7, v81)
				elseif os.clock() - v82.spawnTime > 7 then
					game.Debris:AddItem(v82.particle, 0.3)
					game.TweenService:Create(v82.particle, TweenInfo.new(0.3), {
						["Transparency"] = 1
					}):Play()
					table.remove(v_u_7, v81)
				end
			end
		end
		workspace:BulkMoveTo(v79, v80, Enum.BulkMoveMode.FireCFrameChanged)
		debug.profileend()
	end
end)
if workspace:GetAttribute("MilkAndCookiesEvent") then
	task.defer(v_u_71)
else
	v_u_8 = false
end
return v1