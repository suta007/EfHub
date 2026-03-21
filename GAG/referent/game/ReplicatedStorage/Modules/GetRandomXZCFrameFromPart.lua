return function(p1)
	local v2 = p1.Size
	local v3 = (math.random() - 0.5) * v2.X
	local v4 = (math.random() - 0.5) * v2.Z
	local v5 = Vector3.new(v3, 0, v4)
	return p1.CFrame * CFrame.new(v5)
end