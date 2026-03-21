return function(p1)
	local v2 = 0
	for v3 = 1, #p1 do
		v2 = (v2 * 31 + string.byte(p1, v3)) % 4294967296
	end
	return v2
end