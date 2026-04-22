local v1 = {}
local v_u_2 = false
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("SoundService")
local v_u_6 = game:GetService("Lighting")
local v_u_7 = game:GetService("Players")
require(v3.Modules.SkyboxManager)
local v_u_8 = require(v3:WaitForChild("Cutscene_Module"))
require(v3:WaitForChild("Field_Of_View_Module"))
local v_u_9 = v_u_6.ColorCorrection:Clone()
v_u_9.Name = script.Name
v_u_9.Parent = v_u_6
local v_u_10 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_11 = require(game.ReplicatedStorage.Modules.Spring)
local v_u_13 = v_u_10.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
v_u_13:Start()
local function v_u_74()
	-- upvalues: (ref) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_13, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (copy) v_u_8, (copy) v_u_9
	v_u_2 = true
	local v_u_14 = script.Particles:Clone()
	v_u_14.Parent = game.Workspace
	local v_u_15 = Instance.new("ColorCorrectionEffect")
	v_u_15.Name = "CarrotColorCorrection"
	v_u_15.TintColor = Color3.new(1, 1, 1)
	v_u_15.Parent = v_u_6
	local v_u_16 = workspace:WaitForChild("RadioactiveCarrot")
	v_u_5.CarrotSpawn:Play()
	v_u_16.Parent = workspace
	local v17 = Instance.new("CFrameValue")
	v17.Value = CFrame.new(v_u_16.CarrotHolder:GetAttribute("StartPosition")) * v_u_16.CarrotHolder:GetPivot().Rotation
	v17.Parent = v_u_16.CarrotHolder
	v17.Changed:Connect(function(p18)
		-- upvalues: (copy) v_u_16
		v_u_16.CarrotHolder:PivotTo(p18)
	end)
	local v19 = v_u_16.Converter.MainTube.Tube
	v19.CFrame = v19.CFrame * CFrame.new(0, -v19.Size.Y / 2, 0)
	local v_u_20 = v19.Size
	v19.Size = v19.Size * Vector3.new(1, 0, 1)
	local v21 = v_u_4:Create(v17, TweenInfo.new(8, Enum.EasingStyle.Quart), {
		["Value"] = v_u_16.CarrotHolder:GetPivot() * CFrame.new(200, 0, 0)
	})
	v21:Play()
	v21.Completed:Once(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_4, (copy) v_u_20
		local v22 = v_u_16.Converter.MainTube.Tube
		v_u_4:Create(v22, TweenInfo.new(1, Enum.EasingStyle.Quart), {
			["Size"] = v_u_20,
			["CFrame"] = v22.CFrame * CFrame.new(0, v_u_20.Y / 2, 0)
		}):Play()
		local v23 = v_u_16.BillboardPart:FindFirstChildWhichIsA("ProximityPrompt")
		print("Enabling Prompt.")
		if v23 then
			v23.Enabled = true
		end
		v_u_16.Billboard.BillboardGui.Enabled = true
	end)
	v_u_13:ShakeSustain(v_u_10.Presets.Vibration)
	task.delay(6, function()
		-- upvalues: (ref) v_u_13
		v_u_13:StopSustained(1)
	end)
	local function v_u_31(p24)
		if p24 and p24:IsA("Model") then
			local v25, v26 = p24:GetBoundingBox()
			local v27 = Instance.new("Part")
			v27.Name = "PrimaryPart"
			v27.Size = v26
			v27.CFrame = v25
			v27.Anchored = true
			v27.CanCollide = false
			v27.Transparency = 1
			v27.Parent = p24
			p24.PrimaryPart = v27
			local v28 = p24.PrimaryPart
			if v28 then
				for _, v29 in p24:GetDescendants() do
					if v29:IsA("BasePart") then
						v29.Anchored = false
						v29.CanCollide = false
						local v30 = Instance.new("WeldConstraint")
						v30.Part0 = v28
						v30.Part1 = v29
						v30.Parent = v28
					end
				end
				v28.Anchored = true
			end
		else
			return
		end
	end
	local function v_u_34(p32)
		for _, v33 in p32:GetDescendants() do
			if v33:IsA("ParticleEmitter") then
				v33:Emit(v33:GetAttribute("EmitCount") or 1)
			end
		end
	end
	local function v_u_42(p35)
		-- upvalues: (ref) v_u_4, (copy) v_u_15, (ref) v_u_13, (ref) v_u_10, (ref) v_u_11
		local v36 = 0
		local v37 = p35:GetPivot()
		if p35:FindFirstChild("Highlight") then
			p35:FindFirstChild("Highlight"):Destroy()
		end
		v_u_4:Create(v_u_15, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, 0, true), {
			["TintColor"] = Color3.fromRGB(255, 100, 100)
		}):Play()
		local v38 = Instance.new("Highlight")
		v38.FillColor = Color3.fromRGB(255, 255, 255)
		v38.OutlineTransparency = 1
		v38.FillTransparency = 0.2
		v38.Parent = p35
		v_u_13:Shake(v_u_10.Presets.Vibration)
		v_u_11.target(v38, 1, 2, {
			["FillTransparency"] = 1
		})
		while v36 < 0.8 do
			v36 = v36 + game:GetService("RunService").Heartbeat:Wait()
			local v39 = 1 - v36 / 0.8
			local v40 = tick() * 90
			local v41 = v39 * math.sin(v40) * 4
			p35:PivotTo(v37 * CFrame.Angles(0, 0, (math.rad(v41))))
		end
	end
	local function v_u_51(p43)
		-- upvalues: (ref) v_u_4
		local v44 = p43:FindFirstChild("Alarm")
		local v45 = p43:FindFirstChild("Screen")
		local v46 = v44:FindFirstChild("Light")
		local v47 = v44:FindFirstChild("Light_Part")
		local v48 = v46:FindFirstChild("PointLight")
		local v49 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0)
		for _, v50 in v45:GetChildren() do
			if v50.Color == Color3.fromRGB(69, 120, 202) then
				v50.Color = Color3.fromRGB(212, 42, 45)
			elseif v50.Color == Color3.fromRGB(0, 46, 63) then
				v50.Color = Color3.fromRGB(80, 0, 5)
			end
		end
		v45.MainPart.BrickColor = BrickColor.new("Really red")
		v45.MainPart.SurfaceGui.TextLabel.Visible = false
		v45.MainPart.SurfaceGui.ChargeValue.Visible = false
		v45.MainPart.SurfaceGui.Launching.Visible = true
		v_u_4:Create(v45.MainPart.SurfaceGui.Launching, v49, {
			["TextTransparency"] = 0.8
		}):Play()
		v48.Enabled = true
		v_u_4:Create(v48, v49, {
			["Brightness"] = 2.5
		}):Play()
		v46.BrickColor = BrickColor.new("Really red")
		v47.BrickColor = BrickColor.new("Really red")
	end
	local v_u_52 = nil
	local function v_u_70()
		-- upvalues: (copy) v_u_51, (copy) v_u_31, (ref) v_u_11, (copy) v_u_34, (copy) v_u_14, (ref) v_u_7, (ref) v_u_4, (copy) v_u_42, (ref) v_u_13, (ref) v_u_10, (copy) v_u_15, (ref) v_u_8, (ref) v_u_52, (ref) v_u_6, (ref) v_u_9
		local v53 = game.Workspace:FindFirstChild("RadioactiveCarrot")
		local v_u_54 = game.Workspace:FindFirstChild("RadioactiveCarrot"):FindFirstChild("CarrotHolder"):FindFirstChild("Carrot")
		local v_u_55 = v53:FindFirstChild("Screen")
		v_u_51(v_u_54.Parent.Parent)
		v_u_31(v_u_54)
		local v56 = v_u_54:FindFirstChild("Window")
		if v56 then
			v56.Material = Enum.Material.Neon
			v_u_11.target(v56, 1, 4, {
				["Color"] = Color3.fromRGB(0, 255, 0),
				["Transparency"] = 0
			})
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_34, (ref) v_u_14
			for _ = 1, 35 do
				v_u_34(v_u_14)
				task.wait(0.15625)
			end
		end)
		for _ = 1, 5 do
			local v_u_57 = nil
			task.spawn(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_55, (copy) v_u_57, (ref) v_u_4
				local v58 = v_u_7.LocalPlayer.Character
				local v59 = v58.HumanoidRootPart
				local v60 = v_u_55:GetPivot().Position
				if v58 and v59 then
					if (v59.Position - v60).Magnitude <= 65 then
						v59.AssemblyLinearVelocity = ((v59.Position - v60).Unit * Vector3.new(1, 0, 1) + Vector3.new(0, 0.5, 0)) * (v_u_57 or 225)
						local v61 = v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
							["FieldOfView"] = 90
						})
						v61:Play()
						v61.Completed:Once(function()
							-- upvalues: (ref) v_u_4
							v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(1), {
								["FieldOfView"] = 70
							}):Play()
						end)
					end
				else
					return
				end
			end)
			v_u_42(v_u_54)
			task.wait(0.5)
		end
		v_u_54.PrimaryPart.Anchored = true
		v_u_13:Shake(v_u_10.Presets.Explosion)
		v_u_54.Parent.Parent.Screen.MainPart.SurfaceGui.Launching.Text = "LAUNCHED"
		v_u_54.Engine.Attachment.Smoke.Enabled = true
		v_u_54.Engine.Attachment.Fire_1_Toon.Enabled = true
		local v_u_62 = 350
		task.spawn(function()
			-- upvalues: (ref) v_u_7, (copy) v_u_55, (copy) v_u_62, (ref) v_u_4
			local v63 = v_u_7.LocalPlayer.Character
			local v64 = v63.HumanoidRootPart
			local v65 = v_u_55:GetPivot().Position
			if v63 and v64 then
				if (v64.Position - v65).Magnitude <= 65 then
					v64.AssemblyLinearVelocity = ((v64.Position - v65).Unit * Vector3.new(1, 0, 1) + Vector3.new(0, 0.5, 0)) * (v_u_62 or 225)
					local v66 = v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
						["FieldOfView"] = 90
					})
					v66:Play()
					v66.Completed:Once(function()
						-- upvalues: (ref) v_u_4
						v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(1), {
							["FieldOfView"] = 70
						}):Play()
					end)
				end
			else
				return
			end
		end)
		v_u_34(v_u_14)
		v_u_4:Create(v_u_15, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, 0, true), {
			["TintColor"] = Color3.fromRGB(255, 100, 100)
		}):Play()
		local v_u_67 = 5
		local v69 = game:GetService("RunService").RenderStepped:Connect(function(p68)
			-- upvalues: (copy) v_u_54, (ref) v_u_67
			v_u_54:PivotTo(v_u_54:GetPivot() * CFrame.new(0, p68 * -1 * v_u_67, 0))
			v_u_67 = v_u_67 + p68 * 100
		end)
		task.wait(3)
		v_u_8.Flash(1)
		v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 90
		}):Play()
		v_u_13:Shake(v_u_10.Presets.Explosion)
		task.wait(0.5)
		v_u_13:ShakeSustain(v_u_10.Presets.WeakEarthquake)
		v_u_52 = script.RadiationEffects:Clone()
		v_u_52.Parent = workspace
		v_u_4:Create(game.Lighting, TweenInfo.new(2), {
			["Ambient"] = Color3.fromRGB(70, 70, 70),
			["Brightness"] = 2,
			["OutdoorAmbient"] = Color3.fromRGB(172, 172, 172),
			["ClockTime"] = 3.277,
			["ExposureCompensation"] = 0.5
		}):Play()
		v_u_6.Atmosphere.Color = Color3.fromRGB(255, 213, 0)
		v_u_6.Atmosphere.Decay = Color3.fromRGB(255, 255, 255)
		v_u_4:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
			["Density"] = 0.5,
			["Haze"] = 2.05,
			["Glare"] = 0.32
		}):Play()
		v_u_4:Create(v_u_9, TweenInfo.new(2), {
			["Brightness"] = 0,
			["Contrast"] = 0.1,
			["Saturation"] = 0.15,
			["TintColor"] = Color3.fromRGB(201, 201, 255)
		}):Play()
		v_u_4:Create(v_u_9, TweenInfo.new(1), {
			["Contrast"] = -0.2,
			["Saturation"] = 0.2
		}):Play()
		v69:Disconnect()
		v_u_54:Destroy()
		v_u_4:Create(workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 70
		}):Play()
	end
	local v_u_71 = nil
	v_u_71 = game.ReplicatedStorage.GameEvents.Fire_TheCarrot.OnClientEvent:Connect(function()
		-- upvalues: (ref) v_u_71, (copy) v_u_70
		v_u_71:Disconnect()
		v_u_70()
	end)
	local v72, v73
	if workspace:GetAttribute("FiredCarrot") and v_u_2 then
		v_u_70()
		v72 = v_u_71
		v73 = v_u_52
	else
		v72 = v_u_71
		v73 = v_u_52
	end
	repeat
		task.wait()
	until v_u_2 == false
	if v_u_15 then
		v_u_15:Destroy()
	end
	if v_u_14 then
		v_u_14:Destroy()
	end
	if v73 then
		v73:Destroy()
	end
	v_u_13:StopSustained(2)
	if v72.Connected then
		v72:Disconnect()
	end
	v_u_4:Create(game.Lighting.Atmosphere, TweenInfo.new(4), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_4:Create(v_u_9, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game:GetService("Debris"):AddItem(v_u_9, 3)
	v_u_4:Create(v_u_6, TweenInfo.new(3), {
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["Ambient"] = v_u_6:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = 0,
		["Brightness"] = v_u_6:GetAttribute("DefaultBrightness"),
		["ClockTime"] = 14,
		["GeographicLatitude"] = 29.475
	}):Play()
end
workspace:GetAttributeChangedSignal("RadioactiveCarrot"):Connect(function()
	-- upvalues: (copy) v_u_74, (ref) v_u_2
	if workspace:GetAttribute("RadioactiveCarrot") then
		v_u_74()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("RadioactiveCarrot") then
	task.defer(v_u_74)
else
	v_u_2 = false
end
return v1