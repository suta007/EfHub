return table.freeze({
	["QueryObject"] = function(p1, p2, p3)
		for _, v4 in ipairs(string.split(p2, ".")) do
			if p1 == nil then
				return false
			end
			if p1 == p3 then
				return true
			end
			if type(p1) ~= "table" then
				return false
			end
			p1 = p1[v4]
		end
		if p1 == nil then
			return false
		elseif p1 == p3 then
			return true
		else
			return true, p1
		end
	end,
	["HasHierarchicalOverlap"] = function(p5, p6)
		if p5 == p6 then
			return true
		end
		local v7 = string.split(p5, ".")
		local v8 = string.split(p6, ".")
		local v9 = #v7
		local v10 = #v8
		for v11 = 1, math.min(v9, v10) do
			if v7[v11] ~= v8[v11] then
				return false
			end
		end
		return true
	end
})