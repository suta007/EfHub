local function v_u_9(p1)
	if type(p1) == "number" or type(p1) == "boolean" then
		return ("%*"):format(p1)
	end
	if type(p1) ~= "string" then
		if typeof(p1) == "Instance" then
			return p1:GetFullName()
		else
			return ("UnknownType(%*)"):format((typeof(p1)))
		end
	end
	local v2 = utf8.len(p1)
	if not v2 then
		return "InvalidUTF8"
	end
	for v3 = 1, string.len(p1) do
		local v4 = string.byte(p1, v3)
		if v4 < 32 or v4 > 126 then
			v8 = false
			::l13::
			if not v8 then
				return "NonASCII"
			end
			if v2 <= 30 then
				local v5, _ = string.format("%q", p1):gsub("\n", "n")
				return v5
			end
			local v6 = string.sub(p1, 1, 30)
			local v7, _ = string.format("%q", v6):gsub("\n", "n")
			return ("%*...%*"):format(v7, v2 - 30)
		end
	end
	local v8 = true
	goto l13
end
local v_u_382 = {
	["IsCFrameFinite"] = function(p10)
		local v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22 = p10:GetComponents()
		local v23 = v11 + v12 + v13 + v14 + v15 + v16 + v17 + v18 + v19 + v20 + v21 + v22
		local v24
		if v23 == v23 and v23 ~= (1 / 0) then
			v24 = v23 ~= (-1 / 0)
		else
			v24 = false
		end
		return v24
	end,
	["IsVector2Finite"] = function(p25)
		local v26 = p25.X + p25.Y
		local v27
		if v26 == v26 and v26 ~= (1 / 0) then
			v27 = v26 ~= (-1 / 0)
		else
			v27 = false
		end
		return v27
	end,
	["IsVector3Finite"] = function(p28)
		local v29 = p28.X + p28.Y + p28.Z
		local v30
		if v29 == v29 and v29 ~= (1 / 0) then
			v30 = v29 ~= (-1 / 0)
		else
			v30 = false
		end
		return v30
	end,
	["Array"] = function(p_u_31)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_31)
		return function(p32)
			-- upvalues: (ref) v_u_9, (copy) p_u_31
			if type(p32) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p32) ~= nil then
				error("metatable", 2)
			end
			local v33 = rawlen(p32)
			local v34 = 0
			for v35, v36 in pairs(p32) do
				v34 = v34 + 1
				if v35 ~= v34 then
					error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v35))))), 2)
				end
				if v33 < v34 then
					error(("IndexOverflow $%*"):format((("[%*]"):format(v34))), 2)
				end
				local v37, v38 = pcall(p_u_31, v36)
				if not v37 then
					local v39 = tostring(v38)
					local v40, v41 = string.match(v39, "^(.*:%d+): (.+)$")
					if v40 then
						v39 = v41 or v39
					end
					local v42, v43 = string.match(v39, "^(.+) $(%[.+)$")
					if v42 then
						if not v43 then
							v42 = v39
						end
					else
						v42 = v39
					end
					error(("%* $%*"):format(v42, (("[%*]%*"):format(v34, v43 or ""))), 2)
				end
			end
			if v33 ~= v34 then
				error("LengthMismatch", 2)
			end
			return p32
		end
	end,
	["ArrayCoerce"] = function(p_u_44)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_44)
		return function(p45)
			-- upvalues: (ref) v_u_9, (copy) p_u_44
			if type(p45) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p45) ~= nil then
				error("metatable", 2)
			end
			local v46 = rawlen(p45)
			local v47 = 0
			local v48 = {}
			for v49, v50 in pairs(p45) do
				v47 = v47 + 1
				if v49 ~= v47 then
					error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v49))))), 2)
				end
				if v46 < v47 then
					error(("IndexOverflow $%*"):format((("[%*]"):format(v47))), 2)
				end
				local v51, v52 = pcall(p_u_44, v50)
				if not v51 then
					local v53 = tostring(v52)
					local v54, v55 = string.match(v53, "^(.*:%d+): (.+)$")
					if v54 then
						v53 = v55 or v53
					end
					local v56, v57 = string.match(v53, "^(.+) $(%[.+)$")
					if v56 then
						if not v57 then
							v56 = v53
						end
					else
						v56 = v53
					end
					error(("%* $%*"):format(v56, (("[%*]%*"):format(v47, v57 or ""))), 2)
				end
				v48[v49] = v52
			end
			if v46 ~= v47 then
				error("LengthMismatch", 2)
			end
			return v48
		end
	end,
	["UniqueArray"] = function(p_u_58)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_58)
		return function(p59)
			-- upvalues: (ref) v_u_9, (copy) p_u_58
			if type(p59) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p59) ~= nil then
				error("metatable", 2)
			end
			local v60 = rawlen(p59)
			local v61 = 0
			local v62 = {}
			for v63, v64 in pairs(p59) do
				v61 = v61 + 1
				if v63 ~= v61 then
					error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v63))))), 2)
				end
				if v60 < v61 then
					error(("IndexOverflow $%*"):format((("[%*]"):format(v61))), 2)
				end
				if v62[v64] then
					error(("UniqueArray $%*"):format((("[%*]"):format(v61))), 2)
				end
				v62[v64] = true
				if not v62[v64] then
					error(("InvalidKey $%*"):format((("[%*]"):format(v61))), 2)
				end
				local v65, v66 = pcall(p_u_58, v64)
				if not v65 then
					local v67 = tostring(v66)
					local v68, v69 = string.match(v67, "^(.*:%d+): (.+)$")
					if v68 then
						v67 = v69 or v67
					end
					local v70, v71 = string.match(v67, "^(.+) $(%[.+)$")
					if v70 then
						if not v71 then
							v70 = v67
						end
					else
						v70 = v67
					end
					error(("%* $%*"):format(v70, (("[%*]%*"):format(v61, v71 or ""))), 2)
				end
			end
			if v60 ~= v61 then
				error("LengthMismatch", 2)
			end
			return p59
		end
	end,
	["UniqueArrayCoerce"] = function(p_u_72)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_72)
		return function(p73)
			-- upvalues: (ref) v_u_9, (copy) p_u_72
			if type(p73) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p73) ~= nil then
				error("metatable", 2)
			end
			local v74 = rawlen(p73)
			local v75 = 0
			local v76 = {}
			local v77 = {}
			for v78, v79 in pairs(p73) do
				v75 = v75 + 1
				if v78 ~= v75 then
					error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v78))))), 2)
				end
				if v74 < v75 then
					error(("IndexOverflow $%*"):format((("[%*]"):format(v75))), 2)
				end
				if v76[v79] then
					error(("UniqueArray $%*"):format((("[%*]"):format(v75))), 2)
				end
				v76[v79] = true
				if not v76[v79] then
					error(("InvalidKey $%*"):format((("[%*]"):format(v75))), 2)
				end
				local v80, v81 = pcall(p_u_72, v79)
				if not v80 then
					local v82 = tostring(v81)
					local v83, v84 = string.match(v82, "^(.*:%d+): (.+)$")
					if v83 then
						v82 = v84 or v82
					end
					local v85, v86 = string.match(v82, "^(.+) $(%[.+)$")
					if v85 then
						if not v86 then
							v85 = v82
						end
					else
						v85 = v82
					end
					error(("%* $%*"):format(v85, (("[%*]%*"):format(v75, v86 or ""))), 2)
				end
				v77[v78] = v81
			end
			if v74 ~= v75 then
				error("LengthMismatch", 2)
			end
			return v77
		end
	end,
	["Map"] = function(p_u_87, p_u_88, p89)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_87)
		v_u_382.Function(p_u_88)
		v_u_382.Optional(v_u_382.IntegerPositive)(p89)
		local v_u_90 = p89 or (1 / 0)
		return function(p91)
			-- upvalues: (copy) v_u_90, (copy) p_u_87, (ref) v_u_9, (copy) p_u_88
			if type(p91) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p91) ~= nil then
				error("metatable", 2)
			end
			local v92 = 0
			for v93, v94 in pairs(p91) do
				v92 = v92 + 1
				if v_u_90 < v92 then
					error(("LengthLimit(%*)"):format(v_u_90), 2)
				end
				local v95, v96 = pcall(p_u_87, v93)
				if not v95 then
					local v97 = tostring(v96)
					local v98, v99 = string.match(v97, "^(.*:%d+): (.+)$")
					if v98 then
						v97 = v99 or v97
					end
					local v100, v101 = string.match(v97, "^(.+) $(%[.+)$")
					if v100 then
						if not v101 then
							v100 = v97
						end
					else
						v100 = v97
					end
					error(("%* $%*"):format(v100, (("<%*>%*"):format(v_u_9(v93), v101 or ""))), 2)
				end
				local v102, v103 = pcall(p_u_88, v94)
				if not v102 then
					local v104 = tostring(v103)
					local v105, v106 = string.match(v104, "^(.*:%d+): (.+)$")
					if v105 then
						v104 = v106 or v104
					end
					local v107, v108 = string.match(v104, "^(.+) $(%[.+)$")
					if v107 then
						if not v108 then
							v107 = v104
						end
					else
						v107 = v104
					end
					error(("%* $%*"):format(v107, (("[%*]%*"):format(v_u_9(v93), v108 or ""))), 2)
				end
			end
			return p91
		end
	end,
	["MapCoerce"] = function(p_u_109, p_u_110, p111)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.Function(p_u_109)
		v_u_382.Function(p_u_110)
		v_u_382.Optional(v_u_382.IntegerPositive)(p111)
		local v_u_112 = p111 or (1 / 0)
		return function(p113)
			-- upvalues: (copy) v_u_112, (copy) p_u_109, (ref) v_u_9, (copy) p_u_110
			if type(p113) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p113) ~= nil then
				error("metatable", 2)
			end
			local v114 = 0
			local v115 = {}
			for v116, v117 in pairs(p113) do
				v114 = v114 + 1
				if v_u_112 < v114 then
					error(("LengthLimit(%*)"):format(v_u_112), 2)
				end
				local v118, v119 = pcall(p_u_109, v116)
				if not v118 then
					local v120 = tostring(v119)
					local v121, v122 = string.match(v120, "^(.*:%d+): (.+)$")
					if v121 then
						v120 = v122 or v120
					end
					local v123, v124 = string.match(v120, "^(.+) $(%[.+)$")
					if v123 then
						if not v124 then
							v123 = v120
						end
					else
						v123 = v120
					end
					error(("%* $%*"):format(v123, (("<%*>%*"):format(v_u_9(v116), v124 or ""))), 2)
				end
				local v125, v126 = pcall(p_u_110, v117)
				if not v125 then
					local v127 = tostring(v126)
					local v128, v129 = string.match(v127, "^(.*:%d+): (.+)$")
					if v128 then
						v127 = v129 or v127
					end
					local v130, v131 = string.match(v127, "^(.+) $(%[.+)$")
					if v130 then
						if not v131 then
							v130 = v127
						end
					else
						v130 = v127
					end
					error(("%* $%*"):format(v130, (("[%*]%*"):format(v_u_9(v116), v131 or ""))), 2)
				end
				v115[v119] = v126
			end
			return v115
		end
	end,
	["Table"] = function(p132)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.NoMetatable(p132)
		for _, v133 in pairs(p132) do
			v_u_382.Function(v133)
		end
		local v_u_134 = table.clone(p132)
		return function(p135)
			-- upvalues: (ref) v_u_134, (ref) v_u_9
			if type(p135) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p135) ~= nil then
				error("metatable", 2)
			end
			local v136 = v_u_134
			if rawlen(v136) ~= rawlen(p135) then
				error("LengthMismatch", 2)
			end
			for v137, _ in pairs(p135) do
				if not v_u_134[v137] then
					error(("UnknownKey $%*"):format((("[%*]"):format((v_u_9(v137))))), 2)
				end
			end
			for v138, v139 in pairs(v_u_134) do
				local v140 = p135[v138]
				local v141, v142 = pcall(v139, v140)
				if not v141 then
					local v143 = tostring(v142)
					local v144, v145 = string.match(v143, "^(.*:%d+): (.+)$")
					if v144 then
						v143 = v145 or v143
					end
					local v146, v147 = string.match(v143, "^(.+) $(%[.+)$")
					if v146 then
						if not v147 then
							v146 = v143
						end
					else
						v146 = v143
					end
					local v148 = error
					local v149 = "[%*]%*"
					local v150
					if type(v138) == "string" then
						local v151
						v150, v151 = string.format("%q", v138):gsub("\n", "n")
					elseif typeof(v138) == "Instance" then
						v150 = v138:GetFullName()
					else
						v150 = tostring(v138)
					end
					v148(("%* $%*"):format(v146, (v149:format(v150, v147 or ""))), 2)
				end
			end
			return p135
		end
	end,
	["TablePermissive"] = function(p152)
		-- upvalues: (copy) v_u_382
		v_u_382.NoMetatable(p152)
		for _, v153 in pairs(p152) do
			v_u_382.Function(v153)
		end
		local v_u_154 = table.clone(p152)
		return function(p155)
			-- upvalues: (ref) v_u_154
			if type(p155) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p155) ~= nil then
				error("metatable", 2)
			end
			local v156 = v_u_154
			if rawlen(v156) ~= rawlen(p155) then
				error("LengthMismatch", 2)
			end
			for v157, v158 in pairs(v_u_154) do
				local v159 = p155[v157]
				local v160, v161 = pcall(v158, v159)
				if not v160 then
					local v162 = tostring(v161)
					local v163, v164 = string.match(v162, "^(.*:%d+): (.+)$")
					if v163 then
						v162 = v164 or v162
					end
					local v165, v166 = string.match(v162, "^(.+) $(%[.+)$")
					if v165 then
						if not v166 then
							v165 = v162
						end
					else
						v165 = v162
					end
					local v167 = error
					local v168 = "[%*]%*"
					local v169
					if type(v157) == "string" then
						local v170
						v169, v170 = string.format("%q", v157):gsub("\n", "n")
					elseif typeof(v157) == "Instance" then
						v169 = v157:GetFullName()
					else
						v169 = tostring(v157)
					end
					v167(("%* $%*"):format(v165, (v168:format(v169, v166 or ""))), 2)
				end
			end
			return p155
		end
	end,
	["TableCoerce"] = function(p171)
		-- upvalues: (copy) v_u_382, (copy) v_u_9
		v_u_382.NoMetatable(p171)
		for _, v172 in pairs(p171) do
			v_u_382.Function(v172)
		end
		local v_u_173 = table.clone(p171)
		return function(p174)
			-- upvalues: (ref) v_u_173, (ref) v_u_9
			if type(p174) ~= "table" then
				error("table", 2)
			end
			if getmetatable(p174) ~= nil then
				error("metatable", 2)
			end
			local v175 = v_u_173
			if rawlen(v175) ~= rawlen(p174) then
				error("LengthMismatch", 2)
			end
			local v176 = {}
			for v177, _ in pairs(p174) do
				if not v_u_173[v177] then
					error(("UnknownKey $%*"):format((("[%*]"):format((v_u_9(v177))))), 2)
				end
			end
			for v178, v179 in pairs(v_u_173) do
				local v180 = p174[v178]
				local v181, v182 = pcall(v179, v180)
				if not v181 then
					local v183 = tostring(v182)
					local v184, v185 = string.match(v183, "^(.*:%d+): (.+)$")
					if v184 then
						v183 = v185 or v183
					end
					local v186, v187 = string.match(v183, "^(.+) $(%[.+)$")
					if v186 then
						if not v187 then
							v186 = v183
						end
					else
						v186 = v183
					end
					local v188 = error
					local v189 = "[%*]%*"
					local v190
					if type(v178) == "string" then
						local v191
						v190, v191 = string.format("%q", v178):gsub("\n", "n")
					elseif typeof(v178) == "Instance" then
						v190 = v178:GetFullName()
					else
						v190 = tostring(v178)
					end
					v188(("%* $%*"):format(v186, (v189:format(v190, v187 or ""))), 2)
				end
				v176[v178] = v182
			end
			return v176
		end
	end,
	["IsASCII"] = function(p192)
		local v193
		if type(p192) == "string" then
			for v194 = 1, string.len(p192) do
				local v195 = string.byte(p192, v194)
				if v195 < 32 or v195 > 126 then
					return false
				end
			end
			v193 = true
		else
			v193 = false
		end
		return v193
	end,
	["IsFinite"] = function(p196)
		local v197
		if type(p196) == "number" and (p196 == p196 and p196 ~= (1 / 0)) then
			v197 = p196 ~= (-1 / 0)
		else
			v197 = false
		end
		return v197
	end,
	["IsInteger"] = function(p198)
		local v199
		if type(p198) == "number" and (math.floor(p198) == p198 and p198 ~= (1 / 0)) then
			v199 = p198 ~= (-1 / 0)
		else
			v199 = false
		end
		return v199
	end,
	["IsCFrameFinite"] = function(p200)
		local v201
		if typeof(p200) == "CFrame" then
			local v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213 = p200:GetComponents()
			local v214 = v202 + v203 + v204 + v205 + v206 + v207 + v208 + v209 + v210 + v211 + v212 + v213
			if v214 == v214 and v214 ~= (1 / 0) then
				v201 = v214 ~= (-1 / 0)
			else
				v201 = false
			end
		else
			v201 = false
		end
		return v201
	end,
	["IsVector2Finite"] = function(p215)
		local v216
		if typeof(p215) == "Vector2" then
			local v217 = p215.X + p215.Y
			if v217 == v217 and v217 ~= (1 / 0) then
				v216 = v217 ~= (-1 / 0)
			else
				v216 = false
			end
		else
			v216 = false
		end
		return v216
	end,
	["Optional"] = function(p_u_218)
		if type(p_u_218) ~= "function" then
			error("function", 2)
		end
		return function(p219)
			-- upvalues: (copy) p_u_218
			if p219 == nil then
				return nil
			end
			local v220, v221 = pcall(p_u_218, p219)
			if not v220 then
				local v222 = error
				local v223 = tostring(v221)
				local v224, v225 = string.match(v223, "^(.*:%d+): (.+)$")
				if v224 then
					v223 = v225 or v223
				end
				v222(v223, 2)
			end
			return v221
		end
	end,
	["Default"] = function(p_u_226, p227)
		if type(p_u_226) ~= "function" then
			error("function", 2)
		end
		local v_u_228 = p_u_226(p227)
		return function(p229)
			-- upvalues: (copy) v_u_228, (copy) p_u_226
			if p229 == nil then
				return v_u_228
			end
			local v230, v231 = pcall(p_u_226, p229)
			if not v230 then
				local v232 = error
				local v233 = tostring(v231)
				local v234, v235 = string.match(v233, "^(.*:%d+): (.+)$")
				if v234 then
					v233 = v235 or v233
				end
				v232(v233, 2)
			end
			return v231
		end
	end,
	["AnyOf"] = function(...)
		local v_u_236 = table.pack(...)
		for v237 = 1, v_u_236.n do
			local v238 = v_u_236[v237]
			local v239 = type(v238) == "function"
			assert(v239, "function")
		end
		local v240 = v_u_236.n > 0
		assert(v240)
		return function(p241)
			-- upvalues: (copy) v_u_236
			for v242 = 1, v_u_236.n do
				local v243, v244 = pcall(v_u_236[v242], p241)
				if v243 then
					return v244
				end
			end
			error("AnyOf", 2)
		end
	end,
	["AllOf"] = function(...)
		local v_u_245 = table.pack(...)
		for v246 = 1, v_u_245.n do
			local v247 = v_u_245[v246]
			local v248 = type(v247) == "function"
			assert(v248, "function")
		end
		local v249 = v_u_245.n > 0
		assert(v249)
		return function(p250)
			-- upvalues: (copy) v_u_245
			for v251 = 1, v_u_245.n do
				local v252, v253 = pcall(v_u_245[v251], p250)
				if not v252 then
					local v254 = error
					local v255 = tostring(v253)
					local v256, v257 = string.match(v255, "^(.*:%d+): (.+)$")
					if v256 then
						v255 = v257 or v255
					end
					v254(v255, 2)
				end
			end
			return p250
		end
	end,
	["AnyTable"] = function(p258)
		if type(p258) ~= "table" then
			error("table", 2)
		end
		return p258
	end,
	["Number"] = function(p259)
		if type(p259) ~= "number" then
			error("number", 2)
		end
		return p259
	end,
	["Boolean"] = function(p260)
		if type(p260) ~= "boolean" then
			error("boolean", 2)
		end
		return p260
	end,
	["Buffer"] = function(p261)
		if type(p261) ~= "buffer" then
			error("buffer", 2)
		end
		return p261
	end,
	["Function"] = function(p262)
		if type(p262) ~= "function" then
			error("function", 2)
		end
		return p262
	end,
	["Thread"] = function(p263)
		if type(p263) ~= "thread" then
			error("thread", 2)
		end
		return p263
	end,
	["String"] = function(p264)
		if type(p264) ~= "string" then
			error("string", 2)
		end
		if not utf8.len(p264) then
			error("UTF8", 2)
		end
		return p264
	end,
	["RawString"] = function(p265)
		if type(p265) ~= "string" then
			error("string", 2)
		end
		return p265
	end,
	["Any"] = function(p266)
		return p266
	end,
	["Equals"] = function(p_u_267)
		return function(p268)
			-- upvalues: (copy) p_u_267
			local v269 = p_u_267
			if not rawequal(p268, v269) and (type(p268) ~= "number" or (type(v269) ~= "number" or (p268 == p268 or v269 == v269))) then
				error("Equals", 2)
			end
			return p268
		end
	end,
	["Set"] = function(p270)
		-- upvalues: (copy) v_u_382
		v_u_382.Array(v_u_382.Any)
		local v_u_271 = {}
		for _, v272 in ipairs(p270) do
			if v272 ~= v272 then
				error("InvalidKeyNaN", 2)
			end
			v_u_271[v272] = true
			if not v_u_271[v272] then
				error("InvalidKey", 2)
			end
		end
		return function(p273)
			-- upvalues: (copy) v_u_271
			if not v_u_271[p273] then
				error("Set", 2)
			end
			return p273
		end
	end,
	["Pattern"] = function(p_u_274)
		-- upvalues: (copy) v_u_382
		v_u_382.String(p_u_274)
		return function(p275)
			-- upvalues: (copy) p_u_274
			if type(p275) ~= "string" then
				error("string", 2)
			end
			if not utf8.len(p275) then
				error("UTF8", 2)
			end
			if not string.find(p275, p_u_274) then
				error("Pattern", 2)
			end
			return p275
		end
	end,
	["NoMetatable"] = function(p276)
		if type(p276) ~= "table" then
			error("table", 2)
		end
		if getmetatable(p276) ~= nil then
			error("metatable", 2)
		end
		return p276
	end,
	["Finite"] = function(p277)
		if type(p277) ~= "number" then
			error("number", 2)
		end
		local v278
		if p277 == p277 and p277 ~= (1 / 0) then
			v278 = p277 ~= (-1 / 0)
		else
			v278 = false
		end
		if not v278 then
			error("Finite", 2)
		end
		return p277
	end,
	["FinitePositive"] = function(p279)
		if type(p279) ~= "number" then
			error("number", 2)
		end
		local v280
		if p279 == p279 and p279 ~= (1 / 0) then
			v280 = p279 ~= (-1 / 0)
		else
			v280 = false
		end
		if not v280 then
			error("Finite", 2)
		end
		if p279 <= 0 then
			error("Positive", 2)
		end
		return p279
	end,
	["FiniteNonNegative"] = function(p281)
		if type(p281) ~= "number" then
			error("number", 2)
		end
		local v282
		if p281 == p281 and p281 ~= (1 / 0) then
			v282 = p281 ~= (-1 / 0)
		else
			v282 = false
		end
		if not v282 then
			error("Finite", 2)
		end
		if p281 < 0 then
			error("NonNegative", 2)
		end
		return p281
	end,
	["Positive"] = function(p283)
		if type(p283) ~= "number" then
			error("number", 2)
		end
		if p283 <= 0 then
			error("Positive", 2)
		end
		return p283
	end,
	["NonNegative"] = function(p284)
		if type(p284) ~= "number" then
			error("number", 2)
		end
		if p284 < 0 then
			error("NonNegative", 2)
		end
		return p284
	end,
	["Real"] = function(p285)
		if type(p285) ~= "number" then
			error("number", 2)
		end
		if p285 ~= p285 then
			error("Real", 2)
		end
		return p285
	end,
	["Range"] = function(p_u_286, p_u_287)
		-- upvalues: (copy) v_u_382
		v_u_382.Real(p_u_286)
		v_u_382.Real(p_u_287)
		if p_u_286 > p_u_287 then
			error("a<=b", 2)
		end
		return function(p288)
			-- upvalues: (copy) p_u_286, (copy) p_u_287
			if type(p288) ~= "number" then
				error("number", 2)
			end
			if p_u_286 > p288 or p288 > p_u_287 then
				error(("Range(%*,%*)"):format(p_u_286, p_u_287), 2)
			end
			return p288
		end
	end,
	["Integer"] = function(p289)
		if type(p289) ~= "number" then
			error("number", 2)
		end
		local v290
		if math.floor(p289) == p289 and p289 ~= (1 / 0) then
			v290 = p289 ~= (-1 / 0)
		else
			v290 = false
		end
		if not v290 then
			error("Integer", 2)
		end
		return p289
	end,
	["Unsigned32"] = function(p291)
		if bit32.bor(p291, 0) ~= p291 then
			error("Unsigned32", 2)
		end
		return p291
	end,
	["IntegerPositive"] = function(p292)
		if type(p292) ~= "number" then
			error("number", 2)
		end
		local v293
		if math.floor(p292) == p292 and p292 ~= (1 / 0) then
			v293 = p292 ~= (-1 / 0)
		else
			v293 = false
		end
		if not v293 then
			error("Integer", 2)
		end
		if p292 < 1 then
			error("Positive", 2)
		end
		return p292
	end,
	["Index"] = function(p294)
		if type(p294) ~= "number" then
			error("number", 2)
		end
		local v295
		if math.floor(p294) == p294 and p294 ~= (1 / 0) then
			v295 = p294 ~= (-1 / 0)
		else
			v295 = false
		end
		if not v295 then
			error("Integer", 2)
		end
		if p294 < 1 then
			error("Positive", 2)
		end
		return p294
	end,
	["IntegerNonNegative"] = function(p296)
		if type(p296) ~= "number" then
			error("number", 2)
		end
		local v297
		if math.floor(p296) == p296 and p296 ~= (1 / 0) then
			v297 = p296 ~= (-1 / 0)
		else
			v297 = false
		end
		if not v297 then
			error("Integer", 2)
		end
		if p296 < 0 then
			error("NonNegative", 2)
		end
		return p296
	end,
	["IntegerRange"] = function(p_u_298, p_u_299)
		-- upvalues: (copy) v_u_382
		v_u_382.Integer(p_u_298)
		v_u_382.Integer(p_u_299)
		if p_u_298 > p_u_299 then
			error("a<=b", 2)
		end
		return function(p300)
			-- upvalues: (copy) p_u_298, (copy) p_u_299
			if type(p300) ~= "number" then
				error("number", 2)
			end
			local v301
			if math.floor(p300) == p300 and p300 ~= (1 / 0) then
				v301 = p300 ~= (-1 / 0)
			else
				v301 = false
			end
			if not v301 then
				error("Integer", 2)
			end
			if p_u_298 > p300 or p300 > p_u_299 then
				error(("Range(%*,%*)"):format(p_u_298, p_u_299), 2)
			end
			return p300
		end
	end,
	["UInt32"] = function()
		return function(p302)
			if type(p302) ~= "number" then
				error("number", 2)
			end
			if bit32.bor(p302, 0) ~= p302 then
				error("UInt32", 2)
			end
			return p302
		end
	end,
	["StringRange"] = function(p_u_303, p_u_304)
		-- upvalues: (copy) v_u_382
		v_u_382.Integer(p_u_303)
		v_u_382.Integer(p_u_304)
		if p_u_303 > p_u_304 then
			error("a<=b", 2)
		end
		return function(p305)
			-- upvalues: (copy) p_u_303, (copy) p_u_304
			if type(p305) ~= "string" then
				error("string", 2)
			end
			local v306 = utf8.len(p305)
			if not v306 then
				error("UTF8", 2)
			end
			if p_u_303 > v306 or v306 > p_u_304 then
				error(("StringRange(%*,%*)"):format(p_u_303, p_u_304), 2)
			end
			return p305
		end
	end,
	["ASCII"] = function(p307)
		if type(p307) ~= "string" then
			error("string", 2)
		end
		for v308 = 1, string.len(p307) do
			local v309 = string.byte(p307, v308)
			if v309 < 32 or v309 > 126 then
				error("ASCII", 2)
			end
		end
		return p307
	end,
	["ASCIIRange"] = function(p_u_310, p_u_311)
		-- upvalues: (copy) v_u_382
		v_u_382.Integer(p_u_310)
		v_u_382.Integer(p_u_311)
		if p_u_310 > p_u_311 then
			error("a<=b", 2)
		end
		return function(p312)
			-- upvalues: (copy) p_u_310, (copy) p_u_311
			if type(p312) ~= "string" then
				error("string", 2)
			end
			local v313 = string.len(p312)
			if p_u_310 > v313 or v313 > p_u_311 then
				error(("ASCIIRange(%*,%*)"):format(p_u_310, p_u_311), 2)
			end
			for v314 = 1, v313 do
				local v315 = string.byte(p312, v314)
				if v315 < 32 or v315 > 126 then
					error("ASCII", 2)
				end
			end
			return p312
		end
	end,
	["CFrame"] = function(p316)
		if typeof(p316) ~= "CFrame" then
			error("CFrame", 2)
		end
		return p316
	end,
	["CFrameFinite"] = function(p317)
		if typeof(p317) ~= "CFrame" then
			error("CFrame", 2)
		end
		local v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329 = p317:GetComponents()
		local v330 = v318 + v319 + v320 + v321 + v322 + v323 + v324 + v325 + v326 + v327 + v328 + v329
		local v331
		if v330 == v330 and v330 ~= (1 / 0) then
			v331 = v330 ~= (-1 / 0)
		else
			v331 = false
		end
		if not v331 then
			error("CFrameFinite", 2)
		end
		return p317
	end,
	["Vector2"] = function(p332)
		if typeof(p332) ~= "Vector2" then
			error("Vector2", 2)
		end
		return p332
	end,
	["Vector2Finite"] = function(p333)
		if typeof(p333) ~= "Vector2" then
			error("Vector2", 2)
		end
		local v334 = p333.X + p333.Y
		local v335
		if v334 == v334 and v334 ~= (1 / 0) then
			v335 = v334 ~= (-1 / 0)
		else
			v335 = false
		end
		if not v335 then
			error("Vector2Finite", 2)
		end
		return p333
	end,
	["Vector2Unit"] = function(p336)
		if typeof(p336) ~= "Vector2" then
			error("Vector2", 2)
		end
		local v337 = p336.X + p336.Y
		local v338
		if v337 == v337 and v337 ~= (1 / 0) then
			v338 = v337 ~= (-1 / 0)
		else
			v338 = false
		end
		if not v338 then
			error("Vector2Finite", 2)
		end
		local v339 = p336.Magnitude - 1
		if math.abs(v339) > 1e-6 then
			error("Vector2Unit", 2)
		end
		return p336
	end,
	["Vector3"] = function(p340)
		if typeof(p340) ~= "Vector3" then
			error("Vector3", 2)
		end
		return p340
	end,
	["Vector3Finite"] = function(p341)
		if typeof(p341) ~= "Vector3" then
			error("Vector3", 2)
		end
		local v342 = p341.X + p341.Y + p341.Z
		local v343
		if v342 == v342 and v342 ~= (1 / 0) then
			v343 = v342 ~= (-1 / 0)
		else
			v343 = false
		end
		if not v343 then
			error("Vector3Finite", 2)
		end
		return p341
	end,
	["Vector3Unit"] = function(p344)
		if typeof(p344) ~= "Vector3" then
			error("Vector3", 2)
		end
		local v345 = p344.X + p344.Y + p344.Z
		local v346
		if v345 == v345 and v345 ~= (1 / 0) then
			v346 = v345 ~= (-1 / 0)
		else
			v346 = false
		end
		if not v346 then
			error("Vector3Finite", 2)
		end
		local v347 = p344.Magnitude - 1
		if math.abs(v347) > 1e-6 then
			error("Vector3Unit", 2)
		end
		return p344
	end,
	["Vector3Positive"] = function(p348)
		if typeof(p348) ~= "Vector3" then
			error("Vector3", 2)
		end
		local v349 = p348.X + p348.Y + p348.Z
		local v350
		if v349 == v349 and v349 ~= (1 / 0) then
			v350 = v349 ~= (-1 / 0)
		else
			v350 = false
		end
		if not v350 then
			error("Vector3Finite", 2)
		end
		if p348.X <= 0 or (p348.Y <= 0 or p348.Z <= 0) then
			error("Vector3Positive")
		end
		return p348
	end,
	["Vector3int16"] = function(p351)
		if typeof(p351) ~= "Vector3int16" then
			error("Vector3int16", 2)
		end
		return p351
	end,
	["Vector2int16"] = function(p352)
		if typeof(p352) ~= "Vector2int16" then
			error("Vector2int16", 2)
		end
		return p352
	end,
	["Region3"] = function(p353)
		if typeof(p353) ~= "Region3" then
			error("Region3", 2)
		end
		return p353
	end,
	["Region3int16"] = function(p354)
		if typeof(p354) ~= "Region3int16" then
			error("Region3int16", 2)
		end
		return p354
	end,
	["UDim"] = function(p355)
		if typeof(p355) ~= "UDim" then
			error("UDim", 2)
		end
		return p355
	end,
	["UDim2"] = function(p356)
		if typeof(p356) ~= "UDim2" then
			error("UDim2", 2)
		end
		return p356
	end,
	["Rect"] = function(p357)
		if typeof(p357) ~= "Rect" then
			error("Rect", 2)
		end
		return p357
	end,
	["PhysicalProperties"] = function(p358)
		if typeof(p358) ~= "PhysicalProperties" then
			error("PhysicalProperties", 2)
		end
		return p358
	end,
	["Storable"] = function(p359, p360)
		-- upvalues: (copy) v_u_9, (copy) v_u_382
		if type(p359) == "boolean" then
			return p359
		end
		if type(p359) == "number" then
			return p359
		end
		if type(p359) == "string" then
			if not utf8.len(p359) then
				error("UTF8", 2)
				return p359
			end
		else
			if type(p359) == "buffer" then
				return p359
			end
			if type(p359) == "table" then
				if type(p359) ~= "table" then
					error("table", 2)
				end
				if getmetatable(p359) ~= nil then
					error("metatable", 2)
				end
				local v361 = p360 or {}
				if v361[p359] then
					error("Loop", 2)
				end
				v361[p359] = true
				local v362 = rawlen(p359)
				if v362 <= 0 then
					for v363, v364 in pairs(p359) do
						if type(v363) ~= "string" then
							error(("KeyString $%*"):format((("[%*]"):format((v_u_9(v363))))), 2)
						end
						if not utf8.len(v363) then
							error(("KeyUTF8 $%*"):format((("[%*]"):format((v_u_9(v363))))), 2)
						end
						local v365, v366 = pcall(v_u_382.Storable, v364, v361)
						if not v365 then
							local v367 = tostring(v366)
							local v368, v369 = string.match(v367, "^(.*:%d+): (.+)$")
							if v368 then
								v367 = v369 or v367
							end
							local v370, v371 = string.match(v367, "^(.+) $(%[.+)$")
							if v370 then
								if not v371 then
									v370 = v367
								end
							else
								v370 = v367
							end
							error(("%* $%*"):format(v370, (("[%*]%*"):format(v_u_9(v363), v371 or ""))), 2)
						end
					end
					return p359
				end
				local v372 = 0
				for v373, v374 in pairs(p359) do
					v372 = v372 + 1
					if v373 ~= v372 then
						error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v373))))), 2)
					end
					if v362 < v372 then
						error(("IndexOverflow $%*"):format((("[%*]"):format(v372))), 2)
					end
					local v375, v376 = pcall(v_u_382.Storable, v374, v361)
					if not v375 then
						local v377 = tostring(v376)
						local v378, v379 = string.match(v377, "^(.*:%d+): (.+)$")
						if v378 then
							v377 = v379 or v377
						end
						local v380, v381 = string.match(v377, "^(.+) $(%[.+)$")
						if v380 then
							if not v381 then
								v380 = v377
							end
						else
							v380 = v377
						end
						error(("%* $%*"):format(v380, (("[%*]%*"):format(v372, v381 or ""))), 2)
					end
				end
				if v362 ~= v372 then
					error("LengthMismatch", 2)
					return p359
				end
			else
				error("Storable", 2)
			end
		end
		return p359
	end
}
local v_u_383 = {
	["boolean"] = true,
	["number"] = true,
	["string"] = true,
	["buffer"] = true,
	["Color3"] = true,
	["Instance"] = true,
	["NumberRange"] = true,
	["Rect"] = true,
	["Region3"] = true,
	["Region3int16"] = true,
	["UDim"] = true,
	["UDim2"] = true,
	["CFrame"] = true,
	["Vector2"] = true,
	["Vector2int16"] = true,
	["Vector3"] = true,
	["Vector3int16"] = true,
	["EnumItem"] = true
}
table.freeze(v_u_383)
function v_u_382.Networkable(p384, p385)
	-- upvalues: (copy) v_u_9, (copy) v_u_382, (copy) v_u_383
	if type(p384) == "string" then
		if not utf8.len(p384) then
			error("UTF8", 2)
			return p384
		end
	elseif type(p384) == "table" then
		if type(p384) ~= "table" then
			error("table", 2)
		end
		if getmetatable(p384) ~= nil then
			error("metatable", 2)
		end
		local v386 = p385 or {}
		if v386[p384] then
			error("Loop", 2)
		end
		v386[p384] = true
		local v387 = rawlen(p384)
		if v387 <= 0 then
			for v388, v389 in pairs(p384) do
				if type(v388) ~= "string" then
					error(("KeyString $%*"):format((("[%*]"):format((v_u_9(v388))))), 2)
				end
				if not utf8.len(v388) then
					error(("KeyUTF8 $%*"):format((("[%*]"):format((v_u_9(v388))))), 2)
				end
				local v390, v391 = pcall(v_u_382.Networkable, v389, v386)
				if not v390 then
					local v392 = tostring(v391)
					local v393, v394 = string.match(v392, "^(.*:%d+): (.+)$")
					if v393 then
						v392 = v394 or v392
					end
					local v395, v396 = string.match(v392, "^(.+) $(%[.+)$")
					if v395 then
						if not v396 then
							v395 = v392
						end
					else
						v395 = v392
					end
					error(("%* $%*"):format(v395, (("[%*]%*"):format(v_u_9(v388), v396 or ""))), 2)
				end
			end
			return p384
		end
		local v397 = 0
		for v398, v399 in pairs(p384) do
			v397 = v397 + 1
			if v398 ~= v397 then
				error(("IndexMismatch $%*"):format((("[%*]"):format((v_u_9(v398))))), 2)
			end
			if v387 < v397 then
				error(("IndexOverflow $%*"):format((("[%*]"):format(v397))), 2)
			end
			local v400, v401 = pcall(v_u_382.Networkable, v399, v386)
			if not v400 then
				local v402 = tostring(v401)
				local v403, v404 = string.match(v402, "^(.*:%d+): (.+)$")
				if v403 then
					v402 = v404 or v402
				end
				local v405, v406 = string.match(v402, "^(.+) $(%[.+)$")
				if v405 then
					if not v406 then
						v405 = v402
					end
				else
					v405 = v402
				end
				error(("%* $%*"):format(v405, (("[%*]%*"):format(v397, v406 or ""))), 2)
			end
		end
		if v387 ~= v397 then
			error("LengthMismatch", 2)
			return p384
		end
	elseif not v_u_383[typeof(p384)] then
		error("Networkable", 2)
	end
	return p384
end
function v_u_382.Enum(p_u_407)
	if typeof(p_u_407) ~= "Enum" then
		error("Enum", 2)
	end
	return function(p408)
		-- upvalues: (copy) p_u_407
		if typeof(p408) ~= "EnumItem" then
			error("EnumItem", 2)
		end
		if p408.EnumType ~= p_u_407 then
			local v409 = p_u_407
			error(tostring(v409), 2)
		end
		return p408
	end
end
function v_u_382.EnumValue(p410)
	if typeof(p410) ~= "Enum" then
		error("Enum", 2)
	end
	local v_u_411 = {}
	for _, v412 in ipairs(p410:GetEnumItems()) do
		v_u_411[v412.Value] = v412
	end
	return function(p413)
		-- upvalues: (copy) v_u_411
		if typeof(p413) ~= "number" then
			error("number", 2)
		end
		if not v_u_411[p413] then
			error("EnumValue", 2)
		end
		return p413
	end
end
function v_u_382.Player(p414)
	if typeof(p414) ~= "Instance" or not p414:IsA("Player") then
		error("Player", 2)
	end
	return p414
end
function v_u_382.BasePart(p415)
	if typeof(p415) ~= "Instance" or not p415:IsA("BasePart") then
		error("BasePart", 2)
	end
	return p415
end
function v_u_382.Part(p416)
	if typeof(p416) ~= "Instance" or not p416:IsA("Part") then
		error("Part", 2)
	end
	return p416
end
function v_u_382.MeshPart(p417)
	if typeof(p417) ~= "Instance" or not p417:IsA("MeshPart") then
		error("MeshPart", 2)
	end
	return p417
end
function v_u_382.Model(p418)
	if typeof(p418) ~= "Instance" or not p418:IsA("Model") then
		error("Model", 2)
	end
	return p418
end
function v_u_382.Animation(p419)
	if typeof(p419) ~= "Instance" or not p419:IsA("Animation") then
		error("Animation", 2)
	end
	return p419
end
function v_u_382.Humanoid(p420)
	if typeof(p420) ~= "Instance" or not p420:IsA("Humanoid") then
		error("Humanoid", 2)
	end
	return p420
end
function v_u_382.ParticleEmitter(p421)
	if typeof(p421) ~= "Instance" or not p421:IsA("ParticleEmitter") then
		error("ParticleEmitter", 2)
	end
	return p421
end
function v_u_382.Sound(p422)
	if typeof(p422) ~= "Instance" or not p422:IsA("Sound") then
		error("Sound", 2)
	end
	return p422
end
function v_u_382.Instance(p423)
	if typeof(p423) ~= "Instance" then
		error("Instance", 2)
	end
	return p423
end
function v_u_382.InstanceOf(p_u_424)
	-- upvalues: (copy) v_u_382
	v_u_382.String(p_u_424)
	return function(p425)
		-- upvalues: (copy) p_u_424
		if typeof(p425) ~= "Instance" then
			error("Instance", 2)
		end
		if not p425:IsA(p_u_424) then
			error(p_u_424, 2)
		end
		return p425
	end
end
function v_u_382.InstanceClass(p_u_426)
	-- upvalues: (copy) v_u_382
	v_u_382.String(p_u_426)
	return function(p427)
		-- upvalues: (copy) p_u_426
		if typeof(p427) ~= "Instance" then
			error("Instance", 2)
		end
		if p427.ClassName ~= p_u_426 then
			error(p_u_426, 2)
		end
		return p427
	end
end
function v_u_382.HexLower(p428)
	if type(p428) ~= "string" then
		error("string", 2)
	end
	for v429 = 1, string.len(p428) do
		local v430 = string.byte(p428, v429)
		if (v430 < 48 or v430 > 57) and (v430 < 97 or v430 > 102) then
			error("HexLower", 2)
		end
	end
	return p428
end
function v_u_382.HexUpper(p431)
	if type(p431) ~= "string" then
		error("string", 2)
	end
	for v432 = 1, string.len(p431) do
		local v433 = string.byte(p431, v432)
		if (v433 < 48 or v433 > 57) and (v433 < 65 or v433 > 70) then
			error("HexUpper", 2)
		end
	end
	return p431
end
function v_u_382.UUIDStripped(p434)
	if type(p434) ~= "string" then
		error("string", 2)
	end
	local v435 = string.len(p434)
	if v435 ~= 32 then
		error("Length32", 2)
	end
	for v436 = 1, v435 do
		local v437 = string.byte(p434, v436)
		if (v437 < 48 or v437 > 57) and (v437 < 97 or v437 > 102) then
			error("HexLower", 2)
		end
	end
	return p434
end
function v_u_382.UUID(p438)
	if type(p438) ~= "string" then
		error("string", 2)
	end
	if string.len(p438) ~= 36 then
		error("Length36", 2)
	end
	if not p438:find("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
		error("UUID", 2)
	end
	return p438
end
function v_u_382.Base64(p439)
	if type(p439) ~= "string" then
		error("string", 2)
	end
	if string.len(p439) % 4 ~= 0 then
		error("Base64Length", 2)
	end
	if not string.match(p439, "^[A-Za-z0-9+/]*=?=?$") or string.match(p439, "[^=]=+[^=]") then
		error("Base64", 2)
	end
	return p439
end
function v_u_382.ToNumber(p_u_440)
	return function(p441)
		-- upvalues: (copy) p_u_440
		local v442 = tonumber(p441)
		if not v442 then
			error("tonumber", 2)
		end
		local v443, v444 = pcall(p_u_440, v442)
		if not v443 then
			local v445 = error
			local v446 = tostring(v444)
			local v447, v448 = string.match(v446, "^(.*:%d+): (.+)$")
			if v447 then
				v446 = v448 or v446
			end
			v445(v446, 2)
		end
		return v444
	end
end
function v_u_382.IsoDate(p449)
	if not DateTime.fromIsoDate(p449) then
		error("IsoDate", 2)
	end
	return p449
end
return table.freeze(v_u_382)