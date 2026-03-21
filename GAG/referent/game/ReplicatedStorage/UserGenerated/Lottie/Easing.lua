require(script.Parent.Types)
local function v_u_20(p1, p2, p3, p4, p5)
	if p5 <= 0 then
		return 0
	end
	if p5 >= 1 then
		return 1
	end
	if p1 == p2 and p3 == p4 then
		return p5
	end
	local v6 = p1 * 3
	local v7 = (p3 - p1) * 3 - v6
	local v8 = 1 - v6 - v7
	local v9 = p2 * 3
	local v10 = (p4 - p2) * 3 - v9
	local v11 = 1 - v9 - v10
	local v12 = p5
	for _ = 1, 8 do
		local v13 = ((v8 * p5 + v7) * p5 + v6) * p5 - v12
		if math.abs(v13) < 1e-7 then
			return ((v11 * p5 + v10) * p5 + v9) * p5
		end
		local v14 = (v8 * 3 * p5 + v7 * 2) * p5 + v6
		if math.abs(v14) < 1e-7 then
			break
		end
		p5 = p5 - v13 / v14
	end
	local v15 = v12
	local v16 = 0
	local v17 = 1
	for _ = 1, 16 do
		local v18 = ((v8 * v12 + v7) * v12 + v6) * v12 - v15
		if math.abs(v18) < 1e-7 then
			break
		end
		if v18 > 0 then
			v17 = v12
			v12 = v16
		end
		local v19 = (v12 + v17) * 0.5
		v16 = v12
		v12 = v19
	end
	return ((v11 * v12 + v10) * v12 + v9) * v12
end
local function v_u_26(p21, p22, p23)
	local v24 = table.create(#p21)
	for v25 = 1, #p21 do
		v24[v25] = p21[v25] + ((p22[v25] or p21[v25]) - p21[v25]) * p23
	end
	return v24
end
local function v_u_40(p27, p28, p29)
	local v30 = table.create(#p27.v)
	local v31 = table.create(#p27.i)
	local v32 = table.create(#p27.o)
	for v33 = 1, #p27.v do
		local v34 = p27.v[v33]
		local v35 = p28.v[v33]
		local v36 = p27.i[v33]
		local v37 = p28.i[v33]
		local v38 = p27.o[v33]
		local v39 = p28.o[v33]
		v30[v33] = { v34[1] + (v35[1] - v34[1]) * p29, v34[2] + (v35[2] - v34[2]) * p29 }
		v31[v33] = { v36[1] + (v37[1] - v36[1]) * p29, v36[2] + (v37[2] - v36[2]) * p29 }
		v32[v33] = { v38[1] + (v39[1] - v38[1]) * p29, v38[2] + (v39[2] - v38[2]) * p29 }
	end
	return {
		["v"] = v30,
		["i"] = v31,
		["o"] = v32,
		["c"] = p27.c
	}
end
local function v_u_47(p41, p42)
	local v43 = #p41
	if v43 == 0 then
		return nil, nil, 0
	end
	if v43 == 1 then
		return p41[1], nil, 0
	end
	local v44 = p41[1]
	if p42 <= v44.t then
		return v44, nil, 0
	end
	for v45 = 2, v43 do
		local v46 = p41[v45]
		if p42 < v46.t then
			return p41[v45 - 1], v46, v45 - 1
		end
	end
	return p41[v43], nil, v43
end
local function v_u_83(p48, p49)
	-- upvalues: (copy) v_u_47, (copy) v_u_20, (copy) v_u_26, (copy) v_u_40
	local v50 = p48.a
	local v51 = p48.k
	if v50 == nil or v50 == 0 then
		if type(v51) == "number" then
			return v51
		end
		if type(v51) ~= "table" then
			return nil
		end
		if #v51 > 0 then
			local v52 = v51[1]
			if type(v52) == "table" then
				return v51[1]
			end
		end
		return v51
	else
		local v53, v54, _ = v_u_47(v51, p49)
		if v53 == nil then
			return nil
		elseif v54 == nil then
			local v55 = v53.s
			if v55 == nil or #v55 == 0 then
				v55 = nil
			else
				local v56 = v55[1]
				if type(v56) == "table" then
					v55 = v55[1]
				end
			end
			if v55 == nil then
				local v57 = v53.e
				if v57 == nil then
					return nil
				elseif #v57 == 0 then
					return nil
				else
					local v58 = v57[1]
					if type(v58) == "table" then
						return v57[1]
					else
						return v57
					end
				end
			else
				return v55
			end
		elseif v53.h == 1 then
			local v59 = v53.s
			if v59 == nil then
				return nil
			elseif #v59 == 0 then
				return nil
			else
				local v60 = v59[1]
				if type(v60) == "table" then
					return v59[1]
				else
					return v59
				end
			end
		else
			local v61 = v53.t
			local v62 = v54.t - v61
			if v62 <= 0 then
				local v63 = v53.s
				if v63 == nil then
					return nil
				elseif #v63 == 0 then
					return nil
				else
					local v64 = v63[1]
					if type(v64) == "table" then
						return v63[1]
					else
						return v63
					end
				end
			else
				local v65 = (p49 - v61) / v62
				local v66 = math.clamp(v65, 0, 1)
				local v67 = v53.s
				if v67 == nil or #v67 == 0 then
					v67 = nil
				else
					local v68 = v67[1]
					if type(v68) == "table" then
						v67 = v67[1]
					end
				end
				local v69 = v54.s
				if v69 == nil or #v69 == 0 then
					v69 = nil
				else
					local v70 = v69[1]
					if type(v70) == "table" then
						v69 = v69[1]
					end
				end
				if not v69 then
					v69 = v53.e
					if v69 == nil or #v69 == 0 then
						v69 = nil
					else
						local v71 = v69[1]
						if type(v71) == "table" then
							v69 = v69[1]
						end
					end
				end
				if v67 == nil or v69 == nil then
					return v67 or v69
				end
				local v72 = v53.o
				local v73 = v53.i
				if v72 and v73 then
					local v74 = v_u_20
					local v75 = v72.x
					local v76 = type(v75) ~= "number" and (v75[1] or 0) or v75
					local v77 = v72.y
					local v78 = type(v77) ~= "number" and (v77[1] or 0) or v77
					local v79 = v73.x
					local v80 = type(v79) ~= "number" and (v79[1] or 0) or v79
					local v81 = v73.y
					v66 = v74(v76, v78, v80, type(v81) ~= "number" and (v81[1] or 0) or v81, v66)
				end
				if type(v67) == "number" then
					return v67 + (v69 - v67) * v66
				end
				if type(v67) ~= "table" then
					return v67
				end
				if #v67 > 0 then
					local v82 = v67[1]
					if type(v82) == "number" then
						return v_u_26(v67, v69, v66)
					end
				end
				return v_u_40(v67, v69, v66)
			end
		end
	end
end
return table.freeze({
	["SolveCubicBezier"] = v_u_20,
	["Evaluate"] = v_u_83,
	["EvaluateScalar"] = function(p84, p85)
		-- upvalues: (copy) v_u_83
		if p84 == nil then
			return p85
		else
			local v86 = v_u_83(p84, 0)
			if v86 == nil then
				return p85
			elseif type(v86) == "number" then
				return v86
			elseif type(v86) == "table" then
				return v86[1] or p85
			else
				return p85
			end
		end
	end,
	["EvaluateScalarAtFrame"] = function(p87, p88, p89)
		-- upvalues: (copy) v_u_83
		if p87 == nil then
			return p89
		else
			local v90 = v_u_83(p87, p88)
			if v90 == nil then
				return p89
			elseif type(v90) == "number" then
				return v90
			elseif type(v90) == "table" then
				return v90[1] or p89
			else
				return p89
			end
		end
	end,
	["EvaluateVector"] = function(p91, p92, p93)
		-- upvalues: (copy) v_u_83
		if p91 == nil then
			return p93
		else
			local v94 = v_u_83(p91, p92)
			if v94 == nil then
				return p93
			elseif type(v94) == "table" then
				return v94
			else
				return type(v94) == "number" and { v94 } or p93
			end
		end
	end,
	["EvaluateColor"] = function(p95, p96)
		-- upvalues: (copy) v_u_83
		if p95 == nil then
			return Color3.new(1, 1, 1)
		else
			local v97 = v_u_83(p95, p96)
			if v97 == nil then
				return Color3.new(1, 1, 1)
			elseif type(v97) == "table" then
				return Color3.new(v97[1] or 1, v97[2] or 1, v97[3] or 1)
			else
				return Color3.new(1, 1, 1)
			end
		end
	end,
	["EvaluateBezierShape"] = function(p98, p99)
		-- upvalues: (copy) v_u_83
		if p98 == nil then
			return nil
		end
		local v100 = v_u_83(p98, p99)
		if v100 == nil then
			return nil
		end
		if type(v100) == "table" and #v100 > 0 then
			local v101 = v100[1]
			if type(v101) ~= "number" then
				return v100
			end
		end
		return nil
	end,
	["LerpArray"] = v_u_26
})