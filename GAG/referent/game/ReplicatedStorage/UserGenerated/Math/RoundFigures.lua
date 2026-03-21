local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Math.StableExp10)
return function(p3, p4, p5, p6)
	-- upvalues: (copy) v_u_2
	local v7 = type(p3) == "number"
	assert(v7)
	local v8 = p4 == nil and true or type(p4) == "number"
	assert(v8)
	local v9 = p5 == nil and true or type(p5) == "number"
	assert(v9)
	local v10 = p6 == nil and true or type(p6) == "function"
	assert(v10)
	if p3 ~= p3 or (p3 == (1 / 0) or p3 == (-1 / 0)) then
		return p3
	end
	local v11 = p4 or 3
	local v12 = p5 or 1
	local v13 = p6 or math.round
	local v14 = math.sign(p3)
	if v14 == 0 then
		return 0
	end
	local v15 = p3 * v14
	local v16 = math.log10(v15)
	local v17 = math.floor(v16) - v11 + 1
	if v12 ~= 1 then
		v15 = v15 / v12
	end
	return v_u_2(v13((v_u_2(v15, -v17))) * v12, v17) * v14
end