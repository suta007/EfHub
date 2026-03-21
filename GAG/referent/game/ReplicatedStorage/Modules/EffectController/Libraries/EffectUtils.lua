local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = require(v1.Modules.EffectController.Utility.Utility)
local v_u_6 = {}
local v_u_7 = {
	"rbxassetid://13080396681",
	"rbxassetid://13080396467",
	"rbxassetid://13080396272",
	"rbxassetid://13080396046",
	"rbxassetid://13080395739",
	"rbxassetid://13080395411",
	"rbxassetid://13080395112",
	"rbxassetid://13080394784",
	"rbxassetid://13080394488",
	"rbxassetid://13080394240",
	"rbxassetid://13080394013",
	"rbxassetid://13080393801",
	"rbxassetid://13080393553",
	"rbxassetid://13080393316",
	"rbxassetid://13080393039",
	"rbxassetid://13080392801",
	"rbxassetid://13080392599",
	"rbxassetid://13080392299",
	"rbxassetid://13080392045",
	"rbxassetid://13080391819",
	"rbxassetid://13080391566",
	"rbxassetid://13080391273",
	"rbxassetid://13080391030",
	"rbxassetid://13080391030",
	"rbxassetid://13080390759",
	"rbxassetid://13080389960"
}
local v_u_271 = {
	["EmitParticles"] = function(p8, p9, p10, p11)
		-- upvalues: (copy) v_u_3
		local v12 = next
		local v13, v14 = p8:GetDescendants()
		local v15 = p11 or false
		local v16 = p10 or 0.5
		local v17 = p9 or 2
		for _, v_u_18 in v12, v13, v14 do
			if v_u_18:IsA("ParticleEmitter") then
				if v_u_18:GetAttribute("EmitDelay") then
					task.delay(v_u_18:GetAttribute("EmitDelay"), function()
						-- upvalues: (copy) v_u_18
						v_u_18:Emit(v_u_18:GetAttribute("EmitCount"))
					end)
				else
					v_u_18:Emit(v_u_18:GetAttribute("EmitCount"))
				end
			elseif (v_u_18:IsA("PointLight") or v_u_18:IsA("SpotLight")) and v15 == false then
				v_u_3:Create(v_u_18, TweenInfo.new(v16, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true, 0), {
					["Brightness"] = v17
				}):Play()
			end
		end
	end,
	["ParticleHandler"] = function(p19, p20, p21)
		-- upvalues: (copy) v_u_3
		local v22 = next
		local v23, v24 = p19:GetDescendants()
		for _, v25 in v22, v23, v24 do
			if v25:IsA("ParticleEmitter") then
				v25.Enabled = p20
			elseif v25:IsA("PointLight") or v25:IsA("SpotLight") then
				v_u_3:Create(v25, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					["Brightness"] = p21
				}):Play()
			end
		end
	end,
	["OwnTrails"] = function(p_u_26, p27, p28, p_u_29, p30)
		-- upvalues: (copy) v_u_271, (copy) v_u_4
		local v_u_31 = p28 or 15
		local v_u_32 = p27 or 15
		local v_u_33 = p30 or 3
		coroutine.wrap(function()
			-- upvalues: (copy) p_u_26, (copy) p_u_29, (ref) v_u_32, (ref) v_u_31, (ref) v_u_271, (ref) v_u_4, (ref) v_u_33
			local v34 = p_u_26.Position
			local v35 = p_u_29.Position
			local v36 = (v34 + v35) / 2
			local v37 = math.random(-v_u_32, v_u_32)
			local v38 = math.random(-v_u_32, v_u_32)
			local v39 = math.random
			local v40 = -v_u_32
			local v41 = v_u_32
			local v42 = v36 + Vector3.new(v37, v38, v39(v40, v41))
			for v43 = 1, v_u_31 do
				local v44 = v43 / v_u_31
				local v45 = v34 + (v42 - v34) * v44
				p_u_26.Position = v45 + (v42 + (v35 - v42) * v44 - v45) * v44
				v35 = p_u_29.Position
				task.wait()
			end
			v_u_271.ParticleHandler(p_u_26, false, 0)
			v_u_4:AddItem(p_u_26, v_u_33)
		end)()
	end,
	["CreateTrails"] = function(p46, p47, p_u_48, p49, p50, p51, p52)
		-- upvalues: (copy) v_u_4
		local v_u_53 = p47 or 15
		local v_u_54 = p46 or 15
		local v55 = p52 or 2
		local v56 = p49 or { Color3.fromRGB(255, 255, 255) }
		local v57 = v56[math.random(1, #v56)]
		local v_u_58
		if (p51 or false) and math.random(1, v55) == v55 then
			v_u_58 = script.Trails.Trail2:Clone()
			v_u_58.Attachment1.Trail.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, v_u_54 * 0.01), NumberSequenceKeypoint.new(1, 0) })
		else
			v_u_58 = script.Trails.Trail:Clone()
		end
		v_u_58.Attachment1.Trail.LightEmission = 0.5
		v_u_58.CFrame = p_u_48.CFrame * CFrame.new(math.random(-v_u_54, v_u_54), math.random(-v_u_54, v_u_54), math.random(-v_u_54, v_u_54))
		v_u_58.Attachment1.Trail.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v57), ColorSequenceKeypoint.new(1, v57) })
		v_u_58.Parent = p50
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_58, (copy) p_u_48, (ref) v_u_54, (ref) v_u_53, (ref) v_u_4
			local v59 = v_u_58.Position
			local v60 = p_u_48.Position
			local v61 = (v59 + v60) / 2
			local v62 = math.random(-v_u_54, v_u_54)
			local v63 = math.random(-v_u_54, v_u_54)
			local v64 = math.random
			local v65 = -v_u_54
			local v66 = v_u_54
			local v67 = v61 + Vector3.new(v62, v63, v64(v65, v66))
			for v68 = 1, v_u_53 do
				local v69 = v68 / v_u_53
				local v70 = v59 + (v67 - v59) * v69
				v_u_58.Position = v70 + (v67 + (v60 - v67) * v69 - v70) * v69
				v60 = p_u_48.Position
				task.wait()
			end
			v_u_4:AddItem(v_u_58, v_u_58.Attachment1.Trail.Lifetime)
		end)()
	end,
	["CreatePartTrails"] = function(p71, p72, p_u_73)
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		local v_u_74 = p72 or 15
		local v75 = p71 or 15
		local v76 = p_u_73.Position
		local v77 = math.random(-v75, v75)
		local v78 = math.random(-v75, v75)
		local v79 = math.random
		local v80 = -v75
		local v_u_81 = v76 + Vector3.new(v77, v78, v79(v80, v75))
		local v_u_82 = p_u_73.Position
		local v83 = (v_u_81 + v_u_82) / 2
		local v84 = math.random(-v75, v75)
		local v85 = math.random(-v75, v75)
		local v86 = math.random
		local v87 = -v75
		local v_u_88 = v83 + Vector3.new(v84, v85, v86(v87, v75))
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_74, (copy) v_u_81, (copy) v_u_88, (ref) v_u_82, (ref) v_u_2, (ref) v_u_4, (ref) v_u_3, (copy) p_u_73
			for v89 = 1, v_u_74 do
				local v90 = v89 / v_u_74
				local v91 = (v89 + 1) / v_u_74
				local v92 = v_u_81
				local v93 = v92 + (v_u_88 - v92) * v90
				local v94 = v_u_88
				local v95 = v94 + (v_u_82 - v94) * v90
				local v96 = v_u_81
				local v97 = v96 + (v_u_88 - v96) * v91
				local v98 = v_u_88
				local v99 = v98 + (v_u_82 - v98) * v91
				local v100 = v93 + (v95 - v93) * v90
				local v101 = v97 + (v99 - v97) * v91
				local v102 = (v101 - v100).Magnitude
				local v103 = v_u_2.GoIn:Clone()
				v_u_4:AddItem(v103, 0.025)
				v103.Position = v100
				v103.CFrame = CFrame.lookAt(v103.Position, v101)
				v103.Parent = workspace.FX
				v_u_3:Create(v103, TweenInfo.new(0.025), {
					["Size"] = Vector3.new(0.2, 0.2, v102)
				}):Play()
				v_u_82 = p_u_73.Position
				task.wait()
			end
		end)()
	end,
	["Flipbook"] = function(p104, p_u_105, p_u_106)
		local v_u_107 = p104:FindFirstChildOfClass("Decal")
		if v_u_107 and p_u_106 then
			v_u_107.Transparency = 1
			coroutine.wrap(function()
				-- upvalues: (copy) p_u_106, (copy) v_u_107, (copy) p_u_105
				for v108 = 1, #p_u_106 do
					local v109 = v_u_107
					v109.Transparency = v109.Transparency - #p_u_106 * 0.025
					v_u_107.Texture = p_u_106[v108]
					task.wait(1 / p_u_105)
				end
				v_u_107.Texture = ""
			end)()
		end
	end,
	["GroundSmoke"] = function(p110)
		-- upvalues: (copy) v_u_3, (copy) v_u_271, (copy) v_u_7
		local v111 = Random.new():NextNumber(125, 500)
		local v_u_112 = script.SmokeMesh:Clone()
		v_u_112.Decal.ZIndex = math.random(1, 10000000)
		v_u_112.Decal.Color3 = Color3.fromRGB(1 * v111, 1 * v111, 1 * v111)
		local v113 = p110.CFrame * CFrame.new(0, -1, 0)
		local v114 = CFrame.Angles
		local v115 = math.random(-360, 360)
		v_u_112.CFrame = v113 * v114(0, math.rad(v115), 0)
		v_u_112.Parent = workspace.World.Alive
		v_u_3:Create(v_u_112.Mesh, TweenInfo.new(0.75), {
			["Scale"] = Vector3.new(2, 0, 2) * Random.new():NextNumber(0.5, 1.25)
		}):Play()
		v_u_3:Create(v_u_112, TweenInfo.new(0.75), {
			["CFrame"] = v_u_112.CFrame * CFrame.Angles(0, -2.0943951023931953, 0) * CFrame.new(0, -2.5, 0)
		}):Play()
		v_u_3:Create(v_u_112.Decal, TweenInfo.new(0.125), {
			["Transparency"] = 0
		}):Play()
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_112
			v_u_3:Create(v_u_112.Decal, TweenInfo.new(0.625), {
				["Transparency"] = 1
			}):Play()
		end)
		v_u_271.Flipbook(v_u_112, 48, v_u_7)
	end,
	["ImpactFrame"] = function(p116, p117)
		-- upvalues: (copy) v_u_4
		local v118 = next
		local v119, v120 = game.Lighting:GetChildren()
		local v_u_121 = p117 or 0.06
		for _, v122 in v118, v119, v120 do
			if v122:IsA("ColorCorrectionEffect") then
				v122.Enabled = false
			end
		end
		for v123 = 1, #p116 do
			local v_u_124 = Instance.new("Highlight")
			v_u_124.FillTransparency = 0
			v_u_124.OutlineTransparency = 1
			v_u_124.FillColor = Color3.new(1, 1, 1)
			v_u_124.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			v_u_124.Parent = p116[v123]
			task.delay(v_u_121 * 0.5, function()
				-- upvalues: (copy) v_u_124
				v_u_124.FillColor = Color3.new(0, 0, 0)
			end)
			v_u_4:AddItem(v_u_124, v_u_121)
		end
		local v_u_125 = Instance.new("ColorCorrectionEffect")
		v_u_125.TintColor = Color3.new(0, 0, 0)
		v_u_125.Brightness = 3
		task.delay(v_u_121 * 0.5, function()
			-- upvalues: (copy) v_u_125, (ref) v_u_121
			v_u_125.TintColor = Color3.new(1, 1, 1)
			task.wait(v_u_121 * 0.5)
			local v126 = next
			local v127, v128 = game.Lighting:GetChildren()
			for _, v129 in v126, v127, v128 do
				if v129:IsA("ColorCorrectionEffect") then
					v129.Enabled = true
				end
			end
		end)
		v_u_125.Parent = game.Lighting
		v_u_4:AddItem(v_u_125, v_u_121)
	end,
	["BlackWhite"] = function(p130)
		-- upvalues: (copy) v_u_4
		local v_u_131 = p130 or 0.08
		local v_u_132 = Instance.new("ColorCorrectionEffect")
		v_u_4:AddItem(v_u_132, 1)
		v_u_132.Contrast = 5
		v_u_132.Saturation = -1
		v_u_132.Enabled = false
		v_u_132.Parent = game.Lighting
		local v_u_133 = Instance.new("ColorCorrectionEffect")
		v_u_4:AddItem(v_u_133, 1)
		v_u_133.Contrast = -3
		v_u_133.Saturation = -1
		v_u_133.Enabled = false
		v_u_133.Parent = game.Lighting
		v_u_132.Enabled = true
		task.delay(v_u_131, function()
			-- upvalues: (copy) v_u_132, (copy) v_u_133, (ref) v_u_131
			v_u_132.Enabled = false
			v_u_133.Enabled = true
			task.wait(v_u_131)
			v_u_133.Enabled = false
		end)
	end,
	["BloomBlur"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v_u_134 = TweenInfo.new
		local v_u_135 = Instance.new("BlurEffect")
		local v_u_136 = Instance.new("BloomEffect")
		v_u_135.Parent = game.Lighting
		v_u_136.Parent = game.Lighting
		v_u_4:AddItem(v_u_135, 0.5)
		v_u_4:AddItem(v_u_136, 0.5)
		v_u_135.Name = "Blur"
		v_u_136.Name = "Bloom"
		v_u_3:Create(v_u_135, v_u_134(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Size"] = math.random(8, 12)
		}):Play()
		v_u_3:Create(v_u_136, v_u_134(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Intensity"] = 3,
			["Size"] = 35,
			["Threshold"] = 1
		}):Play()
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_135, (copy) v_u_134, (copy) v_u_136
			v_u_3:Create(v_u_135, v_u_134(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Size"] = 0
			}):Play()
			v_u_3:Create(v_u_136, v_u_134(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Intensity"] = 1,
				["Size"] = 24,
				["Threshold"] = 2
			}):Play()
		end)
	end,
	["JustBlur"] = function(p137)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v_u_138 = TweenInfo.new
		local v_u_139 = Instance.new("BlurEffect")
		v_u_139.Parent = game.Lighting
		v_u_4:AddItem(v_u_139, p137)
		v_u_139.Name = "Blur"
		v_u_3:Create(v_u_139, v_u_138(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Size"] = math.random(8, 12)
		}):Play()
		task.delay(p137 - 0.5, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_139, (copy) v_u_138
			v_u_3:Create(v_u_139, v_u_138(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Size"] = 0
			}):Play()
		end)
	end,
	["JustBloom"] = function(p140)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v141 = p140 or 1
		local v_u_142 = TweenInfo.new
		local v_u_143 = Instance.new("BloomEffect")
		v_u_143.Parent = game.Lighting
		v_u_4:AddItem(v_u_143, v141)
		v_u_143.Name = "Bloom"
		v_u_3:Create(v_u_143, v_u_142(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Intensity"] = 3,
			["Size"] = 35,
			["Threshold"] = 1
		}):Play()
		task.delay(v141 - 0.5, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_143, (copy) v_u_142
			v_u_3:Create(v_u_143, v_u_142(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["Intensity"] = 1,
				["Size"] = 24,
				["Threshold"] = 2
			}):Play()
		end)
	end,
	["AddColorDepth"] = function(p144, p145)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v_u_146 = p144 or 1
		local v_u_147 = p145 or 0.35
		local v_u_148 = Instance.new("ColorCorrectionEffect")
		v_u_4:AddItem(v_u_148, v_u_146 + v_u_147)
		v_u_148.Saturation = 0.2
		v_u_148.Contrast = 0.1
		v_u_148.Parent = game.Lighting
		task.delay(v_u_147, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_148, (ref) v_u_146, (ref) v_u_147
			v_u_3:Create(v_u_148, TweenInfo.new(0.3), {
				["Saturation"] = 0.2,
				["Contrast"] = 0.1
			}):Play()
			task.wait(v_u_146 - v_u_147)
			v_u_3:Create(v_u_148, TweenInfo.new(0.3), {
				["Saturation"] = 0,
				["Contrast"] = 0
			}):Play()
		end)
	end,
	["GroundRocks"] = function(p149, p150, p151, p152, p153, p_u_154, p_u_155)
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		local v156 = p150 or -10
		for _ = 1, p151 do
			local v157 = CFrame.new(p149)
			local v158 = workspace:Raycast(v157.Position, Vector3.new(0, v156, 0), v_u_5.RayParams)
			if v158 and (v158.Instance and v158.Position) then
				local v_u_159 = Instance.new("Part")
				v_u_159.Parent = workspace.World.ClientEffects
				v_u_159.Name = "Rock"
				v_u_159.Anchored = false
				v_u_159.CanCollide = true
				v_u_159.CollisionGroup = "Humanoid"
				local v160 = math.random(10, p152 * 100) / 100
				local v161 = v160 / 1.5
				local v162 = v160 / 1.5
				v_u_159.Size = Vector3.new(v160, v161, v162)
				local v163 = CFrame.new(v158.Position)
				local v164 = CFrame.Angles
				local v165 = math.random(-360, 360)
				local v166 = math.rad(v165)
				local v167 = math.random(-360, 360)
				local v168 = math.rad(v167)
				local v169 = math.random(-360, 360)
				v_u_159.CFrame = v163 * v164(v166, v168, (math.rad(v169)))
				v_u_159.Material = v158.Material
				v_u_159.MaterialVariant = v158.Instance.MaterialVariant
				v_u_159.Color = v158.Instance.Color
				local v170 = Random.new():NextInteger(-2, 2)
				local v171 = Random.new():NextInteger(-2, 2)
				local v172 = (v158.Position + Vector3.new(0, 5, 0) - (v158.Position + Vector3.new(v170, 1, v171))).Unit
				local v_u_173 = Instance.new("BodyVelocity")
				v_u_173.Name = "Fly"
				v_u_173.Parent = v_u_159
				v_u_173.P = 2000
				v_u_173.MaxForce = Vector3.new(25000, 25000, 25000)
				v_u_173.Velocity = v172 * p153
				task.delay(0.2, function()
					-- upvalues: (copy) v_u_173, (copy) p_u_154, (ref) v_u_3, (copy) v_u_159, (copy) p_u_155
					v_u_173:Destroy()
					task.wait(p_u_154)
					v_u_3:Create(v_u_159, TweenInfo.new(p_u_155, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						["Size"] = Vector3.new()
					}):Play()
					task.wait(1)
					v_u_159:Destroy()
				end)
			end
		end
	end,
	["JuanGroundRock"] = function(p174, p_u_175)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
		local v176 = math.random(0, 30)
		local v177 = p174.Position
		local v178 = v_u_5.RayParams
		local v179 = workspace:Raycast(p174.Position, Vector3.new(0, -25, 0), v178)
		if v179 then
			local v_u_180 = script.Rocks.Rock:Clone()
			local v181 = v_u_180.Size.X * Random.new():NextNumber(1, 2.25)
			local v182 = v_u_180.Size.Y * Random.new():NextNumber(1, 2.25)
			local v183 = v_u_180.Size.Z * Random.new():NextNumber(1, 1.9)
			local v184 = Vector3.new(v181, v182, v183)
			v_u_4:AddItem(v_u_180, 3)
			v_u_180.CFrame = p174.CFrame * CFrame.new(-p_u_175 * Random.new():NextNumber(1, 1.5), -v179.Distance, 0)
			v_u_180.Size = Vector3.new(0, 0, 0)
			v_u_180.Parent = workspace.World.ClientEffects
			local v185 = CFrame.lookAt(v_u_180.Position, v177)
			local v186 = CFrame.Angles
			local v187 = math.rad(v176)
			local v188 = math.random(-10, 10)
			local v189 = math.rad(v188)
			local v190 = math.random(-10, 10)
			v_u_180.CFrame = v185 * v186(v187, v189, (math.rad(v190)))
			v_u_180.BrickColor = BrickColor.new("Dark grey")
			v_u_180.Material = Enum.Material.Concrete
			v_u_180.MaterialVariant = v179.Instance.MaterialVariant
			v_u_3:Create(v_u_180, TweenInfo.new(0.3), {
				["Size"] = v184
			}):Play()
			local v_u_191 = 90 - v176
			task.delay(1.7, function()
				-- upvalues: (ref) v_u_3, (copy) v_u_180, (copy) p_u_175, (copy) v_u_191
				local v192 = v_u_3
				local v193 = v_u_180
				local v194 = TweenInfo.new(1)
				local v195 = {}
				local v196 = v_u_191
				v195.CFrame = v_u_180.CFrame * CFrame.new(-(p_u_175 * 2), -11.5, 0) * CFrame.Angles(math.rad(v196), 0, 0)
				v192:Create(v193, v194, v195):Play()
			end)
		end
	end,
	["throwRock"] = function(p197, p198, p199, p200)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v201 = p200 or 180
		local v_u_202 = script.Rocks["Rock" .. math.random(1, 3)]:Clone()
		v_u_202.Size = v_u_202.Size * Random.new():NextNumber(1.01, p198 or 2)
		v_u_202.CanCollide = false
		local v203 = p197 * CFrame.new(math.random(-5, 5), math.random(0, 5), math.random(-5, 5))
		local v204 = CFrame.Angles
		local v205 = math.random(-v201, v201)
		local v206 = math.rad(v205)
		local v207 = math.random(-v201, v201)
		v_u_202.CFrame = v203 * v204(v206, 0, (math.rad(v207)))
		v_u_202.Parent = workspace.World.ClientEffects
		local v208 = Instance.new("BodyVelocity")
		v208.MaxForce = Vector3.new(100000000, 100000000, 100000000)
		v208.P = 1000
		v208.Velocity = v_u_202.CFrame.UpVector * math.random(15, p199 or 75)
		v208.Parent = v_u_202
		v_u_4:AddItem(v208, 0.2)
		task.delay(0.1, function()
			-- upvalues: (copy) v_u_202
			v_u_202.CanCollide = true
		end)
		task.delay(2, function()
			-- upvalues: (copy) v_u_202, (ref) v_u_3, (ref) v_u_4
			v_u_202.Start.Trail.Enabled = false
			v_u_3:Create(v_u_202, TweenInfo.new(0.5), {
				["Size"] = Vector3.new(0, 0, 0)
			}):Play()
			v_u_4:AddItem(v_u_202, 0.5)
		end)
	end,
	["LeftRightRock"] = function(p209, p210, p211, p212)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
		local v213 = -p210 or -25
		local v214 = v_u_5.RayParams
		local v215 = workspace:Raycast(p209.Position, Vector3.new(0, v213, 0), v214)
		if v215 then
			local v_u_216 = Instance.new("Part")
			v_u_4:AddItem(v_u_216, 3)
			v_u_216.Anchored = true
			v_u_216.CanCollide = true
			v_u_216.CFrame = CFrame.new(v215.Position, v215.Position + v215.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0)
			v_u_216.Position = v_u_216.Position + p209.CFrame.RightVector * p211
			local v217 = math.random(-360, 360)
			local v218 = math.random(-360, 360)
			local v219 = math.random
			v_u_216.Orientation = Vector3.new(v217, v218, v219(-360, 360))
			v_u_216.Material = v215.Instance.Material
			v_u_216.MaterialVariant = v215.Instance.MaterialVariant
			v_u_216.Color = v215.Instance.Color
			v_u_216.Parent = workspace.World.ClientEffects
			local v_u_220 = v_u_216:Clone()
			v_u_4:AddItem(v_u_220, 3)
			v_u_220.CFrame = CFrame.new(v215.Position, v215.Position + v215.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0)
			v_u_220.Position = v_u_220.Position + p209.CFrame.RightVector * -p211
			local v221 = math.random(-360, 360)
			local v222 = math.random(-360, 360)
			local v223 = math.random
			v_u_220.Orientation = Vector3.new(v221, v222, v223(-360, 360))
			v_u_220.Parent = workspace.World.ClientEffects
			v_u_3:Create(v_u_216, TweenInfo.new(0.2), {
				["Size"] = Vector3.new(1, 1, 1) * p212
			}):Play()
			v_u_3:Create(v_u_220, TweenInfo.new(0.2), {
				["Size"] = Vector3.new(1, 1, 1) * p212
			}):Play()
			task.delay(2.5, function()
				-- upvalues: (ref) v_u_3, (copy) v_u_216, (copy) v_u_220
				v_u_3:Create(v_u_216, TweenInfo.new(0.5), {
					["Size"] = Vector3.new(0, 0, 0)
				}):Play()
				v_u_3:Create(v_u_220, TweenInfo.new(0.5), {
					["Size"] = Vector3.new(0, 0, 0)
				}):Play()
			end)
		end
	end,
	["Crater"] = function(p224, p225, p226, p227, p228, p229, p230)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
		local v231 = p228 or 1
		local v232 = p229 or 360
		local v233 = p230 or 0
		local v234 = p227 or 5
		local v235 = p225 or 12
		local v236 = v_u_5.RayParams
		local v237 = workspace:Raycast(p224.Position, Vector3.new(0, p226 or -25, 0), v236)
		local v238 = 0
		if v237 then
			local v239 = (p224.CFrame * CFrame.new(0, -v237.Distance, -1)).Position
			local v240 = script.Part:Clone()
			v_u_4:AddItem(v240, 1)
			v240.Anchored = true
			v240.CanCollide = true
			v240.CFrame = CFrame.new(v237.Position, v237.Position + v237.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0)
			v240.CFrame = CFrame.lookAt(v240.Position, v239) * CFrame.Angles(0, math.rad(v233), 0)
			v240.Parent = workspace.World.ClientEffects
			for _ = 1, v235 do
				v240.CFrame = CFrame.lookAt(v240.Position, v239) * CFrame.Angles(0, math.rad(v233), 0) * CFrame.Angles(0, math.rad(v238), 0)
				local v_u_241 = Instance.new("Part")
				v_u_4:AddItem(v_u_241, 3)
				v_u_241.Anchored = true
				v_u_241.CanCollide = true
				v_u_241.CFrame = v240.CFrame * CFrame.new(0, 0, -v234)
				local v242 = math.random(-360, 360)
				local v243 = math.random(-360, 360)
				local v244 = math.random
				v_u_241.Orientation = Vector3.new(v242, v243, v244(-360, 360))
				v_u_241.Material = v237.Instance.Material
				v_u_241.MaterialVariant = v237.Instance.MaterialVariant
				v_u_241.Color = v237.Instance.Color
				v_u_241.Parent = workspace.World.ClientEffects
				v238 = v238 + v232 / v235
				v_u_3:Create(v_u_241, TweenInfo.new(0.2), {
					["Size"] = Vector3.new(1, 1, 1) * v231
				}):Play()
				task.delay(2.5, function()
					-- upvalues: (ref) v_u_3, (copy) v_u_241
					v_u_3:Create(v_u_241, TweenInfo.new(0.5), {
						["Size"] = Vector3.new(0, 0, 0)
					}):Play()
				end)
			end
		end
	end,
	["DecreaseBeamSize"] = function(p245, p246)
		-- upvalues: (copy) v_u_3
		local v247 = next
		local v248, v249 = p245:GetDescendants()
		for _, v250 in v247, v248, v249 do
			if v250:IsA("Beam") then
				v_u_3:Create(v250, TweenInfo.new(p246), {
					["Width0"] = 0,
					["Width1"] = 0
				}):Play()
			end
		end
	end,
	["CreateWeld"] = function(p251, p252)
		local v253 = Instance.new("Weld")
		v253.Part0 = p251
		v253.Part1 = p252
		v253.Parent = p251
		return v253
	end,
	["RememberParticleSize"] = function(p254)
		-- upvalues: (copy) v_u_6
		local v255 = next
		local v256, v257 = p254:GetDescendants()
		for _, v258 in v255, v256, v257 do
			if v258:IsA("ParticleEmitter") then
				v_u_6[v258.Name] = v258.Size.Keypoints[2].Value
			end
		end
	end,
	["UnRememberParticleSize"] = function(p259)
		-- upvalues: (copy) v_u_6
		local v260 = next
		local v261, v262 = p259:GetDescendants()
		for _, v263 in v260, v261, v262 do
			if v263:IsA("ParticleEmitter") then
				v_u_6[v263.Name] = nil
			end
		end
	end,
	["ScaleParticles"] = function(p264, p265)
		-- upvalues: (copy) v_u_6
		local v266 = next
		local v267, v268 = p264:GetDescendants()
		for _, v269 in v266, v267, v268 do
			if v269:IsA("ParticleEmitter") then
				if v_u_6[v269.Name] then
					local v270 = v_u_6[v269.Name] + p265
					v269.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, v270) })
				else
					warn(v269.Name, "Has No Saved Scale Value")
				end
			end
		end
	end
}
return v_u_271