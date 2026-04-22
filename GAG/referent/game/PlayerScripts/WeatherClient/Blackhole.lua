local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Code.CameraShaker)
require(game.ReplicatedStorage.Code.LightningBolt)
local v_u_3 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v_u_7 = v_u_2.new(Enum.RenderPriority.Camera.Value, function(p6)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p6
end)
v_u_7:Start()
local v_u_8 = script.Sky
local v_u_9 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_9.AddSkybox(v_u_8)
local v_u_10 = game.Lighting.ColorCorrection:Clone()
v_u_10.Name = script.Name
v_u_10.Parent = game.Lighting
local v_u_11 = game.ReplicatedStorage.Assets.BlackHoleOrbs
local v_u_12 = {}
local v_u_13 = (game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC") == "Mobile" and 0.025 or 0.015
local v14 = game:GetService("ReplicatedStorage")
local v_u_15 = require(v14.Modules.SoundPlayer)
local v_u_16 = require(v14.Data.SoundData)
local function v_u_54()
	-- upvalues: (ref) v_u_5, (copy) v_u_15, (copy) v_u_16, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
	v_u_5 = true
	local v17 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse
	}
	local v18 = v_u_15:PlaySound(v_u_16.Weather.Blackhole.Snap, v17, nil, workspace)
	v_u_9.UpdateSkybox(v_u_8, 2)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.288,
		["Offset"] = 0.55,
		["Color"] = Color3.fromRGB(149, 0, 255),
		["Decay"] = Color3.fromRGB(86, 80, 255),
		["Glare"] = 1,
		["Haze"] = 1
	}):Play()
	game.Lighting.Ambient = Color3.fromRGB(88, 81, 159)
	game.Debris:AddItem(v18, 4)
	v_u_3.Start("Blackhole", {
		["priority"] = 10
	})
	v_u_7:Shake(v_u_2.Presets.Bump)
	game.TweenService:Create(v_u_10, TweenInfo.new(0.3), {
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
	game.TweenService:Create(v_u_10, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Brightness"] = 0
	}):Play()
	task.wait(1.5)
	game.TweenService:Create(v_u_10, TweenInfo.new(3), {
		["Brightness"] = 0.15,
		["Contrast"] = 0.15,
		["Saturation"] = 0.2,
		["TintColor"] = Color3.fromRGB(196, 185, 255)
	}):Play()
	v_u_7:ShakeSustain(v_u_2.Presets.Earthquake)
	local v19 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 0.1
	}
	local v20 = v_u_15:PlaySound(v_u_16.Weather.Earthquake.EarthquakeStart, v19, nil, nil)
	game.Debris:AddItem(v20, 5)
	task.wait(1)
	local v21 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["FadeInDuration"] = 1,
		["Looped"] = true,
		["Volume"] = 0.5
	}
	local v22 = v_u_15:PlaySound(v_u_16.Weather.Earthquake.EarthquakeLoop, v21, nil, nil)
	local v_u_23 = game.ReplicatedStorage.Assets.Blackhole:Clone()
	v_u_23.Parent = workspace
	if game.Workspace:GetAttribute("Brainrot_Stampede") then
		v_u_23:PivotTo(v_u_23:GetPivot() * CFrame.new(0, -50, 0))
	end
	local v24 = 0
	for _, v25 in v_u_23.Floor:GetDescendants() do
		v25.Enabled = true
	end
	game.TweenService:Create(workspace, TweenInfo.new(3), {
		["Gravity"] = 20
	}):Play()
	while v24 < 3 do
		v24 = v24 + game:GetService("RunService").Heartbeat:Wait()
		v_u_23.Model:ScaleTo(v24 / 3 * 2)
		for _, v26 in v_u_23.Floor:GetDescendants() do
			v26.TimeScale = v24 / 3
		end
	end
	v_u_23.Model:ScaleTo(2)
	local function v_u_37(p27)
		-- upvalues: (ref) v_u_11, (copy) v_u_23, (ref) v_u_12
		local v28 = v_u_11:GetChildren()[math.random(1, 2)]:Clone()
		if v_u_23 then
			local v29 = {
				["Particle"] = v28,
				["lifetime"] = p27,
				["runTime"] = 0,
				["Target"] = v_u_23.Model.Core.CFrame
			}
			local v30 = CFrame.Angles
			local v31 = math.random(0, 360)
			local v32 = math.rad(v31)
			local v33 = math.random(0, 360)
			local v34 = math.rad(v33)
			local v35 = math.random(0, 360)
			v29.BasicAngle = v30(v32, v34, (math.rad(v35)))
			v29.StartCFrame = v_u_23.Model.Core.CFrame * CFrame.new(0, 0, math.random(42, 100) + v_u_23.Model.Core.Size.Z / 2)
			v28.CFrame = v29.StartCFrame
			local v36 = v_u_12
			table.insert(v36, v29)
			v28.Parent = workspace.Visuals
		end
	end
	local v_u_38 = 0
	local v_u_39 = 0
	task.spawn(function()
		-- upvalues: (ref) v_u_13, (copy) v_u_23, (ref) v_u_38, (ref) v_u_39, (copy) v_u_37, (ref) v_u_12
		while true do
			local v40 = task.wait(v_u_13)
			if not v_u_23 then
				return
			end
			v_u_38 = v_u_38 + v40
			v_u_39 = v_u_39 + v40
			if v_u_39 >= 0.4 then
				v_u_39 = 0
				v_u_37(5)
			end
			for v41, v42 in pairs(v_u_12) do
				if v42.runTime >= v42.lifetime then
					v_u_12[v41].Particle:Destroy()
					v_u_12[v41] = nil
				else
					v42.runTime = v42.runTime + v40
					local _ = 1 - v42.runTime / v42.lifetime
					local v43 = v42.runTime / v42.lifetime
					if not (v_u_23 and v_u_23:IsDescendantOf(workspace)) then
						break
					end
					local v44 = v42.Particle
					local v45 = v_u_23.Model.Core.CFrame * v42.BasicAngle
					local v46 = CFrame.Angles
					local v47 = v43 * 360
					local v48 = math.rad(v47)
					local v49 = v43 * 360
					local v50 = math.rad(v49)
					local v51 = v43 * 360
					v44.CFrame = v45 * v46(v48, v50, math.rad(v51), 0) * v42.StartCFrame:ToObjectSpace(v42.Target):Lerp(CFrame.new(0, 0, 0), v43)
				end
			end
		end
	end)
	repeat
		task.wait()
	until v_u_5 == false
	for v52, _ in v_u_12 do
		v_u_12[v52].Particle:Destroy()
		v_u_12[v52] = nil
	end
	local v53 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse
	}
	v_u_15:PlaySound(v_u_16.Weather.Blackhole.Snap, v53, nil, workspace)
	v_u_9.UpdateSkybox(v_u_8, 0)
	v_u_7:StopSustained(1)
	v_u_7:Shake(v_u_2.Presets.Bump)
	v_u_23:Destroy()
	v22:Destroy()
	game.TweenService:Create(v_u_10, TweenInfo.new(0.3), {
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
	game.TweenService:Create(v_u_10, TweenInfo.new(2), {
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
	game.TweenService:Create(v_u_10, TweenInfo.new(1), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3.Stop("Blackhole")
end
workspace:GetAttributeChangedSignal("Blackhole"):Connect(function()
	-- upvalues: (copy) v_u_54, (ref) v_u_5
	if workspace:GetAttribute("Blackhole") then
		v_u_54()
	else
		v_u_5 = false
		game.TweenService:Create(workspace, TweenInfo.new(3), {
			["Gravity"] = 192.6
		}):Play()
	end
end)
if workspace:GetAttribute("Blackhole") then
	task.defer(v_u_54)
else
	local _ = false
end
game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
return v1