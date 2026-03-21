local v_u_1 = {
	[48] = 0,
	[49] = 1,
	[50] = 2,
	[51] = 3,
	[52] = 4,
	[53] = 5,
	[54] = 6,
	[55] = 7,
	[56] = 8,
	[57] = 9,
	[65] = 10,
	[66] = 11,
	[67] = 12,
	[68] = 13,
	[69] = 14,
	[70] = 15,
	[97] = 10,
	[98] = 11,
	[99] = 12,
	[100] = 13,
	[101] = 14,
	[102] = 15
}
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = #p2
	local v4 = v3 % 2 == 0
	assert(v4, "hex length must be even")
	local v5 = buffer.create(v3 // 2)
	local v6 = 0
	for v7 = 1, v3, 2 do
		local v8 = v7 + 1
		local v9, v10 = string.byte(p2, v7, v8)
		local v11 = v_u_1[v9]
		if not v11 then
			error((("invalid hex at %*"):format(v7)))
		end
		local v12 = v_u_1[v10]
		if not v12 then
			error((("invalid hex at %*"):format(v7 + 1)))
		end
		local v13 = v11 * 16 + v12
		buffer.writeu8(v5, v6, v13)
		v6 = v6 + 1
	end
	return v5
end