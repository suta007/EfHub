local v_u_1 = {
	[36] = true,
	[95] = true
}
local v_u_2 = {
	[36] = true,
	[95] = true
}
local v_u_3 = {
	[0] = -12336,
	[1] = -12592,
	[2] = -12848,
	[3] = -13104,
	[4] = -13360,
	[5] = -13616,
	[6] = -13872,
	[7] = -14128,
	[8] = 25180,
	[9] = 29788,
	[10] = 28252,
	[11] = -25136,
	[12] = 26204,
	[13] = 29276,
	[14] = -25904,
	[15] = -26160,
	[16] = -12337,
	[17] = -12593,
	[18] = -12849,
	[19] = -13105,
	[20] = -13361,
	[21] = -13617,
	[22] = -13873,
	[23] = -14129,
	[24] = -14385,
	[25] = -14641,
	[26] = -24881,
	[27] = -25137,
	[28] = -25393,
	[29] = -25649,
	[30] = -25905,
	[31] = -26161
}
for v4 = 65, 90 do
	v_u_1[v4] = true
	v_u_2[v4] = true
end
for v5 = 97, 122 do
	v_u_1[v5] = true
	v_u_2[v5] = true
end
v_u_2[48] = true
v_u_2[49] = true
v_u_2[50] = true
v_u_2[51] = true
v_u_2[52] = true
v_u_2[53] = true
v_u_2[54] = true
v_u_2[55] = true
v_u_2[56] = true
v_u_2[57] = true
local function v7(p6)
	return {
		["Buf"] = p6,
		["Pos"] = 0,
		["Cap"] = buffer.len(p6),
		["Indent"] = 0,
		["Pretty"] = false,
		["Encoders"] = {},
		["Null"] = nil,
		["QuoteChar"] = 34,
		["UnquoteIdent"] = false
	}
end
local function v_u_9(p8)
	return buffer.readstring(p8.Buf, 0, p8.Pos)
end
local function v_u_18(p10, p11)
	local v12 = p10.Pos
	local v13 = v12 + p11
	if p10.Cap < v13 then
		local v14 = math.log(v13, 2)
		local v15 = 2 ^ math.ceil(v14)
		local v16 = math.max(v13, v15)
		local v17 = buffer.create(v16)
		buffer.copy(v17, 0, p10.Buf, 0, v12)
		p10.Buf = v17
		p10.Cap = v16
	end
	p10.Pos = v13
	return v12
end
local function v_u_25(p19)
	-- upvalues: (copy) v_u_18
	local v20 = p19.Indent * 2
	local v21 = v_u_18(p19, v20)
	local v22 = p19.Buf
	for v23 = 0, v20 - 1 do
		local v24 = v21 + v23 * 2
		buffer.writeu16(v22, v24, 8224)
	end
end
local function v_u_44(p26, p27)
	-- upvalues: (copy) v_u_18
	if p27 == p27 then
		if p27 == (1 / 0) then
			local v28 = v_u_18(p26, 8)
			local v29 = p26.Buf
			buffer.writeu32(v29, v28, 1768320585)
			local v30 = v28 + 4
			buffer.writeu32(v29, v30, 2037672302)
			return
		elseif p27 == (-1 / 0) then
			local v31 = v_u_18(p26, 9)
			local v32 = p26.Buf
			buffer.writeu8(v32, v31, 45)
			local v33 = v31 + 1
			buffer.writeu32(v32, v33, 1768320585)
			local v34 = v31 + 5
			buffer.writeu32(v32, v34, 2037672302)
		else
			local v35 = tostring(p27)
			local v36 = string.find(v35, "e%+")
			if v36 then
				local v37 = string.sub(v35, 1, v36)
				local v38 = v36 + 2
				v35 = v37 .. string.sub(v35, v38)
			end
			local v39 = string.len(v35)
			local v40 = v_u_18(p26, v39)
			buffer.writestring(p26.Buf, v40, v35, v39)
		end
	else
		local v41 = v_u_18(p26, 3)
		local v42 = p26.Buf
		buffer.writeu16(v42, v41, 24910)
		local v43 = v41 + 2
		buffer.writeu8(v42, v43, 78)
		return
	end
end
local function v_u_60(p45, p46, p47)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_18, (copy) v_u_3
	if p47 then
		local v48 = string.len(p46)
		if v48 ~= 0 and v_u_1[string.byte(p46, 1)] then
			local v49 = v_u_2
			for v50 = 2, v48 do
				if not v49[string.byte(p46, v50)] then
					v51 = false
					goto l5
				end
			end
			v51 = true
			goto l5
		end
		local v51 = false
		::l5::
		if not v51 then
			p47 = false
		end
	end
	local v52 = string.len(p46)
	local v53 = v_u_18(p45, v52 * 6 + 2)
	local v54 = p45.Buf
	local v55 = p45.QuoteChar
	if not p47 then
		buffer.writeu8(v54, v53, v55)
		v53 = v53 + 1
	end
	for v56 = 1, v52 do
		local v57 = string.byte(p46, v56)
		if v57 > 31 then
			if v57 == v55 or v57 == 92 then
				local v58 = bit32.lshift(v57, 8) + 92
				buffer.writeu16(v54, v53, v58)
				v53 = v53 + 2
			else
				buffer.writeu8(v54, v53, v57)
				v53 = v53 + 1
			end
		else
			local v59 = v_u_3[v57]
			if v59 < 0 then
				v59 = -v59
				buffer.writeu32(v54, v53, 808482140)
				v53 = v53 + 4
			end
			buffer.writeu16(v54, v53, v59)
			v53 = v53 + 2
		end
	end
	if not p47 then
		buffer.writeu8(v54, v53, v55)
		v53 = v53 + 1
	end
	p45.Pos = v53
end
local function v_u_77(p61, p62)
	-- upvalues: (copy) v_u_18, (copy) v_u_25
	local v63 = p61.Pretty
	local v64 = v_u_18(p61, 1)
	local v65 = p61.Buf
	buffer.writeu8(v65, v64, 91)
	if v63 then
		p61.Indent = p61.Indent + 1
	end
	for v66, v72 in ipairs(p62) do
		if v66 > 1 then
			local v68 = v_u_18(p61, 1)
			local v69 = p61.Buf
			buffer.writeu8(v69, v68, 44)
		end
		if v63 then
			local v70 = v_u_18(p61, 1)
			local v71 = p61.Buf
			buffer.writeu8(v71, v70, 10)
			v_u_25(p61)
		end
		if v72 == p61.Null then
			local v72 = nil
		end
		p61.Encoders[typeof(v72)](p61, v72)
	end
	if v63 then
		p61.Indent = p61.Indent + -1
		if #p62 > 0 then
			local v73 = v_u_18(p61, 1)
			local v74 = p61.Buf
			buffer.writeu8(v74, v73, 10)
			v_u_25(p61)
		end
	end
	local v75 = v_u_18(p61, 1)
	local v76 = p61.Buf
	buffer.writeu8(v76, v75, 93)
end
local function v_u_102(p78, p79)
	-- upvalues: (copy) v_u_18, (copy) v_u_25, (copy) v_u_60
	local v80 = {}
	for v81, _ in pairs(p79) do
		local v82 = type(v81) == "string"
		assert(v82)
		table.insert(v80, v81)
	end
	table.sort(v80)
	local v83 = p78.Pretty
	local v84 = p78.UnquoteIdent
	local v85 = v_u_18(p78, 1)
	local v86 = p78.Buf
	buffer.writeu8(v86, v85, 123)
	if v83 then
		p78.Indent = p78.Indent + 1
	end
	for v87, v88 in ipairs(v80) do
		if v87 > 1 then
			local v89 = v_u_18(p78, 1)
			local v90 = p78.Buf
			buffer.writeu8(v90, v89, 44)
		end
		if v83 then
			local v91 = v_u_18(p78, 1)
			local v92 = p78.Buf
			buffer.writeu8(v92, v91, 10)
			v_u_25(p78)
		end
		v_u_60(p78, v88, v84)
		if v83 then
			local v93 = v_u_18(p78, 2)
			local v94 = p78.Buf
			buffer.writeu16(v94, v93, 8250)
		else
			local v95 = v_u_18(p78, 1)
			local v96 = p78.Buf
			buffer.writeu8(v96, v95, 58)
		end
		local v97 = p79[v88]
		if v97 == p78.Null then
			v97 = nil
		end
		p78.Encoders[typeof(v97)](p78, v97)
	end
	if v83 then
		p78.Indent = p78.Indent + -1
		if #v80 > 0 then
			local v98 = v_u_18(p78, 1)
			local v99 = p78.Buf
			buffer.writeu8(v99, v98, 10)
			v_u_25(p78)
		end
	end
	local v100 = v_u_18(p78, 1)
	local v101 = p78.Buf
	buffer.writeu8(v101, v100, 125)
end
local v126 = {
	["nil"] = function(p103, _)
		-- upvalues: (copy) v_u_18
		local v104 = v_u_18(p103, 4)
		local v105 = p103.Buf
		buffer.writeu32(v105, v104, 1819047278)
	end,
	["boolean"] = function(p106, p107)
		-- upvalues: (copy) v_u_18
		if p107 then
			local v108 = v_u_18(p106, 4)
			local v109 = p106.Buf
			buffer.writeu32(v109, v108, 1702195828)
		else
			local v110 = v_u_18(p106, 5)
			local v111 = p106.Buf
			buffer.writeu32(v111, v110, 1936482662)
			local v112 = v110 + 4
			buffer.writeu8(v111, v112, 101)
		end
	end,
	["number"] = v_u_44,
	["string"] = v_u_60,
	["buffer"] = function(p113, p114)
		-- upvalues: (copy) v_u_18, (copy) v_u_3
		local v115 = buffer.len(p114)
		local v116 = v_u_18(p113, 2 + v115 * 6)
		local v117 = p113.Buf
		local v118 = p113.QuoteChar
		buffer.writeu8(v117, v116, v118)
		local v119 = v116 + 1
		for v120 = 0, v115 - 1 do
			local v121 = buffer.readu8(p114, v120)
			if v121 > 31 then
				if v121 == v118 or v121 == 92 then
					local v122 = bit32.lshift(v121, 8) + 92
					buffer.writeu16(v117, v119, v122)
					v119 = v119 + 2
				else
					buffer.writeu8(v117, v119, v121)
					v119 = v119 + 1
				end
			else
				local v123 = v_u_3[v121]
				if v123 < 0 then
					v123 = -v123
					buffer.writeu32(v117, v119, 808482140)
					v119 = v119 + 4
				end
				buffer.writeu16(v117, v119, v123)
				v119 = v119 + 2
			end
		end
		buffer.writeu8(v117, v119, v118)
		p113.Pos = v119 + 1
	end,
	["table"] = function(p124, p125)
		-- upvalues: (copy) v_u_77, (copy) v_u_102
		if #p125 > 0 or next(p125) == nil then
			v_u_77(p124, p125)
		else
			v_u_102(p124, p125)
		end
	end
}
local v127 = table.clone(v126)
function v127.Vector2(p128, p129)
	-- upvalues: (copy) v_u_77
	v_u_77(p128, { p129.X, p129.Y })
end
function v127.Vector3(p130, p131)
	-- upvalues: (copy) v_u_77
	v_u_77(p130, { p131.X, p131.Y, p131.Z })
end
function v127.Vector2int16(p132, p133)
	-- upvalues: (copy) v_u_77
	v_u_77(p132, { p133.X, p133.Y })
end
function v127.Vector3int16(p134, p135)
	-- upvalues: (copy) v_u_77
	v_u_77(p134, { p135.X, p135.Y, p135.Z })
end
function v127.Region3(p136, p137)
	-- upvalues: (copy) v_u_77
	local v138 = p137.CFrame * (p137.Size * -0.5)
	local v139 = p137.CFrame * (p137.Size * 0.5)
	v_u_77(p136, {
		v138.X,
		v138.Y,
		v138.Z,
		v139.X,
		v139.Y,
		v139.Z
	})
end
function v127.Region3int16(p140, p141)
	-- upvalues: (copy) v_u_77
	v_u_77(p140, {
		p141.Min.X,
		p141.Min.Y,
		p141.Min.Z,
		p141.Max.X,
		p141.Max.Y,
		p141.Max.Z
	})
end
function v127.UDim(p142, p143)
	-- upvalues: (copy) v_u_77
	v_u_77(p142, { p143.Scale, p143.Offset })
end
function v127.UDim2(p144, p145)
	-- upvalues: (copy) v_u_77
	v_u_77(p144, {
		p145.X.Scale,
		p145.X.Offset,
		p145.Y.Scale,
		p145.Y.Offset
	})
end
function v127.CFrame(p146, p147)
	-- upvalues: (copy) v_u_77
	v_u_77(p146, { p147:GetComponents() })
end
function v127.Color3(p148, p149)
	-- upvalues: (copy) v_u_77
	local v150 = v_u_77
	local v151 = {}
	local v152 = p149.R * 255
	local v153 = math.round(v152)
	local v154 = p149.G * 255
	local v155 = math.round(v154)
	local v156 = p149.B * 255
	__set_list(v151, 1, {v153, v155, (math.round(v156))})
	v150(p148, v151)
end
function v127.NumberRange(p157, p158)
	-- upvalues: (copy) v_u_77
	v_u_77(p157, { p158.Min, p158.Max })
end
function v127.Rect(p159, p160)
	-- upvalues: (copy) v_u_77
	v_u_77(p159, {
		p160.Min.X,
		p160.Min.Y,
		p160.Max.X,
		p160.Max.Y
	})
end
function v127.EnumItem(p161, p162)
	-- upvalues: (copy) v_u_44
	v_u_44(p161, p162.Value)
end
local v163 = buffer.create(4096)
local v_u_164 = v7(v163)
v_u_164.Encoders = v126
local v_u_165 = v7(v163)
v_u_165.Encoders = v126
v_u_165.Pretty = true
local v_u_166 = v7(v163)
v_u_166.Encoders = v127
local v_u_167 = v7(v163)
v_u_167.Encoders = v127
v_u_167.Pretty = true
local v_u_168 = v7(v163)
v_u_168.Encoders = v126
v_u_168.UnquoteIdent = true
v_u_168.QuoteChar = 39
local v_u_169 = v7(v163)
v_u_169.Encoders = v126
v_u_169.Pretty = true
v_u_169.UnquoteIdent = true
v_u_169.QuoteChar = 39
return table.freeze({
	["Compact"] = function(p170, p171)
		-- upvalues: (copy) v_u_164, (copy) v_u_9
		local v172 = v_u_164
		v172.Pos = 0
		v172.Null = p171
		if p170 == v172.Null then
			p170 = nil
		end
		v172.Encoders[typeof(p170)](v172, p170)
		return v_u_9(v172)
	end,
	["Pretty"] = function(p173, p174)
		-- upvalues: (copy) v_u_165, (copy) v_u_9
		local v175 = v_u_165
		v175.Pos = 0
		v175.Indent = 0
		v175.Null = p174
		if p173 == v175.Null then
			p173 = nil
		end
		v175.Encoders[typeof(p173)](v175, p173)
		return v_u_9(v175)
	end,
	["CompactExt"] = function(p176, p177)
		-- upvalues: (copy) v_u_166, (copy) v_u_9
		local v178 = v_u_166
		v178.Pos = 0
		v178.Null = p177
		if p176 == v178.Null then
			p176 = nil
		end
		v178.Encoders[typeof(p176)](v178, p176)
		return v_u_9(v178)
	end,
	["PrettyExt"] = function(p179, p180)
		-- upvalues: (copy) v_u_167, (copy) v_u_9
		local v181 = v_u_167
		v181.Pos = 0
		v181.Indent = 0
		v181.Null = p180
		if p179 == v181.Null then
			p179 = nil
		end
		v181.Encoders[typeof(p179)](v181, p179)
		return v_u_9(v181)
	end,
	["Compact5"] = function(p182, p183)
		-- upvalues: (copy) v_u_168, (copy) v_u_9
		local v184 = v_u_168
		v184.Pos = 0
		v184.Null = p183
		if p182 == v184.Null then
			p182 = nil
		end
		v184.Encoders[typeof(p182)](v184, p182)
		return v_u_9(v184)
	end,
	["Pretty5"] = function(p185, p186)
		-- upvalues: (copy) v_u_169, (copy) v_u_9
		local v187 = v_u_169
		v187.Pos = 0
		v187.Indent = 0
		v187.Null = p186
		if p185 == v187.Null then
			p185 = nil
		end
		v187.Encoders[typeof(p185)](v187, p185)
		return v_u_9(v187)
	end
})