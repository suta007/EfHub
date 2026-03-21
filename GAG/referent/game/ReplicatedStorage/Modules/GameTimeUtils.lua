local v1 = {}
local v_u_2 = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
}
function v1.TimeFromGameDate(_, p3, p4)
	return (p4 - 1) * 432000 + ((p3 or 1) - 1) * 14400
end
function v1.GameDateFromTime(_, p5)
	local v6 = p5 % 5184000 / 432000
	local v7 = math.floor(v6) + 1
	local v8 = p5 % 432000 / 14400
	return math.floor(v8) + 1, v7
end
function v1.GameDayFromTime(_, p9)
	local v10 = p9 / 14400
	return math.floor(v10)
end
function v1.GameMonthFromTime(_, p11)
	local v12 = p11 / 432000
	return math.floor(v12)
end
function v1.GetMonthName(_, p13)
	-- upvalues: (copy) v_u_2
	local v14 = p13 % 12
	return v_u_2[v14 == 0 and 12 or v14] or "Invalid"
end
return v1