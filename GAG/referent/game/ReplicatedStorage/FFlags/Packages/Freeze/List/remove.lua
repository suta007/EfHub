local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
local function v_u_9(p2, p3)
	local v4 = #p2
	local v5 = table.create(v4 - 1)
	if p3 < 1 then
		p3 = p3 + (v4 + 1)
	end
	if p3 <= 0 or v4 < p3 then
		return p2
	end
	local v6 = 1
	for v7, v8 in p2 do
		if v7 ~= p3 then
			v5[v6] = v8
			v6 = v6 + 1
		end
	end
	return v5
end
return function(p10, ...)
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	local v11 = { ... }
	if #v11 == 1 then
		return v_u_9(p10, v11[1])
	end
	local v12 = #p10
	local v13 = {}
	local v14 = 0
	for _, v16 in v11 do
		if v16 < 1 then
			local v16 = v16 + (v12 + 1)
		end
		if v16 > 0 and v12 >= v16 then
			v13[v16] = true
			v14 = v14 + 1
		end
	end
	if v14 == 0 then
		return p10
	end
	local v17 = table.create
	local v18 = v12 - v14
	local v19 = v17((math.max(1, v18)))
	local v20 = 1
	for v21, v22 in p10 do
		if not v13[v21] then
			v19[v20] = v22
			v20 = v20 + 1
		end
	end
	return v_u_1(v19)
end