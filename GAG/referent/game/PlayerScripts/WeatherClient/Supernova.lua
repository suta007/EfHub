local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local _ = game.Players.LocalPlayer.Character
local v_u_5 = require(v4.Modules.ScreenShakeCore)
local v_u_6 = require(v4.Modules.Notification)
local v_u_7 = require(v4.Modules.SoundPlayer)
local v_u_8 = require(v4.Data.SoundData)
local v_u_9 = nil
local v_u_10 = {
	Color3.fromRGB(255, 129, 238),
	Color3.fromRGB(123, 255, 132),
	Color3.fromRGB(119, 173, 255),
	Color3.fromRGB(126, 61, 255),
	Color3.fromRGB(255, 105, 105),
	Color3.fromRGB(255, 173, 106)
}
local function v_u_16(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (ref) v_u_9, (copy) v_u_5, (copy) v_u_10
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_6:CreateNotification("A Super Nova is happening in the center of the map. Look up!")
		local v11 = script.SupernovaEffect:Clone()
		v11.Parent = workspace.WeatherVisuals
		v11.Attachment.Grow:Emit(1)
		v11.Attachment.GrowStar:Emit(1)
		local v12 = v_u_7:PlaySound(v_u_8.Weather.Supernova.Start1, nil, nil, v11)
		local v13 = TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
		v_u_3:Create(v12, v13, {
			["Volume"] = 0
		}):Play()
		task.wait(5)
		v11.Flashes.TimeScale = 0
		v11.Flashes.Rate = 0
		v11.Flashes.Enabled = true
		v_u_3:Create(v11.Flashes, v13, {
			["TimeScale"] = 1,
			["Rate"] = 25
		}):Play()
		task.wait(5)
		v11.Flashes.Enabled = false
		v11.Attachment.Implode:Emit(1)
		v11.Attachment.Stars:Emit(30)
		v11.Attachment.Wave:Emit(1)
		v11.Attachment.Wave2:Emit(2)
		v11.Attachment.Wave3.Enabled = true
		v_u_9 = v_u_7:PlaySound(v_u_8.Weather.Supernova.Ambience, {
			["Looped"] = true,
			["PlaybackSpeed"] = 0.5
		})
		v_u_7:PlaySound(v_u_8.Weather.Supernova.Boom1, {
			["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000
		}, nil, v11)
		v_u_7:PlaySound(v_u_8.Weather.Supernova.Boom2, {
			["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000,
			["Volume"] = 0.6
		}, nil, v11)
		v_u_5:ScreenShake("Normal", { "Vector" }, 3, 1, 0.6)
		v_u_5:ScreenShake("Normal", { "Tilt", 15 }, 8, 1.5, 0.8)
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(150, 126, 230),
			["OutdoorAmbient"] = Color3.fromRGB(159, 143, 225),
			["Brightness"] = 1,
			["ClockTime"] = 1
		}):Play()
		v11.Aura["Sparkle" .. 1].Enabled = true
		v11.Aura["Sparkle" .. 2].Enabled = true
		v11.Aura["Sparkle" .. 3].Enabled = true
		v11.Aura["Sparkle" .. 4].Enabled = true
		v11.Aura["Sparkle" .. 5].Enabled = true
		v11.Aura["Sparkle" .. 6].Enabled = true
		v11.Aura.Stars.Enabled = true
		v11.Aura.Stars2.Enabled = true
		v11.Attachment.Lines1.Enabled = true
		v11.Attachment.Lines2.Enabled = true
		local v14 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		for _ = 1, 6 do
			local v_u_15 = script.Parent.Dissonant.InvertedSphere:Clone()
			v_u_15.Position = v11.Position
			v_u_15.Color = v_u_10[math.random(1, #v_u_10)]
			v_u_15.Size = Vector3.new(0, 0, 0)
			v_u_15.Transparency = 0
			v_u_15.Parent = v11
			v_u_3:Create(v_u_15, v14, {
				["Size"] = Vector3.new(1500, 1500, 1500),
				["Transparency"] = 1
			}):Play()
			task.delay(2, function()
				-- upvalues: (copy) v_u_15
				if v_u_15 then
					v_u_15:Destroy()
				end
			end)
			task.wait(0.35)
		end
		v11.Attachment.Lines1.Enabled = false
		task.wait(2)
		v11.Attachment.Lines2.Enabled = false
	end
end
local function v_u_21(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_3, (ref) v_u_9
	if v_u_2 ~= false then
		v_u_2 = false
		v_u_3:Create(v_u_9, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
			["Volume"] = 0
		}):Play()
		local v17 = workspace.WeatherVisuals:FindFirstChild("SupernovaEffect")
		if v17 then
			for _, v18 in v17.Aura:GetChildren() do
				v18.Enabled = false
			end
			for _, v19 in v17.Attachment:GetChildren() do
				v19.Enabled = false
			end
			task.wait(10)
			v_u_9:Stop()
			if v17 then
				v17:Destroy()
			end
		end
		local v20 = game:GetService("TweenService")
		v20:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = Color3.fromRGB(138, 138, 138),
			["Brightness"] = 2,
			["ClockTime"] = 14,
			["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
			["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
			["EnvironmentDiffuseScale"] = 0,
			["EnvironmentSpecularScale"] = 0,
			["ExposureCompensation"] = 0,
			["GeographicLatitude"] = 29.475,
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
		}):Play()
		v20:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255),
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
		v20:Create(game.Lighting.ColorCorrection, TweenInfo.new(3), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v20:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(91, 154, 76)
		}):Play()
	end
end
workspace:GetAttributeChangedSignal("Supernova"):Connect(function()
	-- upvalues: (copy) v_u_16, (copy) v_u_21
	if workspace:GetAttribute("Supernova") then
		v_u_16()
	else
		v_u_21()
	end
end)
if workspace:GetAttribute("Supernova") then
	task.defer(function()
		-- upvalues: (copy) v_u_16
		v_u_16(true)
	end)
else
	v_u_21(true)
end
return v1