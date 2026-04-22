local v1 = {}
local v_u_2 = game.Lighting.ColorCorrection:Clone()
v_u_2.Name = script.Name
v_u_2.Parent = game.Lighting
local v_u_3 = false
local function v5()
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	v_u_3 = true
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		game.TweenService:Create(v_u_2, TweenInfo.new(3), {
			["Saturation"] = 0,
			["Brightness"] = 0.1,
			["Contrast"] = 0.05
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3, Enum.EasingStyle.Linear), {
			["Ambient"] = Color3.fromRGB(230, 175, 121),
			["ExposureCompensation"] = 0.3,
			["Brightness"] = 1.5
		}):Play()
		local v4 = workspace.BasePlate.TopBaseplate.Color
		game.TweenService:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(3, Enum.EasingStyle.Linear), {
			["Color"] = Color3.fromRGB(124, 134, 99)
		}):Play()
		while v_u_3 do
			task.wait(0.25)
		end
		game.TweenService:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(3, Enum.EasingStyle.Linear), {
			["Color"] = v4
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(v_u_2, TweenInfo.new(4), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Saturation"] = 0,
			["Brightness"] = 0,
			["Contrast"] = 0
		}):Play()
	end)
end
workspace:GetAttributeChangedSignal("DroughtEvent"):Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_2
	if workspace:GetAttribute("DroughtEvent") then
		v_u_3 = true
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_3
			game.TweenService:Create(v_u_2, TweenInfo.new(3), {
				["Saturation"] = 0,
				["Brightness"] = 0.1,
				["Contrast"] = 0.05
			}):Play()
			game.TweenService:Create(game.Lighting, TweenInfo.new(3, Enum.EasingStyle.Linear), {
				["Ambient"] = Color3.fromRGB(230, 175, 121),
				["ExposureCompensation"] = 0.3,
				["Brightness"] = 1.5
			}):Play()
			local v6 = workspace.BasePlate.TopBaseplate.Color
			game.TweenService:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(3, Enum.EasingStyle.Linear), {
				["Color"] = Color3.fromRGB(124, 134, 99)
			}):Play()
			while v_u_3 do
				task.wait(0.25)
			end
			game.TweenService:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(3, Enum.EasingStyle.Linear), {
				["Color"] = v6
			}):Play()
			game.TweenService:Create(game.Lighting, TweenInfo.new(4), {
				["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
				["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
				["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
			}):Play()
			game.TweenService:Create(v_u_2, TweenInfo.new(4), {
				["TintColor"] = Color3.fromRGB(255, 255, 255),
				["Saturation"] = 0,
				["Brightness"] = 0,
				["Contrast"] = 0
			}):Play()
		end)
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("DroughtEvent") then
	task.defer(v5)
else
	v_u_3 = false
end
return v1