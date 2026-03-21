local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, ...)
	-- upvalues: (copy) v_u_1
	local v3 = select("#", ...)
	local v4 = table.clone(p2)
	for v5 = v3, 1, -1 do
		local v6 = select(v5, ...)
		table.insert(v4, 1, v6)
	end
	return v_u_1(v4)
end