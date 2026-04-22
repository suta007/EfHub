local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_5 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
v_u_4.AddSkybox(v_u_3, 0)
local v_u_8 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p7)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p7
end)
v_u_8:Start()
local function v_u_19()
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_6
	print("activated?")
	local v9 = game.ReplicatedStorage.VolcanoUI:Clone()
	v9.Parent = game.Players.LocalPlayer.PlayerGui
	v9.LocalScript.Enabled = true
	game.Debris:AddItem(v9, 9)
	local v10 = workspace.Visuals:WaitForChild("Volcano")
	print(v10)
	local v11 = v10:GetAttribute("Pivot")
	local v12 = 0
	while v12 < 3 do
		v12 = v12 + game:GetService("RunService").Heartbeat:Wait()
		local v13 = game.TweenService:GetValue(v12 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v10:PivotTo(v11:Lerp(v10:GetAttribute("Pivot") * CFrame.new(0, 150, 0), v13))
	end
	v_u_8:Shake(v_u_5.Presets.Explosion)
	v_u_8:ShakeSustain(v_u_5.Presets.WeakEarthquake)
	v_u_4.UpdateSkybox(v_u_3, 2)
	for _, v14 in v10:GetDescendants() do
		if v14:IsA("Beam") or v14:IsA("ParticleEmitter") then
			v14.Enabled = true
		end
	end
	game.TweenService:Create(v_u_6, TweenInfo.new(0.3), {
		["TintColor"] = Color3.fromRGB(255, 138, 43),
		["Brightness"] = 0.5
	}):Play()
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	task.wait(0.3)
	game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	game.TweenService:Create(v_u_6, TweenInfo.new(3), {
		["Brightness"] = 0.025,
		["TintColor"] = Color3.fromRGB(245, 169, 143)
	}):Play()
	repeat
		task.wait()
	until not workspace:GetAttribute("Volcano")
	v_u_4.UpdateSkybox(v_u_3, 0)
	game.TweenService:Create(v_u_6, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	for _, v15 in v10:GetDescendants() do
		if v15:IsA("Beam") or v15:IsA("ParticleEmitter") then
			v15.Enabled = false
		end
	end
	v_u_8:StopSustained(1)
	local v16 = v10:GetAttribute("Pivot") * CFrame.new(0, 150, 0)
	local v17 = 0
	while v17 < 3 do
		v17 = v17 + game:GetService("RunService").Heartbeat:Wait()
		local v18 = game.TweenService:GetValue(v17 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		v10:PivotTo(v16:Lerp(v10:GetAttribute("Pivot"), v18))
	end
	v10:Destroy()
end
workspace:GetAttributeChangedSignal("Volcano"):Connect(function()
	-- upvalues: (copy) v_u_19, (ref) v_u_2
	if workspace:GetAttribute("Volcano") then
		v_u_19()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("Volcano") then
	task.defer(v_u_19)
else
	v_u_2 = false
end
return v1