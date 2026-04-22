return function(p1, p2, p3)
	local v4 = string.split(p1, " ")
	local v5 = #v4
	if v5 == 0 then
		return ""
	end
	if v5 == 1 then
		return ("<b><font color=\"%*\">%*</font></b>"):format(p2, v4[1])
	end
	local v6 = string.sub(p2, 2, 3)
	local v7 = tonumber(v6, 16) / 255
	local v8 = string.sub(p2, 4, 5)
	local v9 = tonumber(v8, 16) / 255
	local v10 = string.sub(p2, 6, 7)
	local v11 = tonumber(v10, 16) / 255
	local v12 = string.sub(p3, 2, 3)
	local v13 = tonumber(v12, 16) / 255
	local v14 = string.sub(p3, 4, 5)
	local v15 = tonumber(v14, 16) / 255
	local v16 = string.sub(p3, 6, 7)
	local v17 = tonumber(v16, 16) / 255
	local v18 = {}
	for v19, v20 in v4 do
		local v21 = (v19 - 1) / (v5 - 1)
		local v22 = (v7 + (v13 - v7) * v21) * 255
		local v23 = math.floor(v22)
		local v24 = (v9 + (v15 - v9) * v21) * 255
		local v25 = math.floor(v24)
		local v26 = (v11 + (v17 - v11) * v21) * 255
		local v27 = math.floor(v26)
		local v28 = ("<b><font color=\"%*\">%*</font></b>"):format(string.format("#%02X%02X%02X", v23, v25, v27), v20)
		table.insert(v18, v28)
	end
	return table.concat(v18, " ")
end