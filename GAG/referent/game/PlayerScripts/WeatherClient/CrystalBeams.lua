local v1 = {}
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_3 = script.Sky
v_u_2.AddSkybox(v_u_3)
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Looped"] = true,
	["Volume"] = 0,
	["PlaybackSpeed"] = 1
}
local v_u_8 = nil
local v_u_9 = false
local function v_u_12(p10)
	-- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_3, (ref) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	if v_u_9 == true then
		return
	else
		v_u_9 = true
		for _, v_u_11 in workspace.WeatherVisuals:WaitForChild("CrystalBeams").Crystals:GetChildren() do
			v_u_11.b1.Color = ColorSequence.new(v_u_11.Color)
			v_u_11.b2.Color = ColorSequence.new(v_u_11.Color)
			v_u_11.b3.Color = ColorSequence.new(v_u_11.Color)
			if v_u_11:GetAttribute("ACTIVE") == true then
				v_u_11.two.WorldCFrame = CFrame.new(-102.906, 140.737, -12.875)
			else
				v_u_11:GetAttributeChangedSignal("ACTIVE"):Once(function()
					-- upvalues: (copy) v_u_11
					game.TweenService:Create(v_u_11.two, TweenInfo.new(0.4), {
						["WorldCFrame"] = CFrame.new(-102.906, 140.737, -12.875)
					}):Play()
				end)
			end
		end
		game.ReplicatedStorage.Crystal_Beams.Value = true
		if p10 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(63, 77, 138),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(142, 176, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_2.UpdateSkybox(v_u_3, 4)
			v_u_8 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v_u_7, nil, nil)
			v_u_8.Volume = 0.1
		else
			task.spawn(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_8, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
				game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
					["ClockTime"] = 21
				}):Play()
				task.wait(5)
				v_u_2.UpdateSkybox(v_u_3, 4)
				game.Lighting.ClockTime = 3
				task.wait(2)
				game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
					["Ambient"] = Color3.fromRGB(64, 74, 138),
					["ExposureCompensation"] = 1,
					["Brightness"] = 0.6,
					["ClockTime"] = 16
				}):Play()
				game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
					["Brightness"] = 0.15,
					["TintColor"] = Color3.fromRGB(206, 178, 255),
					["Contrast"] = 0.1
				}):Play()
				game.Lighting.SunRays.Enabled = true
				v_u_8 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v_u_7, nil, nil)
				game.TweenService:Create(v_u_8, TweenInfo.new(1), {
					["Volume"] = 0.1
				}):Play()
				task.delay(13, function()
					game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
						["Intensity"] = 0.028
					}):Play()
				end)
			end)
		end
	end
end
local function v_u_14(p13)
	-- upvalues: (ref) v_u_9, (ref) v_u_8, (copy) v_u_2, (copy) v_u_3
	if v_u_9 == false then
		return
	else
		game.ReplicatedStorage.Crystal_Beams.Value = false
		v_u_9 = false
		if not p13 then
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0
			}):Play()
			task.wait(5)
			game.TweenService:Create(v_u_8, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(1, function()
				-- upvalues: (ref) v_u_8
				v_u_8.Parent = script
				v_u_8:Stop()
			end)
			v_u_2.UpdateSkybox(v_u_3, 0)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
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
workspace:GetAttributeChangedSignal("CrystalBeams"):Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_14
	if workspace:GetAttribute("CrystalBeams") then
		v_u_12()
	else
		v_u_14()
	end
end)
if workspace:GetAttribute("CrystalBeams") then
	task.defer(function()
		-- upvalues: (copy) v_u_12
		v_u_12(true)
	end)
elseif v_u_9 ~= false then
	game.ReplicatedStorage.Crystal_Beams.Value = false
	v_u_9 = false
end
return v1