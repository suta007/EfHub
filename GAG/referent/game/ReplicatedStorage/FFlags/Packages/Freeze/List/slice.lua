local v_u_1 = require(script.Parent.Parent.utils.slice)
local v_u_2 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	return v_u_2(v_u_1(p3, p4, p5))
end