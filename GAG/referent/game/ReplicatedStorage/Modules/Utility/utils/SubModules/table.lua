return {
	["merge"] = function(p1, p2)
		local v3 = {}
		for _, v4 in ipairs(p1) do
			table.insert(v3, v4)
		end
		for _, v5 in ipairs(p2) do
			table.insert(v3, v5)
		end
		return v3
	end,
	["shuffle"] = function(p6)
		for v7 = #p6, 2, -1 do
			local v8 = math.random(v7)
			local v9 = p6[v8]
			local v10 = p6[v7]
			p6[v7] = v9
			p6[v8] = v10
		end
		return p6
	end
}