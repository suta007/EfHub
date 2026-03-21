require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local v_u_1 = table.create(80, 0)
function processBlocks(p2, p3, p4, p5)
	-- upvalues: (copy) v_u_1
	local v6 = v_u_1
	local v7 = p2[1]
	local v8 = p2[2]
	local v9 = p2[3]
	local v10 = p2[4]
	local v11 = p2[5]
	for v22 = p4, p5, 64 do
		local _ = v22
		for v13 = 1, 16 do
			local v14 = v22 + 3
			local v15, v16, v17, v18 = string.byte(p3, v22, v14)
			local v19 = bit32.lshift(v15, 24)
			local v20 = bit32.lshift(v16, 16)
			local v21 = bit32.lshift(v17, 8)
			v6[v13] = bit32.bor(v19, v20, v21, v18)
			local v22 = v22 + 4
		end
		for v23 = 17, 80 do
			local v24 = v6[v23 - 3]
			local v25 = v6[v23 - 8]
			local v26 = v6[v23 - 14]
			local v27 = v6[v23 - 16]
			local v28 = bit32.bxor(v24, v25, v26, v27)
			v6[v23] = bit32.lrotate(v28, 1)
		end
		local v29 = v7
		local v30 = v11
		local v31 = v10
		local v32 = v9
		local v33 = v8
		for v34 = 1, 20 do
			local v35 = bit32.lrotate(v7, 5) + bit32.band(v8, v9)
			local v36 = bit32.bnot(v8)
			local v37 = v35 + bit32.band(v36, v10) + v11 + 1518500249 + v6[v34]
			local v38 = bit32.lrotate(v8, 30)
			v11 = v10
			v10 = v9
			v9 = v38
			v8 = v7
			v7 = v37
		end
		for v39 = 21, 40 do
			local v40 = bit32.lrotate(v7, 5) + bit32.bxor(v8, v9, v10) + v11 + 1859775393 + v6[v39]
			local v41 = bit32.lrotate(v8, 30)
			v11 = v10
			v10 = v9
			v9 = v41
			v8 = v7
			v7 = v40
		end
		for v42 = 41, 60 do
			local v43 = bit32.lrotate(v7, 5) + bit32.band(v10, v9)
			local v44 = bit32.bxor(v10, v9)
			local v45 = v43 + bit32.band(v8, v44) + v11 + 2400959708 + v6[v42]
			local v46 = bit32.lrotate(v8, 30)
			v11 = v10
			v10 = v9
			v9 = v46
			v8 = v7
			v7 = v45
		end
		for v47 = 61, 80 do
			local v48 = bit32.lrotate(v7, 5) + bit32.bxor(v8, v9, v10) + v11 + 3395469782 + v6[v47]
			local v49 = bit32.lrotate(v8, 30)
			v11 = v10
			v10 = v9
			v9 = v49
			v8 = v7
			v7 = v48
		end
		local v50 = v7 + v29
		v7 = bit32.bor(v50, 0)
		local v51 = v8 + v33
		v8 = bit32.bor(v51, 0)
		local v52 = v9 + v32
		v9 = bit32.bor(v52, 0)
		local v53 = v10 + v31
		v10 = bit32.bor(v53, 0)
		local v54 = v11 + v30
		v11 = bit32.bor(v54, 0)
	end
	p2[1] = v7
	p2[2] = v8
	p2[3] = v9
	p2[4] = v10
	p2[5] = v11
end
function sha1(p55)
	local v56 = {
		1732584193,
		4023233417,
		2562383102,
		271733878,
		3285377520
	}
	local v57 = #p55
	local v58 = v57 % 64
	if v57 >= 64 then
		processBlocks(v56, p55, 1, v57 - v58)
	end
	local v59 = v58 + 32
	local v60 = bit32.band(v59, 4294967232)
	local v61 = {}
	local v62
	if v58 == 0 then
		v62 = ""
	else
		local v63 = -v58
		v62 = string.sub(p55, v63)
	end
	__set_list(v61, 1, {v62, "\128", string.rep("\0", (v60 - v58 - 9) % 64), string.pack(">L", v57 * 8)})
	local v64 = table.concat(v61)
	processBlocks(v56, v64, 1, #v64)
	local v65 = buffer.create(20)
	local v66 = v56[1]
	local v67 = bit32.byteswap(v66)
	buffer.writeu32(v65, 0, v67)
	local v68 = v56[2]
	local v69 = bit32.byteswap(v68)
	buffer.writeu32(v65, 4, v69)
	local v70 = v56[3]
	local v71 = bit32.byteswap(v70)
	buffer.writeu32(v65, 8, v71)
	local v72 = v56[4]
	local v73 = bit32.byteswap(v72)
	buffer.writeu32(v65, 12, v73)
	local v74 = v56[5]
	local v75 = bit32.byteswap(v74)
	buffer.writeu32(v65, 16, v75)
	return v65
end
local v78 = {
	["Name"] = "SHA-1",
	["BlockSize"] = 64,
	["OutputSize"] = 20,
	["Digest"] = function(p76)
		return buffer.tostring(sha1(p76))
	end,
	["DigestBuffer"] = function(p77)
		return sha1(buffer.tostring(p77))
	end,
	["DigestToBuffer"] = sha1
}
table.freeze(v78)
return v78