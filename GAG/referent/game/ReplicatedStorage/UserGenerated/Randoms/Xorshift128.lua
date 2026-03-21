local v1 = game:GetService("ReplicatedStorage")
require(v1.UserGenerated.Randoms.Base)
local v_u_2 = require(v1.UserGenerated.IO.Crypto.GenerateSeed)
local v_u_3 = require(script.Theory)
local v_u_4 = bit32.bxor
local v_u_5 = bit32.bor
local v_u_6 = bit32.band
local v_u_7 = bit32.lshift
local v_u_8 = bit32.rshift
local v_u_9 = math.floor
local v_u_10 = math.ldexp
local v_u_11 = math.sqrt
local v_u_12 = math.log
local v_u_13 = math.max
local v_u_14 = math.sin
local v_u_15 = math.cos
local v_u_16 = math.clamp
local v_u_17 = string.format
local v_u_18 = Vector2.new
local v_u_19 = Vector3.new
assert(true)
local v_u_20 = Random.new()
local function v_u_38(p21, p22)
	-- upvalues: (copy) v_u_20, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	local v23 = p22 == nil and {} or (type(p22) == "number" and { p22 } or p22)
	local v24 = v23[1]
	local v25 = v23[2]
	local v26 = v23[3]
	local v27 = v23[4]
	local v28 = v_u_5(v24 or v_u_20:NextInteger(0, 4294967295), 0)
	if not v25 then
		local v29 = v_u_8(v28, 16)
		local v30 = v_u_6(v28, 65535)
		v25 = v_u_7(v_u_6(v30 * 27655 + v29 * 35173, 65535), 16) + v30 * 35173 + 1
	end
	local v31 = v_u_5(v25, 0)
	if not v26 then
		local v32 = v_u_8(v31, 16)
		local v33 = v_u_6(v31, 65535)
		v26 = v_u_7(v_u_6(v33 * 27655 + v32 * 35173, 65535), 16) + v33 * 35173 + 1
	end
	local v34 = v_u_5(v26, 0)
	if not v27 then
		local v35 = v_u_8(v34, 16)
		local v36 = v_u_6(v34, 65535)
		v27 = v_u_7(v_u_6(v36 * 27655 + v35 * 35173, 65535), 16) + v36 * 35173 + 1
	end
	local v37 = v_u_5(v27, 0)
	p21.x = v28
	p21.y = v31
	p21.z = v34
	p21.w = v37
end
local v271 = {
	["__index"] = table.freeze({
		["NextU32"] = function(p39)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8
			local v40 = p39.x
			local v41 = p39.w
			local v42 = v_u_4(v40, (v_u_7(v40, 11)))
			local v43 = v_u_4(v_u_4(v_u_4(v42, (v_u_8(v42, 8))), v41), (v_u_8(v41, 19)))
			local v44 = p39.y
			local v45 = p39.z
			p39.x = v44
			p39.y = v45
			p39.z = v41
			p39.w = v43
			return v43
		end,
		["NextU64"] = function(p46)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
			local v47 = p46.x
			local v48 = p46.w
			local v49 = v_u_4(v47, (v_u_7(v47, 11)))
			local v50 = v_u_4(v_u_4(v_u_4(v49, (v_u_8(v49, 8))), v48), (v_u_8(v48, 19)))
			local v51 = p46.y
			local v52 = p46.z
			p46.x = v51
			p46.y = v52
			p46.z = v48
			p46.w = v50
			local v53 = v_u_10(v50, 32)
			local v54 = p46.x
			local v55 = p46.w
			local v56 = v_u_4(v54, (v_u_7(v54, 11)))
			local v57 = v_u_4(v_u_4(v_u_4(v56, (v_u_8(v56, 8))), v55), (v_u_8(v55, 19)))
			local v58 = p46.y
			local v59 = p46.z
			p46.x = v58
			p46.y = v59
			p46.z = v55
			p46.w = v57
			return v53 + v57
		end,
		["NextFloat"] = function(p60)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
			local v61 = p60.x
			local v62 = p60.w
			local v63 = v_u_4(v61, (v_u_7(v61, 11)))
			local v64 = v_u_4(v_u_4(v_u_4(v63, (v_u_8(v63, 8))), v62), (v_u_8(v62, 19)))
			local v65 = p60.y
			local v66 = p60.z
			p60.x = v65
			p60.y = v66
			p60.z = v62
			p60.w = v64
			return v_u_10(v64, -32)
		end,
		["NextDouble"] = function(p67)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
			local v68 = p67.x
			local v69 = p67.w
			local v70 = v_u_4(v68, (v_u_7(v68, 11)))
			local v71 = v_u_4(v_u_4(v_u_4(v70, (v_u_8(v70, 8))), v69), (v_u_8(v69, 19)))
			local v72 = p67.y
			local v73 = p67.z
			p67.x = v72
			p67.y = v73
			p67.z = v69
			p67.w = v71
			local v74 = v_u_10(v71, 32)
			local v75 = p67.x
			local v76 = p67.w
			local v77 = v_u_4(v75, (v_u_7(v75, 11)))
			local v78 = v_u_4(v_u_4(v_u_4(v77, (v_u_8(v77, 8))), v76), (v_u_8(v76, 19)))
			local v79 = p67.y
			local v80 = p67.z
			p67.x = v79
			p67.y = v80
			p67.z = v76
			p67.w = v78
			return v_u_10(v74 + v78, -64)
		end,
		["NextNumber"] = function(p81, p82, p83)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
			local v84 = p83 - p82
			local v85 = p81.x
			local v86 = p81.w
			local v87 = v_u_4(v85, (v_u_7(v85, 11)))
			local v88 = v_u_4(v_u_4(v_u_4(v87, (v_u_8(v87, 8))), v86), (v_u_8(v86, 19)))
			local v89 = p81.y
			local v90 = p81.z
			p81.x = v89
			p81.y = v90
			p81.z = v86
			p81.w = v88
			local v91 = v_u_10(v88, 32)
			local v92 = p81.x
			local v93 = p81.w
			local v94 = v_u_4(v92, (v_u_7(v92, 11)))
			local v95 = v_u_4(v_u_4(v_u_4(v94, (v_u_8(v94, 8))), v93), (v_u_8(v93, 19)))
			local v96 = p81.y
			local v97 = p81.z
			p81.x = v96
			p81.y = v97
			p81.z = v93
			p81.w = v95
			return p82 + v84 * v_u_10(v91 + v95, -64)
		end,
		["NextInteger"] = function(p98, p99, p100)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
			local v101 = p100 - p99 + 1
			local v102 = p98.x
			local v103 = p98.w
			local v104 = v_u_4(v102, (v_u_7(v102, 11)))
			local v105 = v_u_4(v_u_4(v_u_4(v104, (v_u_8(v104, 8))), v103), (v_u_8(v103, 19)))
			local v106 = p98.y
			local v107 = p98.z
			p98.x = v106
			p98.y = v107
			p98.z = v103
			p98.w = v105
			local v108 = v_u_10(v105, 32)
			local v109 = p98.x
			local v110 = p98.w
			local v111 = v_u_4(v109, (v_u_7(v109, 11)))
			local v112 = v_u_4(v_u_4(v_u_4(v111, (v_u_8(v111, 8))), v110), (v_u_8(v110, 19)))
			local v113 = p98.y
			local v114 = p98.z
			p98.x = v113
			p98.y = v114
			p98.z = v110
			p98.w = v112
			return v_u_9(p99 + v101 * v_u_10(v108 + v112, -64))
		end,
		["NextNormal"] = function(p115, p116, p117)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14
			local v118 = p115.x
			local v119 = p115.w
			local v120 = v_u_4(v118, (v_u_7(v118, 11)))
			local v121 = v_u_4(v_u_4(v_u_4(v120, (v_u_8(v120, 8))), v119), (v_u_8(v119, 19)))
			local v122 = p115.y
			local v123 = p115.z
			p115.x = v122
			p115.y = v123
			p115.z = v119
			p115.w = v121
			local v124 = v_u_10(v121, 32)
			local v125 = p115.x
			local v126 = p115.w
			local v127 = v_u_4(v125, (v_u_7(v125, 11)))
			local v128 = v_u_4(v_u_4(v_u_4(v127, (v_u_8(v127, 8))), v126), (v_u_8(v126, 19)))
			local v129 = p115.y
			local v130 = p115.z
			p115.x = v129
			p115.y = v130
			p115.z = v126
			p115.w = v128
			local v131 = v_u_11(v_u_12((v_u_13(2.2250738585072014e-308, (v_u_10(v124 + v128, -64))))) * -2) * (p117 or 0)
			local v132 = p115.x
			local v133 = p115.w
			local v134 = v_u_4(v132, (v_u_7(v132, 11)))
			local v135 = v_u_4(v_u_4(v_u_4(v134, (v_u_8(v134, 8))), v133), (v_u_8(v133, 19)))
			local v136 = p115.y
			local v137 = p115.z
			p115.x = v136
			p115.y = v137
			p115.z = v133
			p115.w = v135
			local v138 = v_u_10(v135, 32)
			local v139 = p115.x
			local v140 = p115.w
			local v141 = v_u_4(v139, (v_u_7(v139, 11)))
			local v142 = v_u_4(v_u_4(v_u_4(v141, (v_u_8(v141, 8))), v140), (v_u_8(v140, 19)))
			local v143 = p115.y
			local v144 = p115.z
			p115.x = v143
			p115.y = v144
			p115.z = v140
			p115.w = v142
			local v145 = 6.283185307179586 * v_u_10(v138 + v142, -64)
			local v146 = p116 or 0
			return v_u_15(v145) * v131 + v146, v_u_14(v145) * v131 + v146
		end,
		["NextBoolean"] = function(p147, p148)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10
			local v149 = p147.x
			local v150 = p147.w
			local v151 = v_u_4(v149, (v_u_7(v149, 11)))
			local v152 = v_u_4(v_u_4(v_u_4(v151, (v_u_8(v151, 8))), v150), (v_u_8(v150, 19)))
			local v153 = p147.y
			local v154 = p147.z
			p147.x = v153
			p147.y = v154
			p147.z = v150
			p147.w = v152
			local v155 = v_u_10(v152, 32)
			local v156 = p147.x
			local v157 = p147.w
			local v158 = v_u_4(v156, (v_u_7(v156, 11)))
			local v159 = v_u_4(v_u_4(v_u_4(v158, (v_u_8(v158, 8))), v157), (v_u_8(v157, 19)))
			local v160 = p147.y
			local v161 = p147.z
			p147.x = v160
			p147.y = v161
			p147.z = v157
			p147.w = v159
			return v_u_10(v155 + v159, -64) < (p148 or 0.5)
		end,
		["NextVector2"] = function(p162, p163)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_18, (copy) v_u_15, (copy) v_u_14
			local v164 = p163 or 1
			local v165 = p162.x
			local v166 = p162.w
			local v167 = v_u_4(v165, (v_u_7(v165, 11)))
			local v168 = v_u_4(v_u_4(v_u_4(v167, (v_u_8(v167, 8))), v166), (v_u_8(v166, 19)))
			local v169 = p162.y
			local v170 = p162.z
			p162.x = v169
			p162.y = v170
			p162.z = v166
			p162.w = v168
			local v171 = v_u_10(v168, 32)
			local v172 = p162.x
			local v173 = p162.w
			local v174 = v_u_4(v172, (v_u_7(v172, 11)))
			local v175 = v_u_4(v_u_4(v_u_4(v174, (v_u_8(v174, 8))), v173), (v_u_8(v173, 19)))
			local v176 = p162.y
			local v177 = p162.z
			p162.x = v176
			p162.y = v177
			p162.z = v173
			p162.w = v175
			local v178 = 6.283185307179586 * v_u_10(v171 + v175, -64)
			return v_u_18(v_u_15(v178) * v164, v_u_14(v178) * v164)
		end,
		["NextVector3"] = function(p179, p180)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14, (copy) v_u_19
			local v181 = p180 or 1
			local v182 = p179.x
			local v183 = p179.w
			local v184 = v_u_4(v182, (v_u_7(v182, 11)))
			local v185 = v_u_4(v_u_4(v_u_4(v184, (v_u_8(v184, 8))), v183), (v_u_8(v183, 19)))
			local v186 = p179.y
			local v187 = p179.z
			p179.x = v186
			p179.y = v187
			p179.z = v183
			p179.w = v185
			local v188 = v_u_10(v185, 32)
			local v189 = p179.x
			local v190 = p179.w
			local v191 = v_u_4(v189, (v_u_7(v189, 11)))
			local v192 = v_u_4(v_u_4(v_u_4(v191, (v_u_8(v191, 8))), v190), (v_u_8(v190, 19)))
			local v193 = p179.y
			local v194 = p179.z
			p179.x = v193
			p179.y = v194
			p179.z = v190
			p179.w = v192
			local v195 = 6.283185307179586 * v_u_10(v188 + v192, -64)
			local v196 = p179.x
			local v197 = p179.w
			local v198 = v_u_4(v196, (v_u_7(v196, 11)))
			local v199 = v_u_4(v_u_4(v_u_4(v198, (v_u_8(v198, 8))), v197), (v_u_8(v197, 19)))
			local v200 = p179.y
			local v201 = p179.z
			p179.x = v200
			p179.y = v201
			p179.z = v197
			p179.w = v199
			local v202 = v_u_10(v199, 32)
			local v203 = p179.x
			local v204 = p179.w
			local v205 = v_u_4(v203, (v_u_7(v203, 11)))
			local v206 = v_u_4(v_u_4(v_u_4(v205, (v_u_8(v205, 8))), v204), (v_u_8(v204, 19)))
			local v207 = p179.y
			local v208 = p179.z
			p179.x = v207
			p179.y = v208
			p179.z = v204
			p179.w = v206
			local v209 = v_u_10(v202 + v206, -64) * 2 - 1
			local v210 = v_u_11(1 - v209 * v209)
			return v_u_19(v_u_15(v195) * v210 * v181, v_u_14(v195) * v210 * v181, v209 * v181)
		end,
		["NextUUIDv4"] = function(p211)
			-- upvalues: (copy) v_u_17, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
			local v212 = v_u_17
			local v213 = p211.x
			local v214 = p211.w
			local v215 = v_u_4(v213, (v_u_7(v213, 11)))
			local v216 = v_u_4(v_u_4(v_u_4(v215, (v_u_8(v215, 8))), v214), (v_u_8(v214, 19)))
			local v217 = p211.y
			local v218 = p211.z
			p211.x = v217
			p211.y = v218
			p211.z = v214
			p211.w = v216
			local v219 = p211.x
			local v220 = p211.w
			local v221 = v_u_4(v219, (v_u_7(v219, 11)))
			local v222 = v_u_4(v_u_4(v_u_4(v221, (v_u_8(v221, 8))), v220), (v_u_8(v220, 19)))
			local v223 = p211.y
			local v224 = p211.z
			p211.x = v223
			p211.y = v224
			p211.z = v220
			p211.w = v222
			local v225 = v_u_5(v_u_6(v222, 4294905855), 16384)
			local v226 = p211.x
			local v227 = p211.w
			local v228 = v_u_4(v226, (v_u_7(v226, 11)))
			local v229 = v_u_4(v_u_4(v_u_4(v228, (v_u_8(v228, 8))), v227), (v_u_8(v227, 19)))
			local v230 = p211.y
			local v231 = p211.z
			p211.x = v230
			p211.y = v231
			p211.z = v227
			p211.w = v229
			local v232 = v_u_5(v_u_6(v229, 1073741823), 2147483648)
			local v233 = p211.x
			local v234 = p211.w
			local v235 = v_u_4(v233, (v_u_7(v233, 11)))
			local v236 = v_u_4(v_u_4(v_u_4(v235, (v_u_8(v235, 8))), v234), (v_u_8(v234, 19)))
			local v237 = p211.y
			local v238 = p211.z
			p211.x = v237
			p211.y = v238
			p211.z = v234
			p211.w = v236
			return v212("%08x%08x%08x%08x", v216, v225, v232, v236)
		end,
		["Seed"] = v_u_38,
		["Shuffle"] = function(p239, p240)
			-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
			local v241 = type(p240) == "table"
			assert(v241)
			for v242 = #p240, 2, -1 do
				local v243 = v242 - 1 + 1
				local v244 = p239.x
				local v245 = p239.w
				local v246 = v_u_4(v244, (v_u_7(v244, 11)))
				local v247 = v_u_4(v_u_4(v_u_4(v246, (v_u_8(v246, 8))), v245), (v_u_8(v245, 19)))
				local v248 = p239.y
				local v249 = p239.z
				p239.x = v248
				p239.y = v249
				p239.z = v245
				p239.w = v247
				local v250 = v_u_10(v247, 32)
				local v251 = p239.x
				local v252 = p239.w
				local v253 = v_u_4(v251, (v_u_7(v251, 11)))
				local v254 = v_u_4(v_u_4(v_u_4(v253, (v_u_8(v253, 8))), v252), (v_u_8(v252, 19)))
				local v255 = p239.y
				local v256 = p239.z
				p239.x = v255
				p239.y = v256
				p239.z = v252
				p239.w = v254
				local v257 = v_u_9(v243 * v_u_10(v250 + v254, -64) + 1)
				local v258 = p240[v257]
				local v259 = p240[v242]
				p240[v242] = v258
				p240[v257] = v259
			end
		end,
		["Clone"] = function(p260)
			local v261 = {
				["x"] = p260.x,
				["y"] = p260.y,
				["z"] = p260.z,
				["w"] = p260.w
			}
			local v262 = getmetatable(p260)
			return setmetatable(v261, v262)
		end,
		["GetState"] = function(p263)
			return {
				p263.x,
				p263.y,
				p263.z,
				p263.w
			}
		end,
		["Skip"] = function(p264, p265)
			-- upvalues: (copy) v_u_9, (copy) v_u_3
			local v266
			if type(p265) == "number" and (v_u_9(p265) == p265 and p265 ~= (1 / 0)) then
				v266 = p265 ~= (-1 / 0)
			else
				v266 = false
			end
			if not v266 then
				error("Integer", 2)
			end
			local v267, v268, v269, v270 = v_u_3.Transform(p264.x, p264.y, p264.z, p264.w, p265)
			p264.x = v267
			p264.y = v268
			p264.z = v269
			p264.w = v270
		end
	})
}
local v_u_272 = table.freeze(v271)
local v_u_279 = {
	["new"] = function(p273)
		-- upvalues: (copy) v_u_38, (copy) v_u_272
		local v274 = {
			["x"] = 0,
			["y"] = 0,
			["z"] = 0,
			["w"] = 0
		}
		v_u_38(v274, p273)
		local v275 = v_u_272
		return setmetatable(v274, v275)
	end,
	["Unique"] = function(p276)
		-- upvalues: (copy) v_u_9, (copy) v_u_16, (copy) v_u_279, (copy) v_u_2
		if p276 ~= nil then
			local v277
			if type(p276) == "number" and (v_u_9(p276) == p276 and p276 ~= (1 / 0)) then
				v277 = p276 ~= (-1 / 0)
			else
				v277 = false
			end
			if not v277 then
				error("Integer", 2)
			end
			if p276 < 0 then
				error("NonNegative", 2)
			end
		end
		local v278 = v_u_16(p276 or 4, 0, 4)
		return v_u_279.new(v_u_2(v278))
	end
}
v_u_279.R = v_u_279.Unique()
return table.freeze(v_u_279)