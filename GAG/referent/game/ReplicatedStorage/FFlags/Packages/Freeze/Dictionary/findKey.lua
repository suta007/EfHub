local v_u_1 = require(script.Parent.Parent.utils.findPair)
return function(p2, p3, p4)
	-- upvalues: (copy) v_u_1
	local v5, _ = v_u_1(p2, p3)
	if v5 == nil then
		return p4
	else
		return v5
	end
end