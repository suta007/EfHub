local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = false
local v_u_4 = nil
local v_u_5 = game:GetService("TweenService")
local v_u_6 = require(v_u_2.Modules.Notification)
local v_u_7 = require(v_u_2.Data.SoundData)
local v_u_8 = require(v_u_2.Modules.SoundPlayer)
local v_u_9 = require(v_u_2.Modules.ScreenShakeCore)
local function v_u_41(_)
	-- upvalues: (ref) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_5, (ref) v_u_4, (copy) v_u_2
	if v_u_3 ~= true then
		v_u_3 = true
		v_u_6:CreateNotification("A sword has fallen from the sky. Find it and activate it!")
		local v10 = { Vector3.new(52.3, 225.8, -24.8), Vector3.new(-217, 225.8, -24.8), Vector3.new(-167.3, 225.8, 140) }
		local v11 = script.SkyActivate:Clone()
		v11.Position = v10[math.random(1, #v10)]
		v11.Parent = workspace
		v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Start, {
			["PlaybackSpeed"] = 0.5 + math.random(-40, 40) / 1000
		}, nil, v11)
		task.wait(2)
		v_u_9:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
		v_u_9:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
		v_u_8:PlaySound(v_u_7.Weather.JandelKatana.Shimmer, {
			["PlaybackSpeed"] = 1.5,
			["Volume"] = 3
		}, nil, v11)
		v_u_8:PlaySound(v_u_7.Weather.JandelKatana.SlashRotation, {
			["PlaybackSpeed"] = 0.75,
			["Volume"] = 1.2
		})
		v11.Activate1:Emit(10)
		v11.Activate2:Emit(10)
		v11.Wave:Emit(1)
		v11.Wave2:Emit(1)
		v11.Stars:Emit(15)
		local v_u_12 = script.Sword:Clone()
		v_u_12.Name = "GiantSwordPullSword"
		v_u_12.Position = v11.Position
		v_u_12.Parent = workspace.WeatherVisuals
		v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Fall, {
			["Volume"] = 5
		}, nil, v_u_12)
		v_u_5:Create(v_u_12, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
			["Position"] = v_u_12.Position - Vector3.new(0, 228.8, 0)
		}):Play()
		v_u_12.Trail.Enabled = true
		v_u_12.Stars.Enabled = true
		task.wait(1)
		v_u_9:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.6)
		v_u_9:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.8)
		v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Explosion, {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000
		}, nil, v_u_12)
		v_u_12.BurstBig:Emit(15)
		v_u_12.Attachment.Wave:Emit(1)
		v_u_12.Attachment.Wave2:Emit(2)
		v_u_12.Attachment.WaveExtra:Emit(15)
		v_u_12.Trail.Enabled = false
		v_u_12.Stars.Enabled = false
		v_u_12.Attachment.GroundCracks:Emit(1)
		local v_u_13 = v_u_2:WaitForChild("SwordBudge")
		local v_u_14 = v_u_12.Position
		local v_u_15 = nil
		v_u_15 = v_u_13:GetPropertyChangedSignal("Value"):Connect(function()
			-- upvalues: (ref) v_u_14, (copy) v_u_12, (ref) v_u_8, (ref) v_u_7, (copy) v_u_13, (ref) v_u_4, (ref) v_u_9, (ref) v_u_15
			v_u_14 = v_u_14 + Vector3.new(0, 0.09, 0)
			local v16 = v_u_12.Attachment
			v16.Position = v16.Position + Vector3.new(0, 0, 0.068)
			v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Budge, {
				["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000,
				["Volume"] = 1
			}, nil, v_u_12)
			local _ = v_u_13.Value
			local v_u_17 = v_u_14
			if v_u_4 then
				task.cancel(v_u_4)
			end
			v_u_4 = task.spawn(function()
				-- upvalues: (ref) v_u_12, (copy) v_u_17
				for _ = 1, 8 do
					local v18 = v_u_12
					local v19 = v_u_17
					local v20 = math.random(-1, 1) / 10
					local v21 = math.random(-1, 1) / 10
					v18.Position = v19 + Vector3.new(v20, 0, v21)
					task.wait(0.01)
				end
				v_u_12.Position = v_u_17
			end)
			v_u_12.Attachment.Dust:Emit(3)
			v_u_9:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.25)
			v_u_9:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.4)
			if v_u_13.Value >= 125 then
				v_u_12.Attachment.SwordPrompt.Enabled = false
				v_u_15:Disconnect()
			end
		end)
		local v_u_23 = v_u_12.Attachment.SwordPrompt.Triggered:Connect(function(p22)
			-- upvalues: (copy) v_u_12, (ref) v_u_2
			if p22.Character then
				v_u_12.Attachment.SwordPrompt.Enabled = false
				if v_u_2.GameEvents.GiantSwordPull:InvokeServer() == true then
					v_u_12.Attachment.SwordPrompt.Enabled = true
				end
			end
		end)
		local function v_u_39()
			-- upvalues: (copy) v_u_13, (ref) v_u_5, (copy) v_u_12, (ref) v_u_8, (ref) v_u_7, (ref) v_u_9, (ref) v_u_3
			if v_u_13:GetAttribute("Activated") == true then
				v_u_5:Create(v_u_12, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
					["Position"] = v_u_12.Position + Vector3.new(0, 50, 0),
					["Orientation"] = Vector3.new(-90, 90, 0)
				}):Play()
				v_u_12.Attachment.Position = Vector3.new(0, 0, 8.5)
				v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Budge, {
					["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000,
					["Volume"] = 1
				}, nil, v_u_12)
				v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Earth, {
					["PlaybackSpeed"] = 1.5 + math.random(-250, 250) / 1000,
					["Volume"] = 3
				}, nil, v_u_12)
				v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Shine, {
					["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000
				}, nil, v_u_12)
				v_u_12.Attachment.Wave:Emit(1)
				v_u_12.Attachment.Wave2:Emit(2)
				v_u_12.Attachment.WaveExtra:Emit(15)
				v_u_12.Attachment.SmallCracks:Emit(1)
				v_u_12.Trail.Enabled = true
				v_u_12.Stars:Emit(15)
				v_u_9:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.6)
				v_u_9:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.8)
				task.wait(1)
				v_u_12.Attachment.Position = Vector3.new(0, 0, -3)
				v_u_12.Burst:Emit(15)
				v_u_12.Attachment.Flash:Emit(1)
				v_u_12.Transparency = 1
				v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Slash, {
					["PlaybackSpeed"] = 2 + math.random(-250, 250) / 1000,
					["Volume"] = 1
				}, nil, v_u_12)
				local v24 = workspace.BasePlate.TopBaseplate
				local v25 = workspace.Farm:GetChildren()
				while v_u_3 do
					local v_u_26 = script.Sword:Clone()
					v_u_8:PlaySound(v_u_7.Weather.GiantSwordPull.Slash, {
						["PlaybackSpeed"] = 2 + math.random(-250, 250) / 1000,
						["Volume"] = 0.8
					}, nil, v_u_26)
					local v27 = v24.Position
					local v28 = math.random(-v24.Size.X / 2, v24.Size.X / 2)
					local v29 = math.random(20, 60)
					local v30 = math.random
					local v31 = -v24.Size.Z / 2
					local v32 = v24.Size.Z / 2
					local v33 = v27 + Vector3.new(v28, v29, v30(v31, v32))
					local v34 = v25[math.random(1, #v25)].Center_Point.Position
					local v35 = math.random(-20, 20)
					local v36 = math.random(-3, 25)
					local v37 = math.random
					local v38 = v34 + Vector3.new(v35, v36, v37(-20, 20))
					v_u_26.CFrame = CFrame.lookAt(v33, v38) * CFrame.Angles(3.141592653589793, 0, 0)
					v_u_26.Parent = v_u_12
					v_u_26.Trail.Enabled = true
					v_u_26.Stars.Enabled = true
					v_u_5:Create(v_u_26, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
						["Position"] = v_u_26.Position + v_u_26.CFrame.LookVector * -500
					}):Play()
					task.delay(0.7, function()
						-- upvalues: (copy) v_u_26
						if v_u_26 then
							if v_u_26:FindFirstChild("Trail") then
								v_u_26.Trail.Enabled = false
								v_u_26.Stars.Enabled = false
								v_u_26.Attachment.Flash:Emit(1)
								v_u_26.Transparency = 1
							end
							task.wait(3)
							if v_u_26 then
								v_u_26:Destroy()
							end
						end
					end)
					v_u_9:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.15)
					v_u_9:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.25)
					task.wait(0.2)
				end
			end
		end
		v_u_39()
		local v_u_40 = nil
		v_u_40 = v_u_13:GetAttributeChangedSignal("Activated"):Connect(function()
			-- upvalues: (ref) v_u_15, (copy) v_u_23, (ref) v_u_40, (copy) v_u_39
			if v_u_15 then
				v_u_15:Disconnect()
			end
			if v_u_23 then
				v_u_23:Disconnect()
			end
			v_u_40:Disconnect()
			v_u_39()
		end)
		v_u_13.Destroying:Once(function()
			-- upvalues: (ref) v_u_15, (copy) v_u_23, (ref) v_u_40
			if v_u_15 then
				v_u_15:Disconnect()
			end
			if v_u_23 then
				v_u_23:Disconnect()
			end
			if v_u_40 then
				v_u_40:Disconnect()
			end
		end)
		v_u_12.Attachment.SwordPrompt.Enabled = true
	end
end
local function v_u_44(_)
	-- upvalues: (ref) v_u_3, (ref) v_u_4
	if v_u_3 ~= false then
		v_u_3 = false
		if v_u_4 then
			task.cancel(v_u_4)
		end
		local v42 = workspace.WeatherVisuals:FindFirstChild("SkyActivate")
		if v42 then
			v42:Destroy()
		end
		local v43 = workspace.WeatherVisuals:FindFirstChild("GiantSwordPullSword")
		if v43 then
			v43:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("GiantSwordPull"):Connect(function()
	-- upvalues: (copy) v_u_41, (copy) v_u_44
	if workspace:GetAttribute("GiantSwordPull") then
		v_u_41()
	else
		v_u_44()
	end
end)
if workspace:GetAttribute("GiantSwordPull") then
	task.defer(function()
		-- upvalues: (copy) v_u_41
		v_u_41(true)
	end)
else
	v_u_44(true)
end
return v1