local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, ...)
	-- upvalues: (copy) v_u_1
	if #{ ... } == 0 then
		return p2
	end
	local v3 = table.clone(p2)
	for _, v4 in { ... } do
		table.insert(v3, v4)
	end
	return v_u_1(v3)
end