local v1 = {}
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_3 = script.Sky
v_u_2.AddSkybox(v_u_3)
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = nil
local v_u_8 = false
local function v_u_15(p9)
	-- upvalues: (ref) v_u_8, (copy) v_u_2, (copy) v_u_3, (ref) v_u_7, (copy) v_u_5, (copy) v_u_6
	if v_u_8 == true then
		return
	else
		v_u_8 = true
		game.ReplicatedStorage.Aurora_Borealis.Value = true
		if p9 then
			game.Lighting.ClockTime = 16
			game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(63, 77, 138),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(142, 176, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_2.UpdateSkybox(v_u_3, 4)
			local v10 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = true,
				["Volume"] = 0.1
			}
			v_u_7 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v10)
			script.Aurora:Clone().Parent = workspace.WeatherVisuals
		else
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			task.wait(5)
			v_u_2.UpdateSkybox(v_u_3, 4)
			game.Lighting.ClockTime = 3
			task.wait(2)
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(64, 74, 138),
				["ExposureCompensation"] = 1,
				["Brightness"] = 0.6,
				["ClockTime"] = 16
			}):Play()
			task.delay(3, function()
				script.Aurora:Clone().Parent = workspace.WeatherVisuals
				for _, v11 in workspace.WeatherVisuals.Aurora:GetDescendants() do
					if v11:IsA("Beam") then
						local v12 = v11.Width0
						local v13 = v11.Width1
						v11.Width0 = 0
						v11.Width1 = 0
						game.TweenService:Create(v11, TweenInfo.new(4), {
							["Width0"] = v12,
							["Width1"] = v13
						}):Play()
					end
				end
			end)
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(206, 178, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			local v14 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Loop"] = true,
				["FadeInDuration"] = 1,
				["Volume"] = 0.1
			}
			v_u_7 = v_u_5:PlaySound(v_u_6.Weather.Ambience, v14, nil, workspace)
			task.delay(13, function()
				game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
					["Intensity"] = 0.028
				}):Play()
			end)
		end
	end
end
local function v_u_18(p16)
	-- upvalues: (ref) v_u_8, (ref) v_u_7, (copy) v_u_2, (copy) v_u_3
	if v_u_8 == false then
		return
	else
		game.ReplicatedStorage.Aurora_Borealis.Value = false
		v_u_8 = false
		if not p16 then
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 21
			}):Play()
			game.TweenService:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0
			}):Play()
			task.wait(5)
			if workspace.WeatherVisuals:FindFirstChild("Aurora") then
				task.spawn(function()
					for _, v_u_17 in workspace.WeatherVisuals.Aurora:GetDescendants() do
						if v_u_17:IsA("Beam") then
							task.spawn(function()
								-- upvalues: (copy) v_u_17
								game.TweenService:Create(v_u_17, TweenInfo.new(4), {
									["Width0"] = 0,
									["Width1"] = 0
								}):Play()
							end)
						end
					end
					task.wait(4)
					workspace.WeatherVisuals.Aurora:Destroy()
				end)
			end
			game.TweenService:Create(v_u_7, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(1, function()
				-- upvalues: (ref) v_u_7
				v_u_7.Parent = script
				v_u_7:Stop()
			end)
			v_u_2.UpdateSkybox(v_u_3, 0)
			game.Lighting.ClockTime = 3
			game.TweenService:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 138, 138),
				["ExposureCompensation"] = 0.2,
				["Brightness"] = 2,
				["ClockTime"] = 14
			}):Play()
			task.delay(6, function()
				game.Lighting.SunRays.Enabled = false
			end)
		end
	end
end
workspace:GetAttributeChangedSignal("AuroraBorealis"):Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_18
	if workspace:GetAttribute("AuroraBorealis") then
		v_u_15()
	else
		v_u_18()
	end
end)
if workspace:GetAttribute("AuroraBorealis") then
	task.defer(function()
		-- upvalues: (copy) v_u_15
		v_u_15(true)
	end)
elseif v_u_8 ~= false then
	game.ReplicatedStorage.Aurora_Borealis.Value = false
	v_u_8 = false
end
return v1