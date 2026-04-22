local v1 = {}
local _ = game.ReplicatedStorage.RainParticle
Random.new()
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.SoundPlayer)
local v_u_3 = require(game.ReplicatedStorage.Data.SoundData)
local v4 = RaycastParams.new()
v4.FilterDescendantsInstances = { workspace.Terrain, workspace }
v4.FilterType = Enum.RaycastFilterType.Include
local v_u_5 = false
local v6 = script.Sky
require(game.ReplicatedStorage.Modules.SkyboxManager).AddSkybox(v6)
local v7 = game.Lighting.ColorCorrection:Clone()
v7.Name = script.Name
v7.Parent = game.Lighting
local function v8()
	-- upvalues: (ref) v_u_5
	v_u_5 = true
	task.spawn(function() end)
end
workspace:GetAttributeChangedSignal("MeteorShower"):Connect(function()
	-- upvalues: (ref) v_u_5
	if workspace:GetAttribute("MeteorShower") then
		v_u_5 = true
		task.spawn(function() end)
	else
		v_u_5 = false
	end
end)
game.ReplicatedStorage.RainSplash:Clone().Parent = workspace.WeatherVisuals
local v9 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
if workspace:GetAttribute("MeteorShower") then
	task.defer(v8)
else
	v_u_5 = false
end
local v_u_11 = require(game.ReplicatedStorage.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
local function v_u_18(p12, p13)
	local v14 = Instance.new("Part")
	v14.Anchored = true
	v14.CanCollide = false
	v14.Transparency = 1
	v14.Size = Vector3.new(1, 1, 1)
	v14.CFrame = CFrame.new(p12 + Vector3.new(0, 4, 0))
	v14.Parent = workspace.WeatherVisuals
	local v15 = Instance.new("Attachment", v14)
	local v16 = Instance.new("Attachment")
	v16.Name = "MeteorTracker"
	v16.Parent = p13
	local v17 = Instance.new("Beam")
	v17.Attachment0 = v15
	v17.Attachment1 = v16
	v17.Width0 = 0.5
	v17.Width1 = 0.1
	v17.LightEmission = 1
	v17.TextureSpeed = 5
	v17.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255))
	v17.Transparency = NumberSequence.new(0.2)
	v17.FaceCamera = true
	v17.Parent = v14
	return v14
end
local function v_u_42(p19, p20)
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_3, (copy) v_u_11
	local v21 = math.random(0, 360)
	local v22 = math.rad(v21)
	local v23 = math.cos(v22)
	local v24 = math.sin(v22)
	local v25 = Vector3.new(v23, 0, v24)
	local v26 = math.random(300, 500)
	local v27 = math.random(250, 350)
	local v28 = p19 + (v25 * v26 + Vector3.new(0, v27, 0))
	local v29 = p20 or p19
	local v30 = game.ReplicatedStorage.ShootingStar:Clone()
	v30.CFrame = CFrame.new(v28, p19)
	v30.Parent = workspace.WeatherVisuals
	local v31
	if p20 then
		v31 = v_u_18(p20, v30)
	else
		v31 = nil
	end
	local v32 = (v29 - v28).Magnitude / 300
	local v33 = 0
	local v34 = false
	local v35 = false
	while v33 < v32 do
		local v36 = task.wait()
		v33 = v33 + v36
		if v32 - v33 < 3.5 and not v34 then
			v34 = true
			if Random.new():NextInteger(1, 2) == 1 then
				v_u_2:PlaySound(v_u_3.Weather.MeteorShower.Starfall, {
					["PlaybackSpeed"] = 1.25
				}, nil, v30)
			else
				v_u_2:PlaySound(v_u_3.Weather.MeteorShower.Starfall, nil, nil, v30)
			end
		end
		local v37 = v30.Position
		if p20 and (not v35 and (v29 - v37).Magnitude <= 80) then
			p19 = v29
			v35 = true
		end
		local v38 = v37 + (p19 - v37).Unit * 300 * v36
		v30.CFrame = CFrame.new(v38, p19)
	end
	for _, v39 in v30:GetDescendants() do
		if v39:IsA("BillboardGui") then
			v39.Enabled = false
		end
	end
	v_u_11:Shake(v_u_11.Presets.Explosion)
	local v40 = game.ReplicatedStorage.StarHit:Clone()
	v40.CFrame = CFrame.new(v29)
	v40.Parent = workspace.WeatherVisuals
	for _, v41 in v40:GetDescendants() do
		if v41:IsA("ParticleEmitter") then
			v41:Emit(v41:GetAttribute("EmitCount"))
		elseif v41:IsA("Sound") then
			v41:Play()
		elseif v41:IsA("PointLight") then
			game.TweenService:Create(v41, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	game.Debris:AddItem(v30, 3)
	game.Debris:AddItem(v40, 3)
	if v31 then
		game.Debris:AddItem(v31, 1)
	end
end
v9.MeteorShower.OnClientEvent:Connect(function(p43, p44)
	-- upvalues: (copy) v_u_42
	v_u_42(p43, p44)
end)
return v1