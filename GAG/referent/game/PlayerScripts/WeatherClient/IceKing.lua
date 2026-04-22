local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_4.AddSkybox(v_u_3, 0)
local v_u_5 = game:GetService("TweenService")
local v_u_6 = game.Lighting
local v_u_7 = workspace.Terrain.Clouds
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
local v_u_9 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_10 = require(game.ReplicatedStorage.Modules.Spring)
local v_u_12 = v_u_9.new(Enum.RenderPriority.Camera.Value, function(p11)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p11
end)
v_u_12:Start()
local v_u_13 = require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_14 = require(game.ReplicatedStorage.Modules.Trove)
local v_u_15 = game.Workspace:FindFirstChild("BasePlate")
local v16 = game:GetService("ReplicatedStorage")
local v_u_17 = require(v16.Modules.SoundPlayer)
local v_u_18 = require(v16.Data.SoundData)
local function v_u_19(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_8
	v_u_4.UpdateSkybox(v_u_3, 2)
	task.spawn(function()
		-- upvalues: (ref) v_u_8
		game:GetService("TweenService"):Create(v_u_8, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["Brightness"] = 0.1,
			["Contrast"] = -0.2,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
	end)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1.5), {
		["Density"] = 0.493,
		["Glare"] = 0.85,
		["Haze"] = 2.11,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(1.5), {
		["Ambient"] = Color3.fromRGB(131, 179, 255),
		["ExposureCompensation"] = 0.4,
		["Brightness"] = 1
	}):Play()
	game.Workspace.Terrain.Clouds.Enabled = true
	game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(1.5), {
		["Cover"] = 0.777,
		["Density"] = 0.123,
		["Color"] = Color3.fromRGB(206, 238, 255)
	}):Play()
end
local function v_u_62()
	-- upvalues: (ref) v_u_2, (copy) v_u_14, (copy) v_u_17, (copy) v_u_18, (copy) v_u_13, (copy) v_u_19, (copy) v_u_10, (copy) v_u_15, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7
	v_u_2 = true
	local v_u_20 = v_u_14.new()
	task.delay(0.4, function()
		-- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_13
		local v21 = game.Players.LocalPlayer.Character
		if v21 and v21:IsDescendantOf(workspace) then
			local v22 = {
				["RollOffMaxDistance"] = 10000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 0,
				["PlaybackSpeed"] = 1,
				["TimePosition"] = 0,
				["Looped"] = true
			}
			local v_u_23 = v_u_17:PlaySound(v_u_18.Weather.Frost.coldSound, v22, nil, v21.PrimaryPart)
			game.TweenService:Create(v_u_23, TweenInfo.new(1), {
				["Volume"] = 0.02
			}):Play()
			task.delay(25, function()
				-- upvalues: (copy) v_u_23
				game.TweenService:Create(v_u_23, TweenInfo.new(1), {
					["Volume"] = 0
				}):Play()
				game.Debris:AddItem(v_u_23, 1)
			end)
		end
		v_u_13.EnableShaking()
	end)
	v_u_20:Add(script.WindyFrostEffect:Clone()).Parent = workspace
	local v_u_24 = v_u_20:Add(script.FrozenBaseplate:Clone())
	local v_u_25 = workspace.WeatherVisuals:FindFirstChild("IceGod_Rig")
	local v_u_26 = v_u_25.Humanoid:LoadAnimation(script.Burst)
	for _, v27 in v_u_24:GetDescendants() do
		if v27.Transparency then
			v27.Transparency = 1
		end
	end
	v_u_24.Parent = game.Workspace.WeatherVisuals
	v_u_19(v_u_20)
	v_u_10.target(v_u_15.TopBaseplate, 1, 4, {
		["Color"] = Color3.fromRGB(202, 203, 209)
	})
	for _, v28 in v_u_24:GetDescendants() do
		if v28:IsA("BasePart") then
			v_u_10.target(v28, 0.6, 1, {
				["Transparency"] = 0
			})
		elseif v28:IsA("Texture") then
			v_u_10.target(v28, 0.6, 1, {
				["Transparency"] = 0.85
			})
		end
	end
	task.delay(5, function()
		-- upvalues: (ref) v_u_10, (copy) v_u_25
		if workspace:GetAttribute("IceKing_Shake") == true then
			v_u_25:PivotTo(v_u_25:GetPivot() * CFrame.new(0, 190, 0))
		else
			v_u_10.target(v_u_25, 0.8, 1, {
				["Pivot"] = v_u_25:GetPivot() * CFrame.new(0, 190, 0)
			})
		end
	end)
	task.wait(2)
	local v_u_29 = game.Workspace.WeatherVisuals:FindFirstChild("Pillars")
	if v_u_29 then
		v_u_20:Add(workspace:GetAttributeChangedSignal("IceKing_Shake"):Connect(function()
			-- upvalues: (copy) v_u_29, (ref) v_u_10, (copy) v_u_25, (ref) v_u_12, (ref) v_u_9, (copy) v_u_20, (copy) v_u_26
			if workspace:GetAttribute("IceKing_Shake") then
				local v_u_30 = nil
				for v31 = 1, 5 do
					local v32 = v_u_29:FindFirstChild("Pillar_" .. tostring(v31))
					if v32 then
						local v_u_33 = v32:FindFirstChild("Fruit_Offering")
						if v_u_33 then
							for _, v34 in v_u_33:GetDescendants() do
								if v34:IsA("ParticleEmitter") then
									v34.Enabled = false
								end
							end
							local v_u_35 = Instance.new("NumberValue")
							v_u_35.Value = v_u_33:GetScale()
							v_u_35.Changed:Connect(function()
								-- upvalues: (copy) v_u_33, (copy) v_u_35
								v_u_33:ScaleTo(v_u_35.Value)
							end)
							v_u_10.target(v_u_33, 1, 2, {
								["Pivot"] = v_u_33:GetPivot() * CFrame.new(0, 10, 0)
							})
							task.spawn(function()
								-- upvalues: (copy) v_u_33, (ref) v_u_10
								for _, v36 in v_u_33:GetDescendants() do
									if v36:IsA("BasePart") then
										v_u_10.target(v36, 1, 2, {
											["Transparency"] = 1
										})
									end
								end
							end)
							v_u_10.target(v_u_35, 1, 2, {
								["Value"] = 0.01
							})
							v_u_10.completed(v_u_35, function()
								-- upvalues: (ref) v_u_10, (copy) v_u_33
								v_u_10.stop(v_u_33)
								v_u_33:Destroy()
							end)
						end
					end
					task.wait(0.2)
				end
				local v_u_37 = v_u_25:GetPivot()
				local v_u_38 = 0
				local v_u_39 = false
				local v_u_40 = v_u_25:FindFirstChild("Ice_Cube")
				local v_u_41 = {}
				if v_u_40 then
					for _, v42 in ipairs(v_u_40:GetDescendants()) do
						if v42:IsA("Decal") and v42.Name == "Cracks" then
							table.insert(v_u_41, v42)
							v42.Transparency = 1
						end
					end
				end
				v_u_12:ShakeSustain(v_u_9.Presets.WeakEarthquake)
				task.wait(1)
				task.delay(4, function()
					-- upvalues: (ref) v_u_12
					v_u_12:StopSustained(2)
				end)
				v_u_30 = v_u_20:Add(game:GetService("RunService").Heartbeat:Connect(function(p43)
					-- upvalues: (ref) v_u_38, (ref) v_u_25, (copy) v_u_37, (copy) v_u_41, (ref) v_u_39, (ref) v_u_30, (ref) v_u_26, (copy) v_u_40, (ref) v_u_12, (ref) v_u_20
					v_u_38 = v_u_38 + p43
					local v44 = v_u_38 / 3
					local v45 = math.clamp(v44, 0, 1)
					local _ = v45 ^ 4
					local v46 = (1 - v45) * 4
					local v47 = math.random() * 2 - 1
					local v48 = math.random() * 2 - 1
					local v49 = Vector3.new(v47, 0, v48).Unit * v46
					v_u_25:PivotTo(CFrame.new(v_u_37.Position + v49) * v_u_37.Rotation)
					for _, v50 in ipairs(v_u_41) do
						local v51 = v45 * 2
						v50.Transparency = 1 - math.clamp(v51, 0, 1)
					end
					if v45 >= 0.5 and not v_u_39 then
						v_u_39 = true
					end
					if v45 >= 1 then
						v_u_30:Disconnect()
						v_u_26:Play()
						for _, v52 in ipairs(v_u_41) do
							v52.Transparency = 1
						end
						v_u_40.Transparency = 1
						local v53 = script.SlamVFX:Clone()
						v53.Parent = game.Workspace.WeatherVisuals
						v_u_12:Shake(v_u_12.Presets.SmallExplosion)
						v_u_20:Add(v53)
						for _, v54 in v53:GetDescendants() do
							if v54:IsA("ParticleEmitter") then
								v54:Emit(v54:GetAttribute("EmitCount") or 1)
							end
						end
					end
				end), "Disconnect")
			end
		end))
		v_u_12:ShakeSustain(v_u_9.Presets.WeakEarthquake)
		for v55 = 1, 5 do
			local v56 = v_u_29:FindFirstChild("Pillar_" .. tostring(v55))
			if v56 then
				local v57 = v56:GetAttribute("OriginalPivot")
				v56:PivotTo(v56:GetAttribute("DownPivot"))
				v_u_10.target(v56, 1, 0.25, {
					["Pivot"] = v57
				})
			end
			task.wait(1.5)
		end
		v_u_12:StopSustained(2)
		repeat
			task.wait()
		until v_u_2 == false
		v_u_13.DisableShaking()
		task.spawn(function()
			-- upvalues: (copy) v_u_24, (ref) v_u_10, (copy) v_u_25
			for _, v58 in v_u_24:GetDescendants() do
				if v58:IsA("BasePart") then
					v58.CanCollide = false
					v_u_10.target(v58, 0.8, 3, {
						["Transparency"] = 1
					})
				elseif v58:IsA("Decal") or v58:IsA("Texture") then
					v_u_10.target(v58, 0.8, 3, {
						["Transparency"] = 1
					})
				end
			end
			v_u_25:PivotTo(v_u_25:GetPivot() * CFrame.new(0, -190, 0))
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_15
			v_u_10.target(v_u_15.TopBaseplate, 1, 4, {
				["Color"] = Color3.fromRGB(91, 154, 76)
			})
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_29, (ref) v_u_10
			for v59 = 1, 5 do
				local v60 = v_u_29:FindFirstChild("Pillar_" .. tostring(v59))
				if v60 then
					local v61 = v60:GetAttribute("OriginalPivot")
					v60:PivotTo(v60:GetAttribute("DownPivot"))
					v60.Parent = game.Workspace.WeatherVisuals
					v_u_10.target(v60, 1, 4, {
						["Pivot"] = v61 * CFrame.new(0, -15, 0)
					})
				end
			end
		end)
		v_u_4.UpdateSkybox(v_u_3, 0)
		v_u_5:Create(v_u_6, TweenInfo.new(3), {
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
		v_u_5:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255),
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
		v_u_5:Create(v_u_8, TweenInfo.new(3), {
			["Brightness"] = 0,
			["Contrast"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_5:Create(v_u_7, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0.097,
			["Color"] = Color3.fromRGB(22, 40, 70)
		}):Play()
		v_u_5:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(91, 154, 76)
		}):Play()
		task.wait(1.5)
		v_u_20:Destroy()
	else
		warn("No pillars found!")
	end
end
workspace:GetAttributeChangedSignal("IceKing"):Connect(function()
	-- upvalues: (copy) v_u_62, (ref) v_u_2
	if workspace:GetAttribute("IceKing") then
		v_u_62()
	else
		v_u_2 = false
	end
end)
require(game.ReplicatedStorage.Code.LightningBolt)
if workspace:GetAttribute("IceKing") then
	task.defer(v_u_62)
else
	v_u_2 = false
end
return v1