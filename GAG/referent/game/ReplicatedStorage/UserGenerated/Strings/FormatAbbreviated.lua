local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Math.RoundFigures)
local v_u_3 = require(v1.UserGenerated.Math.StableExp10)
local v_u_4 = require(v1.UserGenerated.Strings.TrimmedNumberString)
local v_u_5 = {
	"",
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
return function(p6)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v7 = type(p6) == "number"
	assert(v7)
	if p6 ~= p6 then
		return "NaN"
	end
	if p6 == (1 / 0) then
		return "Infinity"
	end
	if p6 == (-1 / 0) then
		return "-Infinity"
	end
	local v8 = {}
	if p6 < 0 then
		table.insert(v8, "-")
		p6 = -p6
	end
	local v9 = math.floor(p6)
	if v9 >= 1000 then
		local v10 = math.log10(v9) / 3
		local v11 = math.floor(v10) + 1
		local v12 = #v_u_5
		local v13 = math.clamp(v11, 1, v12)
		local v14 = v_u_2(v_u_3(v9, (v13 - 1) * -3), 3, nil, math.floor)
		local v15 = v_u_4
		table.insert(v8, v15(v14))
		local v16 = v_u_5[v13]
		table.insert(v8, v16)
	else
		local v17 = v_u_4
		table.insert(v8, v17(v9))
	end
	return table.concat(v8)
end