require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local v_u_1 = {
	3614090360,
	3905402710,
	606105819,
	3250441966,
	4118548399,
	1200080426,
	2821735955,
	4249261313,
	1770035416,
	2336552879,
	4294925233,
	2304563134,
	1804603682,
	4254626195,
	2792965006,
	1236535329,
	4129170786,
	3225465664,
	643717713,
	3921069994,
	3593408605,
	38016083,
	3634488961,
	3889429448,
	568446438,
	3275163606,
	4107603335,
	1163531501,
	2850285829,
	4243563512,
	1735328473,
	2368359562,
	4294588738,
	2272392833,
	1839030562,
	4259657740,
	2763975236,
	1272893353,
	4139469664,
	3200236656,
	681279174,
	3936430074,
	3572445317,
	76029189,
	3654602809,
	3873151461,
	530742520,
	3299628645,
	4096336452,
	1126891415,
	2878612391,
	4237533241,
	1700485571,
	2399980690,
	4293915773,
	2240044497,
	1873313359,
	4264355552,
	2734768916,
	1309151649,
	4149444226,
	3174756917,
	718787259,
	3951481745
}
local v_u_2 = {
	7,
	12,
	17,
	22,
	7,
	12,
	17,
	22,
	7,
	12,
	17,
	22,
	7,
	12,
	17,
	22,
	5,
	9,
	14,
	20,
	5,
	9,
	14,
	20,
	5,
	9,
	14,
	20,
	5,
	9,
	14,
	20,
	4,
	11,
	16,
	23,
	4,
	11,
	16,
	23,
	4,
	11,
	16,
	23,
	4,
	11,
	16,
	23,
	6,
	10,
	15,
	21,
	6,
	10,
	15,
	21,
	6,
	10,
	15,
	21,
	6,
	10,
	15,
	21
}
local v_u_3 = table.create(64, 0)
function processBlocks(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	local v8 = v_u_3
	local v9 = p4[1]
	local v10 = p4[2]
	local v11 = p4[3]
	local v12 = p4[4]
	for v23 = p6, p7, 64 do
		local _ = v23
		for v14 = 1, 16 do
			local v15 = v23 + 3
			local v16, v17, v18, v19 = string.byte(p5, v23, v15)
			local v20 = bit32.lshift(v19, 24)
			local v21 = bit32.lshift(v18, 16)
			local v22 = bit32.lshift(v17, 8)
			v8[v14] = bit32.bor(v20, v21, v22, v16)
			local v23 = v23 + 4
		end
		local v24 = v12
		local v25 = v11
		local v26 = v10
		local v27 = v9
		for v28 = 0, 15 do
			local v29 = bit32.bxor(v11, v12)
			local v30 = bit32.band(v10, v29)
			local v31 = v9 + bit32.bxor(v12, v30) + v_u_1[v28 + 1] + v8[v28 + 1]
			local v32 = v_u_2[v28 + 1]
			local v33 = v10 + bit32.lrotate(v31, v32)
			v9 = v12
			v12 = v11
			v11 = v10
			v10 = v33
		end
		for v34 = 16, 31 do
			local v35 = bit32.bxor(v10, v11)
			local v36 = bit32.band(v12, v35)
			local v37 = v9 + bit32.bxor(v11, v36) + v_u_1[v34 + 1] + v8[(v34 * 5 + 1) % 16 + 1]
			local v38 = v_u_2[v34 + 1]
			local v39 = v10 + bit32.lrotate(v37, v38)
			v9 = v12
			v12 = v11
			v11 = v10
			v10 = v39
		end
		for v40 = 32, 47 do
			local v41 = v9 + bit32.bxor(v10, v11, v12) + v_u_1[v40 + 1] + v8[(v40 * 3 + 5) % 16 + 1]
			local v42 = v_u_2[v40 + 1]
			local v43 = v10 + bit32.lrotate(v41, v42)
			v9 = v12
			v12 = v11
			v11 = v10
			v10 = v43
		end
		for v44 = 48, 63 do
			local v45 = bit32.bnot(v12)
			local v46 = bit32.bor(v10, v45)
			local v47 = v9 + bit32.bxor(v11, v46) + v_u_1[v44 + 1] + v8[v44 * 7 % 16 + 1]
			local v48 = v_u_2[v44 + 1]
			local v49 = v10 + bit32.lrotate(v47, v48)
			v9 = v12
			v12 = v11
			v11 = v10
			v10 = v49
		end
		local v50 = v9 + v27
		v9 = bit32.bor(v50)
		local v51 = v10 + v26
		v10 = bit32.bor(v51)
		local v52 = v11 + v25
		v11 = bit32.bor(v52)
		local v53 = v12 + v24
		v12 = bit32.bor(v53)
	end
	p4[1] = v9
	p4[2] = v10
	p4[3] = v11
	p4[4] = v12
end
function md5(p54)
	local v55 = {
		1732584193,
		4023233417,
		2562383102,
		271733878
	}
	local v56 = #p54
	local v57 = v56 % 64
	if v56 >= 64 then
		processBlocks(v55, p54, 1, v56 - v57)
	end
	local v58 = v57 + 32
	local v59 = bit32.band(v58, 4294967232)
	local v60 = {}
	local v61
	if v57 == 0 then
		v61 = ""
	else
		local v62 = -v57
		v61 = string.sub(p54, v62)
	end
	__set_list(v60, 1, {v61, "\128", string.rep("\0", (v59 - v57 - 9) % 64), string.pack("<L", v56 * 8)})
	local v63 = table.concat(v60)
	processBlocks(v55, v63, 1, #v63)
	local v64 = buffer.create(16)
	local v65 = v55[1]
	buffer.writeu32(v64, 0, v65)
	local v66 = v55[2]
	buffer.writeu32(v64, 4, v66)
	local v67 = v55[3]
	buffer.writeu32(v64, 8, v67)
	local v68 = v55[4]
	buffer.writeu32(v64, 12, v68)
	return v64
end
local v71 = {
	["Name"] = "MD5",
	["BlockSize"] = 64,
	["OutputSize"] = 16,
	["Digest"] = function(p69)
		return buffer.tostring(md5(p69))
	end,
	["DigestBuffer"] = function(p70)
		return md5(buffer.tostring(p70))
	end,
	["DigestToBuffer"] = md5
}
table.freeze(v71)
return v71