local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
game:GetService("Debris")
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_6 = script:WaitForChild("Sky"):Clone()
v_u_5.AddSkybox(v_u_6)
local v_u_7 = require(v2.Modules.Spring)
local v_u_8 = v_u_4.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = v_u_4
local _ = workspace.Terrain.Clouds
local v_u_9 = false
local function v_u_15()
	-- upvalues: (ref) v_u_9, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8
	v_u_9 = true
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
		v_u_5.UpdateSkybox(v_u_6, 2)
		local v10 = game.Workspace.BasePlate.TopBaseplate
		v_u_7.target(v10, 1, 2, {
			["Color"] = Color3.fromRGB(183, 176, 96)
		})
		v_u_7.target(game.Lighting, 1, 2, {
			["Ambient"] = Color3.fromRGB(204, 192, 157)
		})
	end)
	local v_u_11 = nil
	task.spawn(function()
		-- upvalues: (ref) v_u_11
		local v_u_12 = script:WaitForChild("ObbyTimer"):Clone()
		v_u_12.Parent = game.Players.LocalPlayer.PlayerGui
		v_u_11 = workspace:GetAttributeChangedSignal("PyramidObbyTimer"):Connect(function()
			-- upvalues: (copy) v_u_12
			local v13 = workspace:GetAttribute("PyramidObbyTimer")
			if v13 then
				v_u_12.TextLabel.Text = v13
			else
				v_u_12:Destroy()
			end
		end)
	end)
	local v_u_14 = v_u_11
	while v_u_9 do
		task.wait(0.5)
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_14
		if v_u_14 then
			v_u_14:Disconnect()
			v_u_14 = nil
		end
	end)
	v_u_5.UpdateSkybox(v_u_6, -1)
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
	v_u_3:Create(v_u_8, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
end
workspace:GetAttributeChangedSignal("PyramidObby"):Connect(function()
	-- upvalues: (copy) v_u_15, (ref) v_u_9
	if workspace:GetAttribute("PyramidObby") then
		v_u_15()
	else
		v_u_9 = false
	end
end)
if workspace:GetAttribute("PyramidObby") then
	task.defer(v_u_15)
else
	v_u_9 = false
end
return v1