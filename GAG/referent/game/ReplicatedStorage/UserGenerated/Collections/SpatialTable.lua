local v1 = {}
local v_u_2 = table.freeze({
	["__index"] = v1
})
function v1.Insert(p3, p4, p5)
	local v6 = typeof(p4) == "Vector3"
	assert(v6)
	local v7 = p3.Epsilon
	local v8 = p4.X // v7
	local v9 = p4.Y // v7
	local v10 = p4.Z // v7
	local v11 = (bit32.band(v8, 262143) * 262144 + bit32.band(v10, 262143)) * 131072 + bit32.band(v9, 131071)
	local v12 = {
		["Pos"] = p4,
		["Value"] = p5
	}
	local v13 = p3.Table
	if not v13[v11] then
		v13[v11] = {}
	end
	local v14 = v13[v11]
	table.insert(v14, v12)
end
function v1.Remove(p15, p16, p17)
	local v18 = typeof(p16) == "Vector3"
	assert(v18)
	local v19 = p15.Epsilon
	local v20 = p16.X // v19
	local v21 = p16.Y // v19
	local v22 = p16.Z // v19
	local v23 = (bit32.band(v20, 262143) * 262144 + bit32.band(v22, 262143)) * 131072 + bit32.band(v21, 131071)
	local v24 = p15.Table[v23]
	if v24 then
		for v25 = #v24, 1, -1 do
			if v24[v25].Value == p17 then
				table.remove(v24, v25)
			end
		end
		if #v24 == 0 then
			p15.Table[v23] = nil
		end
	end
end
function v1.Collect(p26, p27, p28)
	local v29 = typeof(p27) == "Vector3"
	assert(v29)
	local v30
	if p28 == nil then
		v30 = true
	elseif type(p28) == "number" and p28 > 0 then
		v30 = math.floor(p28) == p28
	else
		v30 = false
	end
	assert(v30)
	local v31 = p26.Epsilon
	local v32 = p27.X // v31
	local v33 = p27.Y // v31
	local v34 = p27.Z // v31
	local v35 = p26.Table
	local v36 = p28 or 1
	local v37 = 0
	local v38 = {}
	for v39 = -v36, v36 do
		for v40 = -v36, v36 do
			for v41 = -v36, v36 do
				local v42 = v32 + v39
				local v43 = v33 + v40
				local v44 = v34 + v41
				local v45 = v35[(bit32.band(v42, 262143) * 262144 + bit32.band(v44, 262143)) * 131072 + bit32.band(v43, 131071)]
				if v45 then
					for _, v46 in ipairs(v45) do
						v37 = v37 + 1
						v38[v37] = v46.Value
					end
				end
			end
		end
	end
	v38.n = v37
	return v38
end
function v1.Query(p47, p48, p49)
	local v50 = typeof(p48) == "Vector3"
	assert(v50)
	local v51
	if p49 == nil then
		v51 = true
	elseif type(p49) == "number" and p49 > 0 then
		v51 = math.floor(p49) == p49
	else
		v51 = false
	end
	assert(v51)
	local v52 = p47.Epsilon
	local v53 = p48.X // v52
	local v54 = p48.Y // v52
	local v55 = p48.Z // v52
	local v56 = p47.Table
	local v57 = p49 or 1
	local v58 = nil
	local v59 = nil
	for v60 = -v57, v57 do
		for v61 = -v57, v57 do
			for v62 = -v57, v57 do
				local v63 = v53 + v60
				local v64 = v54 + v61
				local v65 = v55 + v62
				local v66 = v56[(bit32.band(v63, 262143) * 262144 + bit32.band(v65, 262143)) * 131072 + bit32.band(v64, 131071)]
				if v66 then
					for _, v67 in ipairs(v66) do
						local v68 = (v67.Pos - p48).Magnitude
						if not v58 or v68 < v58 then
							v59 = v67.Value
							v58 = v68
						end
					end
				end
			end
		end
	end
	return v59
end
table.freeze(v1)
return table.freeze({
	["new"] = function(p69, _)
		-- upvalues: (copy) v_u_2
		local v70
		if p69 == nil then
			v70 = true
		elseif type(p69) == "number" then
			v70 = p69 > 0
		else
			v70 = false
		end
		assert(v70)
		local v71 = v_u_2
		return setmetatable({
			["Table"] = {},
			["Epsilon"] = p69 or 10
		}, v71)
	end
})