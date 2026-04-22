local _ = workspace.CurrentCamera
local v_u_1 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_2 = script.Sky
v_u_1.AddSkybox(v_u_2)
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v3.Modules.SoundPlayer)
local v_u_6 = require(v3.Data.SoundData)
local _ = {
	CFrame.new(128.576, 0, 114.499),
	CFrame.new(102.076, 0, 52.099),
	CFrame.new(70.976, 0, 151.899),
	CFrame.new(-3.124, 0, 167.299),
	CFrame.new(-18.524, 0, 17.999),
	CFrame.new(-34.024, 0, 84.699),
	CFrame.new(71.576, 0, -7.401),
	CFrame.new(129.976, 0, -44.201),
	CFrame.new(111.076, 0, -105.201),
	CFrame.new(88.076, 0, -179.201),
	CFrame.new(-33.124, 0, -69.301),
	CFrame.new(-204.324, 0, -13.401),
	CFrame.new(-169.924, 0, 79.199),
	CFrame.new(-217.124, 0, 149.999),
	CFrame.new(-317.224, 0, 82.599),
	CFrame.new(-317.224, 0, -172.501),
	CFrame.new(-161.224, 0, -190.601),
	CFrame.new(-161.224, 0, -57.701),
	CFrame.new(-33.824, 0, -147.201),
	CFrame.new(-85.424, 0, 19.699),
	CFrame.new(127.576, 0, -51.901)
}
Random.new()
local v7 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate") or error("For some weird reason baseplate is missing????")
Vector2.new(v7.Size.X, v7.Size.Z)
local v8 = workspace.Farm:GetChildren()
local v9 = {}
local v_u_10 = false
local v_u_11 = nil
local v_u_12 = nil
local v13 = {}
for _, v14 in pairs(v8) do
	local v15 = v14:FindFirstChild("PetArea")
	if v15 then
		local v16 = v15.Size.X / 2
		local _ = v15.Size.Z / 2
		local v17 = math.pow(v16, 2) + math.pow(v16, 2)
		local v18 = math.sqrt(v17)
		local v19 = v15.Position
		local _ = v19.Y
		table.insert(v9, {
			["Range"] = v18,
			["Pos"] = v19
		})
	end
end
local function v_u_27(p20, p21, p22, p23, p24, p25)
	-- upvalues: (copy) v_u_5
	p21.PlaybackSpeed = p21.PlaybackSpeed + math.random(p22 * 1000, p23 * 1000) / 1000
	local v_u_26 = v_u_5:PlaySound(p20, p21, nil, p24)
	if not p25 then
		task.delay((p20.TimeLength or 5) / v_u_26.PlaybackSpeed + 0.5, function()
			-- upvalues: (copy) v_u_26
			if v_u_26 then
				v_u_26:Destroy()
			end
		end)
	end
end
local function v_u_42(p28)
	-- upvalues: (ref) v_u_10, (copy) v_u_1, (copy) v_u_2, (ref) v_u_11, (copy) v_u_5, (copy) v_u_6, (ref) v_u_12, (copy) v_u_4, (copy) v_u_27
	if v_u_10 ~= true then
		v_u_10 = true
		if p28 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(59, 87, 93),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_1.UpdateSkybox(v_u_2, 4)
			local v29 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.45,
				["PlaybackSpeed"] = 0.9
			}
			v_u_11 = v_u_5:PlaySound(v_u_6.Weather.Blizzard.Ambience, v29, nil, nil)
			v_u_11.Volume = 0.45
			local v30 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.4,
				["PlaybackSpeed"] = 0.9
			}
			v_u_12 = v_u_5:PlaySound(v_u_6.Weather.WinterAuroraAmbience, v30, nil, nil)
			v_u_12.Volume = 0.4
			workspace.BasePlate.TopBaseplate.Color = Color3.fromRGB(255, 255, 255)
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_1.UpdateSkybox(v_u_2, 4)
			game.Lighting.ClockTime = 3
			task.wait(2)
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25,
				["ClockTime"] = 16
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(120, 168, 170),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			local v31 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.001,
				["PlaybackSpeed"] = 0.9
			}
			v_u_11 = v_u_5:PlaySound(v_u_6.Weather.Blizzard.Ambience, v31, nil, nil)
			local v32 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.001,
				["PlaybackSpeed"] = 0.9
			}
			v_u_12 = v_u_5:PlaySound(v_u_6.Weather.WinterAuroraAmbience, v32, nil, nil)
			v_u_4:Create(v_u_11, TweenInfo.new(5), {
				["Volume"] = 0.45
			}):Play()
			v_u_4:Create(v_u_12, TweenInfo.new(5), {
				["Volume"] = 0.4
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0.028
			}):Play()
			v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
				["Color"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		end
		local v33 = script.Bits:Clone()
		local v34 = script.Snowflakes:Clone()
		v33.Parent = workspace.BasePlate.TopBaseplate
		v34.Parent = workspace.BasePlate.TopBaseplate
		v33.Enabled = true
		v34.Enabled = true
		v33:Emit(20)
		v34:Emit(20)
		local v35 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 1
		}
		v_u_27(v_u_6.Weather.PermafrostExplosion.Freeze, v35, -0.2, 0.2, workspace.BasePlate.TopBaseplate)
		local v36 = script.BlizzardParticle:Clone()
		v36.Parent = workspace.WeatherVisuals
		for _, v37 in v36:GetChildren() do
			v37.Enabled = true
		end
		local v38 = script.WAurora:Clone()
		v38.Parent = workspace.WeatherVisuals
		for _, v39 in v38:GetDescendants() do
			if v39:IsA("Beam") then
				local v40 = v39.Width0
				local v41 = v39.Width1
				v39.Width0 = 0
				v39.Width1 = 0
				game.TweenService:Create(v39, TweenInfo.new(4), {
					["Width0"] = v40,
					["Width1"] = v41
				}):Play()
			elseif v39:IsA("ParticleEmitter") then
				v39.Enabled = true
			end
		end
	end
end
local function v_u_50(p43)
	-- upvalues: (ref) v_u_10, (copy) v_u_4, (ref) v_u_11, (ref) v_u_12, (copy) v_u_1, (copy) v_u_2
	if v_u_10 == false then
		return
	else
		v_u_10 = false
		if not p43 then
			local v_u_44 = workspace.WeatherVisuals:FindFirstChild("WAurora")
			if v_u_44 then
				task.spawn(function()
					-- upvalues: (copy) v_u_44
					for _, v_u_45 in v_u_44:GetDescendants() do
						if v_u_45:IsA("Beam") then
							task.spawn(function()
								-- upvalues: (copy) v_u_45
								game.TweenService:Create(v_u_45, TweenInfo.new(4), {
									["Width0"] = 0,
									["Width1"] = 0
								}):Play()
							end)
						elseif v_u_45:IsA("ParticleEmitter") then
							v_u_45.Enabled = false
						end
					end
					task.wait(7)
					if v_u_44 then
						v_u_44:Destroy()
					end
				end)
			end
			local v46 = workspace.BasePlate.TopBaseplate:FindFirstChild("Bits")
			if v46 then
				v46.Enabled = false
			end
			local v47 = workspace.BasePlate.TopBaseplate:FindFirstChild("Snowflakes")
			if v47 then
				v47.Enabled = false
			end
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 3
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0
			}):Play()
			local v48 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
			if v48 then
				for _, v49 in v48:GetChildren() do
					v49.Enabled = false
				end
			end
			v_u_4:Create(v_u_11, TweenInfo.new(5), {
				["Volume"] = 0
			}):Play()
			v_u_4:Create(v_u_12, TweenInfo.new(5), {
				["Volume"] = 0
			}):Play()
			task.wait(5)
			if v46 then
				v46:Destroy()
			end
			if v47 then
				v47:Destroy()
			end
			v_u_1.UpdateSkybox(v_u_2, 0)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
				["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
				["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
				["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness"),
				["ClockTime"] = 14
			}):Play()
			v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
				["Color"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.Lighting.SunRays.Enabled = false
			v_u_11:Stop()
			if v48 then
				v48:Destroy()
			end
			v_u_1.UpdateSkybox(v_u_2, 0)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 138, 138),
				["ExposureCompensation"] = 0.2,
				["Brightness"] = 2,
				["ClockTime"] = 14
			}):Play()
		end
	end
end
workspace:GetAttributeChangedSignal("WinterAurora"):Connect(function()
	-- upvalues: (copy) v_u_42, (copy) v_u_50
	if workspace:GetAttribute("WinterAurora") then
		v_u_42()
	else
		v_u_50()
	end
end)
if workspace:GetAttribute("WinterAurora") then
	task.defer(function()
		-- upvalues: (copy) v_u_42
		v_u_42(true)
	end)
elseif v_u_10 ~= false then
	local _ = false
end
return v13