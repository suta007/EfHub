local v1 = {}
local v_u_2 = false
local v_u_3 = game.Lighting.ColorCorrection:Clone()
v_u_3.Name = script.Name
v_u_3.Parent = game.Lighting
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = nil
local v_u_8 = game:GetService("TweenService")
local function v_u_13(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_3, (ref) v_u_7, (copy) v_u_5, (copy) v_u_6
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_8:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = Color3.fromRGB(196, 240, 255),
			["ExposureCompensation"] = 0.4,
			["Brightness"] = 0.7
		}):Play()
		v_u_8:Create(v_u_3, TweenInfo.new(3), {
			["Contrast"] = 0.1,
			["Brightness"] = 0.05,
			["TintColor"] = Color3.fromRGB(233, 248, 255)
		}):Play()
		game.Workspace.Terrain.Clouds.Enabled = true
		v_u_8:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0.9,
			["Density"] = 0.05
		}):Play()
		local v9 = workspace.BasePlate.TopBaseplate:Clone()
		v9.Size = Vector3.new(500, 1, 400)
		v9.Position = Vector3.new(-104.5, 80, -13.5)
		v9:ClearAllChildren()
		v9.Transparency = 1
		v9.Name = "GentleDrizzlePart"
		v9.Parent = workspace.WeatherVisuals
		local v10 = script.Drops:Clone()
		v10.Parent = v9
		v10.Enabled = true
		local v11 = script.Mist:Clone()
		v11.Parent = v9
		v11.Enabled = true
		local v12 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 40,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Looped"] = true,
			["Volume"] = 0
		}
		v_u_7 = v_u_5:PlaySound(v_u_6.Weather.GentleDrizzle.Ambient, v12, nil, nil)
		v_u_8:Create(v_u_7, TweenInfo.new(3), {
			["Volume"] = 1
		}):Play()
	end
end
local function v_u_16(p14)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_3, (ref) v_u_7
	if v_u_2 == false then
		return
	else
		v_u_2 = false
		if not p14 then
			v_u_8:Create(v_u_3, TweenInfo.new(5), {
				["Contrast"] = 0,
				["Brightness"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			v_u_8:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
				["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
				["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
			}):Play()
			v_u_8:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(5), {
				["Cover"] = 0,
				["Density"] = 0
			}):Play()
			local v15 = workspace.WeatherVisuals:FindFirstChild("GentleDrizzlePart")
			if v15 then
				v15.Name = "DESTROYING"
				v15.Drops.Enabled = false
				v15.Mist.Enabled = false
			end
			v_u_8:Create(v_u_7, TweenInfo.new(3), {
				["Volume"] = 0
			}):Play()
			task.wait(5)
			v_u_7:Stop()
			if v15 then
				v15:Destroy()
			end
			game.Workspace.Terrain.Clouds.Enabled = false
		end
	end
end
workspace:GetAttributeChangedSignal("GentleDrizzle"):Connect(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_16
	if workspace:GetAttribute("GentleDrizzle") then
		v_u_13()
	else
		v_u_16()
	end
end)
if workspace:GetAttribute("GentleDrizzle") then
	task.defer(function()
		-- upvalues: (copy) v_u_13
		v_u_13(true)
	end)
elseif v_u_2 ~= false then
	v_u_2 = false
end
return v1