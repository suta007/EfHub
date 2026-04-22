local v1 = {}
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local function v_u_5()
	-- upvalues: (ref) v_u_3, (copy) v_u_4
	v_u_3 = true
	game.TweenService:Create(v_u_4, TweenInfo.new(3), {
		["TintColor"] = Color3.fromRGB(255, 241, 208)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(226, 204, 180),
		["ExposureCompensation"] = 0.5,
		["Brightness"] = 0.85
	}):Play()
	repeat
		task.wait()
	until v_u_3 == false
	game.TweenService:Create(v_u_4, TweenInfo.new(3), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Saturation"] = 0
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
end
workspace:GetAttributeChangedSignal("HeatwaveEvent"):Connect(function()
	-- upvalues: (copy) v_u_5, (ref) v_u_3
	if workspace:GetAttribute("HeatwaveEvent") then
		v_u_5()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("HeatwaveEvent") then
	task.defer(v_u_5)
else
	v_u_3 = false
end
return v1