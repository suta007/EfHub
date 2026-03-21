local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = table.clone(p2)
	table.sort(v4, p3)
	return v_u_1(v4)
end