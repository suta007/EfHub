return function(p1, p2, p3)
	if p1[p2] == nil then
		return p3
	else
		return p1[p2]
	end
end