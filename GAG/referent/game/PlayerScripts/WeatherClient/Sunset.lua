local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v_u_5 = game.Lighting.SunRays:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
local v_u_6 = false
local function v_u_7()
	-- upvalues: (ref) v_u_6, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	v_u_6 = true
	v_u_3:CreateNotification("The sun is setting.")
	v_u_2:Create(v_u_4, TweenInfo.new(7), {
		["Contrast"] = 0.3,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 245, 220)
	}):Play()
	v_u_2:Create(game.Lighting, TweenInfo.new(7), {
		["Ambient"] = Color3.fromRGB(230, 179, 143),
		["OutdoorAmbient"] = Color3.fromRGB(225, 99, 49),
		["Brightness"] = 1,
		["ClockTime"] = 7
	}):Play()
	v_u_2:Create(v_u_5, TweenInfo.new(7), {
		["Intensity"] = 0.08,
		["Spread"] = 0.8
	}):Play()
end
local function v_u_8()
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	if v_u_6 ~= false then
		v_u_6 = false
		v_u_2:Create(v_u_4, TweenInfo.new(7), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_2:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness"),
			["ClockTime"] = 14
		}):Play()
		v_u_2:Create(v_u_5, TweenInfo.new(5), {
			["Intensity"] = 0,
			["Spread"] = 0
		}):Play()
		task.wait(7)
		if v_u_5 then
			v_u_5:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("Sunset"):Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	if workspace:GetAttribute("Sunset") then
		v_u_7()
	else
		v_u_8()
	end
end)
if workspace:GetAttribute("Sunset") == true then
	task.defer(v_u_7)
else
	v_u_8()
end
return v1