local v1 = game:GetService("Players")
game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = workspace.CurrentCamera
local _ = v1.LocalPlayer
local v_u_7 = script:FindFirstChild("BlizzardParticle")
local v_u_8 = script:FindFirstChild("Sky")
local v_u_9 = require(v3.Modules.SkyboxManager)
local v_u_10 = require(v3.Modules.SoundPlayer)
local v_u_11 = require(v3.Data.SoundData)
local v_u_12 = require(v3.Modules.Trove).new()
local v_u_13 = v_u_5:FindFirstChild("YetiNightColorCorrection")
if not v_u_13 then
	v_u_13 = Instance.new("ColorCorrectionEffect")
	v_u_13.Name = "YetiNightColorCorrection"
	v_u_13.Brightness = 0
	v_u_13.Contrast = 0
	v_u_13.Saturation = 0
	v_u_13.TintColor = Color3.fromRGB(255, 255, 255)
	v_u_13.Parent = v_u_5
end
local v_u_14 = false
local v_u_15 = {}
local v_u_16 = nil
local function v_u_22(p17, p18, p19, p20)
	-- upvalues: (copy) v_u_2
	local v21 = v_u_2:Create(p17, TweenInfo.new(p20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		[p18] = p19
	})
	v21:Play()
	return v21
end
local function v_u_37(p23)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11
	local v24 = {}
	for v25 = 1, 15 do
		local v26 = math.random(-10, 10)
		local v27 = (1 - v25 / 15) * 200 + math.random(-5, 5)
		local v28 = math.random
		local v29 = p23 + Vector3.new(v26, v27, v28(-10, 10))
		table.insert(v24, v29)
	end
	v24[#v24 + 1] = p23
	for v30 = 1, 15 do
		local v31 = v24[v30]
		local v32 = v24[v30 + 1]
		local v33 = (v31 - v32).Magnitude
		local v34 = v31:Lerp(v32, 0.5)
		local v35 = script:FindFirstChild("Segment")
		if v35 then
			v35 = script.Segment:Clone()
		end
		if v35 then
			v35.CFrame = CFrame.lookAt(v34, v32)
			v35.Size = Vector3.new(2, 2, v33) * (0.5 * math.random() + 0.75)
			v35.Parent = workspace
			v_u_2:Create(v35, TweenInfo.new(v30 / 15 * 0.4 + 0.4, Enum.EasingStyle.Exponential), {
				["Size"] = Vector3.new(0, 0, v33)
			}):Play()
			v_u_4:AddItem(v35, 0.8)
		end
	end
	if (p23 - v_u_6.CFrame.Position).Magnitude <= 100 and v_u_5:FindFirstChild("Flash") then
		local v36 = v_u_5.Flash
		v36.Brightness = 1
		v_u_2:Create(v36, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.new(1, 1, 1)
		}):Play()
	end
	v_u_4:AddItem(v_u_10:PlaySound(v_u_11.Weather.YetiNight.LightningStrike, {
		["PlaybackSpeed"] = math.random(90, 110) / 100,
		["RollOffMaxDistance"] = 300,
		["Volume"] = 0.1
	}, p23, nil, { "LazyLoadSound" }), 5)
end
local function v_u_41()
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (ref) v_u_15
	if v_u_7 then
		local v38 = v_u_12:Clone(v_u_7)
		v38.Name = "YetiNightBlizzardParticles"
		v38.Parent = workspace:FindFirstChild("WeatherVisuals") or workspace
		v_u_15 = {}
		for _, v39 in ipairs(v38:GetDescendants()) do
			if v39:IsA("ParticleEmitter") then
				v39.Enabled = true
				local v40 = v_u_15
				table.insert(v40, v39)
			end
		end
	end
end
local function v_u_44()
	-- upvalues: (ref) v_u_15
	local v42 = workspace:FindFirstChild("YetiNightBlizzardParticles")
	if v42 then
		for _, v43 in ipairs(v42:GetDescendants()) do
			if v43:IsA("ParticleEmitter") then
				v43.Enabled = false
			end
		end
		v42:Destroy()
	end
	v_u_15 = {}
end
local function v_u_48()
	-- upvalues: (copy) v_u_12, (copy) v_u_41, (copy) v_u_8, (copy) v_u_5, (copy) v_u_9, (copy) v_u_2, (ref) v_u_13, (ref) v_u_16, (copy) v_u_10, (copy) v_u_11, (ref) v_u_14, (copy) v_u_6, (copy) v_u_37
	v_u_12:Clean()
	v_u_41()
	if v_u_8 then
		v_u_8.Parent = v_u_5
		v_u_9.AddSkybox(v_u_8)
		v_u_9.UpdateSkybox(v_u_8, 4)
	end
	v_u_2:Create(v_u_5, TweenInfo.new(5), {
		["Ambient"] = Color3.fromRGB(10, 10, 30),
		["OutdoorAmbient"] = Color3.fromRGB(15, 15, 40),
		["Brightness"] = 0.75
	}):Play()
	v_u_2:Create(v_u_13, TweenInfo.new(5), {
		["Brightness"] = -0.05,
		["Contrast"] = 0.3,
		["Saturation"] = -0.2,
		["TintColor"] = Color3.fromRGB(100, 120, 255)
	}):Play()
	v_u_16 = v_u_10:PlaySound(v_u_11.Weather.YetiNight.Ambience, {
		["Looped"] = true,
		["PlaybackSpeed"] = 0.7,
		["Volume"] = 0.8,
		["FadeInDuration"] = 4
	}, nil, nil)
	task.spawn(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_6, (ref) v_u_37
		while v_u_14 do
			local v45 = v_u_6.CFrame.Position
			local v46 = math.random(-60, 60)
			local v47 = math.random
			v_u_37(v45 + Vector3.new(v46, 0, v47(-60, 60)))
			task.wait(math.random(14, 27))
		end
	end)
end
local function v_u_49()
	-- upvalues: (ref) v_u_14, (copy) v_u_44, (copy) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (ref) v_u_13, (copy) v_u_5, (ref) v_u_16, (copy) v_u_22
	v_u_14 = false
	v_u_44()
	v_u_12:Clean()
	if v_u_8 then
		v_u_9.UpdateSkybox(v_u_8, 0)
	end
	v_u_2:Create(v_u_13, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(v_u_5, TweenInfo.new(3), {
		["Ambient"] = v_u_5:GetAttribute("DefaultAmbient"),
		["OutdoorAmbient"] = v_u_5:GetAttribute("DefaultOutdoorAmbient"),
		["Brightness"] = v_u_5:GetAttribute("DefaultBrightness")
	}):Play()
	if v_u_16 then
		v_u_22(v_u_16, "Volume", 0, 3)
		task.delay(3, function()
			-- upvalues: (ref) v_u_16
			v_u_16:Stop()
			v_u_16:Destroy()
			v_u_16 = nil
		end)
	end
end
workspace:GetAttributeChangedSignal("YetiNight"):Connect(function()
	-- upvalues: (ref) v_u_14, (copy) v_u_48, (copy) v_u_49
	if workspace:GetAttribute("YetiNight") then
		v_u_14 = true
		v_u_48()
	else
		v_u_49()
	end
end)
if workspace:GetAttribute("YetiNight") then
	v_u_14 = true
	v_u_48()
end
return {}