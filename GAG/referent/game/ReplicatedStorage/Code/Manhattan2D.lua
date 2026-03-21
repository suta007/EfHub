return function(p1, p2)
	local v3 = p2.CFrame:PointToObjectSpace(p1)
	p2.CFrame:PointToObjectSpace(v3)
	local v4 = v3.X
	if math.abs(v4) > p2.Size.X / 2 then
		return false
	end
	local v5 = v3.Z
	return math.abs(v5) <= p2.Size.Z / 2
end