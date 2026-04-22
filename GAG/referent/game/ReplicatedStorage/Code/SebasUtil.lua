local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Lighting")
local v_u_5 = game:GetService("SoundService")
local v_u_6 = script:WaitForChild("VFXUtil")
local v_u_7 = workspace:WaitForChild("Visuals")
local v_u_8 = {}
local v_u_9 = workspace.CurrentCamera
local v_u_10 = Random.new()
local v_u_11 = Vector3.FromNormalId(Enum.NormalId.Top)
function v_u_8.CubicBezier(_, p12, p13, p14, p15, p16)
	return (1 - p16) ^ 3 * p12 + p16 * 3 * (1 - p16) ^ 2 * p13 + p16 ^ 2 * 3 * (1 - p16) * p14 + p16 ^ 3 * p15
end
function v_u_8.quadBezier(_, p17, p18, p19, p20)
	return (1 - p20) ^ 2 * p17 + 2 * (1 - p20) * p20 * p18 + p20 ^ 2 * p19
end
function v_u_8.QuadraticEaseOut(_, p21)
	local v22 = p21 * p21
	local v23 = 1 - (1 - p21) * (1 - p21)
	return math.lerp(v22, v23, p21)
end
function v_u_8.EaseBackIn(_, p24)
	local v_u_25 = p24 or 1.70158
	return function(p26)
		-- upvalues: (ref) v_u_25
		return p26 * p26 * ((v_u_25 + 1) * p26 - v_u_25)
	end
end
function v_u_8.EaseBackOut(_, p27)
	local v_u_28 = p27 or 1.70158
	return function(p29)
		-- upvalues: (ref) v_u_28
		local v30 = p29 - 1
		return v30 * v30 * ((v_u_28 + 1) * v30 + v_u_28) + 1
	end
end
function v_u_8.EaseBackInOut(_, p31)
	local v_u_32 = (p31 or 1.70158) * 1.525
	return function(p33)
		-- upvalues: (ref) v_u_32
		local v34 = p33 * 2
		if v34 < 1 then
			return 0.5 * (v34 * v34 * ((v_u_32 + 1) * v34 - v_u_32))
		end
		local v35 = v34 - 2
		return 0.5 * (v35 * v35 * ((v_u_32 + 1) * v35 + v_u_32) + 2)
	end
end
function v_u_8.lerp(_, p36, p37, p38)
	return p36 + (p37 - p36) * p38
end
function v_u_8.invLerp(_, p39, p40, p41)
	return (p41 - p39) / (p40 - p39)
end
function v_u_8.remap(_, _, p42, p43, p44, p45)
	-- upvalues: (copy) v_u_8
	local v46 = v_u_8:invLerp(p42, p42, p45)
	return v_u_8:lerp(p43, p44, (math.clamp(v46, 0, 1)))
end
function v_u_8.gaussianRandom(_, p47, p48)
	repeat
		local v49 = 2 * math.random() - 1
		local v50 = 2 * math.random() - 1
		local v51 = math.pow(v49, 2) + math.pow(v50, 2)
	until v51 ~= 0 and v51 < 1
	local v52 = math.log(v51) * -2 / v51
	local v53 = math.sqrt(v52)
	return p47 + p48 * v49 * v53
end
function v_u_8.randomPointInSphere(_, p54)
	-- upvalues: (copy) v_u_8
	local v55 = 6.283185307179586 * math.random()
	local v56 = 2 * math.random() - 1
	local v57 = math.acos(v56)
	local v58 = v_u_8:gaussianRandom(0, p54 / 3)
	local v59 = math.min(v58, p54)
	return v59 * math.sin(v57) * math.cos(v55), v59 * math.sin(v57) * math.sin(v55), v59 * math.cos(v57)
end
function v_u_8.randomPointInAnnulus(_, p60, p61)
	local v62 = 6.283185307179586 * math.random()
	local v63 = 2 * math.random() - 1
	local v64 = math.acos(v63)
	local v65 = p61 - p60
	local v66 = math.random()
	local v67 = p60 + v65 * math.sqrt(v66)
	return v67 * math.sin(v64) * math.cos(v62), v67 * math.sin(v64) * math.sin(v62), v67 * math.cos(v64)
end
function v_u_8.randomPointInSphericalShell(_, p68, p69)
	if p69 < p68 then
		local v70 = p69
		p69 = p68
		p68 = v70
	end
	local v71 = math.max(0, p68)
	local v72 = 6.283185307179586 * math.random()
	local v73 = 2 * math.random() - 1
	local v74 = math.acos(v73)
	local v75 = v71 ^ 3
	local v76 = (v75 + (p69 ^ 3 - v75) * math.random()) ^ 0.3333333333333333
	return v76 * math.sin(v74) * math.cos(v72), v76 * math.sin(v74) * math.sin(v72), v76 * math.cos(v74)
end
function v_u_8.flat(_, p77)
	local v_u_78 = {}
	local function v_u_82(p79)
		-- upvalues: (copy) v_u_82, (copy) v_u_78
		for _, v80 in ipairs(p79) do
			if typeof(v80) == "table" then
				v_u_82(v80)
			else
				local v81 = v_u_78
				table.insert(v81, v80)
			end
		end
	end
	v_u_82(p77)
	return v_u_78
end
function v_u_8.EmitAll(_, p83)
	for _, v_u_84 in pairs(p83:GetDescendants()) do
		if v_u_84:IsA("ParticleEmitter") then
			local v_u_85 = v_u_84:GetAttribute("EmitCount")
			local v86 = v_u_84:GetAttribute("EmitDelay") or 0
			local v_u_87 = v_u_84:GetAttribute("EmitDuration")
			if v_u_85 then
				if v86 == 0 then
					v_u_84:Emit(v_u_85)
					if v_u_87 and v_u_87 ~= 0 then
						v_u_84.Enabled = true
						task.delay(v_u_87, function()
							-- upvalues: (copy) v_u_84
							v_u_84.Enabled = false
						end)
					end
				else
					task.delay(v86, function()
						-- upvalues: (copy) v_u_84, (copy) v_u_85, (copy) v_u_87
						v_u_84:Emit(v_u_85)
						if v_u_87 and v_u_87 ~= 0 then
							v_u_84.Enabled = true
							task.delay(v_u_87, function()
								-- upvalues: (ref) v_u_84
								v_u_84.Enabled = false
							end)
						end
					end)
				end
			end
		end
	end
end
function v_u_8.EmitOnce(_, p88, p89, p90)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8
	local v91 = p88:Clone()
	v_u_2:AddItem(v91, p90 or 1)
	v91.Position = p89
	v91.Parent = v_u_7
	v_u_8:EmitAll(v91)
end
function v_u_8.ToggleAllBeams(_, p92, p93)
	for _, v94 in pairs(p92:GetDescendants()) do
		if v94:IsA("Beam") then
			v94.Enabled = p93
		end
	end
end
function v_u_8.ToggleAllTrails(_, p95, p96)
	for _, v97 in pairs(p95:GetDescendants()) do
		if v97:IsA("Trail") then
			v97.Enabled = p96
		end
	end
end
function v_u_8.ToggleAllParticles(_, p98, p99)
	for _, v100 in pairs(p98:GetDescendants()) do
		if v100:IsA("ParticleEmitter") then
			v100.Enabled = p99
		end
	end
end
function v_u_8.EnableAllParticles(_, p101)
	-- upvalues: (copy) v_u_8
	v_u_8:ToggleAllParticles(p101, true)
end
function v_u_8.DisableAllParticles(_, p102)
	-- upvalues: (copy) v_u_8
	v_u_8:ToggleAllParticles(p102, false)
end
function v_u_8.EnableAllTrails(_, p103)
	-- upvalues: (copy) v_u_8
	v_u_8:ToggleAllTrails(p103, true)
end
function v_u_8.DisableAllTrails(_, p104)
	-- upvalues: (copy) v_u_8
	v_u_8:ToggleAllTrails(p104, false)
end
function v_u_8.PlaySound(_, p105, p106, p107, p108, p109)
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_2
	if p109 then
		p109 = v_u_5:FindFirstChild(p109)
	end
	local v_u_110 = Instance.new("Sound")
	v_u_110.SoundId = p105
	v_u_110.Volume = p106
	v_u_110.Parent = p107
	v_u_110.SoundGroup = p109
	v_u_110:Play()
	task.delay(p108 or 1, function()
		-- upvalues: (copy) v_u_110, (ref) v_u_1, (ref) v_u_2
		if v_u_110 ~= nil then
			local v111 = v_u_1:Create(v_u_110, TweenInfo.new(0.2), {
				["Volume"] = 0
			})
			v111:Play()
			v111.Completed:Connect(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_110
				v_u_2:AddItem(v_u_110, 0)
			end)
		end
	end)
	return v_u_110
end
function v_u_8.SetupBeam(_, p112, p113, p114)
	p112.Attachment0 = p113
	p112.Attachment1 = p114
end
function v_u_8.AppearBeam(_, p115, p116)
	-- upvalues: (copy) v_u_1
	local v117 = v_u_1:Create(p115, TweenInfo.new(p116 or 0.5), {
		["Width0"] = p115.Width0,
		["Width1"] = p115.Width1
	})
	v117:Play()
	p115.Width0 = 0
	p115.Width1 = 0
	p115.Enabled = true
	return v117
end
function v_u_8.AppearAllBeams(_, p118, p119)
	-- upvalues: (copy) v_u_8
	for _, v120 in ipairs(p118:GetDescendants()) do
		if v120:IsA("Beam") then
			v_u_8:AppearBeam(v120, p119)
		end
	end
end
function v_u_8.DisableBeam(_, p121, p122)
	-- upvalues: (copy) v_u_1
	local v123 = v_u_1:Create(p121, TweenInfo.new(p122 or 0.4), {
		["Width0"] = 0,
		["Width1"] = 0
	})
	v123:Play()
	return v123
end
function v_u_8.DisableAllBeams(_, p124, p125)
	-- upvalues: (copy) v_u_8
	for _, v126 in ipairs(p124:GetDescendants()) do
		if v126:IsA("Beam") then
			v_u_8:DisableBeam(v126, p125)
		end
	end
end
function v_u_8.FloorShockwave(_, p127, p128, p129, p130, p131)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_10, (copy) v_u_1, (copy) v_u_2
	local v132 = RaycastParams.new()
	v132.FilterDescendantsInstances = { p127.Parent, v_u_7 }
	v132.FilterType = Enum.RaycastFilterType.Exclude
	local v133 = workspace:Raycast(p127.Position, Vector3.new(0, p131 or -100, 0), p130 or v132)
	local v_u_134
	if v133 then
		v_u_134 = v_u_6.Shockwave:Clone()
		v_u_134.Parent = v_u_7 or workspace
		v_u_134.CanCollide = false
		local v135 = CFrame.new(v133.Position, v133.Position + v133.Normal)
		local v136 = CFrame.Angles
		local v137 = v_u_10:NextNumber(-360, 360)
		v_u_134.CFrame = v135 * v136(-1.5707963267948966, math.rad(v137), 0)
		local v138 = v_u_1:Create(v_u_134, TweenInfo.new(p129 or 0.5), {
			["Size"] = p128,
			["CFrame"] = v_u_134.CFrame * CFrame.new(0, p128.Y / 2, 0),
			["Transparency"] = 1
		})
		v138:Play()
		v138.Completed:Connect(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_134
			v_u_2:AddItem(v_u_134, 0)
		end)
	else
		v_u_134 = nil
	end
	return v_u_134
end
function v_u_8.FloorImageCrack(_, p139, p140, p141, p142, p143)
	-- upvalues: (copy) v_u_7, (copy) v_u_1, (copy) v_u_2
	local v_u_144 = Instance.new("Part")
	v_u_144.Parent = v_u_7 or workspace
	v_u_144.CanCollide = false
	v_u_144.CanTouch = false
	v_u_144.CastShadow = false
	v_u_144.CanQuery = false
	local v145 = CFrame.new(p139.Position, p139.Position + p139.Normal)
	local v146 = CFrame.Angles
	local v147 = math.random(-180, 180)
	v_u_144.CFrame = v145 * v146(-1.5707963267948966, math.rad(v147), 0)
	v_u_144.Size = Vector3.new(p140 or 10, 0.1, p140 or 10)
	v_u_144.Anchored = true
	v_u_144.Transparency = 1
	local v_u_148 = Instance.new("Decal")
	v_u_148.Parent = v_u_144
	v_u_148.Texture = p143 or "rbxassetid://8260787883"
	v_u_148.Face = "Top"
	v_u_148.Color3 = p142 or p139.Instance.Color
	task.delay(p141 or 1, function()
		-- upvalues: (ref) v_u_1, (copy) v_u_148, (ref) v_u_2, (copy) v_u_144
		local v149 = v_u_1:Create(v_u_148, TweenInfo.new(0.5), {
			["Transparency"] = 1
		})
		v149:Play()
		v149.Completed:Connect(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_144
			v_u_2:AddItem(v_u_144, 0.1)
		end)
	end)
	return v_u_144
end
function v_u_8.TimeScaleParticle(_, p150, p151)
	p150.Drag = p150.Drag * p151
	p150.Speed = NumberRange.new(p150.Speed.Min * p151, p150.Speed.Max * p151)
	p150.Lifetime = NumberRange.new(p150.Lifetime.Min / p151, p150.Lifetime.Max / p151)
	p150.Rate = p150.Rate * p151
	p150.RotSpeed = NumberRange.new(p150.RotSpeed.Min * p151, p150.RotSpeed.Max * p151)
	p150.Acceleration = p150.Acceleration * p151 ^ 2
	if p150:GetAttribute("EmitDelay") then
		p150:SetAttribute("EmitDelay", p150:GetAttribute("EmitDelay") / p151)
	end
end
function v_u_8.ScaleParticle(_, p152, p153)
	local v154 = p152.Size.Keypoints
	local v155 = {}
	for v156, v157 in pairs(v154) do
		v155[v156] = NumberSequenceKeypoint.new(v157.Time, v157.Value * p153, v157.Envelope * p153)
	end
	p152.Size = NumberSequence.new(v155)
	p152.Drag = p152.Drag * p153
	p152.Speed = NumberRange.new(p152.Speed.Min * p153, p152.Speed.Max * p153)
	p152.Lifetime = NumberRange.new(p152.Lifetime.Min * p153, p152.Lifetime.Max * p153)
	p152.Rate = p152.Rate * p153
	p152.RotSpeed = NumberRange.new(p152.RotSpeed.Min * p153, p152.RotSpeed.Max * p153)
	p152.Acceleration = p152.Acceleration * p153
end
function v_u_8.ScaleBeams(_, p158, p159, p160, p161)
	for _, v162 in ipairs(p160) do
		v162.TextureLength = v162.TextureLength * p161
		v162.ZOffset = v162.ZOffset * p161
		v162.CurveSize0 = v162.CurveSize0 * p161
		v162.CurveSize1 = v162.CurveSize1 * p161
		v162.Width0 = v162.Width0 * p161
		v162.Width1 = v162.Width1 * p161
	end
	p158.Position = p158.Position * p161
	p159.Position = p159.Position * p161
end
function v_u_8.HeartbeatLoopFor(_, p_u_163, p_u_164, p_u_165)
	-- upvalues: (copy) v_u_3
	local v_u_166 = v_u_3:IsRunning() and time or os.clock
	local v_u_167 = nil
	local v_u_168 = v_u_166()
	local v_u_169 = false
	v_u_167 = v_u_3.Heartbeat:Connect(function(p170)
		-- upvalues: (copy) v_u_166, (copy) v_u_168, (copy) p_u_163, (copy) p_u_164, (ref) v_u_169, (copy) p_u_165, (ref) v_u_167
		local v171 = v_u_166() - v_u_168
		if v171 < p_u_163 then
			p_u_164(v171, p170, v171 / p_u_163)
		elseif v_u_169 == true or p_u_165 == nil then
			if v_u_167 ~= nil then
				v_u_167:Disconnect()
				v_u_167 = nil
				return
			end
		else
			v_u_169 = true
			p_u_165()
			if v_u_167 ~= nil then
				v_u_167:Disconnect()
				v_u_167 = nil
			end
		end
	end)
	return v_u_167
end
function v_u_8.RenderStepLoopFor(_, p_u_172, p_u_173, p174, p_u_175)
	-- upvalues: (copy) v_u_3
	local v_u_176 = v_u_3:IsRunning() and time or os.clock
	local v_u_177 = v_u_176()
	local v_u_178 = false
	local v179 = math.random
	local v_u_180 = "RenderStepLoop_" .. tostring(v179(1000000000))
	v_u_3:BindToRenderStep(v_u_180, p174, function(p181)
		-- upvalues: (copy) v_u_176, (copy) v_u_177, (copy) p_u_172, (copy) p_u_173, (ref) v_u_178, (copy) p_u_175, (ref) v_u_3, (copy) v_u_180
		local v182 = v_u_176() - v_u_177
		if v182 < p_u_172 then
			p_u_173(v182, p181, v182 / p_u_172)
		else
			if not v_u_178 and p_u_175 then
				v_u_178 = true
				p_u_175()
			end
			v_u_3:UnbindFromRenderStep(v_u_180)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_3, (copy) v_u_180
		v_u_3:UnbindFromRenderStep(v_u_180)
	end
end
function v_u_8.randPointInHorizDisc(_, p183, p184)
	-- upvalues: (copy) v_u_10
	local v185 = v_u_10:NextNumber(0, 6.283185307179586)
	local v186 = v_u_10:NextNumber(p183, p184)
	local v187 = math.cos(v185) * v186
	local v188 = math.sin(v185) * v186
	return Vector3.new(v187, 0, v188)
end
function v_u_8.InvertedSpringQuadraticParticles(_, p189, p190, p191)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_3, (copy) v_u_2
	local v_u_192 = {
		["amount"] = p191 or 40,
		["speed"] = 60,
		["speedMinMultiplier"] = 0.5,
		["speedMaxMultiplier"] = 1.5,
		["gravity"] = -125,
		["gravityMinMultiplier"] = 0.5,
		["gravityMaXMultiplier"] = 1.5,
		["lifetime"] = 0.8,
		["lifetimeMinMultiplier"] = 1,
		["lifetimeMaxMultiplier"] = 2,
		["randomXZrotation"] = 40,
		["randomYrotation"] = 180,
		["parts"] = {}
	}
	for _ = 1, p191 do
		local v193 = p189:Clone()
		v193.Parent = v_u_7 or workspace
		v193.Position = p190
		local v194 = v193.CFrame
		local v195 = CFrame.Angles
		local v196 = v_u_10
		local v197 = v_u_192.randomXZrotation
		local v198 = -math.rad(v197)
		local v199 = v_u_192.randomXZrotation
		local v200 = v196:NextNumber(v198, math.rad(v199) / 3)
		local v201 = v_u_10
		local v202 = v_u_192.randomYrotation
		local v203 = -math.rad(v202)
		local v204 = v_u_192.randomYrotation
		local v205 = v201:NextNumber(v203, (math.rad(v204)))
		local v206 = v_u_10
		local v207 = v_u_192.randomXZrotation
		local v208 = -math.rad(v207)
		local v209 = v_u_192.randomXZrotation
		v193.CFrame = v194 * v195(v200, v205, v206:NextNumber(v208, math.rad(v209) / 3))
		local v210 = v_u_192.parts
		local v211 = {
			["instance"] = v193,
			["cframe"] = v193.CFrame,
			["speed"] = v_u_192.speed * v_u_10:NextNumber(v_u_192.speedMinMultiplier, v_u_192.speedMaxMultiplier),
			["gravity"] = v_u_192.gravity * v_u_10:NextNumber(v_u_192.gravityMinMultiplier, v_u_192.gravityMaXMultiplier),
			["lifetime"] = v_u_192.lifetime * v_u_10:NextNumber(v_u_192.lifetimeMinMultiplier, v_u_192.lifetimeMaxMultiplier),
			["springMultiplier"] = math.random(1, v_u_192.speedMaxMultiplier)
		}
		table.insert(v210, v211)
	end
	local v_u_212 = 0
	local v226 = v_u_3.Heartbeat:Connect(function(p213)
		-- upvalues: (ref) v_u_212, (copy) v_u_192, (ref) v_u_2
		v_u_212 = v_u_212 + p213
		for _, v214 in pairs(v_u_192.parts) do
			if v_u_212 <= v214.lifetime then
				local v215 = v214.cframe.Position
				local v216 = v214.cframe.RightVector * v214.speed
				local v217 = -v214.gravity
				local v218 = Vector3.new(0, v217, 0)
				local v219 = v_u_212
				local v220 = v215 + v216 * v219 + v218 * v219 ^ 2 / 2
				v214.instance.Position = v220
				local v221 = v_u_212
				local v222 = -0.1 * v221
				local v223 = math.exp(v222)
				local v224 = 20 * v221
				local v225 = v223 * math.sin(v224)
				v214.speed = v214.speed + v225 * v214.springMultiplier
			else
				v_u_2:AddItem(v214.instance, 0.5)
			end
		end
	end)
	task.wait(v_u_192.lifetime * v_u_192.lifetimeMaxMultiplier + 0.1)
	v226:Disconnect()
	return v_u_192
end
function v_u_8.ResizeParticles(_, p227, p228)
	local v229 = Instance.new("Model")
	local v230 = p227.Parent
	p227.Parent = v229
	v229:ScaleTo(p228)
	p227.Parent = v230
	v229:Destroy()
end
function v_u_8.fadeLight(_, p231, p232)
	-- upvalues: (copy) v_u_1
	v_u_1:Create(p231, TweenInfo.new(p232), {
		["Brightness"] = 0
	}):Play()
end
function v_u_8.fadeAllLights(_, p233, p234)
	-- upvalues: (copy) v_u_8
	for _, v235 in ipairs(p233:GetDescendants()) do
		if v235:IsA("Light") then
			v_u_8:fadeLight(v235, p234)
		end
	end
end
function v_u_8.FadeAllBeamsTransparency(_, p236, p237)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	for _, v_u_238 in p236:GetDescendants() do
		if v_u_238:IsA("Beam") then
			v_u_238.Transparency = NumberSequence.new(0.6)
			v_u_238.Enabled = true
			local v_u_239 = p237 or 1
			v_u_1:Create(v_u_238, TweenInfo.new(v_u_239, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["TextureSpeed"] = 0.1
			}):Play()
			local v_u_240 = 0
			local v_u_241 = nil
			v_u_241 = v_u_3.Heartbeat:Connect(function(p242)
				-- upvalues: (ref) v_u_240, (copy) v_u_239, (copy) v_u_238, (ref) v_u_241
				v_u_240 = v_u_240 + p242
				local v243 = v_u_240 / v_u_239
				local v244 = math.min(v243, 1)
				v_u_238.Transparency = NumberSequence.new(v244 * 1)
				if v_u_239 <= v_u_240 then
					v_u_238.Transparency = NumberSequence.new(1)
					v_u_241:Disconnect()
				end
			end)
		end
	end
end
function v_u_8.OpenBeams(_, p245, p_u_246, p_u_247)
	-- upvalues: (copy) v_u_1
	for _, v_u_248 in ipairs(p245:GetDescendants()) do
		if v_u_248:IsA("Beam") then
			task.spawn(function()
				-- upvalues: (ref) v_u_1, (copy) v_u_248, (copy) p_u_246, (copy) p_u_247
				v_u_1:Create(v_u_248, TweenInfo.new(p_u_246, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					["Width0"] = v_u_248.Width0 * p_u_247,
					["Width1"] = v_u_248.Width1 * p_u_247
				}):Play()
				v_u_248.Width0 = 0
				v_u_248.Width1 = 0
				v_u_248.Enabled = true
			end)
		end
	end
end
function v_u_8.CloseBeams(_, p249, p_u_250)
	-- upvalues: (copy) v_u_1
	for _, v_u_251 in ipairs(p249:GetDescendants()) do
		if v_u_251:IsA("Beam") then
			task.spawn(function()
				-- upvalues: (ref) v_u_1, (copy) v_u_251, (copy) p_u_250
				v_u_1:Create(v_u_251, TweenInfo.new(p_u_250, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					["Width0"] = 0,
					["Width1"] = 0
				}):Play()
			end)
		end
	end
end
function v_u_8.playSlash(_, p_u_252, p_u_253, p_u_254, p_u_255)
	-- upvalues: (copy) v_u_8
	task.spawn(function()
		-- upvalues: (copy) p_u_252, (copy) p_u_254, (ref) v_u_8, (copy) p_u_253, (copy) p_u_255
		local v_u_256 = p_u_252.CFrame
		local v257 = p_u_254 or 125
		local v_u_258 = math.rad(v257)
		v_u_8:RenderStepLoopFor(p_u_253, function(_, _, p259)
			-- upvalues: (ref) p_u_252, (copy) v_u_256, (copy) v_u_258
			p_u_252.CFrame = v_u_256 * CFrame.Angles(0, v_u_258 * p259, 0)
		end, Enum.RenderPriority.Last.Value, function() end)
		v_u_8:OpenBeams(p_u_252, 0.1, 1)
		task.wait(p_u_255 or 0.1)
		v_u_8:CloseBeams(p_u_252, 0.2)
	end)
end
function v_u_8.GetRandomNormalCone(_, p260, p261)
	-- upvalues: (copy) v_u_11, (copy) v_u_10
	local v262 = p260:Cross(p260:Cross(v_u_11).Magnitude > 0.01 and v_u_11 or Vector3.new(1, 0, 0)).Unit
	local v263 = v_u_10:NextNumber(0, p261)
	local v264 = math.rad(v263)
	local v265 = CFrame.fromAxisAngle(v262, v264):VectorToWorldSpace(p260)
	local v266 = v_u_10:NextNumber(0, 360)
	local v267 = math.rad(v266)
	return CFrame.fromAxisAngle(p260, v267):VectorToWorldSpace(v265)
end
function v_u_8.GetReflectedDirection(_, p268, p269, p270)
	-- upvalues: (copy) v_u_8
	return v_u_8:GetRandomNormalCone((p268 - 2 * p268:Dot(p269) * p269).Unit, p270)
end
function v_u_8.CastToMouseCFrame(_, p271, p272, p273, p274)
	-- upvalues: (copy) v_u_9
	local v275 = v_u_9:ScreenPointToRay(p274.X, p274.Y)
	local v276 = workspace:Raycast(v275.Origin, v275.Direction * (p271 or 1000), p272)
	if v276 then
		local v277 = CFrame.new(v276.Position, v276.Position + v276.Normal)
		if p273 then
			return v277 * CFrame.Angles(-1.5707963267948966, 0, 0)
		else
			return v277
		end
	else
		print("Raycast failed")
		return p274.Hit
	end
end
function v_u_8.lockAndLookAtMouse(_, p_u_278, p_u_279, p_u_280)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_281 = Instance.new("Attachment", p_u_278)
	local v_u_282 = Instance.new("VectorForce")
	local v283 = workspace.Gravity * p_u_278.AssemblyMass
	v_u_282.Force = Vector3.new(0, v283, 0)
	v_u_282.ApplyAtCenterOfMass = true
	v_u_282.Attachment0 = v_u_281
	v_u_282.RelativeTo = Enum.ActuatorRelativeTo.World
	v_u_282.Parent = p_u_278
	local v_u_284 = Instance.new("AlignOrientation")
	v_u_284.Mode = Enum.OrientationAlignmentMode.OneAttachment
	v_u_284.RigidityEnabled = true
	v_u_284.MaxTorque = (1 / 0)
	v_u_284.Responsiveness = 200
	v_u_284.Attachment0 = v_u_281
	v_u_284.Parent = p_u_278
	local v_u_285 = Instance.new("AlignPosition")
	v_u_285.Mode = Enum.PositionAlignmentMode.OneAttachment
	v_u_285.MaxForce = (1 / 0)
	v_u_285.Responsiveness = 200
	v_u_285.RigidityEnabled = true
	v_u_285.Attachment0 = v_u_281
	v_u_285.Position = p_u_278.Position
	v_u_285.Parent = p_u_278
	local v_u_286 = tick()
	local v_u_287 = nil
	v_u_287 = v_u_3.RenderStepped:Connect(function()
		-- upvalues: (copy) p_u_278, (ref) v_u_287, (copy) p_u_279, (copy) v_u_284, (copy) v_u_286, (copy) p_u_280
		if p_u_278 and p_u_278.Parent then
			local v288 = (p_u_279.Hit.Position - p_u_278.Position).Unit
			v_u_284.CFrame = CFrame.lookAt(p_u_278.Position, p_u_278.Position + v288)
			if p_u_280 <= tick() - v_u_286 then
				v_u_287:Disconnect()
			end
		else
			v_u_287:Disconnect()
		end
	end)
	task.delay(p_u_280, function()
		-- upvalues: (ref) v_u_2, (copy) v_u_281, (copy) v_u_282, (copy) v_u_284, (copy) v_u_285
		v_u_2:AddItem(v_u_281, 0)
		v_u_2:AddItem(v_u_282, 0)
		v_u_2:AddItem(v_u_284, 0)
		v_u_2:AddItem(v_u_285, 0)
	end)
end
function v_u_8.ColorFrame(_, p289, p_u_290, p291, p292, p293, p294)
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_1
	local v295 = p292 or v_u_9.CFrame.Position
	if (p293 or 99999) >= (v_u_9.CFrame.Position - v295).Magnitude then
		local v_u_296 = Instance.new("ColorCorrectionEffect")
		v_u_296.TintColor = Color3.new(1, 1, 1)
		v_u_296.Parent = v_u_4
		v_u_1:Create(v_u_296, TweenInfo.new(p289), {
			["TintColor"] = p291
		}):Play()
		if not p294 then
			task.delay(p289, function()
				-- upvalues: (copy) v_u_296, (ref) v_u_1, (copy) p_u_290
				if v_u_296 then
					v_u_1:Create(v_u_296, TweenInfo.new(p_u_290), {
						["TintColor"] = Color3.new(1, 1, 1)
					}):Play()
					task.wait(p_u_290 + 0.05)
					if v_u_296 then
						v_u_296:Destroy()
					end
				end
			end)
		end
		return v_u_296
	end
end
function v_u_8.ImpactFrame(_, p_u_297, p_u_298, p_u_299, p_u_300, p301, p302)
	-- upvalues: (copy) v_u_9, (copy) v_u_4
	if p302 >= (v_u_9.CFrame.Position - p301).Magnitude then
		task.defer(function()
			-- upvalues: (copy) p_u_299, (copy) p_u_300, (ref) v_u_4, (copy) p_u_298, (copy) p_u_297
			local v303 = {}
			for _, v304 in p_u_299 do
				local v305 = Instance.new("Highlight")
				v305.Name = "ImpactHighlight"
				v305.FillColor = p_u_300
				v305.OutlineTransparency = 1
				v305.Parent = v304
				table.insert(v303, v305)
			end
			local v306 = v_u_4:FindFirstChild("Impact")
			if not v306 then
				v306 = Instance.new("ColorCorrectionEffect")
				v306.Brightness = 0
				v306.Contrast = 0
				v306.Saturation = 0
				v306.Enabled = true
				v306.TintColor = Color3.fromRGB(255, 255, 255)
				v306.Name = "Impact"
				v306.Parent = v_u_4
			end
			local v307 = v306:Clone()
			v307.Parent = game:GetService("Lighting")
			v307.Brightness = -1
			v307.Contrast = -100
			v307.Saturation = -1
			for _ = 1, p_u_298 do
				v307.Contrast = -100
				task.wait(p_u_297)
				v307.Contrast = 100
				task.wait(p_u_297)
			end
			v307.Brightness = 0
			v307.Contrast = 0
			v307.Saturation = 0
			v307:Destroy()
			for _, v308 in ipairs(v303) do
				if v308.Parent ~= nil then
					v308:Destroy()
				end
			end
			table.clear(v303)
		end)
	end
end
function v_u_8.Shake(_, p_u_309, p_u_310, p311, p312, p313, p314, p315, p316)
	-- upvalues: (copy) v_u_10, (copy) v_u_3
	local v_u_317 = p_u_309.CFrame
	local v_u_318 = tick()
	local v_u_319 = nil
	local v_u_320 = p311 or 0.1
	local v_u_321 = p312 or 10
	local v_u_322 = p313 ~= false
	local v_u_323 = p314 or Vector3.new(1, 1, 1)
	local v_u_324 = p315 or false
	local v_u_325 = p316 or 0.05
	local v_u_326 = v_u_10:NextNumber(0, 1000000)
	local v_u_351 = v_u_3.Heartbeat:Connect(function(p327)
		-- upvalues: (copy) p_u_309, (ref) v_u_319, (copy) v_u_318, (copy) p_u_310, (copy) v_u_317, (ref) v_u_320, (ref) v_u_322, (ref) v_u_326, (ref) v_u_323, (ref) v_u_324, (ref) v_u_325, (ref) v_u_321
		if p_u_309 and p_u_309.Parent then
			local v328 = tick() - v_u_318
			if p_u_310 <= v328 then
				p_u_309.CFrame = v_u_317
				if v_u_319 then
					v_u_319:Disconnect()
				end
			else
				local v329 = v_u_320
				if v_u_322 then
					v329 = v_u_320 * (1 - v328 / p_u_310)
				end
				local v330 = v_u_326
				local v331 = v_u_326 * 1.3
				local v332 = v_u_326 * 0.8
				local v333 = math.noise(v330, 0, 0)
				local v334 = math.clamp(v333, -1, 1) * v329 or 0
				local v335 = math.noise(0, v331, 0)
				local v336 = math.clamp(v335, -1, 1) * v329 or 0
				local v337 = math.noise(0, 0, v332)
				local v338 = math.clamp(v337, -1, 1) * v329 or 0
				local v339 = Vector3.new(v334, v336, v338) * v_u_323
				local v340 = v_u_317.Position + v339
				local v341 = CFrame.identity
				if v_u_324 then
					local v342 = v_u_326 * 0.7
					local v343 = v_u_326 * 0.9
					local v344 = v_u_326 * 0.5
					local v345 = math.noise(v342, 0, 0)
					local v346 = math.clamp(v345, -1, 1) * v_u_325 * v329 * v_u_323.X
					local v347 = math.noise(0, v343, 0)
					local v348 = math.clamp(v347, -1, 1) * v_u_325 * v329 * v_u_323.Y
					local v349 = math.noise(0, 0, v344)
					local v350 = math.clamp(v349, -1, 1) * v_u_325 * v329 * v_u_323.Z
					v341 = CFrame.Angles(v346, v348, v350)
				end
				p_u_309.CFrame = CFrame.new(v340) * v_u_317.Rotation * v341
				v_u_326 = v_u_326 + p327 * v_u_321
			end
		else
			if v_u_319 then
				v_u_319:Disconnect()
			end
			return
		end
	end)
	return function(p352)
		-- upvalues: (ref) v_u_351, (copy) p_u_309, (copy) v_u_317
		if v_u_351 then
			v_u_351:Disconnect()
		end
		if p_u_309 and (p_u_309.Parent and p352) then
			p_u_309.CFrame = v_u_317
		end
	end
end
return v_u_8