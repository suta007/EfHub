local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = script.Sky
local v_u_5 = require(v_u_3.Modules.SkyboxManager)
local v_u_6 = require(v_u_3.Code.CameraShaker)
local v_u_7 = require(v_u_3.Modules.SoundPlayer)
local v_u_8 = require(v_u_3.Data.SoundData)
local v_u_9 = game.Lighting.ColorCorrection:Clone()
v_u_9.Name = script.Name
v_u_9.Parent = game.Lighting
v_u_5.AddSkybox(v_u_4, 0)
local v_u_11 = v_u_6.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
v_u_11:Start()
local function v_u_99()
	-- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_11, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_9
	v_u_2 = true
	local v_u_12 = v_u_3.WaterLevel:Clone()
	v_u_12.Parent = workspace
	v_u_11:ShakeSustain(v_u_6.Presets.Earthquake)
	local v_u_13 = false
	local v_u_14 = false
	local v_u_15 = true
	local v_u_16 = v_u_7:PlaySound(v_u_8.Weather.UnderTheSea.Liquid, {
		["Looped"] = true,
		["Volume"] = 0
	}, nil, nil)
	local v35 = task.spawn(function()
		-- upvalues: (copy) v_u_12, (ref) v_u_14, (ref) v_u_5, (ref) v_u_4, (ref) v_u_15, (ref) v_u_11, (ref) v_u_9, (ref) v_u_6, (ref) v_u_3, (ref) v_u_2, (copy) v_u_16, (ref) v_u_13
		while true do
			task.wait(0.1)
			local v17 = workspace.CurrentCamera.CFrame
			if v17.Position.Y < v_u_12.Position.Y and not v_u_14 then
				v_u_14 = true
				v_u_5.UpdateSkybox(v_u_4, 3)
				game.Lighting.Ambient = Color3.fromRGB(0, 132, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(147, 161, 255)
				game.SoundService.AmbientReverb = Enum.ReverbType.UnderWater
				for _, v18 in game.SoundService.Music:GetDescendants() do
					if v18:HasTag("UnderWater") then
						v18.Enabled = true
					end
				end
				if v_u_15 then
					v_u_15 = false
					v_u_11:StopSustained()
					game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
						["FieldOfView"] = 90
					}):Play()
					game.TweenService:Create(v_u_9, TweenInfo.new(0.3), {
						["Brightness"] = 0.7
					}):Play()
					v_u_11:Shake(v_u_6.Presets.Explosion)
					local v_u_19 = v_u_3.Bubble:Clone()
					v_u_19.Parent = workspace.Visuals
					task.spawn(function()
						-- upvalues: (ref) v_u_3
						local v20 = workspace.CurrentCamera.FieldOfView / 2
						local v21 = math.rad(v20)
						local v22 = math.tan(v21) * 10
						local v23 = v22 * 1.2 / 1.78
						local v_u_24 = v_u_3.SubmergeEffect:Clone()
						v_u_24.Size = Vector3.new(v23, v22, 0.1)
						v_u_24.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5)
						v_u_24.Parent = workspace.Visuals
						local v_u_29 = game:GetService("RunService").RenderStepped:Connect(function()
							-- upvalues: (copy) v_u_24
							local v25 = workspace.CurrentCamera.FieldOfView / 2
							local v26 = math.rad(v25)
							local v27 = math.tan(v26) * 10
							local v28 = v27 * (workspace.CurrentCamera.ViewportSize.X / workspace.CurrentCamera.ViewportSize.Y)
							v_u_24.Size = Vector3.new(v28, v27, 0.1)
							v_u_24.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5)
						end)
						for _, v_u_30 in v_u_24:GetDescendants() do
							if v_u_30:IsA("ParticleEmitter") then
								v_u_30:Emit(v_u_30:GetAttribute("EmitCount"))
								v_u_30.Enabled = true
								task.delay(0.6, function()
									-- upvalues: (copy) v_u_30
									v_u_30.Enabled = false
								end)
							end
						end
						task.delay(1.6, function()
							-- upvalues: (copy) v_u_29, (copy) v_u_24
							v_u_29:Disconnect()
							v_u_24:Destroy()
						end)
					end)
					for _, v31 in v_u_19:GetChildren() do
						if v31:IsA("ParticleEmitter") then
							v31:Emit(90)
						end
					end
					task.delay(4, function()
						-- upvalues: (copy) v_u_19
						for _, v32 in v_u_19:GetChildren() do
							if v32:IsA("ParticleEmitter") then
								game.TweenService:Create(v32, TweenInfo.new(7), {
									["Rate"] = 25
								}):Play()
							end
						end
						game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(3), {
							["FieldOfView"] = 70
						}):Play()
					end)
					task.spawn(function()
						-- upvalues: (ref) v_u_2, (copy) v_u_19
						repeat
							task.wait()
						until v_u_2 == false
						for _, v33 in v_u_19:GetChildren() do
							if v33:IsA("ParticleEmitter") then
								v33.Enabled = false
							end
						end
						task.delay(3, function()
							-- upvalues: (ref) v_u_19
							v_u_19:Destroy()
						end)
					end)
					task.delay(0.7, function()
						-- upvalues: (ref) v_u_9
						game.TweenService:Create(v_u_9, TweenInfo.new(0.3), {
							["Brightness"] = 0.1
						}):Play()
					end)
				end
				v_u_9.TintColor = Color3.fromRGB(207, 234, 255)
				v_u_16.Volume = 0.35
			elseif v_u_14 == true and v17.Position.Y >= v_u_12.Position.Y then
				v_u_5.UpdateSkybox(v_u_4, 0)
				game.Lighting.Ambient = game.Lighting:GetAttribute("DefaultAmbient")
				game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				v_u_9.Brightness = 0
				v_u_9.TintColor = Color3.fromRGB(255, 255, 255)
				v_u_14 = false
				game.SoundService.AmbientReverb = Enum.ReverbType.NoReverb
				for _, v34 in game.SoundService.Music:GetDescendants() do
					if v34:HasTag("UnderWater") then
						v34.Enabled = false
					end
				end
				v_u_16.Volume = 0
			end
			if game.Players.LocalPlayer.Character then
				if game.Players.LocalPlayer.Character:GetPivot().Position.Y < v_u_12.Position.Y then
					v_u_13 = true
				else
					v_u_13 = false
				end
			end
		end
	end)
	local v36 = game.Players.LocalPlayer.Character
	if not v36 then
		repeat
			task.wait()
		until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:IsDescendantOf(workspace)
		v36 = game.Players.LocalPlayer.Character
	end
	local v_u_37 = script.AlignPosition:Clone()
	local v_u_38 = script.AlignOrientation:Clone()
	v_u_37.Attachment0 = v36:WaitForChild("HumanoidRootPart"):WaitForChild("RootAttachment")
	v_u_38.Attachment0 = v_u_37.Attachment0
	v_u_37.Parent = v36.PrimaryPart
	v_u_38.Parent = v36.PrimaryPart
	local v_u_39 = Vector3.new(0, 0, 0)
	local v_u_40 = v36.HumanoidRootPart.RootJoint.C0
	local v_u_41 = v36.Humanoid:LoadAnimation(script.WalkAnim)
	local v_u_42 = {}
	local v96 = game:GetService("RunService").Stepped:Connect(function(_)
		-- upvalues: (ref) v_u_39, (copy) v_u_42, (copy) v_u_37, (copy) v_u_38, (ref) v_u_13, (copy) v_u_40, (copy) v_u_41
		task.spawn(function()
			-- upvalues: (ref) v_u_39, (ref) v_u_42
			for _, v43 in game.Players:GetPlayers() do
				if v43.Character and v43 ~= game.Players.LocalPlayer then
					if not v43.Character:GetAttribute("NormalC0") then
						v43.Character:SetAttribute("NormalC0", v43.Character.HumanoidRootPart.RootJoint.C0)
					end
					local v44 = v43.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
					local v45 = v43.Character.PrimaryPart.AssemblyLinearVelocity.Unit
					local v46 = v43.Character.PrimaryPart.CFrame
					local v47 = (v46:inverse() * CFrame.new(v46.p + v45)).p
					local v48 = v_u_39.x + v47.x * 1
					local v49 = math.min(16, v48)
					local v50 = math.max(-16, v49)
					local v51 = v_u_39.y + v47.y * 1
					local v52 = -math.max(-16, v51)
					local v53 = v_u_39.z + v47.z * 1
					local v54 = math.min(16, v53)
					local v55 = math.max(-16, v54)
					local v56 = Vector3.new(v50, v52, v55) * 60
					local v57 = v43.Character:GetAttribute("NormalC0")
					local v58 = RaycastParams.new()
					v58.FilterDescendantsInstances = { v43.Character }
					v58.FilterType = Enum.RaycastFilterType.Exclude
					local v59 = workspace:Raycast(v43.Character.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v58)
					if v59 or (v44 <= 5 or v_u_42[v43]) then
						if v44 < 8 then
							game.TweenService:Create(v43.Character.HumanoidRootPart.RootJoint, TweenInfo.new(0.4), {
								["C0"] = v57
							}):Play()
							if v59 and v_u_42[v43] then
								v_u_42[v43]:Stop()
								v_u_42[v43] = nil
							end
						end
					else
						v_u_42[v43] = v43.Character.Humanoid.Animator:LoadAnimation(script.WalkAnim)
						v_u_42[v43]:Play()
						local v60 = v56.Z / 16
						local v61 = -math.clamp(v60, -1, 1)
						print(v61)
						local v62 = game.TweenService
						local v63 = v43.Character.HumanoidRootPart.RootJoint
						local v64 = TweenInfo.new(0.4)
						local v65 = {}
						local v66 = CFrame.Angles
						local v67 = v61 * 70
						v65.C0 = v57 * v66(math.rad(v67), 0, 0)
						v62:Create(v63, v64, v65):Play()
					end
				end
			end
		end)
		local v68 = game.Players.LocalPlayer.Character
		if v68 then
			local v69 = v68:FindFirstChild("Humanoid")
			local v70 = v69.MoveDirection
			local v71 = game.Workspace.CurrentCamera.CFrame
			local v72 = (v71:inverse() * CFrame.new(v71.p + v70)).p
			v_u_39 = v_u_39 * 0.95
			game:GetService("UserInputService"):GetFocusedTextBox()
			local v73 = v_u_39.x + v72.x * 1
			local v74 = math.min(16, v73)
			local v75 = math.max(-16, v74)
			local v76 = v_u_39.y + v72.y * 1
			local v77 = -math.max(-16, v76)
			local v78 = v_u_39.z + v72.z * 1
			local v79 = math.min(16, v78)
			local v80 = math.max(-16, v79)
			v_u_39 = Vector3.new(v75, v77, v80)
			v_u_37.Position = (v68.HumanoidRootPart.CFrame * CFrame.new(v_u_39)).Position
			local v81 = v_u_39.Z / 16
			local v82 = -math.clamp(v81, -1, 1)
			v_u_38.CFrame = v71
			local v83 = v_u_39.X / 16
			local v84 = -math.clamp(v83, -1, 1)
			local v85 = RaycastParams.new()
			v85.FilterDescendantsInstances = { v68 }
			v85.FilterType = Enum.RaycastFilterType.Exclude
			if v_u_13 and not workspace:Raycast(v68.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v85) then
				v69.PlatformStand = true
				v_u_37.Enabled = true
				v_u_38.Enabled = true
				if v72.Magnitude > 0 then
					if not v_u_41.IsPlaying then
						v_u_41:Play()
					end
				else
					v_u_41:Stop()
				end
				local v86 = game.TweenService
				local v87 = v68.HumanoidRootPart.RootJoint
				local v88 = TweenInfo.new(0.1)
				local v89 = {}
				local v90 = v_u_40
				local v91 = CFrame.Angles
				local v92 = v82 * 70
				local v93 = math.rad(v92)
				local v94 = v84 * 35
				v89.C0 = v90 * v91(v93, math.rad(v94), 0)
				v86:Create(v87, v88, v89):Play()
			else
				v_u_37.Enabled = false
				v_u_38.Enabled = false
				v69.PlatformStand = false
				local v95 = {
					["C0"] = v_u_40
				}
				game.TweenService:Create(v68.HumanoidRootPart.RootJoint, TweenInfo.new(0.1), v95):Play()
				v_u_41:Stop()
			end
		else
			return
		end
	end)
	game.TweenService:Create(v_u_12, TweenInfo.new(8), {
		["CFrame"] = v_u_12.CFrame * CFrame.new(0, 500, 0)
	}):Play()
	repeat
		task.wait()
	until v_u_2 == false
	game.TweenService:Create(v_u_12, TweenInfo.new(8), {
		["CFrame"] = v_u_12.CFrame * CFrame.new(0, -500, 0)
	}):Play()
	task.wait(8)
	v96:Disconnect()
	task.cancel(v35)
	v_u_5.UpdateSkybox(v_u_4, 0)
	game.Lighting.Ambient = game.Lighting:GetAttribute("DefaultAmbient")
	game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	for _, v_u_97 in game.Players:GetPlayers() do
		task.spawn(function()
			-- upvalues: (copy) v_u_42, (copy) v_u_97
			if v_u_42[v_u_97] then
				v_u_42[v_u_97]:Stop()
				v_u_42[v_u_97] = nil
			end
			game.TweenService:Create(v_u_97.Character.HumanoidRootPart.RootJoint, TweenInfo.new(0.1), {
				["C0"] = v_u_97.Character:GetAttribute("NormalC0")
			}):Play()
		end)
	end
	v_u_9.Brightness = 0
	v_u_9.TintColor = Color3.fromRGB(255, 255, 255)
	game.SoundService.AmbientReverb = Enum.ReverbType.NoReverb
	v_u_16:Destroy()
	for _, v98 in game.SoundService.Music:GetDescendants() do
		if v98:HasTag("UnderWater") then
			v98.Enabled = false
		end
	end
	v_u_37.Enabled = false
	v_u_38.Enabled = false
	v36.Humanoid.PlatformStand = false
	v36.HumanoidRootPart.RootJoint.C0 = v_u_40
	v_u_12:Destroy()
	v_u_41:Stop()
	v_u_41:Destroy()
	v_u_5.UpdateSkybox(v_u_4, 0)
end
workspace:GetAttributeChangedSignal("UnderTheSea"):Connect(function()
	-- upvalues: (copy) v_u_99, (ref) v_u_2
	if workspace:GetAttribute("UnderTheSea") then
		v_u_99()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("UnderTheSea") then
	task.defer(v_u_99)
else
	v_u_2 = false
end
return v1