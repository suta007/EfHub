local v_u_1 = require(script.Parent.isImmutable)
return function(p2)
	-- upvalues: (copy) v_u_1
	if v_u_1(p2) then
		return p2:clone()
	else
		return table.clone(p2)
	end
end