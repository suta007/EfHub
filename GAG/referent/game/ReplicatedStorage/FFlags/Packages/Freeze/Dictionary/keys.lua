local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = {}
	for v4, _ in p2 do
		table.insert(v3, v4)
	end
	return v_u_1(v3)
end