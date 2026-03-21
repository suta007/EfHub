local v_u_3 = {
	["MakeChanced"] = function(p1, p2)
		p1.Chance = p2
		return p1
	end
}
local function v_u_9(p4)
	local v5 = 0
	local v6 = {}
	for _, v7 in pairs(p4) do
		local v8 = v7.Chance or 1
		v5 = v5 + v8
		table.insert(v6, {
			["Item"] = v7,
			["Chance"] = v8
		})
	end
	return v6, v5
end
local function v_u_16(p10, p11, p12)
	if p11 == 0 then
		return nil
	end
	local v13 = (p12 or Random.new()):NextNumber() * p11
	local v14 = 0
	for _, v15 in ipairs(p10) do
		v14 = v14 + v15.Chance
		if v13 <= v14 then
			return v15.Item
		end
	end
	return p10[#p10].Item
end
function v_u_3.One(p17, p18)
	-- upvalues: (copy) v_u_9, (copy) v_u_16
	local v19, v20 = v_u_9(p17)
	local v21 = v_u_16(v19, v20, p18 or Random.new())
	if not v21 then
		error("PickRandom.One: No item found. Input table is probably empty")
	end
	return v21
end
function v_u_3.List(p22, p23, p24)
	-- upvalues: (copy) v_u_9, (copy) v_u_16, (copy) v_u_3
	if p24 == nil then
		p24 = false
	end
	local v25 = {}
	if p24 then
		local v26, v27 = v_u_9(p22)
		for _ = 1, p23 do
			local v28 = v_u_16(v26, v27)
			if v28 then
				table.insert(v25, v28)
			end
		end
		return v25
	end
	local v29 = {}
	for v30, v31 in pairs(p22) do
		v29[v30] = v31
	end
	for _ = 1, p23 do
		if next(v29) == nil then
			break
		end
		local v32 = v_u_3.One(v29)
		if v32 then
			table.insert(v25, v32)
			for v33, v34 in pairs(v29) do
				if v34 == v32 then
					v29[v33] = nil
					break
				end
			end
		end
	end
	return v25
end
return v_u_3