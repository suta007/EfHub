local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3, p4)
	-- upvalues: (copy) v_u_1
	local v5 = v_u_1
	local v6 = setmetatable({}, v5)
	v6.value = p2
	v6.prev = p3
	v6.next = p4
	return v6
end
return v_u_1