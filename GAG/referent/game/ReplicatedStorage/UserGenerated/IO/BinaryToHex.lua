return function(p1)
	local v2 = string.len(p1)
	local v3 = buffer.create(v2 * 2)
	for v4 = 0, v2 - 1 do
		local v5 = v4 + 1
		local v6 = string.byte(p1, v5)
		local v7 = bit32.rshift(v6, 4)
		local v8 = bit32.band(v6, 15)
		local v9 = v4 * 2 + 0
		local v10
		if v7 < 10 then
			v10 = v7 + 48
		else
			v10 = v7 + 87
		end
		buffer.writeu8(v3, v9, v10)
		local v11 = v4 * 2 + 1
		local v12
		if v8 < 10 then
			v12 = v8 + 48
		else
			v12 = v8 + 87
		end
		buffer.writeu8(v3, v11, v12)
	end
	return buffer.tostring(v3)
end