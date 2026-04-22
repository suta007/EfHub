local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local _ = game.Players.LocalPlayer
local v_u_4 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local v_u_5 = require(game.ReplicatedStorage.Modules.Notification)
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.SoundPlayer)
local v_u_8 = require(v6.Data.SoundData)
local v_u_9 = nil
local v_u_10 = script.Sky
local v_u_11 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_11.AddSkybox(v_u_10)
local function v_u_19(p12, p13, p14, p15, p16, p17)
	-- upvalues: (copy) v_u_7
	p13.PlaybackSpeed = p13.PlaybackSpeed + math.random(p14 * 1000, p15 * 1000) / 1000
	local v_u_18 = v_u_7:PlaySound(p12, p13, nil, p16)
	if not p17 then
		task.delay((p12.TimeLength or 5) / v_u_18.PlaybackSpeed + 0.5, function()
			-- upvalues: (copy) v_u_18
			if v_u_18 then
				v_u_18:Destroy()
			end
		end)
	end
end
local function v_u_33(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_11, (copy) v_u_10, (copy) v_u_19, (copy) v_u_8, (copy) v_u_3, (ref) v_u_9, (copy) v_u_7
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_5:CreateNotification("An explosion of ice has transformed the map!")
		v_u_4:ScreenShake("Normal", { "Vector" }, 3, 1.5, 0.6)
		v_u_4:ScreenShake("Normal", { "Tilt", 30 }, 4, 2.5, 0.8)
		v_u_11.UpdateSkybox(v_u_10, 2)
		local v20 = script.PermafrostExplosion:Clone()
		v20.Parent = workspace.WeatherVisuals
		local v21 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 5,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 1
		}
		local v22 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 0.5
		}
		v_u_19(v_u_8.Weather.PermafrostExplosion.Start, v21, -0.2, 0.2, v20)
		v_u_19(v_u_8.Weather.PermafrostExplosion.Freeze, v22, -0.2, 0.2, script)
		v20.Particle.Burst:Emit(20)
		v20.Particle.Glow:Emit(1)
		v20.Particle.Lines2:Emit(20)
		v20.Particle.Wave:Emit(3)
		for _, v23 in v20.Particle:GetChildren() do
			if v23.Name ~= "Glow" then
				v23.Enabled = true
			end
		end
		local v24 = workspace.BasePlate.TopBaseplate
		local v25 = v24:Clone()
		v25.Color = Color3.fromRGB(193, 242, 255)
		v25.CanCollide = false
		v25.Name = "ICEPLATE"
		v25.Parent = workspace.WeatherVisuals
		local v26 = script.PassiveCold:Clone()
		v26.Parent = v25
		v26.Enabled = true
		local v27 = script.FrostBurst:Clone()
		v27.Parent = workspace.BasePlate.TopBaseplate
		v27:Emit(10)
		v27.Enabled = true
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(130, 255, 251),
			["OutdoorAmbient"] = Color3.fromRGB(155, 218, 225),
			["Brightness"] = 1
		}):Play()
		local v28 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 1.5,
			["PlaybackSpeed"] = 0.8
		}
		v_u_9 = v_u_7:PlaySound(v_u_8.Weather.PermafrostExplosion.Ambience, v28, nil, nil)
		v_u_9.Volume = 1.5
		local v29 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(v24, v29, {
			["Transparency"] = 1
		}):Play()
		for _ = 1, 6 do
			local v_u_30 = script.Parent.Dissonant.InvertedSphere:Clone()
			v_u_30.Position = v20.Position
			v_u_30.Color = Color3.fromRGB(124, 255, 255)
			v_u_30.Size = Vector3.new(0, 0, 0)
			v_u_30.Transparency = 0.75
			local v31 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Volume"] = 0.75,
				["PlaybackSpeed"] = 1
			}
			v_u_30.Parent = v20
			v_u_19(v_u_8.Weather.PermafrostExplosion.Wave, v31, -0.3, 0.3, v_u_30)
			v_u_3:Create(v_u_30, v29, {
				["Size"] = Vector3.new(1500, 1500, 1500),
				["Transparency"] = 1
			}):Play()
			task.delay(2, function()
				-- upvalues: (copy) v_u_30
				if v_u_30 then
					v_u_30:Destroy()
				end
			end)
			task.wait(0.2)
		end
		task.wait(0.5)
		if v27 then
			v27.Enabled = false
		end
		for _, v32 in v20.Particle:GetChildren() do
			v32.Enabled = false
		end
		task.wait(10)
		if v20 then
			v20:Destroy()
		end
		if v27 then
			v27:Destroy()
		end
	end
end
local function v_u_37(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_3, (ref) v_u_9, (copy) v_u_11, (copy) v_u_10
	if v_u_2 ~= false then
		v_u_2 = false
		v_u_3:Create(game.Lighting, TweenInfo.new(7), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = game.Lighting:GetAttribute("DefaultOutdoorAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		local v34 = workspace.BasePlate.TopBaseplate
		local v35 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(v34, v35, {
			["Transparency"] = 0
		}):Play()
		local v36 = workspace.WeatherVisuals:FindFirstChild("ICEPLATE")
		if v36 then
			v36.PassiveCold.Enabled = false
			v_u_3:Create(v36, v35, {
				["Transparency"] = 1
			}):Play()
		end
		v_u_3:Create(v_u_9, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
			["Volume"] = 0
		}):Play()
		v_u_11.UpdateSkybox(v_u_10, 0)
		task.wait(5)
		if v36 then
			v36:Destroy()
		end
		v_u_9:Stop()
	end
end
workspace:GetAttributeChangedSignal("PermafrostExplosion"):Connect(function()
	-- upvalues: (copy) v_u_33, (copy) v_u_37
	if workspace:GetAttribute("PermafrostExplosion") then
		v_u_33()
	else
		v_u_37()
	end
end)
if workspace:GetAttribute("PermafrostExplosion") then
	task.defer(function()
		-- upvalues: (copy) v_u_33
		v_u_33(true)
	end)
else
	v_u_37(true)
end
return v1