return function(p1, p2, p3, p4)
	local v5 = p1:pointToObjectSpace(p2)
	local v6 = v5.unit
	local v7 = v5.magnitude
	local v8 = (Vector3.new(0, 0, -1)):Cross(v6)
	local v9 = -v6.Z
	local v10 = math.acos(v9)
	local v11 = p1 * CFrame.fromAxisAngle(v8, v10)
	if v7 < math.max(p4, p3) - math.min(p4, p3) then
		return v11 * CFrame.new(0, 0, math.max(p4, p3) - math.min(p4, p3) - v7), -1.5707963267948966, 3.141592653589793
	end
	if p3 + p4 < v7 then
		return v11 * CFrame.new(0, 0, p3 + p4 - v7), 1.5707963267948966, 0
	end
	local v12 = (-(p4 * p4) + p3 * p3 + v7 * v7) / (2 * p3 * v7)
	local v13 = -math.acos(v12)
	local v14 = (p4 * p4 - p3 * p3 + v7 * v7) / (2 * p4 * v7)
	local v15 = math.acos(v14)
	return v11, v13 + 1.5707963267948966, v15 - v13
end