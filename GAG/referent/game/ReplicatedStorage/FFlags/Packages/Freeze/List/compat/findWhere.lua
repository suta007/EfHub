local v_u_1 = require(script.Parent.Parent.find)
local v_u_2 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v6 = p5 == nil
	assert(v6, "[Freeze] findWhere\'s `from` argument is not supported.")
	v_u_2("List." .. script.Name, "List.find")
	return v_u_1(p3, p4)
end