local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
local function v_u_12(p2, p3)
	-- upvalues: (copy) v_u_12
	local v4 = {}
	for v5, v6 in p2 do
		if type(v6) == "table" and (not p3 or p3 > 0) then
			local v7 = v_u_12
			local v8
			if p3 then
				v8 = p3 - 1
			else
				v8 = p3
			end
			local v9 = v7(v6, v8)
			for v10, v11 in pairs(v4) do
				v9[v10] = v11
			end
			v4 = v9
		else
			v4[v5] = v6
		end
	end
	return v4
end
return function(p13, p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_12
	return v_u_1((v_u_12(p13, p14)))
end