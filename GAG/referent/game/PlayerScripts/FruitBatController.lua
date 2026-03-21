local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Trove)
local v_u_3 = {}
local function v_u_138(p_u_4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5 = nil
	local v_u_6 = v_u_2.new()
	local v_u_7 = nil
	local function v_u_100()
		-- upvalues: (copy) v_u_6, (ref) v_u_5, (ref) v_u_7
		local v_u_8 = game:GetService("Players")
		local v9 = game:GetService("RunService")
		local v_u_10 = game:GetService("TweenService")
		local v_u_11 = workspace.CurrentCamera
		local v_u_12 = v_u_6:Add(script.AlignPosition:Clone())
		local v_u_13 = v_u_6:Add(script.AlignOrientation:Clone())
		local v_u_14 = v_u_5:WaitForChild("HumanoidRootPart")
		local v15 = v_u_14:WaitForChild("RootAttachment")
		v_u_6:Add(function()
			-- upvalues: (ref) v_u_5
			task.defer(function()
				-- upvalues: (ref) v_u_5
				v_u_5.Humanoid.PlatformStand = false
			end)
		end)
		v_u_12.Attachment0 = v15
		v_u_13.Attachment0 = v15
		v_u_12.Parent = v_u_14
		v_u_13.Parent = v_u_14
		v_u_12.Responsiveness = 35
		v_u_13.Responsiveness = 300
		v_u_13.RigidityEnabled = false
		local v_u_16 = Vector3.new(0, 0, 0)
		local v_u_17 = v_u_14:FindFirstChild("RootJoint").C0
		local v_u_18 = Vector3.new(0, 0, 1)
		local v_u_19 = Vector3.new(0, 0, 1)
		local v_u_20 = true
		local function v_u_27(p21)
			-- upvalues: (copy) v_u_8, (copy) v_u_10
			for _, v22 in v_u_8:GetPlayers() do
				if v22 ~= v_u_8.LocalPlayer then
					local v23 = v22.Character
					if v23 then
						v23 = v23:FindFirstChild("HumanoidRootPart")
					end
					local v24
					if v23 then
						v24 = v23:FindFirstChild("RootJoint") or v23:FindFirstChild("Root")
					else
						v24 = nil
					end
					if v24 then
						local v25 = v24:FindFirstChild("__NormalC0")
						if not v25 then
							v25 = Instance.new("CFrameValue")
							v25.Name = "__NormalC0"
							v25.Value = v24.C0
							v25.Parent = v24
						end
						local v26 = v25.Value
						if p21 and p21 > 0 then
							v_u_10:Create(v24, TweenInfo.new(p21), {
								["C0"] = v26
							}):Play()
						else
							v24.C0 = v26
						end
					end
				end
			end
		end
		v_u_6:Add(function()
			-- upvalues: (ref) v_u_20, (copy) v_u_14, (copy) v_u_10, (copy) v_u_17, (copy) v_u_27
			v_u_20 = false
			local v28 = v_u_14
			local v29
			if v28 then
				v29 = v28:FindFirstChild("RootJoint") or v28:FindFirstChild("Root")
			else
				v29 = nil
			end
			if v29 then
				local v30 = {
					["C0"] = v_u_17
				}
				v_u_10:Create(v29, TweenInfo.new(0.12), v30):Play()
			end
			v_u_27(0.15)
		end)
		v_u_6:Add(v9.Stepped:Connect(function(_, p31)
			-- upvalues: (ref) v_u_20, (copy) v_u_8, (copy) v_u_10, (ref) v_u_5, (copy) v_u_14, (copy) v_u_11, (ref) v_u_19, (ref) v_u_16, (copy) v_u_12, (ref) v_u_18, (copy) v_u_13, (ref) v_u_7, (copy) v_u_17
			if v_u_20 then
				for _, v32 in v_u_8:GetPlayers() do
					if v32 ~= v_u_8.LocalPlayer then
						local v33 = v32.Character
						if v33 then
							local v34 = v33:FindFirstChild("HumanoidRootPart")
							if v34 then
								local v35
								if v34 then
									v35 = v34:FindFirstChild("RootJoint") or v34:FindFirstChild("Root")
								else
									v35 = nil
								end
								if v35 then
									local v36 = v35:FindFirstChild("__NormalC0")
									if not v36 then
										v36 = Instance.new("CFrameValue")
										v36.Name = "__NormalC0"
										v36.Value = v35.C0
										v36.Parent = v35
									end
									local v37 = v36.Value
									local v38 = v34.AssemblyLinearVelocity.Magnitude
									local v39 = RaycastParams.new()
									v39.FilterDescendantsInstances = { v33 }
									v39.FilterType = Enum.RaycastFilterType.Exclude
									if workspace:Raycast(v34.Position, Vector3.new(0, -5, 0), v39) ~= nil or v38 <= 5 then
										v_u_10:Create(v35, TweenInfo.new(0.22), {
											["C0"] = v37
										}):Play()
									else
										local v40 = v34.CFrame
										local v41 = v34.AssemblyLinearVelocity.X
										local v42 = v34.AssemblyLinearVelocity.Z
										local v43 = v40:VectorToObjectSpace((Vector3.new(v41, 0, v42))).Z / 16
										local v44 = -math.clamp(v43, -1, 1)
										local v45 = v_u_10
										local v46 = TweenInfo.new(0.22)
										local v47 = {}
										local v48 = CFrame.Angles
										local v49 = v44 * 70
										v47.C0 = v37 * v48(math.rad(v49), 0, 0)
										v45:Create(v35, v46, v47):Play()
									end
								end
							end
						end
					end
				end
				if v_u_5 then
					if v_u_14 and v_u_14.Parent then
						local v50 = v_u_5:FindFirstChild("Humanoid")
						if v50 then
							local v51 = v50.MoveDirection
							local v52 = v51.Magnitude < 0.05 and Vector3.new(0, 0, 0) or v51
							local v53 = v_u_11.CFrame
							local v54 = v53.LookVector
							local v55 = v53.RightVector
							local v56 = v54.X
							local v57 = v54.Z
							local v58 = Vector3.new(v56, 0, v57)
							local v59
							if v58.Magnitude < 0.001 then
								v59 = v_u_19
							else
								v59 = v58.Unit
								v_u_19 = v59
							end
							local v60 = v59:Cross(Vector3.new(0, 1, 0))
							local v61 = (v60.Magnitude < 0.001 and Vector3.new(1, 0, 0) or v60).Unit
							local v62 = v52:Dot(v59)
							local v63 = v52:Dot(v61) * v55 + v62 * v54
							local v64 = v63.Magnitude < 0.05 and Vector3.new(0, 0, 0) or v63
							local v65 = v_u_14.AssemblyLinearVelocity
							local v66 = v_u_16.X * 0.9 + v64.X * 0.6
							local v67 = v_u_16.Y * 0.85 + v64.Y * 0.6
							local v68 = v_u_16.Z * 0.9 + v64.Z * 0.6
							v_u_16 = Vector3.new(v66, v67, v68)
							local v69 = v_u_16.X
							local v70 = math.clamp(v69, -8, 8)
							local v71 = v_u_16.Y
							local v72 = math.clamp(v71, -8, 8)
							local v73 = v_u_16.Z
							local v74 = math.clamp(v73, -8, 8)
							v_u_16 = Vector3.new(v70, v72, v74)
							local v75 = v64.Y
							if math.abs(v75) < 0.01 then
								local v76 = v65.Y
								if math.abs(v76) < 0.2 then
									local v77 = v_u_16.X
									local v78 = v_u_16.Z
									v_u_16 = Vector3.new(v77, 0, v78)
								end
							end
							v_u_12.Position = v_u_14.Position + v_u_16
							local v79 = v65.X
							local v80 = v65.Z
							local v81 = Vector3.new(v79, 0, v80).Magnitude
							local v82 = v65.Y
							local v83 = math.abs(v82)
							local v84
							if v64.Magnitude < 0.03 and (v81 < 0.35 and v83 < 0.35) then
								v84 = v_u_16.Magnitude < 0.2
							else
								v84 = false
							end
							local v85 = v_u_19
							if v84 or (v64.Magnitude <= 0.05 or not v64) then
								if v84 or (v65.Magnitude <= 0.05 or not v65) then
									local v86 = v85.X
									local v87 = v85.Z
									v65 = Vector3.new(v86, 0, v87)
								end
							else
								v65 = v64
							end
							local v88
							if v65.Magnitude > 0.001 then
								v88 = v65.Unit
							else
								v88 = v_u_18
							end
							local v89 = -p31 * (v84 and 60 or 34)
							v_u_18 = v_u_18:Lerp(v88, 1 - math.exp(v89)).Unit
							v_u_13.CFrame = CFrame.lookAt(v_u_14.Position, v_u_14.Position + v_u_18, Vector3.new(0, 1, 0))
							if v_u_7 then
								if v84 then
									v_u_7:AdjustSpeed(0.5)
								else
									v_u_7:AdjustSpeed(1)
								end
							end
							local v90 = RaycastParams.new()
							v90.FilterDescendantsInstances = { v_u_5 }
							v90.FilterType = Enum.RaycastFilterType.Exclude
							local _ = workspace:Raycast(v_u_14.Position, Vector3.new(0, -5, 0), v90) == nil
							v50.PlatformStand = true
							v_u_12.Enabled = true
							v_u_13.Enabled = true
							if v_u_14:FindFirstChild("RootJoint") then
								local v91 = v_u_14.CFrame:VectorToObjectSpace(v_u_16).X / 16
								local v92 = -math.clamp(v91, -1, 1)
								local v93 = v_u_10
								local v94 = v_u_14:FindFirstChild("RootJoint")
								local v95 = TweenInfo.new(0.08)
								local v96 = {}
								local v97 = v_u_17
								local v98 = CFrame.Angles
								local v99 = v92 * 35
								v96.C0 = v97 * v98(0, 0, (math.rad(v99)))
								v93:Create(v94, v95, v96):Play()
							end
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end))
	end
	local function v_u_131()
		-- upvalues: (ref) v_u_5, (copy) p_u_4, (copy) v_u_6, (copy) v_u_100, (ref) v_u_7
		if v_u_5 then
			local v101 = p_u_4:GetAttribute("FruitBat")
			workspace:GetAttribute("GlassAnimalConcert")
			local v102 = v_u_5:GetAttribute("FruitBat")
			v_u_6:Clean()
			if v101 then
				v_u_100()
			end
			if v101 and not v102 then
				v_u_5:SetAttribute("FruitBat", true)
				for _, v103 in v_u_5:GetDescendants() do
					if v103:IsA("BasePart") then
						v103:SetAttribute("OldTransparency", v103.Transparency)
						v103.Transparency = v103.Name == "Head" and 0.99 or 1
					elseif v103:IsA("Decal") then
						v103:SetAttribute("OldTransparency", v103.Transparency)
						v103.Transparency = 1
					end
				end
				local v_u_104 = script.BatModel_Rigged:Clone()
				v_u_104.Parent = v_u_5
				task.spawn(function()
					-- upvalues: (copy) v_u_104
					if game.Workspace:GetAttribute("VampireBatThirst") then
						local v105 = Color3.fromRGB(255, 0, 0)
						v_u_104.Eye.Color = v105
						v_u_104.Eye1.Color = v105
						for _, v106 in v_u_104.RootPart:GetDescendants() do
							if v106:IsA("ParticleEmitter") and v106.Color ~= Color3.fromRGB(0, 0, 0) then
								v106.Color = ColorSequence.new(v105)
								if v106.Name == "Chakra" or v106.Name == "Glow" then
									v106.Enabled = false
								end
							elseif v106:IsA("Trail") then
								v106.Color = ColorSequence.new(v105)
							end
						end
					elseif game.Workspace:GetAttribute("RainingGlassAnimals") then
						local v107 = Color3.fromRGB(255, 129, 2)
						v_u_104.Eye.Color = v107
						v_u_104.Eye1.Color = v107
						for _, v108 in v_u_104.RootPart:GetDescendants() do
							if v108:IsA("ParticleEmitter") and v108.Color ~= Color3.fromRGB(0, 0, 0) then
								v108.Color = ColorSequence.new(v107)
								if v108.Name == "Chakra" or v108.Name == "Glow" then
									v108.Enabled = false
								end
							elseif v108:IsA("Trail") then
								v108.Color = ColorSequence.new(v107)
							end
						end
					end
				end)
				v_u_6:Add(v_u_5.DescendantAdded:Connect(function(p109)
					-- upvalues: (copy) v_u_104
					if p109:IsDescendantOf(v_u_104) then
						return
					elseif p109:FindFirstAncestorWhichIsA("Tool") then
						return
					elseif p109:IsA("BasePart") then
						p109:SetAttribute("OldTransparency", p109.Transparency)
						p109.Transparency = p109.Name == "Head" and 0.99 or 1
					elseif p109:IsA("Decal") then
						p109:SetAttribute("OldTransparency", p109.Transparency)
						p109.Transparency = 1
					end
				end))
				local v110 = v_u_104.AnimationController.Animator:LoadAnimation(v_u_104.Animation)
				v110:Play()
				if p_u_4 == game.Players.LocalPlayer then
					v_u_7 = v110
				end
				local v_u_111 = script.ImpactVFX:Clone()
				task.spawn(function()
					-- upvalues: (copy) v_u_111
					if game.Workspace:GetAttribute("VampireBatThirst") then
						local v112 = Color3.fromRGB(127, 0, 0)
						for _, v113 in v_u_111:GetDescendants() do
							if v113:IsA("ParticleEmitter") and v113.Color ~= Color3.fromRGB(0, 0, 0) then
								v113.Color = ColorSequence.new(v112)
							end
						end
					elseif game.Workspace:GetAttribute("RainingGlassAnimals") then
						local v114 = Color3.fromRGB(120, 60, 1)
						for _, v115 in v_u_111:GetDescendants() do
							if v115:IsA("ParticleEmitter") and v115.Color ~= Color3.fromRGB(0, 0, 0) then
								v115.Color = ColorSequence.new(v114)
							end
						end
					end
				end)
				v_u_111.Position = v_u_5.HumanoidRootPart.CFrame.Position
				v_u_111.Parent = workspace
				local v116 = next
				local v117, v118 = v_u_111:GetDescendants()
				for _, v119 in v116, v117, v118 do
					if v119:IsA("ParticleEmitter") then
						v119:Emit(v119:GetAttribute("EmitCount") or 1)
					end
				end
				game:GetService("Debris"):AddItem(v_u_111, 5)
				local v120 = Instance.new("Motor6D")
				v120.Parent = v_u_104
				v120.Part0 = v_u_5.HumanoidRootPart
				v120.Part1 = v_u_104.RootPart
				v120.C0 = v120.C0 * CFrame.Angles(0, 0, 0)
				if p_u_4 == game.Players.LocalPlayer then
					v_u_100()
					return
				end
			elseif not v101 and v102 then
				v_u_5:SetAttribute("FruitBat", nil)
				for _, v121 in v_u_5:GetDescendants() do
					if v121.Name == "BatModel_Rigged" then
						v121:Destroy()
					elseif v121:GetAttribute("OldTransparency") then
						v121.Transparency = v121:GetAttribute("OldTransparency")
						v121:SetAttribute("OldTransparency", nil)
					end
				end
				local v_u_122 = script.ImpactVFX:Clone()
				task.spawn(function()
					-- upvalues: (copy) v_u_122
					if game.Workspace:GetAttribute("VampireBatThirst") then
						local v123 = Color3.fromRGB(127, 0, 0)
						for _, v124 in v_u_122:GetDescendants() do
							if v124:IsA("ParticleEmitter") and v124.Color ~= Color3.fromRGB(0, 0, 0) then
								v124.Color = ColorSequence.new(v123)
							end
						end
					elseif game.Workspace:GetAttribute("RainingGlassAnimals") then
						local v125 = Color3.fromRGB(120, 60, 1)
						for _, v126 in v_u_122:GetDescendants() do
							if v126:IsA("ParticleEmitter") and v126.Color ~= Color3.fromRGB(0, 0, 0) then
								v126.Color = ColorSequence.new(v125)
							end
						end
					end
				end)
				v_u_122.Position = v_u_5.HumanoidRootPart.CFrame.Position
				v_u_122.Parent = workspace
				local v127 = next
				local v128, v129 = v_u_122:GetDescendants()
				for _, v130 in v127, v128, v129 do
					if v130:IsA("ParticleEmitter") then
						v130:Emit(v130:GetAttribute("EmitCount") or 1)
					end
				end
				game:GetService("Debris"):AddItem(v_u_122, 5)
			end
		end
	end
	local function v133(p132)
		-- upvalues: (ref) v_u_5, (copy) v_u_131
		v_u_5 = p132
		v_u_131()
	end
	local v134 = v_u_3
	local v135 = p_u_4.CharacterAdded
	table.insert(v134, v135:Connect(v133))
	if p_u_4.Character then
		v_u_5 = p_u_4.Character
		v_u_131()
	end
	local v136 = v_u_3
	local v137 = p_u_4:GetAttributeChangedSignal("FruitBat")
	table.insert(v136, v137:Connect(function()
		-- upvalues: (copy) v_u_131
		v_u_131()
	end))
	if p_u_4:GetAttribute("FruitBat") then
		v_u_131()
	end
end
game.Players.PlayerAdded:Connect(function(p139)
	-- upvalues: (copy) v_u_138
	v_u_138(p139)
end)
game.Players.PlayerRemoving:Connect(function(_)
	-- upvalues: (copy) v_u_3
	for _, v140 in v_u_3 do
		if v140 then
			v140:Disconnect()
		end
	end
	table.clear(v_u_3)
end)
for _, v141 in game:GetService("Players"):GetPlayers() do
	v_u_138(v141)
end