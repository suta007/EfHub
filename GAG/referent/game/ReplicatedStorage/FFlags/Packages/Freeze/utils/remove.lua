local v_u_1 = require(script.Parent.isImmutable)
local v_u_2 = require(script.Parent.isDataStructure)
local v_u_3 = require(script.Parent.shallowCopy)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	if not v_u_2(p4) then
		error("Cannot update non-data-structure value: " .. tostring(p4))
	end
	if v_u_1(p4) then
		if not p4.remove then
			error("Cannot update immutable value without .remove() method: " .. tostring(p4))
		end
		return p4:remove(p5)
	elseif p4[p5] then
		local v6 = v_u_3(p4)
		if #v6 > 0 then
			table.remove(p4, p5)
			return v6
		else
			p4[p5] = nil
			return v6
		end
	else
		return p4
	end
end