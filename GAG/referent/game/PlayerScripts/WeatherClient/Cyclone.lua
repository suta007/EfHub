local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.SoundPlayer)
local v_u_3 = require(v1.Data.SoundData)
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_5 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v7 = {}
local v_u_8 = false
local v_u_10 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p9)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p9
end)
v_u_10:Start()
local v_u_11 = script.Sky
local v_u_12 = Random.new()
local v_u_13 = {}
local v_u_14 = (game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC") == "Mobile" and 0.025 or 0.015
local v_u_15 = game.ReplicatedStorage.Assets.CycloneParticle
local v_u_16 = workspace.BasePlate.TopBaseplate
v_u_4.AddSkybox(v_u_11)
local v_u_17 = game.Lighting.ColorCorrection:Clone()
v_u_17.Name = script.Name
v_u_17.Parent = game.Lighting
local v_u_18 = { Color3.new(0.356863, 0.603922, 0.298039), Color3.new(0.423529, 0.345098, 0.294118), Color3.new(0.486275, 0.360784, 0.27451) }
local function v_u_83()
	-- upvalues: (ref) v_u_8, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_11, (copy) v_u_6, (copy) v_u_10, (copy) v_u_5, (copy) v_u_17, (copy) v_u_15, (copy) v_u_12, (copy) v_u_18, (copy) v_u_13, (copy) v_u_14, (copy) v_u_16
	v_u_8 = true
	local v19 = {
		["FadeOutDuration"] = 1,
		["Volume"] = 3,
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse
	}
	local v20 = v_u_2:PlaySound(v_u_3.Weather.Cyclone.Alert, v19, nil, workspace)
	v_u_4.UpdateSkybox(v_u_11, 2)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.288,
		["Offset"] = 0.55,
		["Color"] = Color3.fromRGB(75, 112, 152),
		["Decay"] = Color3.fromRGB(15, 71, 162),
		["Glare"] = 1,
		["Haze"] = 1
	}):Play()
	game.Lighting.Ambient = Color3.fromRGB(123, 157, 202)
	game.Debris:AddItem(v20, 4)
	v_u_6.Start("Cyclone", {
		["priority"] = 10
	})
	v_u_10:Shake(v_u_5.Presets.Bump)
	game.TweenService:Create(v_u_17, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(174, 231, 255),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	game.TweenService:Create(v_u_17, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Brightness"] = 0
	}):Play()
	task.wait(1.5)
	game.TweenService:Create(v_u_17, TweenInfo.new(3), {
		["Brightness"] = 0.15,
		["Contrast"] = 0.15,
		["Saturation"] = 0.2,
		["TintColor"] = Color3.fromRGB(185, 228, 255)
	}):Play()
	v_u_10:ShakeSustain(v_u_5.Presets.Earthquake)
	local v21 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 0.1
	}
	local v22 = v_u_2:PlaySound(v_u_3.Weather.Earthquake.EarthquakeStart, v21, nil, nil)
	game.Debris:AddItem(v22, 5)
	task.wait(1)
	local v23 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["FadeInDuration"] = 1,
		["Looped"] = true,
		["Volume"] = 0.5
	}
	local v24 = v_u_2:PlaySound(v_u_3.Weather.Earthquake.EarthquakeLoop, v23, nil, nil)
	local v25 = v_u_2:PlaySound(v_u_3.Weather.Cyclone.Ambience, v23, nil, nil)
	local v_u_26 = game.ReplicatedStorage.Assets.Cyclone:Clone()
	v_u_26.Parent = workspace
	for _, v27 in v_u_26.Model.Core:GetDescendants() do
		if v27:IsA("ParticleEmitter") then
			v27.Enabled = true
		end
	end
	v_u_26.Model:ScaleTo(0.5)
	local function v_u_53(p28)
		-- upvalues: (ref) v_u_15, (ref) v_u_12, (ref) v_u_18, (copy) v_u_26, (ref) v_u_13
		local v29 = v_u_15.ParticleA:Clone()
		local v30 = v29.Size
		local v31 = v_u_12:NextNumber(0.25, 1.75)
		local v32 = v_u_12
		v29.Size = v30 * Vector3.new(v31, 1, v32:NextNumber(0.25, 1.75))
		local v33 = v_u_18[math.random(1, #v_u_18)]
		local v34 = v29.SurfaceAppearance
		local v35, v36, v37 = v33:ToHSV()
		local v38 = 0.1 or 0.05
		local v39 = v35 + v_u_12:NextNumber(-v38, v38)
		local v40 = math.clamp(v39, 0.01, 0.99)
		v34.Color = Color3.fromHSV(v40, v36, v37)
		if v_u_26 and v_u_26.Parent then
			local v41 = v_u_26.Floor
			local v42 = math.random() * v41.Size.X - v41.Size.X / 2
			local v43 = math.random() * v41.Size.Z - v41.Size.Z / 2
			local v44 = Vector3.new(v42, -5, v43)
			local v45 = {
				["Particle"] = v29,
				["lifetime"] = p28,
				["SpinSpeed"] = 6.283185307179586,
				["RiseSpeed"] = math.random(10, 20),
				["runTime"] = 0
			}
			local v46 = CFrame.Angles
			local v47 = math.random(0, 360)
			local v48 = math.rad(v47)
			local v49 = math.random(0, 360)
			local v50 = math.rad(v49)
			local v51 = math.random(0, 360)
			v45.BasicAngle = v46(v48, v50, (math.rad(v51)))
			v45.StartCFrame = v44
			v45.OrbitRadius = math.random(80, 120)
			v45.OrbitAngle = math.random() * 3.141592653589793 * 2
			v29.CFrame = CFrame.new(v45.StartCFrame)
			local v52 = v_u_13
			table.insert(v52, v45)
			v29.Parent = workspace.Visuals
		end
	end
	local v_u_54 = 0
	local v_u_55 = 0
	task.spawn(function()
		-- upvalues: (ref) v_u_14, (copy) v_u_26, (ref) v_u_54, (ref) v_u_55, (copy) v_u_53, (ref) v_u_13
		while true do
			local v56 = task.wait(v_u_14)
			if not v_u_26 then
				return
			end
			v_u_54 = v_u_54 + v56
			v_u_55 = v_u_55 + v56
			if v_u_55 >= 0.15 then
				v_u_55 = 0
				v_u_53(10)
			end
			for v57, v58 in pairs(v_u_13) do
				if v58.runTime >= v58.lifetime then
					v_u_13[v57].Particle:Destroy()
					v_u_13[v57] = nil
				else
					v58.runTime = v58.runTime + v56
					local v59 = v58.runTime / v58.lifetime
					if not (v_u_26 and v_u_26:IsDescendantOf(workspace)) then
						break
					end
					local v60 = v_u_26.Model.Core.CFrame.Position
					local v61 = v59 * 1.6
					local v62 = math.clamp(v61, 0, 1)
					local v63 = v58.StartCFrame:Lerp(v60, v62)
					local v64 = (v59 - 0) / 1
					local v65 = math.clamp(v64, 0, 1)
					local v66 = v65 * v65
					v58.OrbitAngle = v58.OrbitAngle + v58.SpinSpeed * v66 * v56
					local v67 = v58.OrbitAngle
					local v68 = math.cos(v67) * v58.OrbitRadius * v65
					local v69 = v59 * v58.RiseSpeed
					local v70 = v58.OrbitAngle
					local v71 = math.sin(v70) * v58.OrbitRadius * v65
					local v72 = v63:Lerp(v60 + Vector3.new(v68, v69, v71), v65)
					v58.Particle.CFrame = CFrame.new(v72) * v58.BasicAngle
				end
			end
		end
	end)
	local v73 = script.Wind.windPart:Clone()
	v73.Parent = workspace
	v73.Size = Vector3.new(150, 1.5, 150)
	while v_u_8 == true and v_u_26 do
		local v74 = v_u_16:GetPivot()
		local v75 = v74.X + math.random(-200, 200)
		local v76 = v_u_26.Model.PrimaryPart.CFrame.Y
		local v77 = v74.Z + math.random(-200, 200)
		local v78 = Vector3.new(v75, v76, v77)
		local v79 = math.random(5, 10)
		local v80 = TweenInfo.new(v79, Enum.EasingStyle.Linear)
		local v81 = game.TweenService:Create(v_u_26.Model.PrimaryPart, v80, {
			["CFrame"] = CFrame.new(v78)
		})
		v81:Play()
		game.TweenService:Create(v73, v80, {
			["CFrame"] = CFrame.new(v78 * Vector3.new(1, 0, 1))
		}):Play()
		v81.Completed:Wait()
	end
	for v82, _ in v_u_13 do
		v_u_13[v82].Particle:Destroy()
		v_u_13[v82] = nil
	end
	local _ = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse
	}
	v_u_4.UpdateSkybox(v_u_11, 0)
	v_u_10:StopSustained(1)
	v_u_10:Shake(v_u_5.Presets.Bump)
	v_u_26:Destroy()
	v73:Destroy()
	v24:Destroy()
	v25:Destroy()
	game.TweenService:Create(v_u_17, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(255, 233, 197),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	game.TweenService:Create(v_u_17, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Brightness"] = 0
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	game.Lighting.Ambient = Color3.fromRGB(138, 138, 138)
	game.TweenService:Create(v_u_17, TweenInfo.new(1), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_6.Stop("Cyclone")
end
workspace:GetAttributeChangedSignal("Cyclone"):Connect(function()
	-- upvalues: (copy) v_u_83, (ref) v_u_8
	if workspace:GetAttribute("Cyclone") then
		v_u_83()
	else
		v_u_8 = false
	end
end)
if workspace:GetAttribute("Cyclone") then
	task.defer(v_u_83)
else
	local _ = false
end
return v7