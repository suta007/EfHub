local v_u_1 = require(script.Parent.Parent.utils.merge)
local v_u_2 = require(script.Parent.Parent.utils.maybeFreeze)
return function(...)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	return v_u_2(v_u_1(...))
end