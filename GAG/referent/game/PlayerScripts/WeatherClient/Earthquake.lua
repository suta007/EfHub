local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = v_u_4.new(Enum.RenderPriority.Camera.Value, function(p5)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p5
end)
v_u_6:Start()
local v_u_7 = require(game.ReplicatedStorage.Modules.Notification)
local v8 = game:GetService("ReplicatedStorage")
local v_u_9 = require(v8.Modules.SoundPlayer)
local v_u_10 = require(v8.Data.SoundData)
local v_u_11 = nil
local function v_u_40(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (ref) v_u_11
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_7:CreateNotification("An earthquake is happening!")
		v_u_6:ShakeSustain(v_u_4.Presets.WeakEarthquake)
		local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		local v13 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Looped"] = true,
			["Volume"] = 0.2,
			["Volume"] = 0
		}
		local v14 = v_u_9:PlaySound(v_u_10.Weather.Earthquake.EarthquakeLoop, v13, nil, nil)
		local v15 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
		v_u_3:Create(v14, v15, {
			["Volume"] = 0.2
		}):Play()
		local v16 = script.TopPlate:Clone()
		v16.Parent = workspace
		v16.Particle1.Enabled = true
		v16.Particle2.Enabled = true
		local v17 = script.EarthquakeCracks:Clone()
		v17.Name = "EarthquakeVisuals"
		v17.Parent = workspace.WeatherVisuals
		for v18 = 1, 22 do
			local v_u_19 = v17:WaitForChild((tostring(v18)))
			local v20 = v_u_19.Position
			local v21 = v_u_19.Size
			v_u_19.CFrame = v_u_19.CFrame * CFrame.new(0, 0, v21.Z / 2)
			local v22 = v21.X
			local v23 = v21.Y
			v_u_19.Size = Vector3.new(v22, v23, 0)
			v_u_19.Transparency = 0
			v_u_3:Create(v_u_19, v12, {
				["Size"] = v21,
				["Position"] = v20
			}):Play()
			local v_u_24 = #v_u_19:GetChildren()
			if v_u_24 > 0 then
				task.delay(0.15, function()
					-- upvalues: (copy) v_u_24, (copy) v_u_19, (ref) v_u_3, (ref) v_u_11, (ref) v_u_9, (ref) v_u_10
					local v25 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
					for v26 = 1, v_u_24 do
						local v27 = v_u_19:WaitForChild((tostring(v26)))
						local v28 = v27.Position
						local v29 = v27.Size
						v27.CFrame = v27.CFrame * CFrame.new(0, 0, v29.Z / 2)
						local v30 = v29.X
						local v31 = v29.Y
						v27.Size = Vector3.new(v30, v31, 0)
						v27.Transparency = 0
						v_u_3:Create(v27, v25, {
							["Size"] = v29,
							["Position"] = v28
						}):Play()
						local v32 = script.Particle1:Clone()
						local v33 = script.Particle2:Clone()
						v32.Parent = v27
						v32.Enabled = true
						v33.Parent = v27
						v33.Enabled = true
						local v34 = {
							["RollOffMaxDistance"] = 10000,
							["RollOffMinDistance"] = 10,
							["RollOffMode"] = Enum.RollOffMode.Inverse,
							["Volume"] = 3,
							["PlaybackSpeed"] = math.random(7, 13) / 10
						}
						v_u_11 = v_u_9:PlaySound(v_u_10.Weather.Earthquake.EarthquakeLoop, v34, nil, v27)
						task.wait(0.3)
						if v32 then
							v32.Enabled = false
						end
						if v33 then
							v33.Enabled = false
						end
					end
				end)
			end
			local v35 = script.Particle1:Clone()
			local v36 = script.Particle2:Clone()
			v35.Parent = v_u_19
			v35.Enabled = true
			v36.Parent = v_u_19
			v36.Enabled = true
			local v37 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 3,
				["PlaybackSpeed"] = math.random(7, 13) / 10
			}
			v_u_11 = v_u_9:PlaySound(v_u_10.Weather.Earthquake.EarthquakeLoop, v37, nil, v_u_19)
			task.wait(0.3)
			if v35 then
				v35.Enabled = false
			end
			if v36 then
				v36.Enabled = false
			end
		end
		task.wait(1)
		if v16 then
			v16.Particle1.Enabled = false
			v16.Particle2.Enabled = false
		end
		v_u_6:StopSustained()
		v_u_3:Create(v14, v15, {
			["Volume"] = 0
		}):Play()
		task.wait(2)
		v14:Stop()
		task.wait(4)
		if v17 then
			for v38 = 1, 22 do
				local v39 = v17:WaitForChild((tostring(v38)))
				v_u_11:Destroy()
				v39.Particle1:Destroy()
				v39.Particle2:Destroy()
			end
		end
		while v_u_2 do
			task.wait(15)
			v_u_6:ShakeSustain(v_u_4.Presets.Earthquake)
			if v16 then
				v16.Particle1.Rate = 0
				v16.Particle1.Enabled = true
				v16.Particle2.Rate = 0
				v16.Particle2.Enabled = true
				v_u_3:Create(v16.Particle1, v15, {
					["Rate"] = 25
				}):Play()
				v_u_3:Create(v16.Particle2, v15, {
					["Rate"] = 15
				}):Play()
			end
			v14.Volume = 0
			v14:Play()
			v_u_3:Create(v14, v15, {
				["Volume"] = 0.3
			}):Play()
			task.wait(4)
			if v16 then
				v16.Particle1.Enabled = false
				v16.Particle2.Enabled = false
			end
			v_u_6:StopSustained()
			v_u_3:Create(v14, v15, {
				["Volume"] = 0
			}):Play()
		end
		if v16 then
			v16:Destroy()
		end
	end
end
local function v_u_48(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_3
	if v_u_2 ~= false then
		v_u_2 = false
		local v41 = workspace.WeatherVisuals:FindFirstChild("EarthquakeVisuals")
		if v41 ~= nil then
			local v42 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
			for v43 = 1, 22 do
				local v_u_44 = v41:WaitForChild((tostring(v43)))
				local v_u_45 = #v_u_44:GetChildren()
				if v_u_45 > 0 then
					task.spawn(function()
						-- upvalues: (copy) v_u_45, (copy) v_u_44, (ref) v_u_3
						local v46 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
						for v47 = 1, v_u_45 do
							v_u_3:Create(v_u_44:WaitForChild((tostring(v47))), v46, {
								["Transparency"] = 1
							}):Play()
							task.wait(0.1)
						end
					end)
				end
				v_u_3:Create(v_u_44, v42, {
					["Transparency"] = 1
				}):Play()
				task.wait(0.1)
			end
			task.wait(4)
			if v41 then
				v41:Destroy()
			end
		end
	end
end
workspace:GetAttributeChangedSignal("Earthquake"):Connect(function()
	-- upvalues: (copy) v_u_40, (copy) v_u_48
	if workspace:GetAttribute("Earthquake") then
		v_u_40()
	else
		v_u_48()
	end
end)
if workspace:GetAttribute("Earthquake") then
	task.defer(function()
		-- upvalues: (copy) v_u_40
		v_u_40(true)
	end)
else
	v_u_48(true)
end
return v1