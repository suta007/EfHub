local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Lighting")
game:GetService("RunService")
require(game.ReplicatedStorage.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p4)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p4
end):Start()
local v_u_5 = game.Lighting.ColorCorrection:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
local v_u_6 = false
local function v_u_19()
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
	v_u_6 = true
	local v_u_7 = script.Moon:Clone()
	v_u_7.Position = Vector3.new(-4000, 7000, -3685)
	v_u_7.Transparency = 1
	v_u_7.Parent = workspace.WeatherVisuals
	local v_u_8 = script.EclipseAtmosphere:Clone()
	local v_u_9 = Instance.new("SunRaysEffect")
	v_u_9.Intensity = 0
	v_u_9.Spread = 0
	v_u_9.Parent = game.Lighting
	v_u_2:Create(v_u_7, TweenInfo.new(5, Enum.EasingStyle.Quad), {
		["Transparency"] = 0
	}):Play()
	v_u_2:Create(v_u_8, TweenInfo.new(23, Enum.EasingStyle.Linear), {
		["Haze"] = 10
	}):Play()
	v_u_2:Create(v_u_5, TweenInfo.new(8, Enum.EasingStyle.Linear), {
		["TintColor"] = Color3.fromRGB(179, 184, 255)
	}):Play()
	local v10 = {}
	local v11 = task.delay
	local function v12()
		-- upvalues: (ref) v_u_2, (copy) v_u_9
		v_u_2:Create(v_u_9, TweenInfo.new(3), {
			["Intensity"] = 0.3
		}):Play()
	end
	table.insert(v10, v11(9, v12))
	local v13 = task.delay
	local function v14()
		-- upvalues: (copy) v_u_8, (ref) v_u_3
		v_u_8.Parent = v_u_3
	end
	table.insert(v10, v13(3, v14))
	local v_u_15 = 0
	local v_u_16 = tick()
	local v17 = game:GetService("RunService").Heartbeat:Connect(function(_)
		-- upvalues: (ref) v_u_15, (copy) v_u_16, (copy) v_u_7
		v_u_15 = v_u_15 + 0.03333333333333333
		while v_u_15 >= 0.03333333333333333 do
			v_u_15 = v_u_15 - 0.03333333333333333
			if tick() - v_u_16 >= 10 then
				v_u_7.Position = v_u_7.Position:Lerp(workspace.CurrentCamera.CFrame.Position + game.Lighting:GetSunDirection() * 8500, 1)
			else
				v_u_7.Position = v_u_7.Position:Lerp(workspace.CurrentCamera.CFrame.Position + game.Lighting:GetSunDirection() * 8500, 0.005)
			end
		end
	end)
	repeat
		task.wait()
	until v_u_6 == false
	if v17 then
		v17:Disconnect()
	end
	v_u_2:Create(v_u_8, TweenInfo.new(5), {
		["Haze"] = 0
	}):Play()
	v_u_2:Create(v_u_7, TweenInfo.new(7.5, Enum.EasingStyle.Quad), {
		["Position"] = Vector3.new(-4000, 7000, 4540),
		["Transparency"] = 1
	}):Play()
	v_u_2:Create(v_u_5, TweenInfo.new(5), {
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(v_u_9, TweenInfo.new(3), {
		["Intensity"] = 0
	}):Play()
	for _, v18 in v10 do
		task.cancel(v18)
	end
	task.delay(5, v_u_8.Destroy, v_u_8)
	task.delay(3, v_u_9.Destroy, v_u_9)
	task.delay(7.5, v_u_7.Destroy, v_u_7)
end
workspace:GetAttributeChangedSignal("SolarEclipse"):Connect(function()
	-- upvalues: (copy) v_u_19, (ref) v_u_6
	if workspace:GetAttribute("SolarEclipse") then
		v_u_19()
	else
		v_u_6 = false
	end
end)
if workspace:GetAttribute("SolarEclipse") then
	task.defer(v_u_19)
else
	v_u_6 = false
end
return v1