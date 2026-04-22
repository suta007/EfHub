local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_5 = game.Lighting.ColorCorrection:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
local v_u_6 = game:GetService("CollectionService")
game.CollectionService:GetInstanceAddedSignal("TornadoVisual"):Connect(function(p_u_7)
	-- upvalues: (copy) v_u_6, (ref) v_u_2
	local v8 = v_u_6:HasTag(p_u_7, "TornadoVisualTemp")
	local v_u_9 = game.ReplicatedStorage.Assets.Tornado:Clone()
	v_u_9.Parent = workspace.Visuals
	v_u_9:PivotTo(p_u_7.CFrame)
	local v_u_10 = v_u_9.PrimaryPart
	local v_u_11 = Random.new()
	local v_u_12 = {}
	local function v_u_18()
		-- upvalues: (copy) v_u_9, (ref) v_u_12, (copy) v_u_11
		local v13 = v_u_9.Template:Clone()
		local v14 = v_u_12
		local v15 = {
			["CreationTime"] = tick(),
			["Template"] = v13,
			["Direction"] = Random.new():NextInteger(1, 2) == 2 and -1 or 1
		}
		table.insert(v14, v15)
		v13.Name = tick()
		v13.Parent = v_u_9
		local v16 = v_u_11:NextNumber(2.35, 4)
		for _, v17 in v13:GetDescendants() do
			if v17:IsA("Beam") then
				v17.Width0 = v16
				v17.Width1 = v16
			end
		end
		game.TweenService:Create(v13, TweenInfo.new(1.2), {
			["Size"] = Vector3.new(60, 0.5, 60)
		}):Play()
	end
	local v_u_19 = tick()
	if p_u_7 then
		v_u_9:PivotTo(v_u_9:GetPivot():Lerp(p_u_7.CFrame, 5))
	end
	local v_u_20 = false
	local v_u_21 = true
	task.spawn(function()
		-- upvalues: (ref) v_u_21, (copy) p_u_7, (copy) v_u_9, (ref) v_u_12, (copy) v_u_10, (ref) v_u_19, (copy) v_u_11, (ref) v_u_20, (copy) v_u_18
		while v_u_21 do
			local v22 = game:GetService("RunService").Heartbeat:Wait()
			if p_u_7 then
				v_u_9:PivotTo(v_u_9:GetPivot():Lerp(p_u_7.CFrame, v22 * 5))
			end
			for v23, v24 in v_u_12 do
				local v25 = (tick() - v24.CreationTime) / 1.2
				local v26 = math.clamp(v25, 0, 1)
				local v27 = v26 * 180
				local v28 = math.rad(v27)
				local v29 = 1 - math.sin(v28)
				local v30 = v24.Template
				local v31 = v_u_10.CFrame * CFrame.new(0, v26 * 90, 0)
				local v32 = CFrame.Angles
				local v33 = v26 * 720
				v30.CFrame = v31 * v32(0, math.rad(v33) * v24.Direction, 0) * CFrame.new(0, 0, v26 * 10)
				for _, v34 in v24.Template:GetChildren() do
					v34:GetAttribute("Direction")
					local v35 = v24.Template.Size.X
					local v36 = v24.Template.Size.Z
					v34.Position = Vector3.new(v35, 0, v36) / 2
					v34.Position = v34.Position * v34:GetAttribute("Direction")
				end
				for _, v37 in v24.Template:GetDescendants() do
					if v37:IsA("Beam") then
						v37.Transparency = NumberSequence.new(v29)
					end
				end
				if v26 == 1 then
					v24.Template:Destroy()
					table.remove(v_u_12, v23)
				end
			end
			if tick() - v_u_19 > v_u_11:NextNumber(0.1, 0.2) and v_u_20 == false then
				v_u_18()
				v_u_19 = tick()
			end
		end
	end)
	local v38 = v_u_12
	repeat
		task.wait()
	until not p_u_7 or (not p_u_7:IsDescendantOf(workspace) or not v8 and v_u_2 == false) or v8 and not v_u_6:HasTag(p_u_7, "TornadoVisualTemp")
	v_u_20 = true
	task.wait(1)
	v_u_21 = false
	for _, v39 in v38 do
		v39.Template:Destroy()
	end
	v_u_12 = {}
	for _, v40 in v_u_9:GetDescendants() do
		if v40:IsA("ParticleEmitter") then
			v40.Enabled = false
		end
	end
	task.delay(4, function()
		-- upvalues: (copy) v_u_9
		v_u_9:Destroy()
	end)
end)
local function v_u_41()
	-- upvalues: (ref) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	v_u_2 = true
	v_u_4.UpdateSkybox(v_u_3, 2)
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(162, 162, 162),
		["ExposureCompensation"] = 0.425,
		["Brightness"] = 0.7
	}):Play()
	game.TweenService:Create(v_u_5, TweenInfo.new(3), {
		["Brightness"] = 0.1,
		["TintColor"] = Color3.fromRGB(217, 217, 217)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.905,
		["Density"] = 0.083
	}):Play()
	repeat
		task.wait()
	until v_u_2 == false
	v_u_4.UpdateSkybox(v_u_3, 0)
	game.TweenService:Create(v_u_5, TweenInfo.new(3), {
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
end
workspace:GetAttributeChangedSignal("TornadoEvent"):Connect(function()
	-- upvalues: (copy) v_u_41, (ref) v_u_2
	if workspace:GetAttribute("TornadoEvent") then
		v_u_41()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("TornadoEvent") then
	task.defer(v_u_41)
else
	v_u_2 = false
end
return v1