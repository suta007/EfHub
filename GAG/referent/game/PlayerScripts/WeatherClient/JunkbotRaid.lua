local v1 = {}
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v4 = game.Lighting.ColorCorrection:Clone()
v4.Name = script.Name
v4.Parent = game.Lighting
local v_u_5 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Spring"))
local v_u_6 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Trove"))
require(game.ReplicatedStorage.Field_Of_View_Module)
require(game.ReplicatedStorage.Code.BodyShaker)
local v_u_7 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_8 = game:GetService("CollectionService")
local _ = script.Sky
require(game.ReplicatedStorage.Modules.SkyboxManager)
local v9 = game:GetService("ReplicatedStorage")
local v_u_10 = require(v9.Modules.SoundPlayer)
local v_u_11 = require(v9.Data.SoundData)
local v_u_13 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
v_u_13:Start()
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local function v_u_19(p17)
	for _, v18 in next, p17 do
		if v18.ClassName == "ParticleEmitter" then
			v18:Emit(v18:GetAttribute("EmitCount") or 10)
		end
	end
end
local function v_u_109()
	-- upvalues: (ref) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_14, (copy) v_u_13, (copy) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_19, (copy) v_u_15, (copy) v_u_16, (copy) v_u_8
	v_u_3 = true
	local v_u_20 = v_u_6.new()
	local function v_u_51(p_u_21, p_u_22)
		-- upvalues: (ref) v_u_5, (ref) v_u_14, (ref) v_u_13, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11, (ref) v_u_19
		local function v32(p23)
			-- upvalues: (copy) p_u_22, (ref) v_u_5
			local v24 = p_u_22:Add(script:WaitForChild("LightningStrike"):Clone())
			v24.Parent = p23
			v24:PivotTo(CFrame.new(p23:GetPivot().Position))
			p23:ScaleTo(math.random(1, 2.5))
			local v25 = p23:GetPivot()
			p23:PivotTo(v25 + Vector3.new(0, 50, 0))
			local v26 = {}
			for _, v27 in p23:GetDescendants() do
				if v27:IsA("BasePart") then
					v26[v27] = {
						["Transparency"] = v27.Transparency,
						["Material"] = v27.Material,
						["Color"] = v27.Color
					}
					v27.Color = Color3.fromRGB(0, 255, 0)
					v27.Material = Enum.Material.Neon
					v27.Transparency = 1
					v_u_5.target(v27, 0.9, 5, {
						["Transparency"] = v26[v27].Transparency
					})
				end
			end
			v_u_5.target(p23, 0.9, 3, {
				["Pivot"] = v25
			})
			task.wait(0.3)
			if p23 and p23.Parent ~= nil then
				for _, v28 in p23:GetDescendants() do
					if v28:IsA("Trail") then
						v28.Enabled = true
					end
				end
				for _, v29 in v24.Attachment:GetChildren() do
					v29:Emit(v29:GetAttribute("EmitCount"))
				end
				game:GetService("Debris"):AddItem(v24, 5)
				for v30, v31 in v26 do
					v_u_5.target(v30, 0.9, 3, {
						["Color"] = v31.Color
					})
					v30.Material = v31.Material
				end
			end
		end
		local function v_u_37(p33)
			-- upvalues: (copy) p_u_21, (ref) v_u_14
			local v34 = p_u_21:GetAttribute("TargetPosition")
			local v35 = p_u_21:GetAttribute("Duration")
			if v34 and v35 then
				local v36 = p_u_21.Position
				v_u_14[p33] = {
					["Model"] = p33,
					["BotPart"] = p_u_21,
					["StartTime"] = os.clock(),
					["StartPos"] = v36,
					["TargetPos"] = v34,
					["Duration"] = v35
				}
			end
		end
		local v_u_38 = p_u_22:Add(script:FindFirstChild("JunkbotModel"):Clone())
		v_u_38:PivotTo(p_u_21.CFrame)
		v_u_38.Parent = game.Workspace.WeatherVisuals
		local v_u_39 = v_u_38.AnimationController:LoadAnimation(script.Animations["Hovering Idle"])
		local v_u_40 = v_u_38.AnimationController:LoadAnimation(script.Animations.Flying)
		for _, v41 in v_u_38:GetDescendants() do
			if v41:IsA("ParticleEmitter") then
				v41.Enabled = true
			end
		end
		local v_u_42 = nil
		v_u_42 = v_u_38:GetAttributeChangedSignal("Destroyed"):Connect(function()
			-- upvalues: (ref) v_u_42, (copy) p_u_22, (copy) p_u_21, (ref) v_u_13, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11, (ref) v_u_19, (copy) v_u_38
			v_u_42:Disconnect()
			local v_u_43 = p_u_22:Add(script.Crashsite:Clone())
			v_u_43.Position = p_u_21:GetAttribute("TargetPosition")
			v_u_43.Parent = game.Workspace.WeatherVisuals
			task.spawn(function()
				-- upvalues: (copy) v_u_43, (ref) v_u_13, (ref) v_u_7, (ref) p_u_22, (ref) v_u_10, (ref) v_u_11
				local v_u_44 = game.Players.LocalPlayer.Character
				if v_u_44 then
					local v45 = v_u_44:FindFirstChild("HumanoidRootPart") or v_u_44:FindFirstChild("Torso")
					if v45 and v_u_44:FindFirstChildOfClass("Humanoid") then
						local v46 = (v45.Position - v_u_43.Position).Magnitude
						if v46 <= 15 then
							v_u_44.Humanoid.JumpPower = 100
							v_u_44.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							task.delay(0.1, function()
								-- upvalues: (copy) v_u_44
								v_u_44.Humanoid.JumpPower = 50
							end)
							v_u_13:Shake(v_u_7.Presets.VerySmallExplosion)
						end
						if v46 <= 100 then
							local v47 = {
								["RollOffMaxDistance"] = 10000,
								["RollOffMinDistance"] = 10,
								["RollOffMode"] = Enum.RollOffMode.Inverse,
								["Volume"] = 0.8,
								["PlaybackSpeed"] = 1,
								["TimePosition"] = 0,
								["SoundGroup"] = game.SoundService.Music
							}
							local v_u_48 = p_u_22:Add((v_u_10:PlaySound(v_u_11.Weather.JunkbotRaid.JunkBotRaidSFX_Crash, v47, nil, nil)))
							task.delay(3, function()
								-- upvalues: (copy) v_u_48
								if v_u_48 then
									v_u_48:Destroy()
								end
							end)
						end
					end
				end
			end)
			v_u_19(v_u_43:GetDescendants())
			game:GetService("Debris"):AddItem(v_u_43, 4)
			for _, v49 in v_u_38:GetDescendants() do
				if v49:IsA("BasePart") then
					v49.Transparency = 1
				end
			end
			task.delay(2, function()
				-- upvalues: (ref) v_u_38
				if v_u_38 then
					v_u_38:Destroy()
				end
			end)
		end)
		p_u_22:Add(v_u_42)
		local function v_u_50()
			-- upvalues: (copy) v_u_38, (copy) p_u_21, (copy) v_u_39, (copy) v_u_40, (copy) v_u_37
			v_u_38:SetAttribute("State", p_u_21:GetAttribute("State"))
			if p_u_21:GetAttribute("State") == "Crash" then
				v_u_39:Stop()
				v_u_40:Play()
				v_u_37(v_u_38)
			end
		end
		v32(v_u_38)
		v_u_39:Play()
		v_u_50()
		p_u_22:Add(p_u_21:GetAttributeChangedSignal("State"):Connect(function()
			-- upvalues: (copy) v_u_50
			v_u_50()
		end), "Disconnect")
	end
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
		["FieldOfView"] = 60
	}):Play()
	task.wait(0.2)
	v_u_13:ShakeSustain(v_u_7.Presets.WeakEarthquake)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.5), {
		["FieldOfView"] = 90
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Color"] = Color3.fromRGB(167, 159, 97),
		["Density"] = 0.297,
		["Haze"] = 10,
		["Glare"] = 0
	}):Play()
	task.wait(5)
	game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), {
		["FieldOfView"] = 70
	}):Play()
	v_u_13:StopSustained(1)
	v_u_13:Shake(v_u_7.Presets.Explosion)
	v_u_20:Add(game:GetService("RunService").Heartbeat:Connect(function(_)
		-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_14
		if workspace:GetAttribute("JunkbotRaid") then
			table.clear(v_u_15)
			table.clear(v_u_16)
			local v52 = os.clock()
			for v53, v54 in pairs(v_u_14) do
				if not v53:GetAttribute("PathInitialized") then
					local _ = v54.StartPos
					local _ = v54.TargetPos
					local v55 = math.random(40, 60)
					local _ = v54.Duration
					local v56 = math.random(-15, 15)
					local v57 = v55 * 5
					local v58 = math.random
					local v59 = Vector3.new(v56, v57, v58(-15, 15))
					local v60 = math.random(-15, 15)
					local v61 = v55 * 5 + math.random(0, 10)
					local v62 = math.random
					local v63 = Vector3.new(v60, v61, v62(-15, 15))
					local v64 = math.random() * 5 + 3
					local v65 = math.random() * 5 + 3
					v53:SetAttribute("PathOffset1", v59)
					v53:SetAttribute("PathOffset2", v63)
					v53:SetAttribute("SwirlX", v64)
					v53:SetAttribute("SwirlZ", v65)
					v53:SetAttribute("PathInitialized", true)
				end
				local v66 = (v52 - v54.StartTime) / v54.Duration
				local v67 = math.clamp(v66, 0, 1)
				local v68 = v67 * v67
				local v69 = v54.StartPos
				local v70 = v54.TargetPos
				local v71 = v53:GetAttribute("PathOffset1")
				local v72 = v53:GetAttribute("PathOffset2")
				local v73 = v53:GetAttribute("SwirlX")
				local v74 = v53:GetAttribute("SwirlZ")
				local v75 = v69 + v71
				local v76 = v69 + v72
				local v77 = 1 - v68
				local v78 = v68 * v68
				local v79 = v77 * v77
				local v80 = v79 * v77
				local v81 = v78 * v68
				local v82 = v80 * v69 + 3 * v79 * v68 * v75 + 3 * v77 * v78 * v76 + v81 * v70
				local v83 = v68 * 3.141592653589793 * v73
				local v84 = math.sin(v83) * 6
				local v85 = v68 * 3.141592653589793 * v74
				local v86 = math.cos(v85) * 6
				local v87 = v82 + Vector3.new(v84, 0, v86)
				local v88 = v68 + 0.01
				local v89 = math.clamp(v88, 0, 1)
				local v90 = v69 + v71
				local v91 = v69 + v72
				local v92 = 1 - v89
				local v93 = v89 * v89
				local v94 = v92 * v92
				local v95 = v94 * v92
				local v96 = v93 * v89
				local v97 = v95 * v69 + 3 * v94 * v89 * v90 + 3 * v92 * v93 * v91 + v96 * v70
				local v98 = v89 * 3.141592653589793 * v73
				local v99 = math.sin(v98) * 6
				local v100 = v89 * 3.141592653589793 * v74
				local v101 = math.cos(v100) * 6
				local v102 = v97 + Vector3.new(v99, 0, v101) - v87
				local v103 = v102.Magnitude > 0 and v102.Unit or Vector3.new(0, 0, 1)
				local v104 = CFrame.lookAt(v87, v87 + v103, Vector3.new(0, 1, 0))
				if v53.PrimaryPart then
					local v105 = v_u_15
					local v106 = v53.PrimaryPart
					table.insert(v105, v106)
					local v107 = v_u_16
					table.insert(v107, v104)
				end
				if v67 >= 1 then
					v53:SetAttribute("Destroyed", true)
				end
			end
			if #v_u_15 > 0 then
				workspace:BulkMoveTo(v_u_15, v_u_16, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end
	end))
	v_u_20:Add(v_u_8:GetInstanceAddedSignal("Junkbot"):Connect(function(p108)
		-- upvalues: (copy) v_u_51, (copy) v_u_20
		if p108:IsA("BasePart") then
			v_u_51(p108, v_u_20)
		end
	end), "Disconnect")
	repeat
		task.wait()
	until v_u_3 == false
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_20:Destroy()
end
workspace:GetAttributeChangedSignal("JunkbotRaid"):Connect(function()
	-- upvalues: (copy) v_u_109, (ref) v_u_3
	if workspace:GetAttribute("JunkbotRaid") then
		v_u_109()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("JunkbotRaid") then
	task.defer(v_u_109)
else
	v_u_3 = false
end
return v1