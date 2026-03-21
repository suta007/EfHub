local v_u_1 = require(script.Parent.slice)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1
	local v5 = p3 + 1
	return v4(p2, (math.max(1, v5)))
end