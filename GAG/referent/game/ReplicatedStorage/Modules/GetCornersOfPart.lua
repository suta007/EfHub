return function(p1)
	local v2 = p1.Size
	local v3 = p1.CFrame
	return {
		v3 * CFrame.new(v2.X / 2, v2.Y / 2, v2.Z / 2),
		v3 * CFrame.new(-v2.X / 2, v2.Y / 2, v2.Z / 2),
		v3 * CFrame.new(v2.X / 2, -v2.Y / 2, v2.Z / 2),
		v3 * CFrame.new(-v2.X / 2, -v2.Y / 2, v2.Z / 2),
		v3 * CFrame.new(v2.X / 2, v2.Y / 2, -v2.Z / 2),
		v3 * CFrame.new(-v2.X / 2, v2.Y / 2, -v2.Z / 2),
		v3 * CFrame.new(v2.X / 2, -v2.Y / 2, -v2.Z / 2),
		v3 * CFrame.new(-v2.X / 2, -v2.Y / 2, -v2.Z / 2)
	}
end