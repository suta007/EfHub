local v_u_1 = bit32.bxor
local v_u_2 = buffer.copy
local v_u_3 = buffer.create
local v_u_4 = buffer.len
local v_u_5 = buffer.readu8
local v_u_6 = buffer.readu32
local _ = buffer.tostring
local v_u_7 = buffer.writestring
local v_u_8 = buffer.writeu8
local v_u_9 = buffer.writeu32
local _ = math.floor
local v_u_10 = math.random
local v_u_11 = string.pack
local v_u_12 = v_u_3(16)
local function v_u_24(p13, p14, p15, p16, p17)
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	if not p17 then
		local v18 = v_u_5(p13, p16) + p14
		v_u_8(p13, p16, v18)
		if v18 >= 256 then
			for v19 = p16 - 1, p15, -1 do
				local v20 = v_u_5(p13, v19) + 1
				v_u_8(p13, v19, v20)
				if v20 < 256 then
					break
				end
			end
		end
		goto l4
	end
	local v21 = v_u_5(p13, p15) + p14
	v_u_8(p13, p15, v21)
	if v21 >= 256 then
		for v22 = p15 + 1, p16 do
			local v23 = v_u_5(p13, v22) + 1
			v_u_8(p13, v22, v23)
			if v23 < 256 then
				goto l4
			end
		end
	else
		::l4::
	end
end
local v37 = {
	["ECB"] = {
		["FwdMode"] = function(p25, _, p26, p27)
			-- upvalues: (copy) v_u_4
			local v28 = v_u_4(p26) - 16
			local v29 = v28 % 16 == 0
			assert(v29, "Input length must be a multiple of 16 bytes")
			for v30 = 0, v28, 16 do
				p25(p26, v30, p27, v30)
			end
		end,
		["InvMode"] = function(_, p31, p32, p33)
			-- upvalues: (copy) v_u_4
			local v34 = v_u_4(p32) - 16
			local v35 = v34 % 16 == 0
			assert(v35, "Input length must be a multiple of 16 bytes")
			for v36 = 0, v34, 16 do
				p31(p32, v36, p33, v36)
			end
		end
	}
}
table.freeze(v37.ECB)
v37.CBC = {
	["FwdMode"] = function(p38, _, p39, p40, _, p41)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
		local v42 = v_u_4(p39) - 16
		local v43 = v42 % 16 == 0
		assert(v43, "Input length must be a multiple of 16 bytes")
		local v44 = p41 or v_u_12
		local v45 = v_u_4(v44) == 16
		assert(v45, "Initialization vector must be 16 bytes long")
		v_u_9(p40, 0, (v_u_1(v_u_6(p39, 0), (v_u_6(v44, 0)))))
		v_u_9(p40, 4, (v_u_1(v_u_6(p39, 4), (v_u_6(v44, 4)))))
		v_u_9(p40, 8, (v_u_1(v_u_6(p39, 8), (v_u_6(v44, 8)))))
		v_u_9(p40, 12, (v_u_1(v_u_6(p39, 12), (v_u_6(v44, 12)))))
		p38(p40, 0, p40, 0)
		for v46 = 16, v42, 16 do
			v_u_9(p40, v46, (v_u_1(v_u_6(p39, v46), (v_u_6(p40, v46 - 16)))))
			v_u_9(p40, v46 + 4, (v_u_1(v_u_6(p39, v46 + 4), (v_u_6(p40, v46 - 12)))))
			v_u_9(p40, v46 + 8, (v_u_1(v_u_6(p39, v46 + 8), (v_u_6(p40, v46 - 8)))))
			v_u_9(p40, v46 + 12, (v_u_1(v_u_6(p39, v46 + 12), (v_u_6(p40, v46 - 4)))))
			p38(p40, v46, p40, v46)
		end
	end,
	["InvMode"] = function(_, p47, p48, p49, _, p50)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
		local v51 = v_u_4(p48) - 16
		local v52 = v51 % 16 == 0
		assert(v52, "Input length must be a multiple of 16 bytes")
		local v53 = p50 or v_u_12
		local v54 = v_u_4(v53) == 16
		assert(v54, "Initialization vector must be 16 bytes long")
		local v55 = v_u_6(p48, 0)
		local v56 = v_u_6(p48, 4)
		local v57 = v_u_6(p48, 8)
		local v58 = v_u_6(p48, 12)
		p47(p48, 0, p49, 0)
		v_u_9(p49, 0, (v_u_1(v_u_6(p49, 0), (v_u_6(v53, 0)))))
		v_u_9(p49, 4, (v_u_1(v_u_6(p49, 4), (v_u_6(v53, 4)))))
		v_u_9(p49, 8, (v_u_1(v_u_6(p49, 8), (v_u_6(v53, 8)))))
		v_u_9(p49, 12, (v_u_1(v_u_6(p49, 12), (v_u_6(v53, 12)))))
		for v59 = 16, v51, 16 do
			local v60 = v_u_6(p48, v59)
			local v61 = v_u_6(p48, v59 + 4)
			local v62 = v_u_6(p48, v59 + 8)
			local v63 = v_u_6(p48, v59 + 12)
			p47(p48, v59, p49, v59)
			v_u_9(p49, v59, (v_u_1(v_u_6(p49, v59), v55)))
			v_u_9(p49, v59 + 4, (v_u_1(v_u_6(p49, v59 + 4), v56)))
			v_u_9(p49, v59 + 8, (v_u_1(v_u_6(p49, v59 + 8), v57)))
			v_u_9(p49, v59 + 12, (v_u_1(v_u_6(p49, v59 + 12), v58)))
			v55 = v60
			v58 = v63
			v57 = v62
			v56 = v61
		end
	end
}
table.freeze(v37.CBC)
v37.PCBC = {
	["FwdMode"] = function(p64, _, p65, p66, _, p67)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
		local v68 = v_u_4(p65) - 16
		local v69 = v68 % 16 == 0
		assert(v69, "Input length must be a multiple of 16 bytes")
		local v70 = p67 or v_u_12
		local v71 = v_u_4(v70) == 16
		assert(v71, "Initialization vector must be 16 bytes long")
		local v72 = v_u_6(p65, 0)
		local v73 = v_u_6(p65, 4)
		local v74 = v_u_6(p65, 8)
		local v75 = v_u_6(p65, 12)
		v_u_9(p66, 0, (v_u_1(v72, (v_u_6(v70, 0)))))
		v_u_9(p66, 4, (v_u_1(v73, (v_u_6(v70, 4)))))
		v_u_9(p66, 8, (v_u_1(v74, (v_u_6(v70, 8)))))
		v_u_9(p66, 12, (v_u_1(v75, (v_u_6(v70, 12)))))
		p64(p66, 0, p66, 0)
		for v76 = 16, v68, 16 do
			local v77 = v_u_6(p65, v76)
			local v78 = v_u_6(p65, v76 + 4)
			local v79 = v_u_6(p65, v76 + 8)
			local v80 = v_u_6(p65, v76 + 12)
			v_u_9(p66, v76, (v_u_1(v72, v77, (v_u_6(p66, v76 - 16)))))
			v_u_9(p66, v76 + 4, (v_u_1(v73, v78, (v_u_6(p66, v76 - 12)))))
			v_u_9(p66, v76 + 8, (v_u_1(v74, v79, (v_u_6(p66, v76 - 8)))))
			v_u_9(p66, v76 + 12, (v_u_1(v75, v80, (v_u_6(p66, v76 - 4)))))
			p64(p66, v76, p66, v76)
			v73 = v78
			v72 = v77
			v75 = v80
			v74 = v79
		end
	end,
	["InvMode"] = function(_, p81, p82, p83, _, p84)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
		local v85 = v_u_4(p82) - 16
		local v86 = v85 % 16 == 0
		assert(v86, "Input length must be a multiple of 16 bytes")
		local v87 = p84 or v_u_12
		local v88 = v_u_4(v87) == 16
		assert(v88, "Initialization vector must be 16 bytes long")
		local v89 = v_u_6(p82, 0)
		local v90 = v_u_6(p82, 4)
		local v91 = v_u_6(p82, 8)
		local v92 = v_u_6(p82, 12)
		p81(p82, 0, p83, 0)
		local v93 = v_u_1(v_u_6(p83, 0), (v_u_6(v87, 0)))
		local v94 = v_u_1(v_u_6(p83, 4), (v_u_6(v87, 4)))
		local v95 = v_u_1(v_u_6(p83, 8), (v_u_6(v87, 8)))
		local v96 = v_u_1(v_u_6(p83, 12), (v_u_6(v87, 12)))
		v_u_9(p83, 0, v93)
		v_u_9(p83, 4, v94)
		v_u_9(p83, 8, v95)
		v_u_9(p83, 12, v96)
		local v97 = 8
		local v98 = 12
		local v99 = 0
		local v100 = 4
		for v101 = 16, v85, 16 do
			v99 = v99 + 16
			v100 = v100 + 16
			v97 = v97 + 16
			v98 = v98 + 16
			local v102 = v_u_6(p82, v99)
			local v103 = v_u_6(p82, v100)
			local v104 = v_u_6(p82, v97)
			local v105 = v_u_6(p82, v98)
			p81(p82, v101, p83, v101)
			v93 = v_u_1(v89, v93, (v_u_6(p83, v99)))
			v94 = v_u_1(v90, v94, (v_u_6(p83, v100)))
			v95 = v_u_1(v91, v95, (v_u_6(p83, v97)))
			v96 = v_u_1(v92, v96, (v_u_6(p83, v98)))
			v_u_9(p83, v99, v93)
			v_u_9(p83, v100, v94)
			v_u_9(p83, v97, v95)
			v_u_9(p83, v98, v96)
			v90 = v103
			v89 = v102
			v92 = v105
			v91 = v104
		end
	end
}
table.freeze(v37.PCBC)
local function v_u_126(p106, _, p107, p108, p109, p110)
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (copy) v_u_2
	local v111 = p109.SegmentSize
	local v112 = v_u_4(p107)
	local v113 = v112 % v111 == 0
	assert(v113, "Input length must be a multiple of segment size")
	local v114 = p110 or v_u_12
	local v115 = v_u_4(v114) == 16
	assert(v115, "Initialization vector must be 16 bytes long")
	local v116 = p109.CommonTemp or v_u_3(31)
	if v112 == v111 then
		p106(v114, 0, v116, 0)
		for v117 = 0, v111 - 1 do
			v_u_8(p108, v117, (v_u_1(v_u_5(p107, v117), (v_u_5(v116, v117)))))
		end
	else
		local v118 = v112 - v111
		local v119 = 16 - v111
		p106(v114, 0, v116, 0)
		for v120 = 0, v111 - 1 do
			v_u_8(p108, v120, (v_u_1(v_u_5(p107, v120), (v_u_5(v116, v120)))))
		end
		v_u_2(v116, 0, v114, v111, v119)
		v_u_2(v116, v119, p108, 0, v111)
		for v121 = v111, v118 - v111, v111 do
			v_u_2(v116, 16, v116, v111, v119)
			p106(v116, 0, v116, 0)
			local v122 = 0
			for v123 = v121, v121 + v111 - 1 do
				v_u_8(p108, v123, (v_u_1(v_u_5(p107, v123), (v_u_5(v116, v122)))))
				v122 = v122 + 1
			end
			v_u_2(v116, 0, v116, 16, v119)
			v_u_2(v116, v119, p108, v121, v111)
		end
		p106(v116, 0, v116, 0)
		local v124 = 0
		for v125 = v118, v112 - 1 do
			v_u_8(p108, v125, (v_u_1(v_u_5(p107, v125), (v_u_5(v116, v124)))))
			v124 = v124 + 1
		end
	end
end
local function v_u_147(p127, _, p128, p129, p130, p131)
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (copy) v_u_2
	local v132 = v_u_4(p128)
	local v133 = p130.SegmentSize
	local v134 = v132 % v133 == 0
	assert(v134, "Input length must be a multiple of segment size")
	local v135 = p131 or v_u_12
	local v136 = v_u_4(v135) == 16
	assert(v136, "Initialization vector must be 16 bytes long")
	local v137 = p130.CommonTemp or v_u_3(31)
	if v132 == v133 then
		p127(v135, 0, v137, 0)
		for v138 = 0, v133 - 1 do
			v_u_8(p129, v138, (v_u_1(v_u_5(p128, v138), (v_u_5(v137, v138)))))
		end
	else
		local v139 = v132 - v133
		local v140 = 16 - v133
		p127(v135, 0, v137, 0)
		for v141 = 0, v133 - 1 do
			v_u_8(p129, v141, (v_u_1(v_u_5(p128, v141), (v_u_5(v137, v141)))))
		end
		v_u_2(v137, 0, v135, v133, v140)
		v_u_2(v137, v140, p128, 0, v133)
		for v142 = v133, v139 - v133, v133 do
			v_u_2(v137, 16, v137, v133, v140)
			p127(v137, 0, v137, 0)
			local v143 = 0
			for v144 = v142, v142 + v133 - 1 do
				v_u_8(p129, v144, (v_u_1(v_u_5(p128, v144), (v_u_5(v137, v143)))))
				v143 = v143 + 1
			end
			v_u_2(v137, 0, v137, 16, v140)
			v_u_2(v137, v140, p128, v142, v133)
		end
		p127(v137, 0, v137, 0)
		local v145 = 0
		for v146 = v139, v132 - 1 do
			v_u_8(p129, v146, (v_u_1(v_u_5(p128, v146), (v_u_5(v137, v145)))))
			v145 = v145 + 1
		end
	end
end
local function v169(p148, _, p149, p150, _, p151)
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
	local v152 = v_u_4(p149) - 16
	local v153 = v152 % 16 == 0
	assert(v153, "Input length must be a multiple of 16 bytes")
	local v154 = p151 or v_u_12
	local v155 = v_u_4(v154) == 16
	assert(v155, "Initialization vector must be 16 bytes long")
	local v156 = v_u_6(p149, 0)
	local v157 = v_u_6(p149, 4)
	local v158 = v_u_6(p149, 8)
	local v159 = v_u_6(p149, 12)
	p148(v154, 0, p150, 0)
	local v160 = v_u_1(v156, (v_u_6(p150, 0)))
	local v161 = v_u_1(v157, (v_u_6(p150, 4)))
	local v162 = v_u_1(v158, (v_u_6(p150, 8)))
	local v163 = v_u_1(v159, (v_u_6(p150, 12)))
	for v164 = 16, v152, 16 do
		local v165 = v_u_6(p149, v164)
		local v166 = v_u_6(p149, v164 + 4)
		local v167 = v_u_6(p149, v164 + 8)
		local v168 = v_u_6(p149, v164 + 12)
		p148(p150, v164 - 16, p150, v164)
		v_u_9(p150, v164 - 16, v160)
		v_u_9(p150, v164 - 12, v161)
		v_u_9(p150, v164 - 8, v162)
		v_u_9(p150, v164 - 4, v163)
		v160 = v_u_1(v165, (v_u_6(p150, v164)))
		v161 = v_u_1(v166, (v_u_6(p150, v164 + 4)))
		v162 = v_u_1(v167, (v_u_6(p150, v164 + 8)))
		v163 = v_u_1(v168, (v_u_6(p150, v164 + 12)))
	end
	v_u_9(p150, v152, v160)
	v_u_9(p150, v152 + 4, v161)
	v_u_9(p150, v152 + 8, v162)
	v_u_9(p150, v152 + 12, v163)
end
v37.OFB = {
	["FwdMode"] = v169,
	["InvMode"] = v169
}
table.freeze(v37.OFB)
local function v_u_193(p170, _, p171, p172, p173)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9, (copy) v_u_24
	local v174 = v_u_4(p171) - 16
	local v175 = v174 % 16 == 0
	assert(v175, "Input length must be a multiple of 16 bytes")
	local v176 = p173.CommonTemp
	local v177 = p173.InitValue
	local v178 = p173.Prefix
	local v179 = p173.Suffix
	local v180 = p173.Step
	local v181 = p173.LittleEndian
	local v182 = #v178
	local v183 = v182 + #v177 - 1
	v_u_7(v176, 0, v178)
	v_u_7(v176, v182, v177)
	v_u_7(v176, v183 + 1, v179)
	local v184 = v_u_6(p171, 0)
	local v185 = v_u_6(p171, 4)
	local v186 = v_u_6(p171, 8)
	local v187 = v_u_6(p171, 12)
	p170(v176, 0, p172, 0)
	v_u_9(p172, 0, (v_u_1(v_u_6(p172, 0), v184)))
	v_u_9(p172, 4, (v_u_1(v_u_6(p172, 4), v185)))
	v_u_9(p172, 8, (v_u_1(v_u_6(p172, 8), v186)))
	v_u_9(p172, 12, (v_u_1(v_u_6(p172, 12), v187)))
	for v188 = 16, v174, 16 do
		local v189 = v_u_6(p171, v188)
		local v190 = v_u_6(p171, v188 + 4)
		local v191 = v_u_6(p171, v188 + 8)
		local v192 = v_u_6(p171, v188 + 12)
		v_u_24(v176, v180, v182, v183, v181)
		p170(v176, 0, p172, v188)
		v_u_9(p172, v188, (v_u_1(v189, (v_u_6(p172, v188)))))
		v_u_9(p172, v188 + 4, (v_u_1(v190, (v_u_6(p172, v188 + 4)))))
		v_u_9(p172, v188 + 8, (v_u_1(v191, (v_u_6(p172, v188 + 8)))))
		v_u_9(p172, v188 + 12, (v_u_1(v192, (v_u_6(p172, v188 + 12)))))
	end
end
local v195 = {
	["__index"] = function(_, p194)
		-- upvalues: (copy) v_u_126, (copy) v_u_147, (copy) v_u_3, (copy) v_u_193, (copy) v_u_11, (copy) v_u_10
		return p194 == "CFB" and {
			["FwdMode"] = v_u_126,
			["InvMode"] = v_u_147,
			["SegmentSize"] = 16,
			["CommonTemp"] = v_u_3(31)
		} or (p194 == "CTR" and {
			["FwdMode"] = v_u_193,
			["InvMode"] = v_u_193,
			["InitValue"] = v_u_11("I2I2I2I2I2I2I2I2", v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535), v_u_10(0, 65535)),
			["Prefix"] = "",
			["Suffix"] = "",
			["Step"] = 1,
			["LittleEndian"] = false,
			["CommonTemp"] = v_u_3(16)
		} or nil)
	end,
	["__newindex"] = function() end
}
setmetatable(v37, v195)
v37.CFB = {}
v37.CTR = {}
table.freeze(v37)
v195.__metatable = "This metatable is locked"
return v37