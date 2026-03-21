local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1
	return setmetatable({
		["_first"] = 0,
		["_last"] = -1,
		["_queue"] = {}
	}, v2)
end
function v_u_1.isEmpty(p3)
	return p3._first > p3._last
end
function v_u_1.enqueue(p4, p5)
	local v6 = p4._last + 1
	p4._last = v6
	p4._queue[v6] = p5
end
function v_u_1.dequeue(p7)
	if p7:isEmpty() then
		error("Cannot dequeue from empty queue")
	end
	local v8 = p7._first
	local v9 = p7._queue[v8]
	p7._queue[v8] = nil
	p7._first = v8 + 1
	return v9
end
return v_u_1