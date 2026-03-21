local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3, ...)
	-- upvalues: (copy) v_u_1
	local v4 = #p2
	if p3 < 1 then
		p3 = v4 + p3
	end
	local v5 = v4 + 1
	local v6 = math.clamp(p3, 1, v5)
	local v7 = {}
	local v8 = 1
	for v9 = 1, v4 + 1 do
		if v9 == v6 then
			for v10 = 1, select("#", ...) do
				v7[v8] = select(v10, ...)
				v8 = v8 + 1
			end
		end
		v7[v8] = p2[v9]
		v8 = v8 + 1
	end
	return v_u_1(v7)
end