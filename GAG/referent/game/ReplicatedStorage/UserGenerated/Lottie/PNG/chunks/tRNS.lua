require(script.Parent.Parent.Types)
return function(p1, p2, p3, p4)
	local v5 = -1
	local v6 = -1
	local v7 = -1
	local v8 = -1
	if p3.colorType == 0 then
		local v9 = p2.length == 2
		assert(v9, "invalid tRNS length for color type")
		local v10 = p2.offset
		local v11 = p3.bitDepth
		local v12 = buffer.readu8(p1, v10)
		local v13 = bit32.lshift(v12, 8)
		local v14 = v10 + 1
		local v15 = buffer.readu8(p1, v14)
		local v16 = bit32.bor(v13, v15)
		v5 = bit32.extract(v16, 0, v11)
	elseif p3.colorType == 2 then
		local v17 = p2.length == 6
		assert(v17, "invalid tRNS length for color type")
		local v18 = p2.offset
		local v19 = p3.bitDepth
		local v20 = buffer.readu8(p1, v18)
		local v21 = bit32.lshift(v20, 8)
		local v22 = v18 + 1
		local v23 = buffer.readu8(p1, v22)
		local v24 = bit32.bor(v21, v23)
		v6 = bit32.extract(v24, 0, v19)
		local v25 = p2.offset + 2
		local v26 = p3.bitDepth
		local v27 = buffer.readu8(p1, v25)
		local v28 = bit32.lshift(v27, 8)
		local v29 = v25 + 1
		local v30 = buffer.readu8(p1, v29)
		local v31 = bit32.bor(v28, v30)
		v7 = bit32.extract(v31, 0, v26)
		local v32 = p2.offset + 4
		local v33 = p3.bitDepth
		local v34 = buffer.readu8(p1, v32)
		local v35 = bit32.lshift(v34, 8)
		local v36 = v32 + 1
		local v37 = buffer.readu8(p1, v36)
		local v38 = bit32.bor(v35, v37)
		v8 = bit32.extract(v38, 0, v33)
	else
		local v39 = p2.length
		assert(p4, "tRNS requires PLTE for color type")
		local v40 = v39 <= #p4.colors
		assert(v40, "tRNS specified too many PLTE alphas")
		for v41 = 1, v39 do
			local v42 = p4.colors[v41]
			local v43 = p2.offset + v41 - 1
			v42.a = buffer.readu8(p1, v43)
		end
	end
	return {
		["gray"] = v5,
		["red"] = v6,
		["green"] = v7,
		["blue"] = v8
	}
end