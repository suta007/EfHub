local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Modules.SoundPlayer)
local v_u_7 = require(v5.Data.SoundData)
local v_u_8 = require(game.ReplicatedStorage.Modules.Notification)
local function v_u_28(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_8:CreateNotification("The world is losing connection!")
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = Color3.fromRGB(144, 146, 255),
			["ExposureCompensation"] = 0.4,
			["Brightness"] = 0.7
		}):Play()
		v_u_3:Create(v_u_4, TweenInfo.new(3), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(204, 146, 255)
		}):Play()
		local v9 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Volume"] = 1,
			["PlaybackSpeed"] = 0.65
		}
		v_u_6:PlaySound(v_u_7.Weather.Dissonant.GlitchStart, v9)
		local v10 = script.GlitchyBaseplate:Clone()
		v10.Parent = workspace.BasePlate.TopBaseplate
		v10.Enabled = true
		local v11 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v12 = script.InvertedSphere:Clone()
		v12.Name = "GLITCHSPHERE"
		v12.Parent = workspace.WeatherVisuals
		v_u_3:Create(v12, v11, {
			["Transparency"] = 0.35
		}):Play()
		while v_u_2 do
			task.wait(math.random(1, 10) / 10)
			local v_u_13 = script.GlitchPart:Clone()
			v_u_13.Transparency = 0
			v_u_13.Parent = workspace.WeatherVisuals
			local v14 = math.random(0, 125)
			local v15 = Vector3.new(-100, v14, -50)
			local v16 = math.random(-300, 300)
			local v17 = math.random
			v_u_13.Position = v15 + Vector3.new(v16, 0, v17(-200, 200))
			local v18 = math.random(-15, 15)
			local v19 = math.random(-15, 15)
			local v20 = math.random
			v_u_13.Size = Vector3.new(v18, v19, v20(-15, 15))
			local v21 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 0.5,
				["PlaybackSpeed"] = math.random(5, 15) / 10
			}
			local v_u_22 = v_u_6:PlaySound(v_u_7.Weather.Dissonant.GlitchSound, v21, nil, v_u_13)
			v_u_13.Glitchy:Emit(math.random(1, 4))
			local v23 = v_u_3
			local v24 = {}
			local v25 = math.random(-8, 8)
			local v26 = math.random(-30, 30)
			local v27 = math.random
			v24.Size = Vector3.new(v25, v26, v27(-8, 8))
			v24.Transparency = 1
			v23:Create(v_u_13, v11, v24):Play()
			task.delay(2, function()
				-- upvalues: (copy) v_u_13, (copy) v_u_22
				if v_u_13 then
					v_u_13:Destroy()
				end
				if v_u_22 then
					v_u_22:Stop()
				end
			end)
		end
	end
end
local function v_u_30(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
	if v_u_2 ~= false then
		v_u_2 = false
		if workspace.BasePlate.TopBaseplate:FindFirstChild("GlitchyBaseplate") then
			workspace.BasePlate.TopBaseplate.GlitchyBaseplate:Destroy()
		end
		v_u_3:Create(v_u_4, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		local v29 = workspace.WeatherVisuals:FindFirstChild("GLITCHSPHERE")
		if v29 then
			v_u_3:Create(v29, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
				["Transparency"] = 1
			}):Play()
			task.wait(2)
			if v29 then
				v29:Destroy()
			end
		end
	end
end
workspace:GetAttributeChangedSignal("Dissonant"):Connect(function()
	-- upvalues: (copy) v_u_28, (copy) v_u_30
	if workspace:GetAttribute("Dissonant") then
		v_u_28()
	else
		v_u_30()
	end
end)
if workspace:GetAttribute("Dissonant") then
	task.defer(function()
		-- upvalues: (copy) v_u_28
		v_u_28(true)
	end)
else
	v_u_30(true)
end
return v1