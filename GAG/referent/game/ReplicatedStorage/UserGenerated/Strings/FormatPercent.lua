local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Strings.FormatFigures)
return function(p3)
	-- upvalues: (copy) v_u_2
	return v_u_2(p3 * 100, 4, 5) .. "%"
end