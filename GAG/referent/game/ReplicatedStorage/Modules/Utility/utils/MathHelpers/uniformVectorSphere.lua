return function(p1)
	local v2 = {}
	for v3 = 0, p1 - 1 do
		local v4 = 1 - v3 / (p1 - 1) * 2
		local v5 = 1 - v4 * v4
		local v6 = math.sqrt(v5)
		local v7 = 2.399963229728653 * v3
		local v8 = math.cos(v7) * v6
		local v9 = math.sin(v7) * v6
		local v10 = Vector3.new(v8, v4, v9)
		table.insert(v2, v10)
	end
	return v2
end