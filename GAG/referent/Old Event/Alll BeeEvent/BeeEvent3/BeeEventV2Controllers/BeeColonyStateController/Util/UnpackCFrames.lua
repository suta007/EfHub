return function(p1) -- name: UnpackPositions
	local v2 = {}
	for v3 = 0, buffer.readu16(p1, 0) - 1 do
		local v4 = v3 * 8 + 2
		local v5 = buffer.readu16(p1, v4)
		local v6 = v4 + 2
		local v7 = buffer.readi16(p1, v6) / 10
		local v8 = v4 + 4
		local v9 = buffer.readi16(p1, v8) / 10
		local v10 = v4 + 6
		local v11 = buffer.readi16(p1, v10) / 10
		v2[v5] = Vector3.new(v7, v9, v11)
	end
	return v2
end