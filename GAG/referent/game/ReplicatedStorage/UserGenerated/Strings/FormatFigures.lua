local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Math.RoundFigures)
local v_u_3 = require(v1.UserGenerated.Strings.Commas)
return function(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3(v_u_2(p4, p5, p6, p7))
end