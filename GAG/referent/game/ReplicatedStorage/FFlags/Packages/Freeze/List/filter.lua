local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = table.create(#p2)
	for v5, v6 in p2 do
		if p3(v6, v5) then
			table.insert(v4, v6)
		end
	end
	return v_u_1(v4)
end