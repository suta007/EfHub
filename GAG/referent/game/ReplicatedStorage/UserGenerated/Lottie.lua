local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("AssetService")
local v_u_3 = game:GetService("EncodingService")
require(script.Types)
local v_u_4 = require(script.Easing)
local v_u_5 = Rect.new(64, 64, 192, 192)
local v_u_6 = UDim2.fromScale(0, 0)
local v_u_7 = UDim2.fromScale(1, 1)
local v8, v_u_9 = pcall(require, script.PNG)
if not v8 then
	v_u_9 = nil
end
local function v_u_17(p10)
	local v11 = string.sub(p10, 2, 3)
	local v12 = tonumber(v11, 16) or 0
	local v13 = string.sub(p10, 4, 5)
	local v14 = tonumber(v13, 16) or 0
	local v15 = string.sub(p10, 6, 7)
	local v16 = tonumber(v15, 16) or 0
	return Color3.fromRGB(v12, v14, v16)
end
local function v_u_36(p18, p19, p20, p21, p22, p23, p24, p25, p26, p27)
	for v28 = 1, p26 do
		local v29 = v28 / p26
		local v30 = 1 - v29
		local v31 = v30 * v30
		local v32 = v31 * v30
		local v33 = v29 * v29
		local v34 = v33 * v29
		local v35 = { v32 * p18 + v31 * 3 * v29 * p20 + v30 * 3 * v33 * p22 + v34 * p24, v32 * p19 + v31 * 3 * v29 * p21 + v30 * 3 * v33 * p23 + v34 * p25 }
		table.insert(p27, v35)
	end
end
local function v_u_63(p37)
	-- upvalues: (copy) v_u_36
	local v38 = p37.v
	local v39 = p37.i
	local v40 = p37.o
	local v41 = #v38
	if v41 == 0 then
		return {}
	end
	local v42 = {
		{ v38[1][1], v38[1][2] }
	}
	local v43
	if p37.c then
		v43 = v41
	else
		v43 = v41 - 1
	end
	for v44 = 1, v43 do
		local v45 = v44 >= v41 and 1 or v44 + 1
		local v46 = v38[v44]
		local v47 = v38[v45]
		local v48 = v40[v44]
		local v49 = v39[v45]
		local v50 = v46[1]
		local v51 = v46[2]
		local v52 = v50 + v48[1]
		local v53 = v51 + v48[2]
		local v54 = v47[1] + v49[1]
		local v55 = v47[2] + v49[2]
		local v56 = v47[1]
		local v57 = v47[2]
		local v58 = v48[1]
		local v59
		if math.abs(v58) < 0.01 then
			local v60 = v48[2]
			if math.abs(v60) < 0.01 then
				local v61 = v49[1]
				if math.abs(v61) < 0.01 then
					local v62 = v49[2]
					v59 = math.abs(v62) < 0.01
				else
					v59 = false
				end
			else
				v59 = false
			end
		else
			v59 = false
		end
		if v59 then
			table.insert(v42, { v56, v57 })
		else
			v_u_36(v50, v51, v52, v53, v54, v55, v56, v57, 12, v42)
		end
	end
	return v42
end
local function v_u_75(p64, p65, p66, p67, p68, p69, p70, p71)
	local v72 = (p66 - p64) * (p69 - p65) - (p67 - p65) * (p68 - p64)
	local v73 = (p68 - p64) * (p71 - p65) - (p69 - p65) * (p70 - p64)
	local v74 = (p70 - p64) * (p67 - p65) - (p71 - p65) * (p66 - p64)
	return (v72 >= 0 and v73 >= 0 and v74 >= 0 or v72 <= 0 and v73 <= 0 and v74 <= 0) and true or false
end
local function v_u_89(p76)
	local v77 = #p76
	if v77 < 3 then
		return false
	end
	local v78 = 0
	for v79 = 1, v77 do
		local v80 = v79 >= v77 and 1 or v79 + 1
		local v81 = v80 >= v77 and 1 or v80 + 1
		local v82 = p76[v79][1]
		local v83 = p76[v79][2]
		local v84 = p76[v80][1]
		local v85 = p76[v80][2]
		local v86 = p76[v81][1]
		local v87 = p76[v81][2]
		local v88 = (v84 - v82) * (v87 - v83) - (v85 - v83) * (v86 - v82)
		if v88 ~= 0 then
			if v78 == 0 then
				if v88 > 0 then
					v78 = 1
				else
					v78 = -1
				end
			elseif v88 > 0 and v78 < 0 or v88 < 0 and v78 > 0 then
				return false
			end
		end
	end
	return true
end
local function v_u_94(p90)
	local v91 = {}
	for v92 = 2, #p90 - 1 do
		local v93 = { p90[1], p90[v92], p90[v92 + 1] }
		table.insert(v91, v93)
	end
	return v91
end
local function v_u_121(p95)
	-- upvalues: (copy) v_u_89, (copy) v_u_94, (copy) v_u_75
	local v96 = #p95
	if v96 < 3 then
		return {}
	end
	if v96 == 3 then
		return {
			{ p95[1], p95[2], p95[3] }
		}
	end
	if v_u_89(p95) then
		return v_u_94(p95)
	end
	local v97 = table.create(v96)
	local v98 = 0
	for v99 = 1, v96 do
		v97[v99] = v99
		local v100 = v99 >= v96 and 1 or v99 + 1
		v98 = v98 + (p95[v100][1] - p95[v99][1]) * (p95[v100][2] + p95[v99][2])
	end
	local v101
	if v98 > 0 then
		v101 = table.create(v96)
		for v102 = 1, v96 do
			v101[v102] = v97[v96 - v102 + 1]
		end
	else
		v101 = v97
	end
	local v103 = #v101
	local v104 = v103 * v103
	local v105 = 0
	local v106 = 1
	local v107 = {}
	while true do
		while true do
			if v103 <= 2 or v105 >= v104 then
				return v107
			end
			v105 = v105 + 1
			v106 = v103 < v106 and 1 or v106
			local v108
			if v106 > 1 then
				v108 = v106 - 1
			else
				v108 = v103
			end
			local v109 = v106 >= v103 and 1 or v106 + 1
			local v110 = p95[v101[v108]]
			local v111 = p95[v101[v106]]
			local v112 = p95[v101[v109]]
			local v113 = v110[1]
			local v114 = v110[2]
			local v115 = v111[1]
			local v116 = v111[2]
			local v117 = v112[1]
			local v118 = v112[2]
			if (v115 - v113) * (v118 - v114) - (v116 - v114) * (v117 - v113) <= 0 then
				break
			end
			local v119 = true
			for v120 = 1, v103 do
				if v120 ~= v108 and (v120 ~= v106 and (v120 ~= v109 and v_u_75(p95[v101[v120]][1], p95[v101[v120]][2], v110[1], v110[2], v111[1], v111[2], v112[1], v112[2]))) then
					v119 = false
					break
				end
			end
			if not v119 then
				goto l30
			end
			table.insert(v107, { v110, v111, v112 })
			table.remove(v101, v106)
			v103 = v103 - 1
			if v103 < v106 then
				v106 = 1
			end
		end
		::l30::
		v106 = v106 + 1
	end
end
local function v_u_152(p122, p123, p124, p125, p126, p127, p128, p129, p130)
	local v131 = p125 - p123
	local v132 = p126 - p124
	local v133 = p127 - p123
	local v134 = p128 - p124
	if v131 * v134 - v132 * v133 < 0 then
		v131 = p127 - p123
		v132 = p128 - p124
		v133 = p125 - p123
		v134 = p126 - p124
	end
	local v135 = v131 * v131 + v132 * v132
	local v136 = math.sqrt(v135)
	local v137 = v133 * v133 + v134 * v134
	local v138 = math.sqrt(v137)
	if v136 < 1e-6 or v138 < 1e-6 then
		p122.A.Visible = false
		p122.B.Visible = false
		return
	else
		local v139 = v131 / v136
		local v140 = v132 / v136
		local v141 = v133 * v139 + v134 * v140
		local v142 = v133 - v139 * v141
		local v143 = v134 - v140 * v141
		local v144 = v142 * v142 + v143 * v143
		local v145 = math.sqrt(v144)
		if v145 < 1e-6 then
			p122.A.Visible = false
			p122.B.Visible = false
		else
			local v146 = math.atan2(v140, v139) * 57.29577951308232
			local v147 = p122.A
			v147.Visible = true
			v147.Position = UDim2.fromScale(p123, p124)
			v147.Size = UDim2.fromScale(math.max(v141, 0.0001), v145)
			v147.Rotation = v146
			v147.AnchorPoint = Vector2.zero
			v147.ImageColor3 = p129
			v147.ImageTransparency = p130
			local v148 = p122.B
			local v149 = v136 - v141
			v148.Visible = v149 > 1e-6
			if v148.Visible then
				local v150 = p123 + v139 * v136
				local v151 = p124 + v140 * v136
				v148.Position = UDim2.fromScale(v150, v151)
				v148.Size = UDim2.fromScale(math.max(v149, 0.0001), v145)
				v148.Rotation = v146 + 180
				v148.AnchorPoint = Vector2.zero
				v148.ImageColor3 = p129
				v148.ImageTransparency = p130
			end
		end
	end
end
local function v_u_172(p153, p154, p155, p156, p157, p158, p159)
	-- upvalues: (copy) v_u_63, (copy) v_u_121, (copy) v_u_152
	local v160 = v_u_63(p154)
	if #v160 >= 3 then
		local v161 = table.create(#v160)
		for v162, v163 in v160 do
			v161[v162] = { v163[1] / p156, v163[2] / p157 }
		end
		local v164 = v_u_121(v161)
		local v165 = p153.Triangles or {}
		for v166, v167 in v164 do
			local v168
			if v166 <= #v165 then
				v168 = v165[v166]
			else
				v168 = {}
				local v169 = Instance.new("ImageLabel")
				v169.Image = "rbxassetid://83051256678409"
				v169.BackgroundTransparency = 1
				v169.BorderSizePixel = 0
				v169.Size = UDim2.fromScale(1, 1)
				v169.Parent = p155
				v168.A = v169
				local v170 = Instance.new("ImageLabel")
				v170.Image = "rbxassetid://83051256678409"
				v170.BackgroundTransparency = 1
				v170.BorderSizePixel = 0
				v170.Size = UDim2.fromScale(1, 1)
				v170.Parent = p155
				v168.B = v170
				table.insert(v165, v168)
			end
			v_u_152(v168, v167[1][1], v167[1][2], v167[2][1], v167[2][2], v167[3][1], v167[3][2], p158, p159)
		end
		for v171 = #v164 + 1, #v165 do
			v165[v171].A.Visible = false
			v165[v171].B.Visible = false
		end
		p153.Triangles = v165
	end
end
local function v_u_223(p173, p174, p175, p176, p177, p178, p179, p180, p181, p182, p183, p184)
	-- upvalues: (copy) v_u_63, (copy) v_u_4
	local v185 = v_u_63(p174)
	if #v185 < 2 then
		return
	end
	local v186 = p173.Segments or {}
	local v187 = 0
	local v188 = { 0 }
	local v189 = p183 or 100
	local v190 = p184 or 0
	local v191 = p182 or 0
	for v192 = 2, #v185 do
		local v193 = v185[v192][1] - v185[v192 - 1][1]
		local v194 = v185[v192][2] - v185[v192 - 1][2]
		local v195 = v193 * v193 + v194 * v194
		v187 = v187 + math.sqrt(v195)
		v188[v192] = v187
	end
	local v196 = nil
	local v197
	if p181 then
		v197 = {}
		for _, v198 in p181 do
			if v198.v then
				local v199 = v_u_4.EvaluateScalar
				local v200 = v198.v
				table.insert(v197, v199(v200, 0))
			end
		end
		if #v197 <= 0 then
			v197 = v196
		end
	else
		v197 = v196
	end
	local v201 = p180 / math.min(p176, p177)
	local v202 = 0
	for v203 = 2, #v185 do
		local v204 = v185[v203 - 1]
		local v205 = v185[v203]
		local v206 = v205[1] - v204[1]
		local v207 = v205[2] - v204[2]
		local v208 = v206 * v206 + v207 * v207
		local v209 = math.sqrt(v208)
		if v209 >= 0.01 then
			local v210 = ((v188[v203 - 1] + v188[v203]) * 0.5 / math.max(v187, 1e-6) * 100 + v190) % 100
			if v210 >= v191 and v189 >= v210 then
				local v211 = true
				if v197 then
					local v212 = v188[v203 - 1]
					local v213 = 0
					for _, v214 in v197 do
						v213 = v213 + v214
					end
					if v213 > 0 then
						local v215 = v212 % v213
						local v216 = 0
						for v217, v218 in v197 do
							v216 = v216 + v218
							if v215 < v216 then
								v211 = v217 % 2 == 1
								break
							end
						end
					end
				end
				v202 = v202 + 1
				local v219
				if v202 <= #v186 then
					v219 = v186[v202]
				else
					v219 = Instance.new("Frame")
					v219.BorderSizePixel = 0
					v219.AnchorPoint = Vector2.new(0, 0.5)
					v219.Parent = p175
					table.insert(v186, v219)
				end
				v219.Visible = v211
				if v211 then
					local v220 = math.atan2(v207, v206) * 57.29577951308232
					local v221 = v209 / p176
					v219.Position = UDim2.fromScale(v204[1] / p176, v204[2] / p177)
					v219.Size = UDim2.fromScale(v221, v201)
					v219.Rotation = v220
					v219.BackgroundColor3 = p178
					v219.BackgroundTransparency = p179
				end
			end
		end
	end
	for v222 = v202 + 1, #v186 do
		v186[v222].Visible = false
	end
	p173.Segments = v186
end
local function v_u_249(p224, p225, p226, p227, p228)
	-- upvalues: (copy) v_u_4
	local v229 = Instance.new("UIGradient")
	local v230 = p225.p
	local v231 = p225.k
	local v232 = v_u_4.EvaluateVector(v231, p228, {})
	local v233 = {}
	for v234 = 0, v230 - 1 do
		local v235 = v234 * 4
		local v236 = v232[v235 + 1]
		if not v236 then
			local v237 = v230 - 1
			v236 = v234 / math.max(v237, 1)
		end
		local v238 = v232[v235 + 2] or 1
		local v239 = v232[v235 + 3] or 1
		local v240 = v232[v235 + 4] or 1
		local v241 = ColorSequenceKeypoint.new
		local v242 = math.clamp(v236, 0, 1)
		local v243 = Color3.new
		table.insert(v233, v241(v242, v243(v238, v239, v240)))
	end
	local v244 = #v233 < 2 and { ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) } or v233
	v229.Color = ColorSequence.new(v244)
	local v245 = v_u_4.EvaluateVector(p226, p228, { 0, 0 })
	local v246 = v_u_4.EvaluateVector(p227, p228, { 1, 0 })
	local v247 = v246[1] - v245[1]
	local v248 = v246[2] - v245[2]
	v229.Rotation = math.atan2(v248, v247) * 57.29577951308232
	v229.Parent = p224
	return v229
end
local function v_u_281(p250, p251, p252, p253, p254, p255, p256)
	-- upvalues: (copy) v_u_4
	local v257 = p251.p
	local v258 = v_u_4.EvaluateVector(p251.k, p254, {})
	local v259 = v_u_4.EvaluateVector(p252, p254, { p255 / 2, p256 / 2 })
	local v260 = v_u_4.EvaluateVector(p253, p254, { p255, p256 / 2 })
	local v261 = v259[1]
	local v262 = v259[2]
	local v263 = v260[1] - v261
	local v264 = v260[2] - v262
	local v265 = v263 * v263 + v264 * v264
	local v266 = math.sqrt(v265)
	local v267 = math.min(v257, 6)
	local v268 = {}
	for v269 = v267, 1, -1 do
		local v270 = v269 / v267
		local v271 = v270 * (v257 - 1)
		local v272 = math.floor(v271)
		local v273 = v257 - 1
		local v274 = math.min(v272, v273) * 4
		local v275 = v258[v274 + 2] or 1
		local v276 = v258[v274 + 3] or 1
		local v277 = v258[v274 + 4] or 1
		local v278 = v266 * 2 * v270
		local v279 = Instance.new("Frame")
		v279.AnchorPoint = Vector2.new(0.5, 0.5)
		v279.Position = UDim2.fromScale(v261 / p255, v262 / p256)
		v279.Size = UDim2.fromScale(v278 / p255, v278 / p256)
		v279.BackgroundColor3 = Color3.new(v275, v276, v277)
		v279.BackgroundTransparency = 0
		v279.BorderSizePixel = 0
		local v280 = Instance.new("UICorner")
		v280.CornerRadius = UDim.new(0.5, 0)
		v280.Parent = v279
		v279.Parent = p250
		table.insert(v268, v279)
	end
	return v268
end
local function v_u_304(p282, p283, p284, p285, p286, p287, p288, p289)
	-- upvalues: (copy) v_u_4
	if p283 ~= nil then
		local v290 = p283.p
		local v291
		if v290 == nil or type(v290) ~= "table" then
			v291 = { 0, 0 }
		elseif v290.s == true then
			v291 = { v_u_4.EvaluateScalarAtFrame(v290.x, p284, 0), (v_u_4.EvaluateScalarAtFrame(v290.y, p284, 0)) }
		else
			v291 = v_u_4.EvaluateVector(v290, p284, { 0, 0 })
		end
		local v292 = v_u_4.EvaluateVector(p283.s, p284, { 100, 100 })
		local v293 = v_u_4.EvaluateScalarAtFrame(p283.r, p284, 0)
		local v294 = v_u_4.EvaluateScalarAtFrame(p283.o, p284, 100)
		local v295 = v_u_4.EvaluateVector(p283.a, p284, { 0, 0 })
		local v296 = v292[1] / 100
		local v297 = v292[2] / 100
		p282.Position = UDim2.fromScale(v291[1] / p285, v291[2] / p286)
		p282.Rotation = v293
		p282.Size = UDim2.fromScale(p288 * v296, p289 * v297)
		if p287 then
			p282.GroupTransparency = 1 - v294 / 100
		end
		local v298 = p288 * v296 * p285
		local v299 = p289 * v297 * p286
		if (v295[1] ~= 0 or v295[2] ~= 0) and (v298 > 0 and v299 > 0) then
			local v300 = Vector2.new
			local v301 = v295[1] / v298
			local v302 = math.clamp(v301, 0, 1)
			local v303 = v295[2] / v299
			p282.AnchorPoint = v300(v302, (math.clamp(v303, 0, 1)))
		end
	end
end
local function v_u_321(p305)
	local v306 = nil
	local v307 = nil
	local v308 = nil
	local v309 = nil
	local v310 = nil
	local v311 = nil
	local v312 = nil
	local v313 = nil
	local v314 = nil
	local v315 = nil
	local v316 = nil
	local v317 = nil
	local v318 = nil
	for _, v319 in p305 do
		if not v319.hd then
			local v320 = v319.ty
			if v320 == "fl" then
				v311 = v319.c
				v312 = v319.o
			elseif v320 == "st" then
				v313 = v319.c
				v314 = v319.o
				v315 = v319.w
				v317 = v319.da
			elseif v320 == "sh" then
				v316 = v319.ks
			elseif v320 == "tr" then
				v309 = v319
			elseif v320 == "tm" then
				v318 = v319.s
				v306 = v319.e
				v307 = v319.o
				v308 = v319.m
			elseif v320 == "mm" then
				v310 = v319.mm
			end
		end
	end
	return v311, v312, v313, v314, v315, v316, v317, v318, v306, v307, v308, v309, v310
end
local function v_u_395(p322, p323, p324, p325, p326)
	-- upvalues: (copy) v_u_321, (copy) v_u_7, (copy) v_u_6, (copy) v_u_304, (copy) v_u_4, (copy) v_u_172, (copy) v_u_223, (copy) v_u_249, (copy) v_u_281, (copy) v_u_395
	local v327 = p322.it or {}
	local v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, _, v338, _ = v_u_321(v327)
	local v339 = false
	for _, v340 in v327 do
		if v340.ty == "tr" then
			local v341 = v340.o
			local v342
			if v341 == nil then
				v342 = false
			else
				v342 = v341.a == 1
			end
			if v342 then
				v339 = true
				break
			end
		end
	end
	local v343
	if v339 then
		v343 = Instance.new("CanvasGroup")
	else
		v343 = Instance.new("Frame")
	end
	v343.BackgroundTransparency = 1
	v343.BorderSizePixel = 0
	v343.Size = v_u_7
	v343.Position = v_u_6
	v343.Parent = p323
	if v338 then
		v_u_304(v343, {
			["a"] = v338.a,
			["p"] = v338.p,
			["s"] = v338.s,
			["r"] = v338.r,
			["o"] = v338.o
		}, p326, p324, p325, v339, 1, 1)
	end
	local v344 = {
		["Shape"] = p322,
		["Frame"] = v343,
		["Children"] = {},
		["FillColor"] = v328,
		["FillOpacity"] = v329,
		["StrokeColor"] = v330,
		["StrokeOpacity"] = v331,
		["StrokeWidth"] = v332,
		["PathData"] = v333
	}
	local v345
	if v333 == nil then
		v345 = false
	else
		v345 = v333.a == 1
	end
	v344.IsAnimatedPath = v345
	local v346 = v_u_4.EvaluateColor(v328, p326)
	local v347 = 1 - v_u_4.EvaluateScalarAtFrame(v329, p326, 100) / 100
	local v348 = v_u_4.EvaluateColor(v330, p326)
	local v349 = 1 - v_u_4.EvaluateScalarAtFrame(v331, p326, 100) / 100
	local v350 = v_u_4.EvaluateScalarAtFrame(v332, p326, 0)
	local v351 = v_u_4.EvaluateScalarAtFrame(v335, p326, 0)
	local v352 = v_u_4.EvaluateScalarAtFrame(v336, p326, 100)
	local v353 = v_u_4.EvaluateScalarAtFrame(v337, p326, 0)
	local v354 = 0
	for _, v355 in v327 do
		if v355.ty == "op" and v355.a then
			v354 = v_u_4.EvaluateScalarAtFrame(v355.a, p326, 0)
		end
	end
	for _, v356 in v327 do
		if not v356.hd then
			local v357 = v356.ty
			if v357 == "sh" then
				local v358 = v_u_4.EvaluateBezierShape(v356.ks, p326)
				if v358 and v354 ~= 0 then
					local v359 = 0
					local v360 = 0
					for _, v361 in v358.v do
						v359 = v359 + v361[1]
						v360 = v360 + v361[2]
					end
					local v362 = v359 / #v358.v
					local v363 = v360 / #v358.v
					local v364 = (v358.v[1][1] - v362) ^ 2 + (v358.v[1][2] - v363) ^ 2
					local v365 = math.sqrt(v364)
					local v366 = v354 / math.max(v365, 1) + 1
					local v367 = table.create(#v358.v)
					for v368, v369 in v358.v do
						v367[v368] = { v362 + (v369[1] - v362) * v366, v363 + (v369[2] - v363) * v366 }
					end
					v358 = {
						["v"] = v367,
						["i"] = v358.i,
						["o"] = v358.o,
						["c"] = v358.c
					}
				end
				if v358 then
					if v328 then
						v_u_172(v344, v358, v343, p324, p325, v346, v347)
					end
					if v330 and v350 > 0 then
						v_u_223(v344, v358, v343, p324, p325, v348, v349, v350, v334, v351, v352, v353)
					end
				end
			elseif v357 == "rc" then
				local v370 = Instance.new("Frame")
				v370.BorderSizePixel = 0
				local v371 = v_u_4.EvaluateVector(v356.s, p326, { 100, 100 })
				local v372 = v_u_4.EvaluateVector(v356.p, p326, { 0, 0 })
				local v373 = v_u_4.EvaluateScalarAtFrame(v356.r, p326, 0)
				v370.Size = UDim2.fromScale(v371[1] / p324, v371[2] / p325)
				v370.Position = UDim2.fromScale(v372[1] / p324, v372[2] / p325)
				v370.AnchorPoint = Vector2.new(0.5, 0.5)
				if v328 then
					v370.BackgroundColor3 = v346
					v370.BackgroundTransparency = v347
				else
					v370.BackgroundTransparency = 1
				end
				if v373 > 0 then
					local v374 = Instance.new("UICorner")
					v374.CornerRadius = UDim.new(0, v373)
					v374.Parent = v370
					v344.UICorner = v374
				end
				if v330 and v350 > 0 then
					local v_u_375 = Instance.new("UIStroke")
					v_u_375.Color = v348
					v_u_375.Transparency = v349
					v_u_375.Thickness = v350 / math.min(p324, p325)
					v_u_375.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					if not pcall(function()
						-- upvalues: (copy) v_u_375
						v_u_375.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
					end) then
						v_u_375.Thickness = v350
					end
					v_u_375.Parent = v370
					v344.UIStroke = v_u_375
				end
				v370.Parent = v343
				v344.Frame = v370
			elseif v357 == "el" then
				local v376 = Instance.new("Frame")
				v376.BorderSizePixel = 0
				local v377 = v_u_4.EvaluateVector(v356.s, p326, { 100, 100 })
				local v378 = v_u_4.EvaluateVector(v356.p, p326, { 0, 0 })
				v376.Size = UDim2.fromScale(v377[1] / p324, v377[2] / p325)
				v376.Position = UDim2.fromScale(v378[1] / p324, v378[2] / p325)
				v376.AnchorPoint = Vector2.new(0.5, 0.5)
				if v328 then
					v376.BackgroundColor3 = v346
					v376.BackgroundTransparency = v347
				else
					v376.BackgroundTransparency = 1
				end
				local v379 = Instance.new("UICorner")
				v379.CornerRadius = UDim.new(0.5, 0)
				v379.Parent = v376
				v344.UICorner = v379
				if v330 and v350 > 0 then
					local v_u_380 = Instance.new("UIStroke")
					v_u_380.Color = v348
					v_u_380.Transparency = v349
					v_u_380.Thickness = v350 / math.min(p324, p325)
					v_u_380.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					pcall(function()
						-- upvalues: (copy) v_u_380
						v_u_380.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
					end)
					v_u_380.Parent = v376
					v344.UIStroke = v_u_380
				end
				v376.Parent = v343
				v344.Frame = v376
			elseif v357 == "gf" or v357 == "gs" then
				local v381 = v356.t or 1
				if v356.g then
					if v381 == 1 then
						v344.UIGradient = v_u_249(v343, v356.g, v356.s, v356.e, p326)
					elseif v381 == 2 then
						v_u_281(v343, v356.g, v356.s, v356.e, p326, p324, p325)
					end
				end
			elseif v357 == "gr" then
				local v382 = v_u_395(v356, v343, p324, p325, p326)
				if v344.Children then
					local v383 = v344.Children
					table.insert(v383, v382)
				end
			elseif v357 == "rp" then
				local v384 = v_u_4.EvaluateScalarAtFrame(v356.c, p326, 1)
				local v385 = v356.tr
				if v385 and v384 > 1 then
					local v386 = v_u_4.EvaluateScalarAtFrame(v385.so, p326, 100)
					local v387 = v_u_4.EvaluateScalarAtFrame(v385.eo, p326, 100)
					for v388 = 0, math.floor(v384) - 1 do
						local v389 = Instance.new("Frame")
						v389.BackgroundTransparency = 1
						v389.BorderSizePixel = 0
						v389.Size = v_u_7
						local v390 = v384 - 1
						local v391 = v388 / math.max(v390, 1)
						v389.BackgroundTransparency = 1 - math.lerp(v386, v387, v391) / 100
						local _ = {
							["p"] = v385.p,
							["s"] = v385.s,
							["r"] = v385.r,
							["a"] = v385.a,
							["o"] = v385.o
						}
						local v392 = v_u_4.EvaluateVector(v385.p, p326, { 0, 0 })
						v_u_4.EvaluateVector(v385.s, p326, { 100, 100 })
						local v393 = v_u_4.EvaluateScalarAtFrame(v385.r, p326, 0)
						v389.Position = UDim2.fromScale(v392[1] * v388 / p324, v392[2] * v388 / p325)
						v389.Rotation = v393 * v388
						v389.Parent = v343
						for _, v394 in v327 do
							if v394.ty == "gr" and v394 ~= p322 then
								v_u_395(v394, v389, p324, p325, p326)
							end
						end
					end
				end
			end
		end
	end
	return v344
end
local function v_u_406(p396, p397, p398, p399, p400)
	-- upvalues: (copy) v_u_395
	local v401 = p396.shapes
	if v401 == nil then
		return {}
	end
	local v402 = {}
	for v403 = #v401, 1, -1 do
		local v404 = v401[v403]
		if not v404.hd and v404.ty == "gr" then
			local v405 = v_u_395(v404, p397, p398, p399, p400)
			table.insert(v402, v405)
		end
	end
	return v402
end
local function v_u_421(p407, p408, _, p409, p410)
	-- upvalues: (copy) v_u_7
	local v411 = p407.t
	if v411 == nil then
		return nil
	end
	local v412 = v411.d
	if v412 == nil then
		return nil
	end
	local v413 = v412.k
	if v413 == nil or #v413 == 0 then
		return nil
	end
	local v_u_414 = nil
	for _, v415 in v413 do
		if v415.t == nil or v415.t <= p410 then
			v_u_414 = v415.s
		end
	end
	if v_u_414 == nil then
		v_u_414 = v413[1].s
	end
	if v_u_414 == nil then
		return nil
	end
	local v416 = Instance.new("TextLabel")
	v416.BackgroundTransparency = 1
	v416.BorderSizePixel = 0
	v416.Size = v_u_7
	v416.Text = v_u_414.t or ""
	v416.TextScaled = false
	v416.RichText = false
	v416.TextSize = (v_u_414.s or 24) / p409 * 100
	if v_u_414.fc then
		local v417 = v_u_414.fc
		v416.TextColor3 = Color3.new(v417[1] or 1, v417[2] or 1, v417[3] or 1)
	end
	local v418 = v_u_414.j or 0
	if v418 == 0 then
		v416.TextXAlignment = Enum.TextXAlignment.Left
	elseif v418 == 1 then
		v416.TextXAlignment = Enum.TextXAlignment.Right
	else
		v416.TextXAlignment = Enum.TextXAlignment.Center
	end
	v416.TextYAlignment = Enum.TextYAlignment.Top
	if v_u_414.f then
		local v419, v420 = pcall(function()
			-- upvalues: (ref) v_u_414
			return Enum.Font[v_u_414.f]
		end)
		if v419 and v420 then
			v416.Font = v420
		else
			v416.Font = Enum.Font.GothamMedium
		end
	end
	v416.Parent = p408
	return v416
end
local function v_u_435(p422, p423, p424, _, _)
	-- upvalues: (copy) v_u_7, (ref) v_u_9, (copy) v_u_3, (copy) v_u_2
	local v425 = p422.refId
	if v425 == nil then
		return nil
	end
	local v426 = p424[v425]
	if v426 == nil then
		return nil
	end
	local v427 = Instance.new("ImageLabel")
	v427.BackgroundTransparency = 1
	v427.BorderSizePixel = 0
	v427.Size = v_u_7
	v427.ScaleType = Enum.ScaleType.Stretch
	if v426.e == 1 and v426.p then
		local v428 = v426.p
		if string.sub(v428, 1, 22) == "data:image/png;base64," then
			local v_u_429 = string.sub(v428, 23)
			if v_u_9 then
				local v431, v_u_432 = pcall(function()
					-- upvalues: (ref) v_u_3, (copy) v_u_429, (ref) v_u_9
					local v430 = v_u_3:Base64Decode(buffer.fromstring(v_u_429))
					return v_u_9.decode(v430)
				end)
				if v431 and v_u_432 then
					local v433, v_u_434 = pcall(function()
						-- upvalues: (ref) v_u_2, (copy) v_u_432
						return v_u_2:CreateEditableImage({
							["Size"] = Vector2.new(v_u_432.width, v_u_432.height)
						})
					end)
					if v433 and (v_u_434 and pcall(function()
						-- upvalues: (copy) v_u_434, (copy) v_u_432
						v_u_434:WritePixelsBuffer(Vector2.zero, Vector2.new(v_u_432.width, v_u_432.height), v_u_432.pixels)
					end)) then
						v427.ImageContent = Content.fromObject(v_u_434)
					end
				end
			end
		elseif string.sub(v428, 1, 23) == "data:image/jpeg;base64," then
			warn("[Lottie] Embedded JPEG not supported, skipping image layer:", p422.nm or "")
		end
	elseif v426.p and not v426.e then
		v427.Image = v426.p
	end
	v427.Parent = p423
	return v427
end
local function v_u_457(p436, p437, p438, p439, p440)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v441 = p436.ef
	if v441 ~= nil then
		for _, v442 in v441 do
			if v442.ty == 25 then
				local v443 = v442.ef
				if v443 ~= nil then
					local v444 = Color3.new(0, 0, 0)
					local v445 = 0
					local v446 = 5
					local v447 = 5
					local v448 = 0.5
					for _, v449 in v443 do
						local v450 = v449.ty
						if v450 ~= nil then
							if v450 == 1 then
								v444 = v_u_4.EvaluateColor(v449.v, p440)
							elseif v450 == 0 then
								v448 = v_u_4.EvaluateScalarAtFrame(v449.v, p440, 128) / 255
							elseif v450 == 3 then
								v445 = v_u_4.EvaluateScalarAtFrame(v449.v, p440, 0)
							elseif v450 == 2 then
								v446 = v_u_4.EvaluateScalarAtFrame(v449.v, p440, 5)
							elseif v450 == 4 then
								v447 = v_u_4.EvaluateScalarAtFrame(v449.v, p440, 5)
							end
						end
					end
					local v451 = v445 + 180
					local v452 = math.rad(v451)
					local v453 = math.cos(v452) * v446 / p438
					local v454 = math.sin(v452) * v446 / p439
					local v455 = (v447 * 2 + math.max(p438, p439)) / math.max(p438, p439)
					local v456 = Instance.new("ImageLabel")
					v456.Image = "rbxassetid://100849323991833"
					v456.ScaleType = Enum.ScaleType.Slice
					v456.SliceCenter = v_u_5
					v456.ImageColor3 = v444
					v456.ImageTransparency = 1 - v448
					v456.BackgroundTransparency = 1
					v456.BorderSizePixel = 0
					v456.AnchorPoint = Vector2.new(0.5, 0.5)
					v456.Position = UDim2.fromScale(v453 + 0.5, v454 + 0.5)
					v456.Size = UDim2.fromScale(v455, v455)
					v456.ZIndex = -1
					v456.Parent = p437
					return
				end
			end
		end
	end
end
local function v_u_513(p458, p459, p460, p461, p462, p463)
	-- upvalues: (copy) v_u_17, (copy) v_u_7, (copy) v_u_406, (copy) v_u_421, (copy) v_u_435, (copy) v_u_513, (copy) v_u_457, (copy) v_u_4, (copy) v_u_304
	local v464 = {}
	local v465 = {}
	for v466 = #p458, 1, -1 do
		local v467 = p458[v466]
		if not v467.hd then
			local v468 = v467.ty
			local v469 = v467.ks
			local v470
			if v469 == nil then
				v470 = false
			else
				local v471 = v469.o
				if v471 == nil then
					v470 = false
				else
					v470 = v471.a == 1
				end
			end
			local v472
			if v468 == 1 then
				v472 = Instance.new("Frame")
				v472.BorderSizePixel = 0
				local v473
				if v467.sc then
					v473 = v_u_17(v467.sc)
				else
					v473 = Color3.new(0, 0, 0)
				end
				v472.BackgroundColor3 = v473
				v472.BackgroundTransparency = 0
				v472.Size = UDim2.fromScale((v467.sw or p461) / p461, (v467.sh or p462) / p462)
			elseif v470 then
				v472 = Instance.new("CanvasGroup")
				v472.BackgroundTransparency = 1
				v472.BorderSizePixel = 0
				v472.Size = v_u_7
			else
				v472 = Instance.new("Frame")
				v472.BackgroundTransparency = 1
				v472.BorderSizePixel = 0
				v472.Size = v_u_7
			end
			v472.Name = v467.nm or ("Layer_%*"):format(v467.ind or v466)
			local v474 = v472.Size.X.Scale
			local v475 = v472.Size.Y.Scale
			local v476 = {
				["Layer"] = v467,
				["Frame"] = v472,
				["BaseSizeX"] = v474,
				["BaseSizeY"] = v475
			}
			if v467.ind then
				v465[v467.ind] = v476
			end
			if v468 == 4 then
				v476.Shapes = v_u_406(v467, v472, p461, p462, p463)
			elseif v468 == 5 then
				v476.TextLabel = v_u_421(v467, v472, p461, p462, p463)
			elseif v468 == 2 then
				v476.ImageLabel = v_u_435(v467, v472, p460, p461, p462)
			elseif v468 == 0 then
				local v477 = v467.refId
				if v477 and p460[v477] then
					local v478 = p460[v477]
					if v478.layers then
						local v479 = v467.w or (v478.w or p461)
						local v480 = v467.h or (v478.h or p462)
						v472.ClipsDescendants = true
						v472.Size = UDim2.fromScale(v479 / p461, v480 / p462)
						v476.Children = v_u_513(v478.layers, v472, p460, v479, v480, p463)
					end
				end
			end
			v_u_457(v467, v472, p461, p462, p463)
			if v467.masksProperties then
				for _, v481 in v467.masksProperties do
					if v481.mode == "a" or v481.mode == nil then
						local v482 = v_u_4.EvaluateBezierShape(v481.pt, p463)
						if v482 then
							local v483 = (1 / 0)
							local v484 = (1 / 0)
							local v485 = (-1 / 0)
							local v486 = (-1 / 0)
							for _, v487 in v482.v do
								local v488 = v487[1]
								v483 = math.min(v483, v488)
								local v489 = v487[2]
								v484 = math.min(v484, v489)
								local v490 = v487[1]
								v485 = math.max(v485, v490)
								local v491 = v487[2]
								v486 = math.max(v486, v491)
							end
							local v492 = Instance.new("Frame")
							v492.BackgroundTransparency = 1
							v492.BorderSizePixel = 0
							v492.ClipsDescendants = true
							v492.Position = UDim2.fromScale(v483 / p461, v484 / p462)
							v492.Size = UDim2.fromScale((v485 - v483) / p461, (v486 - v484) / p462)
							v492.Parent = p459
							v472.Parent = v492
							v476.MatteClip = v492
						end
					end
				end
			end
			v_u_304(v472, v467.ks, p463, p461, p462, v470, v474, v475)
			local v493 = p463 - (v467.st or 0)
			local v494
			if v467.ip <= v493 then
				v494 = v493 < v467.op
			else
				v494 = false
			end
			v472.Visible = v494
			table.insert(v464, v476)
		end
	end
	for _, v495 in v464 do
		local v496 = v495.Layer
		if v496.parent and v465[v496.parent] then
			local v497 = v465[v496.parent]
			v495.Frame.Parent = v497.Frame
		elseif v495.MatteClip == nil then
			v495.Frame.Parent = p459
		end
	end
	for v498 = 1, #v464 - 1 do
		local v499 = v464[v498]
		local v500 = v464[v498 + 1]
		if v500.Layer.tt then
			local v501 = nil
			for _, v502 in v499.Shapes or {} do
				if v502.PathData then
					v501 = v_u_4.EvaluateBezierShape(v502.PathData, p463)
					break
				end
			end
			if v501 then
				local v503 = (1 / 0)
				local v504 = (1 / 0)
				local v505 = (-1 / 0)
				local v506 = (-1 / 0)
				for _, v507 in v501.v do
					local v508 = v507[1]
					v503 = math.min(v503, v508)
					local v509 = v507[2]
					v504 = math.min(v504, v509)
					local v510 = v507[1]
					v505 = math.max(v505, v510)
					local v511 = v507[2]
					v506 = math.max(v506, v511)
				end
				local v512 = Instance.new("Frame")
				v512.BackgroundTransparency = 1
				v512.BorderSizePixel = 0
				v512.ClipsDescendants = true
				v512.Position = UDim2.fromScale(v503 / p461, v504 / p462)
				v512.Size = UDim2.fromScale((v505 - v503) / p461, (v506 - v504) / p462)
				v512.Parent = p459
				v500.Frame.Parent = v512
				v500.MatteClip = v512
				v499.Frame.Visible = false
			end
		end
	end
	return v464
end
local v_u_514 = nil
local function v_u_531(p515, p516, p517, p518)
	-- upvalues: (copy) v_u_304, (ref) v_u_514, (copy) v_u_4, (copy) v_u_531
	for _, v519 in p515 do
		local v520 = v519.Layer
		local v521 = p516 - (v520.st or 0)
		local v522
		if v520.ip <= v521 then
			v522 = v521 < v520.op
		else
			v522 = false
		end
		v519.Frame.Visible = v522
		if v522 then
			local v523 = v519.Frame:IsA("CanvasGroup")
			v_u_304(v519.Frame, v520.ks, v521, p517, p518, v523, v519.BaseSizeX, v519.BaseSizeY)
			if v519.Shapes then
				for _, v524 in v519.Shapes do
					v_u_514(v524, v521, p517, p518)
				end
			end
			if v519.Children then
				local v525 = v520.w or p517
				local v526 = v520.h or p518
				local v527
				if v520.tm then
					v527 = v_u_4.EvaluateScalarAtFrame(v520.tm, v521, 0) * (v520.op - v520.ip)
				else
					v527 = v521
				end
				v_u_531(v519.Children, v527, v525, v526)
			end
			if v519.TextLabel and v520.t then
				local v528 = v520.t.d
				if v528 and v528.k then
					local v529 = nil
					for _, v530 in v528.k do
						if v530.t == nil or v530.t <= v521 then
							v529 = v530.s
						end
					end
					if v529 then
						v519.TextLabel.Text = v529.t or ""
						if v529.fc then
							v519.TextLabel.TextColor3 = Color3.new(v529.fc[1] or 1, v529.fc[2] or 1, v529.fc[3] or 1)
						end
					end
				end
			end
		end
	end
end
v_u_514 = function(p532, p533, p534, p535)
	-- upvalues: (ref) v_u_514, (copy) v_u_4, (copy) v_u_172, (copy) v_u_223
	if p532.Children then
		for _, v536 in p532.Children do
			v_u_514(v536, p533, p534, p535)
		end
	end
	if p532.IsAnimatedPath and p532.PathData then
		local v537 = v_u_4.EvaluateBezierShape(p532.PathData, p533)
		if v537 and p532.Frame then
			local v538 = v_u_4.EvaluateColor(p532.FillColor, p533)
			local v539 = v_u_4.EvaluateScalarAtFrame(p532.FillOpacity, p533, 100)
			if p532.FillColor then
				v_u_172(p532, v537, p532.Frame, p534, p535, v538, 1 - v539 / 100)
			end
			if p532.StrokeColor then
				local v540 = v_u_4.EvaluateColor(p532.StrokeColor, p533)
				local v541 = v_u_4.EvaluateScalarAtFrame(p532.StrokeOpacity, p533, 100)
				local v542 = v_u_4.EvaluateScalarAtFrame(p532.StrokeWidth, p533, 0)
				if v542 > 0 then
					v_u_223(p532, v537, p532.Frame, p534, p535, v540, 1 - v541 / 100, v542)
				end
			end
		end
	elseif p532.FillColor then
		local v543 = p532.FillColor
		local v544
		if v543 == nil then
			v544 = false
		else
			v544 = v543.a == 1
		end
		if v544 then
			local v545 = v_u_4.EvaluateColor(p532.FillColor, p533)
			local v546 = 1 - v_u_4.EvaluateScalarAtFrame(p532.FillOpacity, p533, 100) / 100
			if p532.Triangles then
				for _, v547 in p532.Triangles do
					if v547.A.Visible then
						v547.A.ImageColor3 = v545
						v547.A.ImageTransparency = v546
					end
					if v547.B.Visible then
						v547.B.ImageColor3 = v545
						v547.B.ImageTransparency = v546
					end
				end
			end
			if p532.Frame and p532.Frame.BackgroundTransparency < 1 then
				p532.Frame.BackgroundColor3 = v545
				p532.Frame.BackgroundTransparency = v546
			end
		end
	end
	if p532.StrokeColor then
		local v548 = p532.StrokeColor
		local v549
		if v548 == nil then
			v549 = false
		else
			v549 = v548.a == 1
		end
		if v549 then
			local v550 = v_u_4.EvaluateColor(p532.StrokeColor, p533)
			local v551 = v_u_4.EvaluateScalarAtFrame(p532.StrokeOpacity, p533, 100)
			if p532.Segments then
				for _, v552 in p532.Segments do
					if v552.Visible then
						v552.BackgroundColor3 = v550
						v552.BackgroundTransparency = 1 - v551 / 100
					end
				end
			end
			if p532.UIStroke then
				p532.UIStroke.Color = v550
				p532.UIStroke.Transparency = 1 - v551 / 100
			end
		end
	end
end
return table.freeze({
	["Parse"] = function(p553)
		-- upvalues: (copy) v_u_1
		return v_u_1:JSONDecode(p553)
	end,
	["Create"] = function(p554)
		-- upvalues: (copy) v_u_7, (copy) v_u_513
		local v555 = p554.w
		local v556 = p554.h
		local v557 = p554.ip
		local v558 = p554.op
		local v559 = p554.fr
		local v560 = Instance.new("Frame")
		v560.Name = p554.nm or "LottieAnimation"
		v560.BackgroundTransparency = 1
		v560.BorderSizePixel = 0
		v560.ClipsDescendants = true
		v560.Size = v_u_7
		local v561 = {}
		if p554.assets then
			for _, v562 in p554.assets do
				v561[v562.id] = v562
			end
		end
		return {
			["Animation"] = p554,
			["Root"] = v560,
			["Layers"] = v_u_513(p554.layers, v560, v561, v555, v556, v557),
			["AssetMap"] = v561,
			["Duration"] = (v558 - v557) / v559,
			["Width"] = v555,
			["Height"] = v556
		}
	end,
	["Render"] = function(p563, p564)
		-- upvalues: (copy) v_u_531
		local v565 = p563.Animation
		local v566 = v565.ip
		local v567 = v565.op
		local v568 = v565.fr
		local v569 = v567 - v566
		local v570 = v566 + p564 * v568 % v569
		v_u_531(p563.Layers, v570, p563.Width, p563.Height)
	end,
	["Destroy"] = function(p571)
		p571.Root:Destroy()
		table.clear(p571.Layers)
		table.clear(p571.AssetMap)
	end
})