local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(...)
	-- upvalues: (copy) v_u_1
	local v_u_2 = { ... }
	local v3 = #v_u_2 >= 3
	assert(v3, "Must have at least 3 points")
	local v4 = #v_u_2 == 3
	local v5 = #v_u_2 == 4
	local v6 = v_u_1
	local v7 = setmetatable({}, v6)
	local v_u_8 = Vector3.new
	local v_u_9 = v_u_8().lerp
	local v_u_10 = nil
	local v11 = {}
	local function v17(p12)
		-- upvalues: (copy) v_u_8, (copy) v_u_9
		return {
			p12.X,
			p12.Y,
			p12.Z,
			["ToVector3"] = function(p13)
				-- upvalues: (ref) v_u_8
				return v_u_8(p13[1], p13[2], p13[3])
			end,
			["lerp"] = function(p14, p15, p16)
				-- upvalues: (ref) v_u_9
				return v_u_9(p14:ToVector3(), p15:ToVector3(), p16)
			end
		}
	end
	local v_u_18, v_u_19, v_u_20
	if v4 or v5 then
		v_u_18 = v11
		v_u_19 = 0
		v_u_20 = nil
	else
		for v21 = 1, #v_u_2 - 1 do
			local v22 = v17(v_u_2[v21])
			local v23 = { v22, v17(v_u_2[v21 + 1]), (v17(v22)) }
			v11[#v11 + 1] = v23
		end
		v_u_18 = v11
		for v24 = #v11, 2, -1 do
			local v25 = {}
			for v26 = 1, v24 - 1 do
				local v27 = v11[v26]
				local v28 = v11[v26 + 1]
				local v29 = { v27[3], v28[3], (v17(v27[3])) }
				v25[v26] = v29
				v_u_18[#v_u_18 + 1] = v29
			end
			v11 = v25
		end
		v_u_20 = v11[1]
		v_u_19 = #v_u_18
	end
	if v4 then
		local v_u_30 = v_u_2[1]
		local v_u_31 = v_u_2[2]
		local v_u_32 = v_u_2[3]
		function v7.Get(_, p33, p34)
			-- upvalues: (copy) v_u_30, (copy) v_u_31, (copy) v_u_32
			if p34 then
				p33 = p33 < 0 and 0 or (p33 > 1 and 1 or p33)
			end
			return (1 - p33) * (1 - p33) * v_u_30 + 2 * (1 - p33) * p33 * v_u_31 + p33 * p33 * v_u_32
		end
	elseif v5 then
		local v_u_35 = v_u_2[1]
		local v_u_36 = v_u_2[2]
		local v_u_37 = v_u_2[3]
		local v_u_38 = v_u_2[4]
		function v7.Get(_, p39, p40)
			-- upvalues: (copy) v_u_35, (copy) v_u_36, (copy) v_u_37, (copy) v_u_38
			if p40 then
				p39 = p39 < 0 and 0 or (p39 > 1 and 1 or p39)
			end
			return (1 - p39) * (1 - p39) * (1 - p39) * v_u_35 + 3 * (1 - p39) * (1 - p39) * p39 * v_u_36 + 3 * (1 - p39) * p39 * p39 * v_u_37 + p39 * p39 * p39 * v_u_38
		end
	else
		function v7.Get(_, p41, p42)
			-- upvalues: (ref) v_u_19, (copy) v_u_18, (ref) v_u_20
			if p42 then
				p41 = p41 < 0 and 0 or (p41 > 1 and 1 or p41)
			end
			for v43 = 1, v_u_19 do
				local v44 = v_u_18[v43]
				local v45 = v44[1]:lerp(v44[2], p41)
				local v46 = v44[3]
				local v47 = v45.X
				local v48 = v45.Y
				local v49 = v45.Z
				v46[1] = v47
				v46[2] = v48
				v46[3] = v49
			end
			return v_u_20[3]:ToVector3()
		end
	end
	function v7.GetLength(p50, p51)
		-- upvalues: (ref) v_u_10
		if not v_u_10 then
			local v52 = p50:GetPath(p51 or 0.1)
			local v53 = 0
			for v54 = 2, #v52 do
				v53 = v53 + (v52[v54 - 1] - v52[v54]).Magnitude
			end
			v_u_10 = v53
		end
		return v_u_10
	end
	function v7.GetPath(p55, p56)
		local v57 = type(p56) == "number"
		assert(v57, "Must provide a step increment")
		local v58
		if p56 > 0 then
			v58 = p56 < 1
		else
			v58 = false
		end
		assert(v58, "Step out of domain; should be between 0 and 1 (exclusive)")
		local v59 = {}
		local v60 = 0
		for v61 = 0, 1, p56 do
			v59[#v59 + 1] = p55:Get(v61)
			v60 = v61
		end
		if v60 < 1 then
			local v62 = 1 - v60 < p56 * 0.5
			v59[#v59 + (v62 and 0 or 1)] = p55:Get(1)
		end
		return v59
	end
	function v7.GetPathByNumberSegments(p63, p64)
		local v65 = type(p64) == "number"
		assert(v65, "Must provide number of segments")
		local v66 = p64 > 0
		assert(v66, "Number of segments must be greater than 0")
		return p63:GetPath(1 / p64)
	end
	function v7.GetPathBySegmentLength(p67, p68)
		local v69 = type(p68) == "number"
		assert(v69, "Must provide a segment length")
		local v70 = p68 > 0
		assert(v70, "Segment length must be greater than 0")
		local v71 = p67:GetLength() / p68 + 0.5
		return p67:GetPathByNumberSegments((math.floor(v71)))
	end
	function v7.GetPoints(_)
		-- upvalues: (copy) v_u_2
		return v_u_2
	end
	return v7
end
return v_u_1