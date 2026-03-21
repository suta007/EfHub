return function(p1, p2)
	local v3 = math.random()
	local v4 = math.random()
	local v5 = math.log(v3) * -2
	local v6 = math.sqrt(v5)
	local v7 = 6.283185307179586 * v4
	return p1 + v6 * math.cos(v7) * p2
end