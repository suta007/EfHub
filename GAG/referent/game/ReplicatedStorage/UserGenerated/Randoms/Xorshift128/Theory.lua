local function v_u_4(p1)
	local v2 = table.clone(p1)
	for v3 = 1, #v2 do
		v2[v3] = table.clone(v2[v3])
	end
	return v2
end
local function v_u_8(p5)
	local v6 = table.create(p5)
	for v7 = 1, p5 do
		v6[v7] = table.create(p5, 0)
	end
	return v6
end
local function v_u_12(p9)
	-- upvalues: (copy) v_u_8
	local v10 = v_u_8(p9)
	for v11 = 1, p9 do
		v10[v11][v11] = 1
	end
	return v10
end
local function v_u_27(p13, p14)
	local v15 = #p13
	local v16 = #p13[1]
	local v17 = #p14[1]
	local v18 = {}
	for v19 = 1, v15 do
		local v20 = table.create(v17, 0)
		for v21 = 1, v17 do
			local v22 = 0
			for v23 = 1, v16 do
				local v24 = p13[v19][v23]
				local v25 = p14[v23][v21]
				local v26 = bit32.band(v24, v25)
				v22 = bit32.bxor(v22, v26)
			end
			v20[v21] = v22
		end
		v18[v19] = v20
	end
	return v18
end
local function v_u_39(p28, p29)
	local v30 = #p28
	local v31 = #p28[1]
	local v32 = table.create(v30, 0)
	for v33 = 1, v30 do
		local v34 = 0
		for v35 = 1, v31 do
			local v36 = p28[v33][v35]
			local v37 = p29[v35]
			local v38 = bit32.band(v36, v37)
			v34 = bit32.bxor(v34, v38)
		end
		v32[v33] = v34
	end
	return v32
end
local function v_u_50(p40, p41)
	-- upvalues: (copy) v_u_8
	local v42 = #p40
	local v43 = #p40[1]
	local v44 = v_u_8(v42)
	for v45 = 1, v42 do
		for v46 = 1, v43 do
			local v47 = v44[v45]
			local v48 = p40[v45][v46]
			local v49 = p41[v45][v46]
			v47[v46] = bit32.bxor(v48, v49)
		end
	end
	return v44
end
local function v_u_71(p51)
	-- upvalues: (copy) v_u_4, (copy) v_u_8
	local v52 = #p51
	local v53 = v_u_4(p51)
	local v54 = v_u_8(v52)
	for v55 = 1, v52 do
		v54[v55][v55] = 1
	end
	for v56 = 1, v52 do
		local v57 = nil
		for v58 = v56, v52 do
			if v53[v58][v56] == 1 then
				v57 = v58
				break
			end
		end
		assert(v57, "not invertible")
		local v59 = v53[v57]
		local v60 = v53[v56]
		v53[v56] = v59
		v53[v57] = v60
		local v61 = v54[v57]
		local v62 = v54[v56]
		v54[v56] = v61
		v54[v57] = v62
		for v63 = 1, v52 do
			if v63 ~= v56 and v53[v63][v56] == 1 then
				for v64 = 1, v52 do
					local v65 = v53[v63]
					local v66 = v53[v63][v64]
					local v67 = v53[v56][v64]
					v65[v64] = bit32.bxor(v66, v67)
					local v68 = v54[v63]
					local v69 = v54[v63][v64]
					local v70 = v54[v56][v64]
					v68[v64] = bit32.bxor(v69, v70)
				end
			end
		end
	end
	return v54
end
local function v_u_80(p72, p73)
	-- upvalues: (copy) v_u_8, (copy) v_u_71, (copy) v_u_4, (copy) v_u_27
	local v74 = #p72
	local v75 = v_u_8(v74)
	for v76 = 1, v74 do
		v75[v76][v76] = 1
	end
	local v77
	if p73 < 0 then
		v77 = v_u_71(p72)
	else
		v77 = v_u_4(p72)
	end
	local v78 = math.abs(p73)
	while v78 > 0 do
		if math.fmod(v78, 2) >= 0.5 then
			v75 = v_u_27(v75, v77)
		end
		v77 = v_u_27(v77, v77)
		local v79 = v78 / 2
		v78 = math.floor(v79)
	end
	return v75
end
local function v_u_85(p81, p82)
	-- upvalues: (copy) v_u_8
	local v83 = v_u_8(p82)
	for v84 = 1, p82 - p81 do
		v83[v84][v84 + p81] = 1
	end
	return v83
end
local function v_u_90(p86, p87)
	-- upvalues: (copy) v_u_8
	local v88 = v_u_8(p87)
	for v89 = p86 + 1, p87 do
		v88[v89][v89 - p86] = 1
	end
	return v88
end
local function v_u_98(p91, p92, p93, p94)
	-- upvalues: (copy) v_u_8
	local v95 = v_u_8(p92)
	for v96 = 1, #p91 do
		for v97 = 1, #p91[1] do
			v95[p93 + v96][p94 + v97] = p91[v96][v97]
		end
	end
	return v95
end
local function v_u_113(p99, p100, p101, p102)
	local v103 = table.create(128, 0)
	for v104 = 0, 31 do
		local v105 = 32 - v104
		local v106 = bit32.rshift(p99, v104)
		v103[v105] = bit32.band(v106, 1)
		local v107 = 64 - v104
		local v108 = bit32.rshift(p100, v104)
		v103[v107] = bit32.band(v108, 1)
		local v109 = 96 - v104
		local v110 = bit32.rshift(p101, v104)
		v103[v109] = bit32.band(v110, 1)
		local v111 = 128 - v104
		local v112 = bit32.rshift(p102, v104)
		v103[v111] = bit32.band(v112, 1)
	end
	return v103
end
local function v_u_128(p114)
	local v115 = 0
	local v116 = 0
	local v117 = 0
	local v118 = 0
	for v119 = 0, 31 do
		local v120 = p114[32 - v119]
		local v121 = bit32.lshift(v120, v119)
		v115 = bit32.bor(v115, v121)
		local v122 = p114[64 - v119]
		local v123 = bit32.lshift(v122, v119)
		v116 = bit32.bor(v116, v123)
		local v124 = p114[96 - v119]
		local v125 = bit32.lshift(v124, v119)
		v117 = bit32.bor(v117, v125)
		local v126 = p114[128 - v119]
		local v127 = bit32.lshift(v126, v119)
		v118 = bit32.bor(v118, v127)
	end
	return v115, v116, v117, v118
end
local v_u_135 = (function()
	-- upvalues: (copy) v_u_12, (copy) v_u_85, (copy) v_u_27, (copy) v_u_50, (copy) v_u_98, (copy) v_u_90
	local v129 = v_u_12(32)
	local v130 = v_u_12(128)
	local v131 = v_u_27(v_u_50(v130, (v_u_98(v_u_85(11, 32), 128, 0, 0))), v130)
	local v132 = v_u_27(v_u_50(v130, (v_u_98(v_u_90(8, 32), 128, 0, 0))), v131)
	local v133 = v_u_27(v_u_50(v130, (v_u_98(v129, 128, 0, 96))), v132)
	local v134 = v_u_27(v_u_50(v130, (v_u_98(v_u_90(19, 32), 128, 0, 96))), v133)
	return v_u_27(v_u_50(v_u_85(32, 128), (v_u_90(96, 128))), v134)
end)()
return table.freeze({
	["ToColumnVector128"] = v_u_113,
	["FromColumnVector128"] = v_u_128,
	["MatTransform"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_135
		return v_u_4(v_u_135)
	end,
	["Transform"] = function(p136, p137, p138, p139, p140)
		-- upvalues: (copy) v_u_113, (copy) v_u_39, (copy) v_u_80, (copy) v_u_4, (copy) v_u_135, (copy) v_u_128
		local v141 = v_u_113(p136, p137, p138, p139)
		return v_u_128((v_u_39(v_u_80(v_u_4(v_u_135), p140), v141)))
	end
})