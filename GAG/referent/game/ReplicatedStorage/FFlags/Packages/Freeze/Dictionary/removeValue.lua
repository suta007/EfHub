local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = {}
	local v5 = false
	for v6, v7 in p2 do
		if v7 == p3 then
			v5 = true
		else
			v4[v6] = v7
		end
	end
	if v5 then
		return v_u_1(v4)
	else
		return p2
	end
end