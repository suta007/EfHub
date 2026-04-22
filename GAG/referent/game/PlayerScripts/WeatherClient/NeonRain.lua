local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game.Players.LocalPlayer
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.ScreenShakeCore)
local v_u_8 = require(v6.Modules.WeatherMusicManager)
local v_u_9 = require(v6.Data.SoundData)
local v_u_10 = script:FindFirstChild("Sky")
local v_u_11 = require(v6.Modules.SkyboxManager)
if v_u_10 then
	v_u_11.AddSkybox(v_u_10)
end
local v_u_12 = game.Lighting.ColorCorrection:Clone()
v_u_12.Name = "NeonRain"
v_u_12.Parent = game.Lighting
local v13 = v6:WaitForChild("GameEvents"):WaitForChild("NeonRainImpact")
local v_u_14 = {
	Color3.fromRGB(0, 255, 255),
	Color3.fromRGB(255, 0, 255),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(255, 0, 128),
	Color3.fromRGB(0, 128, 255)
}
local v_u_15 = RaycastParams.new()
v_u_15.FilterType = Enum.RaycastFilterType.Include
v_u_15.FilterDescendantsInstances = {}
local v_u_16 = 0
local function v_u_20()
	-- upvalues: (ref) v_u_16, (copy) v_u_15
	local v17 = tick()
	if v17 - v_u_16 >= 2 then
		v_u_16 = v17
		local v18 = { workspace:FindFirstChild("BasePlate") }
		for _, v19 in workspace:GetDescendants() do
			if v19.Name == "Floor" or (v19.Name == "GardenFloor" or v19:GetAttribute("GardenFloor")) then
				table.insert(v18, v19)
			end
		end
		v_u_15.FilterDescendantsInstances = v18
	end
end
local function v_u_45(p21, p22)
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_4
	local v_u_23 = v_u_14[math.random(1, #v_u_14)]
	local v24 = p21.X / 1.5
	local v_u_25 = math.round(v24) * 1.5
	local v26 = p21.Z / 1.5
	local v_u_27 = math.round(v26) * 1.5
	local v_u_28 = p21.Y + 0.15 + 0.05
	local v_u_29 = p22 and 0.15 or 0.12
	local v_u_30 = p22 and 0.1 or 0.08
	local v_u_31 = {
		{ 1, 0 },
		{ -1, 0 },
		{ 0, 1 },
		{ 0, -1 },
		{ 1, 1 },
		{ 1, -1 },
		{ -1, 1 },
		{ -1, -1 }
	}
	local v_u_32 = p22 and 6 or 3
	for v_u_33 = 1, p22 and 16 or 8 do
		task.spawn(function()
			-- upvalues: (copy) v_u_31, (copy) v_u_33, (copy) v_u_32, (copy) v_u_25, (copy) v_u_27, (copy) v_u_23, (copy) v_u_28, (ref) v_u_3, (copy) v_u_29, (ref) v_u_4, (copy) v_u_30
			local v34 = v_u_31[(v_u_33 - 1) % #v_u_31 + 1]
			local v35 = math.random
			local v36 = v_u_32 * 0.5
			local v37 = v35(math.ceil(v36), v_u_32)
			local v38 = nil
			for v39 = 0, v37 do
				local v40 = 0
				local v41 = 0
				if v39 > 0 and math.random() > 0.6 then
					if v34[1] == 0 then
						v40 = math.random(-1, 1)
					else
						v41 = math.random(-1, 1)
					end
				end
				local v42 = v_u_25 + (v34[1] * v39 + v40) * 1.5
				local v43 = v_u_27 + (v34[2] * v39 + v41) * 1.5
				local v_u_44 = Instance.new("Part")
				v_u_44.Size = Vector3.new(1.5, 0.3, 1.5)
				v_u_44.Material = Enum.Material.Neon
				v_u_44.Color = v_u_23
				v_u_44.Anchored = true
				v_u_44.CanCollide = false
				v_u_44.CastShadow = false
				v_u_44.TopSurface = Enum.SurfaceType.Smooth
				v_u_44.BottomSurface = Enum.SurfaceType.Smooth
				v_u_44.Transparency = v39 / (v37 + 1) * 0.5
				v_u_44.CFrame = CFrame.new(v42, v_u_28, v43)
				v_u_44.Parent = workspace.WeatherVisuals
				if v38 then
					v_u_3:Create(v38, TweenInfo.new(v_u_29), {
						["Transparency"] = 1
					}):Play()
					v_u_4:AddItem(v38, v_u_29 + 0.1)
				end
				if v39 == v37 then
					task.delay(v_u_30 * 0.5, function()
						-- upvalues: (ref) v_u_3, (copy) v_u_44, (ref) v_u_29, (ref) v_u_4
						v_u_3:Create(v_u_44, TweenInfo.new(v_u_29 * 1.5), {
							["Transparency"] = 1
						}):Play()
						v_u_4:AddItem(v_u_44, v_u_29 * 1.5 + 0.1)
					end)
				end
				task.wait(v_u_30 * (0.7 + math.random() * 0.6))
				v38 = v_u_44
			end
		end)
	end
end
local function v_u_56()
	-- upvalues: (copy) v_u_5, (copy) v_u_20, (copy) v_u_15, (copy) v_u_14, (copy) v_u_3, (copy) v_u_45
	local v46 = v_u_5.Character
	if v46 and v46:FindFirstChild("HumanoidRootPart") then
		local v47 = v46.HumanoidRootPart
		local v48 = math.random(-150, 150)
		local v49 = math.random(-150, 150)
		local v50 = v47.Position + Vector3.new(v48, 120, v49)
		v_u_20()
		local v51 = workspace:Raycast(v50, Vector3.new(0, -250, 0), v_u_15)
		if v51 and v51.Normal.Y >= 0.9 then
			local v_u_52 = v51.Position
			local v53 = (v50.Y - v_u_52.Y) / 180
			local v54 = v_u_14[math.random(1, #v_u_14)]
			local v_u_55 = Instance.new("Part")
			v_u_55.Size = Vector3.new(0.3, 1, 0.3)
			v_u_55.Material = Enum.Material.Neon
			v_u_55.Color = v54
			v_u_55.Anchored = true
			v_u_55.CanCollide = false
			v_u_55.CastShadow = false
			v_u_55.Transparency = 0.2
			v_u_55.CFrame = CFrame.new(v50)
			v_u_55.Parent = workspace.WeatherVisuals
			v_u_3:Create(v_u_55, TweenInfo.new(v53, Enum.EasingStyle.Linear), {
				["CFrame"] = CFrame.new(v_u_52 + Vector3.new(0, 0.5, 0))
			}):Play()
			task.delay(v53, function()
				-- upvalues: (copy) v_u_55, (ref) v_u_45, (copy) v_u_52
				v_u_55:Destroy()
				v_u_45(v_u_52, false)
			end)
		end
	else
		return
	end
end
local function v_u_65(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_12, (copy) v_u_10, (copy) v_u_11, (copy) v_u_56
	if not v_u_2 then
		v_u_2 = true
		v_u_8.Start("NeonRain", {
			["soundId"] = v_u_9.Weather.NeonRain.Music,
			["priority"] = 8,
			["volume"] = 0.8
		})
		v_u_3:Create(v_u_12, TweenInfo.new(3), {
			["TintColor"] = Color3.fromRGB(200, 210, 255),
			["Brightness"] = 0,
			["Contrast"] = 0.1,
			["Saturation"] = 0.25
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = Color3.fromRGB(70, 55, 110),
			["OutdoorAmbient"] = Color3.fromRGB(55, 45, 90),
			["Brightness"] = 0.85
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 1.8,
			["Density"] = 0.2,
			["Offset"] = 0.5,
			["Color"] = Color3.fromRGB(45, 30, 75),
			["Decay"] = Color3.fromRGB(75, 50, 120)
		}):Play()
		workspace.Terrain.Clouds.Enabled = true
		v_u_3:Create(workspace.Terrain.Clouds, TweenInfo.new(4), {
			["Cover"] = 0.8,
			["Density"] = 0.4
		}):Play()
		task.spawn(function()
			-- upvalues: (ref) v_u_2
			local v57 = workspace.Terrain.Clouds
			local v58 = v57.Color
			local v59 = 0
			while v59 < 4 and v_u_2 do
				v59 = v59 + task.wait()
				local v60 = v59 / 4
				local v61 = math.min(v60, 1)
				local v62 = v59 * 0.08 % 1
				local v63 = Color3.fromHSV(v62, 1, 10)
				v57.Color = Color3.new(v58.R + (v63.R - v58.R) * v61, v58.G + (v63.G - v58.G) * v61, v58.B + (v63.B - v58.B) * v61)
			end
			while v_u_2 do
				v59 = v59 + task.wait()
				local v64 = v59 * 0.08 % 1
				v57.Color = Color3.fromHSV(v64, 1, 10)
			end
		end)
		if v_u_10 then
			v_u_11.UpdateSkybox(v_u_10, 3)
		end
		while v_u_2 do
			task.spawn(v_u_56)
			task.spawn(v_u_56)
			task.spawn(v_u_56)
			task.wait(0.08)
		end
	end
end
local function v_u_72(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_12
	if v_u_2 then
		v_u_2 = false
		v_u_8.Stop("NeonRain")
		if v_u_10 then
			v_u_11.UpdateSkybox(v_u_10, 0)
		end
		v_u_3:Create(v_u_12, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Contrast"] = 0,
			["Saturation"] = 0
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = game.Lighting:GetAttribute("DefaultOutdoorAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 0,
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		v_u_3:Create(workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0
		}):Play()
		task.spawn(function()
			local v66 = workspace.Terrain.Clouds
			local v67 = v66.Color
			local v68 = Color3.new(1, 1, 1)
			local v69 = 0
			while v69 < 3 do
				v69 = v69 + task.wait()
				local v70 = v69 / 3
				local v71 = math.min(v70, 1)
				v66.Color = Color3.new(v67.R + (v68.R - v67.R) * v71, v67.G + (v68.G - v67.G) * v71, v67.B + (v68.B - v67.B) * v71)
			end
			v66.Color = v68
			v66.Enabled = false
		end)
	end
end
v13.OnClientEvent:Connect(function(p73)
	-- upvalues: (ref) v_u_2, (copy) v_u_45, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_12
	if v_u_2 then
		v_u_45(p73, true)
		local v74 = v_u_5.Character
		if v74 and v74:FindFirstChild("HumanoidRootPart") then
			v_u_7:ScreenShake("Normal", { "Vector" }, 4, 0.6, 0.3, { v74.HumanoidRootPart.Position, p73, 200 })
			v_u_7:ScreenShake("Normal", { "Tilt", 6 }, 6, 0.5, 0.4, { v74.HumanoidRootPart.Position, p73, 200 })
		end
		v_u_3:Create(v_u_12, TweenInfo.new(0.1), {
			["Brightness"] = 0.3
		}):Play()
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_3, (ref) v_u_12
			v_u_3:Create(v_u_12, TweenInfo.new(0.5), {
				["Brightness"] = -0.05
			}):Play()
		end)
	end
end)
workspace:GetAttributeChangedSignal("NeonRain"):Connect(function()
	-- upvalues: (copy) v_u_65, (copy) v_u_72
	if workspace:GetAttribute("NeonRain") then
		v_u_65()
	else
		v_u_72()
	end
end)
if workspace:GetAttribute("NeonRain") then
	task.defer(function()
		-- upvalues: (copy) v_u_65
		v_u_65(true)
	end)
else
	v_u_72(true)
end
return v1