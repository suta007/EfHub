local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Strings.FormatOdds)
local v_u_3 = require(v1.UserGenerated.Strings.FormatPercent)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = type(p4) == "number"
	assert(v6)
	local v7 = p5 == nil and true or type(p5) == "number"
	assert(v7)
	local v8 = math.clamp(p4, 0, 1)
	local v9 = math.clamp(p5 or v8, 0, 1)
	if v8 > 0 and (v9 <= 0.0002 and v8 <= 0.001) then
		return v_u_2(v8)
	else
		return v_u_3(v8)
	end
end