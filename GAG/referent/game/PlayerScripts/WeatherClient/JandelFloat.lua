local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_5 = game.Lighting.ColorCorrection:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
v_u_4.AddSkybox(v_u_3, 0)
local function v_u_14()
	-- upvalues: (ref) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	v_u_2 = true
	v_u_4.UpdateSkybox(v_u_3, 2)
	tick()
	local v6 = workspace.Visuals:WaitForChild("jandel")
	local v7 = v6:GetPivot()
	local v8 = v7 * CFrame.new(0, 160, 0)
	game.TweenService:Create(v_u_5, TweenInfo.new(2), {
		["Brightness"] = 0.15,
		["TintColor"] = Color3.fromRGB(255, 234, 215)
	}):Play()
	local v9 = v6:WaitForChild("Humanoid")
	local v10 = Instance.new("Animation")
	v10.AnimationId = "rbxassetid://136004572376763"
	local v11 = v9:LoadAnimation(v10)
	v11.Looped = true
	v11:Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(1), {
		["Ambient"] = Color3.fromRGB(163, 151, 109)
	}):Play()
	local v12 = 0
	while v12 < 3 do
		v12 = v12 + game:GetService("RunService").Heartbeat:Wait()
		v6:PivotTo((v7:Lerp(v8, (game.TweenService:GetValue(v12 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)))))
	end
	repeat
		task.wait()
	until v_u_2 == false
	game.TweenService:Create(game.Lighting, TweenInfo.new(1), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient")
	}):Play()
	game.TweenService:Create(v_u_5, TweenInfo.new(2), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	local v13 = 0
	while v13 < 3 do
		v13 = v13 + game:GetService("RunService").Heartbeat:Wait()
		v6:PivotTo((v8:Lerp(v7, (game.TweenService:GetValue(v13 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)))))
	end
	v6:Destroy()
	v_u_4.UpdateSkybox(v_u_3, 0)
end
workspace:GetAttributeChangedSignal("JandelFloat"):Connect(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_2
	if workspace:GetAttribute("JandelFloat") then
		v_u_14()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("JandelFloat") then
	task.defer(v_u_14)
else
	v_u_2 = false
end
return v1