local v_u_1 = {}
local v_u_2 = require(script.Parent.ValueObjectUtils)
local v_u_3 = game:GetService("HttpService")
local v_u_4 = Random.new()
local function v_u_25(p5, p6)
	-- upvalues: (copy) v_u_25
	local v7 = type(p5) == "table"
	assert(v7, "First argument must be a table")
	local v8 = type(p6) == "table"
	assert(v8, "Second argument must be a table")
	local v9 = table.clone(p5)
	for v10, v11 in pairs(v9) do
		local v12 = p6[v10]
		if v12 == nil then
			v9[v10] = nil
		elseif type(v11) == type(v12) then
			if type(v11) == "table" then
				v9[v10] = v_u_25(v11, v12)
			end
		elseif type(v12) == "table" then
			local function v_u_17(p13)
				-- upvalues: (copy) v_u_17
				local v14 = table.clone(p13)
				for v15, v16 in v14 do
					if type(v16) == "table" then
						v14[v15] = v_u_17(v16)
					end
				end
				return v14
			end
			v9[v10] = v_u_17(v12)
		else
			v9[v10] = v12
		end
	end
	for v18, v19 in pairs(p6) do
		if v9[v18] == nil then
			if type(v19) == "table" then
				local function v_u_24(p20)
					-- upvalues: (copy) v_u_24
					local v21 = table.clone(p20)
					for v22, v23 in v21 do
						if type(v23) == "table" then
							v21[v22] = v_u_24(v23)
						end
					end
					return v21
				end
				v9[v18] = v_u_24(v19)
			else
				v9[v18] = v19
			end
		end
	end
	return v9
end
local function v_u_44(p26, p27)
	-- upvalues: (copy) v_u_44
	local v28 = type(p26) == "table"
	assert(v28, "First argument must be a table")
	local v29 = type(p27) == "table"
	assert(v29, "Second argument must be a table")
	local v30 = table.clone(p26)
	for v31, v32 in p27 do
		local v33 = p26[v31]
		if v33 == nil then
			if type(v32) == "table" then
				local function v_u_38(p34)
					-- upvalues: (copy) v_u_38
					local v35 = table.clone(p34)
					for v36, v37 in v35 do
						if type(v37) == "table" then
							v35[v36] = v_u_38(v37)
						end
					end
					return v35
				end
				v30[v31] = v_u_38(v32)
			else
				v30[v31] = v32
			end
		elseif type(v33) == "table" then
			if type(v32) == "table" then
				v30[v31] = v_u_44(v33, v32)
			else
				local function v_u_43(p39)
					-- upvalues: (copy) v_u_43
					local v40 = table.clone(p39)
					for v41, v42 in v40 do
						if type(v42) == "table" then
							v40[v41] = v_u_43(v42)
						end
					end
					return v40
				end
				v30[v31] = v_u_43(v33)
			end
		end
	end
	return v30
end
local function v_u_52(p45, p46)
	local v47 = type(p45) == "table"
	assert(v47, "First argument must be a table")
	local v48 = type(p46) == "function"
	assert(v48, "Second argument must be a function")
	local v49 = table.create(#p45)
	for v50, v51 in p45 do
		v49[v50] = p46(v51, v50, p45)
	end
	return v49
end
function v_u_1.Copy(p53, p54)
	if not p54 then
		return table.clone(p53)
	end
	local function v_u_59(p55)
		-- upvalues: (copy) v_u_59
		local v56 = table.clone(p55)
		for v57, v58 in v56 do
			if type(v58) == "table" then
				v56[v57] = v_u_59(v58)
			end
		end
		return v56
	end
	return v_u_59(p53)
end
v_u_1.Sync = v_u_25
v_u_1.Reconcile = v_u_44
function v_u_1.SwapRemove(p60, p61)
	local v62 = #p60
	p60[p61] = p60[v62]
	p60[v62] = nil
end
function v_u_1.SwapRemoveFirstValue(p63, p64)
	local v65 = table.find(p63, p64)
	if v65 then
		local v66 = #p63
		p63[v65] = p63[v66]
		p63[v66] = nil
	end
	return v65
end
v_u_1.Map = v_u_52
function v_u_1.Filter(p67, p68)
	local v69 = type(p67) == "table"
	assert(v69, "First argument must be a table")
	local v70 = type(p68) == "function"
	assert(v70, "Second argument must be a function")
	local v71 = table.create(#p67)
	if #p67 <= 0 then
		for v72, v73 in p67 do
			if p68(v73, v72, p67) then
				v71[v72] = v73
			end
		end
		return v71
	end
	local v74 = 0
	for v75, v76 in p67 do
		if p68(v76, v75, p67) then
			v74 = v74 + 1
			v71[v74] = v76
		end
	end
	return v71
end
function v_u_1.Reduce(p77, p78, p79)
	local v80 = type(p77) == "table"
	assert(v80, "First argument must be a table")
	local v81 = type(p78) == "function"
	assert(v81, "Second argument must be a function")
	if #p77 > 0 then
		local v82
		if p79 == nil then
			p79 = p77[1]
			v82 = 2
		else
			v82 = 1
		end
		for v83 = v82, #p77 do
			p79 = p78(p79, p77[v83], v83, p77)
		end
		return p79
	else
		local v84
		if p79 == nil then
			v84 = next(p77)
			p79 = v84
		else
			v84 = nil
		end
		for v85, v86 in next, p77, v84 do
			p79 = p78(p79, v86, v85, p77)
		end
		return p79
	end
end
function v_u_1.Assign(p87, ...)
	local v88 = table.clone(p87)
	for _, v89 in { ... } do
		for v90, v91 in v89 do
			v88[v90] = v91
		end
	end
	return v88
end
function v_u_1.Extend(p92, p93)
	local v94 = table.clone(p92)
	for _, v95 in p93 do
		table.insert(v94, v95)
	end
	return v94
end
function v_u_1.Reverse(p96)
	local v97 = #p96
	local v98 = table.create(v97)
	for v99 = 1, v97 do
		v98[v99] = p96[v97 - v99 + 1]
	end
	return v98
end
function v_u_1.Shuffle(p100, p101)
	-- upvalues: (copy) v_u_4
	local v102 = type(p100) == "table"
	assert(v102, "First argument must be a table")
	local v103 = table.clone(p100)
	if typeof(p101) ~= "Random" then
		p101 = v_u_4
	end
	for v104 = #p100, 2, -1 do
		local v105 = p101:NextInteger(1, v104)
		local v106 = v103[v105]
		local v107 = v103[v104]
		v103[v104] = v106
		v103[v105] = v107
	end
	return v103
end
function v_u_1.Sample(p108, p109, p110)
	-- upvalues: (copy) v_u_4
	local v111 = type(p108) == "table"
	assert(v111, "First argument must be a table")
	local v112 = type(p109) == "number"
	assert(v112, "Second argument must be a number")
	local v113 = table.clone(p108)
	local v114 = table.create(p109)
	if typeof(p110) ~= "Random" then
		p110 = v_u_4
	end
	local v115 = #p108
	local v116 = math.clamp(p109, 1, v115)
	for v117 = 1, v116 do
		local v118 = p110:NextInteger(v117, v115)
		local v119 = v113[v118]
		local v120 = v113[v117]
		v113[v117] = v119
		v113[v118] = v120
	end
	table.move(v113, 1, v116, 1, v114)
	return v114
end
function v_u_1.Flat(p121, p122)
	local v_u_123 = type(p122) ~= "number" and 1 or p122
	local v_u_124 = table.create(#p121)
	local function v_u_129(p125, p126)
		-- upvalues: (copy) v_u_123, (copy) v_u_129, (copy) v_u_124
		for _, v127 in p125 do
			if type(v127) == "table" and p126 < v_u_123 then
				v_u_129(v127, p126 + 1)
			else
				local v128 = v_u_124
				table.insert(v128, v127)
			end
		end
	end
	v_u_129(p121, 0)
	return v_u_124
end
function v_u_1.FlatMap(p130, p131)
	-- upvalues: (copy) v_u_52
	local v132 = v_u_52(p130, p131)
	local v_u_133 = table.create(#v132)
	local v_u_134 = 1
	local function v_u_139(p135, p136)
		-- upvalues: (copy) v_u_134, (copy) v_u_139, (copy) v_u_133
		for _, v137 in p135 do
			if type(v137) == "table" and p136 < v_u_134 then
				v_u_139(v137, p136 + 1)
			else
				local v138 = v_u_133
				table.insert(v138, v137)
			end
		end
	end
	v_u_139(v132, 0)
	return v_u_133
end
function v_u_1.Keys(p140)
	local v141 = table.create(#p140)
	for v142 in p140 do
		table.insert(v141, v142)
	end
	return v141
end
function v_u_1.Values(p143)
	local v144 = table.create(#p143)
	for _, v145 in p143 do
		table.insert(v144, v145)
	end
	return v144
end
function v_u_1.Find(p146, p147)
	for v148, v149 in p146 do
		if p147(v149, v148, p146) then
			return v149, v148
		end
	end
	return nil, nil
end
function v_u_1.Every(p150, p151)
	for v152, v153 in p150 do
		if not p151(v153, v152, p150) then
			return false
		end
	end
	return true
end
function v_u_1.Some(p154, p155)
	for v156, v157 in p154 do
		if p155(v157, v156, p154) then
			return true
		end
	end
	return false
end
function v_u_1.Truncate(p158, p159)
	local v160 = #p158
	local v161 = math.clamp(p159, 1, v160)
	if v161 == v160 then
		return table.clone(p158)
	else
		return table.move(p158, 1, v161, 1, table.create(v161))
	end
end
function v_u_1.Zip(...)
	local v162 = select("#", ...) > 0
	assert(v162, "Must supply at least 1 table")
	local function v170(p163, p164)
		local v165 = p164 + 1
		local v166 = {}
		for v167, v168 in p163 do
			local v169 = v168[v165]
			if v169 == nil then
				return nil, nil
			end
			v166[v167] = v169
		end
		return v165, v166
	end
	local function v177(p171, p172)
		local v173 = {}
		for v174, v175 in p171 do
			local v176 = next(v175, p172)
			if v176 == nil then
				return nil, nil
			end
			v173[v174] = v176
		end
		return p172, v173
	end
	local v178 = { ... }
	if #v178[1] > 0 then
		return v170, v178, 0
	else
		return v177, v178, nil
	end
end
function v_u_1.Lock(p179)
	local function v_u_183(p180)
		-- upvalues: (copy) v_u_183
		for v181, v182 in pairs(p180) do
			if type(v182) == "table" then
				p180[v181] = v_u_183(v182)
			end
		end
		return table.freeze(p180)
	end
	return v_u_183(p179)
end
function v_u_1.IsEmpty(p184)
	return next(p184) == nil
end
function v_u_1.EncodeJSON(p185)
	-- upvalues: (copy) v_u_3
	return v_u_3:JSONEncode(p185)
end
function v_u_1.DecodeJSON(p186)
	-- upvalues: (copy) v_u_3
	return v_u_3:JSONDecode(p186)
end
function v_u_1.ToFolder(p187)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v188 = Instance.new("Folder")
	for v189, v190 in pairs(p187) do
		local v191 = typeof(v190)
		if v191 == "table" then
			local v192 = v_u_1.ToFolder(v190)
			v192.Name = tostring(v189)
			v192.Parent = v188
		else
			local v193 = v_u_2.ConvertTypeToClass(v191)
			v193.Value = v190
			v193.Name = tostring(v189)
			v193.Parent = v188
		end
	end
	return v188
end
function v_u_1.ToTable(p194)
	-- upvalues: (copy) v_u_1
	local v195 = {}
	for _, v196 in p194:GetChildren() do
		if v196:IsA("Folder") then
			local v197 = v_u_1.ToTable(v196)
			v195[v196.Name] = v197
		end
	end
	return v195
end
function v_u_1.ToRawTable(p198)
	-- upvalues: (copy) v_u_1
	local v199 = {}
	for _, v200 in ipairs(p198:GetChildren()) do
		if v200:IsA("Folder") then
			local v201 = v_u_1.ToTable(v200)
			v199[v200.Name] = v201
		end
	end
	return v199
end
return v_u_1