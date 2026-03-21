return function(p1)
	local _, v2 = p1:GetBoundingBox()
	local v3 = v2.X
	local v4 = v2.Y
	local v5 = v2.Z
	local v6 = Vector3.new(v3, v4, v5) / 2
	local v7 = -v2.X
	local v8 = v2.Y
	local v9 = v2.Z
	local v10 = Vector3.new(v7, v8, v9) / 2
	return {
		v6,
		-v6,
		v10,
		-v10
	}
end