local v1 = {}
game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = false
game:GetService("TweenService")
local v4 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_5 = require(game.ReplicatedStorage.Modules.Trove)
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.SoundPlayer)
local v_u_8 = require(v6.Data.SoundData)
local v_u_9 = workspace.Terrain.Clouds
local v_u_10 = require(game.ReplicatedStorage.Modules.Spring)
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local v_u_13 = v4.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
v_u_13:Start()
local v_u_14 = v6:WaitForChild("GameEvents"):FindFirstChild("Reaper_Event")
local function v_u_16()
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	v_u_2:Create(v_u_11, TweenInfo.new(0.05), {
		["Brightness"] = -0.1,
		["Contrast"] = 0.005,
		["Saturation"] = -1,
		["TintColor"] = Color3.fromRGB(164, 164, 164)
	}):Play()
	local v_u_15 = game.Players.LocalPlayer.Character
	if v_u_15 then
		v_u_15.Humanoid.JumpPower = 115
		v_u_15.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		task.delay(0.1, function()
			-- upvalues: (copy) v_u_15
			v_u_15.Humanoid.JumpPower = 50
		end)
	end
end
local function v_u_144()
	-- upvalues: (ref) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10, (copy) v_u_2, (copy) v_u_16, (copy) v_u_13, (copy) v_u_14, (copy) v_u_11, (copy) v_u_9
	v_u_3 = true
	local v_u_17 = v_u_5.new()
	local v_u_18 = v_u_17:Add(script.Reaper:Clone())
	local v19 = v_u_18:GetPivot()
	v_u_18:PivotTo(v19 * CFrame.new(0, -600, 0))
	local v_u_20 = {}
	for _, v21 in v_u_18:GetDescendants() do
		if v21:IsA("BasePart") or (v21:IsA("Decal") or v21:IsA("Texture")) then
			v_u_20[v21] = v21.Transparency
			v21.Transparency = 1
		elseif v21:IsA("ParticleEmitter") then
			v21.Enabled = false
		end
	end
	v_u_18.Parent = game.Workspace.WeatherVisuals
	v_u_18.Humanoid:LoadAnimation(script.Idle):Play()
	local v22 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 0.25,
		["PlaybackSpeed"] = 1
	}
	v_u_7:PlaySound(v_u_8.Weather.ReaperScythe.Appearance, v22)
	for _, v23 in v_u_18:GetDescendants() do
		if v23:IsA("ParticleEmitter") and v23.Name == "Smoke" then
			v23.Enabled = true
		end
	end
	local v24 = {
		["RollOffMaxDistance"] = 10000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 0.25,
		["PlaybackSpeed"] = 1
	}
	v_u_7:PlaySound(v_u_8.Weather.ReaperScythe.Laugh, v24)
	task.spawn(function()
		-- upvalues: (copy) v_u_20
		for v25 = 1, 30 do
			local v26 = v25 / 30
			for v27, v28 in v_u_20 do
				if v27 then
					v27.Transparency = v28 + (1 - v28) * (1 - v26)
				end
			end
			task.wait(0.02)
		end
	end)
	v_u_10.target(v_u_18, 0.8, 1, {
		["Pivot"] = v19
	})
	task.delay(0.8, function()
		-- upvalues: (copy) v_u_18
		for _, v29 in v_u_18:GetDescendants() do
			if v29:IsA("ParticleEmitter") and v29.Name == "Smoke" then
				v29.Enabled = false
			end
		end
	end)
	task.wait(2)
	v_u_18.Humanoid:LoadAnimation(script.Strike):Play()
	local v_u_30 = script.Assets
	local v_u_31 = v_u_17:Add(v_u_30:WaitForChild("SlashPart"):Clone())
	local v_u_32 = v_u_17:Add(v_u_30:WaitForChild("Crack"):Clone())
	v_u_31.Beam.Enabled = false
	for _, v33 in v_u_31:GetDescendants() do
		if v33:IsA("ParticleEmitter") then
			v33.Enabled = false
		end
	end
	v_u_31.Parent = workspace.WeatherVisuals
	v_u_32.Parent = workspace.WeatherVisuals
	for _, v34 in v_u_32:GetDescendants() do
		if v34:IsA("BasePart") then
			v34.Transparency = 1
		end
	end
	local function v_u_52(p_u_35, p36)
		-- upvalues: (copy) v_u_30, (ref) v_u_2
		local v_u_37 = v_u_30.Cone:Clone()
		v_u_37.Parent = workspace.WeatherVisuals
		local v38 = p36 and 0.5 + p36 * 0.5 or 1
		local v39 = math.random(80, 140) / 100 * v38
		local v40 = math.random(50, 100) / 100 * v38
		local v41 = math.random(50, 100) / 100 * v38
		local v42 = 10.151 * v40
		local v43 = 77.332 * v39
		local v44 = 9.836 * v41
		v_u_37.Size = Vector3.new(v42, v43, v44)
		local v45 = math.random(-15, 15)
		local v_u_46 = math.rad(v45)
		local v47 = math.random(-15, 15)
		local v_u_48 = math.rad(v47)
		local v49 = -0.444 - v_u_37.Size.Y * 0.5
		local v50 = -0.444 + v_u_37.Size.Y * 0.45
		local v_u_51 = math.random(-2, 2)
		v_u_37.CFrame = CFrame.new(p_u_35.X, v49, p_u_35.Z + v_u_51) * CFrame.Angles(v_u_46, 0, v_u_48)
		v_u_2:Create(v_u_37, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["CFrame"] = CFrame.new(p_u_35.X, v50, p_u_35.Z + v_u_51) * CFrame.Angles(v_u_46, 0, v_u_48)
		}):Play()
		task.delay(3 + math.random() * 1.5, function()
			-- upvalues: (ref) v_u_2, (copy) v_u_37, (copy) p_u_35, (copy) v_u_51, (copy) v_u_46, (copy) v_u_48
			v_u_2:Create(v_u_37, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				["CFrame"] = CFrame.new(p_u_35.X, -0.444 - v_u_37.Size.Y * 0.5, p_u_35.Z + v_u_51) * CFrame.Angles(v_u_46, 0, v_u_48),
				["Transparency"] = 1
			}):Play()
			game.Debris:AddItem(v_u_37, 3.5)
		end)
	end
	local function v_u_95(p53)
		-- upvalues: (copy) v_u_32, (ref) v_u_10, (copy) v_u_52
		local v54 = v_u_32
		local v55 = p53.X
		local v56 = p53.Z
		local v57 = Vector3.new(v55, -0.444, v56)
		local v58 = (1 / 0)
		local v59 = nil
		for _, v60 in v54:GetChildren() do
			if v60:IsA("BasePart") then
				local v61 = (v60.Position - v57).Magnitude
				if v61 < v58 then
					v59 = v60
					v58 = v61
				end
			end
		end
		if v59 then
			local v62 = v59.Position.X
			local v63 = v59.Position.Z
			local v64 = Vector3.new(v62, -0.444, v63)
			local v_u_65 = (v57 - v64).Unit
			local v66 = (v57 - v64).Magnitude / 10
			local v67 = math.floor(v66)
			local v68 = math.max(1, v67)
			local v_u_69 = 1.5 / v68
			for v70 = 1, v68 do
				task.wait(v_u_69)
				local v_u_71 = 1 - v70 / v68 * 0.6
				local v_u_72 = 14 * (0.8 + math.random() * 0.3) * v_u_71
				local v_u_73 = 10 * (0.9 + math.random() * 0.2)
				local v74 = math.random(-6, 6) * 0.05
				local v75 = math.random(-6, 6) * 0.05
				v_u_65 = (v_u_65 + Vector3.new(v74, 0, v75)).Unit
				local v76 = v64 + v_u_65 * (v_u_73 * 0.95)
				local v77 = v76.X
				local v78 = v76.Z
				local v_u_79 = Vector3.new(v77, -0.444, v78)
				local v_u_80 = Instance.new("Part")
				v_u_80.Size = Vector3.new(v_u_72, 1, v_u_73)
				v_u_80.Anchored = true
				v_u_80.CanCollide = false
				task.spawn(function()
					-- upvalues: (copy) v_u_80
					v_u_80.MaterialVariant = "Studs 2x2 Plastic"
				end)
				v_u_80.Color = Color3.fromRGB(0, 0, 0)
				v_u_80.Material = Enum.Material.Plastic
				v_u_80.CFrame = CFrame.new(v64 + (v_u_79 - v64) * 0.5, v_u_79 + v_u_65 * 0.2)
				v_u_80.Parent = game.Workspace.WeatherVisuals
				v_u_80.Transparency = 1
				game:GetService("TweenService"):Create(v_u_80, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					["Transparency"] = 0
				}):Play()
				task.delay(6, function()
					-- upvalues: (ref) v_u_10, (copy) v_u_80
					v_u_10.target(v_u_80, 1, 4, {
						["Transparency"] = 1
					})
				end)
				game.Debris:AddItem(v_u_80, 8)
				if math.random() < 0.5 then
					v_u_52(v_u_79, v_u_71)
				end
				if math.random() < 0.2 then
					task.spawn(function()
						-- upvalues: (copy) v_u_65, (copy) v_u_72, (ref) v_u_79, (copy) v_u_69, (copy) v_u_73, (ref) v_u_10, (ref) v_u_52, (copy) v_u_71
						local v81 = CFrame.lookAt(Vector3.new(0, 0, 0), v_u_65)
						local v82 = CFrame.Angles
						local v83 = math.random(-70, 70)
						local v84 = (v81 * v82(0, math.rad(v83), 0)).LookVector
						local v85 = math.random(2, 4)
						local v86 = v_u_72 * 0.6
						local v87 = v_u_79
						for _ = 1, v85 do
							task.wait(v_u_69 * 1.5)
							local v88 = v87 + v84 * (v_u_73 * 0.8)
							local v89 = v88.X
							local v90 = v88.Z
							local v91 = Vector3.new(v89, -0.444, v90)
							local v_u_92 = Instance.new("Part")
							local v93 = v86 * (0.8 + math.random() * 0.3)
							local v94 = v_u_73 * 0.8
							v_u_92.Size = Vector3.new(v93, 1, v94)
							v_u_92.Anchored = true
							v_u_92.CanCollide = false
							v_u_92.Color = Color3.fromRGB(0, 0, 0)
							v_u_92.Material = Enum.Material.Plastic
							v_u_92.CFrame = CFrame.new(v87 + (v91 - v87) / 2, v91)
							v_u_92.Parent = game.Workspace.WeatherVisuals
							v_u_92.Transparency = 1
							game:GetService("TweenService"):Create(v_u_92, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Transparency"] = 0
							}):Play()
							task.delay(6, function()
								-- upvalues: (ref) v_u_10, (copy) v_u_92
								v_u_10.target(v_u_92, 1, 4, {
									["Transparency"] = 1
								})
							end)
							game.Debris:AddItem(v_u_92, 8)
							if math.random() < 0.25 then
								v_u_52(v91, v_u_71 * 0.6)
							end
							v86 = v86 * 0.8
							v87 = v91
						end
					end)
				end
				v64 = v_u_79
			end
			return 1.5
		end
		warn("No crack part found to start path from.")
	end
	local function v_u_119()
		-- upvalues: (copy) v_u_32, (copy) v_u_17, (copy) v_u_30, (ref) v_u_2
		local v96 = v_u_32:GetExtentsSize()
		local v97 = v96.Z * 0.3
		local v_u_98 = v_u_32:GetPivot().Position
		local v99 = v_u_98.X - v96.X / 2
		local v100 = v_u_98.X + v96.X / 2 + 30
		local v101 = v99 < -295 and -295 or v99
		local v_u_102 = math.random(v101, v100)
		local v_u_103 = v_u_17:Add(v_u_30.Cone:Clone())
		v_u_103.Parent = workspace.WeatherVisuals
		local v104 = math.random(110, 200) / 100
		local v105 = math.random(70, 140) / 100
		local v106 = math.random(80, 160) / 100
		local v107 = 10.151 * v105
		local v108 = 77.332 * v104
		local v109 = 9.836 * v106
		v_u_103.Size = Vector3.new(v107, v108, v109)
		local v110 = math.random(-15, 15)
		local v_u_111 = math.rad(v110)
		local v112 = math.random(-15, 15)
		local v_u_113 = math.rad(v112)
		local v114 = v97 - v_u_103.Size.Z * math.random(3, 5) / 10 - 0.5
		local v115 = math.max(0, v114)
		local v_u_116 = math.random(-v115 * 100, v115 * 100) / 100
		local v117 = -0.444 - v_u_103.Size.Y * 0.5
		local v118 = -0.444 + v_u_103.Size.Y * 0.45
		v_u_103.CFrame = CFrame.new(v_u_102, v117, v_u_98.Z + v_u_116) * CFrame.Angles(v_u_111, 0, v_u_113)
		v_u_2:Create(v_u_103, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["CFrame"] = CFrame.new(v_u_102, v118, v_u_98.Z + v_u_116) * CFrame.Angles(v_u_111, 0, v_u_113)
		}):Play()
		task.delay(3.5 + math.random() * 2, function()
			-- upvalues: (ref) v_u_2, (copy) v_u_103, (copy) v_u_102, (copy) v_u_98, (copy) v_u_116, (copy) v_u_111, (copy) v_u_113
			v_u_2:Create(v_u_103, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				["CFrame"] = CFrame.new(v_u_102, -0.444 - v_u_103.Size.Y * 0.5, v_u_98.Z + v_u_116) * CFrame.Angles(v_u_111, 0, v_u_113),
				["Transparency"] = 1
			}):Play()
			game.Debris:AddItem(v_u_103, 3.5)
		end)
	end
	local function v_u_125(p120, p121, p122)
		if not (p120 and p120:FindFirstChild("HumanoidRootPart")) then
			return false
		end
		local v123 = p120.HumanoidRootPart.Position
		for _, v124 in p121:GetChildren() do
			if v124:IsA("BasePart") and (v123 - v124.Position).Magnitude <= p122 then
				return true
			end
		end
		return false
	end
	task.delay(1.5, function()
		-- upvalues: (copy) v_u_18
		local v126 = v_u_18:FindFirstChild("Scythe")
		if v126 and v126:FindFirstChild("ChargeAttachment") then
			for _, v127 in v126:FindFirstChild("ChargeAttachment"):GetDescendants() do
				if v127:IsA("ParticleEmitter") then
					v127.Enabled = true
				end
			end
		end
	end)
	task.delay(2.6666666666666665, function()
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v128 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Volume"] = 0.35,
			["PlaybackSpeed"] = 0.75
		}
		v_u_7:PlaySound(v_u_8.Weather.ReaperScythe.Slash3, v128)
	end)
	task.delay(2.8333333333333335, function()
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v129 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Volume"] = 0.75,
			["PlaybackSpeed"] = 0.6
		}
		v_u_7:PlaySound(v_u_8.Weather.ReaperScythe.EarthSplit2, v129)
	end)
	task.delay(3.1666666666666665, function()
		-- upvalues: (copy) v_u_18, (ref) v_u_10, (ref) v_u_16, (ref) v_u_13, (copy) v_u_31, (copy) v_u_32, (copy) v_u_119, (ref) v_u_3, (ref) v_u_7, (ref) v_u_8, (copy) v_u_125, (copy) v_u_17, (ref) v_u_14, (copy) v_u_95
		task.spawn(function()
			-- upvalues: (ref) v_u_18, (ref) v_u_10
			for _, v130 in v_u_18:GetDescendants() do
				if v130:IsA("ParticleEmitter") and v130.Name == "Smoke" then
					v130.Enabled = true
				end
			end
			for _, v131 in v_u_18:GetDescendants() do
				if v131:IsA("BasePart") then
					v_u_10.target(v131, 1, 4, {
						["Transparency"] = 1
					})
				elseif v131:IsA("Decal") then
					v_u_10.target(v131, 1, 4, {
						["Transparency"] = 1
					})
				end
			end
			task.delay(1.2, function()
				-- upvalues: (ref) v_u_18
				for _, v132 in v_u_18:GetDescendants() do
					if v132:IsA("ParticleEmitter") and v132.Name == "Smoke" then
						v132.Enabled = false
					end
				end
			end)
		end)
		v_u_16()
		v_u_13:Shake(v_u_13.Presets.SmallExplosion)
		local v133 = v_u_18:FindFirstChild("Scythe")
		if v133 and v133:FindFirstChild("ChargeAttachment") then
			for _, v134 in v133.ChargeAttachment:GetDescendants() do
				if v134:IsA("ParticleEmitter") then
					v134.Enabled = false
				end
			end
		end
		v_u_31.Beam.Enabled = true
		for _, v135 in v_u_31:GetDescendants() do
			if v135:IsA("ParticleEmitter") then
				v135.Enabled = true
			end
		end
		for _, v136 in v_u_32:GetDescendants() do
			if v136:IsA("BasePart") then
				v136.Transparency = 0
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_119
			for _ = 1, 28 do
				v_u_119()
				task.wait(0.05)
			end
		end)
		task.delay(1.25, function()
			-- upvalues: (ref) v_u_31
			for _, v137 in v_u_31:GetDescendants() do
				if v137:IsA("ParticleEmitter") then
					v137.Enabled = false
				end
			end
			v_u_31.Beam.Enabled = false
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_31, (ref) v_u_119, (ref) v_u_7, (ref) v_u_8, (ref) v_u_125, (ref) v_u_32, (ref) v_u_13
			while v_u_3 do
				for _, v138 in v_u_31:GetDescendants() do
					if v138:IsA("ParticleEmitter") then
						v138.Enabled = true
					end
				end
				task.spawn(function()
					-- upvalues: (ref) v_u_119
					for _ = 1, 28 do
						v_u_119()
						task.wait(0.05)
					end
				end)
				local v139 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 0.75,
					["PlaybackSpeed"] = 0.6,
					["Volume"] = 0.05
				}
				v_u_7:PlaySound(v_u_8.Weather.ReaperScythe.EarthSplit2, v139)
				local v140 = game.Players.LocalPlayer.Character
				if v140 and v_u_125(v140, v_u_32, 45) then
					v_u_13:Shake(v_u_13.Presets.SmallExplosion)
					local v_u_141 = v140:FindFirstChildOfClass("Humanoid")
					if v_u_141 then
						v_u_141.JumpPower = 115
						v_u_141:ChangeState(Enum.HumanoidStateType.Jumping)
						task.delay(0.1, function()
							-- upvalues: (copy) v_u_141
							v_u_141.JumpPower = 50
						end)
					end
				end
				task.delay(0.6, function()
					-- upvalues: (ref) v_u_31
					for _, v142 in v_u_31:GetDescendants() do
						if v142:IsA("ParticleEmitter") then
							v142.Enabled = false
						end
					end
				end)
				task.wait(math.random(4, 8))
			end
		end)
		v_u_17:Add(v_u_14.OnClientEvent:Connect(function(p143)
			-- upvalues: (ref) v_u_95
			v_u_95(p143)
		end))
	end)
	repeat
		task.wait()
	until v_u_3 == false
	v_u_2:Create(game.Lighting, TweenInfo.new(3), {
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
	v_u_2:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_2:Create(v_u_11, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(v_u_9, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_2:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
	v_u_17:Destroy()
end
workspace:GetAttributeChangedSignal("ReaperScythe"):Connect(function()
	-- upvalues: (copy) v_u_144, (ref) v_u_3
	if workspace:GetAttribute("ReaperScythe") then
		v_u_144()
		return
	elseif v_u_3 ~= false then
		v_u_3 = false
	end
end)
if workspace:GetAttribute("ReaperScythe") then
	task.defer(function()
		-- upvalues: (copy) v_u_144
		v_u_144(true)
	end)
elseif v_u_3 ~= false then
	v_u_3 = false
end
return v1