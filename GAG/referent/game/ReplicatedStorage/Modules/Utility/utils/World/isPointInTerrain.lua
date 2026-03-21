return function(p1)
	local v2 = RaycastParams.new()
	v2.FilterType = Enum.RaycastFilterType.Include
	v2.FilterDescendantsInstances = { workspace.Terrain }
	local v3 = p1 + Vector3.new(0, 10000, 0)
	local v4 = workspace:Raycast(p1, v3 - p1, v2)
	if v4 then
		v3 = v4.Position or v3
	end
	return workspace:Raycast(v3, p1 - v3, v2) ~= nil
end