local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game:GetService("Players")
local v_u_6 = require(v1.Modules.SkyboxManager)
local v_u_7 = require(v1.Modules.SoundPlayer)
local v_u_8 = require(v1.Data.SoundData)
local v_u_9 = script:FindFirstChild("Sky")
local v_u_10 = workspace.CurrentCamera
local _ = script.ConfettiPuff
local v_u_11 = script.LandingParticle
local v_u_12 = script.SkateTrails
local v_u_13 = script.SnowParticles
local v_u_14 = false
local v_u_15 = nil
local v_u_16 = {}
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = {}
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = 0
local v_u_24 = 0
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = 70
local v_u_29 = script:FindFirstChild("BlizzardParticle")
local v_u_30 = game.Lighting:FindFirstChild("SnowColorCorrection")
if not v_u_30 then
	v_u_30 = Instance.new("ColorCorrectionEffect")
	v_u_30.Name = "SnowColorCorrection"
	v_u_30.Brightness = 0
	v_u_30.Parent = game.Lighting
end
local function v_u_76()
	-- upvalues: (ref) v_u_14, (copy) v_u_29, (ref) v_u_15, (ref) v_u_16, (copy) v_u_2, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6, (copy) v_u_3, (ref) v_u_30, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (copy) v_u_5, (ref) v_u_28, (ref) v_u_26, (ref) v_u_27, (copy) v_u_12, (ref) v_u_22, (copy) v_u_4, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (ref) v_u_21, (copy) v_u_20, (ref) v_u_23, (ref) v_u_24, (copy) v_u_13, (ref) v_u_25
	if not v_u_14 and v_u_29 then
		v_u_14 = true
		v_u_15 = Instance.new("Part")
		if v_u_15 then
			v_u_15.Name = "IceRinkParticleHolder"
			v_u_15.Size = Vector3.new(50, 1, 50)
			v_u_15.Anchored = true
			v_u_15.CanCollide = false
			v_u_15.Transparency = 1
			v_u_15.Parent = workspace
		end
		local v31 = Instance.new("Attachment")
		v31.Parent = v_u_15
		v_u_16 = {}
		for _, v32 in v_u_29:GetChildren() do
			if v32:IsA("ParticleEmitter") then
				local v33 = v32:Clone()
				v33.Parent = v31
				v33.Enabled = true
				local v34 = v_u_16
				table.insert(v34, v33)
			end
		end
		v_u_2.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_10
			if v_u_14 and v_u_15 then
				v_u_15.CFrame = v_u_10.CFrame * CFrame.new(0, 20, 0)
			end
		end)
		if v_u_9 then
			v_u_6.AddSkybox(v_u_9)
			v_u_6.UpdateSkybox(v_u_9, 2)
		end
		v_u_3:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = Color3.fromRGB(210, 240, 255),
			["ExposureCompensation"] = 0.2,
			["Brightness"] = 0.6
		}):Play()
		v_u_3:Create(v_u_30, TweenInfo.new(4), {
			["Brightness"] = 0.05,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		local v35 = workspace.BasePlate.TopBaseplate
		local v36 = v35.Texture
		v_u_17 = v35.Color
		v_u_18 = v35.Material
		v_u_19 = v36.ColorMapContent
		v_u_3:Create(v35, TweenInfo.new(1), {
			["Color"] = Color3.fromRGB(170, 255, 255),
			["Reflectance"] = 0.5
		}):Play()
		v36.ColorMapContent = Content.fromUri("rbxassetid://85723048896597")
		v35.Material = Enum.Material.SmoothPlastic
		local v37 = v_u_5.LocalPlayer
		local v_u_38 = v37.Character or v37.CharacterAdded:Wait()
		local v_u_39 = v_u_38:FindFirstChild("HumanoidRootPart")
		v_u_38:FindFirstChild("Head")
		local v_u_40 = v_u_38:FindFirstChild("Left Leg")
		if not (v_u_39 or (v_u_40 or v_u_38:FindFirstChild("Right Leg"))) then
			warn((("No slidable part: %*"):format(v37.DisplayName)))
		end
		local v_u_41 = v_u_38:WaitForChild("Humanoid")
		if not v_u_41 then
			warn((("No humanoid: %*"):format(v37.DisplayName)))
		end
		v_u_28 = v_u_10.FieldOfView
		v_u_26 = v_u_41.WalkSpeed
		v_u_27 = v_u_41.JumpPower
		v_u_41.WalkSpeed = v_u_41.WalkSpeed + 35
		v_u_41.JumpPower = v_u_41.JumpPower + 75
		for _, v42 in v_u_38:GetChildren() do
			if v42:IsA("BasePart") then
				v42.CustomPhysicalProperties = PhysicalProperties.new(0.05, 0, 0, 0, 0)
			end
		end
		local v_u_43 = v_u_12:Clone()
		v_u_43.Parent = v_u_39
		v_u_22 = v_u_41.StateChanged:Connect(function(_, p44)
			-- upvalues: (copy) v_u_43, (copy) v_u_39, (ref) v_u_4, (ref) v_u_10, (copy) v_u_38, (ref) v_u_11, (copy) v_u_40, (ref) v_u_7, (ref) v_u_8
			if p44 == Enum.HumanoidStateType.Jumping then
				v_u_43.Left.SkateTrail.Enabled = false
				v_u_43.Right.SkateTrail.Enabled = false
				if math.random() < 0.25 then
					local v64 = { function()
							-- upvalues: (ref) v_u_39, (ref) v_u_4
							local v45 = Instance.new("Attachment")
							v45.Parent = v_u_39
							local v46 = Instance.new("AngularVelocity")
							v46.Attachment0 = v45
							local v47 = math.random(10, 30)
							v46.AngularVelocity = Vector3.new(0, v47, 0)
							v46.MaxTorque = (1 / 0)
							v46.Parent = v_u_39
							v_u_4:AddItem(v46, 1)
							v_u_4:AddItem(v45, 1)
						end, function()
							-- upvalues: (ref) v_u_10, (ref) v_u_39, (ref) v_u_4, (ref) v_u_38
							local v48 = v_u_10.CFrame.LookVector
							local v49 = v48.X
							local v50 = v48.Z
							local _ = Vector3.new(v49, 0, v50).Unit
							local v51 = Instance.new("Attachment")
							v51.Parent = v_u_39
							local v52 = Instance.new("AngularVelocity")
							v52.Attachment0 = v51
							v52.AngularVelocity = v_u_39.CFrame.RightVector * -6.283185307179586
							v52.MaxTorque = (1 / 0)
							v52.Parent = v_u_39
							v_u_4:AddItem(v52, 1)
							v_u_4:AddItem(v51, 1)
							task.wait(1.25)
							local v53 = v_u_39.CFrame
							local v54 = CFrame.Angles
							local v55 = v_u_39.Orientation.Y
							v_u_38:PivotTo(v53 * v54(0, math.rad(v55), 0))
						end, function()
							-- upvalues: (ref) v_u_10, (ref) v_u_39, (ref) v_u_4, (ref) v_u_38
							local v56 = v_u_10.CFrame.LookVector
							local v57 = v56.X
							local v58 = v56.Z
							local _ = Vector3.new(v57, 0, v58).Unit
							local v59 = Instance.new("Attachment")
							v59.Parent = v_u_39
							local v60 = Instance.new("AngularVelocity")
							v60.Attachment0 = v59
							v60.AngularVelocity = v_u_39.CFrame.RightVector * 6.283185307179586
							v60.MaxTorque = (1 / 0)
							v60.Parent = v_u_39
							v_u_4:AddItem(v60, 1)
							v_u_4:AddItem(v59, 1)
							task.wait(1.25)
							local v61 = v_u_39.CFrame
							local v62 = CFrame.Angles
							local v63 = v_u_39.Orientation.Y
							v_u_38:PivotTo(v61 * v62(0, math.rad(v63), 0))
						end }
					v64[math.random(1, #v64)]()
				end
			else
				if p44 == Enum.HumanoidStateType.Landed then
					local v65 = v_u_11:Clone()
					v65.Parent = v_u_40:FindFirstChild("LeftFootAttachment")
					v65:Emit(math.random(0, 50))
					v_u_4:AddItem(v65, 1.25)
					v_u_7:PlaySound(v_u_8.Weather.IceRink.Pumf, {
						["Volume"] = 0.5,
						["PlaybackSpeed"] = math.random(8, 13) / 10
					})
					v_u_43.Left.SkateTrail.Enabled = true
					v_u_43.Right.SkateTrail.Enabled = true
				end
				return
			end
		end)
		v_u_21 = v_u_39.Touched:Connect(function(p66)
			-- upvalues: (ref) v_u_20, (copy) v_u_38, (ref) v_u_23, (copy) v_u_41, (ref) v_u_24, (ref) v_u_13, (copy) v_u_39, (ref) v_u_4, (ref) v_u_10, (ref) v_u_3, (ref) v_u_25, (ref) v_u_28, (ref) v_u_7, (ref) v_u_8
			if p66:HasTag("IceRinkHoop") then
				if v_u_20[p66] then
					return
				else
					v_u_20[p66] = true
					if v_u_38:FindFirstChild("Head") then
						v_u_23 = v_u_23 + 1
						if v_u_23 >= 3 then
							local v67 = v_u_23 - 3
							local v68 = math.clamp(v67, 1, 3) / 3
							local v69 = v_u_41
							v69.WalkSpeed = v69.WalkSpeed + v68 * 10
							v_u_24 = v_u_24 + v68 * 10
							local v70 = v_u_13:Clone()
							v70.Parent = v_u_39
							local v71 = v_u_23 * 5
							v70:Emit((math.clamp(v71, 10, 50)))
							v_u_4:AddItem(v70, 1.25)
							local v72 = {
								["FieldOfView"] = v_u_10.FieldOfView + v_u_10.FieldOfView * v68
							}
							v_u_3:Create(v_u_10, TweenInfo.new(0.5), v72):Play()
							if v_u_25 then
								task.cancel(v_u_25)
							end
							v_u_25 = task.delay(2, function()
								-- upvalues: (ref) v_u_41, (ref) v_u_24, (ref) v_u_23, (ref) v_u_3, (ref) v_u_10, (ref) v_u_28
								local v73 = v_u_41
								v73.WalkSpeed = v73.WalkSpeed - v_u_24
								v_u_24 = 0
								v_u_23 = 0
								local v74 = {
									["FieldOfView"] = v_u_28
								}
								v_u_3:Create(v_u_10, TweenInfo.new(0.5), v74):Play()
							end)
						end
						v_u_7:PlaySound(v_u_8.Weather.IceRink.Pop, {
							["Volume"] = 0.5,
							["PlaybackSpeed"] = math.random(8, 13) / 10
						}, p66.Position)
						v_u_7:PlaySound(v_u_8.Weather.IceRink.RewardSound, {
							["Volume"] = 0.5,
							["PlaybackSpeed"] = math.random(8, 13) / 10
						}, p66.Position)
						task.wait()
						for _, v75 in p66:GetChildren() do
							if v75:IsA("Decal") then
								v_u_3:Create(v75, TweenInfo.new(1.25), {
									["Transparency"] = 0.25
								}):Play()
							end
						end
					end
				end
			else
				return
			end
		end)
	end
end
local function v_u_86()
	-- upvalues: (ref) v_u_14, (ref) v_u_16, (copy) v_u_4, (ref) v_u_15, (copy) v_u_3, (ref) v_u_30, (copy) v_u_9, (copy) v_u_6, (ref) v_u_17, (ref) v_u_18, (copy) v_u_5, (ref) v_u_26, (ref) v_u_27, (ref) v_u_22, (ref) v_u_21, (copy) v_u_20, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (copy) v_u_10, (ref) v_u_28, (ref) v_u_19
	v_u_14 = false
	for _, v77 in ipairs(v_u_16) do
		v77.Enabled = false
		v_u_4:AddItem(v77, 5)
	end
	table.clear(v_u_16)
	if v_u_15 then
		v_u_15:Destroy()
		v_u_15 = nil
	end
	v_u_3:Create(v_u_30, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
	if v_u_9 then
		v_u_6.UpdateSkybox(v_u_9, 0)
	end
	local v78 = workspace.BasePlate.TopBaseplate
	local v79 = {
		["Color"] = v_u_17,
		["Reflectance"] = 0
	}
	v_u_3:Create(v78, TweenInfo.new(1), v79):Play()
	v78.Material = v_u_18
	local v80 = v_u_5.LocalPlayer
	local v81 = v80.Character
	local v82 = v81:FindFirstChild("Humanoid")
	if v82 then
		v82.WalkSpeed = v_u_26
		v82.JumpPower = v_u_27
	end
	for _, v83 in v81:GetChildren() do
		if v83:IsA("BasePart") then
			v83.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Plastic)
		end
	end
	local v84 = v81:FindFirstChild("HumanoidRootPart")
	if not (v84 or (v81:FindFirstChild("Left Leg") or v81:FindFirstChild("Right Leg"))) then
		warn((("No slidable part: %*"):format(v80.DisplayName)))
	end
	local v85 = v84:FindFirstChild("SkateTrails")
	if v85 then
		v85:Destroy()
	end
	if v_u_22 then
		v_u_22:Disconnect()
		v_u_22 = nil
	end
	if v_u_21 then
		v_u_21:Disconnect()
		v_u_21 = nil
	end
	table.clear(v_u_20)
	v_u_23 = 0
	v_u_24 = 0
	if v_u_25 then
		task.cancel(v_u_25)
	end
	v_u_10.FieldOfView = v_u_28
	v78.Texture.ColorMapContent = v_u_19
end
workspace:GetAttributeChangedSignal("IceRink"):Connect(function()
	-- upvalues: (copy) v_u_76, (copy) v_u_86
	if workspace:GetAttribute("IceRink") == true then
		v_u_76()
	else
		v_u_86()
	end
end)
if workspace:GetAttribute("IceRink") then
	v_u_76()
end
return {}