local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.SoundPlayer)
local v_u_4 = require(v2.Data.SoundData)
local v_u_5 = script.Sky
local v_u_6 = require(game.ReplicatedStorage.Modules.SkyboxManager)
Random.new()
local v_u_7 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate") or error("For some weird reason baseplate is missing????")
local v_u_8 = Vector2.new(v_u_7.Size.X, v_u_7.Size.Z)
local v9 = workspace.Farm:GetChildren()
local v_u_10 = {}
local v_u_11 = nil
local v_u_12 = false
local v_u_13 = nil
local v14 = {}
for _, v15 in pairs(v9) do
	local v16 = v15:FindFirstChild("PetArea")
	if v16 then
		local v17 = v16.Size.X / 2
		local _ = v16.Size.Z / 2
		local v18 = math.pow(v17, 2) + math.pow(v17, 2)
		local v19 = math.sqrt(v18)
		local v20 = v16.Position
		local _ = v20.Y
		table.insert(v_u_10, {
			["Range"] = v19,
			["Pos"] = v20
		})
	end
end
v_u_6.AddSkybox(v_u_5)
local v_u_21 = {
	Color3.fromRGB(192, 43, 233),
	Color3.fromRGB(233, 55, 55),
	Color3.fromRGB(52, 233, 124),
	Color3.fromRGB(233, 148, 30),
	Color3.fromRGB(63, 114, 233),
	Color3.fromRGB(255, 233, 105),
	Color3.fromRGB(255, 23, 23),
	Color3.fromRGB(138, 185, 255)
}
local v_u_22 = {
	CFrame.new(128.576, 0, 114.499),
	CFrame.new(102.076, 0, 52.099),
	CFrame.new(70.976, 0, 151.899),
	CFrame.new(-3.124, 0, 167.299),
	CFrame.new(-18.524, 0, 17.999),
	CFrame.new(-34.024, 0, 84.699),
	CFrame.new(71.576, 0, -7.401),
	CFrame.new(129.976, 0, -44.201),
	CFrame.new(111.076, 0, -105.201),
	CFrame.new(88.076, 0, -179.201),
	CFrame.new(-33.124, 0, -69.301),
	CFrame.new(-204.324, 0, -13.401),
	CFrame.new(-169.924, 0, 79.199),
	CFrame.new(-217.124, 0, 149.999),
	CFrame.new(-317.224, 0, 82.599),
	CFrame.new(-317.224, 0, -172.501),
	CFrame.new(-161.224, 0, -190.601),
	CFrame.new(-161.224, 0, -57.701),
	CFrame.new(-33.824, 0, -147.201),
	CFrame.new(-85.424, 0, 19.699),
	CFrame.new(127.576, 0, -51.901)
}
local function v_u_52(p23)
	-- upvalues: (ref) v_u_12, (copy) v_u_6, (copy) v_u_5, (ref) v_u_13, (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_22, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_21, (ref) v_u_11
	if v_u_12 ~= true then
		v_u_12 = true
		if p23 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(59, 87, 93),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_6.UpdateSkybox(v_u_5, 4)
			local v24 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.45,
				["PlaybackSpeed"] = 0.9
			}
			v_u_13 = v_u_3:PlaySound(v_u_4.Weather.Blizzard.Ambience, v24, nil, nil)
			v_u_13.Volume = 0.45
			workspace.BasePlate.TopBaseplate.Color = Color3.fromRGB(255, 255, 255)
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_6.UpdateSkybox(v_u_5, 4)
			game.Lighting.ClockTime = 3
			task.wait(2)
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(107, 151, 255),
				["OutdoorAmbient"] = Color3.fromRGB(169, 129, 225),
				["Brightness"] = 0.25,
				["ClockTime"] = 16
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.1,
				["TintColor"] = Color3.fromRGB(120, 168, 170),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			local v25 = {
				["RollOffMaxDistance"] = 1000,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Looped"] = true,
				["Volume"] = 0.001,
				["PlaybackSpeed"] = 0.9
			}
			v_u_13 = v_u_3:PlaySound(v_u_4.Weather.Blizzard.Ambience, v25, nil, nil)
			v_u_1:Create(v_u_13, TweenInfo.new(5), {
				["Volume"] = 0.45
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0.028
			}):Play()
			v_u_1:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
				["Color"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		end
		local v26 = script.BlizzardParticle:Clone()
		v26.Parent = workspace.WeatherVisuals
		for _, v27 in v26:GetChildren() do
			v27.Enabled = true
		end
		local v28 = script.Parent.Dissonant.InvertedSphere:Clone()
		v28.Name = "SNOWSPHERE"
		v28.Parent = workspace.WeatherVisuals
		v28.Color = Color3.fromRGB(59, 87, 93)
		v_u_1:Create(v28, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
			["Transparency"] = 0
		}):Play()
		task.spawn(function()
			-- upvalues: (ref) v_u_22, (ref) v_u_10, (ref) v_u_7, (ref) v_u_8, (ref) v_u_21, (ref) v_u_3, (ref) v_u_4
			local v29 = Instance.new("Model")
			v29.Name = "SnowPiles"
			v29.Parent = workspace.WeatherVisuals
			for _, _ in v_u_22 do
				task.wait(0.4)
				local v30 = script.SnowPile:Clone()
				v30:ScaleTo(Random.new():NextNumber(0.8, 1.2))
				local function v34(p31)
					-- upvalues: (ref) v_u_10
					local v32 = Vector2.new(p31.X, p31.Z)
					for _, v33 in ipairs(v_u_10) do
						if (v32 - Vector2.new(v33.Pos.X, v33.Pos.Z)).Magnitude < v33.Range then
							return true
						end
					end
					return false
				end
				local v35 = nil
				local v36 = 0
				while v35 == nil and v36 < 100 do
					local v37 = (v_u_7:GetPivot() * CFrame.new(math.random(-(v_u_8.X / 2 + 3), v_u_8.X / 2 - 3), v_u_7.Size.Y / 2, math.random(-(v_u_8.Y / 2 + 3), v_u_8.Y / 2 - 3))).Position
					if v34(v37) then
						v37 = v35
					end
					v36 = v36 + 1
					v35 = v37
				end
				if v35 ~= nil then
					local v38 = CFrame.new(v35)
					local v39 = CFrame.Angles
					local v40 = Random.new():NextNumber(-360, 360)
					v30:PivotTo(v38 * v39(0, math.rad(v40), 0))
					if math.random(1, 4) == 1 then
						for _, v41 in v30.Lights:GetChildren() do
							v41.Color = v_u_21[math.random(1, #v_u_21)]
						end
					end
					if math.random(1, 2) == 1 then
						local v42 = script.Present:Clone()
						local v43 = v30:GetPivot() * CFrame.new(math.random(-2, 2) * 3, -0.3, math.random(-2, 2) * 3)
						local v44 = CFrame.Angles
						local v45 = Random.new():NextNumber(-10, 10)
						local v46 = math.rad(v45)
						local v47 = Random.new():NextNumber(-360, 360)
						local v48 = math.rad(v47)
						local v49 = Random.new():NextNumber(-10, 10)
						v42:PivotTo(v43 * v44(v46, v48, (math.rad(v49))))
						v42.Parent = v30
					end
					v30.Parent = v29
					v30:WaitForChild("Main"):WaitForChild("Smoke"):Emit(2)
					local v50 = {
						["RollOffMaxDistance"] = 1000,
						["RollOffMinDistance"] = 1,
						["RollOffMode"] = Enum.RollOffMode.Linear,
						["Volume"] = 2,
						["PlaybackSpeed"] = math.random(5, 8) / 10
					}
					v_u_3:PlaySound(v_u_4.Weather.FestiveNight.SnowPile.Poof, v50)
					task.wait()
				end
			end
		end)
		local v51 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 1,
			["Volume"] = 0
		}
		v_u_11 = v_u_3:PlaySound(v_u_4.Weather.FestiveNight.FestiveBells, v51, nil, nil)
		v_u_1:Create(v_u_11, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
			["Volume"] = 0.5
		}):Play()
		task.wait(1)
		v_u_1:Create(v_u_11, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
			["Volume"] = 0
		}):Play()
		while v_u_12 do
			task.wait(math.random(10, 20))
			v51.Volume = 0
			v_u_11 = v_u_3:PlaySound(v_u_4.Weather.FestiveNight.FestiveBells, v51, nil, nil)
			v_u_1:Create(v_u_11, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
				["Volume"] = 0.5
			}):Play()
			task.wait(1)
			v_u_1:Create(v_u_11, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
				["Volume"] = 0
			}):Play()
		end
	end
end
local function v_u_59(_)
	-- upvalues: (ref) v_u_12, (copy) v_u_1, (ref) v_u_13, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	if v_u_12 ~= false then
		v_u_12 = false
		game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
			["ClockTime"] = 3
		}):Play()
		game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
			["Intensity"] = 0
		}):Play()
		local v53 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
		if v53 then
			for _, v54 in v53:GetChildren() do
				v54.Enabled = false
			end
		end
		v_u_1:Create(v_u_13, TweenInfo.new(5), {
			["Volume"] = 0
		}):Play()
		local v55 = workspace.WeatherVisuals:FindFirstChild("SNOWSPHERE")
		if v55 then
			v_u_1:Create(v55, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
				["Transparency"] = 1
			}):Play()
		end
		task.wait(5)
		if v55 then
			v55:Destroy()
		end
		v_u_6.UpdateSkybox(v_u_5, 0)
		game.Lighting.ClockTime = 3
		game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness"),
			["ClockTime"] = 14
		}):Play()
		v_u_1:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_4
			local v56 = workspace.WeatherVisuals:FindFirstChild("SnowPiles")
			if v56 then
				for _, v57 in v56:GetChildren() do
					v57:WaitForChild("Main"):WaitForChild("Smoke"):Emit(2)
					local v58 = {
						["RollOffMaxDistance"] = 1000,
						["RollOffMinDistance"] = 1,
						["RollOffMode"] = Enum.RollOffMode.Linear,
						["Volume"] = 2,
						["PlaybackSpeed"] = math.random(5, 8) / 10
					}
					v_u_3:PlaySound(v_u_4.Weather.FestiveNight.SnowPile.Poof, v58, nil, v57.Main)
					v57.Main.Transparency = 1
					v57.One:Destroy()
					v57.Two:Destroy()
					if v57:FindFirstChild("Present") then
						v57.Present:Destroy()
					end
					if v57:FindFirstChild("Lights") then
						v57.Lights:Destroy()
					end
					task.wait()
				end
			end
			task.wait(3)
			if v56 then
				v56:Destroy()
			end
		end)
		game.Lighting.SunRays.Enabled = false
		v_u_13:Stop()
		if v53 then
			v53:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("FestiveNight"):Connect(function()
	-- upvalues: (copy) v_u_52, (copy) v_u_59
	if workspace:GetAttribute("FestiveNight") then
		v_u_52()
	else
		v_u_59()
	end
end)
if workspace:GetAttribute("FestiveNight") then
	task.defer(function()
		-- upvalues: (copy) v_u_52
		v_u_52(true)
	end)
else
	v_u_59(true)
end
return v14