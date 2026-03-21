local v_u_1 = require(script.Parent.Parent.None)
return function(...)
	-- upvalues: (copy) v_u_1
	local v2 = {}
	for v3 = 1, select("#", ...) do
		local v4 = select(v3, ...)
		if v4 ~= nil then
			local v5 = type(v4) == "table"
			assert(v5, "Expected table")
			for v6, v7 in v4 do
				if v7 == v_u_1 then
					v2[v6] = nil
				else
					v2[v6] = v7
				end
			end
		end
	end
	return v2
end