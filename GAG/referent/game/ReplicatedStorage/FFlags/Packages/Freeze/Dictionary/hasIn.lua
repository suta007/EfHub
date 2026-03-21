local v_u_1 = require(script.Parent.Parent.utils.getIn)
local v_u_2 = require(script.Parent.Parent.None)
return function(p3, p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1(p3, p4, v_u_2) ~= v_u_2
end