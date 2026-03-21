local v_u_1 = bit32.bxor
local v_u_2 = bit32.rrotate
local v_u_3 = buffer.copy
local v_u_4 = buffer.create
local v_u_5 = buffer.fromstring
local v_u_6 = buffer.len
local v_u_7 = buffer.readu8
local v_u_8 = buffer.readu16
local v_u_9 = buffer.readu32
local v_u_10 = buffer.tostring
local v_u_11 = buffer.writestring
local v12 = buffer.writeu8
local v13 = buffer.writeu16
local v_u_14 = buffer.writeu32
local v_u_15 = math.floor
local v_u_16 = string.sub
local v_u_17 = v_u_4(131072)
local v_u_18 = v_u_4(65536)
local v_u_19 = v_u_4(65536)
local v_u_20 = v_u_4(65536)
local v_u_21 = v_u_4(65536)
local v_u_22 = v_u_4(65536)
local v23 = v_u_4(256)
local v24 = v_u_4(256)
local v25 = v_u_4(256)
local v26 = v_u_4(256)
local v27 = v_u_4(256)
v12(v23, 0, 99)
local v28 = 1
local v29 = 1
local function v33(p30, p31)
	-- upvalues: (copy) v_u_1, (copy) v_u_15
	local v32 = 0
	for _ = 0, 7 do
		if p31 % 2 == 1 then
			v32 = v_u_1(v32, p30)
		end
		if p30 >= 128 then
			p30 = v_u_1(p30 * 2 % 256, 27)
		else
			p30 = p30 * 2 % 256
		end
		p31 = v_u_15(p31 / 2)
	end
	return v32
end
local function v_u_70(p34, p35, p36, p37)
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_9, (copy) v_u_2, (copy) v_u_17, (copy) v_u_15, (copy) v_u_8, (copy) v_u_1, (copy) v_u_14
	if p37 then
		v_u_3(p36, 0, p34, 0, p35)
	else
		v_u_11(p36, 0, p34, p35)
	end
	local v38 = v_u_2(v_u_9(p36, p35 - 4), 8)
	local v39 = 0.5
	if p35 == 32 then
		for v40 = 32, 192, 32 do
			v39 = v39 * 2 % 229
			local v41 = v_u_1(v_u_9(p36, v40 - 32), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), v39)
			v_u_14(p36, v40, v41)
			local v42 = v_u_1(v_u_9(p36, v40 - 28), v41)
			v_u_14(p36, v40 + 4, v42)
			local v43 = v_u_1(v_u_9(p36, v40 - 24), v42)
			v_u_14(p36, v40 + 8, v43)
			local v44 = v_u_1(v_u_9(p36, v40 - 20), v43)
			v_u_14(p36, v40 + 12, v44)
			local v45 = v_u_1(v_u_9(p36, v40 - 16), v_u_8(v_u_17, v_u_15(v44 / 65536) * 2) * 65536 + v_u_8(v_u_17, v44 % 65536 * 2))
			v_u_14(p36, v40 + 16, v45)
			local v46 = v_u_1(v_u_9(p36, v40 - 12), v45)
			v_u_14(p36, v40 + 20, v46)
			local v47 = v_u_1(v_u_9(p36, v40 - 8), v46)
			v_u_14(p36, v40 + 24, v47)
			local v48 = v_u_1(v_u_9(p36, v40 - 4), v47)
			v_u_14(p36, v40 + 28, v48)
			v38 = v_u_2(v48, 8)
		end
		local v49 = v_u_1(v_u_9(p36, 192), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), 64)
		v_u_14(p36, 224, v49)
		local v50 = v_u_1(v_u_9(p36, 196), v49)
		v_u_14(p36, 228, v50)
		local v51 = v_u_1(v_u_9(p36, 200), v50)
		v_u_14(p36, 232, v51)
		v_u_14(p36, 236, (v_u_1(v_u_9(p36, 204), v51)))
		return p36
	elseif p35 == 24 then
		for v52 = 24, 168, 24 do
			v39 = v39 * 2 % 229
			local v53 = v_u_1(v_u_9(p36, v52 - 24), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), v39)
			v_u_14(p36, v52, v53)
			local v54 = v_u_1(v_u_9(p36, v52 - 20), v53)
			v_u_14(p36, v52 + 4, v54)
			local v55 = v_u_1(v_u_9(p36, v52 - 16), v54)
			v_u_14(p36, v52 + 8, v55)
			local v56 = v_u_1(v_u_9(p36, v52 - 12), v55)
			v_u_14(p36, v52 + 12, v56)
			local v57 = v_u_1(v_u_9(p36, v52 - 8), v56)
			v_u_14(p36, v52 + 16, v57)
			local v58 = v_u_1(v_u_9(p36, v52 - 4), v57)
			v_u_14(p36, v52 + 20, v58)
			v38 = v_u_2(v58, 8)
		end
		local v59 = v_u_1(v_u_9(p36, 168), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), 128)
		v_u_14(p36, 192, v59)
		local v60 = v_u_1(v_u_9(p36, 172), v59)
		v_u_14(p36, 196, v60)
		local v61 = v_u_1(v_u_9(p36, 176), v60)
		v_u_14(p36, 200, v61)
		v_u_14(p36, 204, (v_u_1(v_u_9(p36, 180), v61)))
		return p36
	else
		for v62 = 16, 144, 16 do
			v39 = v39 * 2 % 229
			local v63 = v_u_1(v_u_9(p36, v62 - 16), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), v39)
			v_u_14(p36, v62, v63)
			local v64 = v_u_1(v_u_9(p36, v62 - 12), v63)
			v_u_14(p36, v62 + 4, v64)
			local v65 = v_u_1(v_u_9(p36, v62 - 8), v64)
			v_u_14(p36, v62 + 8, v65)
			local v66 = v_u_1(v_u_9(p36, v62 - 4), v65)
			v_u_14(p36, v62 + 12, v66)
			v38 = v_u_2(v66, 8)
		end
		local v67 = v_u_1(v_u_9(p36, 144), v_u_8(v_u_17, v_u_15(v38 / 65536) * 2) * 65536 + v_u_8(v_u_17, v38 % 65536 * 2), 54)
		v_u_14(p36, 160, v67)
		local v68 = v_u_1(v_u_9(p36, 148), v67)
		v_u_14(p36, 164, v68)
		local v69 = v_u_1(v_u_9(p36, 152), v68)
		v_u_14(p36, 168, v69)
		v_u_14(p36, 172, (v_u_1(v_u_9(p36, 156), v69)))
		return p36
	end
end
local function v_u_126(p71, p72, p73, p74, p75, p76)
	-- upvalues: (copy) v_u_7, (copy) v_u_1, (copy) v_u_18, (copy) v_u_19, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14
	local v77 = v_u_1(v_u_7(p73, p74), (v_u_7(p71, 0)))
	local v78 = v_u_1(v_u_7(p73, p74 + 1), (v_u_7(p71, 1)))
	local v79 = v_u_1(v_u_7(p73, p74 + 2), (v_u_7(p71, 2)))
	local v80 = v_u_1(v_u_7(p73, p74 + 3), (v_u_7(p71, 3)))
	local v81 = v_u_1(v_u_7(p73, p74 + 4), (v_u_7(p71, 4)))
	local v82 = v_u_1(v_u_7(p73, p74 + 5), (v_u_7(p71, 5)))
	local v83 = v_u_1(v_u_7(p73, p74 + 6), (v_u_7(p71, 6)))
	local v84 = v_u_1(v_u_7(p73, p74 + 7), (v_u_7(p71, 7)))
	local v85 = v_u_1(v_u_7(p73, p74 + 8), (v_u_7(p71, 8)))
	local v86 = v_u_1(v_u_7(p73, p74 + 9), (v_u_7(p71, 9)))
	local v87 = v_u_1(v_u_7(p73, p74 + 10), (v_u_7(p71, 10)))
	local v88 = v_u_1(v_u_7(p73, p74 + 11), (v_u_7(p71, 11)))
	local v89 = v_u_1(v_u_7(p73, p74 + 12), (v_u_7(p71, 12)))
	local v90 = v_u_1(v_u_7(p73, p74 + 13), (v_u_7(p71, 13)))
	local v91 = v_u_1(v_u_7(p73, p74 + 14), (v_u_7(p71, 14)))
	local v92 = v_u_1(v_u_7(p73, p74 + 15), (v_u_7(p71, 15)))
	local v93 = v77 * 256 + v82
	local v94 = v82 * 256 + v87
	local v95 = v87 * 256 + v92
	local v96 = v92 * 256 + v77
	local v97 = v81 * 256 + v86
	local v98 = v86 * 256 + v91
	local v99 = v91 * 256 + v80
	local v100 = v80 * 256 + v81
	local v101 = v85 * 256 + v90
	local v102 = v90 * 256 + v79
	local v103 = v79 * 256 + v84
	local v104 = v84 * 256 + v85
	local v105 = v89 * 256 + v78
	local v106 = v78 * 256 + v83
	local v107 = v83 * 256 + v88
	local v108 = v88 * 256 + v89
	for v109 = 16, p72, 16 do
		local v110 = v_u_1(v_u_7(v_u_18, v93), v_u_7(v_u_19, v95), (v_u_7(p71, v109)))
		local v111 = v_u_1(v_u_7(v_u_18, v94), v_u_7(v_u_19, v96), (v_u_7(p71, v109 + 1)))
		local v112 = v_u_1(v_u_7(v_u_18, v95), v_u_7(v_u_19, v93), (v_u_7(p71, v109 + 2)))
		local v113 = v_u_1(v_u_7(v_u_18, v96), v_u_7(v_u_19, v94), (v_u_7(p71, v109 + 3)))
		local v114 = v_u_1(v_u_7(v_u_18, v97), v_u_7(v_u_19, v99), (v_u_7(p71, v109 + 4)))
		local v115 = v_u_1(v_u_7(v_u_18, v98), v_u_7(v_u_19, v100), (v_u_7(p71, v109 + 5)))
		local v116 = v_u_1(v_u_7(v_u_18, v99), v_u_7(v_u_19, v97), (v_u_7(p71, v109 + 6)))
		local v117 = v_u_1(v_u_7(v_u_18, v100), v_u_7(v_u_19, v98), (v_u_7(p71, v109 + 7)))
		local v118 = v_u_1(v_u_7(v_u_18, v101), v_u_7(v_u_19, v103), (v_u_7(p71, v109 + 8)))
		local v119 = v_u_1(v_u_7(v_u_18, v102), v_u_7(v_u_19, v104), (v_u_7(p71, v109 + 9)))
		local v120 = v_u_1(v_u_7(v_u_18, v103), v_u_7(v_u_19, v101), (v_u_7(p71, v109 + 10)))
		local v121 = v_u_1(v_u_7(v_u_18, v104), v_u_7(v_u_19, v102), (v_u_7(p71, v109 + 11)))
		local v122 = v_u_1(v_u_7(v_u_18, v105), v_u_7(v_u_19, v107), (v_u_7(p71, v109 + 12)))
		local v123 = v_u_1(v_u_7(v_u_18, v106), v_u_7(v_u_19, v108), (v_u_7(p71, v109 + 13)))
		local v124 = v_u_1(v_u_7(v_u_18, v107), v_u_7(v_u_19, v105), (v_u_7(p71, v109 + 14)))
		local v125 = v_u_1(v_u_7(v_u_18, v108), v_u_7(v_u_19, v106), (v_u_7(p71, v109 + 15)))
		v93 = v110 * 256 + v115
		v94 = v115 * 256 + v120
		v95 = v120 * 256 + v125
		v96 = v125 * 256 + v110
		v97 = v114 * 256 + v119
		v98 = v119 * 256 + v124
		v99 = v124 * 256 + v113
		v100 = v113 * 256 + v114
		v101 = v118 * 256 + v123
		v102 = v123 * 256 + v112
		v103 = v112 * 256 + v117
		v104 = v117 * 256 + v118
		v105 = v122 * 256 + v111
		v106 = v111 * 256 + v116
		v107 = v116 * 256 + v121
		v108 = v121 * 256 + v122
	end
	v_u_14(p75, p76, (v_u_1(v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v108), v_u_7(v_u_19, v106), (v_u_7(p71, p72 + 31))) * 512 + v_u_1(v_u_7(v_u_18, v103), v_u_7(v_u_19, v101), (v_u_7(p71, p72 + 26))) * 2) * 65536 + v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v98), v_u_7(v_u_19, v100), (v_u_7(p71, p72 + 21))) * 512 + v_u_1(v_u_7(v_u_18, v93), v_u_7(v_u_19, v95), (v_u_7(p71, p72 + 16))) * 2), (v_u_9(p71, p72 + 32)))))
	v_u_14(p75, p76 + 4, (v_u_1(v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v96), v_u_7(v_u_19, v94), (v_u_7(p71, p72 + 19))) * 512 + v_u_1(v_u_7(v_u_18, v107), v_u_7(v_u_19, v105), (v_u_7(p71, p72 + 30))) * 2) * 65536 + v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v102), v_u_7(v_u_19, v104), (v_u_7(p71, p72 + 25))) * 512 + v_u_1(v_u_7(v_u_18, v97), v_u_7(v_u_19, v99), (v_u_7(p71, p72 + 20))) * 2), (v_u_9(p71, p72 + 36)))))
	v_u_14(p75, p76 + 8, (v_u_1(v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v100), v_u_7(v_u_19, v98), (v_u_7(p71, p72 + 23))) * 512 + v_u_1(v_u_7(v_u_18, v95), v_u_7(v_u_19, v93), (v_u_7(p71, p72 + 18))) * 2) * 65536 + v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v106), v_u_7(v_u_19, v108), (v_u_7(p71, p72 + 29))) * 512 + v_u_1(v_u_7(v_u_18, v101), v_u_7(v_u_19, v103), (v_u_7(p71, p72 + 24))) * 2), (v_u_9(p71, p72 + 40)))))
	v_u_14(p75, p76 + 12, (v_u_1(v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v104), v_u_7(v_u_19, v102), (v_u_7(p71, p72 + 27))) * 512 + v_u_1(v_u_7(v_u_18, v99), v_u_7(v_u_19, v97), (v_u_7(p71, p72 + 22))) * 2) * 65536 + v_u_8(v_u_17, v_u_1(v_u_7(v_u_18, v94), v_u_7(v_u_19, v96), (v_u_7(p71, p72 + 17))) * 512 + v_u_1(v_u_7(v_u_18, v105), v_u_7(v_u_19, v107), (v_u_7(p71, p72 + 28))) * 2), (v_u_9(p71, p72 + 44)))))
end
local function v_u_182(p127, p128, p129, p130, p131, p132)
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (copy) v_u_1, (copy) v_u_21, (copy) v_u_22, (copy) v_u_14
	local v133 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130) * 256 + v_u_7(p127, p128 + 32)), (v_u_7(p127, p128 + 16)))
	local v134 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 13) * 256 + v_u_7(p127, p128 + 45)), (v_u_7(p127, p128 + 17)))
	local v135 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 10) * 256 + v_u_7(p127, p128 + 42)), (v_u_7(p127, p128 + 18)))
	local v136 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 7) * 256 + v_u_7(p127, p128 + 39)), (v_u_7(p127, p128 + 19)))
	local v137 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 4) * 256 + v_u_7(p127, p128 + 36)), (v_u_7(p127, p128 + 20)))
	local v138 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 1) * 256 + v_u_7(p127, p128 + 33)), (v_u_7(p127, p128 + 21)))
	local v139 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 14) * 256 + v_u_7(p127, p128 + 46)), (v_u_7(p127, p128 + 22)))
	local v140 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 11) * 256 + v_u_7(p127, p128 + 43)), (v_u_7(p127, p128 + 23)))
	local v141 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 8) * 256 + v_u_7(p127, p128 + 40)), (v_u_7(p127, p128 + 24)))
	local v142 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 5) * 256 + v_u_7(p127, p128 + 37)), (v_u_7(p127, p128 + 25)))
	local v143 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 2) * 256 + v_u_7(p127, p128 + 34)), (v_u_7(p127, p128 + 26)))
	local v144 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 15) * 256 + v_u_7(p127, p128 + 47)), (v_u_7(p127, p128 + 27)))
	local v145 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 12) * 256 + v_u_7(p127, p128 + 44)), (v_u_7(p127, p128 + 28)))
	local v146 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 9) * 256 + v_u_7(p127, p128 + 41)), (v_u_7(p127, p128 + 29)))
	local v147 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 6) * 256 + v_u_7(p127, p128 + 38)), (v_u_7(p127, p128 + 30)))
	local v148 = v_u_1(v_u_7(v_u_20, v_u_7(p129, p130 + 3) * 256 + v_u_7(p127, p128 + 35)), (v_u_7(p127, p128 + 31)))
	local v149 = v133 * 256 + v134
	local v150 = v134 * 256 + v135
	local v151 = v135 * 256 + v136
	local v152 = v136 * 256 + v133
	local v153 = v137 * 256 + v138
	local v154 = v138 * 256 + v139
	local v155 = v139 * 256 + v140
	local v156 = v140 * 256 + v137
	local v157 = v141 * 256 + v142
	local v158 = v142 * 256 + v143
	local v159 = v143 * 256 + v144
	local v160 = v144 * 256 + v141
	local v161 = v145 * 256 + v146
	local v162 = v146 * 256 + v147
	local v163 = v147 * 256 + v148
	local v164 = v148 * 256 + v145
	for v165 = p128, 16, -16 do
		local v166 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v149) * 256 + v_u_7(v_u_22, v151)), (v_u_7(p127, v165)))
		local v167 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v162) * 256 + v_u_7(v_u_22, v164)), (v_u_7(p127, v165 + 1)))
		local v168 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v159) * 256 + v_u_7(v_u_22, v157)), (v_u_7(p127, v165 + 2)))
		local v169 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v156) * 256 + v_u_7(v_u_22, v154)), (v_u_7(p127, v165 + 3)))
		local v170 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v153) * 256 + v_u_7(v_u_22, v155)), (v_u_7(p127, v165 + 4)))
		local v171 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v150) * 256 + v_u_7(v_u_22, v152)), (v_u_7(p127, v165 + 5)))
		local v172 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v163) * 256 + v_u_7(v_u_22, v161)), (v_u_7(p127, v165 + 6)))
		local v173 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v160) * 256 + v_u_7(v_u_22, v158)), (v_u_7(p127, v165 + 7)))
		local v174 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v157) * 256 + v_u_7(v_u_22, v159)), (v_u_7(p127, v165 + 8)))
		local v175 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v154) * 256 + v_u_7(v_u_22, v156)), (v_u_7(p127, v165 + 9)))
		local v176 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v151) * 256 + v_u_7(v_u_22, v149)), (v_u_7(p127, v165 + 10)))
		local v177 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v164) * 256 + v_u_7(v_u_22, v162)), (v_u_7(p127, v165 + 11)))
		local v178 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v161) * 256 + v_u_7(v_u_22, v163)), (v_u_7(p127, v165 + 12)))
		local v179 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v158) * 256 + v_u_7(v_u_22, v160)), (v_u_7(p127, v165 + 13)))
		local v180 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v155) * 256 + v_u_7(v_u_22, v153)), (v_u_7(p127, v165 + 14)))
		local v181 = v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v152) * 256 + v_u_7(v_u_22, v150)), (v_u_7(p127, v165 + 15)))
		v149 = v166 * 256 + v167
		v150 = v167 * 256 + v168
		v151 = v168 * 256 + v169
		v152 = v169 * 256 + v166
		v153 = v170 * 256 + v171
		v154 = v171 * 256 + v172
		v155 = v172 * 256 + v173
		v156 = v173 * 256 + v170
		v157 = v174 * 256 + v175
		v158 = v175 * 256 + v176
		v159 = v176 * 256 + v177
		v160 = v177 * 256 + v174
		v161 = v178 * 256 + v179
		v162 = v179 * 256 + v180
		v163 = v180 * 256 + v181
		v164 = v181 * 256 + v178
	end
	v_u_14(p131, p132, v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v156) * 256 + v_u_7(v_u_22, v154)), (v_u_7(p127, 3))) * 16777216 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v159) * 256 + v_u_7(v_u_22, v157)), (v_u_7(p127, 2))) * 65536 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v162) * 256 + v_u_7(v_u_22, v164)), (v_u_7(p127, 1))) * 256 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v149) * 256 + v_u_7(v_u_22, v151)), (v_u_7(p127, 0))))
	v_u_14(p131, p132 + 4, v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v160) * 256 + v_u_7(v_u_22, v158)), (v_u_7(p127, 7))) * 16777216 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v163) * 256 + v_u_7(v_u_22, v161)), (v_u_7(p127, 6))) * 65536 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v150) * 256 + v_u_7(v_u_22, v152)), (v_u_7(p127, 5))) * 256 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v153) * 256 + v_u_7(v_u_22, v155)), (v_u_7(p127, 4))))
	v_u_14(p131, p132 + 8, v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v164) * 256 + v_u_7(v_u_22, v162)), (v_u_7(p127, 11))) * 16777216 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v151) * 256 + v_u_7(v_u_22, v149)), (v_u_7(p127, 10))) * 65536 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v154) * 256 + v_u_7(v_u_22, v156)), (v_u_7(p127, 9))) * 256 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v157) * 256 + v_u_7(v_u_22, v159)), (v_u_7(p127, 8))))
	v_u_14(p131, p132 + 12, v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v152) * 256 + v_u_7(v_u_22, v150)), (v_u_7(p127, 15))) * 16777216 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v155) * 256 + v_u_7(v_u_22, v153)), (v_u_7(p127, 14))) * 65536 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v158) * 256 + v_u_7(v_u_22, v160)), (v_u_7(p127, 13))) * 256 + v_u_1(v_u_7(v_u_20, v_u_7(v_u_21, v161) * 256 + v_u_7(v_u_22, v163)), (v_u_7(p127, 12))))
end
for _ = 1, 255 do
	v28 = v_u_1(v28, v28 * 2, v28 < 128 and 0 or 27) % 256
	local v183 = v_u_1(v29, v29 * 2)
	local v184 = v_u_1(v183, v183 * 4)
	v29 = v_u_1(v184, v184 * 16) % 256
	if v29 >= 128 then
		v29 = v_u_1(v29, 9)
	end
	local v185 = v_u_1(v29, v29 % 128 * 2 + v29 / 128, v29 % 64 * 4 + v29 / 64, v29 % 32 * 8 + v29 / 32, v29 % 16 * 16 + v29 / 16, 99)
	v12(v23, v28, v185)
	v12(v24, v185, v28)
	v12(v25, v28, (v33(3, v28)))
	v12(v26, v28, (v33(9, v28)))
	v12(v27, v28, (v33(11, v28)))
end
local v186 = 0
for v187 = 0, 255 do
	local v188 = v_u_7(v23, v187)
	local v189 = v188 * 256
	local v190 = v33(2, v188)
	local v191 = v33(13, v187)
	local v192 = v33(14, v187)
	for v193 = 0, 255 do
		local v194 = v_u_7(v23, v193)
		v13(v_u_17, v186 * 2, v189 + v194)
		v12(v_u_20, v186, (v_u_7(v24, (v_u_1(v187, v193)))))
		v12(v_u_18, v186, (v_u_1(v190, (v_u_7(v25, v194)))))
		v12(v_u_19, v186, (v_u_1(v188, v194)))
		v12(v_u_21, v186, (v_u_1(v192, (v_u_7(v27, v193)))))
		v12(v_u_22, v186, (v_u_1(v191, (v_u_7(v26, v193)))))
		v186 = v186 + 1
	end
end
local function v_u_196(_, p195)
	return error((("%* cannot be assigned to"):format(p195)))
end
local function v_u_197()
	return "AesCipher"
end
local v_u_198 = require(script.Modes)
local v_u_199 = require(script.Pads)
local function v_u_204(p200, p201)
	-- upvalues: (copy) v_u_6, (copy) v_u_70, (copy) v_u_4
	local v202 = typeof(p200) == "buffer"
	local v203
	if v202 then
		v203 = v_u_6(p200)
	else
		v203 = #p200
	end
	return v_u_70(p200, v203, p201 or v_u_4(v203 == 32 and 240 or (v203 == 24 and 208 or (v203 == 16 and 176 or error("Key must be either 16, 24 or 32 bytes long")))), v202)
end
local function v_u_261(p205, p206, p207)
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_16, (copy) v_u_198, (copy) v_u_199, (copy) v_u_126, (copy) v_u_182, (copy) v_u_5, (copy) v_u_4, (copy) v_u_196, (copy) v_u_197
	local v_u_208 = v_u_6(p205)
	local v_u_209 = nil
	local v_u_210 = nil
	local v_u_211 = v_u_10(p205)
	if v_u_208 == 240 then
		v_u_210 = v_u_16(v_u_211, 1, 32)
		v_u_209 = 192
	elseif v_u_208 == 208 then
		v_u_210 = v_u_16(v_u_211, 1, 24)
		v_u_209 = 160
	elseif v_u_208 == 176 then
		v_u_210 = v_u_16(v_u_211, 1, 16)
		v_u_209 = 128
	else
		error("Round keys must be either 240, 208 or 128 bytes long")
	end
	local v_u_212 = p205
	local v_u_213 = p206 or v_u_198.ECB
	local v_u_214 = v_u_213.FwdMode
	local v_u_215 = v_u_213.InvMode
	local v_u_216 = v_u_213.SegmentSize or 16
	local v_u_217 = p207 or v_u_199.Pkcs7
	local v_u_218 = v_u_217.Pad
	local v_u_219 = v_u_217.Unpad
	local v_u_220 = newproxy(true)
	local v221 = getmetatable(v_u_220)
	local function v_u_226(p222, p223, p224, p225)
		-- upvalues: (ref) v_u_126, (ref) v_u_212, (ref) v_u_209
		v_u_126(v_u_212, v_u_209, p222, p223, p224, p225)
	end
	local function v_u_231(p227, p228, p229, p230)
		-- upvalues: (ref) v_u_182, (ref) v_u_212, (ref) v_u_209
		v_u_182(v_u_212, v_u_209, p227, p228, p229, p230)
	end
	local function v_u_239(p232, p233, p234, ...)
		-- upvalues: (ref) v_u_5, (copy) v_u_220, (ref) v_u_209, (copy) v_u_218, (copy) v_u_216, (ref) v_u_214, (copy) v_u_226, (copy) v_u_231, (ref) v_u_217, (ref) v_u_213, (ref) v_u_4
		if typeof(p233) ~= "buffer" then
			if typeof(p233) == "string" then
				p233 = v_u_5(p233)
			else
				p233 = error((("Unable to cast %* to buffer"):format((typeof(p233)))))
			end
		end
		if typeof(p234) ~= "buffer" then
			p234 = false
		end
		if p232 ~= v_u_220 then
			return p232:Encrypt(p233, p234, ...)
		end
		if not v_u_209 then
			error("AesCipher object\'s already destroyed")
			return v_u_4(0)
		end
		local v235 = v_u_218(p233, p234, v_u_216)
		local v236 = v_u_214
		local v237 = v_u_226
		local v238 = v_u_231
		if v_u_217.Overwrite ~= false then
			p233 = v235
		end
		v236(v237, v238, p233, v235, v_u_213, ...)
		return v235
	end
	local function v_u_245(p240, p241, p242, p243, p244)
		-- upvalues: (copy) v_u_220, (ref) v_u_209, (ref) v_u_126, (ref) v_u_212
		if p240 == v_u_220 then
			if v_u_209 then
				v_u_126(v_u_212, v_u_209, p241, p242, p243 or p241, p244 or p242)
			else
				error("AesCipher object\'s already destroyed")
			end
		else
			p240:EncryptBlock(p241, p242, p243, p244)
			return
		end
	end
	local function v_u_251(p246, p247, p248, ...)
		-- upvalues: (ref) v_u_5, (copy) v_u_220, (ref) v_u_209, (ref) v_u_217, (ref) v_u_4, (ref) v_u_6, (ref) v_u_215, (copy) v_u_226, (copy) v_u_231, (ref) v_u_213, (copy) v_u_219, (copy) v_u_216
		if typeof(p247) ~= "buffer" then
			if typeof(p247) == "string" then
				p247 = v_u_5(p247)
			else
				p247 = error((("Unable to cast %* to buffer"):format((typeof(p247)))))
			end
		end
		if typeof(p248) ~= "buffer" then
			p248 = false
		end
		if p246 ~= v_u_220 then
			return p246:Decrypt(p247, p248, ...)
		end
		if not v_u_209 then
			error("AesCipher object\'s already destroyed")
			return v_u_4(0)
		end
		local v249 = v_u_217.Overwrite
		local v250
		if v249 == nil then
			v250 = v_u_4(v_u_6(p247))
		elseif v249 then
			v250 = p247
		else
			v250 = p248 or v_u_4(v_u_6(p247))
		end
		v_u_215(v_u_226, v_u_231, p247, v250, v_u_213, ...)
		return v_u_219(v250, p248, v_u_216)
	end
	local function v_u_257(p252, p253, p254, p255, p256)
		-- upvalues: (copy) v_u_220, (ref) v_u_209, (ref) v_u_182, (ref) v_u_212
		if p252 == v_u_220 then
			if v_u_209 then
				v_u_182(v_u_212, v_u_209, p253, p254, p255 or p253, p256 or p254)
			else
				error("AesCipher object\'s already destroyed")
			end
		else
			p252:DecryptBlock(p253, p254, p255, p256)
			return
		end
	end
	local function v_u_259(p258)
		-- upvalues: (copy) v_u_220, (ref) v_u_209, (ref) v_u_211, (ref) v_u_212, (ref) v_u_214, (ref) v_u_215, (ref) v_u_213, (ref) v_u_217, (ref) v_u_210, (ref) v_u_208
		if p258 == v_u_220 then
			if v_u_209 then
				v_u_211 = nil
				v_u_212 = nil
				v_u_209 = nil
				v_u_214 = nil
				v_u_215 = nil
				v_u_213 = nil
				v_u_217 = nil
				v_u_210 = nil
				v_u_208 = nil
			else
				error("AesCipher object\'s already destroyed")
			end
		else
			p258:Destroy()
			return
		end
	end
	function v221.__index(_, p260)
		-- upvalues: (copy) v_u_239, (copy) v_u_251, (copy) v_u_245, (copy) v_u_257, (copy) v_u_259, (ref) v_u_209, (ref) v_u_210, (ref) v_u_211, (ref) v_u_213, (ref) v_u_217, (ref) v_u_208
		if p260 == "Encrypt" then
			return v_u_239
		elseif p260 == "Decrypt" then
			return v_u_251
		elseif p260 == "EncryptBlock" then
			return v_u_245
		elseif p260 == "DecryptBlock" then
			return v_u_257
		elseif p260 == "Destroy" then
			return v_u_259
		elseif v_u_209 then
			if p260 == "Key" then
				return v_u_210
			elseif p260 == "RoundKeys" then
				return v_u_211
			elseif p260 == "Mode" then
				return v_u_213
			elseif p260 == "Padding" then
				return v_u_217
			elseif p260 == "Length" then
				return v_u_208
			else
				return error((("%* is not a valid member of AesCipher"):format(p260)))
			end
		else
			return error("AesCipher object\'s already destroyed")
		end
	end
	v221.__newindex = v_u_196
	v221.__tostring = v_u_197
	function v221.__len()
		-- upvalues: (ref) v_u_208
		return v_u_208 or error("AesCipher object\'s destroyed")
	end
	v221.__metatable = "AesCipher object: Metatable\'s locked"
	return v_u_220
end
return table.freeze({
	["new"] = function(p262, p263, p264)
		-- upvalues: (copy) v_u_261, (copy) v_u_204
		return v_u_261(v_u_204(p262), p263, p264)
	end,
	["expandKey"] = v_u_204,
	["fromKey"] = v_u_261,
	["modes"] = v_u_198,
	["pads"] = v_u_199
})