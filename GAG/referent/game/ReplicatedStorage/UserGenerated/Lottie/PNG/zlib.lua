local v_u_1 = {
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	13,
	15,
	17,
	19,
	23,
	27,
	31,
	35,
	43,
	51,
	59,
	67,
	83,
	99,
	115,
	131,
	163,
	195,
	227,
	258
}
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = {
	1,
	1,
	1,
	1,
	2,
	2,
	2,
	2,
	3,
	3,
	3,
	3,
	4,
	4,
	4,
	4,
	5,
	5,
	5,
	5,
	0
}
local v_u_5 = {}
local v_u_6 = {
	1,
	2,
	3,
	4,
	5,
	7,
	9,
	13,
	17,
	25,
	33,
	49,
	65,
	97,
	129,
	193,
	257,
	385,
	513,
	769,
	1025,
	1537,
	2049,
	3073,
	4097,
	6145,
	8193,
	12289,
	16385,
	24577
}
local function v_u_21(p7)
	local v8 = table.create(15, 0)
	v8[0] = 0
	for _, v9 in p7 do
		if v9 > 0 then
			v8[v9] = (v8[v9] or 0) + 1
		end
	end
	local v10 = table.create(15)
	local v11 = 1
	for v12 = 1, 15 do
		local v13 = v11 + v8[v12 - 1]
		v11 = bit32.lshift(v13, 1)
		v10[v12] = v11
	end
	local v14 = {}
	local v15 = {}
	local v16 = {}
	for v17, v18 in p7 do
		if v18 > 0 then
			v14[v10[v18]] = v17 - 1
			local v19 = v17 - 1
			local v20 = v10[v18]
			v15[v19] = bit32.extract(v20, 0, v18)
			v16[v17 - 1] = v18
			v10[v18] = v10[v18] + 1
		end
	end
	return v14, v15, v16
end
local v22 = {
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	9,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	7,
	8,
	8,
	8,
	8,
	8,
	8,
	8,
	8
}
local v_u_23 = {
	16,
	17,
	18,
	0,
	8,
	7,
	9,
	6,
	10,
	5,
	11,
	4,
	12,
	3,
	13,
	2,
	14,
	1,
	15
}
local v_u_24 = {
	0,
	0,
	0,
	1,
	1,
	2,
	2,
	3,
	3,
	4,
	4,
	5,
	5,
	6,
	6,
	7,
	7,
	8,
	8,
	9,
	9,
	10,
	10,
	11,
	11,
	12,
	12,
	13,
	13
}
for v25 = 3, 258 do
	local v26 = nil
	for v27 = #v_u_1, 1, -1 do
		if v_u_1[v27] <= v25 then
			v26 = v27
			break
		end
	end
	v_u_2[v25] = 256 + v26
	v_u_3[v25] = v25 - v_u_1[v26]
	v_u_5[v25] = v_u_4[v26 - 8] or 0
end
local v_u_28 = {}
for v29 = 1, 1024 do
	local v30 = nil
	for v31 = #v_u_6, 1, -1 do
		if v_u_6[v31] <= v29 then
			v30 = v31
			break
		end
	end
	v_u_28[v29] = v30
end
local v_u_32, v_u_33, v_u_34 = v_u_21(v22)
local v_u_35, v_u_36, v_u_37 = v_u_21(table.create(32, 5))
local function v_u_39(p38)
	-- upvalues: (copy) v_u_28
	return p38 >= 1025 and (p38 < 1537 and 21 or (p38 < 2049 and 22 or (p38 < 3073 and 23 or (p38 < 4097 and 24 or (p38 < 6145 and 25 or (p38 < 8193 and 26 or (p38 < 12289 and 27 or (p38 < 16385 and 28 or (p38 < 24577 and 29 or 30))))))))) or v_u_28[p38]
end
local function v_u_50(p40, p41, p42)
	local v43 = 1
	local v44 = 0
	local v45 = 0
	for v46 = p41, p41 + p42 - 1 do
		v43 = v43 + buffer.readu8(p40, v46)
		v44 = v44 + v43
		v45 = v45 + 1
		if v45 == 8400000 then
			v43 = v43 % 65521
			v44 = v44 % 65521
			v45 = 0
		end
	end
	local v47 = v44 % 65521
	local v48 = bit32.lshift(v47, 16)
	local v49 = v43 % 65521
	return bit32.bor(v48, v49)
end
return {
	["inflate"] = function(p51, p52)
		-- upvalues: (copy) v_u_32, (copy) v_u_35, (copy) v_u_23, (copy) v_u_21, (copy) v_u_1, (copy) v_u_4, (copy) v_u_6, (copy) v_u_24, (copy) v_u_50
		-- block 115
		local v53 = buffer.readu8(p51, 0)
		local v54 = buffer.readu8(p51, 1)
		local v55 = bit32.extract(v53, 0, 4) == 8
		assert(v55, "invalid zlib comp method")
		local v56 = bit32.extract(v53, 4, 4) <= 7
		assert(v56, "invalid zlib window size")
		local v57 = bit32.extract(v54, 5, 1) == 0
		assert(v57, "preset dictionary is not allowed")
		local v58 = bit32.lshift(v53, 8)
		local v59 = bit32.bor(v58, v54) % 31 == 0
		assert(v59, "zlib header sum mismatch")
		local v60 = 2
		local v61 = 0
		local v62 = 0
		while true do
			local v63 = v60
			local v64 = buffer.readu8(p51, v63)
			local v65 = v61
			local v66 = bit32.extract(v64, v65)
			v61 = v61 + 1
			if v61 == 8 then
				v61 = 0
				v60 = v60 + 1
			end
			local v67 = buffer.readbits(p51, v60 * 8 + v61, 2)
			v61 = v61 + 2
			local v68 = v61
			v60 = v60 + bit32.rshift(v68, 3)
			local v69 = v61
			v61 = bit32.band(v69, 7)
			local v70 = v67 ~= 3
			assert(v70, "reserved btype")
			if v67 ~= 0 then
				break
			end
			if v61 > 0 then
				v60 = v60 + 1
				v61 = 0
			end
			local v71 = v60
			local v72 = buffer.readu16(p51, v71)
			local v73 = v60 + 2
			local v74 = buffer.readu16(p51, v73)
			local v75 = bit32.bxor(v72, v74) == 65535
			assert(v75, "len ~= nlen")
			v60 = v60 + 4
			buffer.copy(p52, v62, p51, v60, v72)
			v62 = v62 + v72
			v60 = v60 + v72
			::l25::
			if v66 == 1 then
				if v61 > 0 then
					v61 = 0
					v60 = v60 + 1
				end
				local v76 = v_u_50(p52, 0, buffer.len(p52))
				local v77 = v60
				local v78 = buffer.readu32(p51, v77)
				local v79 = v76 == bit32.byteswap(v78)
				assert(v79, "adler-32 checksum mismatch")
				return v62
			end
		end
		local v80 = v_u_32
		local v81 = v_u_35
		if v67 ~= 2 then
			::l27::
			local v82 = 2
			local v83 = v60
			local v84 = buffer.readu8(p51, v83)
			local v85 = v61
			local v86 = bit32.extract(v84, v85)
			v61 = v61 + 1
			if v61 == 8 then
				v61 = 0
				v60 = v60 + 1
			end
			v154 = v82 + v86
			local v87 = v80
			goto l79
		end
		local v88 = buffer.readbits(p51, v60 * 8 + v61, 5)
		v61 = v61 + 5
		local v89 = v61
		v60 = v60 + bit32.rshift(v89, 3)
		local v90 = v61
		v61 = bit32.band(v90, 7)
		local v91 = v88 + 257
		local v92 = buffer.readbits(p51, v60 * 8 + v61, 5)
		v61 = v61 + 5
		local v93 = v61
		v60 = v60 + bit32.rshift(v93, 3)
		local v94 = v61
		v61 = bit32.band(v94, 7)
		local v95 = v92 + 1
		local v96 = buffer.readbits(p51, v60 * 8 + v61, 4)
		v61 = v61 + 4
		local v97 = v61
		v60 = v60 + bit32.rshift(v97, 3)
		local v98 = v61
		v61 = bit32.band(v98, 7)
		local v99 = v96 + 4
		local v100 = table.create(19, 0)
		for v101 = 1, v99 do
			local v102 = v_u_23[v101] + 1
			local v103 = buffer.readbits(p51, v60 * 8 + v61, 3)
			v61 = v61 + 3
			local v104 = v61
			v60 = v60 + bit32.rshift(v104, 3)
			local v105 = v61
			v61 = bit32.band(v105, 7)
			v100[v102] = v103
		end
		local v106 = v_u_21(v100)
		local v107 = table.create(v91)
		local v108 = nil
		::l51::
		local v109 = 2
		local v110 = v60
		local v111 = buffer.readu8(p51, v110)
		local v112 = v61
		local v113 = bit32.extract(v111, v112)
		v61 = v61 + 1
		if v61 == 8 then
			v61 = 0
			v60 = v60 + 1
		end
		local v114 = v109 + v113
		while not v106[v114] do
			local v115 = 2 * v114
			local v116 = buffer.readu8(p51, v60)
			local v117 = bit32.extract(v116, v61)
			v61 = v61 + 1
			if v61 == 8 then
				v61 = 0
				v60 = v60 + 1
			end
			v114 = v115 + v117
		end
		local v118 = v106[v114]
		local v119 = 1
		if v118 <= 15 then
			v108 = v118
		elseif v118 == 16 then
			local v120 = buffer.readbits(p51, v60 * 8 + v61, 2)
			v61 = v61 + 2
			local v121 = v61
			v60 = v60 + bit32.rshift(v121, 3)
			local v122 = v61
			v61 = bit32.band(v122, 7)
			v119 = v120 + 3
		elseif v118 == 17 then
			v108 = 0
			local v123 = buffer.readbits(p51, v60 * 8 + v61, 3)
			v61 = v61 + 3
			local v124 = v61
			v60 = v60 + bit32.rshift(v124, 3)
			local v125 = v61
			v61 = bit32.band(v125, 7)
			v119 = v123 + 3
		elseif v118 == 18 then
			v108 = 0
			local v126 = buffer.readbits(p51, v60 * 8 + v61, 7)
			v61 = v61 + 7
			local v127 = v61
			v60 = v60 + bit32.rshift(v127, 3)
			local v128 = v61
			v61 = bit32.band(v128, 7)
			v119 = v126 + 11
		end
		for _ = 1, v119 do
			table.insert(v107, v108)
		end
		if v91 <= #v107 then
			v80 = v_u_21(v107)
			local v129 = table.create(v95)
			local v130 = nil
			::l72::
			local v131 = 2
			local v132 = v60
			local v133 = buffer.readu8(p51, v132)
			local v134 = v61
			local v135 = bit32.extract(v133, v134)
			v61 = v61 + 1
			if v61 == 8 then
				v61 = 0
				v60 = v60 + 1
			end
			local v136 = v131 + v135
			while not v106[v136] do
				local v137 = 2 * v136
				local v138 = buffer.readu8(p51, v60)
				local v139 = bit32.extract(v138, v61)
				v61 = v61 + 1
				if v61 == 8 then
					v61 = 0
					v60 = v60 + 1
				end
				v136 = v137 + v139
			end
			local v140 = v106[v136]
			local v141 = 1
			if v140 <= 15 then
				v130 = v140
			elseif v140 == 16 then
				local v142 = buffer.readbits(p51, v60 * 8 + v61, 2)
				v61 = v61 + 2
				local v143 = v61
				v60 = v60 + bit32.rshift(v143, 3)
				local v144 = v61
				v61 = bit32.band(v144, 7)
				v141 = v142 + 3
			elseif v140 == 17 then
				v130 = 0
				local v145 = buffer.readbits(p51, v60 * 8 + v61, 3)
				v61 = v61 + 3
				local v146 = v61
				v60 = v60 + bit32.rshift(v146, 3)
				local v147 = v61
				v61 = bit32.band(v147, 7)
				v141 = v145 + 3
			elseif v140 == 18 then
				v130 = 0
				local v148 = buffer.readbits(p51, v60 * 8 + v61, 7)
				v61 = v61 + 7
				local v149 = v61
				v60 = v60 + bit32.rshift(v149, 3)
				local v150 = v61
				v61 = bit32.band(v150, 7)
				v141 = v148 + 11
			end
			for _ = 1, v141 do
				table.insert(v129, v130)
			end
			if v95 <= #v129 then
				v81 = v_u_21(v129)
				goto l27
			end
			goto l72
		end
		goto l51
		::l75::
		local v151 = 2 * v154
		local v152 = buffer.readu8(p51, v60)
		local v153 = bit32.extract(v152, v61)
		v61 = v61 + 1
		if v61 == 8 then
			v61 = 0
			v60 = v60 + 1
		end
		local v154 = v151 + v153
		::l79::
		if v80[v154] then
			goto l76
		else
			goto l75
		end
		::l76::
		local v155 = v80[v154]
		if v155 < 256 then
			buffer.writeu8(p52, v62, v155)
			v62 = v62 + 1
		elseif v155 > 256 then
			local v156 = v_u_1[v155 - 256]
			if v155 > 268 then
				local v157 = v_u_4[v155 - 264]
				local v158 = buffer.readbits(p51, v60 * 8 + v61, v157)
				v61 = v61 + v157
				local v159 = v61
				v60 = v60 + bit32.rshift(v159, 3)
				local v160 = v61
				v61 = bit32.band(v160, 7)
				v156 = v156 + v158
			elseif v155 > 264 then
				local v161 = buffer.readu8(p51, v60)
				local v162 = bit32.extract(v161, v61)
				v61 = v61 + 1
				if v61 == 8 then
					v61 = 0
					v60 = v60 + 1
				end
				v156 = v156 + v162
			end
			local v163 = 2
			local v164 = v60
			local v165 = buffer.readu8(p51, v164)
			local v166 = v61
			local v167 = bit32.extract(v165, v166)
			v61 = v61 + 1
			if v61 == 8 then
				v61 = 0
				v60 = v60 + 1
			end
			local v168 = v163 + v167
			local v169 = v81
			while not v81[v168] do
				local v170 = 2 * v168
				local v171 = buffer.readu8(p51, v60)
				local v172 = bit32.extract(v171, v61)
				v61 = v61 + 1
				if v61 == 8 then
					v61 = 0
					v60 = v60 + 1
				end
				v168 = v170 + v172
			end
			local v173 = v81[v168]
			local v174 = v_u_6[v173 + 1]
			if v173 > 5 then
				local v175 = v_u_24[v173]
				local v176 = buffer.readbits(p51, v60 * 8 + v61, v175)
				v61 = v61 + v175
				local v177 = v61
				v60 = v60 + bit32.rshift(v177, 3)
				local v178 = v61
				v61 = bit32.band(v178, 7)
				v174 = v174 + v176
			elseif v173 > 3 then
				local v179 = buffer.readu8(p51, v60)
				local v180 = bit32.extract(v179, v61)
				v61 = v61 + 1
				if v61 == 8 then
					v61 = 0
					v60 = v60 + 1
				end
				v174 = v174 + v180
			end
			if v156 <= v174 then
				buffer.copy(p52, v62, p52, v62 - v174, v156)
				v62 = v62 + v156
				v81 = v169
			else
				repeat
					local v181 = math.min(v156, v174)
					buffer.copy(p52, v62, p52, v62 - v174, v181)
					v62 = v62 + v181
					v156 = v156 - v181
					v174 = v174 + v181
				until v156 == 0
				v81 = v169
			end
			goto l82
		end
		::l82::
		if v155 == 256 then
			goto l25
		end
		v80 = v87
		goto l27
	end,
	["deflate"] = function(p182)
		-- upvalues: (copy) v_u_33, (copy) v_u_34, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_39, (copy) v_u_36, (copy) v_u_37, (copy) v_u_6, (copy) v_u_24, (copy) v_u_50
		local v183 = buffer.len(p182)
		local v184 = buffer.create
		local v185 = v183 / 32768
		local v_u_186 = v184(math.ceil(v185) * 5 + v183 + 6)
		buffer.writeu16(v_u_186, 0, 24184)
		local v_u_187 = 2
		local v_u_188 = 0
		local function v_u_220(p189, p190)
			-- upvalues: (copy) v_u_186, (ref) v_u_187, (ref) v_u_188
			local v191 = bit32.rshift(p189, 1)
			local v192 = bit32.band(v191, 1431655765)
			local v193 = bit32.lshift(p189, 1)
			local v194 = bit32.band(v193, 2863311530)
			local v195 = bit32.bor(v192, v194)
			local v196 = bit32.rshift(v195, 2)
			local v197 = bit32.band(v196, 858993459)
			local v198 = bit32.lshift(v195, 2)
			local v199 = bit32.band(v198, 3435973836)
			local v200 = bit32.bor(v197, v199)
			local v201 = bit32.rshift(v200, 4)
			local v202 = bit32.band(v201, 252645135)
			local v203 = bit32.lshift(v200, 4)
			local v204 = bit32.band(v203, 4042322160)
			local v205 = bit32.bor(v202, v204)
			local v206 = bit32.rshift(v205, 8)
			local v207 = bit32.band(v206, 16711935)
			local v208 = bit32.lshift(v205, 8)
			local v209 = bit32.band(v208, 4278255360)
			local v210 = bit32.bor(v207, v209)
			local v211 = bit32.rshift(v210, 16)
			local v212 = bit32.lshift(v210, 16)
			local v213 = bit32.bor(v211, v212)
			local v214 = 32 - p190
			local v215 = bit32.rshift(v213, v214)
			local v216 = bit32.lshift(1, p190) - 1
			local v217 = bit32.band(v215, v216)
			buffer.writebits(v_u_186, v_u_187 * 8 + v_u_188, p190, v217)
			v_u_188 = v_u_188 + p190
			local v218 = v_u_188
			v_u_187 = v_u_187 + bit32.rshift(v218, 3)
			local v219 = v_u_188
			v_u_188 = bit32.band(v219, 7)
		end
		local function v233(p221, p222)
			-- upvalues: (ref) v_u_2, (copy) v_u_220, (ref) v_u_33, (ref) v_u_34, (ref) v_u_3, (ref) v_u_5, (copy) v_u_186, (ref) v_u_187, (ref) v_u_188, (ref) v_u_39, (ref) v_u_36, (ref) v_u_37, (ref) v_u_6, (ref) v_u_24
			local v223 = v_u_2[p222]
			v_u_220(v_u_33[v223], v_u_34[v223])
			if p222 > 10 then
				local v224 = v_u_3[p222]
				local v225 = v_u_5[p222]
				buffer.writebits(v_u_186, v_u_187 * 8 + v_u_188, v225, v224)
				v_u_188 = v_u_188 + v225
				local v226 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v226, 3)
				local v227 = v_u_188
				v_u_188 = bit32.band(v227, 7)
			end
			local v228 = v_u_39(p221)
			v_u_220(v_u_36[v228 - 1], v_u_37[v228 - 1])
			if v228 > 3 then
				local v229 = p221 - v_u_6[v228]
				local v230 = v_u_24[v228 - 1]
				buffer.writebits(v_u_186, v_u_187 * 8 + v_u_188, v230, v229)
				v_u_188 = v_u_188 + v230
				local v231 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v231, 3)
				local v232 = v_u_188
				v_u_188 = bit32.band(v232, 7)
			end
		end
		local v234 = {}
		local v235 = {}
		local v236 = {}
		local v237 = 0
		local v238 = v_u_188
		for v245 = 0, v183 - 1, 32768 do
			local v240 = v245 + 32768
			local v241 = math.min(v183, v240)
			local v242 = v245
			local v243 = {}
			local v244 = 0
			local v245
			while v245 < v241 - 3 do
				local v246 = buffer.readu32(p182, v245)
				local v247 = bit32.band(v246, 16777215)
				local v248 = v236[v247] or 0
				v237 = v237 + 1
				v234[v237] = v245
				v235[v237] = v248
				local v249 = v237
				v236[v247] = v249
				local v250 = v235[v249]
				local v251 = -1
				local v252 = 0
				local v253 = 0
				while true do
					if not v250 or ((v234[v250] or (-1 / 0)) < v245 - 32510 or (v252 >= 12 or v253 >= 96)) then
						v255 = v251
						v254 = v253
						break
					end
					local v254 = 3
					local v255 = v234[v250]
					local v256 = false
					local v257 = v245 + 258
					if math.min(v241, v257) > v245 + v253 then
						local v258 = v255 + v253
						local v259 = buffer.readu8(p182, v258)
						local v260 = v245 + v253
						if v259 ~= buffer.readu8(p182, v260) then
							v256 = true
						end
					end
					while not v256 and (v254 < 258 and v245 + v254 < v241) do
						local v261 = v255 + v254
						local v262 = buffer.readu8(p182, v261)
						local v263 = v245 + v254
						if v262 ~= buffer.readu8(p182, v263) then
							break
						end
						v254 = v254 + 1
					end
					if v253 < v254 then
						if v254 >= 258 then
							break
						end
					else
						v255 = v251
						v254 = v253
					end
					v250 = v235[v250]
					v252 = v252 + 1
					v253 = v254
					v251 = v255
				end
				if v254 == 0 then
					local v264 = buffer.readu8(p182, v245)
					v244 = v244 + v_u_34[v264]
					local v265 = vector.create(0, v264)
					table.insert(v243, v265)
					v245 = v245 + 1
				else
					local v266 = v_u_39(v245 - v255)
					v244 = v244 + (v_u_34[v_u_2[v254]] + v_u_5[v254] + v_u_37[v266 - 1] + (v_u_24[v266 - 1] or 0))
					local v267 = v245 - v255
					local v268 = vector.create(1, v267, v254)
					table.insert(v243, v268)
					local v269 = v245 + 1
					local v270 = v245 + v254 - 1
					local v271 = v241 - 4
					for v272 = v269, math.min(v270, v271) do
						local v273 = buffer.readu32(p182, v272)
						local v274 = bit32.band(v273, 16777215)
						local v275 = v236[v274] or 0
						v237 = v237 + 1
						v234[v237] = v272
						v235[v237] = v275
						v236[v274] = v237
					end
					v245 = v245 + v254
				end
			end
			while v245 < v241 do
				local v276 = buffer.readu8(p182, v245)
				v244 = v244 + v_u_34[v276]
				local v277 = vector.create(0, v276)
				table.insert(v243, v277)
				v245 = v245 + 1
			end
			local v278 = v244 + v_u_34[256]
			table.insert(v243, Vector3.new(0, 256, 0))
			local v279
			if v241 == v183 then
				buffer.writebits(v_u_186, v_u_187 * 8 + v238, 1, 1)
				v_u_188 = v238 + 1
				local v280 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v280, 3)
				local v281 = v_u_188
				v_u_188 = bit32.band(v281, 7)
				v279 = v_u_188
			else
				buffer.writebits(v_u_186, v_u_187 * 8 + v238, 1, 0)
				v_u_188 = v238 + 1
				local v282 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v282, 3)
				local v283 = v_u_188
				v_u_188 = bit32.band(v283, 7)
				v279 = v_u_188
			end
			local v284 = v241 - v242
			local v285 = v278 / 8
			local v286 = math.ceil(v285) + 1
			local v287 = v284 / 32768
			if v286 < math.ceil(v287) * 5 + v284 then
				buffer.writebits(v_u_186, v_u_187 * 8 + v279, 2, 1)
				v_u_188 = v279 + 2
				local v288 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v288, 3)
				local v289 = v_u_188
				v_u_188 = bit32.band(v289, 7)
				v238 = v_u_188
				for _, v290 in v243 do
					if v290.x == 0 then
						local v291 = v290.y
						v_u_220(v_u_33[v291], v_u_34[v291])
					else
						v233(v290.y, v290.z)
					end
				end
			else
				buffer.writebits(v_u_186, v_u_187 * 8 + v279, 2, 0)
				v_u_188 = v279 + 2
				local v292 = v_u_188
				v_u_187 = v_u_187 + bit32.rshift(v292, 3)
				local v293 = v_u_188
				v_u_188 = bit32.band(v293, 7)
				if v_u_188 > 0 then
					v_u_187 = v_u_187 + 1
					v_u_188 = 0
					v238 = v_u_188
				else
					v238 = v_u_188
				end
				local v294 = v_u_187
				buffer.writeu16(v_u_186, v294, v284)
				local v295 = v_u_187 + 2
				local v296 = bit32.bxor(65535, v284)
				buffer.writeu16(v_u_186, v295, v296)
				buffer.copy(v_u_186, v_u_187 + 4, p182, v242, v284)
				v_u_187 = v_u_187 + (v284 + 4)
			end
			if v237 > 50000 then
				table.clear(v234)
				table.clear(v235)
				table.clear(v236)
				v237 = 0
			end
		end
		if v238 > 0 then
			v_u_187 = v_u_187 + 1
		end
		local v297 = v_u_50(p182, 0, buffer.len(p182))
		local v298 = bit32.byteswap(v297)
		local v299 = v_u_187
		buffer.writeu32(v_u_186, v299, v298)
		return v_u_186, v_u_187 + 4
	end
}