local v1 = {}
local v_u_2 = false
local v_u_3 = game.Lighting.ColorCorrection:Clone()
v_u_3.Name = script.Name
v_u_3.Parent = game.Lighting
local v_u_4 = script.Sky
require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_5.AddSkybox(v_u_4)
require(game.ReplicatedStorage:WaitForChild("Cutscene_Module"))
require(game.ReplicatedStorage.Field_Of_View_Module)
game:GetService("RunService")
local v_u_6 = game:GetService("TweenService")
require(game.ReplicatedStorage.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p7)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p7
end)
local v_u_8 = require(game.ReplicatedStorage.Modules.Trove)
require(game.ReplicatedStorage.Modules.Spring)
local function v_u_64()
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	v_u_2 = true
	local v_u_9 = v_u_8.new()
	local v10 = script.Particles:Clone()
	v_u_6:Create(game.Lighting, TweenInfo.new(4), {
		["Ambient"] = Color3.fromRGB(70, 70, 70),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 102, 0),
		["ColorShift_Top"] = Color3.fromRGB(255, 230, 194),
		["EnvironmentDiffuseScale"] = 0.25,
		["EnvironmentSpecularScale"] = 0.25,
		["ExposureCompensation"] = 0.5,
		["OutdoorAmbient"] = Color3.fromRGB(172, 82, 82),
		["ShadowSoftness"] = 0.75
	}):Play()
	v_u_6:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(17, 255, 0),
		["Decay"] = Color3.fromRGB(255, 255, 255),
		["Glare"] = 0.32,
		["Haze"] = 2.07,
		["Density"] = 0.1
	}):Play()
	v_u_6:Create(v_u_3, TweenInfo.new(4), {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.15,
		["TintColor"] = Color3.fromRGB(243, 255, 234)
	}):Play()
	v_u_6:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(4), {
		["Color"] = Color3.fromRGB(96, 138, 51)
	}):Play()
	v10.Parent = game.Workspace.WeatherVisuals
	v_u_5.UpdateSkybox(v_u_4, 2)
	local v_u_11 = script:WaitForChild("Asset_Start")
	local v_u_12 = script:WaitForChild("Asset_End")
	local v_u_13 = {}
	local v_u_14 = {}
	local v_u_15 = {}
	v_u_9:Add(task.spawn(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
		for _ = 1, 80 do
			local v16 = v_u_9:Add(script.Seeds:GetChildren()[math.random(1, #script.Seeds:GetChildren())]:Clone())
			local v17 = v_u_9:Add(Instance.new("Model"))
			v16.Parent = v17
			v17.PrimaryPart = v16
			v17.Parent = game.Workspace.WeatherVisuals
			for _, v18 in ipairs(v17:GetDescendants()) do
				if v18:IsA("BasePart") and v18 ~= v17.PrimaryPart then
					v18.CanCollide = false
					v18.Anchored = false
					v18.Massless = true
					v18.CastShadow = false
				end
			end
			local v19 = (v_u_11.Position + v_u_12.Position) / 2
			local v20 = v_u_12.Position.Y - v_u_11.Position.Y
			math.abs(v20)
			local v21 = v_u_11.Position.Y
			local v22 = v_u_12.Position.Y
			local v23 = math.min(v21, v22)
			local v24 = v_u_11.Position.Y
			local v25 = v_u_12.Position.Y
			local v26 = math.max(v24, v25)
			local v27 = math.random(v23 - 50, v26 + 85)
			local v28 = math.random() * 3.141592653589793 * 2
			local v29 = math.random(180, 220)
			local v30 = math.random(30, 45) * 1.5
			local v31 = math.rad(v30)
			local v32 = math.random(6, 9)
			local v33 = math.cos(v28) * v29
			local v34 = math.sin(v28) * v29
			local v35 = Vector3.new(v33, 0, v34)
			local v36 = v19.X
			local v37 = v19.Z
			local v38 = Vector3.new(v36, v27, v37) + v35
			v17:PivotTo(CFrame.new(v38))
			v17.Parent = workspace.WeatherVisuals
			local v39 = v_u_13
			local v40 = {
				["StartTime"] = tick(),
				["Duration"] = v32
			}
			local v41 = v19.X
			local v42 = v19.Z
			v40.Center = Vector3.new(v41, v27, v42)
			v40.Radius = v29
			v40.InitialAngle = v28
			v40.RotationSpeed = v31
			local v43 = math.random()
			local v44 = math.random()
			local v45 = math.random
			v40.SpinAxis = Vector3.new(v43, v44, v45()).Unit * 0.2617993877991494
			v39[v17] = v40
			task.wait()
		end
	end))
	v_u_9:Add(game:GetService("RunService").Heartbeat:Connect(function(_)
		-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_13
		if workspace:GetAttribute("RestockFever") then
			table.clear(v_u_14)
			table.clear(v_u_15)
			for v46, v47 in pairs(v_u_13) do
				if v46.PrimaryPart then
					local v48 = tick() - v47.StartTime
					local v49 = v47.InitialAngle + v47.RotationSpeed * v48
					local v50 = math.cos(v49) * v47.Radius
					local v51 = math.sin(v49) * v47.Radius
					local v52 = Vector3.new(v50, 0, v51)
					local v53 = v47.Center + v52
					local v54 = v49 + 0.05
					local v55 = math.cos(v54) * v47.Radius
					local v56 = math.sin(v54) * v47.Radius
					local v57 = Vector3.new(v55, 0, v56)
					local v58 = (v47.Center + v57 - v53).Unit
					local v59 = CFrame.lookAt(v53, v53 + v58, Vector3.new(0, 1, 0)) * CFrame.Angles(v48 * 0.7853981633974483, v48 * 0.7853981633974483, v48 * 0.7853981633974483)
					local v60 = v_u_14
					local v61 = v46.PrimaryPart
					table.insert(v60, v61)
					local v62 = v_u_15
					table.insert(v62, v59)
				end
			end
			if #v_u_14 > 0 then
				workspace:BulkMoveTo(v_u_14, v_u_15, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end
	end))
	repeat
		task.wait()
	until v_u_2 == false
	v_u_9:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
	if v10 then
		for _, v63 in v10:GetDescendants() do
			if v63:IsA("ParticleEmitter") then
				v63.Enabled = false
			end
		end
		task.wait(3)
		v10:Destroy()
	end
	v_u_6:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0,
		["GeographicLatitude"] = 29.475,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}):Play()
	v_u_6:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_6:Create(v_u_3, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_6:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_6:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
end
workspace:GetAttributeChangedSignal("RestockFever"):Connect(function()
	-- upvalues: (copy) v_u_64, (ref) v_u_2
	if workspace:GetAttribute("RestockFever") then
		v_u_64()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("RestockFever") then
	task.defer(v_u_64)
else
	v_u_2 = false
end
return v1