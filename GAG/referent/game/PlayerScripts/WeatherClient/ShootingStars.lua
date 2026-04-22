local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local _ = workspace.CurrentCamera
local v_u_4 = require(v_u_2.Modules.SkyboxManager)
local v_u_5 = require(v_u_2.Modules.SoundPlayer)
local v_u_6 = require(v_u_2.Data.SoundData)
local v_u_7 = script.Sky
v_u_4.AddSkybox(v_u_7)
local v_u_8 = nil
local v_u_9 = false
local function v_u_20(p10)
	-- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (ref) v_u_8
	if v_u_9 == true then
		return
	else
		v_u_9 = true
		v_u_2.Shooting_Stars.Value = true
		task.delay(10, function()
			-- upvalues: (ref) v_u_9, (ref) v_u_2, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3
			if v_u_9 == true then
				while v_u_9 == true do
					task.spawn(function()
						-- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3
						local v11 = v_u_2.ShootingStar:Clone()
						local v12 = math.random(350, 550)
						local v13 = math.random
						v11.Position = Vector3.new(-4000, v12, v13(-1000, 1000))
						v11.Parent = workspace.WeatherVisuals
						if math.random(1, 2) == 1 then
							v_u_5:PlaySound(v_u_6.Weather.ShootingStars.Starfall, {
								["PlaybackSpeed"] = 0.9 + math.random(-66, 15) * 0.01,
								["Looped"] = true
							}, nil, v11)
						end
						local v14 = math.random(13, 22)
						local v15 = v_u_3
						local v16 = TweenInfo.new(v14, Enum.EasingStyle.Linear)
						local v17 = {}
						local v18 = v11.Position
						local v19 = math.random
						v17.Position = v18 + Vector3.new(8000, -100, v19(-50, 50))
						v15:Create(v11, v16, v17):Play()
						task.wait(v14)
						v11:Destroy()
					end)
					task.wait(math.random(25, 75) * 0.01)
				end
			end
		end)
		if p10 then
			game.Lighting.ClockTime = 16
			v_u_3:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(63, 77, 138),
				["ExposureCompensation"] = 0.7,
				["Brightness"] = 0.6
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(102, 138, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_4.UpdateSkybox(v_u_7, 4)
			v_u_8 = v_u_5:PlaySound(v_u_6.Weather.ShootingStars.Ambience, {
				["Looped"] = true,
				["Volume"] = 0.1
			}, nil, nil, { "LazyLoadSound" })
		else
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_4.UpdateSkybox(v_u_7, 4)
			game.Lighting.ClockTime = 3
			task.wait(2)
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(64, 74, 138),
				["ExposureCompensation"] = 0.5,
				["Brightness"] = 0.6,
				["ClockTime"] = 16
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(201, 211, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			v_u_8 = v_u_5:PlaySound(v_u_6.Weather.ShootingStars.Ambience, {
				["Looped"] = true
			}, nil, nil, { "LazyLoadSound" })
			v_u_3:Create(v_u_8, TweenInfo.new(1), {
				["Volume"] = 0.1
			}):Play()
			task.delay(13, function()
				-- upvalues: (ref) v_u_3
				v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(2), {
					["Intensity"] = 0.028
				}):Play()
			end)
		end
	end
end
local function v_u_22(p21)
	-- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_3, (ref) v_u_8, (copy) v_u_4, (copy) v_u_7
	if v_u_9 == false then
		return
	else
		v_u_2.Shooting_Stars.Value = false
		v_u_9 = false
		if not p21 then
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0
			}):Play()
			task.wait(5)
			v_u_3:Create(v_u_8, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(1, function()
				-- upvalues: (ref) v_u_8
				v_u_8.Parent = script
				v_u_8:Stop()
			end)
			v_u_4.UpdateSkybox(v_u_7, 0)
			game.Lighting.ClockTime = 3
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 138, 138),
				["ExposureCompensation"] = 0.2,
				["Brightness"] = 2,
				["ClockTime"] = 14
			}):Play()
			task.delay(6, function()
				game.Lighting.SunRays.Enabled = false
			end)
		end
	end
end
workspace:GetAttributeChangedSignal("ShootingStars"):Connect(function()
	-- upvalues: (copy) v_u_20, (copy) v_u_22
	if workspace:GetAttribute("ShootingStars") then
		v_u_20()
	else
		v_u_22()
	end
end)
if workspace:GetAttribute("ShootingStars") then
	task.defer(function()
		-- upvalues: (copy) v_u_20
		v_u_20(true)
	end)
elseif v_u_9 ~= false then
	v_u_2.Shooting_Stars.Value = false
	v_u_9 = false
end
return v1