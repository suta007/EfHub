local v_u_1 = string.byte
local v_u_2 = string.char
local v_u_3 = string.find
local v_u_4 = string.gsub
local v_u_5 = string.sub
local v_u_6 = table.concat
local v_u_7 = table.sort
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {
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
local v_u_18 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
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
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {}
local v_u_24 = {}
local v_u_25 = {
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
local v_u_26 = {
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
local v_u_27 = {
	0,
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
local v_u_28 = {}
local v_u_29 = {}
for v30 = 0, 255 do
	v_u_8[v30] = v_u_2(v30)
end
local v31 = 1
for v32 = 0, 32 do
	v_u_9[v32] = v31
	v31 = v31 * 2
end
for v33 = 1, 9 do
	v_u_10[v33] = {}
	for v38 = 0, v_u_9[v33 + 1] - 1 do
		local v35 = v38
		local v36 = 0
		for _ = 1, v33 do
			local v37 = v36 - v36 % 2 + ((v36 % 2 == 1 or v38 % 2 == 1) and 1 or 0)
			local v38 = (v38 - v38 % 2) / 2
			v36 = v37 * 2
		end
		v_u_10[v33][v35] = (v36 - v36 % 2) / 2
	end
end
local v39 = 1
local v40 = 18
local v41 = 16
local v42 = 265
for v43 = 3, 258 do
	if v43 <= 10 then
		v_u_12[v43] = v43 + 254
		v_u_13[v43] = 0
	elseif v43 == 258 then
		v_u_12[v43] = 285
		v_u_13[v43] = 0
	else
		if v40 < v43 then
			v40 = v40 + v41
			v41 = v41 * 2
			v42 = v42 + 4
			v39 = v39 + 1
		end
		local v44 = v43 - v40 - 1 + v41 / 2
		v_u_12[v43] = (v44 - v44 % (v41 / 8)) / (v41 / 8) + v42
		v_u_13[v43] = v39
		v_u_11[v43] = v44 % (v41 / 8)
	end
end
v_u_14[1] = 0
v_u_14[2] = 1
v_u_15[1] = 0
v_u_15[2] = 0
local v45 = 4
local v46 = 3
local v47 = 2
local v48 = 0
for v49 = 3, 256 do
	if v45 < v49 then
		v46 = v46 * 2
		v45 = v45 * 2
		v47 = v47 + 2
		v48 = v48 + 1
	end
	v_u_14[v49] = v49 <= v46 and v47 and v47 or v47 + 1
	v_u_15[v49] = v48 < 0 and 0 or v48
	if v45 >= 8 then
		v_u_16[v49] = (v49 - v45 / 2 - 1) % (v45 / 4)
	end
end
function v_u_29.Adler32(_, p50)
	-- upvalues: (copy) v_u_1
	if type(p50) ~= "string" then
		error(("Usage: LibDeflate:Adler32(str): \'str\' - string expected got \'%s\'."):format((type(p50))), 2)
	end
	local v51 = #p50
	local v52 = 1
	local v53 = 1
	local v54 = 0
	while v52 <= v51 - 15 do
		local v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70 = v_u_1(p50, v52, v52 + 15)
		v54 = (v54 + v53 * 16 + v55 * 16 + 15 * v56 + 14 * v57 + 13 * v58 + 12 * v59 + 11 * v60 + 10 * v61 + 9 * v62 + 8 * v63 + 7 * v64 + 6 * v65 + 5 * v66 + 4 * v67 + 3 * v68 + 2 * v69 + v70) % 65521
		v53 = (v53 + v55 + v56 + v57 + v58 + v59 + v60 + v61 + v62 + v63 + v64 + v65 + v66 + v67 + v68 + v69 + v70) % 65521
		v52 = v52 + 16
	end
	while v52 <= v51 do
		v53 = (v53 + v_u_1(p50, v52, v52)) % 65521
		v54 = (v54 + v53) % 65521
		v52 = v52 + 1
	end
	return (v54 * 65536 + v53) % 4294967296
end
local function v73(p71, p72)
	return p71 % 4294967296 == p72 % 4294967296
end
function v_u_29.CreateDictionary(p74, p75, p76, p77)
	-- upvalues: (copy) v_u_1
	if type(p75) ~= "string" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - string expected got \'%s\'."):format((type(p75))), 2)
	end
	if type(p76) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'strlen\' - number expected got \'%s\'."):format((type(p76))), 2)
	end
	if type(p77) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'adler32\' - number expected got \'%s\'."):format((type(p77))), 2)
	end
	if p76 ~= #p75 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'strlen\' does not match the actual length of \'str\'. \'strlen\': %u, \'#str\': %u . Please check if \'str\' is modified unintentionally."):format(p76, #p75))
	end
	if p76 == 0 then
		error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - Empty string is not allowed.", 2)
	end
	if p76 > 32768 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - string longer than 32768 bytes is not allowed. Got %d bytes."):format(p76), 2)
	end
	local v78 = p74:Adler32(p75)
	if p77 % 4294967296 ~= v78 % 4294967296 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'adler32\' does not match the actual adler32 of \'str\'. \'adler32\': %u, \'Adler32(str)\': %u . Please check if \'str\' is modified unintentionally."):format(p77, v78))
	end
	local v79 = {
		["adler32"] = p77,
		["hash_tables"] = {},
		["string_table"] = {},
		["strlen"] = p76
	}
	local v80 = v79.string_table
	local v81 = v79.hash_tables
	v80[1] = v_u_1(p75, 1, 1)
	v80[2] = v_u_1(p75, 2, 2)
	if p76 >= 3 then
		local v82 = v80[1] * 256 + v80[2]
		local v83 = 1
		while v83 <= p76 - 2 - 3 do
			local v84, v85, v86, v87 = v_u_1(p75, v83 + 2, v83 + 5)
			v80[v83 + 2] = v84
			v80[v83 + 3] = v85
			v80[v83 + 4] = v86
			v80[v83 + 5] = v87
			local v88 = (v82 * 256 + v84) % 16777216
			local v89 = v81[v88]
			if not v89 then
				v89 = {}
				v81[v88] = v89
			end
			v89[#v89 + 1] = v83 - p76
			local v90 = v83 + 1
			local v91 = (v88 * 256 + v85) % 16777216
			local v92 = v81[v91]
			if not v92 then
				v92 = {}
				v81[v91] = v92
			end
			v92[#v92 + 1] = v90 - p76
			local v93 = v90 + 1
			local v94 = (v91 * 256 + v86) % 16777216
			local v95 = v81[v94]
			if not v95 then
				v95 = {}
				v81[v94] = v95
			end
			v95[#v95 + 1] = v93 - p76
			local v96 = v93 + 1
			v82 = (v94 * 256 + v87) % 16777216
			local v97 = v81[v82]
			if not v97 then
				v97 = {}
				v81[v82] = v97
			end
			v97[#v97 + 1] = v96 - p76
			v83 = v96 + 1
		end
		while v83 <= p76 - 2 do
			local v98 = v_u_1(p75, v83 + 2)
			v80[v83 + 2] = v98
			v82 = (v82 * 256 + v98) % 16777216
			local v99 = v81[v82]
			if not v99 then
				v99 = {}
				v81[v82] = v99
			end
			v99[#v99 + 1] = v83 - p76
			v83 = v83 + 1
		end
	end
	return v79
end
local function v_u_105(p100)
	if p100 == nil or type(p100) ~= "table" then
		return false, ("\'dictionary\' - table expected got \'%s\'."):format((type(p100)))
	end
	local v101 = p100.adler32
	if type(v101) == "number" then
		local v102 = p100.string_table
		if type(v102) == "table" then
			local v103 = p100.strlen
			if type(v103) == "number" and (p100.strlen > 0 and (p100.strlen <= 32768 and p100.strlen == #p100.string_table)) then
				local v104 = p100.hash_tables
				if type(v104) == "table" then
					return true, ""
				end
			end
		end
	end
	return false, ("\'%s\' - corrupted dictionary."):format((type(p100)))
end
local v_u_106 = {
	[0] = {
		false,
		nil,
		0,
		0,
		0
	},
	[1] = {
		false,
		nil,
		4,
		8,
		4
	},
	[2] = {
		false,
		nil,
		5,
		18,
		8
	},
	[3] = {
		false,
		nil,
		6,
		32,
		32
	},
	[4] = {
		true,
		4,
		4,
		16,
		16
	},
	[5] = {
		true,
		8,
		16,
		32,
		32
	},
	[6] = {
		true,
		8,
		16,
		128,
		128
	},
	[7] = {
		true,
		8,
		32,
		128,
		256
	},
	[8] = {
		true,
		32,
		128,
		258,
		1024
	},
	[9] = {
		true,
		32,
		258,
		258,
		4096
	}
}
local function v_u_117(p107, p108, p109, p110, p111)
	-- upvalues: (copy) v_u_105, (copy) v_u_106
	if type(p107) ~= "string" then
		return false, ("\'str\' - string expected got \'%s\'."):format((type(p107)))
	end
	if p108 then
		local v112, v113 = v_u_105(p109)
		if not v112 then
			return false, v113
		end
	end
	if p110 then
		local v114 = type(p111)
		if v114 ~= "nil" and v114 ~= "table" then
			return false, ("\'configs\' - nil or table expected got \'%s\'."):format((type(p111)))
		end
		if v114 == "table" then
			assert(p111)
			for v115, v116 in pairs(p111) do
				if v115 ~= "level" and v115 ~= "strategy" then
					return false, ("\'configs\' - unsupported table key in the configs: \'%s\'."):format(v115)
				end
				if v115 == "level" and not v_u_106[v116] then
					return false, ("\'configs\' - unsupported \'level\': %s."):format((tostring(v116)))
				end
				if v115 == "strategy" and (v116 ~= "fixed" and (v116 ~= "huffman_only" and v116 ~= "dynamic")) then
					return false, ("\'configs\' - unsupported \'strategy\': \'%s\'."):format((tostring(v116)))
				end
			end
		end
	end
	return true, ""
end
local function v_u_131()
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_2, (copy) v_u_6
	local v_u_118 = 0
	local v_u_119 = 0
	local v_u_120 = 0
	local v_u_121 = 0
	local v_u_122 = {}
	local v_u_123 = {}
	return function(p124, p125)
		-- upvalues: (ref) v_u_119, (ref) v_u_9, (ref) v_u_120, (ref) v_u_121, (ref) v_u_118, (ref) v_u_122, (ref) v_u_8
		v_u_119 = v_u_119 + p124 * v_u_9[v_u_120]
		v_u_120 = v_u_120 + p125
		v_u_121 = v_u_121 + p125
		if v_u_120 >= 32 then
			v_u_118 = v_u_118 + 1
			v_u_122[v_u_118] = v_u_8[v_u_119 % 256] .. v_u_8[(v_u_119 - v_u_119 % 256) / 256 % 256] .. v_u_8[(v_u_119 - v_u_119 % 65536) / 65536 % 256] .. v_u_8[(v_u_119 - v_u_119 % 16777216) / 16777216 % 256]
			local v126 = v_u_9[32 - v_u_120 + p125]
			v_u_119 = (p124 - p124 % v126) / v126
			v_u_120 = v_u_120 - 32
		end
	end, function(p127)
		-- upvalues: (ref) v_u_120, (ref) v_u_118, (ref) v_u_122, (ref) v_u_119, (ref) v_u_2, (ref) v_u_121
		for _ = 1, v_u_120, 8 do
			v_u_118 = v_u_118 + 1
			v_u_122[v_u_118] = v_u_2(v_u_119 % 256)
			v_u_119 = (v_u_119 - v_u_119 % 256) / 256
		end
		v_u_120 = 0
		v_u_118 = v_u_118 + 1
		v_u_122[v_u_118] = p127
		v_u_121 = v_u_121 + #p127 * 8
	end, function(p128)
		-- upvalues: (ref) v_u_121, (ref) v_u_120, (ref) v_u_119, (ref) v_u_9, (ref) v_u_118, (ref) v_u_122, (ref) v_u_8, (ref) v_u_6, (copy) v_u_123
		if p128 == 3 then
			return v_u_121, nil
		else
			if p128 == 1 or p128 == 2 then
				local v129 = (8 - v_u_120 % 8) % 8
				if v_u_120 > 0 then
					v_u_119 = v_u_119 - v_u_9[v_u_120] + v_u_9[v_u_120 + v129]
					for _ = 1, v_u_120, 8 do
						v_u_118 = v_u_118 + 1
						v_u_122[v_u_118] = v_u_8[v_u_119 % 256]
						v_u_119 = (v_u_119 - v_u_119 % 256) / 256
					end
					v_u_119 = 0
					v_u_120 = 0
				end
				if p128 == 2 then
					v_u_121 = v_u_121 + v129
					return v_u_121, nil
				end
			end
			local v130 = v_u_6(v_u_122)
			v_u_122 = {}
			v_u_118 = 0
			v_u_123[#v_u_123 + 1] = v130
			if p128 == 0 then
				return v_u_121, nil
			else
				return v_u_121, v_u_6(v_u_123)
			end
		end
	end
end
local function v_u_140(p132, p133, p134)
	local v135 = p134 + 1
	p132[v135] = p133
	local v136 = p133[1]
	local v137 = (v135 - v135 % 2) / 2
	while v137 >= 1 and v136 < p132[v137][1] do
		local v138 = p132[v137]
		p132[v137] = p133
		p132[v135] = v138
		local v139 = (v137 - v137 % 2) / 2
		v135 = v137
		v137 = v139
	end
end
local function v_u_154(p141, p142)
	local v143 = p141[1]
	local v144 = p141[p142]
	local v145 = v144[1]
	p141[1] = v144
	p141[p142] = v143
	local v146 = p142 - 1
	local v147 = 1
	local v148 = v147 * 2
	local v149 = v148 + 1
	while v148 <= v146 do
		local v150 = p141[v148]
		local v151
		if v149 <= v146 and p141[v149][1] < v150[1] then
			local v152 = p141[v149]
			if v152[1] >= v145 then
				break
			end
			p141[v149] = v144
			p141[v147] = v152
			v151 = v149 * 2
			local v153 = v151 + 1
			v148 = v149
			v149 = v153
		else
			if v150[1] >= v145 then
				break
			end
			p141[v148] = v144
			p141[v147] = v150
			v151 = v148 * 2
			v149 = v151 + 1
		end
		v147 = v148
		v148 = v151
	end
	return v143
end
local function v_u_168(p155, p156, p157, p158)
	-- upvalues: (copy) v_u_10
	local v159 = 0
	local v160 = {}
	local v161 = {}
	for v162 = 1, p158 do
		v159 = (v159 + (p155[v162 - 1] or 0)) * 2
		v160[v162] = v159
	end
	for v163 = 0, p157 do
		local v164 = p156[v163]
		if v164 then
			local v165 = v160[v164]
			v160[v164] = v165 + 1
			if v164 <= 9 then
				v161[v163] = v_u_10[v164][v165]
			else
				local v166 = 0
				for _ = 1, v164 do
					local v167 = v166 - v166 % 2 + ((v166 % 2 == 1 or v165 % 2 == 1) and 1 or 0)
					v165 = (v165 - v165 % 2) / 2
					v166 = v167 * 2
				end
				v161[v163] = (v166 - v166 % 2) / 2
			end
		end
	end
	return v161
end
local function v_u_172(p169, p170)
	local v171
	if p169[1] < p170[1] then
		v171 = true
	elseif p169[1] == p170[1] then
		v171 = p169[2] < p170[2]
	else
		v171 = false
	end
	return v171
end
local function v_u_204(p173, p174, p175)
	-- upvalues: (copy) v_u_7, (copy) v_u_172, (copy) v_u_154, (copy) v_u_140, (copy) v_u_168
	local v176 = 0
	local v177 = {}
	local v178 = {}
	local v179 = {}
	local v180 = -1
	local v181 = {}
	local v182 = {}
	for v183, v184 in pairs(p173) do
		v176 = v176 + 1
		v177[v176] = { v184, v183 }
	end
	if v176 == 0 then
		return {}, {}, -1
	end
	if v176 == 1 then
		local v185 = v177[1][2]
		v179[v185] = 1
		v182[v185] = 0
		return v179, v182, v185
	end
	v_u_7(v177, v_u_172)
	for v186 = 1, v176 do
		v178[v186] = v177[v186]
	end
	while v176 > 1 do
		local v187 = v_u_154(v178, v176)
		local v188 = v176 - 1
		local v189 = v_u_154(v178, v188)
		local v190 = v188 - 1
		v_u_140(v178, {
			v187[1] + v189[1],
			-1,
			v187,
			v189
		}, v190)
		v176 = v190 + 1
	end
	local v191 = {
		v178[1],
		{},
		{},
		{}
	}
	v178[1][1] = 0
	local v192 = 1
	local v193 = 1
	local v194 = 0
	while v192 <= v193 do
		local v195 = v191[v192]
		local v196 = v195[1]
		local v197 = v195[2]
		local v198 = v195[3]
		local v199 = v195[4]
		if v198 then
			v193 = v193 + 1
			v191[v193] = v198
			v198[1] = v196 + 1
		end
		if v199 then
			v193 = v193 + 1
			v191[v193] = v199
			v199[1] = v196 + 1
		end
		v192 = v192 + 1
		if p174 < v196 then
			v194 = v194 + 1
			v196 = p174
		end
		if v197 >= 0 then
			v179[v197] = v196
			if v180 < v197 then
				v180 = v197 or v180
			end
			v181[v196] = (v181[v196] or 0) + 1
		end
	end
	if v194 > 0 then
		while true do
			local v200 = p174 - 1
			while (v181[v200] or 0) == 0 do
				v200 = v200 - 1
			end
			v181[v200] = v181[v200] - 1
			v181[v200 + 1] = (v181[v200 + 1] or 0) + 2
			v181[p174] = v181[p174] - 1
			v194 = v194 - 2
			if v194 <= 0 then
				local v201 = 1
				for v202 = p174, 1, -1 do
					local v203 = v181[v202] or 0
					while v203 > 0 do
						v179[v177[v201][2]] = v202
						v203 = v203 - 1
						v201 = v201 + 1
					end
				end
				goto l28
			end
		end
	else
		::l28::
		return v179, v_u_168(v181, v179, p175, p174), v180
	end
end
local function v_u_221(p205, p206, p207, p208)
	local v209 = p206 + (p208 < 0 and 0 or p208) + 1
	local v210 = 0
	local v211 = 0
	local v212 = {}
	local v213 = 0
	local v214 = {}
	local v215 = {}
	local v216 = nil
	for v217 = 0, v209 + 1 do
		local v218
		if v217 <= p206 then
			v218 = p205[v217] or 0
		else
			v218 = v217 <= v209 and (p207[v217 - p206 - 1] or 0) or nil
		end
		if v218 == v216 then
			v210 = v210 + 1
			if v218 == 0 or v210 ~= 6 then
				if v218 == 0 and v210 == 138 then
					v211 = v211 + 1
					v212[v211] = 18
					v213 = v213 + 1
					v214[v213] = 127
					v215[18] = (v215[18] or 0) + 1
					v210 = 0
				end
			else
				v211 = v211 + 1
				v212[v211] = 16
				v213 = v213 + 1
				v214[v213] = 3
				v215[16] = (v215[16] or 0) + 1
				v210 = 0
			end
		else
			if v210 == 1 then
				assert(v216)
				v211 = v211 + 1
				v212[v211] = v216
				v215[v216] = (v215[v216] or 0) + 1
			elseif v210 == 2 then
				assert(v216)
				local v219 = v211 + 1
				v212[v219] = v216
				v211 = v219 + 1
				v212[v211] = v216
				v215[v216] = (v215[v216] or 0) + 2
			elseif v210 >= 3 then
				v211 = v211 + 1
				local v220 = v216 == 0 and (v210 <= 10 and 17 or 18) or 16
				v212[v211] = v220
				v215[v220] = (v215[v220] or 0) + 1
				v213 = v213 + 1
				v214[v213] = v210 <= 10 and v210 - 3 or v210 - 11
			end
			if v218 and v218 ~= 0 then
				v211 = v211 + 1
				v212[v211] = v218
				v215[v218] = (v215[v218] or 0) + 1
				v216 = v218
				v210 = 0
			else
				v216 = v218
				v210 = 1
			end
		end
	end
	return v212, v214, v215
end
local function v_u_259(p222, p223, p224, p225, p226)
	-- upvalues: (copy) v_u_1
	local v227 = p224 - p226
	while v227 <= p225 - 15 - p226 do
		local v228 = v227 + 1
		local v229 = v227 + 2
		local v230 = v227 + 3
		local v231 = v227 + 4
		local v232 = v227 + 5
		local v233 = v227 + 6
		local v234 = v227 + 7
		local v235 = v227 + 8
		local v236 = v227 + 9
		local v237 = v227 + 10
		local v238 = v227 + 11
		local v239 = v227 + 12
		local v240 = v227 + 13
		local v241 = v227 + 14
		local v242 = v227 + 15
		local v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258 = v_u_1(p222, v227 + p226, v227 + 15 + p226)
		p223[v227] = v243
		p223[v228] = v244
		p223[v229] = v245
		p223[v230] = v246
		p223[v231] = v247
		p223[v232] = v248
		p223[v233] = v249
		p223[v234] = v250
		p223[v235] = v251
		p223[v236] = v252
		p223[v237] = v253
		p223[v238] = v254
		p223[v239] = v255
		p223[v240] = v256
		p223[v241] = v257
		p223[v242] = v258
		v227 = v227 + 16
	end
	while v227 <= p225 - p226 do
		p223[v227] = v_u_1(p222, v227 + p226, v227 + p226)
		v227 = v227 + 1
	end
	return p223
end
local function v_u_329(p260, p261, p262, p263, p264, p265, p266)
	-- upvalues: (copy) v_u_106, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_11
	local v267 = v_u_106[p260]
	local v268 = v267[1]
	local v269 = v267[2]
	local v270 = v267[3]
	local v271 = v267[4]
	local v272 = v267[5]
	local v273 = (v268 or not v270) and 2147483646 or v270
	local v274 = v272 - v272 % 4 / 4
	local v275, v276, v277
	if p266 then
		v275 = p266.hash_tables
		v276 = p266.string_table
		v277 = p266.strlen
		local v278 = p263 == 1
		assert(v278)
		if p263 <= p264 and v277 >= 2 then
			local v279 = v276[v277 - 1] * 65536 + v276[v277] * 256 + p261[1]
			local v280 = p262[v279]
			if not v280 then
				v280 = {}
				p262[v279] = v280
			end
			v280[#v280 + 1] = -1
		end
		if p263 + 1 <= p264 and v277 >= 1 then
			local v281 = v276[v277] * 65536 + p261[1] * 256 + p261[2]
			local v282 = p262[v281]
			if not v282 then
				v282 = {}
				p262[v281] = v282
			end
			v282[#v282 + 1] = 0
		end
	else
		v277 = 0
		v275 = {}
		v276 = {}
	end
	local v283 = v277 + 3
	local v284 = (p261[p263 - p265] or 0) * 256 + (p261[p263 + 1 - p265] or 0)
	local v285 = p264 + (v268 and 1 or 0)
	local v286 = 0
	local v287 = 0
	local v288 = 0
	local v289 = false
	local v290 = {}
	local v291 = 0
	local v292 = {}
	local v293 = 0
	local v294 = {}
	local v295 = 0
	local v296 = {}
	local v297 = {}
	local v298 = {}
	while true do
		if p263 > v285 then
			v298[v288 + 1] = 256
			v294[256] = (v294[256] or 0) + 1
			return v298, v292, v294, v296, v290, v297
		end
		local v299 = p263 - p265
		local v300 = p265 - 3
		local v301 = 0
		v284 = (v284 * 256 + (p261[v299 + 2] or 0)) % 16777216
		local v302 = nil
		local v303 = p262[v284]
		local v304, v305, v306
		if v303 then
			v304 = #v303
			v305 = v304
			v306 = v303
		else
			v304 = 0
			v306 = {}
			p262[v284] = v306
			if v275 then
				v303 = v275[v284]
				v305 = v303 and (#v303 or 0) or 0
			else
				v303 = v302
				v305 = 0
			end
		end
		if p263 <= p264 then
			v306[v304 + 1] = p263
		end
		local v307, v308
		if v305 > 0 and (p263 + 2 <= p264 and (not v268 or v286 < v270)) then
			local v309
			if v268 and (v269 <= v286 and v274) then
				v309 = v274
			else
				v309 = v272
			end
			local v310 = p264 - p263
			local v311 = (v310 >= 257 and 257 or v310) + v299
			local v312 = v299 + 3
			v307 = v287
			while true do
				if v305 < 1 or v309 <= 0 then
					v308 = v301
					break
				end
				local v313 = v303[v305]
				if p263 - v313 > 32768 then
					v308 = v301
					break
				end
				local v314
				if v313 < p263 then
					if v313 >= -257 then
						local v315 = v313 - v300
						v314 = v312
						while v312 <= v311 and p261[v315] == p261[v312] do
							v312 = v312 + 1
							v315 = v315 + 1
						end
					else
						local v316 = v283 + v313
						local v317 = v312
						while v317 <= v311 and v276[v316] == p261[v317] do
							v317 = v317 + 1
							v316 = v316 + 1
						end
						v314 = v312
						v312 = v317
					end
					v308 = v312 - v299
					if v301 < v308 then
						v287 = p263 - v313
					else
						v308 = v301
					end
					if v271 <= v308 then
						break
					end
				else
					v308 = v301
					v314 = v312
				end
				v305 = v305 - 1
				v309 = v309 - 1
				if v305 == 0 and (v313 > 0 and v275) then
					v303 = v275[v284]
					v305 = v303 and (#v303 or 0) or 0
				end
				v301 = v308
				v312 = v314
			end
		else
			v308 = v301
			v307 = v287
		end
		if not v268 then
			v307 = v287
			v286 = v308
		end
		if v268 and not v289 or (v286 <= 3 and (v286 ~= 3 or v307 >= 4096) or v308 > v286) then
			if v268 and not v289 then
				p263 = p263 + 1
				v289 = true
			else
				if v268 then
					v299 = v299 - 1 or v299
				end
				local v318 = p261[v299]
				v288 = v288 + 1
				v298[v288] = v318
				v294[v318] = (v294[v318] or 0) + 1
				p263 = p263 + 1
			end
		else
			local v319 = v_u_12[v286]
			local v320 = v_u_13[v286]
			local v321, v322, v323
			if v307 <= 256 then
				v321 = v_u_14[v307]
				v322 = v_u_16[v307]
				v323 = v_u_15[v307]
			else
				local v324 = 512
				v321 = 16
				v323 = 7
				local v325 = 384
				while true do
					if v307 <= v325 then
						v322 = (v307 - v324 / 2 - 1) % (v324 / 4)
					end
					if v307 <= v324 then
						v322 = (v307 - v324 / 2 - 1) % (v324 / 4)
						v321 = v321 + 1
					end
					v321 = v321 + 2
					v323 = v323 + 1
					v325 = v325 * 2
					v324 = v324 * 2
				end
			end
			v288 = v288 + 1
			v298[v288] = v319
			v294[v319] = (v294[v319] or 0) + 1
			v295 = v295 + 1
			v296[v295] = v321
			v297[v321] = (v297[v321] or 0) + 1
			if v320 > 0 then
				local v326 = v_u_11[v286]
				v291 = v291 + 1
				v292[v291] = v326
			end
			if v323 > 0 then
				v293 = v293 + 1
				v290[v293] = v322
			end
			for v327 = p263 + 1, p263 + v286 - (v268 and 2 or 1) do
				v284 = (v284 * 256 + (p261[v327 - p265 + 2] or 0)) % 16777216
				if v286 <= v273 then
					local v328 = p262[v284]
					if not v328 then
						v328 = {}
						p262[v284] = v328
					end
					v328[#v328 + 1] = v327
				end
			end
			p263 = p263 + v286 - (v268 and 1 or 0)
			v289 = false
		end
		v286 = v308
	end
end
local function v_u_348(p330, p331)
	-- upvalues: (copy) v_u_204, (copy) v_u_221, (copy) v_u_17
	local v332, v333, v334 = v_u_204(p330, 15, 285)
	local v335, v336, v337 = v_u_204(p331, 15, 29)
	local v338, v339, v340 = v_u_221(v332, v334, v335, v337)
	local v341, v342 = v_u_204(v340, 7, 18)
	local v343 = 0
	for v344 = 1, 19 do
		if (v341[v_u_17[v344]] or 0) ~= 0 then
			v343 = v344
		end
	end
	local v345 = v343 - 4
	local v346 = v334 + 1 - 257
	local v347 = v337 + 1 - 1
	return v346, v347 < 0 and 0 or v347, v345, v341, v342, v338, v339, v332, v333, v335, v336
end
local function v_u_363(p349, p350, p351, p352, p353, p354, p355)
	-- upvalues: (copy) v_u_18
	local v356 = 17 + (p351 + 4) * 3
	for v357 = 1, #p353 do
		local v358 = p353[v357]
		v356 = v356 + p352[v358]
		if v358 >= 16 then
			v356 = v356 + (v358 == 16 and 2 or (v358 == 17 and 3 or 7))
		end
	end
	local v359 = 0
	for v360 = 1, #p349 do
		local v361 = p349[v360]
		v356 = v356 + p354[v361]
		if v361 > 256 then
			v359 = v359 + 1
			if v361 > 264 and v361 < 285 then
				v356 = v356 + v_u_18[v361 - 256]
			end
			local v362 = p350[v359]
			v356 = v356 + p355[v362]
			if v362 > 3 then
				v356 = v356 + ((v362 - v362 % 2) / 2 - 1)
			end
		end
	end
	return v356
end
local function v_u_391(p364, p365, p366, p367, p368, p369, p370, p371, p372, p373, p374, p375, p376, p377, p378, p379, p380)
	-- upvalues: (copy) v_u_17, (copy) v_u_18
	p364(p365 and 1 or 0, 1)
	p364(2, 2)
	p364(p370, 5)
	p364(p371, 5)
	p364(p372, 4)
	for v381 = 1, p372 + 4 do
		p364(p373[v_u_17[v381]] or 0, 3)
	end
	local v382 = 1
	for v383 = 1, #p375 do
		local v384 = p375[v383]
		p364(p374[v384], p373[v384])
		if v384 >= 16 then
			p364(p376[v382], v384 == 16 and 2 or (v384 == 17 and 3 or 7))
			v382 = v382 + 1
		end
	end
	local v385 = 0
	local v386 = 0
	local v387 = 0
	for v388 = 1, #p366 do
		local v389 = p366[v388]
		p364(p378[v389], p377[v389])
		if v389 > 256 then
			v386 = v386 + 1
			if v389 > 264 and v389 < 285 then
				v385 = v385 + 1
				p364(p367[v385], v_u_18[v389 - 256])
			end
			local v390 = p368[v386]
			p364(p380[v390], p379[v390])
			if v390 > 3 then
				v387 = v387 + 1
				p364(p369[v387], (v390 - v390 % 2) / 2 - 1)
			end
		end
	end
end
local function v_u_399(p392, p393)
	-- upvalues: (ref) v_u_22, (copy) v_u_18
	local v394 = 3
	local v395 = 0
	for v396 = 1, #p392 do
		local v397 = p392[v396]
		v394 = v394 + v_u_22[v397]
		if v397 > 256 then
			v395 = v395 + 1
			if v397 > 264 and v397 < 285 then
				v394 = v394 + v_u_18[v397 - 256]
			end
			local v398 = p393[v395]
			v394 = v394 + 5
			if v398 > 3 then
				v394 = v394 + ((v398 - v398 % 2) / 2 - 1)
			end
		end
	end
	return v394
end
local function v_u_412(p400, p401, p402, p403, p404, p405)
	-- upvalues: (ref) v_u_23, (ref) v_u_22, (copy) v_u_18, (ref) v_u_24
	p400(p401 and 1 or 0, 1)
	p400(1, 2)
	local v406 = 0
	local v407 = 0
	local v408 = 0
	for v409 = 1, #p402 do
		local v410 = p402[v409]
		p400(v_u_23[v410], v_u_22[v410])
		if v410 > 256 then
			v406 = v406 + 1
			if v410 > 264 and v410 < 285 then
				v407 = v407 + 1
				p400(p403[v407], v_u_18[v410 - 256])
			end
			local v411 = p404[v406]
			p400(v_u_24[v411], 5)
			if v411 > 3 then
				v408 = v408 + 1
				p400(p405[v408], (v411 - v411 % 2) / 2 - 1)
			end
		end
	end
end
local function v_u_423(p413, p414, p415, p416, p417, p418, p419)
	-- upvalues: (copy) v_u_9
	local v420 = p418 - p417 + 1 <= 65535
	assert(v420)
	p413(p415 and 1 or 0, 1)
	p413(0, 2)
	local v421 = (8 - (p419 + 3) % 8) % 8
	if v421 > 0 then
		p413(v_u_9[v421] - 1, v421)
	end
	local v422 = p418 - p417 + 1
	p413(v422, 16)
	p413(255 - v422 % 256 + (255 - (v422 - v422 % 256) / 256) * 256, 16)
	p414(p416:sub(p417, p418))
end
local function v_u_479(p424, p425, p426, p427, p428, p429)
	-- upvalues: (copy) v_u_259, (copy) v_u_329, (copy) v_u_348, (copy) v_u_363, (copy) v_u_399, (copy) v_u_423, (copy) v_u_412, (copy) v_u_391
	local v430 = {}
	local v431 = {}
	local v432 = nil
	local v433 = 0
	local v434 = 0
	local v435, _ = p427(3)
	local v436 = #p428
	local v437 = nil
	local v438 = nil
	if p424 then
		if p424.level then
			v437 = p424.level
		end
		if p424.strategy then
			v438 = p424.strategy
		end
	end
	if not v437 then
		if v436 < 2048 then
			v437 = 7
		elseif v436 > 65536 then
			v437 = 3
		else
			v437 = 5
		end
	end
	while not v432 do
		local v439
		if v433 == 0 then
			v433 = 1
			v439 = 0
			v434 = 65535
		else
			v433 = v434 + 1
			v434 = v434 + 32768
			v439 = v433 - 32768 - 1
		end
		if v436 <= v434 then
			v434 = v436
			v432 = true
		else
			v432 = false
		end
		local v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454, v455, v456
		if v437 == 0 then
			v440 = nil
			v441 = nil
			v442 = {}
			v443 = nil
			v444 = {}
			v445 = {}
			v446 = {}
			v447 = {}
			v448 = {}
			v449 = {}
			v450 = {}
			v451 = nil
			v452 = {}
			v453 = nil
			v454 = {}
			v455 = {}
			v456 = {}
		else
			v_u_259(p428, v430, v433, v434 + 3, v439)
			if v433 == 1 and p429 then
				local v457 = p429.string_table
				local v458 = p429.strlen
				for v459 = 0, -v458 + 1 < -257 and -257 or -v458 + 1, -1 do
					v430[v459] = v457[v458 + v459]
				end
			end
			local v460, v461
			if v438 == "huffman_only" then
				v456 = {}
				v_u_259(p428, v456, v433, v434, v433 - 1)
				v456[v434 - v433 + 2] = 256
				v460 = {}
				v444 = {}
				for v462 = 1, v434 - v433 + 2 do
					local v463 = v456[v462]
					v460[v463] = (v460[v463] or 0) + 1
				end
				v461 = {}
				v445 = {}
				v446 = {}
			else
				v456, v444, v460, v445, v446, v461 = v_u_329(v437, v430, v431, v433, v434, v439, p429)
			end
			v451, v440, v453, v450, v455, v442, v447, v452, v449, v454, v448 = v_u_348(v460, v461)
			v443 = v_u_363(v456, v445, v453, v450, v442, v452, v454)
			v441 = v_u_399(v456, v445)
		end
		local v464 = v434 - v433 + 1 <= 65535
		assert(v464)
		local v465 = 3 + (8 - (v435 + 3) % 8) % 8 + 32 + (v434 - v433 + 1) * 8
		local v466
		if v441 and (v441 < v465 and v441) then
			v466 = v441
		else
			v466 = v465
		end
		if v443 and (v443 < v466 and v443) then
			v466 = v443
		end
		if v437 == 0 or v438 ~= "fixed" and (v438 ~= "dynamic" and v465 == v466) then
			v_u_423(p425, p426, v432, p428, v433, v434, v435)
			v435 = v435 + v465
		elseif v438 == "dynamic" or v438 ~= "fixed" and v441 ~= v466 then
			if v438 == "dynamic" or v443 == v466 then
				v_u_391(p425, v432, v456, v444, v445, v446, v451, v440, v453, v450, v455, v442, v447, v452, v449, v454, v448)
				v435 = v435 + assert(v443)
			end
		else
			v_u_412(p425, v432, v456, v444, v445, v446)
			v435 = v435 + assert(v441)
		end
		local v467
		if v432 then
			v467 = p427(3)
		else
			v467 = p427(0)
		end
		local v468 = v467 == v435
		assert(v468)
		if not v432 then
			if p429 and v433 == 1 then
				local v469 = 0
				while v430[v469] do
					v430[v469] = nil
					v469 = v469 - 1
				end
			end
			local v470 = 1
			p429 = nil
			for v471 = v434 - 32767, v434 do
				v430[v470] = v430[v471 - v439]
				v470 = v470 + 1
			end
			for v472, v473 in pairs(v431) do
				local v474 = #v473
				if v474 > 0 and v434 + 1 - v473[1] > 32768 then
					if v474 == 1 then
						v431[v472] = nil
					else
						local v475 = 0
						local v476 = {}
						for v477 = 2, v474 do
							local v478 = v473[v477]
							if v434 + 1 - v478 <= 32768 then
								v475 = v475 + 1
								v476[v475] = v478
							end
						end
						v431[v472] = v476
					end
				end
			end
		end
	end
end
local function v_u_488(p480, p481, p482)
	-- upvalues: (copy) v_u_131, (copy) v_u_479
	local v483, v484, v485 = v_u_131()
	v_u_479(p482, v483, v484, v485, p480, p481)
	local v486, v487 = v485(1)
	assert(v487)
	return v487, (8 - v486 % 8) % 8
end
local function v_u_511(p489, p490, p491)
	-- upvalues: (copy) v_u_131, (copy) v_u_479, (copy) v_u_29
	local v492, v493, v494 = v_u_131()
	v492(120, 8)
	local v495 = p490 and 1 or 0
	local v496 = 128 + v495 * 32
	v492(v496 + (31 - (30720 + v496) % 31), 8)
	if v495 == 1 then
		assert(p490)
		local v497 = p490.adler32
		local v498 = v497 % 256
		local v499 = (v497 - v498) / 256
		local v500 = v499 % 256
		local v501 = (v499 - v500) / 256
		local v502 = v501 % 256
		v492((v501 - v502) / 256 % 256, 8)
		v492(v502, 8)
		v492(v500, 8)
		v492(v498, 8)
	end
	v_u_479(p491, v492, v493, v494, p489, p490)
	v494(2)
	local v503 = v_u_29:Adler32(p489)
	local v504 = v503 % 256
	local v505 = (v503 - v504) / 256
	local v506 = v505 % 256
	local v507 = (v505 - v506) / 256
	local v508 = v507 % 256
	v492((v507 - v508) / 256 % 256, 8)
	v492(v508, 8)
	v492(v506, 8)
	v492(v504, 8)
	local v509, v510 = v494(1)
	assert(v510)
	return v510, (8 - v509 % 8) % 8
end
function v_u_29.CompressDeflate(_, p512, p513)
	-- upvalues: (copy) v_u_117, (copy) v_u_488
	local v514, v515 = v_u_117(p512, false, nil, true, p513)
	if not v514 then
		error("Usage: LibDeflate:CompressDeflate(str, configs): " .. v515, 2)
	end
	return v_u_488(p512, nil, p513)
end
function v_u_29.CompressDeflateWithDict(_, p516, p517, p518)
	-- upvalues: (copy) v_u_117, (copy) v_u_488
	local v519, v520 = v_u_117(p516, true, p517, true, p518)
	if not v519 then
		error("Usage: LibDeflate:CompressDeflateWithDict" .. "(str, dictionary, configs): " .. v520, 2)
	end
	return v_u_488(p516, p517, p518)
end
function v_u_29.CompressZlib(_, p521, p522)
	-- upvalues: (copy) v_u_117, (copy) v_u_511
	local v523, v524 = v_u_117(p521, false, nil, true, p522)
	if not v523 then
		error("Usage: LibDeflate:CompressZlib(str, configs): " .. v524, 2)
	end
	return v_u_511(p521, nil, p522)
end
function v_u_29.CompressZlibWithDict(_, p525, p526, p527)
	-- upvalues: (copy) v_u_117, (copy) v_u_511
	local v528, v529 = v_u_117(p525, true, p526, true, p527)
	if not v528 then
		error("Usage: LibDeflate:CompressZlibWithDict" .. "(str, dictionary, configs): " .. v529, 2)
	end
	return v_u_511(p525, p526, p527)
end
local function v_u_572(p_u_530)
	-- upvalues: (copy) v_u_9, (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_10
	local v_u_531 = #p_u_530
	local v_u_532 = 1
	local v_u_533 = 0
	local v_u_534 = 0
	return function(p535)
		-- upvalues: (ref) v_u_9, (ref) v_u_533, (ref) v_u_534, (copy) p_u_530, (ref) v_u_532, (ref) v_u_1
		local v536 = v_u_9[p535]
		if p535 <= v_u_533 then
			local v537 = v_u_534 % v536
			v_u_534 = (v_u_534 - v537) / v536
			v_u_533 = v_u_533 - p535
			return v537
		end
		local v538 = v_u_9[v_u_533]
		local v539, v540, v541, v542 = v_u_1(p_u_530, v_u_532, v_u_532 + 3)
		v_u_534 = v_u_534 + ((v539 or 0) + (v540 or 0) * 256 + (v541 or 0) * 65536 + (v542 or 0) * 16777216) * v538
		v_u_532 = v_u_532 + 4
		v_u_533 = v_u_533 + 32 - p535
		local v543 = v_u_534 % v536
		v_u_534 = (v_u_534 - v543) / v536
		return v543
	end, function(p544, p545, p546)
		-- upvalues: (ref) v_u_533, (ref) v_u_534, (ref) v_u_2, (copy) v_u_531, (ref) v_u_532, (copy) p_u_530, (ref) v_u_5
		local v547 = v_u_533 % 8 == 0
		assert(v547)
		local v548
		if v_u_533 / 8 < p544 then
			v548 = v_u_533 / 8 or p544
		else
			v548 = p544
		end
		for _ = 1, v548 do
			local v549 = v_u_534 % 256
			p546 = p546 + 1
			p545[p546] = v_u_2(v549)
			v_u_534 = (v_u_534 - v549) / 256
		end
		v_u_533 = v_u_533 - v548 * 8
		local v550 = p544 - v548
		if (v_u_531 - v_u_532 - v550 + 1) * 8 + v_u_533 < 0 then
			return -1
		end
		for v551 = v_u_532, v_u_532 + v550 - 1 do
			p546 = p546 + 1
			p545[p546] = v_u_5(p_u_530, v551, v551)
		end
		v_u_532 = v_u_532 + v550
		return p546
	end, function(p552, p553, p554)
		-- upvalues: (ref) v_u_533, (copy) p_u_530, (ref) v_u_9, (ref) v_u_532, (ref) v_u_1, (ref) v_u_534, (ref) v_u_10
		local v555, v556, v557
		if p554 > 0 then
			if v_u_533 < 15 and p_u_530 then
				local v558 = v_u_9[v_u_533]
				local v559, v560, v561, v562 = v_u_1(p_u_530, v_u_532, v_u_532 + 3)
				v_u_534 = v_u_534 + ((v559 or 0) + (v560 or 0) * 256 + (v561 or 0) * 65536 + (v562 or 0) * 16777216) * v558
				v_u_532 = v_u_532 + 4
				v_u_533 = v_u_533 + 32
			end
			local v563 = v_u_9[p554]
			v_u_533 = v_u_533 - p554
			local v564 = v_u_534 % v563
			v_u_534 = (v_u_534 - v564) / v563
			local v565 = v_u_10[p554][v564]
			v555 = p552[p554]
			if v565 < v555 then
				return p553[v565]
			end
			v556 = v555 * 2
			v557 = v565 * 2
		else
			v557 = 0
			v556 = 0
			v555 = 0
		end
		for v566 = p554 + 1, 15 do
			local v567 = v_u_534 % 2
			v_u_534 = (v_u_534 - v567) / 2
			v_u_533 = v_u_533 - 1
			if v567 == 1 then
				v557 = v557 + 1 - v557 % 2 or v557
			end
			local v568 = p552[v566] or 0
			local v569 = v557 - v556
			if v569 < v568 then
				return p553[v555 + v569]
			end
			v555 = v555 + v568
			v556 = (v556 + v568) * 2
			v557 = v557 * 2
		end
		return -10
	end, function()
		-- upvalues: (copy) v_u_531, (ref) v_u_532, (ref) v_u_533
		return (v_u_531 - v_u_532 + 1) * 8 + v_u_533
	end, function()
		-- upvalues: (ref) v_u_533, (ref) v_u_9, (ref) v_u_534
		local v570 = v_u_533 % 8
		local v571 = v_u_9[v570]
		v_u_533 = v_u_533 - v570
		v_u_534 = (v_u_534 - v_u_534 % v571) / v571
	end
end
local function v_u_580(p573, p574)
	-- upvalues: (copy) v_u_572
	local v575, v576, v577, v578, v579 = v_u_572(p573)
	return {
		["ReadBits"] = v575,
		["ReadBytes"] = v576,
		["Decode"] = v577,
		["ReaderBitlenLeft"] = v578,
		["SkipToByteBoundary"] = v579,
		["buffer_size"] = 0,
		["buffer"] = {},
		["result_buffer"] = {},
		["dictionary"] = p574
	}
end
local function v_u_595(p581, p582, p583)
	local v584 = p583
	local v585 = {}
	for v586 = 0, p582 do
		local v587 = p581[v586] or 0
		if v587 > 0 and (v587 < p583 and v587) then
			p583 = v587
		end
		v585[v587] = (v585[v587] or 0) + 1
	end
	if v585[0] == p582 + 1 then
		return 0, v585, {}, 0
	end
	local v588 = 1
	for v589 = 1, v584 do
		v588 = v588 * 2 - (v585[v589] or 0)
		if v588 < 0 then
			return v588, {}, {}, 0
		end
	end
	local v590 = { 0 }
	for v591 = 1, v584 - 1 do
		v590[v591 + 1] = v590[v591] + (v585[v591] or 0)
	end
	local v592 = {}
	for v593 = 0, p582 do
		local v594 = p581[v593] or 0
		if v594 ~= 0 then
			v592[v590[v594]] = v593
			v590[v594] = v590[v594] + 1
		end
	end
	return v588, v585, v592, p583
end
local function v_u_621(p596, p597, p598, p599, p600, p601, p602)
	-- upvalues: (copy) v_u_8, (copy) v_u_25, (copy) v_u_18, (copy) v_u_26, (copy) v_u_27, (copy) v_u_6
	local v603 = p596.buffer
	local v604 = p596.buffer_size
	local v605 = p596.ReadBits
	local v606 = p596.Decode
	local v607 = p596.ReaderBitlenLeft
	local v608 = p596.result_buffer
	local v609 = p596.dictionary
	local v610, v611, v612
	if v609 and not v603[0] then
		v610 = v609.string_table
		v611 = v609.strlen
		v612 = -v611 + 1
		for v613 = 0, -v611 + 1 < -257 and -257 or -v611 + 1, -1 do
			v603[v613] = v_u_8[v610[v611 + v613]]
		end
	else
		v610 = {}
		v612 = 1
		v611 = nil
	end
	while true do
		local v614 = v606(p597, p598, p599)
		if v614 < 0 or v614 > 285 then
			break
		end
		if v614 < 256 then
			v604 = v604 + 1
			v603[v604] = v_u_8[v614]
		elseif v614 > 256 then
			local v615 = v614 - 256
			local v616 = v_u_25[v615]
			if v615 >= 8 then
				v616 = v616 + v605(v_u_18[v615]) or v616
			end
			v614 = v606(p600, p601, p602)
			if v614 < 0 or v614 > 29 then
				return -10
			end
			local v617 = v_u_26[v614]
			if v617 > 4 then
				v617 = v617 + v605(v_u_27[v614]) or v617
			end
			local v618 = v604 - v617 + 1
			if v618 < v612 then
				return -11
			end
			if v618 >= -257 then
				for _ = 1, v616 do
					v604 = v604 + 1
					v603[v604] = v603[v618]
					v618 = v618 + 1
				end
			else
				local v619 = v611 + v618
				for _ = 1, v616 do
					v604 = v604 + 1
					v603[v604] = v_u_8[v610[v619]]
					v619 = v619 + 1
				end
			end
		end
		if v607() < 0 then
			return 2
		end
		if v604 >= 65536 then
			v608[#v608 + 1] = v_u_6(v603, "", 1, 32768)
			for v620 = 32769, v604 do
				v603[v620 - 32768] = v603[v620]
			end
			v604 = v604 - 32768
			v603[v604 + 1] = nil
		end
		if v614 == 256 then
			p596.buffer_size = v604
			return 0
		end
	end
	return -10
end
local function v_u_634(p622)
	-- upvalues: (copy) v_u_6
	local v623 = p622.buffer
	local v624 = p622.buffer_size
	local v625 = p622.ReadBits
	local v626 = p622.ReadBytes
	local v627 = p622.ReaderBitlenLeft
	local v628 = p622.SkipToByteBoundary
	local v629 = p622.result_buffer
	v628()
	local v630 = v625(16)
	if v627() < 0 then
		return 2
	end
	local v631 = v625(16)
	if v627() < 0 then
		return 2
	end
	if v630 % 256 + v631 % 256 ~= 255 then
		return -2
	end
	if (v630 - v630 % 256) / 256 + (v631 - v631 % 256) / 256 ~= 255 then
		return -2
	end
	local v632 = v626(v630, v623, v624)
	if v632 < 0 then
		return 2
	end
	if v632 >= 65536 then
		v629[#v629 + 1] = v_u_6(v623, "", 1, 32768)
		for v633 = 32769, v632 do
			v623[v633 - 32768] = v623[v633]
		end
		v632 = v632 - 32768
		v623[v632 + 1] = nil
	end
	p622.buffer_size = v632
	return 0
end
local function v_u_661(p635)
	-- upvalues: (copy) v_u_17, (copy) v_u_595, (copy) v_u_621
	local v636 = p635.ReadBits
	local v637 = p635.Decode
	local v638 = v636(5) + 257
	local v639 = v636(5) + 1
	local v640 = v636(4) + 4
	if v638 > 286 or v639 > 30 then
		return -3
	end
	local v641 = {}
	for v642 = 1, v640 do
		v641[v_u_17[v642]] = v636(3)
	end
	local v643, v644, v645, v646 = v_u_595(v641, 18, 7)
	if v643 ~= 0 then
		return -4
	end
	local v647 = 0
	local v648 = {}
	local v649 = {}
	while v647 < v638 + v639 do
		local v650 = v637(v644, v645, v646)
		if v650 < 0 then
			return v650
		end
		if v650 < 16 then
			if v647 < v638 then
				v648[v647] = v650
			else
				v649[v647 - v638] = v650
			end
			v647 = v647 + 1
		else
			local v651 = 0
			local v652
			if v650 == 16 then
				if v647 == 0 then
					return -5
				end
				if v647 - 1 < v638 then
					v651 = v648[v647 - 1]
				else
					v651 = v649[v647 - v638 - 1]
				end
				v652 = 3 + v636(2)
			elseif v650 == 17 then
				v652 = 3 + v636(3)
			else
				v652 = 11 + v636(7)
			end
			if v647 + v652 > v638 + v639 then
				return -6
			end
			while v652 > 0 do
				v652 = v652 - 1
				if v647 < v638 then
					v648[v647] = v651
				else
					v649[v647 - v638] = v651
				end
				v647 = v647 + 1
			end
		end
	end
	if (v648[256] or 0) == 0 then
		return -9
	end
	local v653, v654, v655, v656 = v_u_595(v648, v638 - 1, 15)
	if v653 ~= 0 and (v653 < 0 or v638 ~= (v654[0] or 0) + (v654[1] or 0)) then
		return -7
	end
	local v657, v658, v659, v660 = v_u_595(v649, v639 - 1, 15)
	return v657 ~= 0 and (v657 < 0 or v639 ~= (v658[0] or 0) + (v658[1] or 0)) and -8 or v_u_621(p635, v654, v655, v656, v658, v659, v660)
end
local function v_u_667(p662)
	-- upvalues: (copy) v_u_634, (copy) v_u_621, (ref) v_u_28, (ref) v_u_19, (ref) v_u_20, (ref) v_u_21, (copy) v_u_661, (copy) v_u_6
	local v663 = p662.ReadBits
	local v664 = nil
	while not v664 do
		v664 = v663(1) == 1
		local v665 = v663(2)
		local v666
		if v665 == 0 then
			v666 = v_u_634(p662)
		elseif v665 == 1 then
			v666 = v_u_621(p662, v_u_28, v_u_19, 7, v_u_20, v_u_21, 5)
		else
			if v665 ~= 2 then
				return nil, -1
			end
			v666 = v_u_661(p662)
		end
		if v666 ~= 0 then
			return nil, v666
		end
	end
	p662.result_buffer[#p662.result_buffer + 1] = v_u_6(p662.buffer, "", 1, p662.buffer_size)
	return v_u_6(p662.result_buffer), 0
end
local function v_u_674(p668, p669)
	-- upvalues: (copy) v_u_580, (copy) v_u_667
	local v670 = v_u_580(p668, p669)
	local v671, v672 = v_u_667(v670)
	if not v671 then
		return nil, v672
	end
	local v673 = v670.ReaderBitlenLeft()
	return v671, (v673 - v673 % 8) / 8
end
local function v_u_699(p675, p676)
	-- upvalues: (copy) v_u_580, (copy) v_u_667, (copy) v_u_29
	local v677 = v_u_580(p675, p676)
	local v678 = v677.ReadBits
	local v679 = v678(8)
	if v677.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	local v680 = v679 % 16
	local v681 = (v679 - v680) / 16
	if v680 ~= 8 then
		return nil, -12
	end
	if v681 > 7 then
		return nil, -13
	end
	local v682 = v678(8)
	if v677.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	if (v679 * 256 + v682) % 31 ~= 0 then
		return nil, -14
	end
	local v683 = (v682 - v682 % 32) / 32 % 2
	local _ = (v682 - v682 % 64) / 64 % 4
	if v683 == 1 then
		if not p676 then
			return nil, -16
		end
		local v684 = v678(8)
		local v685 = v678(8)
		local v686 = v678(8)
		local v687 = v678(8)
		local v688 = v684 * 16777216 + v685 * 65536 + v686 * 256 + v687
		if v677.ReaderBitlenLeft() < 0 then
			return nil, 2
		end
		local v689 = p676.adler32
		if v688 % 4294967296 ~= v689 % 4294967296 then
			return nil, -17
		end
	end
	local v690, v691 = v_u_667(v677)
	if not v690 then
		return nil, v691
	end
	v677.SkipToByteBoundary()
	local v692 = v678(8)
	local v693 = v678(8)
	local v694 = v678(8)
	local v695 = v678(8)
	if v677.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	local v696 = v692 * 16777216 + v693 * 65536 + v694 * 256 + v695
	local v697 = v_u_29:Adler32(v690)
	if v696 % 4294967296 ~= v697 % 4294967296 then
		return nil, -15
	end
	local v698 = v677.ReaderBitlenLeft()
	return v690, (v698 - v698 % 8) / 8
end
function v_u_29.DecompressDeflate(_, p700)
	-- upvalues: (copy) v_u_674
	local v701, v702
	if type(p700) == "string" then
		v701 = true
		v702 = ""
	else
		v702 = ("\'str\' - string expected got \'%s\'."):format((type(p700)))
		v701 = false
	end
	if not v701 then
		error("Usage: LibDeflate:DecompressDeflate(str): " .. v702, 2)
	end
	return v_u_674(p700)
end
function v_u_29.DecompressDeflateWithDict(_, p703, p704)
	-- upvalues: (copy) v_u_105, (copy) v_u_674
	local v705, v706
	if type(p703) == "string" then
		local v707
		v707, v705 = v_u_105(p704)
		if v707 then
			v706 = true
			v705 = ""
		else
			v706 = false
		end
	else
		v705 = ("\'str\' - string expected got \'%s\'."):format((type(p703)))
		v706 = false
	end
	if not v706 then
		error("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): " .. v705, 2)
	end
	return v_u_674(p703, p704)
end
function v_u_29.DecompressZlib(_, p708)
	-- upvalues: (copy) v_u_699
	local v709, v710
	if type(p708) == "string" then
		v709 = true
		v710 = ""
	else
		v710 = ("\'str\' - string expected got \'%s\'."):format((type(p708)))
		v709 = false
	end
	if not v709 then
		error("Usage: LibDeflate:DecompressZlib(str): " .. v710, 2)
	end
	return v_u_699(p708)
end
function v_u_29.DecompressZlibWithDict(_, p711, p712)
	-- upvalues: (copy) v_u_105, (copy) v_u_699
	local v713, v714
	if type(p711) == "string" then
		local v715
		v715, v713 = v_u_105(p712)
		if v715 then
			v714 = true
			v713 = ""
		else
			v714 = false
		end
	else
		v713 = ("\'str\' - string expected got \'%s\'."):format((type(p711)))
		v714 = false
	end
	if not v714 then
		error("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): " .. v713, 2)
	end
	return v_u_699(p711, p712)
end
local v716 = {}
local v717 = v716
for v718 = 0, 143 do
	v717[v718] = 8
end
for v719 = 144, 255 do
	v717[v719] = 9
end
v717[256] = 7
v717[257] = 7
v717[258] = 7
v717[259] = 7
v717[260] = 7
v717[261] = 7
v717[262] = 7
v717[263] = 7
v717[264] = 7
v717[265] = 7
v717[266] = 7
v717[267] = 7
v717[268] = 7
v717[269] = 7
v717[270] = 7
v717[271] = 7
v717[272] = 7
v717[273] = 7
v717[274] = 7
v717[275] = 7
v717[276] = 7
v717[277] = 7
v717[278] = 7
v717[279] = 7
v717[280] = 8
v717[281] = 8
v717[282] = 8
v717[283] = 8
v717[284] = 8
v717[285] = 8
v717[286] = 8
v717[287] = 8
local v720 = {}
for v721 = 0, 31 do
	v720[v721] = 5
end
local v722, v723, v724 = v_u_595(v717, 287, 9)
local v725 = v723
local _ = v724
local v726 = v722 == 0
assert(v726)
local v727, v728, v729 = v_u_595(v720, 31, 5)
local v730 = v728
local _ = v729
local v731 = v727 == 0
assert(v731)
local _ = v_u_168(v725, v717, 287, 9)
local _ = v_u_168(v730, v720, 31, 5)
local v_u_732 = {
	["\0"] = "%z",
	["("] = "%(",
	[")"] = "%)",
	["."] = "%.",
	["%"] = "%%",
	["+"] = "%+",
	["-"] = "%-",
	["*"] = "%*",
	["?"] = "%?",
	["["] = "%[",
	["]"] = "%]",
	["^"] = "%^",
	["$"] = "%$"
}
function v_u_29.CreateCodec(_, p733, p734, p735)
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_732, (copy) v_u_8, (copy) v_u_4, (copy) v_u_3
	if type(p733) ~= "string" or (type(p734) ~= "string" or type(p735) ~= "string") then
		error("Usage: LibDeflate:CreateCodec(reserved_chars, escape_chars, map_chars): All arguments must be string.", 2)
	end
	if p734 == "" then
		return nil, "No escape characters supplied."
	end
	if #p733 < #p735 then
		return nil, "The number of reserved characters must be at least as many as the number of mapped chars."
	end
	if p733 == "" then
		return nil, "No characters to encode."
	end
	local v736 = p733 .. p734 .. p735
	local v737 = {}
	for v738 = 1, #v736 do
		local v739 = v_u_1(v736, v738, v738)
		if v737[v739] then
			return nil, "There must be no duplicate characters in the concatenation of reserved_chars, escape_chars and map_chars."
		end
		v737[v739] = true
	end
	local v_u_740 = {}
	local v_u_741 = {}
	local v742 = {}
	local v_u_743 = {}
	if #p735 > 0 then
		local v744 = {}
		local v745 = {}
		for v746 = 1, #p735 do
			local v747 = v_u_5(p733, v746, v746)
			local v748 = v_u_5(p735, v746, v746)
			v_u_743[v747] = v748
			v742[#v742 + 1] = v747
			v744[v748] = v747
			v745[#v745 + 1] = v748
		end
		local v749 = #v_u_740 + 1
		local v750, _ = v_u_6(v745):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
		v_u_740[v749] = "([" .. v750 .. "])"
		v_u_741[#v_u_741 + 1] = v744
	end
	local v751 = 1
	local v752 = v_u_5(p734, v751, v751)
	local v753 = 0
	local v754 = {}
	local v755 = {}
	for v756 = 1, #v736 do
		local v757 = v_u_5(v736, v756, v756)
		if not v_u_743[v757] then
			while v753 >= 256 or v737[v753] do
				v753 = v753 + 1
				if v753 > 255 then
					local v758 = #v_u_740 + 1
					local v759, _ = v752:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
					local v760, _ = v_u_6(v754):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
					v_u_740[v758] = v759 .. "([" .. v760 .. "])"
					v_u_741[#v_u_741 + 1] = v755
					v751 = v751 + 1
					v752 = v_u_5(p734, v751, v751)
					if not v752 or v752 == "" then
						return nil, "Out of escape characters."
					end
					v753 = 0
					v754 = {}
					v755 = {}
				end
			end
			local v761 = v_u_8[v753]
			v_u_743[v757] = v752 .. v761
			v742[#v742 + 1] = v757
			v755[v761] = v757
			v754[#v754 + 1] = v761
			v753 = v753 + 1
		end
		if v756 == #v736 then
			local v762 = #v_u_740 + 1
			local v763, _ = v752:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
			local v764, _ = v_u_6(v754):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
			v_u_740[v762] = v763 .. "([" .. v764 .. "])"
			v_u_741[#v_u_741 + 1] = v755
		end
	end
	local v765 = {}
	local v766, _ = v_u_6(v742):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
	local v_u_767 = "([" .. v766 .. "])"
	function v765.Encode(_, p768)
		-- upvalues: (ref) v_u_4, (copy) v_u_767, (copy) v_u_743
		if type(p768) ~= "string" then
			error(("Usage: codec:Encode(str): \'str\' - string expected got \'%s\'."):format((type(p768))), 2)
		end
		local v769, _ = v_u_4(p768, v_u_767, v_u_743)
		return v769
	end
	local v_u_770 = #v_u_740
	local v771, _ = p733:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_732)
	local v_u_772 = "([" .. v771 .. "])"
	function v765.Decode(_, p773)
		-- upvalues: (ref) v_u_3, (copy) v_u_772, (copy) v_u_770, (ref) v_u_4, (copy) v_u_740, (copy) v_u_741
		if type(p773) ~= "string" then
			error(("Usage: codec:Decode(str): \'str\' - string expected got \'%s\'."):format((type(p773))), 2)
		end
		if v_u_3(p773, v_u_772) then
			return nil
		end
		for v774 = 1, v_u_770 do
			p773 = v_u_4(p773, v_u_740[v774], v_u_741[v774])
		end
		return p773
	end
	return v765, ""
end
v_u_29.internals = {
	["LoadStringToTable"] = v_u_259,
	["IsValidDictionary"] = v_u_105,
	["IsEqualAdler32"] = v73
}
return table.freeze(v_u_29)