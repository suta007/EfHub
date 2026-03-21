local function v_u_3(p1, p2)
	return p2 < p1
end
return function(p4, p5)
	-- upvalues: (copy) v_u_3
	if p5 == nil then
		p5 = v_u_3
	end
	local v6 = nil
	local v7 = nil
	for v8, v9 in p4 do
		if v6 == nil or p5(v6, v9) == true then
			v7 = v8
			v6 = v9
		end
	end
	return v6, v7
end