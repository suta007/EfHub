return function(p1, p2)
	local v3 = p1.Size * 0.5
	local v4 = p1.CFrame:PointToObjectSpace(p2)
	local v5 = v4.X
	local v6
	if math.abs(v5) <= v3.X then
		local v7 = v4.Y
		if math.abs(v7) <= v3.Y then
			local v8 = v4.Z
			v6 = math.abs(v8) <= v3.Z
		else
			v6 = false
		end
	else
		v6 = false
	end
	return v6
end