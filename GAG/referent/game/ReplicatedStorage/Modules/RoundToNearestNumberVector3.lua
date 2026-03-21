local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.RoundToNearestNumber)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = p4 or 0.25
	local v6 = v_u_2(p3.X, v5)
	local v7 = v_u_2(p3.Y, v5)
	local v8 = v_u_2
	local v9 = p3.Z
	return Vector3.new(v6, v7, v8(v9, v5))
end