local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	local v4 = setmetatable({}, v3)
	v4.values = {}
	v4.list = {}
	v4.indexMapping = {}
	v4.length = 0
	v4.Changed = Instance.new("BindableEvent")
	if p2 then
		for _, v5 in ipairs(p2) do
			v4:add(v5)
		end
	end
	return v4
end
function v_u_1.add(p6, p7)
	if p7 ~= nil and not p6.values[p7] then
		p6.values[p7] = true
		p6.length = p6.length + 1
		local v8 = p6.list
		table.insert(v8, p7)
		p6.indexMapping[p7] = #p6.list
		p6.Changed:Fire()
	end
end
function v_u_1.remove(p9, p10)
	if p9.values[p10] then
		p9.values[p10] = nil
		p9.length = p9.length - 1
		local v11 = p9.indexMapping[p10]
		p9.list[v11] = p9.list[#p9.list]
		p9.indexMapping[p10] = nil
		p9.indexMapping[p9.list[v11]] = v11
		table.remove(p9.list, #p9.list)
		if p9.length == 0 then
			p9.indexMapping = {}
		end
		p9.Changed:Fire()
	end
end
function v_u_1.contains(p12, p13)
	return p12.values[p13] ~= nil
end
function v_u_1.__eq(p14, p15)
	for v16, _ in pairs(p14.values) do
		if not p15:contains(v16) then
			return false
		end
	end
	for v17, _ in pairs(p15.values) do
		if not p14:contains(v17) then
			return false
		end
	end
	return true
end
function v_u_1.tolist(p18)
	local v19 = {}
	for v20, _ in pairs(p18.values) do
		table.insert(v19, v20)
	end
	return v19
end
function v_u_1.toList(p21)
	return p21:tolist()
end
function v_u_1.getRandom(p22)
	if #p22.list < 1 then
		return nil
	else
		return p22.list[math.random(1, #p22.list)]
	end
end
function v_u_1.getRandomSubset(p23, p24)
	-- upvalues: (copy) v_u_1
	if p23.length < p24 then
		error("Requested subset size is greater than the size of the set")
	end
	local v25 = {}
	for v26 = 1, #p23.list do
		table.insert(v25, v26)
	end
	for v27 = #v25, 2, -1 do
		local v28 = math.random(1, v27)
		local v29 = v25[v28]
		local v30 = v25[v27]
		v25[v27] = v29
		v25[v28] = v30
	end
	local v31 = v_u_1.new()
	for v32 = 1, p24 do
		v31:add(p23.list[v25[v32]])
	end
	return v31
end
function v_u_1.popRandom(p33, p34)
	local v35
	if p34 then
		v35 = p34:NextInteger(1, #p33.list)
	else
		v35 = math.random(1, #p33.list)
	end
	local v36 = p33.list[v35]
	p33:remove(v36)
	return v36
end
function v_u_1.__add(p37, p38)
	local v39 = p37:clone()
	for v40, _ in pairs(p38.values) do
		v39:add(v40)
	end
	return v39
end
function v_u_1.__sub(p41, p42)
	-- upvalues: (copy) v_u_1
	local v43 = v_u_1.new()
	for v44, _ in pairs(p41.values) do
		if not p42:contains(v44) then
			v43:add(v44)
		end
	end
	return v43
end
function v_u_1.clone(p45)
	-- upvalues: (copy) v_u_1
	local v46 = v_u_1.new()
	for v47, _ in pairs(p45.values) do
		v46:add(v47)
	end
	return v46
end
function v_u_1.__len(p48)
	return p48.length
end
function v_u_1.intersection(p49, p50)
	-- upvalues: (copy) v_u_1
	local v51 = v_u_1.new()
	for v52, _ in pairs(p50.values) do
		if p49:contains(v52) then
			v51:add(v52)
		end
	end
	return v51
end
function v_u_1.xor(p53, p54)
	-- upvalues: (copy) v_u_1
	local v55 = v_u_1.new()
	for v56, _ in pairs(p53.values) do
		if not p54:contains(v56) then
			v55:add(v56)
		end
	end
	for v57, _ in pairs(p54.values) do
		if not p53:contains(v57) then
			v55:add(v57)
		end
	end
	return v55
end
function v_u_1.clear(p58)
	p58.values = {}
	p58.length = 0
	p58.list = {}
	p58.indexMapping = {}
	p58.Changed:Fire()
end
return v_u_1