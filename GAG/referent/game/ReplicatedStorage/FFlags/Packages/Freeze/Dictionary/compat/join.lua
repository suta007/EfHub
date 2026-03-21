local v_u_1 = require(script.Parent.Parent.merge)
local v_u_2 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(...)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2("Dictionary." .. script.Name, "Dictionary.merge")
	return v_u_1(...)
end