local v1 = game:GetService("RunService")
local v_u_2 = math.exp
local v_u_3 = math.sin
local v_u_4 = math.cos
local v_u_5 = math.min
local v_u_6 = math.sqrt
local v_u_7 = math.round
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10, p11, p12, p13)
	-- upvalues: (copy) v_u_8
	local v14 = p13.toIntermediate(p11)
	local v15 = {
		["d"] = p9,
		["f"] = p10,
		["g"] = v14,
		["p"] = v14,
		["v"] = table.create(#v14, 0),
		["typedat"] = p13,
		["rawGoal"] = p12
	}
	local v16 = v_u_8
	return setmetatable(v15, v16)
end
function v_u_8.setGoal(p17, p18)
	p17.rawGoal = p18
	p17.g = p17.typedat.toIntermediate(p18)
end
function v_u_8.setDampingRatio(p19, p20)
	p19.d = p20
end
function v_u_8.setFrequency(p21, p22)
	p21.f = p22
end
function v_u_8.canSleep(p23)
	local v24 = 0
	for _, v25 in p23.v do
		v24 = v24 + v25 ^ 2
	end
	if v24 > 0.0001 then
		return false
	end
	local v26 = p23.p
	local v27 = p23.g
	local v28 = 0
	for v29, v30 in v26 do
		v28 = v28 + (v27[v29] - v30) ^ 2
	end
	return v28 <= 6.781684027777778e-8
end
function v_u_8.step(p31, p32)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v33 = p31.d
	local v34 = p31.f * 2 * 3.141592653589793
	local v35 = p31.g
	local v36 = p31.p
	local v37 = p31.v
	if v33 == 1 then
		local v38 = v_u_2(-v34 * p32)
		local v39 = p32 * v38
		local v40 = v38 + v39 * v34
		local v41 = v38 - v39 * v34
		local v42 = v39 * v34 * v34
		for v43 = 1, #v36 do
			local v44 = v36[v43] - v35[v43]
			v36[v43] = v44 * v40 + v37[v43] * v39 + v35[v43]
			v37[v43] = v37[v43] * v41 - v44 * v42
		end
	elseif v33 < 1 then
		local v45 = v_u_2(-v33 * v34 * p32)
		local v46 = v_u_6(1 - v33 * v33)
		local v47 = v_u_4(p32 * v34 * v46)
		local v48 = v_u_3(p32 * v34 * v46)
		local v49
		if v46 > 0.00001 then
			v49 = v48 / v46
		else
			local v50 = p32 * v34
			v49 = v50 + (v50 * v50 * (v46 * v46) * (v46 * v46) / 20 - v46 * v46) * (v50 * v50 * v50) / 6
		end
		local v51
		if v34 * v46 > 0.00001 then
			v51 = v48 / (v34 * v46)
		else
			local v52 = v34 * v46
			v51 = p32 + (p32 * p32 * (v52 * v52) * (v52 * v52) / 20 - v52 * v52) * (p32 * p32 * p32) / 6
		end
		for v53 = 1, #v36 do
			local v54 = v36[v53] - v35[v53]
			v36[v53] = (v54 * (v47 + v49 * v33) + v37[v53] * v51) * v45 + v35[v53]
			v37[v53] = (v37[v53] * (v47 - v49 * v33) - v54 * (v49 * v34)) * v45
		end
	else
		local v55 = v_u_6(v33 * v33 - 1)
		local v56 = -v34 * (v33 - v55)
		local v57 = -v34 * (v33 + v55)
		local v58 = v_u_2(v56 * p32)
		local v59 = v_u_2(v57 * p32)
		for v60 = 1, #v36 do
			local v61 = v36[v60] - v35[v60]
			local v62 = (v37[v60] - v61 * v56) / (2 * v34 * v55)
			local v63 = v58 * (v61 - v62)
			v36[v60] = v63 + v62 * v59 + v35[v60]
			v37[v60] = v63 * v56 + v62 * v59 * v57
		end
	end
	return p31.typedat.fromIntermediate(p31.p)
end
local v_u_64 = {}
v_u_64.__index = v_u_64
function v_u_64.new(p65, p66, p67, p68)
	-- upvalues: (copy) v_u_64
	local v69 = v_u_64
	return setmetatable({
		["d"] = p65,
		["f"] = p66,
		["g"] = p68,
		["p"] = p67,
		["v"] = Vector3.new(0, 0, 0)
	}, v69)
end
function v_u_64.setGoal(p70, p71)
	p70.g = p71
end
function v_u_64.setDampingRatio(p72, p73)
	p72.d = p73
end
function v_u_64.setFrequency(p74, p75)
	p74.f = p75
end
function v_u_64.canSleep(p76)
	local v77 = p76.p
	local _, v78 = p76.g:ToObjectSpace(v77):ToAxisAngle()
	return math.abs(v78) < 0.00017453292519943296 and p76.v.Magnitude < 0.0017453292519943296
end
function v_u_64.step(p79, p80)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v81 = p79.d
	local v82 = p79.f * 2 * 3.141592653589793
	local v83 = p79.g
	local v84 = p79.p
	local v85 = p79.v
	local v86, v87 = (v84 * v83:Inverse()):ToAxisAngle()
	local v88 = v86 * v87
	local v89 = v_u_2(-v81 * v82 * p80)
	local v90, v91
	if v81 == 1 then
		local _ = p80 * v89
		local v92 = (v88 * (1 + v82 * p80) + v85 * p80) * v89
		local v93 = v92.Magnitude
		local v94
		if v93 > 1e-6 then
			v94 = CFrame.fromAxisAngle(v92.Unit, v93)
		else
			v94 = CFrame.identity
		end
		v90 = v94 * v83
		v91 = (v85 * (1 - p80 * v82) - v88 * (p80 * v82 * v82)) * v89
	elseif v81 < 1 then
		local v95 = v_u_6(1 - v81 * v81)
		local v96 = v_u_4(p80 * v82 * v95)
		local v97 = v_u_3(p80 * v82 * v95)
		local v98 = v97 / (v82 * v95)
		local v99 = v97 / v95
		local v100 = (v88 * (v96 + v99 * v81) + v85 * v98) * v89
		local v101 = v100.Magnitude
		local v102
		if v101 > 1e-6 then
			v102 = CFrame.fromAxisAngle(v100.Unit, v101)
		else
			v102 = CFrame.identity
		end
		v90 = v102 * v83
		v91 = (v85 * (v96 - v99 * v81) - v88 * (v99 * v82)) * v89
	else
		local v103 = v_u_6(v81 * v81 - 1)
		local v104 = -v82 * (v81 - v103)
		local v105 = -v82 * (v81 + v103)
		local v106 = (v85 - v88 * v104) / (2 * v82 * v103)
		local v107 = (v88 - v106) * v_u_2(v104 * p80)
		local v108 = v106 * v_u_2(v105 * p80)
		local v109 = v107 + v108
		local v110 = v109.Magnitude
		local v111
		if v110 > 1e-6 then
			v111 = CFrame.fromAxisAngle(v109.Unit, v110)
		else
			v111 = CFrame.identity
		end
		v90 = v111 * v83
		v91 = v107 * v104 + v108 * v105
	end
	p79.p = v90
	p79.v = v91
	return v90
end
local v_u_117 = {
	["springType"] = v_u_8.new,
	["toIntermediate"] = function(p112)
		return { p112.X, p112.Y, p112.Z }
	end,
	["fromIntermediate"] = function(p113)
		local v114 = p113[1]
		local v115 = p113[2]
		local v116 = p113[3]
		return Vector3.new(v114, v115, v116)
	end
}
local v_u_118 = {}
v_u_118.__index = v_u_118
function v_u_118.new(p119, p120, p121, p122, _)
	-- upvalues: (copy) v_u_8, (copy) v_u_117, (copy) v_u_64, (copy) v_u_118
	local v123 = {
		["rawGoal"] = p122,
		["_position"] = v_u_8.new(p119, p120, p121.Position, p122.Position, v_u_117),
		["_rotation"] = v_u_64.new(p119, p120, p121.Rotation, p122.Rotation)
	}
	local v124 = v_u_118
	return setmetatable(v123, v124)
end
function v_u_118.setGoal(p125, p126)
	p125.rawGoal = p126
	p125._position:setGoal(p126.Position)
	p125._rotation:setGoal(p126.Rotation)
end
function v_u_118.setDampingRatio(p127, p128)
	p127._position:setDampingRatio(p128)
	p127._rotation:setDampingRatio(p128)
end
function v_u_118.setFrequency(p129, p130)
	p129._position:setFrequency(p130)
	p129._rotation:setFrequency(p130)
end
function v_u_118.canSleep(p131)
	local v132 = p131._position:canSleep()
	if v132 then
		v132 = p131._rotation:canSleep()
	end
	return v132
end
function v_u_118.step(p133, p134)
	local v135 = p133._position:step(p134)
	return p133._rotation:step(p134) + v135
end
local function v_u_149(p136)
	local v137 = p136.R
	local v138 = p136.G
	local v139 = p136.B
	local v140 = v137 < 0.0404482362771076 and v137 / 12.92 or 0.87941546140213 * (v137 + 0.055) ^ 2.4
	local v141 = v138 < 0.0404482362771076 and v138 / 12.92 or 0.87941546140213 * (v138 + 0.055) ^ 2.4
	local v142 = v139 < 0.0404482362771076 and v139 / 12.92 or 0.87941546140213 * (v139 + 0.055) ^ 2.4
	local v143 = 0.9257063972951867 * v140 - 0.8333736323779866 * v141 - 0.09209820666085898 * v142
	local v144 = 0.2125862307855956 * v140 + 0.7151703037034108 * v141 + 0.0722004986433362 * v142
	local v145 = 3.6590806972265884 * v140 + 11.442689580057424 * v141 + 4.114991502426484 * v142
	local v146 = v144 > 0.008856451679035631 and 116 * v144 ^ 0.3333333333333333 - 16 or 903.296296296296 * v144
	local v147, v148
	if v145 > 1e-14 then
		v147 = v146 * v143 / v145
		v148 = v146 * (9 * v144 / v145 - 0.46832)
	else
		v147 = -0.19783 * v146
		v148 = -0.46832 * v146
	end
	return { v146, v147, v148 }
end
local function v_u_161(p150)
	-- upvalues: (copy) v_u_5
	local v151 = p150[1]
	if v151 < 0.0197955 then
		return Color3.new(0, 0, 0)
	end
	local v152 = p150[2] / v151 + 0.19783
	local v153 = p150[3] / v151 + 0.46832
	local v154 = (v151 + 16) / 116
	local v155 = v154 > 0.20689655172413793 and v154 * v154 * v154 or v154 * 0.12841854934601665 - 0.01771290335807126
	local v156 = v155 * v152 / v153
	local v157 = v155 * ((3 - v152 * 0.75) / v153 - 5)
	local v158 = v156 * 7.2914074 - v155 * 1.537208 - v157 * 0.4986286
	local v159 = v156 * -2.180094 + v155 * 1.8757561 + v157 * 0.0415175
	local v160 = v156 * 0.1253477 - v155 * 0.2040211 + v157 * 1.0569959
	if v158 < 0 and (v158 < v159 and v158 < v160) then
		v159 = v159 - v158
		v160 = v160 - v158
		v158 = 0
	elseif v159 < 0 and v159 < v160 then
		v158 = v158 - v159
		v160 = v160 - v159
		v159 = 0
	elseif v160 < 0 then
		v158 = v158 - v160
		v159 = v159 - v160
		v160 = 0
	end
	return Color3.new(v_u_5(v158 < 0.0031306684425 and 12.92 * v158 or 1.055 * v158 ^ 0.4166666666666667 - 0.055, 1), v_u_5(v159 < 0.0031306684425 and 12.92 * v159 or 1.055 * v159 ^ 0.4166666666666667 - 0.055, 1), (v_u_5(v160 < 0.0031306684425 and 12.92 * v160 or 1.055 * v160 ^ 0.4166666666666667 - 0.055, 1)))
end
local v_u_181 = {
	["boolean"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p162)
			return { p162 and 1 or 0 }
		end,
		["fromIntermediate"] = function(p163)
			return p163[1] >= 0.5
		end
	},
	["number"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p164)
			return { p164 }
		end,
		["fromIntermediate"] = function(p165)
			return p165[1]
		end
	},
	["NumberRange"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p166)
			return { p166.Min, p166.Max }
		end,
		["fromIntermediate"] = function(p167)
			return NumberRange.new(p167[1], p167[2])
		end
	},
	["UDim"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p168)
			return { p168.Scale, p168.Offset }
		end,
		["fromIntermediate"] = function(p169)
			-- upvalues: (copy) v_u_7
			return UDim.new(p169[1], (v_u_7(p169[2])))
		end
	},
	["UDim2"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p170)
			local v171 = p170.X
			local v172 = p170.Y
			return {
				v171.Scale,
				v171.Offset,
				v172.Scale,
				v172.Offset
			}
		end,
		["fromIntermediate"] = function(p173)
			-- upvalues: (copy) v_u_7
			return UDim2.new(p173[1], v_u_7(p173[2]), p173[3], (v_u_7(p173[4])))
		end
	},
	["Vector2"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p174)
			return { p174.X, p174.Y }
		end,
		["fromIntermediate"] = function(p175)
			return Vector2.new(p175[1], p175[2])
		end
	},
	["Vector3"] = v_u_117,
	["Color3"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = v_u_149,
		["fromIntermediate"] = v_u_161
	},
	["ColorSequence"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p176)
			-- upvalues: (ref) v_u_149
			local v177 = p176.Keypoints
			local v178 = v_u_149(v177[1].Value)
			local v179 = v_u_149(v177[#v177].Value)
			return {
				v178[1],
				v178[2],
				v178[3],
				v179[1],
				v179[2],
				v179[3]
			}
		end,
		["fromIntermediate"] = function(p180)
			-- upvalues: (ref) v_u_161
			return ColorSequence.new(v_u_161({ p180[1], p180[2], p180[3] }), v_u_161({ p180[4], p180[5], p180[6] }))
		end
	},
	["CFrame"] = {
		["springType"] = v_u_118.new,
		["toIntermediate"] = error,
		["fromIntermediate"] = error
	}
}
local v_u_188 = {
	["Pivot"] = {
		["class"] = "PVInstance",
		["get"] = function(p182)
			return p182:GetPivot()
		end,
		["set"] = function(p183, p184)
			p183:PivotTo(p184)
		end
	},
	["Scale"] = {
		["class"] = "Model",
		["get"] = function(p185)
			return p185:GetScale()
		end,
		["set"] = function(p186, p187)
			p186:ScaleTo(p187)
		end
	}
}
local v_u_189 = {}
local v_u_190 = {}
v1.Heartbeat:Connect(function(p191)
	-- upvalues: (copy) v_u_189, (copy) v_u_188, (copy) v_u_190
	for v192, v193 in v_u_189 do
		for v194, v195 in v193 do
			if v195:canSleep() then
				v193[v194] = nil
				local v196 = v195.rawGoal
				local v197 = v_u_188[v194]
				if v197 and v192:IsA(v197.class) then
					v197.set(v192, v196)
				else
					v192[v194] = v196
				end
			else
				local v198 = v195:step(p191)
				local v199 = v_u_188[v194]
				if v199 and v192:IsA(v199.class) then
					v199.set(v192, v198)
				else
					v192[v194] = v198
				end
			end
		end
		if not next(v193) then
			v_u_189[v192] = nil
			local v200 = v_u_190[v192]
			if v200 then
				v_u_190[v192] = nil
				for _, v201 in v200 do
					task.spawn(v201)
				end
			end
		end
	end
end)
return table.freeze({
	["target"] = function(p202, p203, p204, p205)
		-- upvalues: (copy) v_u_189, (copy) v_u_188, (copy) v_u_181
		if not ("Instance"):find((typeof(p202))) then
			error(("bad argument #%* to spr.target (Instance expected, got %*)"):format(1, (typeof(p202))), 3)
		end
		if not ("number"):find((typeof(p203))) then
			error(("bad argument #%* to spr.target (number expected, got %*)"):format(2, (typeof(p203))), 3)
		end
		if not ("number"):find((typeof(p204))) then
			error(("bad argument #%* to spr.target (number expected, got %*)"):format(3, (typeof(p204))), 3)
		end
		if not ("table"):find((typeof(p205))) then
			error(("bad argument #%* to spr.target (table expected, got %*)"):format(4, (typeof(p205))), 3)
		end
		if p203 ~= p203 or p203 < 0 then
			error(("expected damping ratio >= 0; got %.2f"):format(p203), 2)
		end
		if p204 ~= p204 or p204 < 0 then
			error(("expected undamped frequency >= 0; got %.2f"):format(p204), 2)
		end
		local v206 = v_u_189[p202]
		if not v206 then
			v206 = {}
			v_u_189[p202] = v206
		end
		for v207, v208 in p205 do
			local v209 = v_u_188[v207]
			local v210
			if v209 and p202:IsA(v209.class) then
				v210 = v209.get(p202)
			else
				v210 = p202[v207]
			end
			if typeof(v208) ~= typeof(v210) then
				error(("bad property %* to spr.target (%* expected, got %*)"):format(v207, typeof(v210), (typeof(v208))), 2)
			end
			if p204 == (1 / 0) then
				local v211 = v_u_188[v207]
				if v211 and p202:IsA(v211.class) then
					v211.set(p202, v208)
				else
					p202[v207] = v208
				end
				v206[v207] = nil
			else
				local v212 = v206[v207]
				if not v212 then
					local v213 = v_u_181[typeof(v208)]
					if not v213 then
						error("unsupported type: " .. typeof(v208), 2)
					end
					v212 = v213.springType(p203, p204, v210, v208, v213)
					v206[v207] = v212
				end
				v212:setGoal(v208)
				v212:setDampingRatio(p203)
				v212:setFrequency(p204)
			end
		end
		if not next(v206) then
			v_u_189[p202] = nil
		end
	end,
	["stop"] = function(p214, p215)
		-- upvalues: (copy) v_u_189
		if not ("Instance"):find((typeof(p214))) then
			error(("bad argument #%* to spr.stop (Instance expected, got %*)"):format(1, (typeof(p214))), 3)
		end
		if not ("string|nil"):find((typeof(p215))) then
			error(("bad argument #%* to spr.stop (string|nil expected, got %*)"):format(2, (typeof(p215))), 3)
		end
		if p215 then
			local v216 = v_u_189[p214]
			if v216 then
				v216[p215] = nil
				return
			end
		else
			v_u_189[p214] = nil
		end
	end,
	["completed"] = function(p217, p218)
		-- upvalues: (copy) v_u_190
		if not ("Instance"):find((typeof(p217))) then
			error(("bad argument #%* to spr.completed (Instance expected, got %*)"):format(1, (typeof(p217))), 3)
		end
		if not ("function"):find((typeof(p218))) then
			error(("bad argument #%* to spr.completed (function expected, got %*)"):format(2, (typeof(p218))), 3)
		end
		local v219 = v_u_190[p217]
		if v219 then
			table.insert(v219, p218)
		else
			v_u_190[p217] = { p218 }
		end
	end
})