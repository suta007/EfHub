return {
	["dict"] = function(p1, p2)
		local v3 = 0
		for _, v4 in p1 do
			v3 = v3 + v4
		end
		local v5 = (p2 or Random.new()):NextNumber(0, v3)
		local v6 = 0
		for v7, v8 in p1 do
			v6 = v6 + v8
			if v5 <= v6 then
				return v7
			end
		end
		return nil
	end,
	["array"] = function(p9, p10)
		local v11 = 0
		for _, v12 in p9 do
			v11 = v11 + v12.Chance
		end
		local v13 = (p10 or Random.new()):NextNumber(0, v11)
		local v14 = 0
		for v15, v16 in p9 do
			v14 = v14 + v16.Chance
			if v13 <= v14 then
				return v16, v15
			end
		end
		return nil, nil
	end
}