local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Strings.FormatAbbreviated)
return function(p3)
	-- upvalues: (copy) v_u_2
	local v4 = type(p3) == "number"
	assert(v4)
	return p3 == 0 and "0" or (p3 == (1 / 0) and "Infinity" or (p3 == (-1 / 0) and "-Infinity" or (p3 ~= p3 and "NaN" or "1/" .. v_u_2(1 / p3))))
end