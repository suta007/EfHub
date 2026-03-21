local v_u_1 = {
	0,
	2,
	2,
	2
}
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = type(p2) == "number"
	assert(v3)
	if p2 == (1 / 0) then
		return "Infinity"
	end
	if p2 ~= p2 then
		return "NaN"
	end
	local v4 = math.max(0, p2)
	local v5 = math.ceil(v4)
	local v6 = v5 % 60
	local v7 = v5 // 60
	local v8 = v7 % 60
	local v9 = v7 // 60
	local v10 = v9 % 24
	local v11 = {
		v9 // 24,
		v10,
		v8,
		v6
	}
	local v12 = #v11
	for v13, v14 in ipairs(v11) do
		if v14 > 0 then
			v12 = v13
			break
		end
	end
	if v12 == #v11 then
		return tostring(v6) .. "s"
	end
	local v15 = {}
	local v16 = v11[v12]
	__set_list(v15, 1, {(tostring(v16))})
	for v17 = v12 + 1, #v11 do
		local v18 = v11[v17]
		local v19 = tostring(v18)
		local v20 = v_u_1[v17]
		while #v19 < v20 do
			v19 = "0" .. v19
		end
		local v21 = ":" .. v19
		table.insert(v15, v21)
	end
	return table.concat(v15)
end