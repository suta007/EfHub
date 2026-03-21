local v_u_1 = require(script.Parent.updateIn)
return function(p2, p3, p4, p5)
	-- upvalues: (copy) v_u_1
	return v_u_1(p2, { p3 }, p4, p5)
end