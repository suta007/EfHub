local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Debris")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.SoundPlayer)
local v_u_8 = require(v6.Data.SoundData)
local v_u_9 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_10 = require(game.ReplicatedStorage.Code.LightningBolt)
local v_u_11 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local v_u_12 = require(game.ReplicatedStorage.Modules.WeatherMusicManager)
local v_u_13 = script:FindFirstChild("Sky")
local v_u_14 = require(game.ReplicatedStorage.Modules.SkyboxManager)
if v_u_13 then
	v_u_14.AddSkybox(v_u_13)
end
local v_u_15 = game.Lighting.ColorCorrection:Clone()
v_u_15.Name = "ShredSolo"
v_u_15.Parent = game.Lighting
local v_u_17 = v_u_9.new(Enum.RenderPriority.Camera.Value, function(p16)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p16
end)
v_u_17:Start()
local v18 = v6:WaitForChild("GameEvents"):WaitForChild("ShredSoloBeam")
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local function v_u_187(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_12, (copy) v_u_3, (copy) v_u_15, (copy) v_u_13, (copy) v_u_14, (copy) v_u_17, (copy) v_u_9, (ref) v_u_25, (ref) v_u_19, (copy) v_u_7, (copy) v_u_8, (ref) v_u_23, (ref) v_u_21, (copy) v_u_4, (ref) v_u_26, (ref) v_u_24, (ref) v_u_22, (ref) v_u_20
	if not v_u_2 then
		v_u_2 = true
		v_u_12.Start("ShredSolo", {
			["priority"] = 12
		})
		v_u_3:Create(v_u_15, TweenInfo.new(3), {
			["TintColor"] = Color3.fromRGB(230, 190, 255),
			["Brightness"] = 0.15,
			["Contrast"] = 0.1,
			["Saturation"] = 0.2
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = Color3.fromRGB(90, 40, 140),
			["OutdoorAmbient"] = Color3.fromRGB(60, 20, 100),
			["Brightness"] = 0.8
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 3.2,
			["Density"] = 0.35,
			["Offset"] = 0.8,
			["Color"] = Color3.fromRGB(45, 15, 60),
			["Decay"] = Color3.fromRGB(80, 30, 100)
		}):Play()
		workspace.Terrain.Clouds.Enabled = true
		workspace.Terrain.Clouds.Color = Color3.fromRGB(160, 100, 200)
		v_u_3:Create(workspace.Terrain.Clouds, TweenInfo.new(4), {
			["Cover"] = 0.5,
			["Density"] = 0.15
		}):Play()
		if v_u_13 then
			v_u_14.UpdateSkybox(v_u_13, 3)
		end
		v_u_17:Shake(v_u_9.Presets.Bump)
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.4), {
			["FieldOfView"] = 85
		}):Play()
		task.wait(0.4)
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(2), {
			["FieldOfView"] = 70
		}):Play()
		local v27 = game.Players.LocalPlayer.Character
		local v28 = v27 and (v27:FindFirstChild("Humanoid") and v27.Humanoid:FindFirstChild("Animator"))
		if v28 then
			v_u_25 = v28:LoadAnimation(script.Dances["Dance" .. math.random(1, 3)])
			v_u_25:Play()
			v_u_25.Priority = Enum.AnimationPriority.Action4
		end
		local v29 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["Looped"] = true,
			["Volume"] = 0.5,
			["PlaybackSpeed"] = 1,
			["SoundGroup"] = game:GetService("SoundService").Music.Tunes
		}
		v_u_19 = v_u_7:PlaySound(v_u_8.Weather.ShredSolo.Music, v29)
		local v30 = script.LightBeams:Clone()
		v30.Parent = workspace.WeatherVisuals
		v_u_23 = v30
		local v_u_31 = {}
		for _, v32 in v30:GetDescendants() do
			if v32:IsA("BasePart") then
				local v33 = {
					["part"] = v32,
					["phaseX"] = math.random() * 3.141592653589793 * 2,
					["phaseZ"] = math.random() * 3.141592653589793 * 2,
					["speedX"] = 0.4 + math.random() * 0.6,
					["speedZ"] = 0.3 + math.random() * 0.5
				}
				table.insert(v_u_31, v33)
			end
		end
		v_u_21 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_31
			local v34 = os.clock()
			for _, v35 in v_u_31 do
				local v36 = v34 * v35.speedZ + v35.phaseZ
				local v37 = math.sin(v36) * 0.7853981633974483 + -1.5707963267948966
				local v38 = v34 * v35.speedX + v35.phaseX
				local v39 = math.sin(v38) * 0.7853981633974483
				v35.part.CFrame = CFrame.new(v35.part.Position) * CFrame.fromOrientation(v39, 0, v37)
			end
		end)
		local v40 = workspace:WaitForChild("jandel", 10)
		if v40 then
			v_u_26 = Instance.new("Highlight")
			v_u_26.FillTransparency = 1
			v_u_26.OutlineTransparency = 0.4
			v_u_26.OutlineColor = Color3.fromRGB(255, 0, 0)
			v_u_26.Parent = v40
		end
		local v41 = Instance.new("Folder")
		v41.Name = "ShredSoloLasers"
		v41.Parent = workspace.WeatherVisuals
		v_u_24 = v41
		local v_u_42 = {}
		local v_u_43 = {}
		local v_u_44
		if v40 and v40.PrimaryPart then
			v_u_44 = v40:GetPivot().Position
			for v45 = 1, 12 do
				local v46 = Instance.new("Attachment")
				v46.WorldPosition = v_u_44
				v46.Parent = workspace.Terrain
				local v47 = Instance.new("Attachment")
				v47.WorldPosition = v_u_44
				v47.Parent = workspace.Terrain
				local v48 = Instance.new("Beam")
				v48.Attachment0 = v46
				v48.Attachment1 = v47
				v48.Width0 = 2
				v48.Width1 = 0.8
				v48.Color = ColorSequence.new(Color3.fromRGB(255, 30, 30))
				v48.Transparency = NumberSequence.new(0.3)
				v48.LightEmission = 1
				v48.LightInfluence = 0
				v48.FaceCamera = true
				v48.Parent = v41
				table.insert(v_u_42, {
					["beam"] = v48,
					["originAttach"] = v46,
					["endAttach"] = v47,
					["index"] = v45
				})
			end
			for v49 = 1, 8 do
				local v50 = Instance.new("Attachment")
				v50.WorldPosition = v_u_44
				v50.Parent = workspace.Terrain
				local v51 = Instance.new("Attachment")
				v51.WorldPosition = v_u_44
				v51.Parent = workspace.Terrain
				local v52 = Instance.new("Beam")
				v52.Attachment0 = v50
				v52.Attachment1 = v51
				v52.Width0 = 1.2
				v52.Width1 = 0.4
				v52.Color = ColorSequence.new(Color3.fromRGB(255, 80, 80))
				v52.Transparency = NumberSequence.new(0.4)
				v52.LightEmission = 1
				v52.LightInfluence = 0
				v52.FaceCamera = true
				v52.Parent = v41
				table.insert(v_u_43, {
					["beam"] = v52,
					["originAttach"] = v50,
					["endAttach"] = v51,
					["index"] = v49
				})
			end
		else
			v_u_44 = nil
		end
		local function v_u_55(p53, p54)
			return CFrame.fromOrientation(p54 * 0.7, p54, p54 * 0.3):VectorToWorldSpace(p53)
		end
		local v_u_143 = {
			function(p56, p57, _)
				-- upvalues: (copy) v_u_55
				local v58 = p56 * 0.3
				local v59 = 300 * (0.4 + (math.sin(v58) + 1) / 2 * 0.2)
				local v60 = p56 * 0.4
				local v61 = v59 * 1.2
				local v62 = Vector3.new(0, v61, 0)
				local v63 = {}
				local v64 = -v59
				local v65 = -v59 * 0.3
				local v66 = -v59
				local v67 = Vector3.new(v64, v65, v66)
				local v68 = -v59 * 0.3
				local v69 = -v59
				local v70 = Vector3.new(v59, v68, v69)
				local v71 = -v59 * 0.3
				local v72 = Vector3.new(v59, v71, v59)
				local v73 = -v59
				local v74 = -v59 * 0.3
				__set_list(v63, 1, {v67, v70, v72, (Vector3.new(v73, v74, v59))})
				local v75 = {
					{ v63[1], v63[2] },
					{ v63[2], v63[3] },
					{ v63[3], v63[4] },
					{ v63[4], v63[1] },
					{ v63[1], v62 },
					{ v63[2], v62 },
					{ v63[3], v62 },
					{ v63[4], v62 }
				}
				local v76 = v75[(p57 - 1) % #v75 + 1]
				local v77 = v76[1]
				return CFrame.fromOrientation(v60 * 0.7, v60, v60 * 0.3):VectorToWorldSpace(v77), v_u_55(v76[2], v60)
			end,
			function(p78, p79, _)
				-- upvalues: (copy) v_u_55
				local v80 = p78 * 0.25
				local v81 = 300 * (0.35 + (math.sin(v80) + 1) / 2 * 0.15)
				local v82 = p78 * 0.35
				local v83 = {}
				local v84 = -v81
				local v85 = -v81
				local v86 = -v81
				local v87 = Vector3.new(v84, v85, v86)
				local v88 = -v81
				local v89 = -v81
				local v90 = Vector3.new(v81, v88, v89)
				local v91 = -v81
				local v92 = Vector3.new(v81, v81, v91)
				local v93 = -v81
				local v94 = -v81
				local v95 = Vector3.new(v93, v81, v94)
				local v96 = -v81
				local v97 = -v81
				local v98 = Vector3.new(v96, v97, v81)
				local v99 = -v81
				local v100 = Vector3.new(v81, v99, v81)
				local v101 = Vector3.new(v81, v81, v81)
				local v102 = -v81
				__set_list(v83, 1, {v87, v90, v92, v95, v98, v100, v101, (Vector3.new(v102, v81, v81))})
				local v103 = {
					{ 1, 2 },
					{ 2, 3 },
					{ 3, 4 },
					{ 4, 1 },
					{ 5, 6 },
					{ 6, 7 },
					{ 7, 8 },
					{ 8, 5 },
					{ 1, 5 },
					{ 2, 6 },
					{ 3, 7 },
					{ 4, 8 }
				}
				local v104 = v103[(p79 - 1) % #v103 + 1]
				local v105 = v83[v104[1]]
				return CFrame.fromOrientation(v82 * 0.7, v82, v82 * 0.3):VectorToWorldSpace(v105), v_u_55(v83[v104[2]], v82)
			end,
			function(p106, p107, _)
				-- upvalues: (copy) v_u_55
				local v108 = p106 * 0.4
				local v109 = 300 * (0.4 + (math.sin(v108) + 1) / 2 * 0.15)
				local v110 = p106 * 0.45
				local v111 = p106 * 1.5
				local v112 = v109 * (math.sin(v111) * 0.1 + 1)
				local v113 = {}
				local v114 = Vector3.new(0, v112, 0)
				local v115 = -v112
				local v116 = Vector3.new(0, v115, 0)
				local v117 = Vector3.new(v112, 0, 0)
				local v118 = -v112
				local v119 = Vector3.new(v118, 0, 0)
				local v120 = Vector3.new(0, 0, v112)
				local v121 = -v112
				__set_list(v113, 1, {v114, v116, v117, v119, v120, (Vector3.new(0, 0, v121))})
				local v122 = {
					{ 1, 3 },
					{ 1, 4 },
					{ 1, 5 },
					{ 1, 6 },
					{ 2, 3 },
					{ 2, 4 },
					{ 2, 5 },
					{ 2, 6 },
					{ 3, 5 },
					{ 5, 4 },
					{ 4, 6 },
					{ 6, 3 }
				}
				local v123 = v122[(p107 - 1) % #v122 + 1]
				local v124 = v113[v123[1]]
				return CFrame.fromOrientation(v110 * 0.7, v110, v110 * 0.3):VectorToWorldSpace(v124), v_u_55(v113[v123[2]], v110)
			end,
			function(p125, p126, p127)
				local v128 = p125 * 0.3
				local v129 = 300 * (0.5 + (math.sin(v128) + 1) / 2 * 0.2)
				local v130 = p125 * 0.7
				local v131 = p125 * 0.4
				local v132 = math.sin(v131) * 0.6108652381980153
				local v133 = p125 * 0.3
				local v134 = math.cos(v133) * 0.3490658503988659
				local v135 = CFrame.fromOrientation(v132, 0, v134)
				local v136 = (p126 - 1) / p127 * 3.141592653589793 * 2 + v130
				local v137 = p126 / p127 * 3.141592653589793 * 2 + v130
				local v138 = math.cos(v136) * v129
				local v139 = math.sin(v136) * v129
				local v140 = v135:VectorToWorldSpace((Vector3.new(v138, 0, v139)))
				local v141 = math.cos(v137) * v129
				local v142 = math.sin(v137) * v129
				return v140, v135:VectorToWorldSpace((Vector3.new(v141, 0, v142)))
			end
		}
		v_u_22 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_44, (copy) v_u_143, (copy) v_u_42, (copy) v_u_43
			if v_u_44 then
				local v144 = os.clock()
				local v145 = v144 / 8
				local v146 = math.floor(v145) % #v_u_143 + 1
				local v147 = v146 % #v_u_143 + 1
				local v148 = (v145 % 1 - 0.7) / 0.3
				local v149 = math.clamp(v148, 0, 1)
				local v150 = v149 * v149 * (3 - v149 * 2)
				local v151 = v_u_143[v146]
				local v152 = v_u_143[v147]
				local v153 = v144 * 0.5
				local v154 = (math.sin(v153) + 1) / 2
				local v155 = 2 + v154 * 2.5
				for _, v156 in v_u_42 do
					local v157 = v156.index
					local v158, v159 = v151(v144, v157, 12)
					local v160, v161 = v152(v144, v157, 12)
					local v162 = v158:Lerp(v160, v150)
					local v163 = v159:Lerp(v161, v150)
					v156.originAttach.WorldPosition = v_u_44 + v162
					v156.endAttach.WorldPosition = v_u_44 + v163
					v156.beam.Width0 = v155
					v156.beam.Width1 = v155 * 0.3
					v156.beam.Transparency = NumberSequence.new(0.15 + (1 - v154) * 0.25)
				end
				local v164 = v155 * 0.5
				for _, v165 in v_u_43 do
					local v166 = v165.index
					local v167, v168 = v151(v144 + 0.5, v166, 8)
					local v169, v170 = v152(v144 + 0.5, v166, 8)
					local v171 = v167:Lerp(v169, v150) * 0.25
					local v172 = v168:Lerp(v170, v150) * 0.25
					v165.originAttach.WorldPosition = v_u_44 + v171
					v165.endAttach.WorldPosition = v_u_44 + v172
					v165.beam.Width0 = v164
					v165.beam.Width1 = v164 * 0.3
					v165.beam.Transparency = NumberSequence.new(0.25 + (1 - v154) * 0.3)
				end
			end
		end)
		local v_u_173 = 70
		local v_u_174 = workspace.CurrentCamera
		local v_u_175 = Color3.fromRGB(230, 190, 255)
		local v_u_176 = Color3.fromRGB(255, 140, 140)
		local v_u_177 = Color3.fromRGB(90, 40, 140)
		local v_u_178 = Color3.fromRGB(180, 40, 50)
		if v_u_20 then
			v_u_20:Disconnect()
			v_u_20 = nil
		end
		v_u_20 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_19, (ref) v_u_173, (copy) v_u_174, (ref) v_u_15, (copy) v_u_175, (copy) v_u_176, (copy) v_u_177, (copy) v_u_178, (ref) v_u_26
			if v_u_19 and v_u_19.IsPlaying then
				local v179 = (v_u_19.PlaybackLoudness or 0) / 1000
				v_u_173 = v_u_173 + (math.clamp(v179, 0, 1) * 12 + 70 - v_u_173) * 0.15
				v_u_174.FieldOfView = v_u_173
			end
			local v180 = os.clock() * 0.8 * 3.141592653589793 * 2
			local v181 = (math.sin(v180) + 1) / 2
			v_u_15.TintColor = v_u_175:Lerp(v_u_176, v181)
			game.Lighting.Ambient = v_u_177:Lerp(v_u_178, v181)
			if v_u_26 then
				local v182 = v_u_26
				local v183 = os.clock() * 3
				v182.OutlineTransparency = (math.sin(v183) + 1) * 0.6 / 2 + 0.2
			end
		end)
		local v184 = workspace.BasePlate.TopBaseplate
		local v185 = 0.75
		while v_u_2 do
			v185 = v185 + 0.003
			if v185 > 1 then
				v185 = v185 - 1
			end
			local v186 = v185 > 0.1 and v185 < 0.7 and 0.7 or v185
			v184.Color = Color3.fromHSV(v186, 0.8, 0.5)
			game.Lighting.Ambient = Color3.fromHSV(v186, 0.6, 0.35)
			task.wait(0.05)
		end
		v184.Color = Color3.fromRGB(91, 154, 76)
		v_u_174.FieldOfView = 70
	end
end
local function v_u_188(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_20, (ref) v_u_21, (ref) v_u_22, (ref) v_u_25, (ref) v_u_19, (copy) v_u_12, (ref) v_u_23, (ref) v_u_24, (ref) v_u_26, (copy) v_u_13, (copy) v_u_14, (copy) v_u_3, (copy) v_u_15
	if v_u_2 then
		v_u_2 = false
		if v_u_20 then
			v_u_20:Disconnect()
			v_u_20 = nil
		end
		if v_u_21 then
			v_u_21:Disconnect()
			v_u_21 = nil
		end
		if v_u_22 then
			v_u_22:Disconnect()
			v_u_22 = nil
		end
		if v_u_25 then
			v_u_25:Stop()
		end
		v_u_25 = nil
		if v_u_19 then
			v_u_19:Stop()
			v_u_19 = nil
		end
		v_u_12.Stop("ShredSolo")
		if v_u_23 then
			v_u_23:Destroy()
			v_u_23 = nil
		end
		if v_u_24 then
			v_u_24:Destroy()
			v_u_24 = nil
		end
		if v_u_26 then
			v_u_26:Destroy()
			v_u_26 = nil
		end
		if v_u_13 then
			v_u_14.UpdateSkybox(v_u_13, 0)
		end
		v_u_3:Create(v_u_15, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Contrast"] = 0,
			["Saturation"] = 0
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = game.Lighting:GetAttribute("DefaultOutdoorAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 0,
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		v_u_3:Create(workspace.Terrain.Clouds, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0
		}):Play()
		task.delay(3, function()
			workspace.Terrain.Clouds.Enabled = false
		end)
		workspace.CurrentCamera.FieldOfView = 70
	end
end
v18.OnClientEvent:Connect(function(p189, p_u_190, p_u_191)
	-- upvalues: (ref) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_15, (copy) v_u_5
	if v_u_2 then
		local v_u_192 = game.Players.LocalPlayer.Character
		local v_u_193 = Instance.new("Attachment")
		v_u_193.WorldPosition = p189
		v_u_193.Parent = workspace.Terrain
		local v_u_194 = Instance.new("Attachment")
		v_u_194.WorldPosition = p_u_190
		v_u_194.Parent = workspace.Terrain
		local v_u_195 = v_u_10.new(v_u_193, v_u_194, 20)
		v_u_195.Thickness = 2.5
		v_u_195.Color = Color3.fromRGB(180, 80, 255)
		v_u_195.Frequency = 12
		v_u_195.MinThicknessMultiplier = 0.2
		v_u_195.MaxThicknessMultiplier = 1.2
		task.delay(0.3, function()
			-- upvalues: (copy) v_u_192, (ref) v_u_11, (copy) p_u_190, (ref) v_u_3, (ref) v_u_15, (copy) p_u_191, (ref) v_u_5, (copy) v_u_195
			if v_u_192 and v_u_192:FindFirstChild("HumanoidRootPart") then
				v_u_11:ScreenShake("Normal", { "Vector" }, 4, 0.6, 0.3, { v_u_192.HumanoidRootPart.Position, p_u_190, 250 })
				v_u_11:ScreenShake("Normal", { "Tilt", 6 }, 6, 0.5, 0.4, { v_u_192.HumanoidRootPart.Position, p_u_190, 250 })
			end
			v_u_3:Create(v_u_15, TweenInfo.new(0.08), {
				["Brightness"] = 0.5
			}):Play()
			task.delay(0.08, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_15
				v_u_3:Create(v_u_15, TweenInfo.new(0.6), {
					["Brightness"] = 0.15
				}):Play()
			end)
			local v196 = p_u_191 and (p_u_191:FindFirstChild("red guitar") and p_u_191["red guitar"]:FindFirstChild("Muzzle"))
			if v196 then
				local v197 = Instance.new("Part")
				v197.Size = Vector3.new(1, 1, 1)
				v197.Transparency = 1
				v197.Anchored = true
				v197.CanCollide = false
				v197.CFrame = CFrame.new(p_u_190)
				v197.Parent = workspace.WeatherVisuals
				for _, v198 in v196:GetDescendants() do
					if v198:IsA("ParticleEmitter") then
						local v199 = v198:Clone()
						v199.Parent = v197
						v199:Emit(v199:GetAttribute("EmitCount") or 1)
					end
				end
				v_u_5:AddItem(v197, 4)
			end
			task.delay(0.2, function()
				-- upvalues: (ref) v_u_195
				v_u_195:DestroyDissipate(0.4)
			end)
		end)
		task.delay(3, function()
			-- upvalues: (copy) v_u_193, (copy) v_u_194
			v_u_193:Destroy()
			v_u_194:Destroy()
		end)
	end
end)
workspace:GetAttributeChangedSignal("ShredSolo"):Connect(function()
	-- upvalues: (copy) v_u_187, (copy) v_u_188
	if workspace:GetAttribute("ShredSolo") then
		v_u_187()
	else
		v_u_188()
	end
end)
if workspace:GetAttribute("ShredSolo") then
	task.defer(function()
		-- upvalues: (copy) v_u_187
		v_u_187(true)
	end)
else
	v_u_188(true)
end
return v1