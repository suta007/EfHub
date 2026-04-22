local v1 = {}
local _ = game.ReplicatedStorage.SnowParticle
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v_u_5 = script.Sky
require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_6 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_6.AddSkybox(v_u_5, 0)
local v_u_7 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_9 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p8)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p8
end)
v_u_9:Start()
local function v_u_13()
	-- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	v_u_3 = true
	game.TweenService:Create(v_u_4, TweenInfo.new(1), {
		["Brightness"] = 0.1,
		["Contrast"] = -0.2,
		["Saturation"] = 0.2
	}):Play()
	v_u_9:ShakeSustain(v_u_7.Presets.WeakEarthquake)
	local v10 = game.ReplicatedStorage.Assets.WindyEffect:Clone()
	v10.Parent = workspace
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
		["Density"] = 0.352,
		["Offset"] = 1
	}):Play()
	v_u_6.UpdateSkybox(v_u_5, 2)
	task.spawn(function()
		-- upvalues: (ref) v_u_3
		repeat
			task.wait()
		until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:IsDescendantOf(workspace)
		local v11 = script.VectorForce:Clone()
		v11.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		v11.Attachment0 = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").RootAttachment
		repeat
			task.wait()
		until v_u_3 == false
		v11:Destroy()
	end)
	repeat
		task.wait()
	until v_u_3 == false
	v_u_6.UpdateSkybox(v_u_5, 0)
	for _, v12 in v10:GetChildren() do
		v12.Enabled = false
	end
	v_u_9:StopSustained(2)
	game.Debris:AddItem(v10, 4)
	game.TweenService:Create(v_u_4, TweenInfo.new(1), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
		["Density"] = 0,
		["Offset"] = 0
	}):Play()
end
workspace:GetAttributeChangedSignal("Gale"):Connect(function()
	-- upvalues: (copy) v_u_13, (ref) v_u_3
	if workspace:GetAttribute("Gale") then
		v_u_13()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("Gale") then
	task.defer(v_u_13)
else
	v_u_3 = false
end
return v1