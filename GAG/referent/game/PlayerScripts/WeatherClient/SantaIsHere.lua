game:GetService("CollectionService")
local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v4 = require(v2.Modules.Maid)
local v_u_5 = require(v2.Modules.SoundPlayer)
local v_u_6 = require(v2.Data.SoundData)
local v_u_7 = require(v2.Modules.SelectiveAssetReplication)
local v_u_8 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate")
local v_u_9 = game.Lighting.ColorCorrection:Clone()
v_u_9.Name = script.Name
v_u_9.Parent = game.Lighting
local v_u_10 = Random.new()
local v_u_11 = false
local v12 = {}
local v_u_13 = script.Sky
local v_u_14 = v4.new()
local function v_u_17()
	-- upvalues: (copy) v_u_14, (copy) v_u_8
	local v15 = script.SnowParticles:Clone()
	local v16 = Instance.new("Part")
	v_u_14:GiveTask(v16)
	v16.Parent = workspace.Visuals
	v16.Name = "SnowParticleHolder"
	v16.Anchored = true
	v16.CanCollide = false
	v16.CanQuery = false
	v16.CanTouch = false
	v16.CFrame = v_u_8.CFrame * CFrame.new(0, 100, 0) * CFrame.Angles(0, 0, 3.141592653589793)
	v16.Parent = workspace
	v16.Size = v_u_8.Size
	v16.Transparency = 1
	v15.Parent = v16
end
local function v_u_33(p18, p19, p_u_20)
	-- upvalues: (ref) v_u_11, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_1, (copy) v_u_14
	if v_u_11 and p18 then
		local v21 = CFrame.Angles(1.5707963267948966, 0, 0)
		local v_u_22 = v_u_7:GetAssetAsync("SeedPackModels", p19):Clone()
		v_u_22.Parent = workspace.Visuals
		v_u_22:PivotTo(p18 * v21)
		local v23 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 2,
			["PlaybackSpeed"] = math.random(5, 8) / 10
		}
		v_u_5:PlaySound(v_u_6.Weather.FestiveNight.SnowPile.Poof, v23)
		local v_u_24 = script.Burst:Clone()
		v_u_24.Parent = v_u_22.PrimaryPart
		v_u_24.Enabled = true
		task.delay(0.25, function()
			-- upvalues: (copy) v_u_24
			if v_u_24 and v_u_24.Parent then
				v_u_24.Enabled = false
				task.wait(2)
				if v_u_24 and v_u_24.Parent then
					v_u_24:Destroy()
				end
			end
		end)
		local v25 = Instance.new("Attachment")
		v25.Parent = v_u_22.PrimaryPart
		v25.Position = v25.Position + Vector3.new(0, 0, -3)
		local v26 = Instance.new("ProximityPrompt")
		v26.Parent = v25
		v26:SetAttribute("Theme", "ShadowedPrompt")
		v26.Style = Enum.ProximityPromptStyle.Custom
		v26.ActionText = "Pick up"
		v26.ObjectText = p19
		v26.RequiresLineOfSight = false
		v26.HoldDuration = 0.5
		v26.Triggered:Connect(function()
			-- upvalues: (copy) v_u_22, (copy) p_u_20
			local v27 = v_u_22:GetPivot().Position
			if v_u_22 then
				v_u_22:Destroy()
			end
			game.ReplicatedStorage.GameEvents.ChristmasEvent.SantaIsHereEventOpenedPresent:FireServer(p_u_20, v27)
		end)
		local v_u_28 = v_u_22.PrimaryPart
		v_u_28.Anchored = true
		local v29 = p18.Position + Vector3.new(2, 15, 0)
		local v_u_30 = CFrame.new(p18.Position.X, 0, p18.Position.Z) * v21
		local v31 = v_u_1:Create(v_u_28, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["CFrame"] = CFrame.new(v29) * v21
		})
		v31:Play()
		v31.Completed:Connect(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_28, (copy) v_u_30
			local v32 = {
				["CFrame"] = v_u_30
			}
			v_u_1:Create(v_u_28, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), v32):Play()
		end)
		v_u_14:GiveTask(v_u_22)
		if v_u_11 == false then
			v_u_14:DoCleaning()
		end
	end
end
game.ReplicatedStorage.GameEvents.ChristmasEvent.SantaIsHereEventSpawnPresent.OnClientEvent:Connect(function(p34, p35, p36)
	-- upvalues: (ref) v_u_11, (copy) v_u_33
	if v_u_11 then
		v_u_33(p34:GetPivot(), p35, p36)
	end
end)
game.CollectionService:GetInstanceAddedSignal("SantaVisual"):Connect(function(p_u_37)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_10, (ref) v_u_11
	local v_u_38 = game.ReplicatedStorage.Assets.SantaSleigh:Clone()
	v_u_38.Parent = workspace.Visuals
	v_u_38:PivotTo(p_u_37.CFrame)
	local v39 = v_u_38.Ruldolf2:FindFirstChildOfClass("AnimationController")
	local v40 = Instance.new("Animation")
	v40.AnimationId = "rbxassetid://134715997691236"
	local v41 = v39:LoadAnimation(v40)
	v41.Looped = true
	v41:Play()
	local v42 = v_u_38.Ruldolf3:FindFirstChildOfClass("AnimationController")
	local v43 = Instance.new("Animation")
	v43.AnimationId = "rbxassetid://134715997691236"
	local v44 = v42:LoadAnimation(v43)
	v44.Looped = true
	v44:Play()
	local v45 = Instance.new("Part")
	v45.Size = Vector3.new(3, 0.1, 3)
	v45.Transparency = 1
	v45.CanCollide = false
	v45.Anchored = true
	v45.Parent = v_u_38
	v45:PivotTo(v_u_38:GetPivot() * CFrame.new(-2.25, 0, -2.25))
	local v46 = script.Sparkles:Clone()
	v46.Parent = v45
	v46.Enabled = true
	v_u_5:PlaySound(v_u_6.Weather.SantaIsHere.BellSound, {
		["Looped"] = true,
		["RollOffMode"] = Enum.RollOffMode.InverseTapered,
		["RollOffMaxDistance"] = 250,
		["RollOffMinDistance"] = 50
	}, nil, p_u_37)
	local v_u_47 = tick()
	if p_u_37 then
		v_u_38:PivotTo(v_u_38:GetPivot():Lerp(p_u_37.CFrame, 5))
	end
	local v_u_48 = false
	task.spawn(function()
		-- upvalues: (copy) p_u_37, (copy) v_u_38, (ref) v_u_47, (ref) v_u_10, (ref) v_u_48
		while true do
			local v49 = game:GetService("RunService").Heartbeat:Wait()
			if p_u_37 then
				v_u_38:PivotTo(v_u_38:GetPivot():Lerp(p_u_37.CFrame, v49 * 5))
			end
			if tick() - v_u_47 > v_u_10:NextNumber(0.1, 0.2) and v_u_48 == false then
				v_u_47 = tick()
			end
		end
	end)
	repeat
		task.wait()
	until not p_u_37 or (not p_u_37:IsDescendantOf(workspace) or v_u_11 == false)
	v_u_48 = true
	task.wait(1)
	v_u_38:Destroy()
end)
local function v_u_50()
	-- upvalues: (ref) v_u_11, (copy) v_u_17, (copy) v_u_13, (copy) v_u_3, (copy) v_u_1, (copy) v_u_9, (copy) v_u_14
	v_u_11 = true
	v_u_17()
	if v_u_13 then
		v_u_3.AddSkybox(v_u_13)
		v_u_3.UpdateSkybox(v_u_13, 5)
	end
	v_u_1:Create(game.Lighting, TweenInfo.new(5), {
		["Ambient"] = Color3.fromRGB(211, 213, 252),
		["ExposureCompensation"] = 0.1,
		["Brightness"] = 0.4
	}):Play()
	v_u_1:Create(v_u_9, TweenInfo.new(5), {
		["Brightness"] = 0.05,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.905,
		["Density"] = 0.083
	}):Play()
	repeat
		task.wait()
	until v_u_11 == false
	v_u_14:DoCleaning()
	if v_u_13 then
		v_u_3.UpdateSkybox(v_u_13, 0)
	end
	game.TweenService:Create(v_u_9, TweenInfo.new(3), {
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
workspace:GetAttributeChangedSignal("SantaIsHereEvent"):Connect(function()
	-- upvalues: (copy) v_u_50, (ref) v_u_11
	if workspace:GetAttribute("SantaIsHereEvent") then
		v_u_50()
	else
		v_u_11 = false
	end
end)
if workspace:GetAttribute("SantaIsHereEvent") then
	task.defer(v_u_50)
else
	v_u_11 = false
end
return v12