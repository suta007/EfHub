local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_5 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = require(v7.Modules.SoundPlayer)
local v_u_9 = require(v7.Data.SoundData)
local v_u_10 = script.Sky
local v_u_11 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_11.AddSkybox(v_u_10, 0)
local function v_u_30(p12, p13, p14)
	local v_u_15 = p14 or 5
	for _ = 1, p13 or 20 do
		local v_u_16 = Instance.new("Part")
		local v17 = math.random(1, 3)
		local v18 = math.random(1, 3)
		local v19 = math.random
		v_u_16.Size = Vector3.new(v17, v18, v19(1, 3))
		local v20 = CFrame.new
		local v21 = math.random(-5, 5)
		local v22 = math.random
		v_u_16.CFrame = v20(p12 + Vector3.new(v21, 0, v22(-5, 5)))
		v_u_16.Anchored = false
		v_u_16.CanCollide = false
		v_u_16.Material = Enum.Material.Neon
		v_u_16.Color = Color3.fromRGB(217, 106, 62)
		local v23 = math.random(-360, 360)
		local v24 = math.random(-360, 360)
		local v25 = math.random
		v_u_16.AssemblyAngularVelocity = Vector3.new(v23, v24, v25(-360, 360))
		local v_u_26 = Instance.new("BodyVelocity")
		local v27 = math.random(-70, 70)
		local v28 = math.random(80, 120)
		local v29 = math.random
		v_u_26.Velocity = Vector3.new(v27, v28, v29(-70, 70))
		v_u_26.P = 1000
		v_u_26.MaxForce = Vector3.new(100000, 100000, 100000)
		v_u_26.Parent = v_u_16
		v_u_16.Parent = workspace
		task.delay(0.2, function()
			-- upvalues: (copy) v_u_26, (ref) v_u_15, (copy) v_u_16
			if v_u_26 then
				v_u_26:Destroy()
			end
			task.wait(v_u_15 - 0.2)
			if v_u_16 then
				v_u_16:Destroy()
			end
		end)
	end
end
local function v_u_38(p31, p32, p33, p34, p35, p36)
	-- upvalues: (copy) v_u_8
	p32.PlaybackSpeed = p32.PlaybackSpeed + math.random(p33 * 1000, p34 * 1000) / 1000
	local v_u_37 = v_u_8:PlaySound(p31, p32, nil, p35)
	if not p36 then
		task.delay(8, function()
			-- upvalues: (copy) v_u_37
			if v_u_37 then
				v_u_37:Destroy()
			end
		end)
	end
end
local v_u_39 = nil
local function v_u_59(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_5, (ref) v_u_39, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_4, (copy) v_u_38, (copy) v_u_30, (copy) v_u_3
	if v_u_2 ~= true then
		v_u_2 = true
		game.TweenService:Create(v_u_6, TweenInfo.new(15, Enum.EasingStyle.Linear), {
			["TintColor"] = Color3.fromRGB(255, 134, 35)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(15, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(255, 136, 76),
			["ExposureCompensation"] = 0,
			["Brightness"] = 2.5
		}):Play()
		v_u_5:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
		v_u_5:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
		v_u_39 = script.FlashUI:Clone()
		v_u_39.Parent = game.Players.LocalPlayer.PlayerGui
		local v40 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 2,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.7
		}
		v_u_8:PlaySound(v_u_9.Weather.Earthquake.EarthquakeStart, v40)
		game.TweenService:Create(v_u_39.Frame, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["BackgroundTransparency"] = 0
		}):Play()
		task.wait(1)
		v_u_11.UpdateSkybox(v_u_10, 2)
		task.wait(0.25)
		v_u_4:CreateNotification("Lava is erupting from the ground!")
		game.TweenService:Create(v_u_39.Frame, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["BackgroundTransparency"] = 1
		}):Play()
		local v41 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.7
		}
		v_u_8:PlaySound(v_u_9.Weather.Eruption.EruptStart, v41)
		v_u_5:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
		v_u_5:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
		local function v58()
			-- upvalues: (ref) v_u_38, (ref) v_u_9, (ref) v_u_30, (ref) v_u_5, (ref) v_u_3
			local v_u_42 = script.EruptionCrack:Clone()
			local v43 = math.random(-225, 225)
			local v44 = math.random
			local v45 = Vector3.new(-104.5, 0.05, -13.5) + Vector3.new(v43, 0, v44(-180, 180))
			local v46 = CFrame.new(v45)
			local v47 = CFrame.Angles
			local v48 = math.random(-360, 360)
			v_u_42:PivotTo(v46 * v47(0, math.rad(v48), 0))
			v_u_42.Parent = workspace.WeatherVisuals
			v_u_42.Particle.Burst:Emit(20)
			v_u_42.Particle.Glow:Emit(1)
			v_u_42.Particle.GroundCracks:Emit(1)
			v_u_42.Particle.Rocks:Emit(12)
			v_u_42.Particle.Wave:Emit(1)
			v_u_42.Particle.Burst.Enabled = true
			local v49 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Volume"] = 0.7,
				["PlaybackSpeed"] = 1
			}
			v_u_38(v_u_9.Weather.Eruption.EruptStart, v49, -0.2, 0.2, v_u_42.Particle)
			local v50 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 2,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Volume"] = 0.7,
				["PlaybackSpeed"] = 1
			}
			v_u_38(v_u_9.Weather.Eruption.EruptStart, v50, -0.2, 0.2, v_u_42.Particle)
			v_u_30(v45, 7, 6)
			v_u_5:ScreenShake("Normal", { "Vector" }, 3, 0.3, 0.2)
			v_u_5:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.5, 0.5)
			local v51 = {}
			for _, v52 in v_u_42:GetChildren() do
				if v52:IsA("BasePart") then
					local v53 = script.BurstSmall:Clone()
					v53.Parent = v52
					v53.Enabled = true
					v52.Transparency = 0
					table.insert(v51, v53)
				end
			end
			local v54 = math.random(3, 6) / 2
			task.wait(v54)
			if v_u_42 then
				v_u_42.Particle.Burst.Enabled = false
			end
			for _, v55 in v51 do
				v55.Enabled = false
				local v56 = TweenInfo.new(v54, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
				v_u_3:Create(v55.Parent, v56, {
					["Transparency"] = 1
				}):Play()
			end
			task.wait(v54)
			for _, v57 in v51 do
				v57:Destroy()
			end
			table.clear(v51)
			task.delay(10, function()
				-- upvalues: (copy) v_u_42
				if v_u_42 then
					v_u_42:Destroy()
				end
			end)
		end
		while v_u_2 do
			if math.random(1, 3) == 1 then
				task.delay(0.5, v58)
			end
			v58()
		end
	end
end
local function v_u_61(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (ref) v_u_39, (copy) v_u_11, (copy) v_u_10
	if v_u_2 == false then
		return
	else
		v_u_2 = false
		game.TweenService:Create(v_u_6, TweenInfo.new(4), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Saturation"] = 0,
			["Brightness"] = 0,
			["Contrast"] = 0
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		local v60 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 2,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.7
		}
		v_u_8:PlaySound(v_u_9.Weather.Earthquake.EarthquakeStart, v60)
		if v_u_39 then
			v_u_39.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			game.TweenService:Create(v_u_39.Frame, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["BackgroundTransparency"] = 0
			}):Play()
			task.wait(1)
			v_u_11.UpdateSkybox(v_u_10, 0)
			task.wait(0.25)
			game.TweenService:Create(v_u_39.Frame, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["BackgroundTransparency"] = 1
			}):Play()
		else
			v_u_11.UpdateSkybox(v_u_10, 0)
		end
	end
end
workspace:GetAttributeChangedSignal("Eruption"):Connect(function()
	-- upvalues: (copy) v_u_59, (copy) v_u_61
	if workspace:GetAttribute("Eruption") then
		v_u_59()
	else
		v_u_61()
	end
end)
if workspace:GetAttribute("Eruption") then
	task.defer(function()
		-- upvalues: (copy) v_u_59
		v_u_59(true)
	end)
else
	v_u_61(true)
end
return v1