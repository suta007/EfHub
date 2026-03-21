local v_u_1 = require(script.Parent.findKey)
local v_u_2 = require(script.Parent.is)
return function(p3, p_u_4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1(p3, function(p5)
		-- upvalues: (ref) v_u_2, (copy) p_u_4
		return v_u_2(p5, p_u_4)
	end)
end