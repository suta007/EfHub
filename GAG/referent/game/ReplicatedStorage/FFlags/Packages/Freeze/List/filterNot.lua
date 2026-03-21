local v_u_1 = require(script.Parent.filter)
return function(p2, p_u_3)
	-- upvalues: (copy) v_u_1
	return v_u_1(p2, function(p4, p5)
		-- upvalues: (copy) p_u_3
		return not p_u_3(p4, p5)
	end)
end