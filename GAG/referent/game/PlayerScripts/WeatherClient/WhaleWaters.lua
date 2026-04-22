local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
game:GetService("Debris")
local v_u_5 = game:GetService("Lighting")
local _ = workspace.CurrentCamera
local _ = v1.LocalPlayer
script:FindFirstChild("BlizzardParticle")
local v_u_6 = script:FindFirstChild("Sky")
local v_u_7 = require(v4.Modules.SkyboxManager)
local v_u_8 = require(v4.Modules.SoundPlayer)
local v_u_9 = require(v4.Data.SoundData)
local v10 = require(v4.Modules.Trove)
local v_u_11 = require(v4.Modules.Task)
local v_u_12 = require(script.Flock)
local v13 = require(v4.Modules.Task.ThrottledTaskQueue)
local v_u_14 = v4.Assets.Animations.PetAnimations
require(v4.Modules.PetServices.PetSoundHandler)
local v_u_15 = false
local v_u_16 = v10.new()
local v_u_17 = nil
local v_u_18 = {}
local v_u_19 = script.SpawnArea
local v_u_20 = v4.GameEvents.SpawnWhalePod
local v_u_21 = v4.GameEvents.RemoveBarnacle
local v_u_22 = { "rbxassetid://0" }
local v_u_23 = v13.new(3, 0.1)
local v_u_24 = {
	{
		["Distance"] = 50,
		["UpdateInterval"] = 0
	},
	{
		["Distance"] = 150,
		["UpdateInterval"] = 0.03333333333333333
	},
	{
		["Distance"] = 350,
		["UpdateInterval"] = 0.06666666666666667
	},
	{
		["Distance"] = 550,
		["UpdateInterval"] = 0.125
	},
	{
		["Distance"] = (1 / 0),
		["UpdateInterval"] = 0.2
	}
}
local v_u_25 = v_u_5:FindFirstChild("WhaleWatersColorCorrection")
if not v_u_25 then
	v_u_25 = Instance.new("ColorCorrectionEffect")
	v_u_25.Name = "WhaleWatersColorCorrection"
	v_u_25.TintColor = Color3.fromRGB(255, 255, 255)
	v_u_25.Parent = v_u_5
end
local function v_u_48(p26, p27)
	local v28 = {}
	for _, v29 in p26:GetDescendants() do
		if v29:IsA("BasePart") and v29:HasTag("BarnacleSpawnable") then
			table.insert(v28, v29)
		end
	end
	if #v28 == 0 then
		return nil, nil, nil
	else
		local v30 = v28[p27:NextInteger(1, #v28)]
		local v31 = v30.CFrame
		local v32 = v30.Size
		local v33 = p27:NextNumber(0, 6.283185307179586)
		local v34 = p27:NextNumber(-1, 1)
		local v35 = math.acos(v34)
		local v36 = math.sin(v35) * math.cos(v33)
		local v37 = math.sin(v35) * math.sin(v33)
		local v38 = math.cos(v35)
		local v39 = Vector3.new(v36, v37, v38)
		local v40 = v32.X
		local v41 = v32.Y
		local v42 = v32.Z
		local v43 = math.max(v40, v41, v42)
		local v44 = v31.Position + v39 * v43 * 2
		local v45 = (v31.Position - v44).Unit * v43 * 3
		local v46 = RaycastParams.new()
		v46.FilterType = Enum.RaycastFilterType.Include
		v46.FilterDescendantsInstances = v28
		local v47 = workspace:Raycast(v44, v45, v46)
		if v47 then
			return v47.Position, v47.Normal, v47.Instance
		else
			return nil, nil, nil
		end
	end
end
local function v_u_59()
	-- upvalues: (copy) v_u_14, (copy) v_u_16, (copy) v_u_8, (copy) v_u_12
	local v49 = script.Clam
	local v50 = Random.new()
	local v58 = {
		["MinMembers"] = 3,
		["MaxMembers"] = 10,
		["MoveSpeed"] = v50:NextNumber(15, 45),
		["FlockHeight"] = v50:NextNumber(10, 50),
		["DespawnTime"] = 30,
		["LeaderScale"] = 1,
		["HeightVariationRange"] = 5,
		["SpawnAreaSize"] = 60,
		["LODEnabled"] = true,
		["LODThresholds"] = {
			{
				["Distance"] = 75,
				["UpdateInterval"] = 0
			},
			{
				["Distance"] = 160,
				["UpdateInterval"] = 0.03333333333333333
			},
			{
				["Distance"] = 350,
				["UpdateInterval"] = 0.05
			},
			{
				["Distance"] = 600,
				["UpdateInterval"] = 0.08333333333333333
			},
			{
				["Distance"] = (1 / 0),
				["UpdateInterval"] = 0.14285714285714285
			}
		},
		["CohesionWeight"] = 8,
		["AlignmentWeight"] = 6,
		["SeparationWeight"] = 0.5,
		["SpawnRadius"] = 1,
		["NeighborRadius"] = 10,
		["WanderWeight"] = 4,
		["WanderStrength"] = 50,
		["WanderChangeInterval"] = 0.5,
		["WanderSmoothness"] = 1,
		["SpawnSettings"] = {
			["Mode"] = "Random",
			["EdgeMargin"] = 50,
			["DirectionVariation"] = 0.5235987755982988
		},
		["FadeSettings"] = {
			["Enabled"] = true,
			["FadeInDuration"] = 3,
			["FadeOutDuration"] = 4,
			["FadeOutBeforeDespawn"] = 4
		},
		["OnDestroyed"] = function() end,
		["OnMemberSpawned"] = function(p_u_51, _, _)
			-- upvalues: (ref) v_u_14, (ref) v_u_16, (ref) v_u_8
			local v52 = p_u_51:FindFirstChild("AnimationController")
			if v52 then
				local v53 = v52:FindFirstChild("Animator")
				if v53 then
					local v54 = v53:LoadAnimation(v_u_14.Clam.Walk)
					v54.Looped = true
					local v55 = Random.new()
					local v56 = v55:NextNumber(2.8, 3.2)
					v54.TimePosition = v55:NextNumber(0, v54.Length)
					p_u_51:ScaleTo(v55:NextNumber(0.75, 1.2))
					v54:Play(nil, nil, v56)
					v_u_16:Add(v54)
					task.delay(math.random(0, 0.3), function()
						-- upvalues: (ref) v_u_8, (copy) p_u_51, (ref) v_u_16
						local v57 = v_u_8:PlaySound("rbxassetid://128868000002970", {
							["Looped"] = true,
							["Volume"] = 0.5
						}, nil, p_u_51.PrimaryPart)
						if v57 then
							v_u_16:Add(v57)
						end
					end)
				end
			else
				return
			end
		end
	}
	v_u_16:Add((v_u_12.new(v49, v58, v50)))
end
local function v_u_89(p60, p_u_61, p_u_62)
	-- upvalues: (copy) v_u_18, (copy) v_u_14, (copy) v_u_16, (copy) v_u_22, (copy) v_u_8, (copy) v_u_48, (copy) v_u_2, (copy) v_u_21, (copy) v_u_12
	local v63 = script.WhaleModels.Whale
	local v_u_64 = nil
	local v_u_65 = Random.new(p60)
	local v88 = {
		["MinMembers"] = 1,
		["MaxMembers"] = 3,
		["MoveSpeed"] = v_u_65:NextNumber(25, 35),
		["FlockHeight"] = v_u_65:NextNumber(50, 180),
		["DespawnTime"] = 60,
		["LeaderScale"] = 2.5,
		["HeightVariationRange"] = 45,
		["SpawnAreaSize"] = 400,
		["SpawnRadius"] = 40,
		["LODEnabled"] = true,
		["LODThresholds"] = {
			{
				["Distance"] = 150,
				["UpdateInterval"] = 0
			},
			{
				["Distance"] = 500,
				["UpdateInterval"] = 0.03333333333333333
			},
			{
				["Distance"] = 700,
				["UpdateInterval"] = 0.05
			},
			{
				["Distance"] = (1 / 0),
				["UpdateInterval"] = 0.08333333333333333
			}
		},
		["SpawnSettings"] = {
			["Mode"] = "EdgeToCenter",
			["EdgeMargin"] = 40,
			["DirectionVariation"] = 0.2617993877991494
		},
		["FadeSettings"] = {
			["Enabled"] = true,
			["FadeInDuration"] = 3,
			["FadeOutDuration"] = 4,
			["FadeOutBeforeDespawn"] = 4
		},
		["OnDestroyed"] = function()
			-- upvalues: (ref) v_u_18, (copy) p_u_61
			v_u_18[p_u_61] = nil
		end,
		["OnMemberSpawned"] = function(p_u_66, p67, _)
			-- upvalues: (ref) v_u_14, (ref) v_u_16, (ref) v_u_22, (ref) v_u_8
			local v68 = p_u_66:FindFirstChild("AnimationController")
			if v68 then
				local v69 = v68:FindFirstChild("Animator")
				if v69 then
					local v70 = v69:LoadAnimation(v_u_14.BlueWhale.Walk)
					v70.Looped = true
					local v71 = Random.new()
					local v72 = (p67 and 0.2 or 0.4) + v71:NextNumber(-0.03, 0.03)
					v70.TimePosition = v71:NextNumber(0, v70.Length)
					v70:Play(nil, nil, v72)
					v_u_16:Add(v70)
					local v_u_73 = task.spawn(function()
						-- upvalues: (ref) v_u_22, (ref) v_u_8, (copy) p_u_66
						task.wait(math.random(4, 20))
						v_u_8:PlaySound(v_u_22[Random.new():NextInteger(1, #v_u_22)], {
							["Volume"] = 0.5,
							["RollOffMaxDistance"] = 1000
						}, nil, p_u_66.PrimaryPart)
					end)
					v_u_16:Add(v_u_73)
					p_u_66.Destroying:Once(function()
						-- upvalues: (ref) v_u_73
						if v_u_73 then
							task.cancel(v_u_73)
							v_u_73 = nil
						end
					end)
				end
			else
				return
			end
		end,
		["OnFlockSpawned"] = function()
			-- upvalues: (copy) p_u_62, (ref) v_u_64, (copy) v_u_65, (ref) v_u_48, (ref) v_u_2, (ref) v_u_16, (ref) v_u_21, (copy) p_u_61
			for v_u_74 = 1, p_u_62 do
				local v75 = v_u_64.Members[v_u_65:NextInteger(1, #v_u_64.Members)]
				local v76, v77, v78 = v_u_48(v75.Model, v_u_65)
				if v76 then
					local v_u_79 = script.Barnacle:Clone()
					v_u_79.Parent = v75.Model
					if not v77 then
						warn("No normal")
					end
					local v80 = v78 or v75.Model.PrimaryPart
					local v_u_81 = script.BarnacleProxPart:Clone()
					v_u_81.Parent = v_u_79.PrimaryPart
					local v82 = (v77 or Vector3.new(0, 1, 0)).Unit
					local v83 = v82:Cross(Vector3.new(0, 0, 1))
					if v83.Magnitude < 0.001 then
						v83 = v82:Cross(Vector3.new(1, 0, 0))
					end
					local v84 = v83.Unit
					local v85 = v84:Cross(v82)
					v_u_79:PivotTo((CFrame.fromMatrix(v76, v84, v82, v85)))
					local v86 = Instance.new("WeldConstraint")
					v86.Parent = v_u_79.PrimaryPart
					v86.Part0 = v_u_79.PrimaryPart
					v86.Part1 = v80
					local v_u_87 = nil
					v_u_87 = v_u_2.Heartbeat:Connect(function()
						-- upvalues: (copy) v_u_81, (ref) v_u_87, (copy) v_u_79
						if v_u_81 then
							if v_u_81 then
								v_u_81:PivotTo(v_u_79:GetPivot())
							else
								v_u_87:Disconnect()
							end
						else
							v_u_87:Disconnect()
							return
						end
					end)
					v_u_16:Add(v_u_87)
					v_u_16:Add(v_u_81.ProximityPrompt.Triggered:Connect(function(_)
						-- upvalues: (ref) v_u_21, (ref) p_u_61, (copy) v_u_74, (copy) v_u_79
						v_u_21:FireServer(p_u_61, v_u_74)
						v_u_79:Destroy()
					end))
					v_u_16:Add(v_u_79)
					v_u_16:Add(v_u_81)
				end
			end
		end
	}
	v_u_64 = v_u_12.new(v63, v88, v_u_65)
	v_u_18[p_u_61] = v_u_64
	v_u_16:Add(function()
		-- upvalues: (ref) v_u_64
		v_u_64:FadeOut(3, true)
	end)
	return v_u_64
end
local function v_u_112(p90, p_u_91, p_u_92, p_u_93)
	-- upvalues: (copy) v_u_11, (copy) v_u_23
	local v_u_94 = Instance.new("Model")
	v_u_94.Name = "Kelp"
	local v95 = Instance.new("Part")
	v95.Size = Vector3.new(0.5, 0.2, 0.5)
	v95.Position = p90 - Vector3.new(0, 3, 0)
	v95.Anchored = true
	v95.Transparency = 1
	v95.Parent = v_u_94
	v_u_94.PrimaryPart = v95
	local v_u_96 = v95
	local v_u_97 = Random.new():NextNumber(0.4, 1)
	v_u_11.run(function()
		-- upvalues: (copy) p_u_91, (copy) v_u_97, (ref) v_u_23, (ref) v_u_11, (copy) p_u_92, (copy) p_u_93, (ref) v_u_96, (copy) v_u_94
		for v_u_98 = 1, p_u_91 do
			task.wait(v_u_97)
			v_u_23:Enqueue(v_u_11.new(function()
				-- upvalues: (ref) p_u_92, (ref) p_u_93, (ref) v_u_96, (ref) v_u_94, (copy) v_u_98
				local v99 = Instance.new("Part")
				local v100 = p_u_93 * 0.4
				local v101 = p_u_92
				local v102 = p_u_93 * 0.4
				v99.Size = Vector3.new(v100, v101, v102)
				v99.CFrame = v_u_96.CFrame * CFrame.new(0, p_u_92, 0)
				v99.BrickColor = BrickColor.new("Dark green")
				v99.Material = Enum.Material.SmoothPlastic
				v99.CustomPhysicalProperties = PhysicalProperties.new(0.3, 0.3, 0.5, 1, 1)
				v99.CanCollide = false
				v99.CanTouch = false
				v99.CanQuery = false
				v99.Parent = v_u_94
				local v103 = Instance.new("BodyForce")
				local v104 = v99:GetMass() * workspace.Gravity * 1.15
				v103.Force = Vector3.new(0, v104, 0)
				v103.Parent = v99
				local v105 = Instance.new("BallSocketConstraint")
				v105.LimitsEnabled = true
				v105.UpperAngle = v_u_98 * 8 + 40
				v105.Restitution = 0
				local v106 = Instance.new("Attachment")
				local v107 = p_u_92 / 2
				v106.Position = Vector3.new(0, v107, 0)
				v106.Parent = v_u_96
				local v108 = Instance.new("Attachment")
				local v109 = -p_u_92 / 2
				v108.Position = Vector3.new(0, v109, 0)
				v108.Parent = v99
				v105.Attachment0 = v106
				v105.Attachment1 = v108
				v105.Parent = v99
				local v110 = Instance.new("TorsionSpringConstraint")
				v110.Attachment0 = v106
				v110.Attachment1 = v108
				local v111 = v_u_98 * 0.8
				v110.Stiffness = 60 / math.max(v111, 1)
				v110.Damping = 15
				v110.Restitution = 0
				v110.Parent = v99
				v_u_96 = v99
			end))
		end
	end)
	return v_u_94
end
local function v_u_218()
	-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_20, (copy) v_u_89, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_11, (copy) v_u_3, (ref) v_u_25, (ref) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_112, (copy) v_u_2, (copy) v_u_24, (copy) v_u_59, (ref) v_u_15
	v_u_16:Clean()
	workspace:SetAttribute("OverrideBasePlateColor", true)
	local v113 = v_u_16:Clone(v_u_19)
	v113.Parent = workspace:WaitForChild("WeatherObjects")
	local v_u_114 = v113:GetChildren()
	local function v120()
		-- upvalues: (copy) v_u_114
		local v115 = v_u_114[math.random(1, #v_u_114)]
		local v116 = v115.Position.X + v115.Size.X / 2
		local v117 = v115.Position.X - v115.Size.X / 2
		local v118 = v115.Position.Z + v115.Size.Z / 2
		local v119 = v115.Position.Z - v115.Size.Z / 2
		return CFrame.new(math.random(v117, v116), 0.38, math.random(v119, v118))
	end
	v_u_16:Add(v_u_20.OnClientEvent:Connect(function(p121, p122, p123)
		-- upvalues: (ref) v_u_89
		v_u_89(p121, p122, p123)
	end))
	if v_u_6 then
		v_u_6.Parent = v_u_5
		v_u_7.AddSkybox(v_u_6)
		v_u_7.UpdateSkybox(v_u_6, 4)
	end
	local v124 = v_u_11.FromTween(v_u_3:Create(v_u_5, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(0, 132, 255),
		["Brightness"] = 3,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 153, 153),
		["ColorShift_Top"] = Color3.fromRGB(238, 255, 192),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0.2,
		["GeographicLatitude"] = 80,
		["OutdoorAmbient"] = Color3.fromRGB(147, 161, 255),
		["ShadowSoftness"] = 0.75
	})):Start()
	local v125 = v_u_11.FromTween(v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.302,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(255, 214, 178),
		["Decay"] = Color3.fromRGB(255, 255, 255),
		["Glare"] = 0,
		["Haze"] = 0
	})):Start()
	local v126 = v_u_11.FromTween(v_u_3:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0
	})):Start()
	local v127 = v_u_11.FromTween(v_u_3:Create(v_u_25, TweenInfo.new(5), {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.1,
		["TintColor"] = Color3.fromRGB(255, 208, 242)
	})):Start()
	local v128 = v_u_11.FromTween(v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(119, 219, 142)
	})):Start()
	game.SoundService.AmbientReverb = Enum.ReverbType.UnderWater
	v_u_17 = v_u_8:PlaySound(v_u_9.Weather.Tsunami.Liquid, {
		["Looped"] = true,
		["Volume"] = 0.6
	}, nil, nil)
	for _, v129 in game.SoundService.Music:GetDescendants() do
		if v129:HasTag("UnderWater") then
			v129.Enabled = true
		end
	end
	for _ = 1, 30 do
		local v_u_130 = v_u_112(v120().Position, math.random(4, 12), math.random(5, 5), math.random(1, 4))
		v_u_130.Parent = workspace
		v_u_16:Add(v_u_130)
		local v_u_131 = 0
		local v_u_132 = math.random() * 3.141592653589793 * 2
		local v_u_133 = 0.8 + math.random() * 0.4
		local v_u_134 = 0
		local v_u_135 = v_u_130:GetPivot().Position
		v_u_16:Add(v_u_2.Heartbeat:Connect(function(p136)
			-- upvalues: (ref) v_u_131, (copy) v_u_135, (ref) v_u_24, (ref) v_u_134, (copy) v_u_133, (copy) v_u_132, (copy) v_u_130
			v_u_131 = v_u_131 + p136
			local v137 = workspace.CurrentCamera
			local v138 = (v_u_135 - (v137 and v137.CFrame.Position or Vector3.new(0, 0, 0))).Magnitude
			local v139 = v_u_24
			local v140
			if v139 and #v139 ~= 0 then
				for _, v141 in v139 do
					if v138 <= v141.Distance then
						v140 = v141.UpdateInterval
						goto l7
					end
				end
				v140 = v139[#v139].UpdateInterval
				goto l7
			else
				v140 = 0
				::l7::
				if v140 == 0 and true or v140 <= v_u_131 - v_u_134 then
					v_u_134 = v_u_131
					local v142 = v_u_131 * v_u_133 + v_u_132
					local v143 = v142 * 0.5
					local v144 = math.sin(v143) * 3
					local v145 = v142 * 0.4
					local v146 = math.cos(v145) * 3
					local v147 = 1
					for _, v148 in v_u_130:GetChildren() do
						if v148:IsA("BasePart") then
							local v149 = v147 / #v_u_130:GetChildren() - 1
							local v150 = v147 * 0.8
							local v151 = v142 * 0.5 - v150
							local v152 = v144 * math.sin(v151)
							local v153 = v142 * 0.5 - v150
							local v154 = v146 * math.cos(v153)
							v148:ApplyImpulse((Vector3.new(v152, 0, v154) * v149 * v148:GetMass() * 20 + -v148.AssemblyLinearVelocity * v148:GetMass() * 2) * p136)
							v147 = v147 + 1
						end
					end
				end
				return
			end
		end))
	end
	local v155 = v_u_16:Add(game.ReplicatedStorage.Bubble:Clone())
	v155.Parent = workspace.Visuals
	for _, v156 in v155:GetChildren() do
		if v156:IsA("ParticleEmitter") then
			v156:Emit(90)
		end
	end
	for _, v157 in v155:GetChildren() do
		if v157:IsA("ParticleEmitter") then
			game.TweenService:Create(v157, TweenInfo.new(3), {
				["Rate"] = 60
			}):Play()
		end
	end
	local v_u_158 = game.Players.LocalPlayer.Character
	if not v_u_158 then
		repeat
			task.wait()
		until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:IsDescendantOf(workspace)
		v_u_158 = game.Players.LocalPlayer.Character
	end
	local v_u_159 = v_u_158.HumanoidRootPart.RootJoint.C0
	v_u_158:SetAttribute("NormalC0", v_u_159)
	local _, _, _ = v_u_159:ToOrientation()
	local v_u_160 = v_u_16:Clone(script.AlignPosition)
	local v_u_161 = v_u_16:Clone(script.AlignOrientation:Clone())
	v_u_160.Attachment0 = v_u_158:WaitForChild("HumanoidRootPart"):WaitForChild("RootAttachment")
	v_u_161.Attachment0 = v_u_160.Attachment0
	v_u_160.Parent = v_u_158.PrimaryPart
	v_u_161.Parent = v_u_158.PrimaryPart
	local v_u_162 = Vector3.new(0, 0, 0)
	local v_u_163 = v_u_158.Humanoid:LoadAnimation(script.WalkAnim)
	local v_u_164 = {}
	v_u_16:Add(game:GetService("RunService").Stepped:Connect(function(_)
		-- upvalues: (ref) v_u_162, (copy) v_u_164, (copy) v_u_160, (copy) v_u_161, (copy) v_u_159, (copy) v_u_163
		task.spawn(function()
			-- upvalues: (ref) v_u_162, (ref) v_u_164
			for _, v165 in game.Players:GetPlayers() do
				if v165.Character and v165 ~= game.Players.LocalPlayer then
					if not v165.Character:GetAttribute("NormalC0") then
						v165.Character:SetAttribute("NormalC0", v165.Character.HumanoidRootPart.RootJoint.C0)
					end
					local v166 = v165.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude
					local v167 = v165.Character.PrimaryPart.AssemblyLinearVelocity.Unit
					local v168 = v165.Character.PrimaryPart.CFrame
					local v169 = (v168:inverse() * CFrame.new(v168.p + v167)).p
					local v170 = v_u_162.x + v169.x * 1
					local v171 = math.min(16, v170)
					local v172 = math.max(-16, v171)
					local v173 = v_u_162.y + v169.y * 1
					local v174 = -math.max(-16, v173)
					local v175 = v_u_162.z + v169.z * 1
					local v176 = math.min(16, v175)
					local v177 = math.max(-16, v176)
					local v178 = Vector3.new(v172, v174, v177) * 60
					local v179 = v165.Character:GetAttribute("NormalC0")
					local v180 = RaycastParams.new()
					v180.FilterDescendantsInstances = { v165.Character }
					v180.FilterType = Enum.RaycastFilterType.Exclude
					local v181 = workspace:Raycast(v165.Character.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v180)
					if v181 or (v166 <= 5 or v_u_164[v165]) then
						if v166 < 8 then
							game.TweenService:Create(v165.Character.HumanoidRootPart.RootJoint, TweenInfo.new(0.4), {
								["C0"] = v179
							}):Play()
							if v181 and v_u_164[v165] then
								v_u_164[v165]:Stop()
								v_u_164[v165] = nil
							end
						end
					else
						v_u_164[v165] = v165.Character.Humanoid.Animator:LoadAnimation(script.WalkAnim)
						v_u_164[v165]:Play()
						local v182 = v178.Z / 16
						local v183 = -math.clamp(v182, -1, 1)
						print(v183)
						local v184 = game.TweenService
						local v185 = v165.Character.HumanoidRootPart.RootJoint
						local v186 = TweenInfo.new(0.4)
						local v187 = {}
						local v188 = CFrame.Angles
						local v189 = v183 * 70
						v187.C0 = v179 * v188(math.rad(v189), 0, 0)
						v184:Create(v185, v186, v187):Play()
					end
				end
			end
		end)
		local v190 = game.Players.LocalPlayer.Character
		if v190 then
			local v191 = v190:FindFirstChild("Humanoid")
			local v192 = v191.MoveDirection
			local v193 = game.Workspace.CurrentCamera.CFrame
			local v194 = (v193:inverse() * CFrame.new(v193.p + v192)).p
			v_u_162 = v_u_162 * 0.95
			game:GetService("UserInputService"):GetFocusedTextBox()
			local v195 = v_u_162.x + v194.x * 1
			local v196 = math.min(16, v195)
			local v197 = math.max(-16, v196)
			local v198 = v_u_162.y + v194.y * 1
			local v199 = -math.max(-16, v198)
			local v200 = v_u_162.z + v194.z * 1
			local v201 = math.min(16, v200)
			local v202 = math.max(-16, v201)
			v_u_162 = Vector3.new(v197, v199, v202)
			v_u_160.Position = (v190.HumanoidRootPart.CFrame * CFrame.new(v_u_162)).Position
			local v203 = v_u_162.Z / 16
			local v204 = -math.clamp(v203, -1, 1)
			v_u_161.CFrame = v193
			local v205 = v_u_162.X / 16
			local v206 = -math.clamp(v205, -1, 1)
			local v207 = RaycastParams.new()
			v207.FilterDescendantsInstances = { v190 }
			v207.FilterType = Enum.RaycastFilterType.Exclude
			if workspace:Raycast(v190.HumanoidRootPart.Position, Vector3.new(0, -5, 0), v207) then
				v_u_160.Enabled = false
				v_u_161.Enabled = false
				v191.PlatformStand = false
				local v208 = {
					["C0"] = v_u_159
				}
				game.TweenService:Create(v190.HumanoidRootPart.RootJoint, TweenInfo.new(0.1), v208):Play()
				v_u_163:Stop()
			else
				v191.PlatformStand = true
				v_u_160.Enabled = true
				v_u_161.Enabled = true
				if v194.Magnitude > 0 then
					if not v_u_163.IsPlaying then
						v_u_163:Play()
					end
				else
					v_u_163:Stop()
				end
				local v209 = game.TweenService
				local v210 = v190.HumanoidRootPart.RootJoint
				local v211 = TweenInfo.new(0.1)
				local v212 = {}
				local v213 = v_u_159
				local v214 = CFrame.Angles
				local v215 = v204 * 70
				local v216 = math.rad(v215)
				local v217 = v206 * 35
				v212.C0 = v213 * v214(v216, math.rad(v217), 0)
				v209:Create(v210, v211, v212):Play()
			end
		else
			return
		end
	end))
	task.spawn(function()
		-- upvalues: (ref) v_u_59
		v_u_59()
		task.wait(1)
		v_u_59()
		task.wait(1)
		v_u_59()
		task.wait(1)
	end)
	v_u_16:Add(task.spawn(function()
		-- upvalues: (ref) v_u_15, (ref) v_u_59
		while v_u_15 do
			task.wait(math.random(5, 20))
			v_u_59()
		end
	end))
	v_u_16:Add(function()
		-- upvalues: (copy) v_u_160, (copy) v_u_161, (ref) v_u_158, (copy) v_u_159, (copy) v_u_163
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_160, (ref) v_u_161, (ref) v_u_158, (ref) v_u_159, (ref) v_u_163
			v_u_160.Enabled = false
			v_u_161.Enabled = false
			v_u_158.Humanoid.PlatformStand = false
			v_u_158.HumanoidRootPart.RootJoint.C0 = v_u_159
			v_u_163:Stop()
			v_u_163:Destroy()
		end)
	end)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_11.WhenAll({
		v124,
		v125,
		v127,
		v128,
		v126
	}):Await()
end
local function v_u_222()
	-- upvalues: (ref) v_u_15, (copy) v_u_16, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (ref) v_u_25, (copy) v_u_5, (ref) v_u_17
	v_u_15 = false
	v_u_16:Clean()
	workspace:SetAttribute("OverrideBasePlateColor", false)
	if v_u_6 then
		v_u_7.UpdateSkybox(v_u_6, -1)
	end
	v_u_3:Create(v_u_25, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_3:Create(v_u_5, TweenInfo.new(3), {
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
	v_u_3:Create(workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0.646,
		["Density"] = 0,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	for _, v219 in game.SoundService.Music:GetDescendants() do
		if v219:HasTag("UnderWater") then
			v219.Enabled = false
		end
	end
	game.SoundService.AmbientReverb = Enum.ReverbType.NoReverb
	if v_u_17 then
		local v_u_220 = v_u_3:Create(v_u_17, TweenInfo.new(3, Enum.EasingStyle.Linear), {
			["Volume"] = 0
		})
		local v_u_221 = nil
		v_u_221 = v_u_220.Completed:Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_221, (copy) v_u_220
			v_u_17:Stop()
			v_u_17:Destroy()
			v_u_17 = nil
			v_u_221:Disconnect()
			v_u_220:Destroy()
		end)
		v_u_220:Play()
	end
end
workspace:GetAttributeChangedSignal("WhaleWaters"):Connect(function()
	-- upvalues: (ref) v_u_15, (copy) v_u_218, (copy) v_u_222
	if workspace:GetAttribute("WhaleWaters") then
		v_u_15 = true
		v_u_218()
	else
		v_u_222()
	end
end)
if workspace:GetAttribute("WhaleWaters") then
	local _ = true
	v_u_218()
end
return {}