local v_u_1 = game:GetService("HttpService")
local function v_u_8()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1:GenerateGUID(false)
	local v3 = string.sub(v2, 1, 8)
	local v4 = tonumber(v3, 16)
	local v5 = string.sub(v2, 10, 13) .. string.sub(v2, 25, 28)
	local v6 = tonumber(v5, 16)
	local v7 = string.sub(v2, 29, 36)
	return v4, v6, tonumber(v7, 16)
end
return function(p9)
	-- upvalues: (copy) v_u_8
	local v10 = table.create(p9, 0)
	local v11 = p9 // 3
	for v12 = 0, v11 - 1 do
		local v13 = v12 * 3 + 1
		local v14 = v12 * 3 + 2
		local v15 = v12 * 3 + 3
		local v16, v17, v18 = v_u_8()
		v10[v13] = v16
		v10[v14] = v17
		v10[v15] = v18
	end
	local v19 = p9 - v11 * 3
	if v19 == 1 then
		v10[p9] = v_u_8()
		return v10
	else
		if v19 == 2 then
			local v20 = p9 - 1
			local v21, v22 = v_u_8()
			v10[v20] = v21
			v10[p9] = v22
		end
		return v10
	end
end