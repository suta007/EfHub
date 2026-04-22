local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = false
local v_u_4 = game:GetService("TweenService")
local v_u_5 = script.Sky
local v_u_6 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_6.AddSkybox(v_u_5)
local v_u_7 = require(v2.Modules.ScreenShakeCore)
local v_u_8 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_9 = require(v2.Modules.SoundPlayer)
local v_u_10 = require(v2.Data.SoundData)
local v_u_11 = nil
local function v_u_20(p12, p13, p14, p15, p16, p17)
	-- upvalues: (copy) v_u_9
	local v18 = nil
	if p16 then
		if p16:IsA("Attachment") then
			v18 = p16.WorldPosition
		end
		if p16:IsA("BasePart") then
			v18 = p16:GetPivot().Position
		end
	end
	p13.PlaybackSpeed = p13.PlaybackSpeed + math.random(p14 * 1000, p15 * 1000) / 1000
	local v_u_19 = v_u_9:PlaySound(p12, p13, v18)
	if not p17 then
		task.delay(8, function()
			-- upvalues: (copy) v_u_19
			if v_u_19 then
				v_u_19:Destroy()
			end
		end)
	end
end
local function v_u_61(_)
	-- upvalues: (ref) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (ref) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_20, (copy) v_u_7
	if v_u_3 ~= true then
		v_u_3 = true
		v_u_6.UpdateSkybox(v_u_5, 2)
		v_u_4:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(152, 228, 255),
			["OutdoorAmbient"] = Color3.fromRGB(166, 211, 225),
			["Brightness"] = 1
		}):Play()
		v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(212, 212, 212)
		}):Play()
		local v21 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 0,
			["PlaybackSpeed"] = 0.7,
			["Looped"] = true
		}
		v_u_11 = v_u_9:PlaySound(v_u_10.Weather.Blizzard.Ambience, v21, nil, nil)
		v_u_4:Create(v_u_11, TweenInfo.new(5), {
			["Volume"] = 0.25
		}):Play()
		local v22 = script.BlizzardParticle:Clone()
		v22.Parent = workspace.WeatherVisuals
		for _, v23 in v22:GetDescendants() do
			if v23:IsA("ParticleEmitter") then
				v23.Enabled = true
			end
		end
		v_u_8:CreateNotification("Giant candy canes are falling from the sky!")
		local v24 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0)
		local v_u_25 = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
		local v_u_26 = {
			Vector3.new(92, 0, -171.4),
			Vector3.new(-174.7, 0, 28.6),
			Vector3.new(-196.7, 0, -48.4),
			Vector3.new(-251.7, 0, -163.4),
			Vector3.new(-313.7, 0, -137.4),
			Vector3.new(-166.7, 0, -195.4),
			Vector3.new(-39.7, 0, -131.4),
			Vector3.new(13.3, 0, -188.4),
			Vector3.new(70.3, 0, -57.4),
			Vector3.new(28.3, 0, -25.4),
			Vector3.new(-52.7, 0, 22.6),
			Vector3.new(41.3, 0, 139.6),
			Vector3.new(88.3, 0, 62.6),
			Vector3.new(-35.7, 0, 75.6),
			Vector3.new(-91.7, 0, 142.6),
			Vector3.new(-330.7, 0, 89.6),
			Vector3.new(-291.7, 0, 144.6),
			Vector3.new(-213.7, 0, 166.6),
			Vector3.new(-157.7, 0, 117.967),
			Vector3.new(-236.7, 0, -9.033),
			Vector3.new(-170.7, 0, -111.033),
			Vector3.new(-38.7, 0, -58.033),
			Vector3.new(-90.7, 0, -182.033)
		}
		while v_u_3 do
			if #v_u_26 > 0 then
				local v27 = math.random(1, #v_u_26)
				local v_u_28 = v_u_26[v27]
				local v_u_29 = script.GiantCandyCane:Clone()
				local v30 = CFrame.new(v_u_28 + Vector3.new(0, 100, 0))
				local v31 = CFrame.Angles
				local v32 = math.random(-15, 15)
				local v33 = math.rad(v32)
				local v34 = math.random(-360, 360)
				local v35 = math.rad(v34)
				local v36 = math.random(-15, 15)
				v_u_29:PivotTo(v30 * v31(v33, v35, (math.rad(v36))))
				v_u_29.Parent = workspace.WeatherVisuals
				local v37 = {
					["RollOffMaxDistance"] = 1000,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 0.8,
					["PlaybackSpeed"] = 0.65
				}
				v_u_20(v_u_10.Weather.FestiveNight.SnowPile.Poof, v37, -0.2, 0.2, v_u_29.PrimaryPart.Att)
				v_u_29.PrimaryPart.Att.Smoke:Emit(3)
				local v38 = v_u_4
				local v39 = v_u_29.Primary
				local v40 = {}
				local v41 = CFrame.new(v_u_28)
				local v42 = CFrame.Angles
				local v43 = math.random(-15, 15)
				local v44 = math.rad(v43)
				local v45 = math.random(-360, 360)
				local v46 = math.rad(v45)
				local v47 = math.random(-15, 15)
				v40.CFrame = v41 * v42(v44, v46, (math.rad(v47)))
				v38:Create(v39, v24, v40):Play()
				table.remove(v_u_26, v27)
				task.wait(1)
				v_u_7:ScreenShake("Normal", { "Vector" }, 1, 0.4, 0.35)
				v_u_7:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.4, 0.5)
				local v48 = {
					["RollOffMaxDistance"] = 1000,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 0.4,
					["PlaybackSpeed"] = 1,
					["TimePosition"] = 0.9
				}
				local v49 = {
					["RollOffMaxDistance"] = 1000,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 0.5,
					["PlaybackSpeed"] = 0.9,
					["TimePosition"] = 0
				}
				v_u_20(v_u_10.Weather.GiantCandyCaneRain.Land, v48, -0.2, 0.2, v_u_29.PrimaryPart.Att)
				v_u_20(v_u_10.Weather.GiantCandyCaneRain.Land, v49, -0.2, 0.2, v_u_29.PrimaryPart.Att)
				v_u_29.PrimaryPart.Burst:Emit(15)
				v_u_29.PrimaryPart.Mist:Emit(10)
				task.delay(9, function()
					-- upvalues: (copy) v_u_29, (ref) v_u_20, (ref) v_u_10, (ref) v_u_4, (copy) v_u_25, (copy) v_u_26, (copy) v_u_28
					if v_u_29 then
						for _, v50 in v_u_29:GetDescendants() do
							if v50:IsA("BasePart") and v50.Name ~= "Primary" then
								v50:ClearAllChildren()
								local v51 = {
									["RollOffMaxDistance"] = 10000,
									["RollOffMinDistance"] = 100,
									["RollOffMode"] = Enum.RollOffMode.Inverse,
									["Volume"] = 0.5,
									["PlaybackSpeed"] = 1
								}
								v_u_20(v_u_10.Weather.GiantSwordPull.Budge, v51, -0.3, 0.3, v50)
								local v52 = math.random(-40, 40)
								local v53 = math.random(40, 40)
								local v54 = math.random
								v50.AssemblyLinearVelocity = Vector3.new(v52, v53, v54(-40, 40))
								local v55 = math.random(-40, 40)
								local v56 = math.random(40, 40)
								local v57 = math.random
								v50.AssemblyAngularVelocity = Vector3.new(v55, v56, v57(-40, 40))
								task.wait(0.1)
							end
						end
						task.wait(3)
						if v_u_29 then
							for _, v58 in v_u_29:GetDescendants() do
								if v58:IsA("BasePart") and v58.Name ~= "Primary" then
									v_u_4:Create(v58, v_u_25, {
										["Size"] = Vector3.new(0, 0, 0)
									}):Play()
									task.wait(0.1)
								end
							end
						end
						task.wait(0.3)
						if v_u_29 then
							v_u_29:Destroy()
						end
					end
					local v59 = v_u_26
					local v60 = v_u_28
					table.insert(v59, v60)
				end)
				task.wait(math.random(2, 6))
			else
				task.wait(1)
			end
		end
	end
end
local function v_u_64(_)
	-- upvalues: (ref) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (ref) v_u_11
	if v_u_3 ~= false then
		v_u_3 = false
		v_u_6.UpdateSkybox(v_u_5, 0)
		v_u_4:Create(game.Lighting, TweenInfo.new(7), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_4:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(91, 154, 76)
		}):Play()
		v_u_4:Create(v_u_11, TweenInfo.new(5), {
			["Volume"] = 0
		}):Play()
		local v62 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
		if v62 then
			for _, v63 in v62:GetDescendants() do
				if v63:IsA("ParticleEmitter") then
					v63.Enabled = false
				end
			end
		end
		task.wait(5)
		v_u_11:Stop()
		if v62 then
			v62:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("GiantCandyCaneRain"):Connect(function()
	-- upvalues: (copy) v_u_61, (copy) v_u_64
	if workspace:GetAttribute("GiantCandyCaneRain") then
		v_u_61()
	else
		v_u_64()
	end
end)
if workspace:GetAttribute("GiantCandyCaneRain") then
	task.defer(function()
		-- upvalues: (copy) v_u_61
		v_u_61(true)
	end)
else
	v_u_64(true)
end
return v1