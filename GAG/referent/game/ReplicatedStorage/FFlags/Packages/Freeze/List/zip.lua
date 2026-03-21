local v_u_1 = require(script.Parent.Parent.utils.maybeFreeze)
return function(...)
	-- upvalues: (copy) v_u_1
	local v2 = select(1, ...)
	local v3 = {}
	local v4 = select("#", ...)
	if v4 <= 0 then
		return v3
	end
	local v5 = #v2
	for v6 = 2, v4 do
		local v7 = #select(v6, ...)
		if v7 < v5 then
			v5 = v7
		end
	end
	for v8 = 1, v5 do
		v3[v8] = {}
		for v9 = 1, v4 do
			local v10 = select(v9, ...)
			v3[v8][v9] = v10[v8]
		end
	end
	return v_u_1(v3)
end