return function(p1)
	if p1 >= 0 then
		local v2 = p1 // 4294967296
		return bit32.bor(v2, 0), bit32.bor(p1, 0)
	end
	local v3 = -1 - p1
	local v4 = v3 // 4294967296
	return bit32.bnot(v4), bit32.bnot(v3)
end