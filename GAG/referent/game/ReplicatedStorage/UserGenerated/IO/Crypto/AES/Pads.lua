local v_u_1 = buffer.copy
local v_u_2 = buffer.create
local v_u_3 = buffer.fill
local v_u_4 = buffer.len
local v_u_5 = buffer.readu8
local v_u_6 = buffer.writeu8
local v_u_7 = math.random
local v8 = {}
local function v10(p9)
	return p9
end
v8.None = table.freeze({
	["Pad"] = v10,
	["Unpad"] = v10,
	["Overwrite"] = false
})
local function v_u_20(p11, p12, p13)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3, (copy) v_u_6, (copy) v_u_2
	local v14 = v_u_4(p11)
	local v15 = v14 - v14 % p13
	if not p12 then
		local v16 = v15 + p13
		local v17 = v_u_2(v16)
		v_u_1(v17, 0, p11, 0, v14)
		v_u_6(v17, v16 - 1, p13 - v14 % p13)
		return v17
	end
	local v18 = v_u_4(p12) >= v14 + p13
	assert(v18, "Output buffer out of bounds")
	local v19 = p13 - v14 % p13
	v_u_1(p12, 0, p11, 0, v14)
	v_u_3(p12, v14, 0, v19 - 1)
	v_u_6(p12, v15 + p13 - 1, v19)
	return p12
end
local function v_u_28(p21, p22, p23)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_1, (copy) v_u_7, (copy) v_u_6
	local v24 = v_u_4(p21)
	local v25 = v24 - v24 % p23
	if p22 then
		local v26 = v_u_4(p22) >= v24 + p23
		assert(v26, "Output buffer out of bounds")
	else
		p22 = v_u_2(v25 + p23)
	end
	v_u_1(p22, 0, p21, 0, v24)
	for v27 = v24, v25 + p23 - 2 do
		v_u_6(p22, v27, (v_u_7(0, 255)))
	end
	v_u_6(p22, v25 + p23 - 1, p23 - v24 % p23)
	return p22
end
local function v_u_37(p29, p30, p31)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	local v32 = v_u_4(p29)
	local v33 = v_u_5(p29, v32 - 1)
	local v34 = v32 - v33
	local v35
	if v33 > 0 then
		v35 = v33 <= p31
	else
		v35 = false
	end
	assert(v35, "Got unexpected padding")
	if p30 then
		local v36 = v34 <= v_u_4(p30)
		assert(v36, "Output buffer out of bounds")
	else
		p30 = v_u_2(v34)
	end
	v_u_1(p30, 0, p29, 0, v34)
	return p30
end
local function v_u_45(p38, p39, p40)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v41 = v_u_4(p38)
	local v42 = v41 - v41 % p40
	if p39 then
		local v43 = v_u_4(p39) >= v41 + p40
		assert(v43, "Output buffer out of bounds")
	else
		p39 = v_u_2(v42 + p40)
	end
	local v44 = p40 - v41 % p40
	v_u_1(p39, 0, p38, 0, v41)
	v_u_3(p39, v41, v44, v44)
	return p39
end
local function v_u_55(p46, p47, p48)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	local v49 = v_u_4(p46)
	local v50 = v_u_5(p46, v49 - 1)
	local v51 = v49 - v50
	local v52
	if v50 > 0 then
		v52 = v50 <= p48
	else
		v52 = false
	end
	assert(v52, "Got unexpected padding")
	for v53 = v51, v49 - 2 do
		if v_u_5(p46, v53) ~= v50 then
			error("Got unexpected padding")
		end
	end
	if p47 then
		local v54 = v51 <= v_u_4(p47)
		assert(v54, "Output buffer out of bounds")
	else
		p47 = v_u_2(v51)
	end
	v_u_1(p47, 0, p46, 0, v51)
	return p47
end
local function v_u_61(p56, p57, p58)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_6
	local v59 = v_u_4(p56)
	if p57 then
		local v60 = v_u_4(p57) >= v59 + p58
		assert(v60, "Output buffer out of bounds")
		v_u_3(p57, v59 + 1, 0, p58 - v59 % p58 - 1)
	else
		p57 = v_u_2(v59 + p58 - v59 % p58)
	end
	v_u_1(p57, 0, p56, 0, v59)
	v_u_6(p57, v59, 128)
	return p57
end
local function v_u_70(p62, p63, p64)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	local v65 = v_u_4(p62) - 1
	for v66 = v65, v65 - p64, -1 do
		local v67 = v_u_5(p62, v66)
		if v67 == 128 then
			if p63 then
				local v68 = v66 <= v_u_4(p63)
				assert(v68, "Output buffer out of bounds")
			else
				p63 = v_u_2(v66)
			end
			v_u_1(p63, 0, p62, 0, v66)
			return p63
		end
		local v69 = v67 == 0
		assert(v69, "Got unexpected padding")
	end
	error("Got unexpected padding")
	return v_u_2(0)
end
local function v_u_76(p71, p72, p73)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
	local v74 = v_u_4(p71)
	if p72 then
		local v75 = v_u_4(p72) >= v74 + p73
		assert(v75, "Output buffer out of bounds")
		v_u_3(p72, v74, 0, p73 - v74 % p73)
	else
		p72 = v_u_2(v74 + p73 - v74 % p73)
	end
	v_u_1(p72, 0, p71, 0, v74)
	return p72
end
local function v_u_84(p77, p78, p79)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	local v80 = v_u_4(p77) - 1
	for v81 = v80, v80 - p79, -1 do
		if v_u_5(p77, v81) == 0 then
			local v82 = v81 + 1
			if p78 then
				local v83 = v82 <= v_u_4(p78)
				assert(v83, "Output buffer out of bounds")
			else
				p78 = v_u_2(v82)
			end
			v_u_1(p78, 0, p77, 0, v82)
			return p78
		end
	end
	v_u_1(p78, 0, p77, 0, v80 - p79 - 1)
	return p78
end
local v86 = {
	["__index"] = function(_, p85)
		-- upvalues: (copy) v_u_20, (copy) v_u_28, (copy) v_u_37, (copy) v_u_45, (copy) v_u_55, (copy) v_u_61, (copy) v_u_70, (copy) v_u_76, (copy) v_u_84
		return p85 == "AnsiX923" and {
			["Pad"] = v_u_20,
			["Unpad"] = v_u_20,
			["Overwrite"] = nil
		} or (p85 == "Iso10126" and {
			["Pad"] = v_u_28,
			["Unpad"] = v_u_37,
			["Overwrite"] = nil
		} or (p85 == "Pkcs7" and {
			["Pad"] = v_u_45,
			["Unpad"] = v_u_55,
			["Overwrite"] = nil
		} or (p85 == "Iso7816_4" and {
			["Pad"] = v_u_61,
			["Unpad"] = v_u_70,
			["Overwrite"] = nil
		} or (p85 == "Zero" and {
			["Pad"] = v_u_76,
			["Unpad"] = v_u_84,
			["Overwrite"] = nil
		} or nil))))
	end,
	["__newindex"] = function() end
}
setmetatable(v8, v86)
v8.AnsiX923 = {}
v8.Iso10126 = {}
v8.Pkcs7 = {}
v8.Iso7816_4 = {}
v8.Zero = {}
table.freeze(v8)
v86.__metatable = "This metatable is locked"
return v8