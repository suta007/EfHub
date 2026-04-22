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
local function v_u_60()
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_4, (ref) v_u_13
	v_u_2 = true
	local v_u_14 = v_u_11.new()
	local v_u_15 = {}
	local v16 = script.Particles:Clone()
	v_u_7:Create(v_u_3, TweenInfo.new(4), {
		["Brightness"] = 0.15,
		["Contrast"] = 0.05,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 222, 205)
	}):Play()
	game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(255, 255, 255)
	v_u_7:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(4), {
		["Cover"] = 0.798,
		["Density"] = 0.659
	}):Play()
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(4), {
		["Color"] = Color3.fromRGB(138, 171, 133)
	}):Play()
	v16.Parent = game.Workspace.WeatherVisuals.Divine
	local v_u_17 = {}
	local v_u_18 = {}
	local v_u_19 = {}
	local v_u_20 = 0
	v_u_14:Add(v_u_6.Heartbeat:Connect(function(p21)
		-- upvalues: (ref) v_u_20, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_15, (copy) v_u_14, (ref) v_u_10, (ref) v_u_8
		if workspace:GetAttribute("DivineSeedRain") then
			v_u_20 = v_u_20 + p21
			while v_u_20 >= 0.016666666666666666 do
				v_u_20 = v_u_20 - 0.016666666666666666
				table.clear(v_u_17)
				table.clear(v_u_18)
				for v22 = #v_u_19, 1, -1 do
					local v23 = v_u_19[v22]
					if v23 and v23.Parent then
						local v24 = v23.PrimaryPart
						if v24 then
							local v25 = v_u_15[v23]
							if v25 then
								local v26 = v25.startPos
								local v27 = v25.endPos
								local v28 = v25.speed or 80
								local v29 = v25.elapsed or 0
								if v27 then
									local v30 = (v27 - v26).Magnitude / v28
									local v31 = v29 + 0.016666666666666666
									v25.elapsed = v31
									local v32 = v31 / v30
									local v33 = math.clamp(v32, 0, 1)
									local v34 = v26:Lerp(v27, v33)
									local v35 = CFrame.Angles(1.5707963267948966 * v31, 0.7853981633974483 * v31, 0.39269908169872414 * v31)
									local v36 = CFrame.new(v34, v27) * v35
									if v33 >= 1 then
										table.remove(v_u_19, v22)
										table.remove(v_u_17, v22)
										table.remove(v_u_18, v22)
										for _, v37 in v23:GetDescendants() do
											if v37:IsA("ParticleEmitter") then
												v37.Enabled = false
											end
										end
										v23:PivotTo(CFrame.new(v27) * v35)
										local v38 = v_u_14:Add(script.MeteorSite:Clone())
										v38.CFrame = CFrame.new(v27)
										v38.Parent = workspace.WeatherVisuals.Divine
										for _, v39 in v38:GetDescendants() do
											if v39:IsA("ParticleEmitter") then
												v39:Emit(v39:GetAttribute("EmitCount"))
											end
										end
										local v40 = game.Players.LocalPlayer.Character
										if v40 then
											local v41 = v40:FindFirstChild("HumanoidRootPart") or v40:FindFirstChild("Torso")
											local v_u_42 = v40:FindFirstChildOfClass("Humanoid")
											if v41 and (v_u_42 and (v41.Position - v27).Magnitude <= 10) then
												v_u_42.JumpPower = 100
												v_u_42:ChangeState(Enum.HumanoidStateType.Jumping)
												task.delay(0.1, function()
													-- upvalues: (copy) v_u_42
													if v_u_42 then
														v_u_42.JumpPower = 50
													end
												end)
												v_u_10:Shake(v_u_8.Presets.VerySmallExplosion)
											end
										end
									else
										local v43 = v_u_17
										table.insert(v43, v24)
										local v44 = v_u_18
										table.insert(v44, v36)
									end
								else
									print("no endpos?")
								end
							end
						else
							table.remove(v_u_19, v22)
						end
					else
						table.remove(v_u_19, v22)
					end
				end
				if #v_u_17 > 0 then
					workspace:BulkMoveTo(v_u_17, v_u_18, Enum.BulkMoveMode.FireCFrameChanged)
					table.clear(v_u_17)
					table.clear(v_u_18)
				end
			end
		end
	end))
	local function v_u_53(p45, p46)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_14
		if game.Workspace:GetAttribute("DivineSeedRain") then
			local v47 = math.random(600, 700)
			local v48 = p45 + Vector3.new(0, v47, 0)
			local v_u_49 = game.Workspace.WeatherVisuals.Divine:FindFirstChild(p46)
			if v_u_49 then
				v_u_49:PivotTo(CFrame.new(v48, p45))
				local v50 = math.random(10, 14)
				v_u_15[v_u_49] = {
					["startPos"] = v48,
					["endPos"] = p45,
					["speed"] = (p45 - v48).Magnitude / v50,
					["elapsed"] = 0
				}
				local v51 = v_u_19
				table.insert(v51, v_u_49)
				v_u_14:Add(v_u_49:GetAttributeChangedSignal("Activated"):Connect(function()
					-- upvalues: (copy) v_u_49, (ref) v_u_14
					if v_u_49:GetAttribute("Activated") == game.Players.LocalPlayer.Name then
						local v52 = v_u_14:Add(game.SoundService.Lucky_Seed_SFX:Clone())
						v52.Parent = workspace.WeatherVisuals.Divine
						v52.Looped = true
						v52.Parent = game:GetService("SoundService").Music.SFX
						game:GetService("Debris"):AddItem(v52, 5)
					end
					v_u_49:Destroy()
				end))
			end
		else
			return
		end
	end
	v_u_14:Add(game.ReplicatedStorage.GameEvents.DivineSeedRainEvent.OnClientEvent:Connect(function(p54, p55)
		-- upvalues: (copy) v_u_53
		if game.Workspace:GetAttribute("DivineSeedRain") then
			v_u_53(p54, p55)
		end
	end))
	repeat
		task.wait()
	until v_u_2 == false
	for _, v56 in game.Workspace.WeatherVisuals.Divine:GetChildren() do
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
	v_u_14:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
	if v16 then
		for _, v58 in v16:GetDescendants() do
			if v58:IsA("ParticleEmitter") then
				v58.Enabled = false
			end
		end
		task.wait(3)
		v16:Destroy()
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
	local v59 = {
		["Color"] = v_u_13
	}
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), v59):Play()
end
workspace:GetAttributeChangedSignal("DivineSeedRain"):Connect(function()
	-- upvalues: (copy) v_u_60, (ref) v_u_2
	if workspace:GetAttribute("DivineSeedRain") then
		v_u_60()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("DivineSeedRain") then
	task.defer(v_u_60)
else
	local _ = false
end
return v1