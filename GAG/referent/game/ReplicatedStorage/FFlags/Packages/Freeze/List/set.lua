local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3, p4)
	-- upvalues: (copy) v_u_1
	if p2[p3] == p4 then
		return p2
	end
	local v5 = table.clone(p2)
	v5[p3] = p4
	return v_u_1(v5)
end