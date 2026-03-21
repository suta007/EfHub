local v_u_1 = require(script.Parent.updateIn)
local v_u_2 = require(script.Parent.merge)
return function(p3, p4, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v_u_5 = { ... }
	return v_u_1(p3, p4, function(p6)
		-- upvalues: (ref) v_u_2, (copy) v_u_5
		local v7 = v_u_5
		return v_u_2(p6, table.unpack(v7))
	end, {})
end