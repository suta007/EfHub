local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	local v4 = setmetatable({}, v3)
	v4.BaseCost = p2.BaseCost or 100
	v4.ScalingFactor = p2.ScalingFactor or 1.2
	return v4
end
function v_u_1.GetCost(p5, p6)
	local v7 = p5.BaseCost
	local v8 = p5.ScalingFactor
	return v7 * math.pow(p6, v8)
end
return v_u_1