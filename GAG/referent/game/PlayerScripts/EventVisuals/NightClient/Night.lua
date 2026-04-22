local v1 = {}
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_3 = script.Sky
v_u_2.AddSkybox(v_u_3)
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = nil
local v_u_8 = false
v_u_3:GetPropertyChangedSignal("Parent"):Connect(function() end)
local function v_u_12(p9)
	-- upvalues: (ref) v_u_8, (copy) v_u_2, (copy) v_u_3, (ref) v_u_7, (copy) v_u_5, (copy) v_u_6
	if v_u_8 == true then
		return
	else
		v_u_8 = true
		if p9 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(110, 61, 138),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(206, 178, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_2.UpdateSkybox(v_u_3, 4)
			local v10 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 0.1,
				["PlaybackSpeed"] = 1
			}
			v_u_7 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v10, nil, workspace)
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_2.UpdateSkybox(v_u_3, 4)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(110, 61, 138),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6,
				["ClockTime"] = 16
			}):Play()
			game.Lighting:SetAttribute("DefaultAmbient", Color3.fromRGB(110, 61, 138))
			game.Lighting:SetAttribute("DefaultExposure", 1)
			game.Lighting:SetAttribute("DefaultBrightness", 0.6)
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(206, 178, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			local v11 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 0,
				["PlaybackSpeed"] = 1
			}
			v_u_7 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v11, nil, workspace)
			game.TweenService:Create(v_u_7, TweenInfo.new(1), {
				["Volume"] = 0.1
			}):Play()
			task.delay(13, function()
				game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
					["Intensity"] = 0.028
				}):Play()
			end)
		end
	end
end
local function v_u_14(p13)
	-- upvalues: (ref) v_u_8, (ref) v_u_7, (copy) v_u_2, (copy) v_u_3
	if v_u_8 == false then
		return
	else
		v_u_8 = false
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
			game.TweenService:Create(v_u_7, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(1, function()
				-- upvalues: (ref) v_u_7
				v_u_7.Parent = script
				v_u_7:Stop()
			end)
			v_u_2.UpdateSkybox(v_u_3, 0)
			game.Lighting.ClockTime = 3
			game.Lighting:SetAttribute("DefaultAmbient", Color3.fromRGB(138, 138, 138))
			game.Lighting:SetAttribute("DefaultExposure", 0.2)
			game.Lighting:SetAttribute("DefaultBrightness", 2)
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
workspace:GetAttributeChangedSignal("NightEvent"):Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_14
	if workspace:GetAttribute("NightEvent") then
		v_u_12()
	else
		v_u_14()
	end
end)
if workspace:GetAttribute("NightEvent") then
	task.defer(function()
		-- upvalues: (copy) v_u_12
		v_u_12(true)
	end)
elseif v_u_8 ~= false then
	v_u_8 = false
end
return v1