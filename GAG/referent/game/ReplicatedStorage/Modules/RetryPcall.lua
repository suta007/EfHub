return function(p1, p2, p3, ...)
	local v4 = { false }
	local v5 = p2 or 1
	for _ = 1, p1 do
		v4 = { pcall(p3, ...) }
		if v4[1] then
			break
		end
		local v6 = v5 * 0.1 * math.random()
		task.wait(v5 + v6)
		local v7 = v5 * 1.5
		v5 = math.min(v7, 120)
	end
	return table.unpack(v4)
end