local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(...)
	-- upvalues: (copy) v_u_1
	local v_u_2 = { ... }
	local v3 = #v_u_2 >= 3
	assert(v3, "Must have at least 3 points")
	local v4 = #v_u_2 == 3
	local v5 = #v_u_2 == 4
	local v6 = {}
	local v_u_7 = Vector3.new
	local v_u_8 = v_u_7().lerp
	local v_u_9 = nil
	local v10 = {}
	local function v16(p11)
		-- upvalues: (copy) v_u_7, (copy) v_u_8
		return {
			p11.X,
			p11.Y,
			p11.Z,
			["ToVector3"] = function(p12)
				-- upvalues: (ref) v_u_7
				return v_u_7(p12[1], p12[2], p12[3])
			end,
			["lerp"] = function(p13, p14, p15)
				-- upvalues: (ref) v_u_8
				return v_u_8(p13:ToVector3(), p14:ToVector3(), p15)
			end
		}
	end
	local v_u_17, v_u_18, v_u_19
	if v4 or v5 then
		v_u_17 = v10
		v_u_18 = 0
		v_u_19 = nil
	else
		for v20 = 1, #v_u_2 - 1 do
			local v21 = v16(v_u_2[v20])
			local v22 = { v21, v16(v_u_2[v20 + 1]), (v16(v21)) }
			v10[#v10 + 1] = v22
		end
		v_u_17 = v10
		for v23 = #v10, 2, -1 do
			local v24 = {}
			for v25 = 1, v23 - 1 do
				local v26 = v10[v25]
				local v27 = v10[v25 + 1]
				local v28 = { v26[3], v27[3], (v16(v26[3])) }
				v24[v25] = v28
				v_u_17[#v_u_17 + 1] = v28
			end
			v10 = v24
		end
		v_u_19 = v10[1]
		v_u_18 = #v_u_17
	end
	if v4 then
		local v_u_29 = v_u_2[1]
		local v_u_30 = v_u_2[2]
		local v_u_31 = v_u_2[3]
		function v6.Get(_, p32, p33)
			-- upvalues: (copy) v_u_29, (copy) v_u_30, (copy) v_u_31
			if p33 then
				p32 = p32 < 0 and 0 or (p32 > 1 and 1 or p32)
			end
			return (1 - p32) * (1 - p32) * v_u_29 + 2 * (1 - p32) * p32 * v_u_30 + p32 * p32 * v_u_31
		end
	elseif v5 then
		local v_u_34 = v_u_2[1]
		local v_u_35 = v_u_2[2]
		local v_u_36 = v_u_2[3]
		local v_u_37 = v_u_2[4]
		function v6.Get(_, p38, p39)
			-- upvalues: (copy) v_u_34, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37
			if p39 then
				p38 = p38 < 0 and 0 or (p38 > 1 and 1 or p38)
			end
			return (1 - p38) * (1 - p38) * (1 - p38) * v_u_34 + 3 * (1 - p38) * (1 - p38) * p38 * v_u_35 + 3 * (1 - p38) * p38 * p38 * v_u_36 + p38 * p38 * p38 * v_u_37
		end
	else
		function v6.Get(_, p40, p41)
			-- upvalues: (ref) v_u_18, (copy) v_u_17, (ref) v_u_19
			if p41 then
				p40 = p40 < 0 and 0 or (p40 > 1 and 1 or p40)
			end
			for v42 = 1, v_u_18 do
				local v43 = v_u_17[v42]
				local v44 = v43[1]:lerp(v43[2], p40)
				local v45 = v43[3]
				local v46 = v44.X
				local v47 = v44.Y
				local v48 = v44.Z
				v45[1] = v46
				v45[2] = v47
				v45[3] = v48
			end
			return v_u_19[3]:ToVector3()
		end
	end
	function v6.GetLength(p49, p50)
		-- upvalues: (ref) v_u_9
		if not v_u_9 then
			local v51 = p49:GetPath(p50 or 0.1)
			local v52 = 0
			for v53 = 2, #v51 do
				v52 = v52 + (v51[v53 - 1] - v51[v53]).Magnitude
			end
			v_u_9 = v52
		end
		return v_u_9
	end
	function v6.GetPath(p54, p55)
		local v56 = type(p55) == "number"
		assert(v56, "Must provide a step increment")
		local v57
		if p55 > 0 then
			v57 = p55 < 1
		else
			v57 = false
		end
		assert(v57, "Step out of domain; should be between 0 and 1 (exclusive)")
		local v58 = {}
		local v59 = 0
		for v60 = 0, 1, p55 do
			v58[#v58 + 1] = p54:Get(v60)
			v59 = v60
		end
		if v59 < 1 then
			local v61 = 1 - v59 < p55 * 0.5
			v58[#v58 + (v61 and 0 or 1)] = p54:Get(1)
		end
		return v58
	end
	function v6.GetPathByNumberSegments(p62, p63)
		local v64 = type(p63) == "number"
		assert(v64, "Must provide number of segments")
		local v65 = p63 > 0
		assert(v65, "Number of segments must be greater than 0")
		return p62:GetPath(1 / p63)
	end
	function v6.GetPathBySegmentLength(p66, p67)
		local v68 = type(p67) == "number"
		assert(v68, "Must provide a segment length")
		local v69 = p67 > 0
		assert(v69, "Segment length must be greater than 0")
		local v70 = p66:GetLength() / p67 + 0.5
		return p66:GetPathByNumberSegments((math.floor(v70)))
	end
	function v6.GetPoints(_)
		-- upvalues: (copy) v_u_2
		return v_u_2
	end
	local v71 = v_u_1
	return setmetatable(v6, v71)
end
return v_u_1