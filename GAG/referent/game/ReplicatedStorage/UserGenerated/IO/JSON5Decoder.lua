local v_u_1 = {
	"\225\154\128",
	"\226\128\128",
	"\226\128\129",
	"\226\128\130",
	"\226\128\131",
	"\226\128\132",
	"\226\128\133",
	"\226\128\134",
	"\226\128\135",
	"\226\128\136",
	"\226\128\137",
	"\226\128\138",
	"\226\128\168",
	"\226\128\169",
	"\226\128\175",
	"\226\129\159",
	"\227\128\128",
	"\194\160",
	"\r\n",
	"\t",
	"\n",
	"\11",
	"\f",
	"\r",
	" "
}
local v2 = {}
local v_u_3 = {
	"\226\128\168",
	"\226\128\169",
	"\r\n",
	"\r",
	"\n"
}
for _, v4 in ipairs(v_u_1) do
	v2[v4] = true
end
local v_u_5 = {}
for _, v6 in ipairs(v_u_3) do
	v_u_5[v6] = true
end
local v_u_7 = {
	["0"] = "\0",
	["\'"] = "\'",
	["\""] = "\"",
	["\\"] = "\\",
	["b"] = "\8",
	["f"] = "\f",
	["n"] = "\n",
	["r"] = "\r",
	["t"] = "\t",
	["v"] = "\11"
}
local function v_u_10(p8, p9)
	return string.format("%s at line %d col %d", p8, p9[1], p9[2])
end
local function v_u_15(p11, p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	for _, v13 in ipairs(v_u_3) do
		if p11:sub(1, #v13) == v13 then
			local v14
			if v_u_5[v13] then
				p12[1] = p12[1] + 1
				p12[2] = 1
				v14 = true
			else
				v14 = false
			end
			if v14 then
				return v13
			end
		end
	end
	return nil
end
local function v_u_19(p16, p17)
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	if #p16 == 0 then
		return nil
	end
	for _, v18 in ipairs(v_u_1) do
		if p16:sub(1, #v18) == v18 then
			p17[2] = p17[2] + #v18
			if not v_u_5[v18] then
				return v18
			end
			p17[1] = p17[1] + 1
			p17[2] = 1
			return v18
		end
	end
	return nil
end
local function v_u_23(p20, p21)
	-- upvalues: (copy) v_u_19
	while true do
		local v22 = v_u_19(p20, p21)
		if v22 == nil then
			break
		end
		p20 = p20:sub(#v22 + 1)
	end
	return p20
end
local function v_u_27(p24, p25)
	-- upvalues: (copy) v_u_15
	while #p24 ~= 0 do
		local v26 = v_u_15(p24, p25)
		if v26 then
			return p24:sub(#v26 + 1)
		end
		p24 = p24:sub(2)
		p25[2] = p25[2] + 1
	end
	return p24
end
local function v_u_31(p28, p29)
	-- upvalues: (copy) v_u_15, (copy) v_u_10
	while #p28 > 0 do
		if p28:sub(1, 2) == "*/" then
			p29[2] = p29[2] + 2
			return p28:sub(3)
		end
		local v30 = v_u_15(p28, p29)
		if v30 then
			p28 = p28:sub(#v30 + 1)
		else
			p29[2] = p29[2] + 1
			p28 = p28:sub(2)
		end
	end
	error(v_u_10("missing multiline comment close tag", p29))
	return ""
end
local function v_u_48(p32)
	if p32 <= 127 then
		return string.char(p32)
	end
	if p32 <= 2047 then
		local v33 = p32 / 64
		local v34 = math.floor(v33) + 192
		local v35 = p32 % 64 + 128
		return string.char(v34, v35)
	end
	if p32 <= 65535 then
		local v36 = p32 / 4096
		local v37 = math.floor(v36) + 224
		local v38 = p32 % 4096 / 64
		local v39 = math.floor(v38) + 128
		local v40 = p32 % 64 + 128
		return string.char(v37, v39, v40)
	end
	if p32 > 1114111 then
		return nil, string.format("invalid unicode codepoint \'%x\'", p32)
	end
	local v41 = p32 / 262144
	local v42 = math.floor(v41) + 240
	local v43 = p32 % 262144 / 4096
	local v44 = math.floor(v43) + 128
	local v45 = p32 % 4096 / 64
	local v46 = math.floor(v45) + 128
	local v47 = p32 % 64 + 128
	return string.char(v42, v44, v46, v47)
end
local function v_u_53(p49, p50)
	-- upvalues: (copy) v_u_10
	local v51 = p49:match("^\\u(%x%x%x%x)")
	if not v51 then
		error(v_u_10("invalid unicode hex escape sequence", p50))
	end
	local v52 = tonumber(v51, 16)
	if not v52 then
		error(v_u_10("invalid unicode hex escape sequence", p50))
	end
	p50[2] = p50[2] + 6
	return v52, p49:sub(7)
end
local function v_u_63(p54, p55)
	-- upvalues: (copy) v_u_53, (copy) v_u_48, (copy) v_u_10
	local v56 = p55[1]
	local v57 = p55[2]
	local v58, v59 = v_u_53(p54, p55)
	if v58 >= 55296 and v58 < 56320 then
		local v60
		v60, v59 = v_u_53(v59, p55)
		if v60 and (v60 >= 56320 and v60 <= 57343) then
			v58 = (v58 - 55296) * 1024 + (v60 - 56320) + 65536
		end
	end
	local v61, v62 = v_u_48(v58)
	if not v61 then
		error(v_u_10(assert(v62), { v56, v57 }))
	end
	return v61, v59
end
local function v_u_75(p64, p65, p66, p67)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_63, (copy) v_u_15
	local v68 = {}
	while not p65(p64) do
		local v69 = p64:sub(1, 1)
		if v69 == "\\" then
			local v70 = p64:sub(2, 2)
			p67[2] = p67[2] + 1
			if v_u_7[v70] then
				p67[2] = p67[2] + 1
				if p66 then
					error(v_u_10("escape sequence not allowed", p67))
				end
				v68[#v68 + 1] = v_u_7[v70]
				p64 = p64:sub(3)
			elseif v70 == "u" then
				local v71
				v71, p64 = v_u_63(p64, p67)
				v68[#v68 + 1] = v71
			elseif v70 == "x" then
				if p66 then
					error(v_u_10("hex escape sequence not allowed", p67))
				end
				p67[2] = p67[2] + 2
				local v72 = p64:sub(2, 3)
				local v73 = tonumber(v72, 16)
				if not v73 then
					error(v_u_10("invalid hex escape sequence", p67))
				end
				v68[#v68 + 1] = string.char(v73)
				p67[2] = p67[2] + 2
				p64 = p64:sub(5)
			else
				if p66 then
					error(v_u_10("invalid escape sequence", p67))
				end
				local v74 = v_u_15(p64:sub(2), p67)
				p64 = p64:sub(not v74 and 2 or #v74 + 2)
			end
		elseif v69:byte(1, 1) < 32 then
			error(v_u_10("control character found", p67))
		else
			v68[#v68 + 1] = v69
			p64 = p64:sub(2)
			p67[2] = p67[2] + 1
		end
	end
	return table.concat(v68), p64
end
local function v_u_82(p76, p77)
	-- upvalues: (copy) v_u_75
	local v_u_78 = p76:sub(1, 1)
	local v80, v81 = v_u_75(p76:sub(2), function(p79)
		-- upvalues: (copy) v_u_78
		return p79:sub(1, 1) == v_u_78
	end, false, p77)
	p77[2] = p77[2] + 1
	return v80, v81:sub(2)
end
local function v94(p83, p84)
	-- upvalues: (copy) v_u_19, (copy) v_u_10
	local v85 = 1
	local v86 = p83:sub(1, 1)
	local v87 = p84[1]
	local v88 = p84[2]
	if v86 == "+" then
		p83 = p83:sub(2)
		p84[2] = p84[2] + 1
		v85 = 1
	elseif v86 == "-" then
		p83 = p83:sub(2)
		p84[2] = p84[2] + 1
		v85 = -1
	end
	if p83:sub(1, 3) == "NaN" then
		p84[2] = p84[2] + 3
		return (0 / 0), p83:sub(4)
	end
	if p83:find("Infinity", 1, true) == 1 then
		p84[2] = p84[2] + 8
		return (1 / 0) * v85, p83:sub(9)
	end
	local v89 = p83
	local v90 = 0
	while not v_u_19(p83, p84) do
		local v91 = p83:sub(1, 1)
		if v91 == "" or (v91 == "," or (v91 == "]" or v91 == "}")) then
			break
		end
		v90 = v90 + 1
		p83 = p83:sub(2)
		p84[2] = p84[2] + 1
	end
	local v92 = v89:sub(1, v90)
	local v93
	if v92:sub(1, 1) == "0" and v92:sub(2):find("^%d+$") then
		v93 = nil
	else
		v93 = tonumber(v92)
	end
	if v93 == nil then
		error(v_u_10("invalid number sequence " .. string.format("%q", v92):gsub("\r", "\\r"):gsub("\n", "\\n"), { v87, v88 }))
	end
	p84[2] = p84[2] + v90
	return v93 * v85, v89:sub(v90 + 1)
end
local function v97(p95, p96)
	-- upvalues: (copy) v_u_10
	if p95:sub(1, 4) == "true" then
		p96[2] = p96[2] + 4
		return true, p95:sub(5)
	end
	if p95:sub(1, 5) == "false" then
		p96[2] = p96[2] + 5
		return false, p95:sub(6)
	end
	error(v_u_10("invalid boolean literal", p96))
end
local function v_u_101(p98, p99)
	-- upvalues: (copy) v_u_27, (copy) v_u_31
	local v100 = p98:sub(1, 2)
	if v100 == "//" then
		p99[2] = p99[2] + 2
		return v_u_27(p98:sub(3), p99)
	end
	if v100 ~= "/*" then
		return p98
	end
	p99[2] = p99[2] + 2
	return v_u_31(p98:sub(3), p99)
end
local function v_u_105(p102, p103)
	-- upvalues: (copy) v_u_23, (copy) v_u_101
	while true do
		local v104 = v_u_101(v_u_23(p102, p103), p103)
		if v104 == p102 then
			break
		end
		p102 = v104
	end
	return p102
end
local v_u_106 = nil
local function v_u_111(p107)
	local v108 = p107:byte(1, 1)
	if v108 >= 48 and v108 <= 57 then
		return false
	end
	for v109 = 1, #p107 do
		local v110 = p107:byte(v109, v109)
		if v110 < 36 then
			return false
		end
		if v110 >= 37 and v110 <= 47 then
			return false
		end
		if v110 >= 58 and v110 <= 64 then
			return false
		end
		if v110 >= 91 and v110 <= 94 then
			return false
		end
		if v110 == 96 then
			return false
		end
		if v110 >= 123 and v110 <= 128 then
			return false
		end
	end
	return true
end
local function v_u_113(p112)
	-- upvalues: (copy) v_u_19
	return p112:sub(1, 1) == ":" and true or v_u_19(p112, { 0, 0 }) ~= nil
end
local function v_u_121(p114, p115)
	-- upvalues: (copy) v_u_82, (copy) v_u_75, (copy) v_u_113, (copy) v_u_111, (copy) v_u_10
	local v116 = p114:sub(1, 1)
	local v117, v118
	if v116 == "\'" or v116 == "\"" then
		v117, v118 = v_u_82(p114, p115)
	else
		local v119 = p115[1]
		local v120 = p115[2]
		v117, v118 = v_u_75(p114, v_u_113, true, p115)
		if not v_u_111(v117) then
			error(v_u_10("invalid identifier " .. string.format("%q", v117):gsub("\r", "\\r"):gsub("\n", "\\n"), { v119, v120 }))
		end
	end
	return v117, v118
end
local v_u_152 = {
	["-"] = v94,
	["+"] = v94,
	["."] = v94,
	["0"] = v94,
	["1"] = v94,
	["2"] = v94,
	["3"] = v94,
	["4"] = v94,
	["5"] = v94,
	["6"] = v94,
	["7"] = v94,
	["8"] = v94,
	["9"] = v94,
	["N"] = v94,
	["I"] = v94,
	["n"] = function(p122, p123, p124)
		-- upvalues: (copy) v_u_10
		if p122:sub(1, 4) ~= "null" then
			error(v_u_10("invalid null literal", p123))
		end
		p123[2] = p123[2] + 1
		return p124, p122:sub(5)
	end,
	["t"] = v97,
	["f"] = v97,
	["\'"] = v_u_82,
	["\""] = v_u_82,
	["["] = function(p125, p126, p127)
		-- upvalues: (copy) v_u_105, (ref) v_u_106, (copy) v_u_10
		local v128 = p125:sub(2)
		p126[2] = p126[2] + 1
		local v129 = {}
		while true do
			local v130 = v_u_105(v128, p126)
			if v130:sub(1, 1) == "]" then
				p126[2] = p126[2] + 1
				v128 = v130:sub(2)
				break
			end
			local v131, v132 = v_u_106(v130, p126, p127)
			local v133 = v_u_105(v132, p126)
			v129[#v129 + 1] = v131
			local v134 = v133:sub(1, 1)
			v128 = v133:sub(2)
			if v134 == "]" then
				p126[2] = p126[2] + 1
				break
			end
			if v134 ~= "," then
				error(v_u_10("expected comma got " .. string.format("%q", v134):gsub("\r", "\\r"):gsub("\n", "\\n"), p126))
			end
			p126[2] = p126[2] + 1
		end
		return v129, v128
	end,
	["{"] = function(p135, p136, p137)
		-- upvalues: (copy) v_u_105, (copy) v_u_121, (copy) v_u_10, (ref) v_u_106
		p136[2] = p136[2] + 1
		local v138 = p135:sub(2)
		local v139 = {}
		while true do
			local v140 = v_u_105(v138, p136)
			if v140:sub(1, 1) == "}" then
				p136[2] = p136[2] + 1
				v138 = v140:sub(2)
				break
			end
			local v141, v142 = v_u_121(v140, p136)
			local v143 = v_u_105(v142, p136)
			if v143:sub(1, 1) ~= ":" then
				local v144 = error
				local v145 = v_u_10
				local v146 = v143:sub(1, 1)
				v144(v145("expected colon after identifier, got " .. string.format("%q", v146):gsub("\r", "\\r"):gsub("\n", "\\n"), p136))
			end
			p136[2] = p136[2] + 1
			local v147, v148 = v_u_106(v_u_105(v143:sub(2), p136), p136, p137)
			local v149 = v_u_105(v148, p136)
			v139[v141] = v147
			local v150 = v149:sub(1, 1)
			v138 = v149:sub(2)
			if v150 == "}" then
				p136[2] = p136[2] + 1
				break
			end
			if v150 ~= "," then
				error(v_u_10("expected comma got " .. string.format("%q", v150):gsub("\r", "\\r"):gsub("\n", "\\n"), p136))
			end
			p136[2] = p136[2] + 1
		end
		return v139, v138
	end,
	[""] = function(_, p151)
		-- upvalues: (copy) v_u_10
		error(v_u_10("unexpected eof", p151))
	end
}
v_u_106 = function(p153, p154, p155)
	-- upvalues: (copy) v_u_105, (copy) v_u_152, (copy) v_u_10
	local v156 = v_u_105(p153, p154)
	local v157 = v156:sub(1, 1)
	local v158 = v_u_152[v157]
	if not v158 then
		error(v_u_10("invalid value literal " .. string.format("%q", v157):gsub("\r", "\\r"):gsub("\n", "\\n"), p154))
	end
	return v158(v156, p154, p155)
end
local v164 = {
	["Null"] = newproxy(false),
	["Decode"] = function(p159, p160)
		-- upvalues: (copy) v_u_105, (ref) v_u_106, (copy) v_u_10
		local v161 = { 1, 1 }
		local v162, v163 = v_u_106(v_u_105(p159, v161), v161, p160)
		if #v_u_105(v163, v161) > 0 then
			error(v_u_10("trailing garbage", v161))
		end
		return v162
	end
}
return table.freeze(v164)