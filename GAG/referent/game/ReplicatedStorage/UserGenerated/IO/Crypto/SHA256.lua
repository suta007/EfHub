require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local v_u_1 = {
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
	3329325298
}
local v_u_2 = table.create(64, 0)
function processBlocks(p3, p4, p5, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v7 = v_u_2
	local v8 = p3[1]
	local v9 = p3[2]
	local v10 = p3[3]
	local v11 = p3[4]
	local v12 = p3[5]
	local v13 = p3[6]
	local v14 = p3[7]
	local v15 = p3[8]
	for v26 = p5, p6, 64 do
		local _ = v26
		for v17 = 1, 16 do
			local v18 = v26 + 3
			local v19, v20, v21, v22 = string.byte(p4, v26, v18)
			local v23 = bit32.lshift(v19, 24)
			local v24 = bit32.lshift(v20, 16)
			local v25 = bit32.lshift(v21, 8)
			v7[v17] = bit32.bor(v23, v24, v25, v22)
			local v26 = v26 + 4
		end
		for v27 = 17, 64 do
			local v28 = v7[v27 - 2]
			local v29 = v7[v27 - 15]
			local v30 = bit32.rrotate(v28, 17)
			local v31 = bit32.rrotate(v28, 19)
			local v32 = bit32.rshift(v28, 10)
			local v33 = bit32.bxor(v30, v31, v32) + v7[v27 - 7]
			local v34 = bit32.rrotate(v29, 7)
			local v35 = bit32.rrotate(v29, 18)
			local v36 = bit32.rshift(v29, 3)
			v7[v27] = v33 + bit32.bxor(v34, v35, v36) + v7[v27 - 16]
		end
		local v37 = v8
		local v38 = v14
		local v39 = v13
		local v40 = v12
		local v41 = v15
		local v42 = v11
		local v43 = v10
		local v44 = v9
		for v45 = 1, 64 do
			local v46 = bit32.rrotate(v12, 6)
			local v47 = bit32.rrotate(v12, 11)
			local v48 = bit32.rrotate(v12, 25)
			local v49 = v15 + bit32.bxor(v46, v47, v48) + bit32.band(v12, v13)
			local v50 = bit32.bnot(v12)
			local v51 = v49 + bit32.band(v50, v14) + v_u_1[v45] + v7[v45]
			local v52 = bit32.band(v10, v9)
			local v53 = bit32.bxor(v10, v9)
			local v54 = v52 + bit32.band(v8, v53)
			local v55 = bit32.rrotate(v8, 2)
			local v56 = bit32.rrotate(v8, 13)
			local v57 = bit32.rrotate(v8, 22)
			local v58 = v54 + bit32.bxor(v55, v56, v57)
			local v59 = v11 + v51
			local v60 = v51 + v58
			v15 = v14
			v14 = v13
			v13 = v12
			v12 = v59
			v11 = v10
			v10 = v9
			v9 = v8
			v8 = v60
		end
		local v61 = v8 + v37
		v8 = bit32.bor(v61, 0)
		local v62 = v9 + v44
		v9 = bit32.bor(v62, 0)
		local v63 = v10 + v43
		v10 = bit32.bor(v63, 0)
		local v64 = v11 + v42
		v11 = bit32.bor(v64, 0)
		local v65 = v12 + v40
		v12 = bit32.bor(v65, 0)
		local v66 = v13 + v39
		v13 = bit32.bor(v66, 0)
		local v67 = v14 + v38
		v14 = bit32.bor(v67, 0)
		local v68 = v15 + v41
		v15 = bit32.bor(v68, 0)
	end
	p3[1] = v8
	p3[2] = v9
	p3[3] = v10
	p3[4] = v11
	p3[5] = v12
	p3[6] = v13
	p3[7] = v14
	p3[8] = v15
end
function sha256(p69)
	local v70 = {
		1779033703,
		3144134277,
		1013904242,
		2773480762,
		1359893119,
		2600822924,
		528734635,
		1541459225
	}
	local v71 = #p69
	local v72 = v71 % 64
	if v71 >= 64 then
		processBlocks(v70, p69, 1, v71 - v72)
	end
	local v73 = v72 + 32
	local v74 = bit32.band(v73, 4294967232)
	local v75 = {}
	local v76
	if v72 == 0 then
		v76 = ""
	else
		local v77 = -v72
		v76 = string.sub(p69, v77)
	end
	__set_list(v75, 1, {v76, "\128", string.rep("\0", (v74 - v72 - 9) % 64), string.pack(">L", v71 * 8)})
	local v78 = table.concat(v75)
	processBlocks(v70, v78, 1, #v78)
	local v79 = buffer.create(32)
	for v80 = 1, 8 do
		local v81 = (v80 - 1) * 4
		local v82 = v70[v80]
		local v83 = bit32.byteswap(v82)
		buffer.writeu32(v79, v81, v83)
	end
	return v79
end
local v86 = {
	["Name"] = "SHA-256",
	["BlockSize"] = 64,
	["OutputSize"] = 32,
	["Digest"] = function(p84)
		return buffer.tostring(sha256(p84))
	end,
	["DigestBuffer"] = function(p85)
		return sha256(buffer.tostring(p85))
	end,
	["DigestToBuffer"] = sha256
}
table.freeze(v86)
return v86