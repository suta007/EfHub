return function(p1, p2)
	local v3, v4, v5 = p1:ToHSV()
	local v6 = v5 + p2
	local v7 = math.clamp(v6, 0, 1)
	return Color3.fromHSV(v3, v4, v7)
end