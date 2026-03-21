local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = math.max(1, p3 or 1)
	local v5 = #p2
	local v6 = table.create(v5)
	for v7 = 1, v5 - v4 do
		v6[v7] = p2[v7]
	end
	return v_u_1(v6)
end