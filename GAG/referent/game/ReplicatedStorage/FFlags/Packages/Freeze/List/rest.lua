local v_u_1 = require(script.Parent.slice)
return function(p2)
	-- upvalues: (copy) v_u_1
	return v_u_1(p2, 2)
end