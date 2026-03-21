local v_u_1 = {
	["FONT_COLOR_RGB"] = {
		["Start"] = "<font color=\"rgb(%s,%s,%s)\">",
		["End"] = "</font>"
	},
	["FONT_COLOR_HEX"] = {
		["Start"] = "<font color=\"#%s\">",
		["End"] = "</font>"
	},
	["FONT_SIZE"] = {
		["Start"] = "<font size=\"%d\">",
		["End"] = "</font>"
	},
	["FONT_FACE"] = {
		["Start"] = "<font face=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_FAMILY"] = {
		["Start"] = "<font family=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_WEIGHT"] = {
		["Start"] = "<font weight=\"%s\">",
		["End"] = "</font>"
	},
	["FONT_TRANSPARENCY"] = {
		["Start"] = "<font transparency=\"%s\">",
		["End"] = "</font>"
	},
	["STROKE"] = {
		["Start"] = "<stroke color=\"#%s\" joins=\"%s\" thickness=\"%s\" transparency=\"%s\">",
		["End"] = "</stroke>"
	},
	["BOLD"] = {
		["Start"] = "<b>",
		["End"] = "</b>"
	},
	["ITALIC"] = {
		["Start"] = "<i>",
		["End"] = "</i>"
	},
	["UNDERLINE"] = {
		["Start"] = "<u>",
		["End"] = "</u>"
	},
	["STRIKETHROUGH"] = {
		["Start"] = "<s>",
		["End"] = "</s>"
	},
	["UPPERCASE"] = {
		["Start"] = "<uppercase>",
		["End"] = "</uppercase>"
	},
	["SMALLCAPS"] = {
		["Start"] = "<smallcaps>",
		["End"] = "</smallcaps>"
	}
}
local v_u_2 = {}
local v_u_3 = {}
v_u_3.__index = v_u_3
local v_u_4 = {}
local v_u_5 = "FONT_SIZE"
function v_u_4.size(p6)
	-- upvalues: (copy) v_u_1, (copy) v_u_5
	local v_u_7 = v_u_1[v_u_5].Start:format(p6)
	return function(p8)
		-- upvalues: (copy) v_u_7, (ref) v_u_1, (ref) v_u_5
		return ("%*%*%*"):format(v_u_7, p8, v_u_1[v_u_5].End)
	end
end
local v_u_9 = "FONT_FACE"
function v_u_4.face(p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v_u_11 = v_u_1[v_u_9].Start:format(p10)
	return function(p12)
		-- upvalues: (copy) v_u_11, (ref) v_u_1, (ref) v_u_9
		return ("%*%*%*"):format(v_u_11, p12, v_u_1[v_u_9].End)
	end
end
local v_u_13 = "FONT_FAMILY"
function v_u_4.family(p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_13
	local v_u_15 = v_u_1[v_u_13].Start:format(p14)
	return function(p16)
		-- upvalues: (copy) v_u_15, (ref) v_u_1, (ref) v_u_13
		return ("%*%*%*"):format(v_u_15, p16, v_u_1[v_u_13].End)
	end
end
local v_u_17 = "FONT_WEIGHT"
function v_u_4.weight(p18)
	-- upvalues: (copy) v_u_1, (copy) v_u_17
	local v_u_19 = v_u_1[v_u_17].Start:format(p18)
	return function(p20)
		-- upvalues: (copy) v_u_19, (ref) v_u_1, (ref) v_u_17
		return ("%*%*%*"):format(v_u_19, p20, v_u_1[v_u_17].End)
	end
end
local v_u_21 = "FONT_TRANSPARENCY"
function v_u_4.transparency(p22)
	-- upvalues: (copy) v_u_1, (copy) v_u_21
	local v_u_23 = v_u_1[v_u_21].Start:format(p22)
	return function(p24)
		-- upvalues: (copy) v_u_23, (ref) v_u_1, (ref) v_u_21
		return ("%*%*%*"):format(v_u_23, p24, v_u_1[v_u_21].End)
	end
end
function v_u_4.stroke(p25)
	-- upvalues: (copy) v_u_1
	local v26 = ("#%*"):format((p25.Color:ToHex()))
	local v27 = p25.Joins or "Round"
	local v28 = p25.Thickness or 1
	local v29 = p25.Transparency or 0
	local v_u_30 = v_u_1.STROKE.Start:format(v26, v27, v28, v29)
	return function(p31)
		-- upvalues: (copy) v_u_30, (ref) v_u_1
		return ("%*%*%*"):format(v_u_30, p31, v_u_1.STROKE.End)
	end
end
function v_u_4.color(...)
	-- upvalues: (copy) v_u_1
	local v32 = { ... }
	local v33 = v32[1]
	local v34
	if typeof(v33) == "string" then
		local v35 = v33:gsub("#", "")
		v34 = string.match(v35, "^%x%x%x%x%x%x$")
	else
		v34 = nil
	end
	local v36 = v32[1]
	local v37 = typeof(v36) == "Color3"
	local v38 = v32[1]
	local v39 = v37 and v38 and v38 or Color3.fromRGB(v38, v32[2], v32[3])
	local v_u_40 = v34 and v_u_1.FONT_COLOR_HEX.Start:format(v38:gsub("#", ""))
	if not v_u_40 then
		local v41 = v_u_1.FONT_COLOR_RGB.Start
		local v42 = v39.R * 255
		local v43 = math.floor(v42)
		local v44 = v39.G * 255
		local v45 = math.floor(v44)
		local v46 = v39.B * 255
		v_u_40 = v41:format(v43, v45, (math.floor(v46)))
	end
	return function(p47)
		-- upvalues: (copy) v_u_40, (ref) v_u_1
		return ("%*%*%*"):format(v_u_40, p47, v_u_1.FONT_COLOR_RGB.End)
	end
end
local v_u_48 = "BOLD"
function v_u_2.bold(p49)
	-- upvalues: (copy) v_u_1, (copy) v_u_48
	local v50 = v_u_1[v_u_48]
	return ("%*%*%*"):format(v50.Start, p49, v50.End)
end
local v_u_51 = "ITALIC"
function v_u_2.italic(p52)
	-- upvalues: (copy) v_u_1, (copy) v_u_51
	local v53 = v_u_1[v_u_51]
	return ("%*%*%*"):format(v53.Start, p52, v53.End)
end
local v_u_54 = "UNDERLINE"
function v_u_2.underline(p55)
	-- upvalues: (copy) v_u_1, (copy) v_u_54
	local v56 = v_u_1[v_u_54]
	return ("%*%*%*"):format(v56.Start, p55, v56.End)
end
local v_u_57 = "STRIKETHROUGH"
function v_u_2.strikethrough(p58)
	-- upvalues: (copy) v_u_1, (copy) v_u_57
	local v59 = v_u_1[v_u_57]
	return ("%*%*%*"):format(v59.Start, p58, v59.End)
end
local v_u_60 = "UPPERCASE"
function v_u_2.uppercase(p61)
	-- upvalues: (copy) v_u_1, (copy) v_u_60
	local v62 = v_u_1[v_u_60]
	return ("%*%*%*"):format(v62.Start, p61, v62.End)
end
local v_u_63 = "SMALLCAPS"
function v_u_2.smallcaps(p64)
	-- upvalues: (copy) v_u_1, (copy) v_u_63
	local v65 = v_u_1[v_u_63]
	return ("%*%*%*"):format(v65.Start, p64, v65.End)
end
local v_u_66 = Color3.fromRGB(255, 255, 255)
function v_u_2.white(p67)
	-- upvalues: (copy) v_u_66, (copy) v_u_1
	local v68 = v_u_66.r * 255
	local v69 = math.floor(v68)
	local v70 = v_u_66.g * 255
	local v71 = math.floor(v70)
	local v72 = v_u_66.b * 255
	local v73 = math.floor(v72)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v69, v71, v73), p67, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_74 = Color3.fromRGB(0, 0, 0)
function v_u_2.black(p75)
	-- upvalues: (copy) v_u_74, (copy) v_u_1
	local v76 = v_u_74.r * 255
	local v77 = math.floor(v76)
	local v78 = v_u_74.g * 255
	local v79 = math.floor(v78)
	local v80 = v_u_74.b * 255
	local v81 = math.floor(v80)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v77, v79, v81), p75, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_82 = Color3.fromRGB(255, 0, 0)
function v_u_2.red(p83)
	-- upvalues: (copy) v_u_82, (copy) v_u_1
	local v84 = v_u_82.r * 255
	local v85 = math.floor(v84)
	local v86 = v_u_82.g * 255
	local v87 = math.floor(v86)
	local v88 = v_u_82.b * 255
	local v89 = math.floor(v88)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v85, v87, v89), p83, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_90 = Color3.fromRGB(153, 51, 0)
function v_u_2.brown(p91)
	-- upvalues: (copy) v_u_90, (copy) v_u_1
	local v92 = v_u_90.r * 255
	local v93 = math.floor(v92)
	local v94 = v_u_90.g * 255
	local v95 = math.floor(v94)
	local v96 = v_u_90.b * 255
	local v97 = math.floor(v96)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v93, v95, v97), p91, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_98 = Color3.fromRGB(255, 153, 0)
function v_u_2.orange(p99)
	-- upvalues: (copy) v_u_98, (copy) v_u_1
	local v100 = v_u_98.r * 255
	local v101 = math.floor(v100)
	local v102 = v_u_98.g * 255
	local v103 = math.floor(v102)
	local v104 = v_u_98.b * 255
	local v105 = math.floor(v104)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v101, v103, v105), p99, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_106 = Color3.fromRGB(255, 255, 0)
function v_u_2.yellow(p107)
	-- upvalues: (copy) v_u_106, (copy) v_u_1
	local v108 = v_u_106.r * 255
	local v109 = math.floor(v108)
	local v110 = v_u_106.g * 255
	local v111 = math.floor(v110)
	local v112 = v_u_106.b * 255
	local v113 = math.floor(v112)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v109, v111, v113), p107, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_114 = Color3.fromRGB(153, 255, 0)
function v_u_2.lime(p115)
	-- upvalues: (copy) v_u_114, (copy) v_u_1
	local v116 = v_u_114.r * 255
	local v117 = math.floor(v116)
	local v118 = v_u_114.g * 255
	local v119 = math.floor(v118)
	local v120 = v_u_114.b * 255
	local v121 = math.floor(v120)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v117, v119, v121), p115, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_122 = Color3.fromRGB(0, 255, 0)
function v_u_2.green(p123)
	-- upvalues: (copy) v_u_122, (copy) v_u_1
	local v124 = v_u_122.r * 255
	local v125 = math.floor(v124)
	local v126 = v_u_122.g * 255
	local v127 = math.floor(v126)
	local v128 = v_u_122.b * 255
	local v129 = math.floor(v128)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v125, v127, v129), p123, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_130 = Color3.fromRGB(0, 0, 255)
function v_u_2.blue(p131)
	-- upvalues: (copy) v_u_130, (copy) v_u_1
	local v132 = v_u_130.r * 255
	local v133 = math.floor(v132)
	local v134 = v_u_130.g * 255
	local v135 = math.floor(v134)
	local v136 = v_u_130.b * 255
	local v137 = math.floor(v136)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v133, v135, v137), p131, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_138 = Color3.fromRGB(102, 0, 153)
function v_u_2.purple(p139)
	-- upvalues: (copy) v_u_138, (copy) v_u_1
	local v140 = v_u_138.r * 255
	local v141 = math.floor(v140)
	local v142 = v_u_138.g * 255
	local v143 = math.floor(v142)
	local v144 = v_u_138.b * 255
	local v145 = math.floor(v144)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v141, v143, v145), p139, v_u_1.FONT_COLOR_RGB.End)
end
local v_u_146 = Color3.fromRGB(255, 0, 255)
function v_u_2.pink(p147)
	-- upvalues: (copy) v_u_146, (copy) v_u_1
	local v148 = v_u_146.r * 255
	local v149 = math.floor(v148)
	local v150 = v_u_146.g * 255
	local v151 = math.floor(v150)
	local v152 = v_u_146.b * 255
	local v153 = math.floor(v152)
	return ("%*%*%*"):format(v_u_1.FONT_COLOR_RGB.Start:format(v149, v151, v153), p147, v_u_1.FONT_COLOR_RGB.End)
end
function v_u_3.new(p154)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v155 = {}
	local v156 = {}
	local v_u_157 = {}
	v155.Formatters = v_u_157
	local v_u_158 = nil
	local v_u_159 = nil
	function v156.__call(_, ...)
		-- upvalues: (ref) v_u_158, (copy) v_u_157
		local v160 = { ... }
		if v_u_158 then
			local v161 = v_u_158
			v_u_158 = nil
			return v161(unpack(v160))
		else
			local v162 = {}
			for _, v165 in v160 do
				for _, v164 in v_u_157 do
					local v165 = v164(v165)
				end
				table.insert(v162, v165)
			end
			return unpack(v162)
		end
	end
	function v156.__index(p166, p167)
		-- upvalues: (ref) v_u_4, (ref) v_u_158, (copy) v_u_157, (ref) v_u_159, (ref) v_u_2
		local v_u_168 = v_u_4[p167]
		if v_u_168 then
			v_u_158 = function(...)
				-- upvalues: (copy) v_u_168, (ref) v_u_157, (ref) v_u_159
				local v169 = v_u_168(...)
				local v170 = v_u_157
				table.insert(v170, v169)
				return v_u_159
			end
			return v_u_159
		end
		local v171 = v_u_2[p167]
		local v172 = v_u_157
		table.insert(v172, v171)
		return p166
	end
	v156:__index(p154)
	v_u_159 = setmetatable(v155, v156)
	return v_u_159
end
return setmetatable({}, {
	["__index"] = function(_, p173)
		-- upvalues: (copy) v_u_3
		return v_u_3.new(p173)
	end,
	["__newindex"] = function()
		return error("Chalk is READONLY")
	end
})