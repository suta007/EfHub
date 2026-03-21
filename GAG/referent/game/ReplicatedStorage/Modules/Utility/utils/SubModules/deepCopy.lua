local function v_u_7(p1, p2)
	-- upvalues: (copy) v_u_7
	if type(p1) ~= "table" then
		return p1
	end
	local v3 = p2 or {}
	if v3[p1] then
		return v3[p1]
	end
	local v4 = {}
	v3[p1] = v4
	for v5, v6 in pairs(p1) do
		v4[v_u_7(v5, v3)] = v_u_7(v6, v3)
	end
	return v4
end
return v_u_7