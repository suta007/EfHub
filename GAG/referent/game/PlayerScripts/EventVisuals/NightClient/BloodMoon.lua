local v1 = game:GetService("ReplicatedStorage")
local v2 = {}
local _ = workspace.CurrentCamera
local v_u_3 = require(v1.Modules.SkyboxManager)
local v_u_4 = require(v1.Modules.SoundPlayer)
local v_u_5 = require(v1.Data.SoundData)
local v_u_6 = script.Sky
v_u_3.AddSkybox(v_u_6)
local v_u_7 = nil
local v_u_8 = false
v_u_6:GetPropertyChangedSignal("Parent"):Connect(function()
	print("Test")
end)
local _ = game.SoundService.Blood_Moon_SFX
local function v_u_10(p9)
	-- upvalues: (ref) v_u_8, (copy) v_u_3, (copy) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5
	if v_u_8 == true then
		return
	else
		v_u_8 = true
		if p9 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(138, 107, 107),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6,
				["OutdoorAmbient"] = Color3.fromRGB(62, 16, 16)
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.05,
				["TintColor"] = Color3.fromRGB(255, 226, 226),
				["Contrast"] = 0.1
			}):Play()
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(0.1), {
				["Density"] = 0.357,
				["Offset"] = 0.721
			}):Play()
			game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(0.1), {
				["Cover"] = 0.657,
				["Density"] = 1,
				["Color"] = Color3.fromRGB(45, 1, 1)
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_3.UpdateSkybox(v_u_6, 4)
			v_u_7 = v_u_4:PlaySound(v_u_5.Events.BloodMoon.Ambience, {
				["Looped"] = true,
				["Volume"] = 0.1
			}, nil, workspace, { "LazyLoadSound" })
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_3.UpdateSkybox(v_u_6, 4)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 107, 107),
				["ExposureCompensation"] = 0.6,
				["Brightness"] = 0.6,
				["ClockTime"] = 16,
				["OutdoorAmbient"] = Color3.fromRGB(62, 16, 16)
			}):Play()
			game.Lighting:SetAttribute("DefaultAmbient", Color3.fromRGB(138, 107, 107))
			game.Lighting:SetAttribute("DefaultExposure", 1)
			game.Lighting:SetAttribute("DefaultBrightness", 0.6)
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(5), {
				["Density"] = 0.357,
				["Offset"] = 0.721
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.05,
				["TintColor"] = Color3.fromRGB(255, 203, 158),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			v_u_7 = v_u_4:PlaySound(v_u_5.Events.BloodMoon.Ambience, {
				["Looped"] = true
			}, nil, workspace, { "LazyLoadSound" })
			game.TweenService:Create(v_u_7, TweenInfo.new(1), {
				["Volume"] = 0.1
			}):Play()
			game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(5), {
				["Cover"] = 0.657,
				["Density"] = 1,
				["Color"] = Color3.fromRGB(45, 1, 1)
			}):Play()
			task.delay(5, function()
				game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
					["Intensity"] = 0.01
				}):Play()
			end)
		end
	end
end
local function v_u_12(p11)
	-- upvalues: (ref) v_u_8, (ref) v_u_7, (copy) v_u_3, (copy) v_u_6
	if v_u_8 == false then
		return
	else
		v_u_8 = false
		if not p11 then
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
			game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(5), {
				["Density"] = 0,
				["Offset"] = 0
			}):Play()
			game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(5), {
				["Cover"] = 0,
				["Density"] = 0,
				["Color"] = Color3.fromRGB(22, 40, 70)
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
			v_u_3.UpdateSkybox(v_u_6, 0)
			game.Lighting.ClockTime = 3
			game.Lighting:SetAttribute("DefaultAmbient", Color3.fromRGB(138, 138, 138))
			game.Lighting:SetAttribute("DefaultExposure", 0.2)
			game.Lighting:SetAttribute("DefaultBrightness", 2)
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 138, 138),
				["ExposureCompensation"] = 0.2,
				["Brightness"] = 2,
				["ClockTime"] = 14,
				["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
			}):Play()
			task.delay(6, function()
				game.Lighting.SunRays.Enabled = false
			end)
		end
	end
end
workspace:GetAttributeChangedSignal("BloodMoonEvent"):Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_12
	if workspace:GetAttribute("BloodMoonEvent") then
		v_u_10(workspace:GetAttribute("Instant"))
	else
		v_u_12()
	end
end)
if workspace:GetAttribute("BloodMoonEvent") then
	task.defer(function()
		-- upvalues: (copy) v_u_10
		v_u_10(true)
	end)
elseif v_u_8 ~= false then
	v_u_8 = false
end
return v2