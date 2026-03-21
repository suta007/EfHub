local v_u_1 = require(script.Parent.findPair)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4, _ = v_u_1(p2, p3)
	return v4
end