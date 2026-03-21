local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
local v_u_2 = require(script.Parent.toSet)
local function v_u_9(p3, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v4 = v_u_2({ ... })
	local v5 = {}
	local v6 = 1
	local v7 = false
	for _, v8 in ipairs(p3) do
		if v4[v8] then
			v7 = true
		else
			v5[v6] = v8
			v6 = v6 + 1
		end
	end
	if v7 then
		return v_u_1(v5)
	else
		return p3
	end
end
return function(p10, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v11 = { ... }
	if #v11 == 1 then
		local v12 = v11[1]
		local v13 = table.create(#p10)
		local v14 = false
		for _, v15 in p10 do
			if v15 == v12 then
				v14 = true
			else
				table.insert(v13, v15)
			end
		end
		if v14 then
			return v_u_1(v13)
		else
			return p10
		end
	else
		return v_u_9(p10, ...)
	end
end