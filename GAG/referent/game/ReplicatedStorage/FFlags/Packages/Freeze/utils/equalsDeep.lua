local v_u_1 = require(script.Parent.equalObjects)
local function v_u_8(p2, p3)
	-- upvalues: (copy) v_u_8
	if type(p2) ~= "table" or type(p3) ~= "table" then
		return p2 == p3
	end
	for v4, v5 in pairs(p2) do
		if not v_u_8(p3[v4], v5) then
			return false
		end
	end
	for v6, v7 in pairs(p3) do
		if not v_u_8(p2[v6], v7) then
			return false
		end
	end
	return true
end
return function(...)
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	if v_u_1(...) then
		return true
	end
	local v9 = select("#", ...)
	local v10 = select(1, ...)
	for v11 = 2, v9 do
		if not v_u_8(v10, (select(v11, ...))) then
			return false
		end
	end
	return true
end