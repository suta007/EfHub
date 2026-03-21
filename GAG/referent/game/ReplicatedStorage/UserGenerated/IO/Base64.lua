local v_u_1 = buffer.create(64)
local v_u_2 = buffer.create(256)
for v3 = 1, 64 do
	local v4 = v3 - 1
	local v5 = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v3)
	buffer.writeu8(v_u_1, v4, v5)
	buffer.writeu8(v_u_2, v5, v4)
end
function encode(p6, p7)
	-- upvalues: (copy) v_u_1
	local v8 = p7 or buffer.len(p6)
	local v9 = v8 / 3
	local v10 = math.ceil(v9)
	local v11 = v10 * 4
	local v12 = buffer.create(v11)
	for v13 = 1, v10 - 1 do
		local v14 = (v13 - 1) * 3
		local v15 = (v13 - 1) * 4
		local v16 = buffer.readu32(p6, v14)
		local v17 = bit32.byteswap(v16)
		local v18 = bit32.rshift(v17, 26)
		local v19 = bit32.rshift(v17, 20)
		local v20 = bit32.band(v19, 63)
		local v21 = bit32.rshift(v17, 14)
		local v22 = bit32.band(v21, 63)
		local v23 = bit32.rshift(v17, 8)
		local v24 = bit32.band(v23, 63)
		local v25 = v_u_1
		local v26 = buffer.readu8(v25, v18)
		buffer.writeu8(v12, v15, v26)
		local v27 = v15 + 1
		local v28 = v_u_1
		local v29 = buffer.readu8(v28, v20)
		buffer.writeu8(v12, v27, v29)
		local v30 = v15 + 2
		local v31 = v_u_1
		local v32 = buffer.readu8(v31, v22)
		buffer.writeu8(v12, v30, v32)
		local v33 = v15 + 3
		local v34 = v_u_1
		local v35 = buffer.readu8(v34, v24)
		buffer.writeu8(v12, v33, v35)
	end
	local v36 = v8 % 3
	if v36 == 1 then
		local v37 = v8 - 1
		local v38 = buffer.readu8(p6, v37)
		local v39 = bit32.rshift(v38, 2)
		local v40 = bit32.lshift(v38, 4)
		local v41 = bit32.band(v40, 63)
		local v42 = v11 - 4
		local v43 = v_u_1
		local v44 = buffer.readu8(v43, v39)
		buffer.writeu8(v12, v42, v44)
		local v45 = v11 - 3
		local v46 = v_u_1
		local v47 = buffer.readu8(v46, v41)
		buffer.writeu8(v12, v45, v47)
		local v48 = v11 - 2
		buffer.writeu8(v12, v48, 61)
		local v49 = v11 - 1
		buffer.writeu8(v12, v49, 61)
		return v12
	end
	if v36 ~= 2 then
		if v36 == 0 and v8 ~= 0 then
			local v50 = v8 - 3
			local v51 = buffer.readu8(p6, v50)
			local v52 = bit32.lshift(v51, 16)
			local v53 = v8 - 2
			local v54 = buffer.readu8(p6, v53)
			local v55 = bit32.lshift(v54, 8)
			local v56 = v8 - 1
			local v57 = buffer.readu8(p6, v56)
			local v58 = bit32.bor(v52, v55, v57)
			local v59 = bit32.rshift(v58, 18)
			local v60 = bit32.rshift(v58, 12)
			local v61 = bit32.band(v60, 63)
			local v62 = bit32.rshift(v58, 6)
			local v63 = bit32.band(v62, 63)
			local v64 = bit32.band(v58, 63)
			local v65 = v11 - 4
			local v66 = v_u_1
			local v67 = buffer.readu8(v66, v59)
			buffer.writeu8(v12, v65, v67)
			local v68 = v11 - 3
			local v69 = v_u_1
			local v70 = buffer.readu8(v69, v61)
			buffer.writeu8(v12, v68, v70)
			local v71 = v11 - 2
			local v72 = v_u_1
			local v73 = buffer.readu8(v72, v63)
			buffer.writeu8(v12, v71, v73)
			local v74 = v11 - 1
			local v75 = v_u_1
			local v76 = buffer.readu8(v75, v64)
			buffer.writeu8(v12, v74, v76)
		end
		return v12
	end
	local v77 = v8 - 2
	local v78 = buffer.readu8(p6, v77)
	local v79 = bit32.lshift(v78, 8)
	local v80 = v8 - 1
	local v81 = buffer.readu8(p6, v80)
	local v82 = bit32.bor(v79, v81)
	local v83 = bit32.rshift(v82, 10)
	local v84 = bit32.rshift(v82, 4)
	local v85 = bit32.band(v84, 63)
	local v86 = bit32.lshift(v82, 2)
	local v87 = bit32.band(v86, 63)
	local v88 = v11 - 4
	local v89 = v_u_1
	local v90 = buffer.readu8(v89, v83)
	buffer.writeu8(v12, v88, v90)
	local v91 = v11 - 3
	local v92 = v_u_1
	local v93 = buffer.readu8(v92, v85)
	buffer.writeu8(v12, v91, v93)
	local v94 = v11 - 2
	local v95 = v_u_1
	local v96 = buffer.readu8(v95, v87)
	buffer.writeu8(v12, v94, v96)
	local v97 = v11 - 1
	buffer.writeu8(v12, v97, 61)
	return v12
end
function decode(p98)
	-- upvalues: (copy) v_u_2
	local v99 = buffer.len(p98)
	local v100 = v99 / 4
	local v101 = math.ceil(v100)
	local v102 = 0
	if v99 ~= 0 then
		local v103 = v99 - 1
		if buffer.readu8(p98, v103) == 61 then
			v102 = v102 + 1
		end
		local v104 = v99 - 2
		if buffer.readu8(p98, v104) == 61 then
			v102 = v102 + 1
		end
	end
	local v105 = v101 * 3 - v102
	local v106 = buffer.create(v105)
	for v107 = 1, v101 - 1 do
		local v108 = (v107 - 1) * 4
		local v109 = (v107 - 1) * 3
		local v110 = v_u_2
		local v111 = buffer.readu8(p98, v108)
		local v112 = buffer.readu8(v110, v111)
		local v113 = v_u_2
		local v114 = v108 + 1
		local v115 = buffer.readu8(p98, v114)
		local v116 = buffer.readu8(v113, v115)
		local v117 = v_u_2
		local v118 = v108 + 2
		local v119 = buffer.readu8(p98, v118)
		local v120 = buffer.readu8(v117, v119)
		local v121 = v_u_2
		local v122 = v108 + 3
		local v123 = buffer.readu8(p98, v122)
		local v124 = buffer.readu8(v121, v123)
		local v125 = bit32.lshift(v112, 18)
		local v126 = bit32.lshift(v116, 12)
		local v127 = bit32.lshift(v120, 6)
		local v128 = bit32.bor(v125, v126, v127, v124)
		local v129 = bit32.rshift(v128, 16)
		local v130 = bit32.rshift(v128, 8)
		local v131 = bit32.band(v130, 255)
		local v132 = bit32.band(v128, 255)
		buffer.writeu8(v106, v109, v129)
		local v133 = v109 + 1
		buffer.writeu8(v106, v133, v131)
		local v134 = v109 + 2
		buffer.writeu8(v106, v134, v132)
	end
	if v99 ~= 0 then
		local v135 = (v101 - 1) * 4
		local v136 = (v101 - 1) * 3
		local v137 = v_u_2
		local v138 = buffer.readu8(p98, v135)
		local v139 = buffer.readu8(v137, v138)
		local v140 = v_u_2
		local v141 = v135 + 1
		local v142 = buffer.readu8(p98, v141)
		local v143 = buffer.readu8(v140, v142)
		local v144 = v_u_2
		local v145 = v135 + 2
		local v146 = buffer.readu8(p98, v145)
		local v147 = buffer.readu8(v144, v146)
		local v148 = v_u_2
		local v149 = v135 + 3
		local v150 = buffer.readu8(p98, v149)
		local v151 = buffer.readu8(v148, v150)
		local v152 = bit32.lshift(v139, 18)
		local v153 = bit32.lshift(v143, 12)
		local v154 = bit32.lshift(v147, 6)
		local v155 = bit32.bor(v152, v153, v154, v151)
		if v102 <= 2 then
			local v156 = bit32.rshift(v155, 16)
			buffer.writeu8(v106, v136, v156)
			if v102 <= 1 then
				local v157 = bit32.rshift(v155, 8)
				local v158 = bit32.band(v157, 255)
				local v159 = v136 + 1
				buffer.writeu8(v106, v159, v158)
				if v102 == 0 then
					local v160 = bit32.band(v155, 255)
					local v161 = v136 + 2
					buffer.writeu8(v106, v161, v160)
				end
			end
		end
	end
	return v106
end
function Encode(p162)
	return buffer.tostring(encode(buffer.fromstring(p162)))
end
function Decode(p163)
	return buffer.tostring(decode(buffer.fromstring(p163)))
end
return table.freeze({
	["Encode"] = Encode,
	["Decode"] = Decode,
	["EncodeBuffer"] = encode,
	["DecodeBuffer"] = decode
})