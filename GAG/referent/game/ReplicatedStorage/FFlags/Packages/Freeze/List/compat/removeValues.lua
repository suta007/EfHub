local v_u_1 = require(script.Parent.Parent.removeValue)
local v_u_2 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(p3, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2("List." .. script.Name, "List.removeValue")
	return v_u_1(p3, ...)
end