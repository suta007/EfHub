local v_u_1 = require(script.Parent.isValueObject)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	if p2 == p3 or p2 ~= p2 and p3 ~= p3 then
		return true
	end
	if not (p2 and p3) then
		return false
	end
	if typeof(p2) == "function" and typeof(p3) == "function" then
		p2 = p2()
		p3 = p3()
		if p2 == p3 or p2 ~= p2 and p3 ~= p3 then
			return true
		end
		if not (p2 and p3) then
			return false
		end
	end
	local v4 = v_u_1(p2) and v_u_1(p3)
	if v4 then
		v4 = p2.equals(p3)
	end
	return v4 and true or false
end