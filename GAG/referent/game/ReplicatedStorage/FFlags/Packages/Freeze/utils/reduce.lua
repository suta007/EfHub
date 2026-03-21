return function(p1, p2, p3, p4)
	local v5 = #p1 + 1
	for v6, v8 in p1 do
		if p4 then
			local v8 = p1[v5 - v6]
		end
		p3 = p2(p3, v8, v6)
	end
	return p3
end