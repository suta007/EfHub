local v_u_1 = require(script.Parent.Parent.utils.keyOf)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1(p2, p3)
	if v4 == nil then
		return nil
	else
		return v4
	end
end