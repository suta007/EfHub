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
local function v_u_16()
	-- upvalues: (ref) v_u_14, (copy) v_u_6, (copy) v_u_3
	if not v_u_14 then
		v_u_14 = v_u_6.Heartbeat:Connect(function(_)
			-- upvalues: (ref) v_u_3
			local v15 = os.clock() * 0.1 % 1
			v_u_3.TintColor = Color3.fromHSV(v15, 0.3, 1)
		end)
		return v_u_14
	end
end
local function v_u_63()
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_16, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_4, (ref) v_u_13, (ref) v_u_14
	v_u_2 = true
	local v_u_17 = v_u_11.new()
	local v_u_18 = {}
	local v19 = script.Particles:Clone()
	v_u_7:Create(v_u_3, TweenInfo.new(4), {
		["Brightness"] = 0.15,
		["Contrast"] = 0.05,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromHSV((os.clock() + 4) * 0.1 % 1, 0.3, 1)
	}):Play()
	game.Workspace.Terrain.Clouds.Color = Color3.fromRGB(255, 255, 255)
	v_u_7:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(4), {
		["Cover"] = 0.798,
		["Density"] = 0.659
	}):Play()
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(4), {
		["Color"] = Color3.fromRGB(138, 171, 133)
	}):Play()
	v19.Parent = game.Workspace.WeatherVisuals.Prismatic
	task.delay(4, function()
		-- upvalues: (copy) v_u_17, (ref) v_u_16
		v_u_17:Add(v_u_16())
	end)
	local v_u_20 = {}
	local v_u_21 = {}
	local v_u_22 = {}
	local v_u_23 = 0
	v_u_17:Add(v_u_6.Heartbeat:Connect(function(p24)
		-- upvalues: (ref) v_u_23, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_18, (copy) v_u_17, (ref) v_u_10, (ref) v_u_8
		if workspace:GetAttribute("PrismaticSeedRain") then
			v_u_23 = v_u_23 + p24
			while v_u_23 >= 0.016666666666666666 do
				v_u_23 = v_u_23 - 0.016666666666666666
				table.clear(v_u_20)
				table.clear(v_u_21)
				for v25 = #v_u_22, 1, -1 do
					local v26 = v_u_22[v25]
					if v26 and v26.Parent then
						local v27 = v26.PrimaryPart
						if v27 then
							local v28 = v_u_18[v26]
							if v28 then
								local v29 = v28.startPos
								local v30 = v28.endPos
								local v31 = v28.speed or 80
								local v32 = v28.elapsed or 0
								if v30 then
									local v33 = (v30 - v29).Magnitude / v31
									local v34 = v32 + 0.016666666666666666
									v28.elapsed = v34
									local v35 = v34 / v33
									local v36 = math.clamp(v35, 0, 1)
									local v37 = v29:Lerp(v30, v36)
									local v38 = CFrame.Angles(1.5707963267948966 * v34, 0.7853981633974483 * v34, 0.39269908169872414 * v34)
									local v39 = CFrame.new(v37, v30) * v38
									if v36 >= 1 then
										table.remove(v_u_22, v25)
										table.remove(v_u_20, v25)
										table.remove(v_u_21, v25)
										for _, v40 in v26:GetDescendants() do
											if v40:IsA("ParticleEmitter") then
												v40.Enabled = false
											end
										end
										v26:PivotTo(CFrame.new(v30) * v38)
										local v41 = v_u_17:Add(script.MeteorSite:Clone())
										v41.CFrame = CFrame.new(v30)
										v41.Parent = workspace.WeatherVisuals.Prismatic
										for _, v42 in v41:GetDescendants() do
											if v42:IsA("ParticleEmitter") then
												v42:Emit(v42:GetAttribute("EmitCount"))
											end
										end
										local v43 = game.Players.LocalPlayer.Character
										if v43 then
											local v44 = v43:FindFirstChild("HumanoidRootPart") or v43:FindFirstChild("Torso")
											local v_u_45 = v43:FindFirstChildOfClass("Humanoid")
											if v44 and (v_u_45 and (v44.Position - v30).Magnitude <= 10) then
												v_u_45.JumpPower = 100
												v_u_45:ChangeState(Enum.HumanoidStateType.Jumping)
												task.delay(0.1, function()
													-- upvalues: (copy) v_u_45
													if v_u_45 then
														v_u_45.JumpPower = 50
													end
												end)
												v_u_10:Shake(v_u_8.Presets.VerySmallExplosion)
											end
										end
									else
										local v46 = v_u_20
										table.insert(v46, v27)
										local v47 = v_u_21
										table.insert(v47, v39)
									end
								else
									print("no endpos?")
								end
							end
						else
							table.remove(v_u_22, v25)
						end
					else
						table.remove(v_u_22, v25)
					end
				end
				if #v_u_20 > 0 then
					workspace:BulkMoveTo(v_u_20, v_u_21, Enum.BulkMoveMode.FireCFrameChanged)
					table.clear(v_u_20)
					table.clear(v_u_21)
				end
			end
		end
	end))
	local function v_u_56(p48, p49)
		-- upvalues: (copy) v_u_18, (copy) v_u_22, (copy) v_u_17
		if game.Workspace:GetAttribute("PrismaticSeedRain") then
			local v50 = math.random(600, 700)
			local v51 = p48 + Vector3.new(0, v50, 0)
			local v_u_52 = game.Workspace.WeatherVisuals.Prismatic:FindFirstChild(p49)
			if v_u_52 then
				v_u_52:PivotTo(CFrame.new(v51, p48))
				local v53 = math.random(10, 14)
				v_u_18[v_u_52] = {
					["startPos"] = v51,
					["endPos"] = p48,
					["speed"] = (p48 - v51).Magnitude / v53,
					["elapsed"] = 0
				}
				local v54 = v_u_22
				table.insert(v54, v_u_52)
				v_u_17:Add(v_u_52:GetAttributeChangedSignal("Activated"):Connect(function()
					-- upvalues: (copy) v_u_52, (ref) v_u_17
					if v_u_52:GetAttribute("Activated") == game.Players.LocalPlayer.Name then
						local v55 = v_u_17:Add(game.SoundService.Lucky_Seed_SFX:Clone())
						v55.Parent = workspace.WeatherVisuals.Prismatic
						v55.Looped = true
						v55.Parent = game:GetService("SoundService").Music.SFX
						game:GetService("Debris"):AddItem(v55, 5)
					end
					v_u_52:Destroy()
				end))
			end
		else
			return
		end
	end
	v_u_17:Add(game.ReplicatedStorage.GameEvents.PrismaticSeedRainEvent.OnClientEvent:Connect(function(p57, p58)
		-- upvalues: (copy) v_u_56
		if game.Workspace:GetAttribute("PrismaticSeedRain") then
			v_u_56(p57, p58)
		end
	end))
	repeat
		task.wait()
	until v_u_2 == false
	for _, v59 in game.Workspace.WeatherVisuals.Prismatic:GetChildren() do
		if string.find(v59.Name, "Seed_") then
			for _, v60 in v59:GetDescendants() do
				if v60:IsA("BasePart") then
					v_u_12.target(v60, 1, 4, {
						["Transparency"] = 1
					})
				end
			end
		end
	end
	v_u_17:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
	if v19 then
		for _, v61 in v19:GetDescendants() do
			if v61:IsA("ParticleEmitter") then
				v61.Enabled = false
			end
		end
		task.wait(3)
		v19:Destroy()
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
	local v62 = {
		["Color"] = v_u_13
	}
	v_u_7:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), v62):Play()
	if v_u_14 then
		v_u_14:Disconnect()
		v_u_14 = nil
	end
end
workspace:GetAttributeChangedSignal("PrismaticSeedRain"):Connect(function()
	-- upvalues: (copy) v_u_63, (ref) v_u_2
	if workspace:GetAttribute("PrismaticSeedRain") then
		v_u_63()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("PrismaticSeedRain") then
	task.defer(v_u_63)
else
	local _ = false
end
return v1