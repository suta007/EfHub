require(script.Types)
local v_u_1 = require(script.chunks)
local v_u_2 = require(script.crc32)
local v_u_3 = require(script.zlib)
local v_u_4 = {
	[0] = 1,
	[2] = 3,
	[3] = 1,
	[4] = 2,
	[6] = 4
}
local v_u_5 = {
	0,
	0,
	4,
	0,
	2,
	0,
	1
}
local v_u_6 = {
	0,
	4,
	0,
	2,
	0,
	1,
	0
}
local v_u_7 = {
	8,
	8,
	8,
	4,
	4,
	2,
	2
}
local v_u_8 = {
	8,
	8,
	4,
	4,
	2,
	2,
	1
}
return {
	["decode"] = function(p9, p10)
		-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3
		local v11 = buffer.len(p9)
		local v12 = v11 >= 8
		assert(v12, "not a PNG")
		local v13 = buffer.readstring(p9, 0, 8) == "\137PNG\r\n\26\n"
		assert(v13, "not a PNG")
		local v14 = table.create(3)
		local v15 = 8
		local v16
		if p10 == nil then
			v16 = false
		elseif p10.allowIncorrectCRC == true then
			v16 = true
		else
			v16 = false
		end
		while true do
			local v17 = buffer.readu32(p9, v15)
			local v18 = bit32.byteswap(v17)
			local v19 = buffer.readstring(p9, v15 + 4, 4)
			local v20 = string.match(v19, "%a%a%a%a")
			local v21 = ("invalid chunk type %*"):format(v19)
			assert(v20, v21)
			local v22 = v15 + 8
			local v23 = v22 + v18 + 4
			local v24 = v23 <= v11
			local v25 = ("EOF while reading %* chunk"):format(v19)
			assert(v24, v25)
			local v26 = v23 - 4
			local v27 = buffer.readu32(p9, v26)
			local v28 = v16 or bit32.byteswap(v27) == v_u_2(p9, v15 + 4, v23 - 5)
			local v29 = ("incorrect checksum in %*"):format(v19)
			assert(v28, v29)
			table.insert(v14, {
				["type"] = v19,
				["offset"] = v22,
				["length"] = v18
			})
			if v11 <= v23 then
				break
			end
			v15 = v23
		end
		local v30 = v23 == v11
		assert(v30, "trailing data in file")
		for _, v31 in v14 do
			local v32 = v31.type
			local v33 = string.byte(v32, 1, 1)
			if bit32.extract(v33, 5) == 0 and (v32 ~= "IHDR" and (v32 ~= "IDAT" and (v32 ~= "PLTE" and v32 ~= "IEND"))) then
				error((("unhandled critical chunk %*"):format(v32)))
			end
		end
		local v34 = v14[1]
		local v35 = v34.type == "IHDR"
		assert(v35, "first chunk must be IHDR")
		for v36 = 2, #v14 do
			local v37 = v14[v36].type ~= "IHDR"
			assert(v37, "multiple IHDR chunks are not allowed")
		end
		local v38 = v_u_1.IHDR(p9, v34)
		local v39 = -1
		local v40 = -1
		local v41 = 0
		for v42, v43 in v14 do
			if v43.type == "IDAT" then
				if v39 < 0 then
					v39 = v42
				else
					local v44 = v42 == v40 + 1
					assert(v44, "multiple IDAT chunks must be consecutive")
				end
				v41 = v41 + v43.length
				v40 = v42
			end
		end
		local v45 = v39 > 0
		assert(v45, "no IDAT chunks")
		local v46 = v41 > 0
		assert(v46, "no image data in IDAT chunks")
		local v47 = nil
		local v48 = -1
		for v49, v50 in v14 do
			if v50.type == "PLTE" then
				assert(not v47, "multiple PLTE chunks are not allowed")
				local v51 = v49 < v39
				assert(v51, "PLTE not allowed after IDAT chunks")
				local v52
				if v38.colorType == 0 then
					v52 = false
				else
					v52 = v38.colorType ~= 4
				end
				assert(v52, "PLTE not allowed for color type")
				v47 = v_u_1.PLTE(p9, v50, v38)
				v48 = v49
			end
		end
		if v38.colorType == 3 then
			local v53 = v47 ~= nil
			assert(v53, "color type requires a PLTE chunk")
		end
		local v54 = nil
		for v55, v56 in v14 do
			if v56.type == "tRNS" then
				local v57 = v54 == nil
				assert(v57, "multiple tRNS chunks are not allowed")
				local v58 = v55 < v39
				assert(v58, "tRNS not allowed after IDAT chunks")
				local v59 = not v47 or v48 < v55
				assert(v59, "tRNS must be after PLTE")
				local v60
				if v38.colorType == 4 then
					v60 = false
				else
					v60 = v38.colorType ~= 6
				end
				assert(v60, "tRNS not allowed for color type")
				v54 = v_u_1.tRNS(p9, v56, v38, v47)
			end
		end
		local v61 = v14[#v14]
		local v62 = v61.type == "IEND"
		assert(v62, "final chunk must be IEND")
		local v63 = v61.length == 0
		assert(v63, "IEND chunk must be empty")
		for v64 = 2, #v14 - 1 do
			local v65 = v14[v64].type ~= "IEND"
			assert(v65, "multiple IEND chunks are not allowed")
		end
		local v66 = buffer.create(v41)
		local v67 = 0
		for _, v68 in v14 do
			if v68.type == "IDAT" then
				buffer.copy(v66, v67, p9, v68.offset, v68.length)
				v67 = v67 + v68.length
			end
		end
		local v_u_69 = v38.width
		local v_u_70 = v38.height
		local v_u_71 = v38.bitDepth
		local v_u_72 = v38.colorType
		local v_u_73 = v_u_4[v_u_72]
		local v74 = 0
		if v38.interlaced then
			for v75 = 1, 7 do
				local v76 = (v_u_69 - v_u_6[v75]) / v_u_8[v75]
				local v77 = math.ceil(v76)
				local v78 = (v_u_70 - v_u_5[v75]) / v_u_7[v75]
				local v79 = math.ceil(v78)
				if v77 > 0 and v79 > 0 then
					local v80 = v77 * v_u_73 * v_u_71 / 8
					v74 = v74 + v79 * (math.ceil(v80) + 1)
				end
			end
		else
			local v81 = v_u_69 * v_u_73 * v_u_71 / 8
			v74 = v_u_70 * (math.ceil(v81) + 1)
		end
		local v_u_82
		if v47 then
			v_u_82 = v47.colors
		else
			v_u_82 = nil
		end
		local v_u_83
		if v_u_72 == 3 or v_u_71 >= 8 then
			v_u_83 = nil
		else
			v_u_83 = 255 / (2 ^ v_u_71 - 1)
		end
		local v84 = v_u_73 * v_u_71 / 8
		local v_u_85 = math.ceil(v84)
		local v_u_86 = 2 ^ v_u_71 - 1
		local v_u_87 = 0
		local v_u_88 = buffer.create(v74)
		local v89 = v_u_3.inflate(v66, v_u_88) == v74
		assert(v89, "decompressed data size mismatch")
		local v_u_90 = buffer.create(v_u_69 * v_u_70 * 4)
		local v_u_91 = not v54 and -1 or v54.gray
		local v_u_92 = not v54 and -1 or v54.red
		local v_u_93 = not v54 and -1 or v54.green
		local v_u_94 = not v54 and -1 or v54.blue
		local function v275(p95, p96, p97, p98)
			-- upvalues: (copy) v_u_69, (copy) v_u_70, (copy) v_u_73, (copy) v_u_71, (ref) v_u_87, (copy) v_u_88, (copy) v_u_85, (copy) v_u_72, (copy) v_u_91, (copy) v_u_86, (copy) v_u_92, (copy) v_u_93, (copy) v_u_94, (ref) v_u_82, (ref) v_u_83, (copy) v_u_90
			local v99 = (v_u_69 - p95) / p97
			local v100 = math.ceil(v99)
			local v101 = (v_u_70 - p96) / p98
			local v102 = math.ceil(v101)
			if v100 >= 1 and v102 >= 1 then
				local v103 = v100 * v_u_73 * v_u_71 / 8
				local v104 = math.ceil(v103)
				local v105 = v_u_87
				for v106 = 1, v102 do
					local v107 = v_u_88
					local v108 = v_u_87
					local v109 = buffer.readu8(v107, v108)
					v_u_87 = v_u_87 + 1
					if v109 == 0 or v109 == 2 and v106 == 1 then
						v_u_87 = v_u_87 + v104
					elseif v109 == 1 then
						for v110 = 1, v104 do
							local v111
							if v110 <= v_u_85 then
								v111 = 0
							else
								local v112 = v_u_88
								local v113 = v_u_87 - v_u_85
								v111 = buffer.readu8(v112, v113)
							end
							local v114 = v_u_88
							local v115 = v_u_87
							local v116 = buffer.readu8(v114, v115) + v111
							local v117 = bit32.band(v116, 255)
							local v118 = v_u_88
							local v119 = v_u_87
							buffer.writeu8(v118, v119, v117)
							v_u_87 = v_u_87 + 1
						end
					elseif v109 == 2 then
						for _ = 1, v104 do
							local v120 = v_u_88
							local v121 = v_u_87 - v104 - 1
							local v122 = buffer.readu8(v120, v121)
							local v123 = v_u_88
							local v124 = v_u_87
							local v125 = buffer.readu8(v123, v124) + v122
							local v126 = bit32.band(v125, 255)
							local v127 = v_u_88
							local v128 = v_u_87
							buffer.writeu8(v127, v128, v126)
							v_u_87 = v_u_87 + 1
						end
					elseif v109 == 3 then
						for v129 = 1, v104 do
							local v130
							if v129 <= v_u_85 then
								v130 = 0
							else
								local v131 = v_u_88
								local v132 = v_u_87 - v_u_85
								v130 = buffer.readu8(v131, v132)
							end
							local v133
							if v106 == 1 then
								v133 = 0
							else
								local v134 = v_u_88
								local v135 = v_u_87 - v104 - 1
								v133 = buffer.readu8(v134, v135)
							end
							local v136 = v_u_88
							local v137 = v_u_87
							local v138 = buffer.readu8(v136, v137)
							local v139 = v130 + v133
							local v140 = v138 + bit32.rshift(v139, 1)
							local v141 = bit32.band(v140, 255)
							local v142 = v_u_88
							local v143 = v_u_87
							buffer.writeu8(v142, v143, v141)
							v_u_87 = v_u_87 + 1
						end
					elseif v109 == 4 then
						for v144 = 1, v104 do
							local v145
							if v144 <= v_u_85 then
								v145 = 0
							else
								local v146 = v_u_88
								local v147 = v_u_87 - v_u_85
								v145 = buffer.readu8(v146, v147)
							end
							local v148
							if v106 == 1 then
								v148 = 0
							else
								local v149 = v_u_88
								local v150 = v_u_87 - v104 - 1
								v148 = buffer.readu8(v149, v150)
							end
							local v151
							if v144 <= v_u_85 or v106 == 1 then
								v151 = 0
							else
								local v152 = v_u_88
								local v153 = v_u_87 - v104 - v_u_85 - 1
								v151 = buffer.readu8(v152, v153)
							end
							local v154 = v148 - v151
							local v155 = math.abs(v154)
							local v156 = v145 - v151
							local v157 = math.abs(v156)
							local v158 = v145 + v148 - v151 * 2
							local v159 = math.abs(v158)
							if v155 <= v157 and v155 <= v159 then
								v151 = v145
							elseif v157 <= v159 then
								v151 = v148
							end
							local v160 = v_u_88
							local v161 = v_u_87
							local v162 = buffer.readu8(v160, v161) + v151
							local v163 = bit32.band(v162, 255)
							local v164 = v_u_88
							local v165 = v_u_87
							buffer.writeu8(v164, v165, v163)
							v_u_87 = v_u_87 + 1
						end
					else
						error("invalid row filter")
					end
				end
				local v166 = 8
				local v167 = v166
				for v168 = 1, v102 do
					v105 = v105 + 1
					if v167 < 8 then
						v166 = 8
						v105 = v105 + 1
						v167 = v166
					end
					for v169 = 1, v100 do
						local v170 = nil
						local v171 = nil
						local v172 = nil
						local v173 = nil
						if v_u_72 == 0 then
							local v174 = v_u_88
							v170 = buffer.readu8(v174, v105)
							if v_u_71 < 8 then
								local v175 = v167 - v_u_71
								local v176 = v_u_71
								v170 = bit32.extract(v170, v175, v176)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v177 = bit32.lshift(v170, 8)
								local v178 = v_u_88
								local v179 = v105 + 1
								local v180 = buffer.readu8(v178, v179)
								v170 = bit32.bor(v177, v180)
								v105 = v105 + 2
							end
							if v170 == v_u_91 then
								v172 = v170
								v171 = v172
								local v181 = v172
								v172 = v171
								v181 = v171
								v173 = 0
							else
								v173 = v_u_86
								v172 = v170
								v171 = v172
								local v182 = v172
								v172 = v171
								v182 = v171
							end
						elseif v_u_72 == 2 then
							local v183 = v_u_88
							v170 = buffer.readu8(v183, v105)
							if v_u_71 < 8 then
								local v184 = v167 - v_u_71
								local v185 = v_u_71
								v170 = bit32.extract(v170, v184, v185)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v186 = bit32.lshift(v170, 8)
								local v187 = v_u_88
								local v188 = v105 + 1
								local v189 = buffer.readu8(v187, v188)
								v170 = bit32.bor(v186, v189)
								v105 = v105 + 2
							end
							local v190 = v_u_88
							local v191 = v105
							v171 = buffer.readu8(v190, v191)
							if v_u_71 < 8 then
								local v192 = v167 - v_u_71
								local v193 = v_u_71
								v171 = bit32.extract(v171, v192, v193)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v194 = bit32.lshift(v171, 8)
								local v195 = v_u_88
								local v196 = v105 + 1
								local v197 = buffer.readu8(v195, v196)
								v171 = bit32.bor(v194, v197)
								v105 = v105 + 2
							end
							local v198 = v_u_88
							local v199 = v105
							v172 = buffer.readu8(v198, v199)
							if v_u_71 < 8 then
								local v200 = v167 - v_u_71
								local v201 = v_u_71
								v172 = bit32.extract(v172, v200, v201)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v202 = bit32.lshift(v172, 8)
								local v203 = v_u_88
								local v204 = v105 + 1
								local v205 = buffer.readu8(v203, v204)
								v172 = bit32.bor(v202, v205)
								v105 = v105 + 2
							end
							if v170 == v_u_92 and (v171 == v_u_93 and v172 == v_u_94) then
								v173 = 0
							else
								v173 = v_u_86
							end
						elseif v_u_72 == 3 then
							local v206 = v_u_82
							local v207 = v_u_88
							local v208 = buffer.readu8(v207, v105)
							if v_u_71 < 8 then
								local v209 = v167 - v_u_71
								local v210 = v_u_71
								v208 = bit32.extract(v208, v209, v210)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v211 = bit32.lshift(v208, 8)
								local v212 = v_u_88
								local v213 = v105 + 1
								local v214 = buffer.readu8(v212, v213)
								v208 = bit32.bor(v211, v214)
								v105 = v105 + 2
							end
							local v215 = v206[v208 + 1]
							v170 = v215.r
							v171 = v215.g
							v172 = v215.b
							v173 = v215.a
						elseif v_u_72 == 4 then
							local v216 = v_u_88
							v170 = buffer.readu8(v216, v105)
							if v_u_71 < 8 then
								local v217 = v167 - v_u_71
								local v218 = v_u_71
								v170 = bit32.extract(v170, v217, v218)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v219 = bit32.lshift(v170, 8)
								local v220 = v_u_88
								local v221 = v105 + 1
								local v222 = buffer.readu8(v220, v221)
								v170 = bit32.bor(v219, v222)
								v105 = v105 + 2
							end
							local v223 = v_u_88
							local v224 = v105
							v173 = buffer.readu8(v223, v224)
							if v_u_71 < 8 then
								local v225 = v167 - v_u_71
								local v226 = v_u_71
								v173 = bit32.extract(v173, v225, v226)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v227 = bit32.lshift(v173, 8)
								local v228 = v_u_88
								local v229 = v105 + 1
								local v230 = buffer.readu8(v228, v229)
								v173 = bit32.bor(v227, v230)
								v105 = v105 + 2
							end
							v172 = v170
							v171 = v172
							local v231 = v172
							v172 = v171
							v231 = v171
						elseif v_u_72 == 6 then
							local v232 = v_u_88
							v170 = buffer.readu8(v232, v105)
							if v_u_71 < 8 then
								local v233 = v167 - v_u_71
								local v234 = v_u_71
								v170 = bit32.extract(v170, v233, v234)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v235 = bit32.lshift(v170, 8)
								local v236 = v_u_88
								local v237 = v105 + 1
								local v238 = buffer.readu8(v236, v237)
								v170 = bit32.bor(v235, v238)
								v105 = v105 + 2
							end
							local v239 = v_u_88
							local v240 = v105
							v171 = buffer.readu8(v239, v240)
							if v_u_71 < 8 then
								local v241 = v167 - v_u_71
								local v242 = v_u_71
								v171 = bit32.extract(v171, v241, v242)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v243 = bit32.lshift(v171, 8)
								local v244 = v_u_88
								local v245 = v105 + 1
								local v246 = buffer.readu8(v244, v245)
								v171 = bit32.bor(v243, v246)
								v105 = v105 + 2
							end
							local v247 = v_u_88
							local v248 = v105
							v172 = buffer.readu8(v247, v248)
							if v_u_71 < 8 then
								local v249 = v167 - v_u_71
								local v250 = v_u_71
								v172 = bit32.extract(v172, v249, v250)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v251 = bit32.lshift(v172, 8)
								local v252 = v_u_88
								local v253 = v105 + 1
								local v254 = buffer.readu8(v252, v253)
								v172 = bit32.bor(v251, v254)
								v105 = v105 + 2
							end
							local v255 = v_u_88
							local v256 = v105
							v173 = buffer.readu8(v255, v256)
							if v_u_71 < 8 then
								local v257 = v167 - v_u_71
								local v258 = v_u_71
								v173 = bit32.extract(v173, v257, v258)
								v166 = v167 - v_u_71
								if v166 == 0 then
									v166 = 8
									v105 = v105 + 1
									v167 = v166
								else
									v167 = v166
								end
							elseif v_u_71 == 8 then
								v105 = v105 + 1
							else
								local v259 = bit32.lshift(v173, 8)
								local v260 = v_u_88
								local v261 = v105 + 1
								local v262 = buffer.readu8(v260, v261)
								v173 = bit32.bor(v259, v262)
								v105 = v105 + 2
							end
						end
						local v263 = p96 + (v168 - 1) * p98
						local v264 = p95 + (v169 - 1) * p97
						local v265 = (v263 * v_u_69 + v264) * 4
						if v_u_83 then
							local v266 = v170 * v_u_83
							v170 = math.round(v266)
							local v267 = v171 * v_u_83
							v171 = math.round(v267)
							local v268 = v172 * v_u_83
							v172 = math.round(v268)
							local v269 = v173 * v_u_83
							v173 = math.round(v269)
						elseif v_u_71 == 16 then
							v170 = bit32.rshift(v170, 8)
							v171 = bit32.rshift(v171, 8)
							v172 = bit32.rshift(v172, 8)
							v173 = bit32.rshift(v173, 8)
						end
						local v270 = v_u_90
						local v271 = bit32.lshift(v173, 24)
						local v272 = bit32.lshift(v172, 16)
						local v273 = bit32.lshift(v171, 8)
						local v274 = bit32.bor(v271, v272, v273, v170)
						buffer.writeu32(v270, v265, v274)
					end
				end
			end
		end
		if v38.interlaced then
			for v276 = 1, 7 do
				v275(v_u_6[v276], v_u_5[v276], v_u_8[v276], v_u_7[v276])
			end
		else
			v275(0, 0, 1, 1)
		end
		return {
			["width"] = v_u_69,
			["height"] = v_u_70,
			["pixels"] = v_u_90,
			["readPixel"] = function(p277, p278)
				-- upvalues: (copy) v_u_69, (copy) v_u_70, (copy) v_u_90
				local v279
				if p277 >= 1 and (p277 <= v_u_69 and p278 >= 1) then
					v279 = p278 <= v_u_70
				else
					v279 = false
				end
				assert(v279, "pixel out of range")
				local v280 = ((p278 - 1) * v_u_69 + p277 - 1) * 4
				local v281 = v_u_90
				local v282 = buffer.readu8(v281, v280)
				local v283 = v_u_90
				local v284 = v280 + 1
				local v285 = buffer.readu8(v283, v284)
				local v286 = v_u_90
				local v287 = v280 + 2
				local v288 = buffer.readu8(v286, v287)
				local v289 = v_u_90
				local v290 = v280 + 3
				return v282, v285, v288, buffer.readu8(v289, v290)
			end
		}
	end,
	["encode"] = function(p291, p292)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v293 = p292.width
		local v294 = p292.height
		local v295 = buffer.len(p291)
		local v296 = v293 * v294 * 4
		local v297 = v295 == v296
		local v298 = ("expected %* bytes, got %* bytes"):format(v296, v295)
		assert(v297, v298)
		local v299 = v293 * 4 + 1
		local v300 = buffer.create(v294 * v299)
		for v301 = 0, v294 - 1 do
			local v302 = v301 * v293 * 4
			local v303 = v301 * v299
			buffer.writeu8(v300, v303, 0)
			buffer.copy(v300, v303 + 1, p291, v302, v293 * 4)
		end
		local v304, v305 = v_u_3.deflate(v300)
		local v306 = 33 + (8 + v305 + 4) + 12
		local v307 = buffer.create(v306)
		buffer.writestring(v307, 0, "\137PNG\r\n\26\n")
		local v308 = bit32.byteswap(13)
		buffer.writeu32(v307, 8, v308)
		buffer.writestring(v307, 12, "IHDR")
		local v309 = bit32.byteswap(v293)
		buffer.writeu32(v307, 16, v309)
		local v310 = bit32.byteswap(v294)
		buffer.writeu32(v307, 20, v310)
		buffer.writeu8(v307, 24, 8)
		buffer.writeu8(v307, 25, 6)
		buffer.writeu8(v307, 26, 0)
		buffer.writeu8(v307, 27, 0)
		buffer.writeu8(v307, 28, 0)
		local v311 = v_u_2(v307, 12, 28)
		local v312 = bit32.byteswap(v311)
		buffer.writeu32(v307, 29, v312)
		local v313 = bit32.byteswap(v305)
		buffer.writeu32(v307, 33, v313)
		buffer.writestring(v307, 37, "IDAT")
		buffer.copy(v307, 41, v304, 0, v305)
		local v314 = 41 + v305
		local v315 = v_u_2(v307, 37, v314 - 1)
		local v316 = bit32.byteswap(v315)
		buffer.writeu32(v307, v314, v316)
		local v317 = v314 + 4
		buffer.writeu32(v307, v317, 0)
		buffer.writestring(v307, v314 + 8, "IEND")
		local v318 = v314 + 12
		buffer.writeu32(v307, v318, 2187346606)
		return v307
	end
}