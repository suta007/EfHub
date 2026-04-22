local v1 = {}
local v_u_2 = false
local v_u_3 = game.Lighting.ColorCorrection:Clone()
v_u_3.Name = script.Name
v_u_3.Parent = game.Lighting
local v_u_4 = script.Sky
require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_5.AddSkybox(v_u_4)
require(game.ReplicatedStorage:WaitForChild("Cutscene_Module"))
require(game.ReplicatedStorage.Field_Of_View_Module)
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_10 = v_u_8.new(Enum.RenderPriority.Camera.Value, function(p9)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p9
end)
local v_u_11 = require(game.ReplicatedStorage.Modules.Trove)
local v_u_12 = require(game.ReplicatedStorage.Modules.Spring)
local function v_u_59()
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_4
	v_u_2 = true
	local v_u_13 = v_u_11.new()
	local v_u_14 = {}
	local v15 = script.Particles:Clone()
	v_u_7:Create(v_u_3, TweenInfo.new(4), {
		["Brightness"] = 0.15,
		["Contrast"] = 0.05,
		["Saturation"] = 0.1
	}):Play()
	game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(255, 255, 255)
	v_u_7:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(4), {
		["Cover"] = 0.798,
		["Density"] = 0.659
	}):Play()
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(4), {
		["Color"] = Color3.fromRGB(138, 171, 133)
	}):Play()
	v15.Parent = game.Workspace.WeatherVisuals
	local v_u_16 = {}
	local v_u_17 = {}
	local v_u_18 = {}
	local v_u_19 = 0
	v_u_13:Add(v_u_6.Heartbeat:Connect(function(p20)
		-- upvalues: (ref) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_14, (copy) v_u_13, (ref) v_u_10, (ref) v_u_8
		if workspace:GetAttribute("SeedRain") then
			v_u_19 = v_u_19 + p20
			while v_u_19 >= 0.016666666666666666 do
				v_u_19 = v_u_19 - 0.016666666666666666
				table.clear(v_u_16)
				table.clear(v_u_17)
				for v21 = #v_u_18, 1, -1 do
					local v22 = v_u_18[v21]
					if v22 and v22.Parent then
						local v23 = v22.PrimaryPart
						if v23 then
							local v24 = v_u_14[v22]
							if v24 then
								local v25 = v24.startPos
								local v26 = v24.endPos
								local v27 = v24.speed or 80
								local v28 = v24.elapsed or 0
								if v26 then
									local v29 = (v26 - v25).Magnitude / v27
									local v30 = v28 + 0.016666666666666666
									v24.elapsed = v30
									local v31 = v30 / v29
									local v32 = math.clamp(v31, 0, 1)
									local v33 = v25:Lerp(v26, v32)
									local v34 = CFrame.Angles(1.5707963267948966 * v30, 0.7853981633974483 * v30, 0.39269908169872414 * v30)
									local v35 = CFrame.new(v33, v26) * v34
									if v32 >= 1 then
										table.remove(v_u_18, v21)
										table.remove(v_u_16, v21)
										table.remove(v_u_17, v21)
										for _, v36 in v22:GetDescendants() do
											if v36:IsA("ParticleEmitter") then
												v36.Enabled = false
											end
										end
										v22:PivotTo(CFrame.new(v26) * v34)
										local v37 = v_u_13:Add(script.MeteorSite:Clone())
										v37.CFrame = CFrame.new(v26)
										v37.Parent = workspace.WeatherVisuals
										for _, v38 in v37:GetDescendants() do
											if v38:IsA("ParticleEmitter") then
												v38:Emit(v38:GetAttribute("EmitCount"))
											end
										end
										local v39 = game.Players.LocalPlayer.Character
										if v39 then
											local v40 = v39:FindFirstChild("HumanoidRootPart") or v39:FindFirstChild("Torso")
											local v_u_41 = v39:FindFirstChildOfClass("Humanoid")
											if v40 and (v_u_41 and (v40.Position - v26).Magnitude <= 10) then
												v_u_41.JumpPower = 100
												v_u_41:ChangeState(Enum.HumanoidStateType.Jumping)
												task.delay(0.1, function()
													-- upvalues: (copy) v_u_41
													if v_u_41 then
														v_u_41.JumpPower = 50
													end
												end)
												v_u_10:Shake(v_u_8.Presets.VerySmallExplosion)
											end
										end
									else
										local v42 = v_u_16
										table.insert(v42, v23)
										local v43 = v_u_17
										table.insert(v43, v35)
									end
								else
									print("no endpos?")
								end
							end
						else
							table.remove(v_u_18, v21)
						end
					else
						table.remove(v_u_18, v21)
					end
				end
				if #v_u_16 > 0 then
					workspace:BulkMoveTo(v_u_16, v_u_17, Enum.BulkMoveMode.FireCFrameChanged)
					table.clear(v_u_16)
					table.clear(v_u_17)
				end
			end
		end
	end))
	local function v_u_52(p44, p45)
		-- upvalues: (copy) v_u_14, (copy) v_u_18, (copy) v_u_13
		if game.Workspace:GetAttribute("SeedRain") then
			local v46 = math.random(600, 700)
			local v47 = p44 + Vector3.new(0, v46, 0)
			local v_u_48 = game.Workspace.WeatherVisuals:FindFirstChild(p45)
			if v_u_48 then
				v_u_48:PivotTo(CFrame.new(v47, p44))
				local v49 = math.random(10, 14)
				v_u_14[v_u_48] = {
					["startPos"] = v47,
					["endPos"] = p44,
					["speed"] = (p44 - v47).Magnitude / v49,
					["elapsed"] = 0
				}
				local v50 = v_u_18
				table.insert(v50, v_u_48)
				v_u_13:Add(v_u_48:GetAttributeChangedSignal("Activated"):Connect(function()
					-- upvalues: (copy) v_u_48, (ref) v_u_13
					if v_u_48:GetAttribute("Activated") == game.Players.LocalPlayer.Name then
						local v51 = v_u_13:Add(game.SoundService.Lucky_Seed_SFX:Clone())
						v51.Parent = workspace.WeatherVisuals
						v51.Looped = true
						v51.Parent = game:GetService("SoundService").Music.SFX
						game:GetService("Debris"):AddItem(v51, 5)
					end
					v_u_48:Destroy()
				end))
			end
		else
			return
		end
	end
	v_u_13:Add(game.ReplicatedStorage.GameEvents.SeedRainEvent.OnClientEvent:Connect(function(p53, p54, p55)
		-- upvalues: (copy) v_u_52
		if game.Workspace:GetAttribute("SeedRain") then
			if p55 == "SeedRain" then
				v_u_52(p53, p54)
			end
		else
			return
		end
	end))
	repeat
		task.wait()
	until v_u_2 == false
	for _, v56 in game.Workspace.WeatherVisuals:GetChildren() do
		if string.find(v56.Name, "Seed_") then
			for _, v57 in v56:GetDescendants() do
				if v57:IsA("BasePart") then
					v_u_12.target(v57, 1, 4, {
						["Transparency"] = 1
					})
				end
			end
		end
	end
	v_u_13:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
	if v15 then
		for _, v58 in v15:GetDescendants() do
			if v58:IsA("ParticleEmitter") then
				v58.Enabled = false
			end
		end
		task.wait(3)
		v15:Destroy()
	end
	v_u_7:Create(game.Lighting, TweenInfo.new(3), {
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
	v_u_7:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_7:Create(v_u_3, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_7:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
end
workspace:GetAttributeChangedSignal("SeedRain"):Connect(function()
	-- upvalues: (copy) v_u_59, (ref) v_u_2
	if workspace:GetAttribute("SeedRain") then
		v_u_59()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("SeedRain") then
	task.defer(v_u_59)
else
	v_u_2 = false
end
return v1