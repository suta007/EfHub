local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1
	return setmetatable({
		["MaxID"] = 65535,
		["InUse"] = {}
	}, v2)
end
function v_u_1.Allocate(p3)
	for v4 = 0, p3.MaxID do
		if not p3.InUse[v4] then
			p3.InUse[v4] = true
			return v4
		end
	end
	return nil
end
function v_u_1.Release(p5, p6)
	if p5.InUse[p6] then
		p5.InUse[p6] = nil
	end
end
return v_u_1