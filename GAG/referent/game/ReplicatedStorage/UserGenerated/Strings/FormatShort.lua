local v_u_1 = {
	"k",
	"m",
	"b",
	"t",
	"q",
	"Qt",
	"Sx",
	"Sp",
	"o",
	"n",
	"d",
	"u",
	"Du",
	"Tr"
}
return function(p2, p3, p4)
	-- upvalues: (copy) v_u_1
	local v5 = type(p2) == "number"
	assert(v5)
	local v6 = p3 == nil and true or type(p3) == "number"
	assert(v6)
	local v7 = p4 == nil and true or type(p4) == "number"
	assert(v7)
	if p2 == p2 then
		if p2 == (1 / 0) then
			return "Infinity"
		elseif p2 == (-1 / 0) then
			return "-Infinity"
		else
			local v8 = p3 or 3
			local v9 = math.abs(p2)
			local v10 = -#v_u_1 * 3
			local v11 = math.pow(10, v10)
			local v12 = math.max(v9, v11)
			local v13 = math.log10(v12)
			local v14 = math.ceil(v13)
			local v15 = #v_u_1 * 3 + v8
			local v16 = 10 ^ (math.min(v14, v15) - (p4 or 0) - v8)
			local v17 = v12 / v16
			local v18 = math.round(v17) * v16
			local v19 = math.max(v18, 1)
			local v20 = math.log10(v19) / 3
			local v21 = math.floor(v20)
			local v22 = #v_u_1
			local v23 = math.min(v21, v22)
			local v24 = v18 * math.sign(p2) / 10 ^ (v23 * 3)
			local v25 = string.format("%f", v24):gsub("%.?0+$", "")
			if v23 >= 1 then
				return v25 .. v_u_1[v23]
			else
				return v25
			end
		end
	else
		return "NaN"
	end
end