return function(p1, p2, p3)
	local v4 = (p1 - p2).Magnitude
	local v5 = CFrame.lookAt(p1, p2).LookVector * v4
	return workspace:Raycast(p1, v5, p3)
end