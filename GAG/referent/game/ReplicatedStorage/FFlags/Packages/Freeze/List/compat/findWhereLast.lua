local v_u_1 = require(script.Parent.Parent.reverse)
local v_u_2 = require(script.Parent.Parent.find)
local v_u_3 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(p4, p5, p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	local v7 = p6 == nil
	assert(v7, "[Freeze] findWhereLast\'s `from` argument is not supported.")
	v_u_3("List." .. script.Name, "List.reverse and then List.find")
	return v_u_2(v_u_1(p4), p5)
end