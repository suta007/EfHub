return function(p1, p2)
	local v3 = p1 / p2 + 0.5
	return math.floor(v3) * p2
end