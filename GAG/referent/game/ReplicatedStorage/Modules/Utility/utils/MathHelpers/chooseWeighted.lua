local v_u_1 = Random.new()
local v_u_2 = {}
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v6
	if p4 then
		v6 = v_u_2[p3]
	else
		v6 = p4
	end
	if not v6 then
		v6 = 0
		for _, v8 in pairs(p3) do
			if p5 ~= nil then
				local v8 = v8[p5]
			end
			v6 = v6 + v8
		end
		if p4 then
			v_u_2[p3] = v6
		end
	end
	local v9 = v_u_1:NextNumber(0, v6)
	local v10 = 0
	for v11, v13 in pairs(p3) do
		if p5 ~= nil then
			local v13 = v13[p5]
		end
		v10 = v10 + v13
		if v9 <= v10 then
			return v11
		end
	end
	return nil
end