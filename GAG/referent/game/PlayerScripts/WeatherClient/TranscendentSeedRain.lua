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
local v_u_13 = game.Workspace.BasePlate.TopBaseplate.Color
if v_u_13 ~= Color3.new(1, 1, 1) then
	task.delay(10, function()
		-- upvalues: (ref) v_u_13
		v_u_13 = game.Workspace.BasePlate.TopBaseplate.Color
	end)
end
local v_u_14 = nil
local function v_u_18()
	-- upvalues: (ref) v_u_14, (copy) v_u_6, (copy) v_u_3
	if not v_u_14 then
		v_u_14 = v_u_6.Heartbeat:Connect(function(p15)
			-- upvalues: (ref) v_u_3
			local _ = (os.clock() * 0.1 % 1 + p15 * 0.05) % 1
			local v16 = tick() * 1.5
			local v17 = math.sin(v16) * 0.03 + 0.72
			v_u_3.TintColor = Color3.fromHSV(v17, 0.3, 1)
		end)
		return v_u_14
	end
end
local function v_u_69()
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_18, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_4, (ref) v_u_13, (ref) v_u_14
	v_u_2 = true
	local v_u_19 = v_u_11.new()
	local v_u_20 = {}
	local v21 = script.Particles:Clone()
	local _ = ((os.clock() + 4) * 0.1 % 1 + 0.001) % 1
	local v22 = (tick() + 4) * 1.5
	local v23 = math.sin(v22) * 0.03 + 0.72
	local v24 = {
		["Brightness"] = 0.15,
		["Contrast"] = 0.05,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromHSV(v23, 0.3, 1)
	}
	v_u_7:Create(v_u_3, TweenInfo.new(4), v24):Play()
	game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(255, 255, 255)
	v_u_7:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(4), {
		["Cover"] = 0.798,
		["Density"] = 0.659
	}):Play()
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(4), {
		["Color"] = Color3.fromRGB(138, 171, 133)
	}):Play()
	v21.Parent = game.Workspace.WeatherVisuals
	task.delay(4, function()
		-- upvalues: (copy) v_u_19, (ref) v_u_18
		v_u_19:Add(v_u_18())
	end)
	local v_u_25 = {}
	local v_u_26 = {}
	local v_u_27 = {}
	local v_u_28 = 0
	v_u_19:Add(v_u_6.Heartbeat:Connect(function(p29)
		-- upvalues: (ref) v_u_28, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27, (copy) v_u_20, (copy) v_u_19, (ref) v_u_10, (ref) v_u_8
		if workspace:GetAttribute("TranscendentSeedRain") then
			v_u_28 = v_u_28 + p29
			while v_u_28 >= 0.016666666666666666 do
				v_u_28 = v_u_28 - 0.016666666666666666
				table.clear(v_u_25)
				table.clear(v_u_26)
				for v30 = #v_u_27, 1, -1 do
					local v31 = v_u_27[v30]
					if v31 and v31.Parent then
						local v32 = v31.PrimaryPart
						if v32 then
							local v33 = v_u_20[v31]
							if v33 then
								local v34 = v33.startPos
								local v35 = v33.endPos
								local v36 = v33.speed or 80
								local v37 = v33.elapsed or 0
								if v35 then
									local v38 = (v35 - v34).Magnitude / v36
									local v39 = v37 + 0.016666666666666666
									v33.elapsed = v39
									local v40 = v39 / v38
									local v41 = math.clamp(v40, 0, 1)
									local v42 = v34:Lerp(v35, v41)
									local v43 = CFrame.Angles(1.5707963267948966 * v39, 0.7853981633974483 * v39, 0.39269908169872414 * v39)
									local v44 = CFrame.new(v42, v35) * v43
									if v41 >= 1 then
										table.remove(v_u_27, v30)
										table.remove(v_u_25, v30)
										table.remove(v_u_26, v30)
										for _, v45 in v31:GetDescendants() do
											if v45:IsA("ParticleEmitter") then
												v45.Enabled = false
											end
										end
										v31:PivotTo(CFrame.new(v35) * v43)
										local v46 = v_u_19:Add(script.MeteorSite:Clone())
										v46.CFrame = CFrame.new(v35)
										v46.Parent = workspace.WeatherVisuals
										for _, v47 in v46:GetDescendants() do
											if v47:IsA("ParticleEmitter") then
												v47:Emit(v47:GetAttribute("EmitCount"))
											end
										end
										local v48 = game.Players.LocalPlayer.Character
										if v48 then
											local v49 = v48:FindFirstChild("HumanoidRootPart") or v48:FindFirstChild("Torso")
											local v_u_50 = v48:FindFirstChildOfClass("Humanoid")
											if v49 and (v_u_50 and (v49.Position - v35).Magnitude <= 10) then
												v_u_50.JumpPower = 100
												v_u_50:ChangeState(Enum.HumanoidStateType.Jumping)
												task.delay(0.1, function()
													-- upvalues: (copy) v_u_50
													if v_u_50 then
														v_u_50.JumpPower = 50
													end
												end)
												v_u_10:Shake(v_u_8.Presets.VerySmallExplosion)
											end
										end
									else
										local v51 = v_u_25
										table.insert(v51, v32)
										local v52 = v_u_26
										table.insert(v52, v44)
									end
								else
									print("no endpos?")
								end
							end
						else
							table.remove(v_u_27, v30)
						end
					else
						table.remove(v_u_27, v30)
					end
				end
				if #v_u_25 > 0 then
					workspace:BulkMoveTo(v_u_25, v_u_26, Enum.BulkMoveMode.FireCFrameChanged)
					table.clear(v_u_25)
					table.clear(v_u_26)
				end
			end
		end
	end))
	local function v_u_61(p53, p54)
		-- upvalues: (copy) v_u_20, (copy) v_u_27, (copy) v_u_19
		if game.Workspace:GetAttribute("TranscendentSeedRain") then
			local v55 = math.random(600, 700)
			local v56 = p53 + Vector3.new(0, v55, 0)
			local v_u_57 = game.Workspace.WeatherVisuals:FindFirstChild(p54)
			if v_u_57 then
				v_u_57:PivotTo(CFrame.new(v56, p53))
				local v58 = math.random(10, 14)
				v_u_20[v_u_57] = {
					["startPos"] = v56,
					["endPos"] = p53,
					["speed"] = (p53 - v56).Magnitude / v58,
					["elapsed"] = 0
				}
				local v59 = v_u_27
				table.insert(v59, v_u_57)
				v_u_19:Add(v_u_57:GetAttributeChangedSignal("Activated"):Connect(function()
					-- upvalues: (copy) v_u_57, (ref) v_u_19
					if v_u_57:GetAttribute("Activated") == game.Players.LocalPlayer.Name then
						local v60 = v_u_19:Add(game.SoundService.Lucky_Seed_SFX:Clone())
						v60.Parent = workspace.WeatherVisuals
						v60.Looped = true
						v60.Parent = game:GetService("SoundService").Music.SFX
						game:GetService("Debris"):AddItem(v60, 5)
					end
					v_u_57:Destroy()
				end))
			end
		else
			return
		end
	end
	v_u_19:Add(game.ReplicatedStorage.GameEvents.SeedRainEvent.OnClientEvent:Connect(function(p62, p63, p64)
		-- upvalues: (copy) v_u_61
		if game.Workspace:GetAttribute("TranscendentSeedRain") then
			if p64 == "TranscendentSeedRain" then
				v_u_61(p62, p63)
			end
		else
			return
		end
	end))
	repeat
		task.wait()
	until v_u_2 == false
	for _, v65 in game.Workspace.WeatherVisuals:GetChildren() do
		if string.find(v65.Name, "Seed_") then
			for _, v66 in v65:GetDescendants() do
				if v66:IsA("BasePart") then
					v_u_12.target(v66, 1, 4, {
						["Transparency"] = 1
					})
				end
			end
		end
	end
	v_u_19:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
	if v21 then
		for _, v67 in v21:GetDescendants() do
			if v67:IsA("ParticleEmitter") then
				v67.Enabled = false
			end
		end
		task.wait(3)
		v21:Destroy()
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
	local v68 = {
		["Color"] = v_u_13
	}
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), v68):Play()
	if v_u_14 then
		v_u_14:Disconnect()
		v_u_14 = nil
	end
end
workspace:GetAttributeChangedSignal("TranscendentSeedRain"):Connect(function()
	-- upvalues: (copy) v_u_69, (ref) v_u_2
	if workspace:GetAttribute("TranscendentSeedRain") then
		v_u_69()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("TranscendentSeedRain") then
	task.defer(v_u_69)
else
	local _ = false
end
return v1