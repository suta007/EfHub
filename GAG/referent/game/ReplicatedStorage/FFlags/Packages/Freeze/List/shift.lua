local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = #p2
	local v5 = math.min(v4, p3 or 1)
	local v6 = table.create(v4 - v5)
	for v7 = v5 + 1, v4 do
		v6[v7 - v5] = p2[v7]
	end
	return v_u_1(v6)
end