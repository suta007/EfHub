local v_u_1 = require(script.Parent.Parent.None)
local v_u_2 = require(script.Parent.get)
return function(p3, p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v6 = 0
	while v6 ~= #p4 do
		v6 = v6 + 1
		p3 = v_u_2(p3, p4[v6], v_u_1)
		if p3 == v_u_1 then
			return p5
		end
	end
	return p3
end