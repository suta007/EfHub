return function(p1, p2, p3)
	if type(p2) == "number" and p2 < 0 then
		p2 = #p1 + (p2 + 1)
	end
	return p1[p2] or p3
end