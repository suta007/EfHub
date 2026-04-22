local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = nil
local v_u_8 = script.Sky
local v_u_9 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_9.AddSkybox(v_u_8)
local v_u_10 = Color3.new(1, 1, 1)
local function v_u_14(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (ref) v_u_10, (ref) v_u_7, (copy) v_u_5, (copy) v_u_6
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_9.UpdateSkybox(v_u_8, 2)
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(106, 223, 255),
			["OutdoorAmbient"] = Color3.fromRGB(127, 202, 225),
			["Brightness"] = 1
		}):Play()
		v_u_10 = workspace.BasePlate.TopBaseplate.Color
		v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(126, 154, 153)
		}):Play()
		local v11 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["FadeInDuration"] = 5,
			["Looped"] = true,
			["Volume"] = 0.45,
			["PlaybackSpeed"] = 0.9
		}
		v_u_7 = v_u_5:PlaySound(v_u_6.Weather.Blizzard.Ambience, v11, nil, script)
		local v12 = script.BlizzardParticle:Clone()
		v12.Parent = workspace.WeatherVisuals
		for _, v13 in v12:GetDescendants() do
			if v13:IsA("ParticleEmitter") then
				v13.Enabled = true
			end
		end
	end
end
local function v_u_18(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (ref) v_u_10, (ref) v_u_7
	if v_u_2 ~= false then
		v_u_2 = false
		v_u_9.UpdateSkybox(v_u_8, 0)
		v_u_3:Create(game.Lighting, TweenInfo.new(7), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		local v15 = {
			["Color"] = v_u_10
		}
		v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), v15):Play()
		v_u_3:Create(v_u_7, TweenInfo.new(5), {
			["Volume"] = 0
		}):Play()
		local v16 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
		if v16 then
			for _, v17 in v16:GetDescendants() do
				if v17:IsA("ParticleEmitter") then
					v17.Enabled = false
				end
			end
		end
		task.wait(5)
		v_u_7:Stop()
		if v16 then
			v16:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("Blizzard"):Connect(function()
	-- upvalues: (copy) v_u_14, (copy) v_u_18
	if workspace:GetAttribute("Blizzard") then
		v_u_14()
	else
		v_u_18()
	end
end)
if workspace:GetAttribute("Blizzard") then
	task.defer(function()
		-- upvalues: (copy) v_u_14
		v_u_14(true)
	end)
else
	v_u_18(true)
end
return v1