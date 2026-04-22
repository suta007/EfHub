local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Modules.Task)
local v_u_5 = require(v3.Modules.Task.ThrottledTaskQueue).new(3, 0.1)
local v_u_6 = {}
v_u_6.__index = v_u_6
local v_u_7 = {
	["MinMembers"] = 1,
	["MaxMembers"] = 3,
	["SpawnRadius"] = 100,
	["MoveSpeed"] = 15,
	["FlockHeight"] = 200,
	["DespawnTime"] = 120,
	["HeightVariationRange"] = 75,
	["HeightOscillationSpeed"] = 0.3,
	["HeightOscillationAmount"] = 3,
	["CohesionWeight"] = 0.2,
	["SeparationWeight"] = 0.4,
	["AlignmentWeight"] = 0.3,
	["WanderWeight"] = 0.15,
	["MinDistance"] = 35,
	["NeighborRadius"] = 120,
	["MaxForce"] = 0.05,
	["MaxTurnRate"] = 0.012,
	["VelocityDamping"] = 0.98,
	["WanderChangeInterval"] = 8,
	["WanderStrength"] = 5,
	["WanderSmoothness"] = 0.08,
	["SpawnAreaSize"] = 500,
	["SpawnSettings"] = {
		["Mode"] = "Random",
		["EdgeMargin"] = 50,
		["DirectionVariation"] = 0.5235987755982988
	},
	["FadeSettings"] = {
		["Enabled"] = false,
		["FadeInDuration"] = 2,
		["FadeOutDuration"] = 2,
		["FadeOutBeforeDespawn"] = 5
	},
	["LeaderScale"] = 1.2,
	["LeaderHeightReduction"] = 0.3,
	["LODEnabled"] = true,
	["LODThresholds"] = {
		{
			["Distance"] = 200,
			["UpdateInterval"] = 0
		},
		{
			["Distance"] = 400,
			["UpdateInterval"] = 0.1
		},
		{
			["Distance"] = 600,
			["UpdateInterval"] = 0.2
		},
		{
			["Distance"] = (1 / 0),
			["UpdateInterval"] = 0.5
		}
	},
	["OnMemberSpawned"] = nil,
	["OnMemberUpdate"] = nil,
	["OnFlockSpawned"] = nil,
	["OnFadeOutComplete"] = nil,
	["OnDestroyed"] = nil
}
local function v_u_11(p8)
	local v9 = {}
	for _, v10 in p8:GetDescendants() do
		if v10:IsA("BasePart") or (v10:IsA("Decal") or v10:IsA("Texture")) then
			table.insert(v9, v10)
		elseif v10:IsA("ParticleEmitter") or (v10:IsA("Beam") or v10:IsA("Trail")) then
			table.insert(v9, v10)
		end
	end
	return v9
end
local function v_u_14(p12)
	-- upvalues: (copy) v_u_11
	p12.OriginalTransparencies = {}
	for _, v13 in v_u_11(p12.Model) do
		if v13:IsA("BasePart") then
			p12.OriginalTransparencies[v13] = v13.Transparency
		elseif v13:IsA("Decal") or v13:IsA("Texture") then
			p12.OriginalTransparencies[v13] = v13.Transparency
		elseif v13:IsA("ParticleEmitter") then
			p12.OriginalTransparencies[v13] = v13.Transparency
		elseif v13:IsA("Beam") or v13:IsA("Trail") then
			p12.OriginalTransparencies[v13] = v13.Transparency
		end
	end
end
local function v_u_19(p15, p16)
	if p15.OriginalTransparencies then
		for v17, v18 in p15.OriginalTransparencies do
			if v17:IsA("BasePart") then
				v17.Transparency = v18 + (1 - v18) * p16
			elseif v17:IsA("Decal") or v17:IsA("Texture") then
				v17.Transparency = v18 + (1 - v18) * p16
			elseif v17:IsA("ParticleEmitter") then
				v17.Transparency = NumberSequence.new(p16)
			elseif v17:IsA("Beam") or v17:IsA("Trail") then
				v17.Transparency = NumberSequence.new(p16)
			end
		end
	end
end
local function v_u_26(p20, p21)
	-- upvalues: (copy) v_u_14, (copy) v_u_19, (copy) v_u_2
	if not p20.OriginalTransparencies then
		v_u_14(p20)
	end
	v_u_19(p20, 1)
	p20.FadeTweens = {}
	for v22, v23 in p20.OriginalTransparencies do
		local v24 = nil
		if v22:IsA("BasePart") then
			v24 = v_u_2:Create(v22, TweenInfo.new(p21, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Transparency"] = v23
			})
		elseif v22:IsA("Decal") or v22:IsA("Texture") then
			v24 = v_u_2:Create(v22, TweenInfo.new(p21, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Transparency"] = v23
			})
		elseif v22:IsA("ParticleEmitter") or (v22:IsA("Beam") or v22:IsA("Trail")) then
			v24 = v_u_2:Create(v22, TweenInfo.new(p21, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Transparency"] = NumberSequence.new(v23)
			})
		end
		if v24 then
			local v25 = p20.FadeTweens
			table.insert(v25, v24)
			v24:Play()
		end
	end
end
local function v_u_33(p27, p28)
	-- upvalues: (copy) v_u_14, (copy) v_u_2
	if not p27.OriginalTransparencies then
		v_u_14(p27)
	end
	if p27.FadeTweens then
		for _, v29 in p27.FadeTweens do
			v29:Cancel()
		end
	end
	p27.FadeTweens = {}
	for _, v30 in p27.Model:GetDescendants() do
		local v31 = nil
		if v30:IsA("BasePart") then
			v31 = v_u_2:Create(v30, TweenInfo.new(p28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Transparency"] = 1
			})
		elseif v30:IsA("Decal") or v30:IsA("Texture") then
			v31 = v_u_2:Create(v30, TweenInfo.new(p28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Transparency"] = 1
			})
		elseif v30:IsA("ParticleEmitter") or (v30:IsA("Beam") or v30:IsA("Trail")) then
			v31 = v_u_2:Create(v30, TweenInfo.new(p28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["Transparency"] = NumberSequence.new(1)
			})
		end
		if v31 then
			local v32 = p27.FadeTweens
			table.insert(v32, v31)
			v31:Play()
		end
	end
end
local function v_u_43(p34, p35, p36)
	local v37 = ((p36 or Random.new()):NextNumber() - 0.5) * 2 * p35
	local v38 = math.cos(v37)
	local v39 = math.sin(v37)
	local v40 = p34.X * v38 - p34.Z * v39
	local v41 = p34.Y
	local v42 = p34.X * v39 + p34.Z * v38
	return Vector3.new(v40, v41, v42).Unit
end
local function v_u_85(p44, p45)
	-- upvalues: (copy) v_u_7, (copy) v_u_43
	local v46 = p44.SpawnSettings or v_u_7.SpawnSettings
	local v47 = v46.Mode or "Random"
	local v48 = p44.SpawnAreaSize
	local v49 = v46.EdgeMargin or 50
	local v50 = p44.FlockHeight
	if v47 == "Custom" then
		return v46.CustomPosition or Vector3.new(0, v50, 0), v_u_43(v46.CustomDirection or Vector3.new(1, 0, 0), v46.DirectionVariation or 0, p45)
	end
	if v47 == "EdgeToCenter" then
		local v51 = p45:NextInteger(1, 4)
		local v52, v53
		if v51 == 1 then
			local v54 = p45:NextNumber(-v48 + v49, v48 - v49)
			local v55 = v48 - v49
			v52 = Vector3.new(v54, v50, v55)
			v53 = Vector3.new(0, 0, -1)
		elseif v51 == 2 then
			local v56 = v48 - v49
			local v57 = -v48 + v49
			local v58 = v48 - v49
			v52 = Vector3.new(v56, v50, p45:NextNumber(v57, v58))
			v53 = Vector3.new(-1, 0, 0)
		elseif v51 == 3 then
			local v59 = p45:NextNumber(-v48 + v49, v48 - v49)
			local v60 = -v48 + v49
			v52 = Vector3.new(v59, v50, v60)
			v53 = Vector3.new(0, 0, 1)
		else
			local v61 = -v48 + v49
			local v62 = -v48 + v49
			local v63 = v48 - v49
			v52 = Vector3.new(v61, v50, p45:NextNumber(v62, v63))
			v53 = Vector3.new(1, 0, 0)
		end
		return v52, v_u_43(v53, v46.DirectionVariation or 0)
	end
	if v47 == "EdgeToEdge" then
		local v64 = p45:NextInteger(1, 4)
		local v65, v66
		if v64 == 1 then
			local v67 = p45:NextNumber(-v48 + v49, v48 - v49)
			local v68 = v48 - v49
			v65 = Vector3.new(v67, v50, v68)
			local v69 = (p45:NextNumber() - 0.5) * 0.5
			v66 = Vector3.new(v69, 0, -1).Unit
		elseif v64 == 2 then
			local v70 = v48 - v49
			local v71 = -v48 + v49
			local v72 = v48 - v49
			v65 = Vector3.new(v70, v50, p45:NextNumber(v71, v72))
			local v73 = (p45:NextNumber() - 0.5) * 0.5
			v66 = Vector3.new(-1, 0, v73).Unit
		elseif v64 == 3 then
			local v74 = p45:NextNumber(-v48 + v49, v48 - v49)
			local v75 = -v48 + v49
			v65 = Vector3.new(v74, v50, v75)
			local v76 = (p45:NextNumber() - 0.5) * 0.5
			v66 = Vector3.new(v76, 0, 1).Unit
		else
			local v77 = -v48 + v49
			local v78 = -v48 + v49
			local v79 = v48 - v49
			v65 = Vector3.new(v77, v50, p45:NextNumber(v78, v79))
			local v80 = (p45:NextNumber() - 0.5) * 0.5
			v66 = Vector3.new(1, 0, v80).Unit
		end
		return v65, v_u_43(v66, v46.DirectionVariation or 0)
	end
	local v81 = p45:NextNumber(-v48, v48)
	local v82 = -v48
	local v83 = Vector3.new(v81, v50, p45:NextNumber(v82, v48))
	local v84 = p45:NextNumber(-100, 100)
	return v83, v_u_43(Vector3.new(v84, 0, p45:NextNumber(-100, 100)).Unit, v46.DirectionVariation or 0)
end
local function v_u_90(p86, p87)
	if not p87.LODEnabled then
		return 0
	end
	local v88 = p87.LODThresholds
	if not v88 or #v88 == 0 then
		return 0
	end
	for _, v89 in ipairs(v88) do
		if p86 <= v89.Distance then
			return v89.UpdateInterval
		end
	end
	return v88[#v88].UpdateInterval
end
local function v_u_102(p91, p92, p93)
	local v94 = Vector3.new(0, 0, 0)
	local v95 = 0
	for _, v96 in p92 do
		if v96 ~= p91 and v96.Model.Parent then
			local v97 = (p91.Position - v96.Position).Magnitude
			if v97 < p93.MinDistance and v97 > 0.1 then
				v94 = v94 + (p91.Position - v96.Position).Unit * ((p93.MinDistance - v97) / p93.MinDistance)
				v95 = v95 + 1
			end
		end
	end
	if v95 > 0 then
		local v98 = v94 / v95
		local v99 = p93.MaxForce * 0.5
		if v99 < v98.Magnitude then
			v98 = v98.Unit * v99
		end
		if v98.Magnitude > 0 then
			local v100 = v98.Unit * p93.MoveSpeed * 0.5 - p91.Velocity
			local v101 = p93.MaxForce * 0.3
			if v101 < v100.Magnitude then
				v100 = v100.Unit * v101
			end
			return v100 * p93.SeparationWeight
		end
	end
	return Vector3.new(0, 0, 0)
end
local function v_u_113(p103, p104, p105)
	local v106 = Vector3.new(0, 0, 0)
	local v107 = 0
	for _, v108 in p104 do
		if v108 ~= p103 and v108.Model.Parent then
			local v109 = (p103.Position - v108.Position).Magnitude
			if v109 < p105.NeighborRadius and p105.MinDistance < v109 then
				v106 = v106 + v108.Position
				v107 = v107 + 1
			end
		end
	end
	if v107 > 0 then
		local v110 = v106 / v107 - p103.Position
		if v110.Magnitude > 0 then
			local v111 = v110.Unit * p105.MoveSpeed * 0.3 - p103.Velocity
			local v112 = p105.MaxForce * 0.5
			if v112 < v111.Magnitude then
				v111 = v111.Unit * v112
			end
			return v111 * p105.CohesionWeight
		end
	end
	return Vector3.new(0, 0, 0)
end
local function v_u_123(p114, p115, p116)
	local v117 = Vector3.new(0, 0, 0)
	local v118 = 0
	for _, v119 in p115 do
		if v119 ~= p114 and (v119.Model.Parent and (p114.Position - v119.Position).Magnitude < p116.NeighborRadius) then
			v117 = v117 + v119.Velocity
			v118 = v118 + 1
		end
	end
	if v118 > 0 then
		local v120 = v117 / v118
		if v120.Magnitude > 0 then
			local v121 = v120.Unit * p116.MoveSpeed * 0.6 - p114.Velocity
			local v122 = p116.MaxForce * 0.6
			if v122 < v121.Magnitude then
				v121 = v121.Unit * v122
			end
			return v121 * p116.AlignmentWeight
		end
	end
	return Vector3.new(0, 0, 0)
end
local function v_u_135(p124, p125, p126)
	if tick() - p124.LastWanderChange > p125.WanderChangeInterval then
		local v127 = p126:NextNumber(-20, 20)
		local v128 = p126:NextNumber(-3, 3)
		local v129 = Vector3.new(v127, v128, p126:NextNumber(-20, 20))
		local v130 = (p124.WanderDirection + v129).Unit * p125.WanderStrength
		local v131 = p124.WanderDirection
		local v132 = p125.WanderSmoothness
		p124.WanderDirection = v131 + (v130 - v131) * v132
		p124.LastWanderChange = tick()
	end
	local v133 = p124.WanderDirection - p124.Velocity
	local v134 = p125.MaxForce * 0.4
	if v134 < v133.Magnitude then
		v133 = v133.Unit * v134
	end
	return v133 * p125.WanderWeight
end
local function v_u_165(p136, p137, p138, p139, p140, p141)
	-- upvalues: (copy) v_u_90, (copy) v_u_102, (copy) v_u_113, (copy) v_u_123, (copy) v_u_135
	if p136.Model.Parent then
		local v142 = workspace.CurrentCamera
		local v143 = v142 and v142.CFrame.Position or Vector3.new(0, 0, 0)
		local v144 = v_u_90((p136.Position - v143).Magnitude, p138)
		local v145 = v144 == 0 and true or v144 <= p141 - p136.LastLODUpdate
		local v146 = v_u_102(p136, p137, p138)
		local v147 = v_u_113(p136, p137, p138)
		local v148 = v_u_123(p136, p137, p138)
		local v149 = v_u_135(p136, p138, p140)
		local v150 = v146 + v147 + v148 + v149
		local v151 = p138.MaxForce
		if v151 < v150.Magnitude then
			v150 = v150.Unit * v151
		end
		p136.Velocity = p136.Velocity + v150
		p136.Velocity = p136.Velocity * p138.VelocityDamping
		if p136.Velocity.Magnitude > p138.MoveSpeed then
			p136.Velocity = p136.Velocity.Unit * p138.MoveSpeed
		elseif p136.Velocity.Magnitude < p138.MoveSpeed * 0.4 then
			p136.Velocity = p136.Velocity.Unit * (p138.MoveSpeed * 0.4)
		end
		p136.Position = p136.Position + p136.Velocity * p139
		local v152 = tick() * p138.HeightOscillationSpeed + p136.VerticalOffset
		local v153 = math.sin(v152) * p138.HeightOscillationAmount
		local v154 = p138.FlockHeight + p136.BaseHeightOffset + v153
		local v155 = p136.Position.X
		local v156 = p136.Position.Z
		p136.Position = Vector3.new(v155, v154, v156)
		if v145 then
			p136.LastLODUpdate = p141
			if p136.Velocity.Magnitude > 0.1 then
				local v157 = p136.Velocity.X
				local v158 = p136.Velocity.Z
				local v159 = math.atan2(v157, v158)
				if not p136.CurrentRotation then
					p136.CurrentRotation = v159
					p136.VisualRotation = v159
				end
				local v160 = v159 - p136.CurrentRotation
				while v160 > 3.141592653589793 do
					v160 = v160 - 6.283185307179586
				end
				while v160 < -3.141592653589793 do
					v160 = v160 + 6.283185307179586
				end
				local v161 = p138.MaxTurnRate
				if v161 < math.abs(v160) then
					v160 = v161 * (v160 > 0 and 1 or -1)
				end
				p136.CurrentRotation = p136.CurrentRotation + v160
				p136.VisualRotation = p136.VisualRotation or p136.CurrentRotation
				local v162 = p136.CurrentRotation - p136.VisualRotation
				while v162 > 3.141592653589793 do
					v162 = v162 - 6.283185307179586
				end
				while v162 < -3.141592653589793 do
					v162 = v162 + 6.283185307179586
				end
				p136.VisualRotation = p136.VisualRotation + v162 * 0.15
				local v163 = v162 * 2
				local v164 = math.clamp(v163, -0.08, 0.08)
				p136.Model:PivotTo(CFrame.new(p136.Position) * CFrame.Angles(0, p136.VisualRotation, v164))
			end
		end
		if p138.OnMemberUpdate then
			p138.OnMemberUpdate(p136.Model, p136, p139)
		end
	end
end
local function v_u_177(p166, p167, p168, p169, p170)
	local v171 = p167:Clone()
	v171:PivotTo(CFrame.new(p166))
	v171.Parent = workspace
	local v172 = {
		["Model"] = v171,
		["Position"] = p166,
		["Velocity"] = p168 * p170:NextNumber(12, 15),
		["WanderDirection"] = p168 * 5,
		["LastWanderChange"] = tick() + p170:NextNumber() * 5
	}
	local v173 = p168.X
	local v174 = p168.Z
	v172.CurrentRotation = math.atan2(v173, v174)
	local v175 = p168.X
	local v176 = p168.Z
	v172.VisualRotation = math.atan2(v175, v176)
	v172.VerticalOffset = p170:NextNumber() * 3.141592653589793 * 2
	v172.BaseHeightOffset = p169
	v172.OriginalTransparencies = nil
	v172.FadeTweens = nil
	v172.LastLODUpdate = 0
	return v172
end
function v_u_6.new(p178, p179, p180)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_85, (copy) v_u_4, (copy) v_u_177, (copy) v_u_26, (copy) v_u_5
	local v181 = v_u_6
	local v_u_182 = setmetatable({}, v181)
	v_u_182.Config = {}
	for v183, v184 in v_u_7 do
		v_u_182.Config[v183] = v184
	end
	if p179 then
		for v185, v186 in p179 do
			if v185 == "SpawnSettings" and type(v186) == "table" then
				v_u_182.Config.SpawnSettings = {}
				for v187, v188 in v_u_7.SpawnSettings do
					v_u_182.Config.SpawnSettings[v187] = v188
				end
				for v189, v190 in v186 do
					v_u_182.Config.SpawnSettings[v189] = v190
				end
			elseif v185 == "FadeSettings" and type(v186) == "table" then
				v_u_182.Config.FadeSettings = {}
				for v191, v192 in v_u_7.FadeSettings do
					v_u_182.Config.FadeSettings[v191] = v192
				end
				for v193, v194 in v186 do
					v_u_182.Config.FadeSettings[v193] = v194
				end
			else
				v_u_182.Config[v185] = v186
			end
		end
	end
	v_u_182.Model = p178
	v_u_182.Members = {}
	v_u_182.SpawnTime = tick()
	v_u_182.Active = true
	v_u_182.Connection = nil
	v_u_182.FadingOut = false
	v_u_182.Rand = p180 or Random.new()
	local v195 = v_u_182.Rand:NextInteger(v_u_182.Config.MinMembers, v_u_182.Config.MaxMembers)
	local v_u_196, v_u_197 = v_u_85(v_u_182.Config, v_u_182.Rand)
	local v198 = v_u_182.Config.FadeSettings
	local v_u_199
	if v198 then
		v_u_199 = v198.Enabled or false
	else
		v_u_199 = false
	end
	local v_u_200 = v198 and v198.FadeInDuration or 2
	local v201 = {}
	for v_u_202 = 1, v195 do
		local v211 = v_u_4.new(function()
			-- upvalues: (copy) v_u_197, (copy) v_u_202, (copy) v_u_182, (ref) v_u_177, (copy) v_u_196, (copy) v_u_199, (ref) v_u_26, (copy) v_u_200
			local v203 = -v_u_197.Z
			local v204 = v_u_197.X
			local v205 = Vector3.new(v203, 0, v204) * ((v_u_202 - 1) * v_u_182.Config.SpawnRadius * (v_u_202 % 2 == 0 and 1 or -1))
			local v206 = v_u_197 * (v_u_202 * v_u_182.Config.SpawnRadius * 0.75)
			local v207 = v_u_182.Rand:NextNumber(-v_u_182.Config.HeightVariationRange, v_u_182.Config.HeightVariationRange)
			local v208 = v_u_177(v_u_196 + (v205 + v206 + Vector3.new(0, v207, 0)), v_u_182.Model, v_u_197, v207, v_u_182.Rand)
			local v209 = v_u_202 == 1
			if v209 then
				v208.Model:ScaleTo(v_u_182.Config.LeaderScale)
				v208.BaseHeightOffset = v208.BaseHeightOffset * v_u_182.Config.LeaderHeightReduction
			end
			if v_u_199 then
				v_u_26(v208, v_u_200)
			end
			if v_u_182.Config.OnMemberSpawned then
				v_u_182.Config.OnMemberSpawned(v208.Model, v209, v_u_202)
			end
			local v210 = v_u_182.Members
			table.insert(v210, v208)
		end)
		table.insert(v201, v211)
	end
	for _, v212 in v201 do
		v_u_5:Enqueue(v212)
	end
	v_u_4.WhenAll(v201):Then(function(_)
		-- upvalues: (copy) v_u_182
		if v_u_182.Config.OnFlockSpawned then
			v_u_182.Config.OnFlockSpawned(v_u_182)
		end
	end)
	v_u_182:StartUpdateLoop()
	return v_u_182
end
function v_u_6.StartUpdateLoop(p_u_213)
	-- upvalues: (copy) v_u_1, (copy) v_u_165, (copy) v_u_33
	p_u_213.Connection = v_u_1.Heartbeat:Connect(function(p214)
		-- upvalues: (copy) p_u_213, (ref) v_u_165, (ref) v_u_33
		if p_u_213.Active then
			local v215 = tick()
			for _, v216 in p_u_213.Members do
				v_u_165(v216, p_u_213.Members, p_u_213.Config, p214, p_u_213.Rand, v215)
			end
			local v217 = p_u_213.Config.FadeSettings
			local v218
			if v217 then
				v218 = v217.Enabled or false
			else
				v218 = false
			end
			if v218 and not p_u_213.FadingOut then
				local v219 = tick() - p_u_213.SpawnTime
				local v220 = v217.FadeOutBeforeDespawn or 5
				if p_u_213.Config.DespawnTime - v220 <= v219 then
					p_u_213.FadingOut = true
					local v221 = v217.FadeOutDuration or 2
					for _, v222 in p_u_213.Members do
						v_u_33(v222, v221)
					end
				end
			end
			if tick() - p_u_213.SpawnTime > p_u_213.Config.DespawnTime then
				p_u_213:Destroy()
			end
		end
	end)
end
function v_u_6.GetMemberCount(p223)
	return #p223.Members
end
function v_u_6.GetMembers(p224)
	return p224.Members
end
function v_u_6.IsActive(p225)
	return p225.Active
end
function v_u_6.FadeOut(p_u_226, p227, p228)
	-- upvalues: (copy) v_u_33
	if p_u_226.Active and not p_u_226.FadingOut then
		p_u_226.FadingOut = true
		if not p227 then
			local v229 = p_u_226.Config.FadeSettings
			p227 = v229 and v229.FadeOutDuration or 2
		end
		local v_u_230 = p228 == nil and true or p228
		for _, v231 in p_u_226.Members do
			v_u_33(v231, p227)
		end
		task.delay(p227, function()
			-- upvalues: (copy) p_u_226, (copy) v_u_230
			if p_u_226.Config.OnFadeOutComplete then
				p_u_226.Config.OnFadeOutComplete(p_u_226)
			end
			if v_u_230 then
				p_u_226:Destroy()
			end
		end)
	end
end
function v_u_6.Destroy(p232)
	if p232.Active then
		p232.Active = false
		if p232.Connection then
			p232.Connection:Disconnect()
			p232.Connection = nil
		end
		for _, v233 in p232.Members do
			if v233.FadeTweens then
				for _, v234 in v233.FadeTweens do
					v234:Cancel()
				end
			end
			if v233.Model and v233.Model.Parent then
				v233.Model:Destroy()
			end
		end
		if p232.Config.OnDestroyed then
			p232.Config.OnDestroyed(p232)
		end
		table.clear(p232.Members)
	end
end
return v_u_6