return function(p1, p2)
	local v3 = 0
	for v4, v5 in p1 do
		if p2 == nil or p2(v5, v4) then
			v3 = v3 + 1
		end
	end
	return v3
end