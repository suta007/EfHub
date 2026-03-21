local v1 = script.Parent.Parent.utils
local v_u_2 = require(v1.updateIn)
local v_u_3 = require(v1.maybeFreeze)
return function(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3(v_u_2(p4, p5, p6, p7))
end