return function(p1, p2)
	local v3 = {}
	for v4, v5 in p1 do
		local v6, v7 = p2(v5, v4)
		if v7 == nil then
			v7 = v4
		end
		if v6 ~= nil then
			v3[v7] = v6
		end
	end
	return v3
end