local v_u_1 = require(script.Parent.Parent.values)
local v_u_2 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(p3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2("Dictionary." .. script.Name, "Dictionary.values")
	return v_u_1(p3)
end