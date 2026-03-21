local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	local v4 = setmetatable({}, v3)
	v4.map1 = {}
	v4.map2 = {}
	if p2 then
		for v5, v6 in pairs(p2) do
			v4:registerPair(v5, v6)
		end
	end
	return v4
end
function v_u_1.registerPair(p7, p8, p9)
	p7:remove(p8)
	p7:remove(p9)
	p7.map1[p8] = p9
	p7.map2[p9] = p8
end
function v_u_1.clear(p10)
	table.clear(p10.map1)
	table.clear(p10.map2)
end
function v_u_1.remove(p11, p12)
	if p11.map1[p12] then
		local v13 = p11.map1[p12]
		p11.map1[p12] = nil
		p11.map2[v13] = nil
	elseif p11.map2[p12] then
		local v14 = p11.map2[p12]
		p11.map2[p12] = nil
		p11.map1[v14] = nil
	end
end
function v_u_1.getValue(p15, p16)
	return p15.map1[p16] or p15.map2[p16]
end
return v_u_1