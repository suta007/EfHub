local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = #p2
	local v4 = table.create(v3)
	local v5 = v3 + 1
	for v6, _ in p2 do
		v4[v6] = p2[v5 - v6]
	end
	return v_u_1(v4)
end