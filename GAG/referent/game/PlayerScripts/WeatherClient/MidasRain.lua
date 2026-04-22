local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game.Players.LocalPlayer
local v_u_5 = v_u_4.Character
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.SoundPlayer)
local v_u_8 = require(v6.Data.SoundData)
local v_u_9 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local v_u_10 = require(game.ReplicatedStorage.Modules.Notification)
local function v_u_27(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (ref) v_u_5, (copy) v_u_4, (copy) v_u_9
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_10:CreateNotification("It\'s raining Gold!")
		local v11 = script.MidasRain:Clone()
		v11.Parent = workspace.WeatherVisuals
		v11:WaitForChild("Center")
		v11.Center.Shockwave:Emit(1)
		v11.Dust.Enabled = true
		v11.Flash.Enabled = true
		v11.Glimmers.Enabled = true
		local v12 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["PlaybackSpeed"] = 0.3,
			["Volume"] = 1
		}
		v_u_7:PlaySound(v_u_8.Weather.MidasRain.MidasRain.Start, v12, nil, v11)
		local v13 = v11.Size.X / 2
		local v14 = v11.Size.Z / 2
		local v15 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
		local v16 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		while v_u_2 do
			local v_u_17 = script.MidasMeteor:Clone()
			local v18 = v11.Position
			local v19 = math.random(-v13, v13)
			local v20 = math.random
			local v21 = -v14
			local v22 = v18 + Vector3.new(v19, 0, v20(v21, v14))
			v_u_17.Position = v22
			v_u_17.Attachment.Constant.Enabled = true
			v_u_17.Attachment.Shockwave.Enabled = true
			v_u_17.Dust.Enabled = true
			v_u_17.Glimmers.Enabled = true
			v_u_17.Parent = workspace.WeatherVisuals
			local v23 = {
				["RollOffMaxDistance"] = 800,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["PlaybackSpeed"] = math.random(80, 120) / 100,
				["Volume"] = 0.8,
				["TimePosition"] = 0.5
			}
			local v24 = {
				["RollOffMaxDistance"] = 800,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["PlaybackSpeed"] = math.random(80, 120) / 100,
				["Volume"] = 1
			}
			local v25 = {
				["RollOffMaxDistance"] = 800,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["PlaybackSpeed"] = 1.5,
				["Volume"] = 0.4,
				["PlaybackSpeed"] = math.random(130, 170) / 100
			}
			local v26 = v_u_7:PlaySound(v_u_8.Weather.MidasRain.MidasMeteor.Constant, v25, nil, v_u_17)
			v_u_3:Create(v_u_17, v15, {
				["Position"] = v22 - Vector3.new(0, 150, 0)
			}):Play()
			task.wait(2)
			if v_u_17 then
				v_u_5 = v_u_4.Character
				if v_u_5:FindFirstChild("HumanoidRootPart") ~= nil then
					v_u_9:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3, { v_u_5.HumanoidRootPart.Position, v_u_17.Position, 200 })
					v_u_9:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6, { v_u_5.HumanoidRootPart.Position, v_u_17.Position, 200 })
				end
				v_u_17.Attachment.Constant.Enabled = false
				v26:Stop()
				v_u_7:PlaySound(v_u_8.Weather.MidasRain.MidasMeteor.Explode, v23, nil, v_u_17)
				v_u_7:PlaySound(v_u_8.Weather.MidasRain.MidasMeteor.Explode2, v24, nil, v_u_17)
				v_u_17.Attachment.Shockwave.Enabled = false
				v_u_17.Dust.Enabled = false
				v_u_17.Glimmers.Enabled = false
				v_u_17.Attachment.Flash:Emit(1)
				v_u_17.Attachment.StarsBurst:Emit(10)
				v_u_17.Attachment.StarsDecay:Emit(5)
				v_u_17.Attachment.DustBurst:Emit(7)
				v_u_17.Attachment.Circle:Emit(3)
				v_u_3:Create(v_u_17, v16, {
					["Size"] = Vector3.new(0, 0, 0),
					["Transparency"] = 1
				}):Play()
				task.delay(5, function()
					-- upvalues: (copy) v_u_17
					if v_u_17 then
						v_u_17:Destroy()
					end
				end)
			end
		end
	end
end
local function v_u_29(_)
	-- upvalues: (ref) v_u_2
	if v_u_2 ~= false then
		v_u_2 = false
		local v28 = workspace.WeatherVisuals:FindFirstChild("MidasRain")
		if v28 then
			v28.Dust.Enabled = false
			v28.Flash.Enabled = false
			v28.Glimmers.Enabled = false
			task.wait(5)
			if v28 then
				v28:Destroy()
			end
		end
	end
end
workspace:GetAttributeChangedSignal("MidasRain"):Connect(function()
	-- upvalues: (copy) v_u_27, (copy) v_u_29
	if workspace:GetAttribute("MidasRain") then
		v_u_27()
	else
		v_u_29()
	end
end)
if workspace:GetAttribute("MidasRain") then
	task.defer(function()
		-- upvalues: (copy) v_u_27
		v_u_27(true)
	end)
else
	v_u_29(true)
end
return v1