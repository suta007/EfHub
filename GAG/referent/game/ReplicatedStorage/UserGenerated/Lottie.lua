local v1 = not game:GetService("RunService"):IsClient()
assert(v1)
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("AssetService")
local v_u_4 = game:GetService("EncodingService")
require(script.Types)
local v_u_5 = require(script.Easing)
local v_u_6 = Rect.new(64, 64, 192, 192)
local v_u_7 = UDim2.fromScale(0, 0)
local v_u_8 = UDim2.fromScale(1, 1)
local v9, v_u_10 = pcall(require, script.PNG)
if not v9 then
	v_u_10 = nil
end
local function v_u_18(p11)
	local v12 = string.sub(p11, 2, 3)
	local v13 = tonumber(v12, 16) or 0
	local v14 = string.sub(p11, 4, 5)
	local v15 = tonumber(v14, 16) or 0
	local v16 = string.sub(p11, 6, 7)
	local v17 = tonumber(v16, 16) or 0
	return Color3.fromRGB(v13, v15, v17)
end
local function v_u_37(p19, p20, p21, p22, p23, p24, p25, p26, p27, p28)
	for v29 = 1, p27 do
		local v30 = v29 / p27
		local v31 = 1 - v30
		local v32 = v31 * v31
		local v33 = v32 * v31
		local v34 = v30 * v30
		local v35 = v34 * v30
		local v36 = { v33 * p19 + v32 * 3 * v30 * p21 + v31 * 3 * v34 * p23 + v35 * p25, v33 * p20 + v32 * 3 * v30 * p22 + v31 * 3 * v34 * p24 + v35 * p26 }
		table.insert(p28, v36)
	end
end
local function v_u_64(p38)
	-- upvalues: (copy) v_u_37
	local v39 = p38.v
	local v40 = p38.i
	local v41 = p38.o
	local v42 = #v39
	if v42 == 0 then
		return {}
	end
	local v43 = {
		{ v39[1][1], v39[1][2] }
	}
	local v44
	if p38.c then
		v44 = v42
	else
		v44 = v42 - 1
	end
	for v45 = 1, v44 do
		local v46 = v45 >= v42 and 1 or v45 + 1
		local v47 = v39[v45]
		local v48 = v39[v46]
		local v49 = v41[v45]
		local v50 = v40[v46]
		local v51 = v47[1]
		local v52 = v47[2]
		local v53 = v51 + v49[1]
		local v54 = v52 + v49[2]
		local v55 = v48[1] + v50[1]
		local v56 = v48[2] + v50[2]
		local v57 = v48[1]
		local v58 = v48[2]
		local v59 = v49[1]
		local v60
		if math.abs(v59) < 0.01 then
			local v61 = v49[2]
			if math.abs(v61) < 0.01 then
				local v62 = v50[1]
				if math.abs(v62) < 0.01 then
					local v63 = v50[2]
					v60 = math.abs(v63) < 0.01
				else
					v60 = false
				end
			else
				v60 = false
			end
		else
			v60 = false
		end
		if v60 then
			table.insert(v43, { v57, v58 })
		else
			v_u_37(v51, v52, v53, v54, v55, v56, v57, v58, 12, v43)
		end
	end
	return v43
end
local function v_u_76(p65, p66, p67, p68, p69, p70, p71, p72)
	local v73 = (p67 - p65) * (p70 - p66) - (p68 - p66) * (p69 - p65)
	local v74 = (p69 - p65) * (p72 - p66) - (p70 - p66) * (p71 - p65)
	local v75 = (p71 - p65) * (p68 - p66) - (p72 - p66) * (p67 - p65)
	return (v73 >= 0 and v74 >= 0 and v75 >= 0 or v73 <= 0 and v74 <= 0 and v75 <= 0) and true or false
end
local function v_u_90(p77)
	local v78 = #p77
	if v78 < 3 then
		return false
	end
	local v79 = 0
	for v80 = 1, v78 do
		local v81 = v80 >= v78 and 1 or v80 + 1
		local v82 = v81 >= v78 and 1 or v81 + 1
		local v83 = p77[v80][1]
		local v84 = p77[v80][2]
		local v85 = p77[v81][1]
		local v86 = p77[v81][2]
		local v87 = p77[v82][1]
		local v88 = p77[v82][2]
		local v89 = (v85 - v83) * (v88 - v84) - (v86 - v84) * (v87 - v83)
		if v89 ~= 0 then
			if v79 == 0 then
				if v89 > 0 then
					v79 = 1
				else
					v79 = -1
				end
			elseif v89 > 0 and v79 < 0 or v89 < 0 and v79 > 0 then
				return false
			end
		end
	end
	return true
end
local function v_u_95(p91)
	local v92 = {}
	for v93 = 2, #p91 - 1 do
		local v94 = { p91[1], p91[v93], p91[v93 + 1] }
		table.insert(v92, v94)
	end
	return v92
end
local function v_u_122(p96)
	-- upvalues: (copy) v_u_90, (copy) v_u_95, (copy) v_u_76
	local v97 = #p96
	if v97 < 3 then
		return {}
	end
	if v97 == 3 then
		return {
			{ p96[1], p96[2], p96[3] }
		}
	end
	if v_u_90(p96) then
		return v_u_95(p96)
	end
	local v98 = table.create(v97)
	local v99 = 0
	for v100 = 1, v97 do
		v98[v100] = v100
		local v101 = v100 >= v97 and 1 or v100 + 1
		v99 = v99 + (p96[v101][1] - p96[v100][1]) * (p96[v101][2] + p96[v100][2])
	end
	local v102
	if v99 > 0 then
		v102 = table.create(v97)
		for v103 = 1, v97 do
			v102[v103] = v98[v97 - v103 + 1]
		end
	else
		v102 = v98
	end
	local v104 = #v102
	local v105 = v104 * v104
	local v106 = 0
	local v107 = 1
	local v108 = {}
	while true do
		while true do
			if v104 <= 2 or v106 >= v105 then
				return v108
			end
			v106 = v106 + 1
			v107 = v104 < v107 and 1 or v107
			local v109
			if v107 > 1 then
				v109 = v107 - 1
			else
				v109 = v104
			end
			local v110 = v107 >= v104 and 1 or v107 + 1
			local v111 = p96[v102[v109]]
			local v112 = p96[v102[v107]]
			local v113 = p96[v102[v110]]
			local v114 = v111[1]
			local v115 = v111[2]
			local v116 = v112[1]
			local v117 = v112[2]
			local v118 = v113[1]
			local v119 = v113[2]
			if (v116 - v114) * (v119 - v115) - (v117 - v115) * (v118 - v114) <= 0 then
				break
			end
			local v120 = true
			for v121 = 1, v104 do
				if v121 ~= v109 and (v121 ~= v107 and (v121 ~= v110 and v_u_76(p96[v102[v121]][1], p96[v102[v121]][2], v111[1], v111[2], v112[1], v112[2], v113[1], v113[2]))) then
					v120 = false
					break
				end
			end
			if not v120 then
				goto l30
			end
			table.insert(v108, { v111, v112, v113 })
			table.remove(v102, v107)
			v104 = v104 - 1
			if v104 < v107 then
				v107 = 1
			end
		end
		::l30::
		v107 = v107 + 1
	end
end
local function v_u_153(p123, p124, p125, p126, p127, p128, p129, p130, p131)
	local v132 = p126 - p124
	local v133 = p127 - p125
	local v134 = p128 - p124
	local v135 = p129 - p125
	if v132 * v135 - v133 * v134 < 0 then
		v132 = p128 - p124
		v133 = p129 - p125
		v134 = p126 - p124
		v135 = p127 - p125
	end
	local v136 = v132 * v132 + v133 * v133
	local v137 = math.sqrt(v136)
	local v138 = v134 * v134 + v135 * v135
	local v139 = math.sqrt(v138)
	if v137 < 1e-6 or v139 < 1e-6 then
		p123.A.Visible = false
		p123.B.Visible = false
		return
	else
		local v140 = v132 / v137
		local v141 = v133 / v137
		local v142 = v134 * v140 + v135 * v141
		local v143 = v134 - v140 * v142
		local v144 = v135 - v141 * v142
		local v145 = v143 * v143 + v144 * v144
		local v146 = math.sqrt(v145)
		if v146 < 1e-6 then
			p123.A.Visible = false
			p123.B.Visible = false
		else
			local v147 = math.atan2(v141, v140) * 57.29577951308232
			local v148 = p123.A
			v148.Visible = true
			v148.Position = UDim2.fromScale(p124, p125)
			v148.Size = UDim2.fromScale(math.max(v142, 0.0001), v146)
			v148.Rotation = v147
			v148.AnchorPoint = Vector2.zero
			v148.ImageColor3 = p130
			v148.ImageTransparency = p131
			local v149 = p123.B
			local v150 = v137 - v142
			v149.Visible = v150 > 1e-6
			if v149.Visible then
				local v151 = p124 + v140 * v137
				local v152 = p125 + v141 * v137
				v149.Position = UDim2.fromScale(v151, v152)
				v149.Size = UDim2.fromScale(math.max(v150, 0.0001), v146)
				v149.Rotation = v147 + 180
				v149.AnchorPoint = Vector2.zero
				v149.ImageColor3 = p130
				v149.ImageTransparency = p131
			end
		end
	end
end
local function v_u_173(p154, p155, p156, p157, p158, p159, p160)
	-- upvalues: (copy) v_u_64, (copy) v_u_122, (copy) v_u_153
	local v161 = v_u_64(p155)
	if #v161 >= 3 then
		local v162 = table.create(#v161)
		for v163, v164 in v161 do
			v162[v163] = { v164[1] / p157, v164[2] / p158 }
		end
		local v165 = v_u_122(v162)
		local v166 = p154.Triangles or {}
		for v167, v168 in v165 do
			local v169
			if v167 <= #v166 then
				v169 = v166[v167]
			else
				v169 = {}
				local v170 = Instance.new("ImageLabel")
				v170.Image = "rbxassetid://83051256678409"
				v170.BackgroundTransparency = 1
				v170.BorderSizePixel = 0
				v170.Size = UDim2.fromScale(1, 1)
				v170.Parent = p156
				v169.A = v170
				local v171 = Instance.new("ImageLabel")
				v171.Image = "rbxassetid://83051256678409"
				v171.BackgroundTransparency = 1
				v171.BorderSizePixel = 0
				v171.Size = UDim2.fromScale(1, 1)
				v171.Parent = p156
				v169.B = v171
				table.insert(v166, v169)
			end
			v_u_153(v169, v168[1][1], v168[1][2], v168[2][1], v168[2][2], v168[3][1], v168[3][2], p159, p160)
		end
		for v172 = #v165 + 1, #v166 do
			v166[v172].A.Visible = false
			v166[v172].B.Visible = false
		end
		p154.Triangles = v166
	end
end
local function v_u_224(p174, p175, p176, p177, p178, p179, p180, p181, p182, p183, p184, p185)
	-- upvalues: (copy) v_u_64, (copy) v_u_5
	local v186 = v_u_64(p175)
	if #v186 < 2 then
		return
	end
	local v187 = p174.Segments or {}
	local v188 = 0
	local v189 = { 0 }
	local v190 = p184 or 100
	local v191 = p185 or 0
	local v192 = p183 or 0
	for v193 = 2, #v186 do
		local v194 = v186[v193][1] - v186[v193 - 1][1]
		local v195 = v186[v193][2] - v186[v193 - 1][2]
		local v196 = v194 * v194 + v195 * v195
		v188 = v188 + math.sqrt(v196)
		v189[v193] = v188
	end
	local v197 = nil
	local v198
	if p182 then
		v198 = {}
		for _, v199 in p182 do
			if v199.v then
				local v200 = v_u_5.EvaluateScalar
				local v201 = v199.v
				table.insert(v198, v200(v201, 0))
			end
		end
		if #v198 <= 0 then
			v198 = v197
		end
	else
		v198 = v197
	end
	local v202 = p181 / math.min(p177, p178)
	local v203 = 0
	for v204 = 2, #v186 do
		local v205 = v186[v204 - 1]
		local v206 = v186[v204]
		local v207 = v206[1] - v205[1]
		local v208 = v206[2] - v205[2]
		local v209 = v207 * v207 + v208 * v208
		local v210 = math.sqrt(v209)
		if v210 >= 0.01 then
			local v211 = ((v189[v204 - 1] + v189[v204]) * 0.5 / math.max(v188, 1e-6) * 100 + v191) % 100
			if v211 >= v192 and v190 >= v211 then
				local v212 = true
				if v198 then
					local v213 = v189[v204 - 1]
					local v214 = 0
					for _, v215 in v198 do
						v214 = v214 + v215
					end
					if v214 > 0 then
						local v216 = v213 % v214
						local v217 = 0
						for v218, v219 in v198 do
							v217 = v217 + v219
							if v216 < v217 then
								v212 = v218 % 2 == 1
								break
							end
						end
					end
				end
				v203 = v203 + 1
				local v220
				if v203 <= #v187 then
					v220 = v187[v203]
				else
					v220 = Instance.new("Frame")
					v220.BorderSizePixel = 0
					v220.AnchorPoint = Vector2.new(0, 0.5)
					v220.Parent = p176
					table.insert(v187, v220)
				end
				v220.Visible = v212
				if v212 then
					local v221 = math.atan2(v208, v207) * 57.29577951308232
					local v222 = v210 / p177
					v220.Position = UDim2.fromScale(v205[1] / p177, v205[2] / p178)
					v220.Size = UDim2.fromScale(v222, v202)
					v220.Rotation = v221
					v220.BackgroundColor3 = p179
					v220.BackgroundTransparency = p180
				end
			end
		end
	end
	for v223 = v203 + 1, #v187 do
		v187[v223].Visible = false
	end
	p174.Segments = v187
end
local function v_u_250(p225, p226, p227, p228, p229)
	-- upvalues: (copy) v_u_5
	local v230 = Instance.new("UIGradient")
	local v231 = p226.p
	local v232 = p226.k
	local v233 = v_u_5.EvaluateVector(v232, p229, {})
	local v234 = {}
	for v235 = 0, v231 - 1 do
		local v236 = v235 * 4
		local v237 = v233[v236 + 1]
		if not v237 then
			local v238 = v231 - 1
			v237 = v235 / math.max(v238, 1)
		end
		local v239 = v233[v236 + 2] or 1
		local v240 = v233[v236 + 3] or 1
		local v241 = v233[v236 + 4] or 1
		local v242 = ColorSequenceKeypoint.new
		local v243 = math.clamp(v237, 0, 1)
		local v244 = Color3.new
		table.insert(v234, v242(v243, v244(v239, v240, v241)))
	end
	local v245 = #v234 < 2 and { ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) } or v234
	v230.Color = ColorSequence.new(v245)
	local v246 = v_u_5.EvaluateVector(p227, p229, { 0, 0 })
	local v247 = v_u_5.EvaluateVector(p228, p229, { 1, 0 })
	local v248 = v247[1] - v246[1]
	local v249 = v247[2] - v246[2]
	v230.Rotation = math.atan2(v249, v248) * 57.29577951308232
	v230.Parent = p225
	return v230
end
local function v_u_282(p251, p252, p253, p254, p255, p256, p257)
	-- upvalues: (copy) v_u_5
	local v258 = p252.p
	local v259 = v_u_5.EvaluateVector(p252.k, p255, {})
	local v260 = v_u_5.EvaluateVector(p253, p255, { p256 / 2, p257 / 2 })
	local v261 = v_u_5.EvaluateVector(p254, p255, { p256, p257 / 2 })
	local v262 = v260[1]
	local v263 = v260[2]
	local v264 = v261[1] - v262
	local v265 = v261[2] - v263
	local v266 = v264 * v264 + v265 * v265
	local v267 = math.sqrt(v266)
	local v268 = math.min(v258, 6)
	local v269 = {}
	for v270 = v268, 1, -1 do
		local v271 = v270 / v268
		local v272 = v271 * (v258 - 1)
		local v273 = math.floor(v272)
		local v274 = v258 - 1
		local v275 = math.min(v273, v274) * 4
		local v276 = v259[v275 + 2] or 1
		local v277 = v259[v275 + 3] or 1
		local v278 = v259[v275 + 4] or 1
		local v279 = v267 * 2 * v271
		local v280 = Instance.new("Frame")
		v280.AnchorPoint = Vector2.new(0.5, 0.5)
		v280.Position = UDim2.fromScale(v262 / p256, v263 / p257)
		v280.Size = UDim2.fromScale(v279 / p256, v279 / p257)
		v280.BackgroundColor3 = Color3.new(v276, v277, v278)
		v280.BackgroundTransparency = 0
		v280.BorderSizePixel = 0
		local v281 = Instance.new("UICorner")
		v281.CornerRadius = UDim.new(0.5, 0)
		v281.Parent = v280
		v280.Parent = p251
		table.insert(v269, v280)
	end
	return v269
end
local function v_u_305(p283, p284, p285, p286, p287, p288, p289, p290)
	-- upvalues: (copy) v_u_5
	if p284 ~= nil then
		local v291 = p284.p
		local v292
		if v291 == nil or type(v291) ~= "table" then
			v292 = { 0, 0 }
		elseif v291.s == true then
			v292 = { v_u_5.EvaluateScalarAtFrame(v291.x, p285, 0), (v_u_5.EvaluateScalarAtFrame(v291.y, p285, 0)) }
		else
			v292 = v_u_5.EvaluateVector(v291, p285, { 0, 0 })
		end
		local v293 = v_u_5.EvaluateVector(p284.s, p285, { 100, 100 })
		local v294 = v_u_5.EvaluateScalarAtFrame(p284.r, p285, 0)
		local v295 = v_u_5.EvaluateScalarAtFrame(p284.o, p285, 100)
		local v296 = v_u_5.EvaluateVector(p284.a, p285, { 0, 0 })
		local v297 = v293[1] / 100
		local v298 = v293[2] / 100
		p283.Position = UDim2.fromScale(v292[1] / p286, v292[2] / p287)
		p283.Rotation = v294
		p283.Size = UDim2.fromScale(p289 * v297, p290 * v298)
		if p288 then
			p283.GroupTransparency = 1 - v295 / 100
		end
		local v299 = p289 * v297 * p286
		local v300 = p290 * v298 * p287
		if (v296[1] ~= 0 or v296[2] ~= 0) and (v299 > 0 and v300 > 0) then
			local v301 = Vector2.new
			local v302 = v296[1] / v299
			local v303 = math.clamp(v302, 0, 1)
			local v304 = v296[2] / v300
			p283.AnchorPoint = v301(v303, (math.clamp(v304, 0, 1)))
		end
	end
end
local function v_u_322(p306)
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
	local v319 = nil
	for _, v320 in p306 do
		if not v320.hd then
			local v321 = v320.ty
			if v321 == "fl" then
				v312 = v320.c
				v313 = v320.o
			elseif v321 == "st" then
				v314 = v320.c
				v315 = v320.o
				v316 = v320.w
				v318 = v320.da
			elseif v321 == "sh" then
				v317 = v320.ks
			elseif v321 == "tr" then
				v310 = v320
			elseif v321 == "tm" then
				v319 = v320.s
				v307 = v320.e
				v308 = v320.o
				v309 = v320.m
			elseif v321 == "mm" then
				v311 = v320.mm
			end
		end
	end
	return v312, v313, v314, v315, v316, v317, v318, v319, v307, v308, v309, v310, v311
end
local function v_u_396(p323, p324, p325, p326, p327)
	-- upvalues: (copy) v_u_322, (copy) v_u_8, (copy) v_u_7, (copy) v_u_305, (copy) v_u_5, (copy) v_u_173, (copy) v_u_224, (copy) v_u_250, (copy) v_u_282, (copy) v_u_396
	local v328 = p323.it or {}
	local v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, _, v339, _ = v_u_322(v328)
	local v340 = false
	for _, v341 in v328 do
		if v341.ty == "tr" then
			local v342 = v341.o
			local v343
			if v342 == nil then
				v343 = false
			else
				v343 = v342.a == 1
			end
			if v343 then
				v340 = true
				break
			end
		end
	end
	local v344
	if v340 then
		v344 = Instance.new("CanvasGroup")
	else
		v344 = Instance.new("Frame")
	end
	v344.BackgroundTransparency = 1
	v344.BorderSizePixel = 0
	v344.Size = v_u_8
	v344.Position = v_u_7
	v344.Parent = p324
	if v339 then
		v_u_305(v344, {
			["a"] = v339.a,
			["p"] = v339.p,
			["s"] = v339.s,
			["r"] = v339.r,
			["o"] = v339.o
		}, p327, p325, p326, v340, 1, 1)
	end
	local v345 = {
		["Shape"] = p323,
		["Frame"] = v344,
		["Children"] = {},
		["FillColor"] = v329,
		["FillOpacity"] = v330,
		["StrokeColor"] = v331,
		["StrokeOpacity"] = v332,
		["StrokeWidth"] = v333,
		["PathData"] = v334
	}
	local v346
	if v334 == nil then
		v346 = false
	else
		v346 = v334.a == 1
	end
	v345.IsAnimatedPath = v346
	local v347 = v_u_5.EvaluateColor(v329, p327)
	local v348 = 1 - v_u_5.EvaluateScalarAtFrame(v330, p327, 100) / 100
	local v349 = v_u_5.EvaluateColor(v331, p327)
	local v350 = 1 - v_u_5.EvaluateScalarAtFrame(v332, p327, 100) / 100
	local v351 = v_u_5.EvaluateScalarAtFrame(v333, p327, 0)
	local v352 = v_u_5.EvaluateScalarAtFrame(v336, p327, 0)
	local v353 = v_u_5.EvaluateScalarAtFrame(v337, p327, 100)
	local v354 = v_u_5.EvaluateScalarAtFrame(v338, p327, 0)
	local v355 = 0
	for _, v356 in v328 do
		if v356.ty == "op" and v356.a then
			v355 = v_u_5.EvaluateScalarAtFrame(v356.a, p327, 0)
		end
	end
	for _, v357 in v328 do
		if not v357.hd then
			local v358 = v357.ty
			if v358 == "sh" then
				local v359 = v_u_5.EvaluateBezierShape(v357.ks, p327)
				if v359 and v355 ~= 0 then
					local v360 = 0
					local v361 = 0
					for _, v362 in v359.v do
						v360 = v360 + v362[1]
						v361 = v361 + v362[2]
					end
					local v363 = v360 / #v359.v
					local v364 = v361 / #v359.v
					local v365 = (v359.v[1][1] - v363) ^ 2 + (v359.v[1][2] - v364) ^ 2
					local v366 = math.sqrt(v365)
					local v367 = v355 / math.max(v366, 1) + 1
					local v368 = table.create(#v359.v)
					for v369, v370 in v359.v do
						v368[v369] = { v363 + (v370[1] - v363) * v367, v364 + (v370[2] - v364) * v367 }
					end
					v359 = {
						["v"] = v368,
						["i"] = v359.i,
						["o"] = v359.o,
						["c"] = v359.c
					}
				end
				if v359 then
					if v329 then
						v_u_173(v345, v359, v344, p325, p326, v347, v348)
					end
					if v331 and v351 > 0 then
						v_u_224(v345, v359, v344, p325, p326, v349, v350, v351, v335, v352, v353, v354)
					end
				end
			elseif v358 == "rc" then
				local v371 = Instance.new("Frame")
				v371.BorderSizePixel = 0
				local v372 = v_u_5.EvaluateVector(v357.s, p327, { 100, 100 })
				local v373 = v_u_5.EvaluateVector(v357.p, p327, { 0, 0 })
				local v374 = v_u_5.EvaluateScalarAtFrame(v357.r, p327, 0)
				v371.Size = UDim2.fromScale(v372[1] / p325, v372[2] / p326)
				v371.Position = UDim2.fromScale(v373[1] / p325, v373[2] / p326)
				v371.AnchorPoint = Vector2.new(0.5, 0.5)
				if v329 then
					v371.BackgroundColor3 = v347
					v371.BackgroundTransparency = v348
				else
					v371.BackgroundTransparency = 1
				end
				if v374 > 0 then
					local v375 = Instance.new("UICorner")
					v375.CornerRadius = UDim.new(0, v374)
					v375.Parent = v371
					v345.UICorner = v375
				end
				if v331 and v351 > 0 then
					local v_u_376 = Instance.new("UIStroke")
					v_u_376.Color = v349
					v_u_376.Transparency = v350
					v_u_376.Thickness = v351 / math.min(p325, p326)
					v_u_376.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					if not pcall(function()
						-- upvalues: (copy) v_u_376
						v_u_376.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
					end) then
						v_u_376.Thickness = v351
					end
					v_u_376.Parent = v371
					v345.UIStroke = v_u_376
				end
				v371.Parent = v344
				v345.Frame = v371
			elseif v358 == "el" then
				local v377 = Instance.new("Frame")
				v377.BorderSizePixel = 0
				local v378 = v_u_5.EvaluateVector(v357.s, p327, { 100, 100 })
				local v379 = v_u_5.EvaluateVector(v357.p, p327, { 0, 0 })
				v377.Size = UDim2.fromScale(v378[1] / p325, v378[2] / p326)
				v377.Position = UDim2.fromScale(v379[1] / p325, v379[2] / p326)
				v377.AnchorPoint = Vector2.new(0.5, 0.5)
				if v329 then
					v377.BackgroundColor3 = v347
					v377.BackgroundTransparency = v348
				else
					v377.BackgroundTransparency = 1
				end
				local v380 = Instance.new("UICorner")
				v380.CornerRadius = UDim.new(0.5, 0)
				v380.Parent = v377
				v345.UICorner = v380
				if v331 and v351 > 0 then
					local v_u_381 = Instance.new("UIStroke")
					v_u_381.Color = v349
					v_u_381.Transparency = v350
					v_u_381.Thickness = v351 / math.min(p325, p326)
					v_u_381.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					pcall(function()
						-- upvalues: (copy) v_u_381
						v_u_381.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
					end)
					v_u_381.Parent = v377
					v345.UIStroke = v_u_381
				end
				v377.Parent = v344
				v345.Frame = v377
			elseif v358 == "gf" or v358 == "gs" then
				local v382 = v357.t or 1
				if v357.g then
					if v382 == 1 then
						v345.UIGradient = v_u_250(v344, v357.g, v357.s, v357.e, p327)
					elseif v382 == 2 then
						v_u_282(v344, v357.g, v357.s, v357.e, p327, p325, p326)
					end
				end
			elseif v358 == "gr" then
				local v383 = v_u_396(v357, v344, p325, p326, p327)
				if v345.Children then
					local v384 = v345.Children
					table.insert(v384, v383)
				end
			elseif v358 == "rp" then
				local v385 = v_u_5.EvaluateScalarAtFrame(v357.c, p327, 1)
				local v386 = v357.tr
				if v386 and v385 > 1 then
					local v387 = v_u_5.EvaluateScalarAtFrame(v386.so, p327, 100)
					local v388 = v_u_5.EvaluateScalarAtFrame(v386.eo, p327, 100)
					for v389 = 0, math.floor(v385) - 1 do
						local v390 = Instance.new("Frame")
						v390.BackgroundTransparency = 1
						v390.BorderSizePixel = 0
						v390.Size = v_u_8
						local v391 = v385 - 1
						local v392 = v389 / math.max(v391, 1)
						v390.BackgroundTransparency = 1 - math.lerp(v387, v388, v392) / 100
						local _ = {
							["p"] = v386.p,
							["s"] = v386.s,
							["r"] = v386.r,
							["a"] = v386.a,
							["o"] = v386.o
						}
						local v393 = v_u_5.EvaluateVector(v386.p, p327, { 0, 0 })
						v_u_5.EvaluateVector(v386.s, p327, { 100, 100 })
						local v394 = v_u_5.EvaluateScalarAtFrame(v386.r, p327, 0)
						v390.Position = UDim2.fromScale(v393[1] * v389 / p325, v393[2] * v389 / p326)
						v390.Rotation = v394 * v389
						v390.Parent = v344
						for _, v395 in v328 do
							if v395.ty == "gr" and v395 ~= p323 then
								v_u_396(v395, v390, p325, p326, p327)
							end
						end
					end
				end
			end
		end
	end
	return v345
end
local function v_u_407(p397, p398, p399, p400, p401)
	-- upvalues: (copy) v_u_396
	local v402 = p397.shapes
	if v402 == nil then
		return {}
	end
	local v403 = {}
	for v404 = #v402, 1, -1 do
		local v405 = v402[v404]
		if not v405.hd and v405.ty == "gr" then
			local v406 = v_u_396(v405, p398, p399, p400, p401)
			table.insert(v403, v406)
		end
	end
	return v403
end
local function v_u_422(p408, p409, _, p410, p411)
	-- upvalues: (copy) v_u_8
	local v412 = p408.t
	if v412 == nil then
		return nil
	end
	local v413 = v412.d
	if v413 == nil then
		return nil
	end
	local v414 = v413.k
	if v414 == nil or #v414 == 0 then
		return nil
	end
	local v_u_415 = nil
	for _, v416 in v414 do
		if v416.t == nil or v416.t <= p411 then
			v_u_415 = v416.s
		end
	end
	if v_u_415 == nil then
		v_u_415 = v414[1].s
	end
	if v_u_415 == nil then
		return nil
	end
	local v417 = Instance.new("TextLabel")
	v417.BackgroundTransparency = 1
	v417.BorderSizePixel = 0
	v417.Size = v_u_8
	v417.Text = v_u_415.t or ""
	v417.TextScaled = false
	v417.RichText = false
	v417.TextSize = (v_u_415.s or 24) / p410 * 100
	if v_u_415.fc then
		local v418 = v_u_415.fc
		v417.TextColor3 = Color3.new(v418[1] or 1, v418[2] or 1, v418[3] or 1)
	end
	local v419 = v_u_415.j or 0
	if v419 == 0 then
		v417.TextXAlignment = Enum.TextXAlignment.Left
	elseif v419 == 1 then
		v417.TextXAlignment = Enum.TextXAlignment.Right
	else
		v417.TextXAlignment = Enum.TextXAlignment.Center
	end
	v417.TextYAlignment = Enum.TextYAlignment.Top
	if v_u_415.f then
		local v420, v421 = pcall(function()
			-- upvalues: (ref) v_u_415
			return Enum.Font[v_u_415.f]
		end)
		if v420 and v421 then
			v417.Font = v421
		else
			v417.Font = Enum.Font.GothamMedium
		end
	end
	v417.Parent = p409
	return v417
end
local function v_u_436(p423, p424, p425, _, _)
	-- upvalues: (copy) v_u_8, (ref) v_u_10, (copy) v_u_4, (copy) v_u_3
	local v426 = p423.refId
	if v426 == nil then
		return nil
	end
	local v427 = p425[v426]
	if v427 == nil then
		return nil
	end
	local v428 = Instance.new("ImageLabel")
	v428.BackgroundTransparency = 1
	v428.BorderSizePixel = 0
	v428.Size = v_u_8
	v428.ScaleType = Enum.ScaleType.Stretch
	if v427.e == 1 and v427.p then
		local v429 = v427.p
		if string.sub(v429, 1, 22) == "data:image/png;base64," then
			local v_u_430 = string.sub(v429, 23)
			if v_u_10 then
				local v432, v_u_433 = pcall(function()
					-- upvalues: (ref) v_u_4, (copy) v_u_430, (ref) v_u_10
					local v431 = v_u_4:Base64Decode(buffer.fromstring(v_u_430))
					return v_u_10.decode(v431)
				end)
				if v432 and v_u_433 then
					local v434, v_u_435 = pcall(function()
						-- upvalues: (ref) v_u_3, (copy) v_u_433
						return v_u_3:CreateEditableImage({
							["Size"] = Vector2.new(v_u_433.width, v_u_433.height)
						})
					end)
					if v434 and (v_u_435 and pcall(function()
						-- upvalues: (copy) v_u_435, (copy) v_u_433
						v_u_435:WritePixelsBuffer(Vector2.zero, Vector2.new(v_u_433.width, v_u_433.height), v_u_433.pixels)
					end)) then
						v428.ImageContent = Content.fromObject(v_u_435)
					end
				end
			end
		elseif string.sub(v429, 1, 23) == "data:image/jpeg;base64," then
			warn("[Lottie] Embedded JPEG not supported, skipping image layer:", p423.nm or "")
		end
	elseif v427.p and not v427.e then
		v428.Image = v427.p
	end
	v428.Parent = p424
	return v428
end
local function v_u_458(p437, p438, p439, p440, p441)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v442 = p437.ef
	if v442 ~= nil then
		for _, v443 in v442 do
			if v443.ty == 25 then
				local v444 = v443.ef
				if v444 ~= nil then
					local v445 = Color3.new(0, 0, 0)
					local v446 = 0
					local v447 = 5
					local v448 = 5
					local v449 = 0.5
					for _, v450 in v444 do
						local v451 = v450.ty
						if v451 ~= nil then
							if v451 == 1 then
								v445 = v_u_5.EvaluateColor(v450.v, p441)
							elseif v451 == 0 then
								v449 = v_u_5.EvaluateScalarAtFrame(v450.v, p441, 128) / 255
							elseif v451 == 3 then
								v446 = v_u_5.EvaluateScalarAtFrame(v450.v, p441, 0)
							elseif v451 == 2 then
								v447 = v_u_5.EvaluateScalarAtFrame(v450.v, p441, 5)
							elseif v451 == 4 then
								v448 = v_u_5.EvaluateScalarAtFrame(v450.v, p441, 5)
							end
						end
					end
					local v452 = v446 + 180
					local v453 = math.rad(v452)
					local v454 = math.cos(v453) * v447 / p439
					local v455 = math.sin(v453) * v447 / p440
					local v456 = (v448 * 2 + math.max(p439, p440)) / math.max(p439, p440)
					local v457 = Instance.new("ImageLabel")
					v457.Image = "rbxassetid://100849323991833"
					v457.ScaleType = Enum.ScaleType.Slice
					v457.SliceCenter = v_u_6
					v457.ImageColor3 = v445
					v457.ImageTransparency = 1 - v449
					v457.BackgroundTransparency = 1
					v457.BorderSizePixel = 0
					v457.AnchorPoint = Vector2.new(0.5, 0.5)
					v457.Position = UDim2.fromScale(v454 + 0.5, v455 + 0.5)
					v457.Size = UDim2.fromScale(v456, v456)
					v457.ZIndex = -1
					v457.Parent = p438
					return
				end
			end
		end
	end
end
local function v_u_514(p459, p460, p461, p462, p463, p464)
	-- upvalues: (copy) v_u_18, (copy) v_u_8, (copy) v_u_407, (copy) v_u_422, (copy) v_u_436, (copy) v_u_514, (copy) v_u_458, (copy) v_u_5, (copy) v_u_305
	local v465 = {}
	local v466 = {}
	for v467 = #p459, 1, -1 do
		local v468 = p459[v467]
		if not v468.hd then
			local v469 = v468.ty
			local v470 = v468.ks
			local v471
			if v470 == nil then
				v471 = false
			else
				local v472 = v470.o
				if v472 == nil then
					v471 = false
				else
					v471 = v472.a == 1
				end
			end
			local v473
			if v469 == 1 then
				v473 = Instance.new("Frame")
				v473.BorderSizePixel = 0
				local v474
				if v468.sc then
					v474 = v_u_18(v468.sc)
				else
					v474 = Color3.new(0, 0, 0)
				end
				v473.BackgroundColor3 = v474
				v473.BackgroundTransparency = 0
				v473.Size = UDim2.fromScale((v468.sw or p462) / p462, (v468.sh or p463) / p463)
			elseif v471 then
				v473 = Instance.new("CanvasGroup")
				v473.BackgroundTransparency = 1
				v473.BorderSizePixel = 0
				v473.Size = v_u_8
			else
				v473 = Instance.new("Frame")
				v473.BackgroundTransparency = 1
				v473.BorderSizePixel = 0
				v473.Size = v_u_8
			end
			v473.Name = v468.nm or ("Layer_%*"):format(v468.ind or v467)
			local v475 = v473.Size.X.Scale
			local v476 = v473.Size.Y.Scale
			local v477 = {
				["Layer"] = v468,
				["Frame"] = v473,
				["BaseSizeX"] = v475,
				["BaseSizeY"] = v476
			}
			if v468.ind then
				v466[v468.ind] = v477
			end
			if v469 == 4 then
				v477.Shapes = v_u_407(v468, v473, p462, p463, p464)
			elseif v469 == 5 then
				v477.TextLabel = v_u_422(v468, v473, p462, p463, p464)
			elseif v469 == 2 then
				v477.ImageLabel = v_u_436(v468, v473, p461, p462, p463)
			elseif v469 == 0 then
				local v478 = v468.refId
				if v478 and p461[v478] then
					local v479 = p461[v478]
					if v479.layers then
						local v480 = v468.w or (v479.w or p462)
						local v481 = v468.h or (v479.h or p463)
						v473.ClipsDescendants = true
						v473.Size = UDim2.fromScale(v480 / p462, v481 / p463)
						v477.Children = v_u_514(v479.layers, v473, p461, v480, v481, p464)
					end
				end
			end
			v_u_458(v468, v473, p462, p463, p464)
			if v468.masksProperties then
				for _, v482 in v468.masksProperties do
					if v482.mode == "a" or v482.mode == nil then
						local v483 = v_u_5.EvaluateBezierShape(v482.pt, p464)
						if v483 then
							local v484 = (1 / 0)
							local v485 = (1 / 0)
							local v486 = (-1 / 0)
							local v487 = (-1 / 0)
							for _, v488 in v483.v do
								local v489 = v488[1]
								v484 = math.min(v484, v489)
								local v490 = v488[2]
								v485 = math.min(v485, v490)
								local v491 = v488[1]
								v486 = math.max(v486, v491)
								local v492 = v488[2]
								v487 = math.max(v487, v492)
							end
							local v493 = Instance.new("Frame")
							v493.BackgroundTransparency = 1
							v493.BorderSizePixel = 0
							v493.ClipsDescendants = true
							v493.Position = UDim2.fromScale(v484 / p462, v485 / p463)
							v493.Size = UDim2.fromScale((v486 - v484) / p462, (v487 - v485) / p463)
							v493.Parent = p460
							v473.Parent = v493
							v477.MatteClip = v493
						end
					end
				end
			end
			v_u_305(v473, v468.ks, p464, p462, p463, v471, v475, v476)
			local v494 = p464 - (v468.st or 0)
			local v495
			if v468.ip <= v494 then
				v495 = v494 < v468.op
			else
				v495 = false
			end
			v473.Visible = v495
			table.insert(v465, v477)
		end
	end
	for _, v496 in v465 do
		local v497 = v496.Layer
		if v497.parent and v466[v497.parent] then
			local v498 = v466[v497.parent]
			v496.Frame.Parent = v498.Frame
		elseif v496.MatteClip == nil then
			v496.Frame.Parent = p460
		end
	end
	for v499 = 1, #v465 - 1 do
		local v500 = v465[v499]
		local v501 = v465[v499 + 1]
		if v501.Layer.tt then
			local v502 = nil
			for _, v503 in v500.Shapes or {} do
				if v503.PathData then
					v502 = v_u_5.EvaluateBezierShape(v503.PathData, p464)
					break
				end
			end
			if v502 then
				local v504 = (1 / 0)
				local v505 = (1 / 0)
				local v506 = (-1 / 0)
				local v507 = (-1 / 0)
				for _, v508 in v502.v do
					local v509 = v508[1]
					v504 = math.min(v504, v509)
					local v510 = v508[2]
					v505 = math.min(v505, v510)
					local v511 = v508[1]
					v506 = math.max(v506, v511)
					local v512 = v508[2]
					v507 = math.max(v507, v512)
				end
				local v513 = Instance.new("Frame")
				v513.BackgroundTransparency = 1
				v513.BorderSizePixel = 0
				v513.ClipsDescendants = true
				v513.Position = UDim2.fromScale(v504 / p462, v505 / p463)
				v513.Size = UDim2.fromScale((v506 - v504) / p462, (v507 - v505) / p463)
				v513.Parent = p460
				v501.Frame.Parent = v513
				v501.MatteClip = v513
				v500.Frame.Visible = false
			end
		end
	end
	return v465
end
local v_u_515 = nil
local function v_u_532(p516, p517, p518, p519)
	-- upvalues: (copy) v_u_305, (ref) v_u_515, (copy) v_u_5, (copy) v_u_532
	for _, v520 in p516 do
		local v521 = v520.Layer
		local v522 = p517 - (v521.st or 0)
		local v523
		if v521.ip <= v522 then
			v523 = v522 < v521.op
		else
			v523 = false
		end
		v520.Frame.Visible = v523
		if v523 then
			local v524 = v520.Frame:IsA("CanvasGroup")
			v_u_305(v520.Frame, v521.ks, v522, p518, p519, v524, v520.BaseSizeX, v520.BaseSizeY)
			if v520.Shapes then
				for _, v525 in v520.Shapes do
					v_u_515(v525, v522, p518, p519)
				end
			end
			if v520.Children then
				local v526 = v521.w or p518
				local v527 = v521.h or p519
				local v528
				if v521.tm then
					v528 = v_u_5.EvaluateScalarAtFrame(v521.tm, v522, 0) * (v521.op - v521.ip)
				else
					v528 = v522
				end
				v_u_532(v520.Children, v528, v526, v527)
			end
			if v520.TextLabel and v521.t then
				local v529 = v521.t.d
				if v529 and v529.k then
					local v530 = nil
					for _, v531 in v529.k do
						if v531.t == nil or v531.t <= v522 then
							v530 = v531.s
						end
					end
					if v530 then
						v520.TextLabel.Text = v530.t or ""
						if v530.fc then
							v520.TextLabel.TextColor3 = Color3.new(v530.fc[1] or 1, v530.fc[2] or 1, v530.fc[3] or 1)
						end
					end
				end
			end
		end
	end
end
v_u_515 = function(p533, p534, p535, p536)
	-- upvalues: (ref) v_u_515, (copy) v_u_5, (copy) v_u_173, (copy) v_u_224
	if p533.Children then
		for _, v537 in p533.Children do
			v_u_515(v537, p534, p535, p536)
		end
	end
	if p533.IsAnimatedPath and p533.PathData then
		local v538 = v_u_5.EvaluateBezierShape(p533.PathData, p534)
		if v538 and p533.Frame then
			local v539 = v_u_5.EvaluateColor(p533.FillColor, p534)
			local v540 = v_u_5.EvaluateScalarAtFrame(p533.FillOpacity, p534, 100)
			if p533.FillColor then
				v_u_173(p533, v538, p533.Frame, p535, p536, v539, 1 - v540 / 100)
			end
			if p533.StrokeColor then
				local v541 = v_u_5.EvaluateColor(p533.StrokeColor, p534)
				local v542 = v_u_5.EvaluateScalarAtFrame(p533.StrokeOpacity, p534, 100)
				local v543 = v_u_5.EvaluateScalarAtFrame(p533.StrokeWidth, p534, 0)
				if v543 > 0 then
					v_u_224(p533, v538, p533.Frame, p535, p536, v541, 1 - v542 / 100, v543)
				end
			end
		end
	elseif p533.FillColor then
		local v544 = p533.FillColor
		local v545
		if v544 == nil then
			v545 = false
		else
			v545 = v544.a == 1
		end
		if v545 then
			local v546 = v_u_5.EvaluateColor(p533.FillColor, p534)
			local v547 = 1 - v_u_5.EvaluateScalarAtFrame(p533.FillOpacity, p534, 100) / 100
			if p533.Triangles then
				for _, v548 in p533.Triangles do
					if v548.A.Visible then
						v548.A.ImageColor3 = v546
						v548.A.ImageTransparency = v547
					end
					if v548.B.Visible then
						v548.B.ImageColor3 = v546
						v548.B.ImageTransparency = v547
					end
				end
			end
			if p533.Frame and p533.Frame.BackgroundTransparency < 1 then
				p533.Frame.BackgroundColor3 = v546
				p533.Frame.BackgroundTransparency = v547
			end
		end
	end
	if p533.StrokeColor then
		local v549 = p533.StrokeColor
		local v550
		if v549 == nil then
			v550 = false
		else
			v550 = v549.a == 1
		end
		if v550 then
			local v551 = v_u_5.EvaluateColor(p533.StrokeColor, p534)
			local v552 = v_u_5.EvaluateScalarAtFrame(p533.StrokeOpacity, p534, 100)
			if p533.Segments then
				for _, v553 in p533.Segments do
					if v553.Visible then
						v553.BackgroundColor3 = v551
						v553.BackgroundTransparency = 1 - v552 / 100
					end
				end
			end
			if p533.UIStroke then
				p533.UIStroke.Color = v551
				p533.UIStroke.Transparency = 1 - v552 / 100
			end
		end
	end
end
return table.freeze({
	["Parse"] = function(p554)
		-- upvalues: (copy) v_u_2
		return v_u_2:JSONDecode(p554)
	end,
	["Create"] = function(p555)
		-- upvalues: (copy) v_u_8, (copy) v_u_514
		local v556 = p555.w
		local v557 = p555.h
		local v558 = p555.ip
		local v559 = p555.op
		local v560 = p555.fr
		local v561 = Instance.new("Frame")
		v561.Name = p555.nm or "LottieAnimation"
		v561.BackgroundTransparency = 1
		v561.BorderSizePixel = 0
		v561.ClipsDescendants = true
		v561.Size = v_u_8
		local v562 = {}
		if p555.assets then
			for _, v563 in p555.assets do
				v562[v563.id] = v563
			end
		end
		return {
			["Animation"] = p555,
			["Root"] = v561,
			["Layers"] = v_u_514(p555.layers, v561, v562, v556, v557, v558),
			["AssetMap"] = v562,
			["Duration"] = (v559 - v558) / v560,
			["Width"] = v556,
			["Height"] = v557
		}
	end,
	["Render"] = function(p564, p565)
		-- upvalues: (copy) v_u_532
		local v566 = p564.Animation
		local v567 = v566.ip
		local v568 = v566.op
		local v569 = v566.fr
		local v570 = v568 - v567
		local v571 = v567 + p565 * v569 % v570
		v_u_532(p564.Layers, v571, p564.Width, p564.Height)
	end,
	["Destroy"] = function(p572)
		p572.Root:Destroy()
		table.clear(p572.Layers)
		table.clear(p572.AssetMap)
	end
})