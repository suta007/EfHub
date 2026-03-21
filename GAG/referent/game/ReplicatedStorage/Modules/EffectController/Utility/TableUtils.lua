local function v_u_5(p1)
	-- upvalues: (copy) v_u_5
	if typeof(p1) ~= "table" then
		return p1
	end
	local v2 = {}
	for v3, v4 in pairs(p1) do
		v2[v3] = v_u_5(v4)
	end
	return v2
end
local function v_u_12(p6, p7)
	-- upvalues: (copy) v_u_12
	if typeof(p6) ~= "table" or typeof(p7) ~= "table" then
		return p6 == p7
	end
	for v8, v9 in pairs(p6) do
		if not v_u_12(v9, p7[v8]) then
			return false
		end
	end
	for v10, v11 in pairs(p7) do
		if not v_u_12(v11, p6[v10]) then
			return false
		end
	end
	return true
end
return {
	["deepCopy"] = v_u_5,
	["deepEquals"] = v_u_12,
	["getDictionaryLength"] = function(p13)
		local v14 = 0
		for _, _ in p13 do
			v14 = v14 + 1
		end
		return v14
	end
}