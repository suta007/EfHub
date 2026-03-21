local function v_u_16(p1)
	local v2 = p1.Right1
	local v3
	if v2 then
		v3 = v2.Color1
	else
		v3 = false
	end
	local v4
	if v3 then
		v4 = p1.Right1
		p1.Right1 = v4.Left1
		v4.Left1 = p1
		v4.Color1 = p1.Color1
		p1.Color1 = true
	else
		v4 = p1
	end
	local v5 = v4.Left1
	local v6
	if v5 then
		v6 = v5.Color1
	else
		v6 = false
	end
	local v7
	if v6 then
		local v8 = v4.Left1.Left1
		local v9
		if v8 then
			v9 = v8.Color1
		else
			v9 = false
		end
		if v9 then
			v7 = v4.Left1
			v4.Left1 = v7.Right1
			v7.Right1 = v4
			v7.Color1 = v4.Color1
			v4.Color1 = true
		else
			v7 = v4
		end
	else
		v7 = v4
	end
	local v10 = v7.Left1
	local v11
	if v10 then
		v11 = v10.Color1
	else
		v11 = false
	end
	if v11 then
		local v12 = v7.Right1
		local v13
		if v12 then
			v13 = v12.Color1
		else
			v13 = false
		end
		if v13 then
			v7.Color1 = not v7.Color1
			local v14 = v7.Left1
			v14.Color1 = not v14.Color1
			local v15 = v7.Right1
			v15.Color1 = not v15.Color1
		end
	end
	return v7
end
local function v_u_33(p17)
	-- upvalues: (copy) v_u_33, (copy) v_u_16
	if not p17.Left1 then
		return nil, p17
	end
	local v18 = p17.Left1
	local v19
	if v18 then
		v19 = v18.Color1
	else
		v19 = false
	end
	local v20
	if v19 then
		v20 = p17
	else
		local v21 = p17.Left1.Left1
		local v22
		if v21 then
			v22 = v21.Color1
		else
			v22 = false
		end
		if v22 then
			v20 = p17
		else
			p17.Color1 = not p17.Color1
			local v23 = p17.Left1
			v23.Color1 = not v23.Color1
			local v24 = p17.Right1
			v24.Color1 = not v24.Color1
			local v25 = p17.Right1.Left1
			local v26
			if v25 then
				v26 = v25.Color1
			else
				v26 = false
			end
			if v26 then
				local v27 = p17.Right1
				local v28 = v27.Left1
				v27.Left1 = v28.Right1
				v28.Right1 = v27
				v28.Color1 = v27.Color1
				v27.Color1 = true
				p17.Right1 = v28
				v20 = p17.Right1
				p17.Right1 = v20.Left1
				v20.Left1 = p17
				v20.Color1 = p17.Color1
				p17.Color1 = true
				v20.Color1 = not v20.Color1
				local v29 = v20.Left1
				v29.Color1 = not v29.Color1
				local v30 = v20.Right1
				v30.Color1 = not v30.Color1
			else
				v20 = p17
			end
		end
	end
	local v31, v32 = v_u_33(v20.Left1)
	v20.Left1 = v31
	return v_u_16(v20), v32
end
local function v_u_51(p34)
	-- upvalues: (copy) v_u_51, (copy) v_u_16
	local v35 = p34.Left1
	local v36
	if v35 then
		v36 = v35.Color1
	else
		v36 = false
	end
	local v37
	if v36 then
		v37 = p34.Left1
		p34.Left1 = v37.Right1
		v37.Right1 = p34
		v37.Color1 = p34.Color1
		p34.Color1 = true
	else
		v37 = p34
	end
	if not v37.Right1 then
		return nil, v37
	end
	local v38 = v37.Right1
	local v39
	if v38 then
		v39 = v38.Color1
	else
		v39 = false
	end
	local v40
	if v39 then
		v40 = v37
	else
		local v41 = v37.Right1.Left1
		local v42
		if v41 then
			v42 = v41.Color1
		else
			v42 = false
		end
		if v42 then
			v40 = v37
		else
			v37.Color1 = not v37.Color1
			local v43 = v37.Left1
			v43.Color1 = not v43.Color1
			local v44 = v37.Right1
			v44.Color1 = not v44.Color1
			local v45 = v37.Left1.Left1
			local v46
			if v45 then
				v46 = v45.Color1
			else
				v46 = false
			end
			if v46 then
				v40 = v37.Left1
				v37.Left1 = v40.Right1
				v40.Right1 = v37
				v40.Color1 = v37.Color1
				v37.Color1 = true
				v40.Color1 = not v40.Color1
				local v47 = v40.Left1
				v47.Color1 = not v47.Color1
				local v48 = v40.Right1
				v48.Color1 = not v48.Color1
			else
				v40 = v37
			end
		end
	end
	local v49, v50 = v_u_51(v40.Right1)
	v40.Right1 = v49
	return v_u_16(v40), v50
end
local function v_u_56(p52)
	-- upvalues: (copy) v_u_56
	if not p52 then
		return -1
	end
	local v53 = v_u_56(p52.Left1)
	local v54 = v_u_56
	local v55 = p52.Right1
	return math.max(v53, v54(v55)) + 1
end
local function v_u_62(p57, p58, p59, p60)
	-- upvalues: (copy) v_u_62
	if not p58 then
		return true
	end
	if p59 ~= nil and p57(p58.Key, p59) <= 0 then
		return false
	end
	if p60 ~= nil and p57(p58.Key, p60) >= 0 then
		return false
	end
	local v61 = v_u_62(p57, p58.Left1, p59, p58.Key)
	if v61 then
		v61 = v_u_62(p57, p58.Right1, p58.Key, p60)
	end
	return v61
end
local function v_u_101(p63, p64, p65)
	-- upvalues: (copy) v_u_101, (copy) v_u_33, (copy) v_u_16
	local v66
	if p64 then
		local v67
		if p63(p64.Key, p65) > 0 then
			local v68 = p64.Left1
			local v69
			if v68 then
				v69 = v68.Color1
			else
				v69 = false
			end
			if v69 then
				v67 = p64
			else
				local v70 = p64.Left1.Left1
				local v71
				if v70 then
					v71 = v70.Color1
				else
					v71 = false
				end
				if v71 then
					v67 = p64
				else
					p64.Color1 = not p64.Color1
					local v72 = p64.Left1
					v72.Color1 = not v72.Color1
					local v73 = p64.Right1
					v73.Color1 = not v73.Color1
					local v74 = p64.Right1.Left1
					local v75
					if v74 then
						v75 = v74.Color1
					else
						v75 = false
					end
					if v75 then
						local v76 = p64.Right1
						local v77 = v76.Left1
						v76.Left1 = v77.Right1
						v77.Right1 = v76
						v77.Color1 = v76.Color1
						v76.Color1 = true
						p64.Right1 = v77
						v67 = p64.Right1
						p64.Right1 = v67.Left1
						v67.Left1 = p64
						v67.Color1 = p64.Color1
						p64.Color1 = true
						v67.Color1 = not v67.Color1
						local v78 = v67.Left1
						v78.Color1 = not v78.Color1
						local v79 = v67.Right1
						v79.Color1 = not v79.Color1
					else
						v67 = p64
					end
				end
			end
			local v80
			v80, v66 = v_u_101(p63, v67.Left1, p65)
			v67.Left1 = v80
		else
			local v81 = p64.Left1
			local v82
			if v81 then
				v82 = v81.Color1
			else
				v82 = false
			end
			local v83
			if v82 then
				v83 = p64.Left1
				p64.Left1 = v83.Right1
				v83.Right1 = p64
				v83.Color1 = p64.Color1
				p64.Color1 = true
			else
				v83 = p64
			end
			if p63(v83.Key, p65) == 0 and not v83.Right1 then
				v83.Left2.Right2 = v83.Right2
				v83.Right2.Left2 = v83.Left2
				v83.Left1 = nil
				v83.Right1 = nil
				v83.Left2 = nil
				v83.Right2 = nil
				return nil, v83
			end
			if v83.Right1 then
				local v84 = v83.Right1
				local v85
				if v84 then
					v85 = v84.Color1
				else
					v85 = false
				end
				if v85 then
					v67 = v83
				else
					local v86 = v83.Right1.Left1
					local v87
					if v86 then
						v87 = v86.Color1
					else
						v87 = false
					end
					if v87 then
						v67 = v83
					else
						v83.Color1 = not v83.Color1
						local v88 = v83.Left1
						v88.Color1 = not v88.Color1
						local v89 = v83.Right1
						v89.Color1 = not v89.Color1
						local v90 = v83.Left1.Left1
						local v91
						if v90 then
							v91 = v90.Color1
						else
							v91 = false
						end
						if v91 then
							v67 = v83.Left1
							v83.Left1 = v67.Right1
							v67.Right1 = v83
							v67.Color1 = v83.Color1
							v83.Color1 = true
							v67.Color1 = not v67.Color1
							local v92 = v67.Left1
							v92.Color1 = not v92.Color1
							local v93 = v67.Right1
							v93.Color1 = not v93.Color1
						else
							v67 = v83
						end
					end
				end
			else
				v67 = v83
			end
			if p63(v67.Key, p65) == 0 then
				local v94 = v67.Left1
				local v95 = v67.Right1
				local v96 = v67.Color1
				v67.Left2.Right2 = v67.Right2
				v67.Right2.Left2 = v67.Left2
				v67.Left1 = nil
				v67.Right1 = nil
				v67.Left2 = nil
				v67.Right2 = nil
				if v94 and v95 then
					local v97, v98 = v_u_33(v95)
					v98.Right1 = v97
					v98.Left1 = v94
					v98.Color1 = v96
					v66 = v67
					v67 = v98
				else
					local v99 = v94 or v95
					v99.Color1 = v96
					v66 = v67
					v67 = v99
				end
			else
				local v100
				v100, v66 = v_u_101(p63, v67.Right1, p65)
				v67.Right1 = v100
			end
		end
		p64 = v_u_16(v67)
	else
		v66 = nil
	end
	return p64, v66
end
local function v_u_114(p102, p103, p104, p105, p106)
	-- upvalues: (copy) v_u_114, (copy) v_u_16
	if p103 then
		local v107 = false
		local v108 = p102(p103.Key, p105)
		local v109
		if v108 == 0 then
			p103.Value = p106
			v109 = p103
		else
			if v108 > 0 then
				local v110
				v110, v109, v107 = v_u_114(p102, p103.Left1, p103.Left2, p105, p106)
				p103.Left1 = v110
			else
				local v111
				v111, v109, v107 = v_u_114(p102, p103.Right1, p103, p105, p106)
				p103.Right1 = v111
			end
			if v107 then
				p103 = v_u_16(p103)
			end
		end
		return p103, v109, v107
	end
	local v112 = {
		["Color1"] = true,
		["Key"] = p105,
		["Value"] = p106,
		["Left2"] = nil,
		["Right2"] = nil
	}
	local v113 = p104.Right2
	v112.Right2 = v113
	v112.Left2 = p104
	p104.Right2 = v112
	v113.Left2 = v112
	return v112, v112, true
end
local function v_u_119(p115, p116)
	-- upvalues: (copy) v_u_119
	if not p115 then
		return p116 == 0
	end
	local v117
	if p115 then
		v117 = p115.Color1
	else
		v117 = false
	end
	if not v117 then
		p116 = p116 - 1
	end
	local v118 = v_u_119(p115.Left1, p116)
	if v118 then
		v118 = v_u_119(p115.Right1, p116)
	end
	return v118
end
local function v_u_122(p120)
	-- upvalues: (copy) v_u_122
	local v121 = 0
	if p120 then
		v121 = v121 + 1 + v_u_122(p120.Left1) + v_u_122(p120.Right1)
	end
	return v121
end
local function v_u_127(p123, p124)
	-- upvalues: (copy) v_u_122, (copy) v_u_127
	if p123 then
		local v125 = p123.Left1
		local v126 = 0
		if v125 then
			v126 = v126 + 1 + v_u_122(v125.Left1) + v_u_122(v125.Right1)
		end
		if p124 < v126 then
			return v_u_127(p123.Left1, p124)
		elseif v126 < p124 then
			return v_u_127(p123.Right1, p124 - v126 - 1)
		else
			return p123.Key
		end
	else
		return nil
	end
end
local function v_u_136(p128, p129, p130)
	-- upvalues: (copy) v_u_136, (copy) v_u_122
	if p130 then
		local v131 = p128(p130.Key, p129)
		if v131 > 0 then
			return v_u_136(p128, p129, p130.Left1)
		elseif v131 < 0 then
			local v132 = p130.Left1
			local v133 = 0
			if v132 then
				v133 = v133 + 1 + v_u_122(v132.Left1) + v_u_122(v132.Right1)
			end
			return v133 + 1 + v_u_136(p128, p129, p130.Right1)
		else
			local v134 = p130.Left1
			local v135 = 0
			if v134 then
				v135 = v135 + 1 + v_u_122(v134.Left1) + v_u_122(v134.Right1)
			end
			return v135
		end
	else
		return 0
	end
end
local function v_u_145(p137, p138)
	-- upvalues: (copy) v_u_145
	if not p138 then
		return true
	end
	local v139 = p138.Right1
	local v140
	if v139 then
		v140 = v139.Color1
	else
		v140 = false
	end
	if v140 then
		return false
	end
	if p138 ~= p137 then
		local v141
		if p138 then
			v141 = p138.Color1
		else
			v141 = false
		end
		if v141 then
			local v142 = p138.Left1
			local v143
			if v142 then
				v143 = v142.Color1
			else
				v143 = false
			end
			if v143 then
				return false
			end
		end
	end
	local v144 = v_u_145(p137, p138.Left1)
	if v144 then
		v144 = v_u_145(p138.Right1)
	end
	return v144
end
local v146 = {}
local v_u_147 = table.freeze({
	["__index"] = v146
})
function v146.Insert(p148, p149, p150)
	-- upvalues: (copy) v_u_114
	local v151, v152, v153 = v_u_114(p148.Comparator, p148.Root, p148.List, p149, p150)
	v151.Color1 = false
	p148.Root = v151
	if v153 then
		p148.Size = p148.Size + 1
	end
	return v152, v153
end
function v146.Remove(p154, p155)
	-- upvalues: (copy) v_u_101
	local v156 = p154.Root
	local v157
	if v156 then
		local v158 = v156.Left1
		local v159
		if v158 then
			v159 = v158.Color1
		else
			v159 = false
		end
		if not v159 then
			local v160 = v156.Right1
			local v161
			if v160 then
				v161 = v160.Color1
			else
				v161 = false
			end
			if not v161 then
				v156.Color1 = true
			end
		end
		local v162
		v162, v157 = v_u_101(p154.Comparator, v156, p155)
		if v162 then
			v162.Color1 = false
		end
		p154.Root = v162
		if v157 then
			p154.Size = p154.Size - 1
		end
	else
		v157 = nil
	end
	return v157
end
function v146.RemoveMin(p163)
	-- upvalues: (copy) v_u_33
	local v164 = p163.Root
	local v165
	if v164 then
		local v166 = v164.Left1
		local v167
		if v166 then
			v167 = v166.Color1
		else
			v167 = false
		end
		if not v167 then
			local v168 = v164.Right1
			local v169
			if v168 then
				v169 = v168.Color1
			else
				v169 = false
			end
			if not v169 then
				v164.Color1 = true
			end
		end
		local v170
		v170, v165 = v_u_33(v164)
		if v170 then
			v170.Color1 = false
		end
		p163.Root = v170
		if v165 then
			p163.Size = p163.Size - 1
		end
	else
		v165 = nil
	end
	return v165
end
function v146.RemoveMax(p171)
	-- upvalues: (copy) v_u_51
	local v172 = p171.Root
	local v173
	if v172 then
		local v174 = v172.Left1
		local v175
		if v174 then
			v175 = v174.Color1
		else
			v175 = false
		end
		if not v175 then
			local v176 = v172.Right1
			local v177
			if v176 then
				v177 = v176.Color1
			else
				v177 = false
			end
			if not v177 then
				v172.Color1 = true
			end
		end
		local v178
		v178, v173 = v_u_51(v172)
		if v178 then
			v178.Color1 = false
		end
		p171.Root = v178
		if v173 then
			p171.Size = p171.Size - 1
		end
	else
		v173 = nil
	end
	return v173
end
function v146.Min(p179)
	local v180 = p179.List
	local v181 = v180.Left1
	if v181 == v180 then
		return nil
	else
		return v181
	end
end
function v146.Max(p182)
	local v183 = p182.List
	local v184 = v183.Right1
	if v184 == v183 then
		return nil
	else
		return v184
	end
end
function v146.GetSize(p185)
	return p185.Size
end
function v146.ForEach(p186, p187)
	local v188 = type(p187) == "function"
	assert(v188)
	local v189 = p186.List
	local v190 = v189
	while true do
		v189 = v189.Right2
		if v189 == v190 then
			break
		end
		p187(v189.Key, v189.Value)
	end
end
function v146.Next(p191, p192)
	local v193 = p191.List
	if p192 == nil then
		p192 = p191.List
	end
	local v194 = p192.Right2
	if v194 == v193 then
		return nil, nil
	else
		return v194, v194
	end
end
function v146.Iterator(p195)
	return p195.Next, p195
end
function v146.IsBST(p196)
	-- upvalues: (copy) v_u_62
	local v197 = p196.Comparator
	local v198 = p196.Root
	local v199 = v198 and v_u_62(v197, v198.Left1, nil, v198.Key)
	if v199 then
		return v_u_62(v197, v198.Right1, v198.Key, nil)
	else
		return v199
	end
end
function v146.IsSizeConsistent(p200)
	-- upvalues: (copy) v_u_122
	local v201 = p200.Size
	local v202 = p200.Root
	local v203 = 0
	if v202 then
		v203 = v203 + 1 + v_u_122(v202.Left1) + v_u_122(v202.Right1)
	end
	if v201 ~= v203 then
		return false
	end
	local v204 = p200.List
	local v205 = v204
	local v206 = 0
	while true do
		v204 = v204.Right2
		if v204 == v205 then
			break
		end
		v206 = v206 + 1
	end
	return v201 == v206
end
function v146.IsRankConsistent(p_u_207)
	-- upvalues: (copy) v_u_122, (copy) v_u_127, (copy) v_u_136
	for v208 = 0, p_u_207.Size - 1 do
		local v209 = p_u_207.Root
		local v210
		if v209 then
			local v211 = v209.Left1
			local v212 = 0
			if v211 then
				v212 = v212 + 1 + v_u_122(v211.Left1) + v_u_122(v211.Right1)
			end
			if v208 < v212 then
				v210 = v_u_127(v209.Left1, v208)
			elseif v212 < v208 then
				v210 = v_u_127(v209.Right1, v208 - v212 - 1)
			else
				v210 = v209.Key
			end
		else
			v210 = nil
		end
		if v208 ~= v_u_136(p_u_207.Comparator, v210, p_u_207.Root) then
			return false
		end
	end
	p_u_207:ForEach(function(p213, _)
		-- upvalues: (ref) v_u_136, (copy) p_u_207, (ref) v_u_122, (ref) v_u_127
		local v214 = v_u_136(p_u_207.Comparator, p213, p_u_207.Root)
		local v215 = p_u_207.Root
		local v216
		if v215 then
			local v217 = v215.Left1
			local v218 = 0
			if v217 then
				v218 = v218 + 1 + v_u_122(v217.Left1) + v_u_122(v217.Right1)
			end
			if v214 < v218 then
				v216 = v_u_127(v215.Left1, v214)
			elseif v218 < v214 then
				v216 = v_u_127(v215.Right1, v214 - v218 - 1)
			else
				v216 = v215.Key
			end
		else
			v216 = nil
		end
		if p_u_207.Comparator(v216, p213) ~= 0 then
			return false
		end
	end)
	return true
end
function v146.Is23(p219)
	-- upvalues: (copy) v_u_145
	return v_u_145(p219.Root, p219.Root)
end
function v146.IsBalanced(p220)
	-- upvalues: (copy) v_u_119
	local v221 = p220.Root
	local v222 = v221
	local v223 = 0
	while v221 do
		local v224
		if v221 then
			v224 = v221.Color1
		else
			v224 = false
		end
		if not v224 then
			v223 = v223 + 1
		end
		v221 = v221.Left1
	end
	local v225
	if v222 then
		local v226
		if v222 then
			v226 = v222.Color1
		else
			v226 = false
		end
		if not v226 then
			v223 = v223 - 1
		end
		v225 = v_u_119(v222.Left1, v223)
		if v225 then
			return v_u_119(v222.Right1, v223)
		end
	else
		v225 = v223 == 0
	end
	return v225
end
function v146.Check(p227)
	if p227:IsBST() then
		if p227:IsSizeConsistent() then
			if p227:IsRankConsistent() then
				if p227:Is23() then
					if p227:IsBalanced() then
						return true
					else
						return false, "Not balanced"
					end
				else
					return false, "Not a 2-3 tree"
				end
			else
				return false, "Ranks not consistent"
			end
		else
			return false, "Subtree counts not consistent"
		end
	else
		return false, "Not in symmetric order"
	end
end
table.freeze(v146)
return table.freeze({
	["Compare"] = function(p228, p229)
		return p228 < p229 and -1 or (p229 < p228 and 1 or 0)
	end,
	["new"] = function(p230, _, _)
		-- upvalues: (copy) v_u_147
		local v231 = type(p230) == "function"
		assert(v231)
		local v232 = {
			["Color1"] = false,
			["Key"] = nil,
			["Value"] = nil
		}
		v232.Left2 = v232
		v232.Right2 = v232
		local v233 = v_u_147
		return setmetatable({
			["Comparator"] = p230,
			["Root"] = nil,
			["List"] = v232,
			["Size"] = 0
		}, v233)
	end
})