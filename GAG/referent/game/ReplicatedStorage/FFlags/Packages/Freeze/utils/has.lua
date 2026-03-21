local v_u_1 = require(script.Parent.isImmutable)
local v_u_2 = require(script.Parent.isDataStructure)
return function(p3, p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if v_u_1(p3) then
		return p3:has(p4)
	end
	local v5 = v_u_2(p3)
	if v5 then
		v5 = p3[p4] ~= nil
	end
	return v5
end