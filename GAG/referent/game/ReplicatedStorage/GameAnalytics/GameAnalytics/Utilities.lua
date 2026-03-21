return {
	["isStringNullOrEmpty"] = function(_, p1)
		return not p1 or #p1 == 0
	end,
	["stringArrayContainsString"] = function(_, p2, p3)
		if #p2 == 0 then
			return false
		end
		for _, v4 in ipairs(p2) do
			if v4 == p3 then
				return true
			end
		end
		return false
	end,
	["copyTable"] = function(p5, p6)
		local v7 = {}
		for v8, v9 in pairs(p6) do
			if typeof(v9) == "table" then
				v7[v8] = p5:copyTable(v9)
			else
				v7[v8] = v9
			end
		end
		return v7
	end
}