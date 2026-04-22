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
local v5 = script.Sky
require(game.ReplicatedStorage.Code.BodyShaker)
require(game.ReplicatedStorage.Modules.SkyboxManager).AddSkybox(v5)
local v_u_6 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_8 = v_u_6.new(Enum.RenderPriority.Camera.Value, function(p7)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p7
end)
local function v_u_11()
	-- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6
	v_u_3 = true
	game.TweenService:Create(v_u_4, TweenInfo.new(1), {
		["Contrast"] = -0.2,
		["Saturation"] = 0.2
	}):Play()
	v_u_8:Start()
	v_u_8:ShakeSustain(v_u_6.Presets.HandheldCamera)
	local v9 = game.ReplicatedStorage.Assets.LightWindyEffect:Clone()
	v9.Parent = workspace
	repeat
		task.wait()
	until v_u_3 == false
	for _, v10 in v9:GetChildren() do
		v10.Enabled = false
	end
	v_u_8:StopSustained(2)
	game.Debris:AddItem(v9, 4)
	game.TweenService:Create(v_u_4, TweenInfo.new(1), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0
	}):Play()
end
workspace:GetAttributeChangedSignal("Windy"):Connect(function()
	-- upvalues: (copy) v_u_11, (ref) v_u_3
	if workspace:GetAttribute("Windy") then
		v_u_11()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("Windy") then
	task.defer(v_u_11)
else
	v_u_3 = false
end
return v1