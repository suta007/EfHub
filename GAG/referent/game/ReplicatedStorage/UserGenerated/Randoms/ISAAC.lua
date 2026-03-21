local v1 = game:GetService("ReplicatedStorage")
require(v1.UserGenerated.Randoms.Base)
local v_u_2 = require(v1.UserGenerated.IO.Crypto.GenerateSeed)
local v_u_3 = bit32.bxor
local v_u_4 = bit32.bor
local v_u_5 = bit32.band
local v_u_6 = bit32.lshift
local v_u_7 = bit32.rshift
local v_u_8 = math.floor
local v_u_9 = math.ldexp
local v_u_10 = math.sqrt
local v_u_11 = math.log
local v_u_12 = math.max
local v_u_13 = math.sin
local v_u_14 = math.cos
local v_u_15 = math.clamp
local v_u_16 = table.create
local v_u_17 = table.clone
local v_u_18 = string.format
local v_u_19 = Vector2.new
local v_u_20 = Vector3.new
assert(true)
local v_u_21 = Random.new()
local function v_u_47(p22)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
	local v23 = p22[1]
	local v24 = p22[2]
	local v25 = p22[3]
	local v26 = p22[4]
	local v27 = p22[5]
	local v28 = p22[6]
	local v29 = p22[7]
	local v30 = p22[8]
	local v31 = v_u_3(v23, (v_u_6(v24, 11)))
	local v32 = v_u_4(v26 + v31, 0)
	local v33 = v_u_3(v_u_4(v24 + v25, 0), (v_u_7(v25, 2)))
	local v34 = v_u_4(v27 + v33, 0)
	local v35 = v_u_3(v_u_4(v25 + v32, 0), (v_u_6(v32, 8)))
	local v36 = v_u_4(v28 + v35, 0)
	local v37 = v_u_3(v_u_4(v32 + v34, 0), (v_u_7(v34, 16)))
	local v38 = v_u_4(v29 + v37, 0)
	local v39 = v_u_3(v_u_4(v34 + v36, 0), (v_u_6(v36, 10)))
	local v40 = v_u_4(v30 + v39, 0)
	local v41 = v_u_3(v_u_4(v36 + v38, 0), (v_u_7(v38, 4)))
	local v42 = v_u_4(v31 + v41, 0)
	local v43 = v_u_3(v_u_4(v38 + v40, 0), (v_u_6(v40, 8)))
	local v44 = v_u_4(v33 + v43, 0)
	local v45 = v_u_3(v_u_4(v40 + v42, 0), (v_u_7(v42, 9)))
	local v46 = v_u_4(v35 + v45, 0)
	p22[1] = v_u_4(v42 + v44, 0)
	p22[2] = v44
	p22[3] = v46
	p22[4] = v37
	p22[5] = v39
	p22[6] = v41
	p22[7] = v43
	p22[8] = v45
end
local function v_u_60(p48)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v49 = p48.AA
	local v50 = p48.BB
	local v51 = p48.CC
	local v52 = p48.MM
	local v53 = p48.RSL
	local v54 = v_u_4(v51 + 1, 0)
	local v55 = v_u_4(v50 + v54, 0)
	for v56 = 1, 256 do
		local v57 = v52[v56]
		local v58 = v_u_5(v56, 3)
		if v58 == 0 then
			v49 = v_u_3(v49, (v_u_7(v49, 16)))
		elseif v58 == 1 then
			v49 = v_u_3(v49, (v_u_6(v49, 13)))
		elseif v58 == 2 then
			v49 = v_u_3(v49, (v_u_7(v49, 6)))
		elseif v58 == 3 then
			v49 = v_u_3(v49, (v_u_6(v49, 2)))
		end
		v49 = v_u_4(v52[v_u_5(v56 + 127, 255) + 1] + v49, 0)
		local v59 = v_u_4(v52[v_u_5(v_u_7(v57, 2), 255) + 1] + v49 + v55, 0)
		v52[v56] = v59
		v55 = v_u_4(v52[v_u_5(v_u_7(v59, 10), 255) + 1] + v57, 0)
		v53[v56] = v55
	end
	p48.AA = v49
	p48.BB = v55
	p48.CC = v54
end
local function v_u_70(p61, p62)
	-- upvalues: (copy) v_u_16, (copy) v_u_47, (copy) v_u_4
	p61.AA = 0
	p61.BB = 0
	p61.CC = 0
	p61.Count = 256
	local v63 = p61.MM
	local v64 = p61.RSL
	local v65 = v_u_16(8, 2654435769)
	v_u_47(v65)
	v_u_47(v65)
	v_u_47(v65)
	v_u_47(v65)
	for v66 = 0, 255, 8 do
		if p62 then
			for v67 = 1, 8 do
				v65[v67] = v_u_4(v65[v67] + v64[v66 + v67], 0)
			end
		end
		v_u_47(v65)
		v63[v66 + 1] = v65[1]
		v63[v66 + 2] = v65[2]
		v63[v66 + 3] = v65[3]
		v63[v66 + 4] = v65[4]
		v63[v66 + 5] = v65[5]
		v63[v66 + 6] = v65[6]
		v63[v66 + 7] = v65[7]
		v63[v66 + 8] = v65[8]
	end
	if p62 then
		for v68 = 0, 255, 8 do
			for v69 = 1, 8 do
				v65[v69] = v_u_4(v65[v69] + v63[v68 + v69], 0)
			end
			v_u_47(v65)
			v63[v68 + 1] = v65[1]
			v63[v68 + 2] = v65[2]
			v63[v68 + 3] = v65[3]
			v63[v68 + 4] = v65[4]
			v63[v68 + 5] = v65[5]
			v63[v68 + 6] = v65[6]
			v63[v68 + 7] = v65[7]
			v63[v68 + 8] = v65[8]
		end
	end
end
local function v_u_82(p71, p72, p73)
	-- upvalues: (copy) v_u_21, (copy) v_u_4, (copy) v_u_70
	if p72 == nil then
		p72 = { v_u_21:NextInteger(0, 4294967295) }
	elseif type(p72) == "number" then
		p72 = { p72 }
	else
		local v74 = type(p72) == "table"
		assert(v74)
	end
	if p73 == nil then
		p73 = true
	else
		local v75 = type(p73) == "boolean"
		assert(v75)
	end
	local v76 = #p72
	local v77 = math.min(256, v76)
	local v78 = p71.MM
	local v79 = p71.RSL
	for v80 = 1, 256 do
		v78[v80] = 0
		v79[v80] = 0
	end
	for v81 = 1, v77 do
		v79[v81] = v_u_4(p72[v81], 0)
	end
	v_u_70(p71, p73)
end
local v173 = {
	["__index"] = table.freeze({
		["NextU32"] = function(p83)
			-- upvalues: (copy) v_u_60
			local v84 = p83.Count + 1
			if v84 > 256 then
				v_u_60(p83)
				v84 = 1
			end
			p83.Count = v84
			return p83.RSL[v84]
		end,
		["NextU64"] = function(p85)
			-- upvalues: (copy) v_u_60, (copy) v_u_9
			local v86 = p85.Count + 1
			if v86 > 256 then
				v_u_60(p85)
				v86 = 1
			end
			p85.Count = v86
			local v87 = v_u_9(p85.RSL[v86], 32)
			local v88 = p85.Count + 1
			if v88 > 256 then
				v_u_60(p85)
				v88 = 1
			end
			p85.Count = v88
			return v87 + p85.RSL[v88]
		end,
		["NextFloat"] = function(p89)
			-- upvalues: (copy) v_u_60, (copy) v_u_9
			local v90 = p89.Count + 1
			if v90 > 256 then
				v_u_60(p89)
				v90 = 1
			end
			p89.Count = v90
			return v_u_9(p89.RSL[v90], -32)
		end,
		["NextDouble"] = function(p91)
			-- upvalues: (copy) v_u_60, (copy) v_u_9
			local v92 = p91.Count + 1
			if v92 > 256 then
				v_u_60(p91)
				v92 = 1
			end
			p91.Count = v92
			local v93 = v_u_9(p91.RSL[v92], 32)
			local v94 = p91.Count + 1
			if v94 > 256 then
				v_u_60(p91)
				v94 = 1
			end
			p91.Count = v94
			return v_u_9(v93 + p91.RSL[v94], -64)
		end,
		["NextNumber"] = function(p95, p96, p97)
			-- upvalues: (copy) v_u_60, (copy) v_u_9
			local v98 = p97 - p96
			local v99 = p95.Count + 1
			if v99 > 256 then
				v_u_60(p95)
				v99 = 1
			end
			p95.Count = v99
			local v100 = v_u_9(p95.RSL[v99], 32)
			local v101 = p95.Count + 1
			if v101 > 256 then
				v_u_60(p95)
				v101 = 1
			end
			p95.Count = v101
			return p96 + v98 * v_u_9(v100 + p95.RSL[v101], -64)
		end,
		["NextInteger"] = function(p102, p103, p104)
			-- upvalues: (copy) v_u_60, (copy) v_u_9, (copy) v_u_8
			local v105 = p104 - p103 + 1
			local v106 = p102.Count + 1
			if v106 > 256 then
				v_u_60(p102)
				v106 = 1
			end
			p102.Count = v106
			local v107 = v_u_9(p102.RSL[v106], 32)
			local v108 = p102.Count + 1
			if v108 > 256 then
				v_u_60(p102)
				v108 = 1
			end
			p102.Count = v108
			return v_u_8(p103 + v105 * v_u_9(v107 + p102.RSL[v108], -64))
		end,
		["NextNormal"] = function(p109, p110, p111)
			-- upvalues: (copy) v_u_60, (copy) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_14, (copy) v_u_13
			local v112 = 2.2250738585072014e-308
			local v113 = p109.Count + 1
			if v113 > 256 then
				v_u_60(p109)
				v113 = 1
			end
			p109.Count = v113
			local v114 = v_u_9(p109.RSL[v113], 32)
			local v115 = p109.Count + 1
			if v115 > 256 then
				v_u_60(p109)
				v115 = 1
			end
			p109.Count = v115
			local v116 = v_u_10(v_u_11((v_u_12(v112, (v_u_9(v114 + p109.RSL[v115], -64))))) * -2) * (p111 or 0)
			local v117 = 6.283185307179586
			local v118 = p109.Count + 1
			if v118 > 256 then
				v_u_60(p109)
				v118 = 1
			end
			p109.Count = v118
			local v119 = v_u_9(p109.RSL[v118], 32)
			local v120 = p109.Count + 1
			if v120 > 256 then
				v_u_60(p109)
				v120 = 1
			end
			p109.Count = v120
			local v121 = v117 * v_u_9(v119 + p109.RSL[v120], -64)
			local v122 = p110 or 0
			return v_u_14(v121) * v116 + v122, v_u_13(v121) * v116 + v122
		end,
		["NextBoolean"] = function(p123, p124)
			-- upvalues: (copy) v_u_60, (copy) v_u_9
			local v125 = p123.Count + 1
			if v125 > 256 then
				v_u_60(p123)
				v125 = 1
			end
			p123.Count = v125
			local v126 = v_u_9(p123.RSL[v125], 32)
			local v127 = p123.Count + 1
			if v127 > 256 then
				v_u_60(p123)
				v127 = 1
			end
			p123.Count = v127
			return v_u_9(v126 + p123.RSL[v127], -64) < (p124 or 0.5)
		end,
		["NextVector2"] = function(p128, p129)
			-- upvalues: (copy) v_u_60, (copy) v_u_9, (copy) v_u_19, (copy) v_u_14, (copy) v_u_13
			local v130 = p129 or 1
			local v131 = 6.283185307179586
			local v132 = p128.Count + 1
			if v132 > 256 then
				v_u_60(p128)
				v132 = 1
			end
			p128.Count = v132
			local v133 = v_u_9(p128.RSL[v132], 32)
			local v134 = p128.Count + 1
			if v134 > 256 then
				v_u_60(p128)
				v134 = 1
			end
			p128.Count = v134
			local v135 = v131 * v_u_9(v133 + p128.RSL[v134], -64)
			return v_u_19(v_u_14(v135) * v130, v_u_13(v135) * v130)
		end,
		["NextVector3"] = function(p136, p137)
			-- upvalues: (copy) v_u_60, (copy) v_u_9, (copy) v_u_10, (copy) v_u_14, (copy) v_u_13, (copy) v_u_20
			local v138 = p137 or 1
			local v139 = 6.283185307179586
			local v140 = p136.Count + 1
			if v140 > 256 then
				v_u_60(p136)
				v140 = 1
			end
			p136.Count = v140
			local v141 = v_u_9(p136.RSL[v140], 32)
			local v142 = p136.Count + 1
			if v142 > 256 then
				v_u_60(p136)
				v142 = 1
			end
			p136.Count = v142
			local v143 = v139 * v_u_9(v141 + p136.RSL[v142], -64)
			local v144 = p136.Count + 1
			if v144 > 256 then
				v_u_60(p136)
				v144 = 1
			end
			p136.Count = v144
			local v145 = v_u_9(p136.RSL[v144], 32)
			local v146 = p136.Count + 1
			if v146 > 256 then
				v_u_60(p136)
				v146 = 1
			end
			p136.Count = v146
			local v147 = v_u_9(v145 + p136.RSL[v146], -64) * 2 - 1
			local v148 = v_u_10(1 - v147 * v147)
			return v_u_20(v_u_14(v143) * v148 * v138, v_u_13(v143) * v148 * v138, v147 * v138)
		end,
		["NextUUIDv4"] = function(p149)
			-- upvalues: (copy) v_u_18, (copy) v_u_60, (copy) v_u_5, (copy) v_u_4
			local v150 = v_u_18
			local v151 = "%08x%08x%08x%08x"
			local v152 = p149.Count + 1
			if v152 > 256 then
				v_u_60(p149)
				v152 = 1
			end
			p149.Count = v152
			local v153 = p149.RSL[v152]
			local v154 = p149.Count + 1
			if v154 > 256 then
				v_u_60(p149)
				v154 = 1
			end
			p149.Count = v154
			local v155 = v_u_4(v_u_5(p149.RSL[v154], 4294905855), 16384)
			local v156 = p149.Count + 1
			if v156 > 256 then
				v_u_60(p149)
				v156 = 1
			end
			p149.Count = v156
			local v157 = v_u_4(v_u_5(p149.RSL[v156], 1073741823), 2147483648)
			local v158 = p149.Count + 1
			if v158 > 256 then
				v_u_60(p149)
				v158 = 1
			end
			p149.Count = v158
			return v150(v151, v153, v155, v157, p149.RSL[v158])
		end,
		["Seed"] = v_u_82,
		["Shuffle"] = function(p159, p160)
			-- upvalues: (copy) v_u_60, (copy) v_u_9, (copy) v_u_8
			local v161 = type(p160) == "table"
			assert(v161)
			for v162 = #p160, 2, -1 do
				local v163 = v162 - 1 + 1
				local v164 = p159.Count + 1
				if v164 > 256 then
					v_u_60(p159)
					v164 = 1
				end
				p159.Count = v164
				local v165 = v_u_9(p159.RSL[v164], 32)
				local v166 = p159.Count + 1
				if v166 > 256 then
					v_u_60(p159)
					v166 = 1
				end
				p159.Count = v166
				local v167 = v_u_8(v163 * v_u_9(v165 + p159.RSL[v166], -64) + 1)
				local v168 = p160[v167]
				local v169 = p160[v162]
				p160[v162] = v168
				p160[v167] = v169
			end
		end,
		["Clone"] = function(p170)
			-- upvalues: (copy) v_u_17
			local v171 = {
				["RSL"] = v_u_17(p170.RSL),
				["Count"] = p170.Count,
				["MM"] = v_u_17(p170.MM),
				["AA"] = p170.AA,
				["BB"] = p170.BB,
				["CC"] = p170.CC
			}
			local v172 = getmetatable(p170)
			return setmetatable(v171, v172)
		end
	})
}
local v_u_174 = table.freeze(v173)
local v_u_182 = {
	["new"] = function(p175, p176)
		-- upvalues: (copy) v_u_16, (copy) v_u_82, (copy) v_u_174
		local v177 = {
			["RSL"] = v_u_16(256, 0),
			["Count"] = 0,
			["MM"] = v_u_16(256, 0),
			["AA"] = 0,
			["BB"] = 0,
			["CC"] = 0
		}
		v_u_82(v177, p175, p176)
		local v178 = v_u_174
		return setmetatable(v177, v178)
	end,
	["Unique"] = function(p179)
		-- upvalues: (copy) v_u_8, (copy) v_u_15, (copy) v_u_182, (copy) v_u_2
		if p179 ~= nil then
			local v180
			if type(p179) == "number" and (v_u_8(p179) == p179 and p179 ~= (1 / 0)) then
				v180 = p179 ~= (-1 / 0)
			else
				v180 = false
			end
			if not v180 then
				error("Integer", 2)
			end
			if p179 < 0 then
				error("NonNegative", 2)
			end
		end
		local v181 = v_u_15(p179 or 32, 0, 256)
		return v_u_182.new(v_u_2(v181), true)
	end
}
v_u_182.R = v_u_182.Unique()
return table.freeze(v_u_182)