function DeepCopyPure(p1, p2)
	if type(p1) ~= "table" then
		return p1
	end
	local v3 = not getmetatable(p1)
	assert(v3)
	local v4 = p2 or {}
	local v5 = not v4[p1]
	assert(v5)
	v4[p1] = true
	local v6 = {}
	for v7, v8 in next, p1 do
		v6[DeepCopyPure(v7, v4)] = DeepCopyPure(v8, v4)
	end
	v4[p1] = nil
	return v6
end
return DeepCopyPure