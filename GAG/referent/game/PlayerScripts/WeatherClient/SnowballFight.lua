local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = script.Sky
local v_u_6 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_6.AddSkybox(v_u_5)
local v_u_7 = require(game.ReplicatedStorage.Modules.Notification)
local v8 = require(v4.Modules.Maid)
local v_u_9 = require(v4.Modules.SoundPlayer)
local v_u_10 = require(v4.Data.SoundData)
local v_u_11 = game:GetService("Players").LocalPlayer
local v_u_12 = v8.new()
local function v_u_17(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_6.UpdateSkybox(v_u_5, 2)
		v_u_3:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(152, 228, 255),
			["OutdoorAmbient"] = Color3.fromRGB(166, 211, 225),
			["Brightness"] = 1
		}):Play()
		v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(212, 212, 212)
		}):Play()
		v_u_3:Create(v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Ambience, {
			["Looped"] = true,
			["PlaybackSpeed"] = 0.9,
			["Volume"] = 0
		}), TweenInfo.new(5), {
			["Volume"] = 0.45
		}):Play()
		local v13 = script.BlizzardParticle:Clone()
		v13.Parent = workspace.WeatherVisuals
		for _, v14 in v13:GetDescendants() do
			if v14:IsA("ParticleEmitter") then
				v14.Enabled = true
			end
		end
		local v15 = script.Barriers:Clone()
		for _, v16 in v15:GetChildren() do
			v16:WaitForChild("Main"):WaitForChild("Smoke"):Emit(3)
			v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Poof, {
				["PlaybackSpeed"] = 0.65,
				["Volume"] = 2
			}, nil, v16.Main)
		end
		v15.Parent = workspace.WeatherVisuals
		v_u_12:GiveTask(v15)
	end
end
local function v_u_23(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12
	if v_u_2 ~= false then
		v_u_2 = false
		v_u_6.UpdateSkybox(v_u_5, 0)
		v_u_3:Create(game.Lighting, TweenInfo.new(7), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_3:Create(workspace.BasePlate.TopBaseplate, TweenInfo.new(5), {
			["Color"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		local v18 = v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Ambience, {
			["Looped"] = true,
			["PlaybackSpeed"] = 0.9
		})
		v_u_3:Create(v18, TweenInfo.new(5), {
			["Volume"] = 0
		}):Play()
		local v19 = workspace.WeatherVisuals:FindFirstChild("BlizzardParticle")
		if v19 then
			for _, v20 in v19:GetDescendants() do
				if v20:IsA("ParticleEmitter") then
					v20.Enabled = false
				end
			end
		end
		local v21 = workspace.WeatherVisuals:FindFirstChild("Barriers")
		if v21 then
			for _, v22 in v21:GetChildren() do
				v22.Main.Smoke:Emit(3)
				v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Poof, {
					["PlaybackSpeed"] = 0.65,
					["Volume"] = 2
				}, nil, v22.Main)
				v22.Main.CanCollide = false
				v22.One.CanCollide = false
				v22.Two.CanCollide = false
				v22.Main.Transparency = 1
				v22.One.Transparency = 1
				v22.Two.Transparency = 1
			end
		end
		task.wait(5)
		if v21 then
			v21:Destroy()
		end
		v18:Stop()
		if v19 then
			v19:Destroy()
		end
		v_u_12:DoCleaning()
		print("Cleaning")
	end
end
game:GetService("ReplicatedStorage").GameEvents.SnowballFight.OnClientEvent:Connect(function(p24, p25)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_7
	if p24 == "Throw" then
		local v_u_26 = p25[1]
		local v_u_27 = p25[2]
		local v28 = p25[3]
		if v_u_26 and (v_u_27 and v_u_27:FindFirstChild("Right Arm")) then
			v_u_26.CFrame = v_u_27["Right Arm"].CFrame * CFrame.new(0, -1, 0)
			v_u_26.Trail.Enabled = true
			v_u_26.Att1.Trail.Enabled = true
			v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Throw, {
				["PlaybackSpeed"] = 2 + math.random(-250, 250) / 1000,
				["RollOffMaxDistance"] = 150,
				["RollOffMinDistance"] = 1,
				["TimePosition"] = 0.1,
				["Volume"] = 2
			}, nil, v_u_26)
			local v29 = Instance.new("BodyVelocity")
			v29.MaxForce = Vector3.new(100000, 100000, 100000)
			v29.Velocity = v28 * 100
			v29.Parent = v_u_26
			local v_u_30 = nil
			v_u_30 = v_u_26.Touched:Connect(function(p31)
				-- upvalues: (copy) v_u_27, (ref) v_u_30, (ref) v_u_9, (ref) v_u_10, (copy) v_u_26, (ref) v_u_11, (ref) v_u_7
				if p31 and not p31:IsDescendantOf(v_u_27) then
					v_u_30:Disconnect()
					v_u_9:PlaySound(v_u_10.Weather.SnowballFight.SnowballHit, {
						["PlaybackSpeed"] = 2 + math.random(-250, 250) / 1000,
						["RollOffMaxDistance"] = 150,
						["RollOffMinDistance"] = 1,
						["Volume"] = 1
					}, nil, v_u_26)
					v_u_26.Anchored = true
					v_u_26.Transparency = 1
					v_u_26.CanTouch = false
					v_u_26.Att1.Trail.Enabled = false
					v_u_26.SnowBits:Emit(7)
					v_u_26.SnowBurst:Emit(7)
					v_u_26.Trail.Enabled = false
					if p31.Parent:FindFirstChild("Humanoid") and v_u_11.Name == v_u_27.Name then
						v_u_7:CreateNotification("You\'ve hit a player with a snowball!")
						v_u_9:PlaySound(v_u_10.Weather.SnowballFight.Hit, {
							["PlaybackSpeed"] = 0.75 + math.random(-250, 250) / 1000,
							["TimePosition"] = 0.1,
							["Volume"] = 0.7
						}, nil, workspace)
					end
				end
			end)
			task.wait(0.2)
			v29:Destroy()
			task.wait(10)
			if v_u_26 then
				v_u_26:Destroy()
			end
			if v_u_30 then
				v_u_30:Disconnect()
			end
		end
	end
end)
workspace:GetAttributeChangedSignal("SnowballFight"):Connect(function()
	-- upvalues: (copy) v_u_17, (copy) v_u_23
	if workspace:GetAttribute("SnowballFight") then
		v_u_17()
	else
		v_u_23()
	end
end)
if workspace:GetAttribute("SnowballFight") then
	task.defer(function()
		-- upvalues: (copy) v_u_17
		v_u_17(true)
	end)
else
	v_u_23(true)
end
return v1