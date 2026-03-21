require(script.Parent.Parent.Types)
local v_u_1 = {
	[0] = {
		1,
		2,
		4,
		8,
		16
	},
	[2] = { 8, 16 },
	[3] = {
		1,
		2,
		4,
		8
	},
	[4] = { 8, 16 },
	[6] = { 8, 16 }
}
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = p3.length == 13
	assert(v4, "IHDR data must be 13 bytes")
	local v5 = p3.offset
	local v6 = buffer.readu32(p2, v5)
	local v7 = bit32.byteswap(v6)
	local v8 = v5 + 4
	local v9 = buffer.readu32(p2, v8)
	local v10 = bit32.byteswap(v9)
	local v11 = v5 + 8
	local v12 = buffer.readu8(p2, v11)
	local v13 = v5 + 9
	local v14 = buffer.readu8(p2, v13)
	local v15 = v5 + 10
	local v16 = buffer.readu8(p2, v15)
	local v17 = v5 + 11
	local v18 = buffer.readu8(p2, v17)
	local v19 = v5 + 12
	local v20 = buffer.readu8(p2, v19)
	local v21
	if v7 > 0 and (v7 <= 2147483648 and v10 > 0) then
		v21 = v10 <= 2147483648
	else
		v21 = false
	end
	assert(v21, "invalid dimensions")
	local v22 = v16 == 0
	assert(v22, "invalid compression method")
	local v23 = v18 == 0
	assert(v23, "invalid filter method")
	local v24 = v20 == 0 and true or v20 == 1
	assert(v24, "invalid interlace method")
	local v25 = v_u_1[v14]
	local v26 = v25 ~= nil
	assert(v26, "invalid color type")
	local v27 = table.find(v25, v12) ~= nil
	assert(v27, "invalid bit depth")
	return {
		["width"] = v7,
		["height"] = v10,
		["bitDepth"] = v12,
		["colorType"] = v14,
		["interlaced"] = v20 == 1
	}
end