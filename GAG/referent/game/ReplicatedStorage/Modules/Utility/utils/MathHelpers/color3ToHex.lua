return function(p1)
	local v2 = p1.R * 255
	local v3 = math.floor(v2)
	local v4 = p1.G * 255
	local v5 = math.floor(v4)
	local v6 = p1.B * 255
	local v7 = math.floor(v6)
	return string.format("#%02X%02X%02X", v3, v5, v7)
end