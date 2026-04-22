local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("Debris")
local v_u_7 = workspace.CurrentCamera
local v_u_8 = require(v2.Code:WaitForChild("Windlines"))
local v_u_9 = require(v2.Modules.SoundPlayer)
local v_u_10 = require(v2.Data.SoundData)
local v_u_11 = v_u_5.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = v_u_5
local v_u_12 = workspace.Terrain.Clouds
local v_u_13 = {
	["Atmosphere"] = {
		["Density"] = 0.451,
		["Offset"] = 0.33,
		["Color"] = Color3.fromRGB(86, 80, 61),
		["Decay"] = Color3.fromRGB(255, 241, 226),
		["Glare"] = 0.33,
		["Haze"] = 2.4
	},
	["ColorCorrection"] = {
		["Brightness"] = -0.1,
		["Saturation"] = -0.4,
		["Contrast"] = 0.2,
		["TintColor"] = Color3.fromRGB(255, 249, 229)
	}
}
local v_u_14 = false
local function v_u_18(p15, p16)
	for _, v17 in p15:GetDescendants() do
		if v17:IsA("ParticleEmitter") then
			v17.Enabled = p16
		end
	end
end
local function v_u_21(p19)
	for _, v20 in p19:GetDescendants() do
		if v20:IsA("ParticleEmitter") then
			v20:Emit(v20:GetAttribute("EmitCount") or 1)
		end
	end
end
local function v_u_28()
	local v22 = game.ReplicatedStorage.StrikeLightningHere.CFrame
	local v23 = CFrame.new
	local v24 = Random.new():NextNumber(-game.ReplicatedStorage.StrikeLightningHere.Size.X, game.ReplicatedStorage.StrikeLightningHere.Size.X)
	local v25 = Random.new()
	local v26 = -game.ReplicatedStorage.StrikeLightningHere.Size.Z
	local v27 = game.ReplicatedStorage.StrikeLightningHere.Size.Z
	return v22 * v23(Vector3.new(v24, 0, v25:NextNumber(v26, v27)) / 2)
end
local function v_u_43(p29)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_21, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_5
	local v30 = {}
	for v31 = 1, 15 do
		local v32 = math.random(-10, 10)
		local v33 = (1 - v31 / 15) * 200 + math.random(-5, 5)
		local v34 = math.random
		local v35 = p29 + Vector3.new(v32, v33, v34(-10, 10))
		table.insert(v30, v35)
	end
	v30[16] = p29
	for v36 = 1, 15 do
		local v37 = v30[v36]
		local v38 = v30[v36 + 1]
		local v39 = (v37 - v38).Magnitude
		local v40 = v37:Lerp(v38, 0.5)
		local v41 = script.Segment:Clone()
		v41.CFrame = CFrame.lookAt(v40, v38)
		v41.Parent = workspace
		v41.Size = Vector3.new(2, 2, v39) * (0.5 * math.random() + 0.75)
		v_u_3:Create(v41, TweenInfo.new(v36 / 15 * 0.4 + 0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			["Size"] = Vector3.new(0, 0, v39)
		}):Play()
		v_u_6:AddItem(v41, 0.8)
	end
	local v42 = script.Strike:Clone()
	v42.Position = p29
	v42.Parent = workspace
	v_u_21(v42)
	v_u_6:AddItem(v42, 5)
	v_u_3:Create(v42.Light.PointLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		["Brightness"] = 0
	}):Play()
	v_u_6:AddItem(v_u_9:PlaySound(v_u_10.Weather.SafariStorm.LightningStrike, {
		["Volume"] = 0.6,
		["PlaybackSpeed"] = Random.new():NextNumber(0.9, 1.1),
		["RollOffMaxDistance"] = 300
	}, nil, v42, { "LazyLoadSound" }), 5)
	if (p29 - v_u_7.CFrame.Position).Magnitude <= 100 then
		v_u_5.Flash.Brightness = 1
		v_u_3:Create(v_u_5.Flash, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.new(1, 1, 1)
		}):Play()
	end
end
local function v_u_47()
	-- upvalues: (ref) v_u_14, (copy) v_u_3, (copy) v_u_13, (copy) v_u_11, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_28, (copy) v_u_43, (copy) v_u_6, (copy) v_u_18
	v_u_14 = true
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), v_u_13.Atmosphere):Play()
	v_u_3:Create(v_u_11, TweenInfo.new(3), v_u_13.ColorCorrection):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(218, 168, 133)
	}):Play()
	v_u_3:Create(v_u_12, TweenInfo.new(3), {
		["Cover"] = 0.835,
		["Density"] = 0.275,
		["Color"] = Color3.fromRGB(43, 49, 54)
	}):Play()
	v_u_8:Init({
		["Direction"] = Vector3.new(0, 0, 1),
		["Speed"] = 130,
		["Lifetime"] = 10,
		["SpawnRate"] = 30,
		["Color"] = Color3.fromRGB(255, 243, 194)
	})
	local v_u_44 = script.SafariStormWind:Clone()
	v_u_44.Parent = v_u_7
	local v_u_45 = script.Rain:Clone()
	v_u_45.Parent = v_u_7
	local v46 = v_u_4.Heartbeat:Connect(function()
		-- upvalues: (copy) v_u_44, (ref) v_u_7, (copy) v_u_45
		v_u_44.Position = v_u_7.CFrame.Position + Vector3.new(0, 0, 180)
		v_u_45.Position = v_u_7.CFrame.Position + Vector3.new(0, 100, 40)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_28, (ref) v_u_43
		while v_u_14 do
			v_u_43(v_u_28().Position)
			task.wait(math.random(1.5, 8))
		end
	end)
	while v_u_14 do
		task.wait(0.5)
	end
	if v46 then
		v46:Disconnect()
	end
	v_u_6:AddItem(v_u_44, 4)
	v_u_18(v_u_44, false)
	v_u_6:AddItem(v_u_45, 1)
	v_u_18(v_u_45, false)
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_3:Create(v_u_11, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_12, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_8:Cleanup()
end
workspace:GetAttributeChangedSignal("SafariStorm"):Connect(function()
	-- upvalues: (copy) v_u_47, (ref) v_u_14
	if workspace:GetAttribute("SafariStorm") then
		v_u_47()
	else
		v_u_14 = false
	end
end)
if workspace:GetAttribute("SafariStorm") then
	task.defer(v_u_47)
else
	v_u_14 = false
end
return v1