local v_u_1 = require(script.Parent.get)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	return v_u_1(p2, -1, p3)
end