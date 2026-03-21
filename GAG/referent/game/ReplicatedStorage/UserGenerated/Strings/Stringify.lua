local v_u_1 = {
	["Pretty"] = true,
	["IndentChar"] = " ",
	["IndentSize"] = 2
}
local v_u_2 = {}
local function v_u_6(p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2[typeof(p3)]
	if v5 then
		return v5(p3, p4)
	else
		return ("[%*]"):format((typeof(p3)))
	end
end
v_u_2["nil"] = function(_, _)
	return "nil"
end
function v_u_2.boolean(p7, _)
	return p7 and "true" or "false"
end
function v_u_2.number(p8, p9)
	if p8 == (1 / 0) then
		return "math.huge"
	end
	if p8 == (-1 / 0) then
		return "-math.huge"
	end
	if p8 ~= p8 then
		return "0/0"
	end
	if p9.cfg.Pretty then
		local v10 = p8 * 1000000
		local v11 = math.round(v10) / 1000000
		if v11 == 0 and p8 ~= 0 then
			v13 = tostring(p8)
		else
			local v12, _ = string.format("%." .. 6 .. "f", v11):gsub("%.?0+$", "")
			v13 = (v12 == "" or v12 == "-") and "0" or v12
		end
		if v13 then
			::l16::
			return v13
		end
	end
	local v13 = tostring(p8)
	goto l16
end
function v_u_2.string(p14, _)
	return string.format("%q", p14)
end
v_u_2["function"] = function(_)
	return "[function]"
end
function v_u_2.Instance(p15)
	if p15.Parent then
		return ("[%* %*]"):format(p15.ClassName, (p15:GetFullName()))
	else
		return ("[%*]"):format(p15.ClassName)
	end
end
function v_u_2.table(p16, p17)
	-- upvalues: (copy) v_u_2
	local v18 = getmetatable(p16)
	if v18 and v18.__tostring then
		local v19 = tostring(p16)
		local v20 = p17.cfg.IndentChar
		local v21 = p17.cfg.IndentSize
		local v22 = p17.depth
		return v19:gsub("\n", "\n" .. string.rep(v20, v21 * v22))
	end
	if p17.seen[p16] then
		return "{...}"
	end
	p17.seen[p16] = true
	local v23 = {}
	local v24 = 0
	for v25 in pairs(p16) do
		if typeof(v25) == "number" then
			local v26 = v25 - math.round(v25)
			if math.abs(v26) < 1e-6 and v25 > 0 then
				v24 = math.max(v24, v25)
			end
		end
		table.insert(v23, v25)
	end
	local v27
	if #v23 == v24 then
		v27 = #v23 > 0
	else
		v27 = false
	end
	for v28 = 1, v24 do
		if p16[v28] == nil then
			v27 = false
			break
		end
	end
	p17.depth = p17.depth + 1
	local v29 = p17.cfg.Pretty
	local v30
	if v29 then
		local v31 = p17.cfg.IndentChar
		local v32 = p17.cfg.IndentSize
		local v33 = p17.depth
		v30 = "\n" .. string.rep(v31, v32 * v33) or ""
	else
		v30 = ""
	end
	local v34
	if v29 then
		local v35 = p17.cfg.IndentChar
		local v36 = p17.cfg.IndentSize
		local v37 = p17.depth
		v34 = ",\n" .. string.rep(v35, v36 * v37) or ","
	else
		v34 = ","
	end
	local v38 = {}
	if v27 then
		for v39 = 1, v24 do
			local v40 = p16[v39]
			local v41 = v_u_2[typeof(v40)]
			local v42
			if v41 then
				v42 = v41(v40, p17)
			else
				v42 = ("[%*]"):format((typeof(v40)))
			end
			v38[v39] = v42
		end
	else
		local v_u_43 = p17.order
		local v_u_44 = {}
		for v45, v46 in ipairs(v23) do
			v_u_44[v46] = v45
		end
		local v47 = {}
		for _, v48 in ipairs(v23) do
			local v49 = { v48, p16[v48] }
			table.insert(v47, v49)
		end
		if v_u_43 then
			table.sort(v47, function(p50, p51)
				-- upvalues: (copy) v_u_43, (copy) v_u_44
				local v52 = v_u_43[p50[1]] and (v_u_43[p50[1]].Index or (1 / 0)) or (1 / 0)
				local v53 = v_u_43[p51[1]] and (v_u_43[p51[1]].Index or (1 / 0)) or (1 / 0)
				return v52 ~= v53 and v52 < v53 and true or v_u_44[p50[1]] < v_u_44[p51[1]]
			end)
		end
		for _, v54 in ipairs(v47) do
			local v55 = v54[1]
			local v56 = v54[2]
			local v57
			if v_u_43 and v_u_43[v55] then
				v57 = v_u_43[v55].Child or nil
			else
				v57 = nil
			end
			local v58 = p17.order
			p17.order = v57
			if typeof(v55) ~= "string" or (v55:match("^[a-zA-Z_][a-zA-Z0-9_]*$") ~= v55 or not v55) then
				local v59 = "[%*]"
				local v60 = v_u_2[typeof(v55)]
				local v61
				if v60 then
					v61 = v60(v55, p17)
				else
					v61 = ("[%*]"):format((typeof(v55)))
				end
				v55 = v59:format(v61)
			end
			local v62 = v_u_2[typeof(v56)]
			local v63
			if v62 then
				v63 = v62(v56, p17)
			else
				v63 = ("[%*]"):format((typeof(v56)))
			end
			local v64 = v29 and ("%* = %*"):format(v55, v63) or ("%*=%*"):format(v55, v63)
			table.insert(v38, v64)
			p17.order = v58
		end
	end
	p17.depth = p17.depth - 1
	p17.seen[p16] = nil
	if #v38 == 0 then
		return "{}"
	end
	if not v29 then
		return "{" .. table.concat(v38, v34) .. "}"
	end
	local v65 = p17.cfg.IndentChar
	local v66 = p17.cfg.IndentSize
	local v67 = p17.depth
	local v68 = "\n" .. string.rep(v65, v66 * v67)
	return "{" .. v30 .. table.concat(v38, v34) .. "," .. v68 .. "}"
end
function v_u_2.Color3(p69, p70)
	-- upvalues: (copy) v_u_2
	local v71 = p69.R * 255
	local v72 = p69.G * 255
	local v73 = p69.B * 255
	local v74 = "fromRGB"
	local v75 = v71 - math.round(v71)
	if math.abs(v75) < 1e-6 then
		local v76 = v72 - math.round(v72)
		if math.abs(v76) < 1e-6 then
			local v77 = v73 - math.round(v73)
			if math.abs(v77) < 1e-6 then
				v78 = math.round(v71)
				v79 = math.round(v72)
				v80 = math.round(v73)
				goto l14
			end
		end
	end
	local v78 = p69.R
	local v79 = p69.G
	local v80 = p69.B
	v74 = "new"
	::l14::
	if p70.cfg.Pretty then
		local v81 = "Color3.%*(%*, %*, %*)"
		local v82 = v_u_2[typeof(v78)]
		local v83
		if v82 then
			v83 = v82(v78, p70)
		else
			v83 = ("[%*]"):format((typeof(v78)))
		end
		local v84 = v_u_2[typeof(v79)]
		local v85
		if v84 then
			v85 = v84(v79, p70)
		else
			v85 = ("[%*]"):format((typeof(v79)))
		end
		local v86 = v_u_2[typeof(v80)]
		local v87
		if v86 then
			v87 = v86(v80, p70)
		else
			v87 = ("[%*]"):format((typeof(v80)))
		end
		return v81:format(v74, v83, v85, v87)
	else
		local v88 = "Color3.%*(%*,%*,%*)"
		local v89 = v_u_2[typeof(v78)]
		local v90
		if v89 then
			v90 = v89(v78, p70)
		else
			v90 = ("[%*]"):format((typeof(v78)))
		end
		local v91 = v_u_2[typeof(v79)]
		local v92
		if v91 then
			v92 = v91(v79, p70)
		else
			v92 = ("[%*]"):format((typeof(v79)))
		end
		local v93 = v_u_2[typeof(v80)]
		local v94
		if v93 then
			v94 = v93(v80, p70)
		else
			v94 = ("[%*]"):format((typeof(v80)))
		end
		return v88:format(v74, v90, v92, v94)
	end
end
function v_u_2.Vector3(p95, p96)
	-- upvalues: (copy) v_u_2
	if p95 == Vector3.new(0, 0, 0) then
		return "Vector3.zero"
	elseif p95 == Vector3.new(1, 1, 1) then
		return "Vector3.one"
	elseif p95 == Vector3.new(1, 0, 0) then
		return "Vector3.xAxis"
	elseif p95 == Vector3.new(0, 1, 0) then
		return "Vector3.yAxis"
	elseif p95 == Vector3.new(0, 0, 1) then
		return "Vector3.zAxis"
	elseif p96.cfg.Pretty then
		local v97 = "Vector3.new(%*, %*, %*)"
		local v98 = p95.X
		local v99 = v_u_2[typeof(v98)]
		local v100
		if v99 then
			v100 = v99(v98, p96)
		else
			v100 = ("[%*]"):format((typeof(v98)))
		end
		local v101 = p95.Y
		local v102 = v_u_2[typeof(v101)]
		local v103
		if v102 then
			v103 = v102(v101, p96)
		else
			v103 = ("[%*]"):format((typeof(v101)))
		end
		local v104 = p95.Z
		local v105 = v_u_2[typeof(v104)]
		local v106
		if v105 then
			v106 = v105(v104, p96)
		else
			v106 = ("[%*]"):format((typeof(v104)))
		end
		return v97:format(v100, v103, v106)
	else
		local v107 = "Vector3.new(%*,%*,%*)"
		local v108 = p95.X
		local v109 = v_u_2[typeof(v108)]
		local v110
		if v109 then
			v110 = v109(v108, p96)
		else
			v110 = ("[%*]"):format((typeof(v108)))
		end
		local v111 = p95.Y
		local v112 = v_u_2[typeof(v111)]
		local v113
		if v112 then
			v113 = v112(v111, p96)
		else
			v113 = ("[%*]"):format((typeof(v111)))
		end
		local v114 = p95.Z
		local v115 = v_u_2[typeof(v114)]
		local v116
		if v115 then
			v116 = v115(v114, p96)
		else
			v116 = ("[%*]"):format((typeof(v114)))
		end
		return v107:format(v110, v113, v116)
	end
end
function v_u_2.Vector2(p117, p118)
	-- upvalues: (copy) v_u_2
	if p117 == Vector2.zero then
		return "Vector2.zero"
	elseif p117 == Vector2.one then
		return "Vector2.one"
	elseif p117 == Vector2.xAxis then
		return "Vector2.xAxis"
	elseif p117 == Vector2.yAxis then
		return "Vector2.yAxis"
	elseif p118.cfg.Pretty then
		local v119 = "Vector2.new(%*, %*)"
		local v120 = p117.X
		local v121 = v_u_2[typeof(v120)]
		local v122
		if v121 then
			v122 = v121(v120, p118)
		else
			v122 = ("[%*]"):format((typeof(v120)))
		end
		local v123 = p117.Y
		local v124 = v_u_2[typeof(v123)]
		local v125
		if v124 then
			v125 = v124(v123, p118)
		else
			v125 = ("[%*]"):format((typeof(v123)))
		end
		return v119:format(v122, v125)
	else
		local v126 = "Vector2.new(%*,%*)"
		local v127 = p117.X
		local v128 = v_u_2[typeof(v127)]
		local v129
		if v128 then
			v129 = v128(v127, p118)
		else
			v129 = ("[%*]"):format((typeof(v127)))
		end
		local v130 = p117.Y
		local v131 = v_u_2[typeof(v130)]
		local v132
		if v131 then
			v132 = v131(v130, p118)
		else
			v132 = ("[%*]"):format((typeof(v130)))
		end
		return v126:format(v129, v132)
	end
end
function v_u_2.CFrame(p133, p134)
	-- upvalues: (copy) v_u_2
	if p133 == CFrame.identity then
		return "CFrame.identity"
	end
	local v135 = p133.Position
	local v136, v137, v138 = p133:ToOrientation()
	local v139 = v135.Magnitude
	local _, _, _, v140, v141, v142, v143, v144, v145, v146, v147, v148 = p133:GetComponents()
	local v149 = v140 - 1
	local v150
	if math.abs(v149) > 1e-6 then
		v150 = true
	else
		local v151 = v144 - 1
		if math.abs(v151) > 1e-6 then
			v150 = true
		else
			local v152 = v148 - 1
			v150 = (math.abs(v152) > 1e-6 or (math.abs(v141) > 1e-6 or (math.abs(v142) > 1e-6 or (math.abs(v143) > 1e-6 or (math.abs(v145) > 1e-6 or math.abs(v146) > 1e-6))))) and true or math.abs(v147) > 1e-6
		end
	end
	local v153 = v139 > 1e-6
	local v154 = p134.cfg.Pretty
	if v154 then
		local v155 = "CFrame.new(%*, %*, %*)"
		local v156 = v135.X * 1000000
		local v157 = math.round(v156) / 1000000
		local v158 = v_u_2[typeof(v157)]
		local v159
		if v158 then
			v159 = v158(v157, p134)
		else
			v159 = ("[%*]"):format((typeof(v157)))
		end
		local v160 = v135.Y * 1000000
		local v161 = math.round(v160) / 1000000
		local v162 = v_u_2[typeof(v161)]
		local v163
		if v162 then
			v163 = v162(v161, p134)
		else
			v163 = ("[%*]"):format((typeof(v161)))
		end
		local v164 = v135.Z * 1000000
		local v165 = math.round(v164) / 1000000
		local v166 = v_u_2[typeof(v165)]
		local v167
		if v166 then
			v167 = v166(v165, p134)
		else
			v167 = ("[%*]"):format((typeof(v165)))
		end
		v199 = v155:format(v159, v163, v167)
		if v199 then
			::l28::
			if v154 then
				local v168 = "CFrame.fromOrientation(math.rad(%*), math.rad(%*), math.rad(%*))"
				local v169 = math.deg(v136) * 1000000
				local v170 = math.round(v169) / 1000000
				local v171 = v_u_2[typeof(v170)]
				local v172
				if v171 then
					v172 = v171(v170, p134)
				else
					v172 = ("[%*]"):format((typeof(v170)))
				end
				local v173 = math.deg(v137) * 1000000
				local v174 = math.round(v173) / 1000000
				local v175 = v_u_2[typeof(v174)]
				local v176
				if v175 then
					v176 = v175(v174, p134)
				else
					v176 = ("[%*]"):format((typeof(v174)))
				end
				local v177 = math.deg(v138) * 1000000
				local v178 = math.round(v177) / 1000000
				local v179 = v_u_2[typeof(v178)]
				local v180
				if v179 then
					v180 = v179(v178, p134)
				else
					v180 = ("[%*]"):format((typeof(v178)))
				end
				v188 = v168:format(v172, v176, v180)
				if v188 then
					::l49::
					if not v153 then
						return v188
					end
					if v150 then
						v199 = v199 .. (v154 and " * " or "*") .. v188 or v199
					end
					return v199
				end
			end
			local v181 = "CFrame.fromOrientation(%*,%*,%*)"
			local v182 = v_u_2[typeof(v136)]
			local v183
			if v182 then
				v183 = v182(v136, p134)
			else
				v183 = ("[%*]"):format((typeof(v136)))
			end
			local v184 = v_u_2[typeof(v137)]
			local v185
			if v184 then
				v185 = v184(v137, p134)
			else
				v185 = ("[%*]"):format((typeof(v137)))
			end
			local v186 = v_u_2[typeof(v138)]
			local v187
			if v186 then
				v187 = v186(v138, p134)
			else
				v187 = ("[%*]"):format((typeof(v138)))
			end
			local v188 = v181:format(v183, v185, v187)
			goto l49
		end
	end
	local v189 = "CFrame.new(%*,%*,%*)"
	local v190 = v135.X
	local v191 = v_u_2[typeof(v190)]
	local v192
	if v191 then
		v192 = v191(v190, p134)
	else
		v192 = ("[%*]"):format((typeof(v190)))
	end
	local v193 = v135.Y
	local v194 = v_u_2[typeof(v193)]
	local v195
	if v194 then
		v195 = v194(v193, p134)
	else
		v195 = ("[%*]"):format((typeof(v193)))
	end
	local v196 = v135.Z
	local v197 = v_u_2[typeof(v196)]
	local v198
	if v197 then
		v198 = v197(v196, p134)
	else
		v198 = ("[%*]"):format((typeof(v196)))
	end
	local v199 = v189:format(v192, v195, v198)
	goto l28
end
function v_u_2.EnumItem(p200, _)
	local v201 = p200.EnumType
	return ("Enum.%*.%*"):format(tostring(v201), p200.Name)
end
local v_u_227 = {
	["DEFAULT_CONFIG"] = v_u_1,
	["Pretty"] = function(p202, p203)
		-- upvalues: (copy) v_u_1, (copy) v_u_6
		local v204 = {
			["Pretty"] = p203 and p203.Pretty or v_u_1.Pretty,
			["IndentChar"] = p203 and p203.IndentChar or v_u_1.IndentChar,
			["IndentSize"] = p203 and p203.IndentSize or v_u_1.IndentSize,
			["Order"] = p203 and p203.Order or v_u_1.Order
		}
		return v_u_6(p202, {
			["cfg"] = v204,
			["depth"] = 0,
			["order"] = v204.Order,
			["seen"] = {}
		})
	end,
	["Serialize"] = function(p205, p206)
		-- upvalues: (copy) v_u_6
		return v_u_6(p205, {
			["cfg"] = p206,
			["depth"] = 0,
			["order"] = p206.Order,
			["seen"] = {}
		})
	end,
	["Default"] = function(p207)
		-- upvalues: (copy) v_u_1, (copy) v_u_6
		local v208 = v_u_1
		return v_u_6(p207, {
			["cfg"] = v208,
			["depth"] = 0,
			["order"] = v208.Order,
			["seen"] = {}
		})
	end,
	["DefaultArgs"] = function(...)
		-- upvalues: (copy) v_u_227
		local v209 = table.pack(...)
		local v210 = {}
		for v211 = 1, v209.n do
			if v211 > 1 then
				table.insert(v210, ", ")
			end
			local v212 = v_u_227.Default
			local v213 = v209[v211]
			table.insert(v210, v212(v213))
		end
		return table.concat(v210)
	end,
	["DefaultArgsPrefix"] = function(...)
		-- upvalues: (copy) v_u_227
		local v214 = table.pack(...)
		local v215 = {}
		for v216 = 1, v214.n do
			table.insert(v215, ", ")
			local v217 = v_u_227.Default
			local v218 = v214[v216]
			table.insert(v215, v217(v218))
		end
		return table.concat(v215)
	end,
	["CompileOrder"] = function(p219)
		-- upvalues: (copy) v_u_227
		local v220 = type(p219) == "table"
		assert(v220)
		local v221 = #p219 ~= 0 and true or next(p219) == nil
		assert(v221)
		local v222 = {}
		for v223, v224 in ipairs(p219) do
			if type(v224) == "table" then
				local v225 = v224.Key
				local v226 = type(v225) == "string"
				assert(v226)
				v222[v225] = {
					["Index"] = v223,
					["Child"] = v_u_227.CompileOrder(v224.Value)
				}
			else
				v222[v224] = {
					["Index"] = v223
				}
			end
		end
		return v222
	end
}
return table.freeze(v_u_227)