require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local v_u_1 = table.create(80, 0)
local v_u_2 = table.create(80, 0)
local v_u_3 = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298,
	3391569614,
	3515267271,
	3940187606,
	4118630271,
	116418474,
	174292421,
	289380356,
	460393269,
	685471733,
	852142971,
	1017036298,
	1126000580,
	1288033470,
	1501505948,
	1607167915,
	1816402316
}
local v_u_4 = {
	3609767458,
	602891725,
	3964484399,
	2173295548,
	4081628472,
	3053834265,
	2937671579,
	3664609560,
	2734883394,
	1164996542,
	1323610764,
	3590304994,
	4068182383,
	991336113,
	633803317,
	3479774868,
	2666613458,
	944711139,
	2341262773,
	2007800933,
	1495990901,
	1856431235,
	3175218132,
	2198950837,
	3999719339,
	766784016,
	2566594879,
	3203337956,
	1034457026,
	2466948901,
	3758326383,
	168717936,
	1188179964,
	1546045734,
	1522805485,
	2643833823,
	2343527390,
	1014477480,
	1206759142,
	344077627,
	1290863460,
	3158454273,
	3505952657,
	106217008,
	3606008344,
	1432725776,
	1467031594,
	851169720,
	3100823752,
	1363258195,
	3750685593,
	3785050280,
	3318307427,
	3812723403,
	2003034995,
	3602036899,
	1575990012,
	1125592928,
	2716904306,
	442776044,
	593698344,
	3733110249,
	2999351573,
	3815920427,
	3928383900,
	566280711,
	3454069534,
	4000239992,
	1914138554,
	2731055270,
	3203993006,
	320620315,
	587496836,
	1086792851,
	365543100,
	2618297676,
	3409855158,
	4234509866,
	987167468,
	1246189591
}
function lil_sig0(p5, p6)
	local v7 = bit32.rshift(p5, 1)
	local v8 = bit32.lshift(p6, 31)
	local v9 = bit32.rshift(p5, 8)
	local v10 = bit32.lshift(p6, 24)
	local v11 = bit32.rshift(p5, 7)
	local v12 = bit32.bxor(v7, v8, v9, v10, v11)
	local v13 = bit32.rshift(p6, 1)
	local v14 = bit32.lshift(p5, 31)
	local v15 = bit32.rshift(p6, 8)
	local v16 = bit32.lshift(p5, 24)
	local v17 = bit32.rshift(p6, 7)
	local v18 = bit32.lshift(p5, 25)
	return v12, bit32.bxor(v13, v14, v15, v16, v17, v18)
end
function lil_sig1(p19, p20)
	local v21 = bit32.rshift(p19, 19)
	local v22 = bit32.lshift(p20, 13)
	local v23 = bit32.lshift(p19, 3)
	local v24 = bit32.rshift(p20, 29)
	local v25 = bit32.rshift(p19, 6)
	local v26 = bit32.bxor(v21, v22, v23, v24, v25)
	local v27 = bit32.rshift(p20, 19)
	local v28 = bit32.lshift(p19, 13)
	local v29 = bit32.lshift(p20, 3)
	local v30 = bit32.rshift(p19, 29)
	local v31 = bit32.rshift(p20, 6)
	local v32 = bit32.lshift(p19, 26)
	return v26, bit32.bxor(v27, v28, v29, v30, v31, v32)
end
function big_sig0(p33, p34)
	local v35 = bit32.rshift(p33, 28)
	local v36 = bit32.lshift(p34, 4)
	local v37 = bit32.lshift(p33, 30)
	local v38 = bit32.rshift(p34, 2)
	local v39 = bit32.lshift(p33, 25)
	local v40 = bit32.rshift(p34, 7)
	local v41 = bit32.bxor(v35, v36, v37, v38, v39, v40)
	local v42 = bit32.rshift(p34, 28)
	local v43 = bit32.lshift(p33, 4)
	local v44 = bit32.lshift(p34, 30)
	local v45 = bit32.rshift(p33, 2)
	local v46 = bit32.lshift(p34, 25)
	local v47 = bit32.rshift(p33, 7)
	return v41, bit32.bxor(v42, v43, v44, v45, v46, v47)
end
function big_sig1(p48, p49)
	local v50 = bit32.rshift(p48, 14)
	local v51 = bit32.lshift(p49, 18)
	local v52 = bit32.rshift(p48, 18)
	local v53 = bit32.lshift(p49, 14)
	local v54 = bit32.lshift(p48, 23)
	local v55 = bit32.rshift(p49, 9)
	local v56 = bit32.bxor(v50, v51, v52, v53, v54, v55)
	local v57 = bit32.rshift(p49, 14)
	local v58 = bit32.lshift(p48, 18)
	local v59 = bit32.rshift(p49, 18)
	local v60 = bit32.lshift(p48, 14)
	local v61 = bit32.lshift(p49, 23)
	local v62 = bit32.rshift(p48, 9)
	return v56, bit32.bxor(v57, v58, v59, v60, v61, v62)
end
function processBlocks(p63, p64, p65, p66, p67)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v68 = v_u_1
	local v69 = v_u_2
	local v70 = p63[1]
	local v71 = p63[2]
	local v72 = p63[3]
	local v73 = p63[4]
	local v74 = p63[5]
	local v75 = p63[6]
	local v76 = p63[7]
	local v77 = p63[8]
	local v78 = p64[1]
	local v79 = p64[2]
	local v80 = p64[3]
	local v81 = p64[4]
	local v82 = p64[5]
	local v83 = p64[6]
	local v84 = p64[7]
	local v85 = p64[8]
	for v103 = p66, p67, 128 do
		local _ = v103
		for v87 = 1, 16 do
			local v88 = v103 + 7
			local v89, v90, v91, v92, v93, v94, v95, v96 = string.byte(p65, v103, v88)
			local v97 = bit32.lshift(v89, 24)
			local v98 = bit32.lshift(v90, 16)
			local v99 = bit32.lshift(v91, 8)
			v68[v87] = bit32.bor(v97, v98, v99, v92)
			local v100 = bit32.lshift(v93, 24)
			local v101 = bit32.lshift(v94, 16)
			local v102 = bit32.lshift(v95, 8)
			v69[v87] = bit32.bor(v100, v101, v102, v96)
			local v103 = v103 + 8
		end
		for v104 = 17, 80 do
			local v105, v106 = lil_sig0(v68[v104 - 15], v69[v104 - 15])
			local v107, v108 = lil_sig1(v68[v104 - 2], v69[v104 - 2])
			local v109 = v69[v104 - 16] + v106 + v69[v104 - 7] + v108
			v69[v104] = bit32.bor(v109, 0)
			v68[v104] = v68[v104 - 16] + v105 + v68[v104 - 7] + v107 + v109 // 4294967296
		end
		local v110 = v73
		local v111 = v71
		local v112 = v79
		local v113 = v70
		local v114 = v77
		local v115 = v85
		local v116 = v78
		local v117 = v81
		local v118 = v72
		local v119 = v80
		local v120 = v75
		local v121 = v83
		local v122 = v74
		local v123 = v82
		local v124 = v76
		local v125 = v84
		for v126 = 1, 80 do
			local v127, v128 = big_sig0(v70, v78)
			local v129, v130 = big_sig1(v74, v82)
			local v131 = v85 + v130
			local v132 = bit32.band(v82, v83)
			local v133 = -1 - v82
			local v134 = bit32.band(v133, v84)
			local v135 = v131 + bit32.bor(v132, v134, 0) + v_u_4[v126] + v69[v126]
			local v136 = v77 + v129
			local v137 = bit32.band(v74, v75)
			local v138 = -1 - v74
			local v139 = bit32.band(v138, v76)
			local v140 = v136 + bit32.bor(v137, v139, 0) + v_u_3[v126] + v68[v126] + v135 // 4294967296
			local v141 = bit32.bor(v135, 0)
			local v142 = v128 + bit32.band(v80, v79)
			local v143 = bit32.bxor(v80, v79)
			local v144 = v142 + bit32.band(v78, v143)
			local v145 = v127 + bit32.band(v72, v71)
			local v146 = bit32.bxor(v72, v71)
			local v147 = v145 + bit32.band(v70, v146)
			local v148 = v141 + v81
			local v149 = v140 + v73 + v148 // 4294967296
			local v150 = bit32.bor(v148, 0)
			local v151 = v141 + v144
			local v152 = v140 + v147 + v151 // 4294967296
			local v153 = bit32.bor(v151, 0)
			v77 = v76
			v76 = v75
			v75 = v74
			v74 = v149
			v73 = v72
			v72 = v71
			v71 = v70
			v70 = v152
			v81 = v80
			v80 = v79
			v79 = v78
			v78 = v153
			v85 = v84
			v84 = v83
			v83 = v82
			v82 = v150
		end
		local v154 = v116 + v78
		local v155 = v113 + v70 + v154 // 4294967296
		v70 = bit32.bor(v155, 0)
		v78 = bit32.bor(v154, 0)
		local v156 = v112 + v79
		local v157 = v111 + v71 + v156 // 4294967296
		v71 = bit32.bor(v157, 0)
		v79 = bit32.bor(v156, 0)
		local v158 = v119 + v80
		local v159 = v118 + v72 + v158 // 4294967296
		v72 = bit32.bor(v159, 0)
		v80 = bit32.bor(v158, 0)
		local v160 = v117 + v81
		local v161 = v110 + v73 + v160 // 4294967296
		v73 = bit32.bor(v161, 0)
		v81 = bit32.bor(v160, 0)
		local v162 = v123 + v82
		local v163 = v122 + v74 + v162 // 4294967296
		v74 = bit32.bor(v163, 0)
		v82 = bit32.bor(v162, 0)
		local v164 = v121 + v83
		local v165 = v120 + v75 + v164 // 4294967296
		v75 = bit32.bor(v165, 0)
		v83 = bit32.bor(v164, 0)
		local v166 = v125 + v84
		local v167 = v124 + v76 + v166 // 4294967296
		v76 = bit32.bor(v167, 0)
		v84 = bit32.bor(v166, 0)
		local v168 = v115 + v85
		local v169 = v114 + v77 + v168 // 4294967296
		v77 = bit32.bor(v169, 0)
		v85 = bit32.bor(v168, 0)
	end
	p63[1] = v70
	p64[1] = v78
	p63[2] = v71
	p64[2] = v79
	p63[3] = v72
	p64[3] = v80
	p63[4] = v73
	p64[4] = v81
	p63[5] = v74
	p64[5] = v82
	p63[6] = v75
	p64[6] = v83
	p63[7] = v76
	p64[7] = v84
	p63[8] = v77
	p64[8] = v85
end
function sha512(p170)
	local v171 = {
		1779033703,
		3144134277,
		1013904242,
		2773480762,
		1359893119,
		2600822924,
		528734635,
		1541459225
	}
	local v172 = {
		4089235720,
		2227873595,
		4271175723,
		1595750129,
		2917565137,
		725511199,
		4215389547,
		327033209
	}
	local v173 = #p170
	if v173 > 1125899906842624 then
		error("cannot calculate the SHA-512 hash of a string longer than 2^50 bytes", 2)
	end
	local v174 = v173 % 128
	if v173 >= 128 then
		processBlocks(v171, v172, p170, 1, v173 - v174)
	end
	local v175 = v174 + 64
	local v176 = bit32.band(v175, 4294963200)
	local v177 = {}
	local v178
	if v174 == 0 then
		v178 = ""
	else
		local v179 = -v174
		v178 = string.sub(p170, v179)
	end
	__set_list(v177, 1, {v178, "\128", string.rep("\0", (v176 - v174 - 17) % 128), string.pack(">L", v173 * 8 / 4294967296), string.pack(">L", v173 * 8 % 4294967296)})
	local v180 = table.concat(v177)
	processBlocks(v171, v172, v180, 1, #v180)
	local v181 = buffer.create(64)
	for v182 = 1, 8 do
		local v183 = (v182 - 1) * 8
		local v184 = v171[v182]
		local v185 = bit32.byteswap(v184)
		buffer.writeu32(v181, v183, v185)
		local v186 = (v182 - 1) * 8 + 4
		local v187 = v172[v182]
		local v188 = bit32.byteswap(v187)
		buffer.writeu32(v181, v186, v188)
	end
	return v181
end
local v191 = {
	["Name"] = "SHA-512",
	["BlockSize"] = 128,
	["OutputSize"] = 64,
	["Digest"] = function(p189)
		return buffer.tostring(sha512(p189))
	end,
	["DigestBuffer"] = function(p190)
		return sha512(buffer.tostring(p190))
	end,
	["DigestToBuffer"] = sha512
}
table.freeze(v191)
return v191