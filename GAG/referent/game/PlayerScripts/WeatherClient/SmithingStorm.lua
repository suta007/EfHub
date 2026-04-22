local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
game:GetService("CollectionService")
local v_u_4 = game:GetService("TweenService")
local _ = v2.GameEvents
local _ = workspace.CurrentCamera
local _ = v3.TouchEnabled
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_6 = require(v2.Modules.SoundPlayer)
local v_u_7 = require(v2.Data.SoundData)
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
local v_u_9 = false
local v_u_10 = {
	["Sky"] = script.Sky2,
	["AmbientColor"] = Color3.fromRGB(236, 123, 123),
	["Brightness"] = 0.7,
	["ColorCorrectionBrightness"] = 0.1,
	["TintColor"] = Color3.fromRGB(243, 188, 189)
}
v_u_5.AddSkybox(v_u_10.Sky, 0)
local function v_u_80(_)
	-- upvalues: (ref) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	if v_u_9 ~= true then
		v_u_9 = true
		v_u_5.UpdateSkybox(v_u_10.Sky, 2)
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = v_u_10.AmbientColor,
			["ExposureCompensation"] = 0.425,
			["Brightness"] = v_u_10.Brightness
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0.35
		}):Play()
		game.TweenService:Create(v_u_8, TweenInfo.new(3), {
			["Contrast"] = v_u_10.Contrast,
			["Brightness"] = v_u_10.ColorCorrectionBrightness,
			["TintColor"] = v_u_10.TintColor
		}):Play()
		game.Workspace.Terrain.Clouds.Enabled = true
		game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(56, 56, 56)
		game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0.905,
			["Density"] = 0.083
		}):Play()
		local v_u_11 = script:WaitForChild("Asset_Start")
		local v_u_12 = script:WaitForChild("Asset_End")
		local v_u_13 = {}
		local v_u_14 = {}
		local v_u_15 = {}
		local function v_u_20(p16, p17)
			for _, v18 in ipairs(p16:GetDescendants()) do
				if v18:IsA("BasePart") and v18 ~= p17 then
					local v19 = Instance.new("WeldConstraint")
					v19.Part0 = p17
					v19.Part1 = v18
					v19.Parent = p17
				end
			end
		end
		local function v_u_25(p21, p22, p23)
			-- upvalues: (ref) v_u_4
			for _, v24 in ipairs(p21:GetDescendants()) do
				if v24:IsA("BasePart") and v24 ~= p21.PrimaryPart then
					v_u_4:Create(v24, TweenInfo.new(p23, Enum.EasingStyle.Linear), {
						["Transparency"] = p22
					}):Play()
				end
			end
		end
		local v60 = task.spawn(function()
			-- upvalues: (copy) v_u_20, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_25
			while true do
				local v26 = script.Assets:GetChildren()
				local v27 = v26[math.random(1, #v26)]:Clone()
				v27:ScaleTo(math.random(25, 50) / 10)
				for _, v28 in ipairs(v27:GetDescendants()) do
					if v28:IsA("BasePart") then
						v28.CanCollide = false
						v28.Anchored = false
						v28.Massless = true
						v28.CastShadow = false
					end
				end
				local v29, v30 = v27:GetBoundingBox()
				local v31 = Instance.new("Part")
				v31.Name = "Primary"
				v31.Anchored = true
				v31.Transparency = 1
				v31.CanCollide = false
				v31.Size = v30
				v31.CFrame = v29
				v31.Parent = v27
				v27.PrimaryPart = v31
				v_u_20(v27, v27.PrimaryPart)
				local v32 = (v_u_11.Position + v_u_12.Position) / 2
				local v33 = v_u_12.Position.Y - v_u_11.Position.Y
				math.abs(v33)
				local v34 = v_u_11.Position.Y
				local v35 = v_u_12.Position.Y
				local v36 = math.min(v34, v35)
				local v37 = v_u_11.Position.Y
				local v38 = v_u_12.Position.Y
				local v39 = math.max(v37, v38)
				local v40 = math.random(v36 - 50, v39 + 85)
				local v41 = math.random() * 3.141592653589793 * 2
				local v42 = math.random(240, 260)
				local v43 = math.random(30, 45) * 0.2
				local v44 = math.rad(v43)
				local v45 = math.random(12, 18)
				local v46 = math.cos(v41) * v42
				local v47 = math.sin(v41) * v42
				local v48 = Vector3.new(v46, 0, v47)
				local v49 = v32.X
				local v50 = v32.Z
				local v51 = Vector3.new(v49, v40, v50) + v48
				v27:PivotTo(CFrame.new(v51))
				for _, v52 in ipairs(v27:GetDescendants()) do
					if v52:IsA("BasePart") and v52 ~= v27.PrimaryPart then
						v52.Transparency = 1
					end
				end
				v27.Parent = workspace.WeatherVisuals
				local v53 = v_u_13
				local v54 = {
					["StartTime"] = tick(),
					["Duration"] = v45
				}
				local v55 = v32.X
				local v56 = v32.Z
				v54.Center = Vector3.new(v55, v40, v56)
				v54.Radius = v42
				v54.InitialAngle = v41
				v54.RotationSpeed = v44
				local v57 = math.random()
				local v58 = math.random()
				local v59 = math.random
				v54.SpinAxis = Vector3.new(v57, v58, v59()).Unit * 0.2617993877991494
				v53[v27] = v54
				v_u_25(v27, 0, 1)
				task.wait(0.3)
			end
		end)
		local v77 = game:GetService("RunService").Heartbeat:Connect(function()
			-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_25
			if workspace:GetAttribute("SmithingStorm") then
				table.clear(v_u_14)
				table.clear(v_u_15)
				for v61, v62 in pairs(v_u_13) do
					if v61.PrimaryPart then
						local v63 = tick() - v62.StartTime
						local v64 = v63 / v62.Duration
						local v65 = math.clamp(v64, 0, 1)
						local v66 = v62.InitialAngle + v62.RotationSpeed * v63
						local v67 = math.cos(v66) * v62.Radius
						local v68 = math.sin(v66) * v62.Radius
						local v69 = Vector3.new(v67, 0, v68)
						local v70 = v62.Center + v69
						local v71 = v63 * 3.141592653589793 * 2
						local v72 = CFrame.Angles(v62.SpinAxis.X * v71, v62.SpinAxis.Y * v71, v62.SpinAxis.Z * v71)
						local v73 = CFrame.new(v70) * v72
						local v74 = v_u_14
						local v75 = v61.PrimaryPart
						table.insert(v74, v75)
						local v76 = v_u_15
						table.insert(v76, v73)
						if v65 >= 0.85 and not v61:GetAttribute("FadingOut") then
							v61:SetAttribute("FadingOut", true)
							v_u_25(v61, 1, v62.Duration * 0.15)
						end
						if v65 >= 1 then
							v61:Destroy()
							v_u_13[v61] = nil
						end
					end
				end
				if #v_u_14 > 0 then
					workspace:BulkMoveTo(v_u_14, v_u_15, Enum.BulkMoveMode.FireCFrameChanged)
				end
			end
		end)
		task.spawn(function()
			task.wait(1)
			game.ReplicatedStorage.SmithingStorm.Value = true
		end)
		local v_u_78 = v_u_6:PlaySound(v_u_7.Weather.SmithingStorm.Ambience, {
			["Looped"] = true,
			["Volume"] = 0
		}, nil, nil, { "LazyLoadSound" })
		v_u_78.SoundGroup = game.SoundService.Music
		game.TweenService:Create(v_u_78, TweenInfo.new(3), {
			["Volume"] = 0.09
		}):Play()
		repeat
			task.wait()
		until not game.Workspace:GetAttribute("SmithingStorm")
		game.TweenService:Create(v_u_78, TweenInfo.new(3), {
			["Volume"] = 0
		}):Play()
		game.TweenService:Create(v_u_78, TweenInfo.new(3), {
			["Volume"] = 0
		}):Play()
		task.delay(3, function()
			-- upvalues: (copy) v_u_78
			v_u_78:Stop()
			v_u_78:Destroy()
		end)
		print("Finished")
		task.cancel(v60)
		v77:Disconnect()
		for v_u_79, _ in v_u_13 do
			task.spawn(function()
				-- upvalues: (copy) v_u_25, (copy) v_u_79
				v_u_25(v_u_79, 1, 0.25)
				task.wait(1.5)
				v_u_79:Destroy()
			end)
		end
		task.delay(1.5, function()
			-- upvalues: (copy) v_u_14, (copy) v_u_15
			table.clear(v_u_14)
			table.clear(v_u_15)
		end)
	end
end
local function v_u_82(p81)
	-- upvalues: (ref) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_8
	if v_u_9 == false then
		return
	else
		print("Reseting")
		v_u_5.UpdateSkybox(v_u_10.Sky, 0)
		v_u_9 = false
		game.ReplicatedStorage.SmithingStorm.Value = false
		game.TweenService:Create(v_u_8, TweenInfo.new(3), {
			["Brightness"] = 0,
			["Contrast"] = 0,
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
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
			["Density"] = 0
		}):Play()
		task.delay(3, function()
			game.Workspace.Terrain.Clouds.Enabled = false
			game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(22, 40, 70)
		end)
		if not p81 then
		end
	end
end
workspace:GetAttributeChangedSignal("SmithingStorm"):Connect(function()
	-- upvalues: (copy) v_u_80, (copy) v_u_82
	if workspace:GetAttribute("SmithingStorm") then
		v_u_80()
	else
		v_u_82()
	end
end)
if workspace:GetAttribute("SmithingStorm") then
	task.defer(function()
		-- upvalues: (copy) v_u_80
		v_u_80(true)
	end)
else
	v_u_82(true)
end
return v1