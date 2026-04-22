local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
game:GetService("Debris")
require(v2.Modules.SkyboxManager)
local v_u_5 = v_u_4.ColorCorrection:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = v_u_4
local v_u_6 = false
local v_u_7 = require(v2.Modules.Spring)
local function v_u_9()
	-- upvalues: (ref) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	v_u_6 = true
	local v8 = workspace:WaitForChild("RainDance_Rig")
	if v8 then
		v_u_7.target(v8, 0.8, 1, {
			["Pivot"] = v8:GetPivot() * CFrame.new(0, 190, 0)
		})
		if game.Lighting:FindFirstChild("Cartoon") then
			v_u_7.target(game.Lighting.Cartoon, 0.7, 1, {
				["SkyboxOrientation"] = Vector3.new(180, 0, 0)
			})
		end
		v_u_3:Create(v_u_4, TweenInfo.new(1), {
			["Ambient"] = Color3.fromRGB(138, 138, 138),
			["Brightness"] = 2,
			["ClockTime"] = 14,
			["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
			["ColorShift_Top"] = Color3.fromRGB(180, 216, 255),
			["EnvironmentDiffuseScale"] = 0,
			["EnvironmentSpecularScale"] = 0,
			["ExposureCompensation"] = 0,
			["GeographicLatitude"] = 29.475,
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
			["Density"] = 0.303,
			["Offset"] = 0,
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
		v_u_3:Create(v_u_5, TweenInfo.new(1), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(231, 249, 255)
		}):Play()
		while v_u_6 do
			task.wait(0.5)
		end
		v_u_3:Create(v_u_4, TweenInfo.new(3), {
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
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255),
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
		v_u_3:Create(v_u_5, TweenInfo.new(3), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		if game.Lighting:FindFirstChild("Cartoon") then
			v_u_7.target(game.Lighting.Cartoon, 0.7, 3, {
				["SkyboxOrientation"] = Vector3.new(20, 0, 0)
			})
		end
	end
end
local function v10()
	if not workspace:GetAttribute("RainDance_Activate") then
	end
end
workspace:GetAttributeChangedSignal("RainDance"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_6
	if workspace:GetAttribute("RainDance") then
		v_u_9()
	else
		v_u_6 = false
	end
end)
if workspace:GetAttribute("RainDance") then
	task.defer(v_u_9)
else
	v_u_6 = false
end
workspace:GetAttributeChangedSignal("RainDance_Activate"):Connect(v10)
return v1