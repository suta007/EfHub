local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = require(script.node)
function v_u_1.new(p3)
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1
	local v5 = setmetatable({}, v4)
	v5.first = nil
	v5.last = nil
	v5.length = 0
	v5.Changed = Instance.new("BindableEvent")
	if p3 then
		for _, v6 in pairs(p3) do
			v5:appendEnd(v6)
		end
	end
	return v5
end
function v_u_1.toList(p7, p8)
	local v9 = p7[p8 and "last" or "first"]
	local v10 = {}
	local v11 = p8 and "prev" or "next"
	while v9 do
		local v12 = v9.value
		table.insert(v10, v12)
		v9 = v9[v11]
	end
	return v10
end
function v_u_1.appendEnd(p13, p14)
	-- upvalues: (copy) v_u_2
	if p13.first then
		local v15 = v_u_2.new(p14, p13.last, nil)
		p13.last.next = v15
		p13.last = v15
	else
		local v16 = v_u_2.new(p14, nil, nil)
		p13.first = v16
		p13.last = v16
	end
	p13.length = p13.length + 1
	p13.Changed:Fire()
	return p13.last
end
function v_u_1.peekStart(p17)
	if p17.first then
		return p17.first.value
	else
		return nil
	end
end
function v_u_1.peekEnd(p18)
	if p18.last then
		return p18.last.value
	else
		return nil
	end
end
function v_u_1.appendStart(p19, p20)
	-- upvalues: (copy) v_u_2
	if p19.first then
		local v21 = v_u_2.new(p20, nil, p19.first)
		p19.first.prev = v21
		p19.first = v21
	else
		local v22 = v_u_2.new(p20, nil, nil)
		p19.first = v22
		p19.last = v22
	end
	p19.length = p19.length + 1
	p19.Changed:Fire()
	return p19.first
end
function v_u_1.popStart(p23)
	if not p23.first then
		return nil
	end
	local v24 = p23.first.value
	if p23.first == p23.last then
		p23.first = nil
		p23.last = nil
	else
		p23.first = p23.first.next
		p23.first.prev = nil
	end
	p23.length = p23.length - 1
	p23.Changed:Fire()
	return v24
end
function v_u_1.popEnd(p25)
	if not p25.last then
		return nil
	end
	local v26 = p25.last.value
	if p25.last == p25.first then
		p25.first = nil
		p25.last = nil
	else
		p25.last = p25.last.prev
		p25.last.next = nil
	end
	p25.length = p25.length - 1
	p25.Changed:Fire()
	return v26
end
function v_u_1.removeNode(p27, p28)
	if p28 then
		if p28 == p27.first and p28 == p27.last then
			p27.first = nil
			p27.last = nil
		elseif p28 == p27.first then
			p27.first = p27.first.next
			if p27.first then
				p27.first.prev = nil
			end
		elseif p28 == p27.last then
			p27.last = p27.last.prev
			if p27.last then
				p27.last.next = nil
			end
		else
			p28.prev.next = p28.next
			p28.next.prev = p28.prev
		end
		p27.length = p27.length - 1
		p27.Changed:Fire()
	end
end
function v_u_1.removeByValue(p29, p30)
	local v31 = p29.first
	while v31 do
		if v31.value == p30 then
			p29:removeNode(v31)
			return
		end
		v31 = v31.next
	end
end
function v_u_1.findPosition(p32, p33)
	local v34 = p32.first
	local v35 = 1
	while v34 do
		if v34.value == p33 then
			return v35
		end
		v34 = v34.next
		v35 = v35 + 1
	end
	return nil
end
function v_u_1.filter(p36, p37, p38)
	local v39 = p36.first
	local v40 = {}
	while v39 do
		local v41 = v39.next
		if p37(v39.value) then
			local v42 = v39.value
			table.insert(v40, v42)
			if p38 then
				p36:removeNode(v39)
				v39 = v41
			else
				v39 = v41
			end
		else
			v39 = v41
		end
	end
	return v40
end
function v_u_1.__len(p43)
	return p43.length
end
function v_u_1.clear(p44)
	p44.first = nil
	p44.last = nil
	p44.length = 0
	p44.Changed:Fire()
end
return v_u_1