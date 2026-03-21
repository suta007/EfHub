local v_u_1 = require(script.Parent.Parent.utils.set)
local v_u_2 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p3, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v4 = table.clone(p3)
	for _, v5 in { ... } do
		v4 = v_u_1(v4, v5, nil)
	end
	return v_u_2(v4)
end