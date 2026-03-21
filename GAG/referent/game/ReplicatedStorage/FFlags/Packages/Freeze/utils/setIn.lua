local v_u_1 = require(script.Parent.updateIn)
local v_u_2 = require(script.Parent.Parent.None)
return function(p3, p4, p_u_5)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1(p3, p4, function()
		-- upvalues: (copy) p_u_5
		return p_u_5
	end, v_u_2)
end