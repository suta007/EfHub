local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
local function v_u_11(p2, p3)
	-- upvalues: (copy) v_u_11, (copy) v_u_1
	local v4 = {}
	local v5 = 1
	for _, v6 in p2 do
		if type(v6) == "table" and (not p3 or p3 > 0) then
			local v7 = v_u_11
			local v8
			if p3 then
				v8 = p3 - 1
			else
				v8 = p3
			end
			local v9 = v7(v6, v8)
			for v10 = 1, #v9 do
				v4[v5] = v9[v10]
				v5 = v5 + 1
			end
		else
			v4[v5] = v6
			v5 = v5 + 1
		end
	end
	return v_u_1(v4)
end
return v_u_11