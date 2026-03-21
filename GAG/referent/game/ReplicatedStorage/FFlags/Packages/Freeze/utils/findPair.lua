return function(p1, p2)
	for v3, v4 in p1 do
		if p2(v4, v3) == true then
			return v3, v4
		end
	end
	return nil
end