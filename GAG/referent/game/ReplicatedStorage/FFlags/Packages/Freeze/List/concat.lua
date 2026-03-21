local v_u_1 = require(script.Parent.Parent.None)
local v_u_2 = require(script.Parent.Parent.utils.maybeFreeze)
return function(...)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v3 = {}
	local v4 = 1
	for v5 = 1, select("#", ...) do
		local v6 = select(v5, ...)
		if v6 ~= nil and (type(v6) == "table" and #v6 > 0) then
			for _, v7 in ipairs(v6) do
				if v7 ~= v_u_1 then
					v3[v4] = v7
					v4 = v4 + 1
				end
			end
		end
	end
	return v_u_2(v3)
end