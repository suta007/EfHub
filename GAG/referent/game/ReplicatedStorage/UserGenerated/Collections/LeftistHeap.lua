function _merge1(p1, p2, p3)
	if not p2.Left then
		p2.Left = p3
		return p2
	end
	p2.Right = _merge(p1, p2.Right, p3)
	if p2.Left.Npl < p2.Right.Npl then
		local v4 = p2.Right
		local v5 = p2.Left
		p2.Left = v4
		p2.Right = v5
	end
	p2.Npl = p2.Right.Npl + 1
	return p2
end
function _merge(p6, p7, p8)
	if p7 then
		if p8 then
			if p6(p7.Value, p8.Value) < 0 then
				return _merge1(p6, p7, p8)
			else
				return _merge1(p6, p8, p7)
			end
		else
			return p7
		end
	else
		return p8
	end
end
local v9 = {}
local v_u_10 = table.freeze({
	["__index"] = v9
})
function v9.Merge(p11, p12)
	if p11.Root ~= p12.Root then
		p11.Root = _merge(p11.Comparator, p11.Root, p12.Root)
		p12.Root = nil
	end
end
function v9.Insert(p13, p14)
	p13.Root = _merge(p13.Comparator, {
		["Value"] = p14,
		["Npl"] = 0
	}, p13.Root)
end
function v9.Min(p15)
	local v16 = p15.Root
	assert(v16)
	return p15.Root.Value
end
function v9.TryMin(p17)
	if p17.Root then
		return true, p17.Root.Value
	else
		return false, nil
	end
end
function v9.Pop(p18)
	local v19 = p18.Root
	assert(v19)
	local v20 = p18.Root.Value
	p18.Root = _merge(p18.Comparator, p18.Root.Left, p18.Root.Right)
	return v20
end
function v9.TryPop(p21)
	if not p21.Root then
		return false, nil
	end
	local v22 = p21.Root.Value
	p21.Root = _merge(p21.Comparator, p21.Root.Left, p21.Root.Right)
	return true, v22
end
function v9.PopFast(p23)
	p23.Root = _merge(p23.Comparator, p23.Root.Left, p23.Root.Right)
end
function v9.Empty(p24)
	return p24.Root == nil
end
function v9.Clear(p25)
	p25.Root = nil
end
table.freeze(v9)
return table.freeze({
	["Compare"] = function(p26, p27)
		return p26 < p27 and -1 or (p27 < p26 and 1 or 0)
	end,
	["new"] = function(p28, _)
		-- upvalues: (copy) v_u_10
		local v29 = type(p28) == "function"
		assert(v29)
		local v30 = v_u_10
		return setmetatable({
			["Comparator"] = p28
		}, v30)
	end
})