return function(p1, p2)
	local v3 = 0
	for v4, v5 in p1 do
		v3 = v3 + 1
		if p2(v5, v4) == false then
			break
		end
	end
	return v3
end