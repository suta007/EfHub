local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	return setmetatable({
		["pool"] = {},
		["createFunc"] = p2
	}, v3)
end
function v_u_1.get(p4)
	if #p4.pool > 0 then
		return table.remove(p4.pool)
	else
		return p4.createFunc()
	end
end
function v_u_1.release(p5, p6)
	local v7 = p5.pool
	table.insert(v7, p6)
	p6.Parent = script.Cache
end
return v_u_1