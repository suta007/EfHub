return function(p1, p2)
	local v3 = {}
	for v4, v5 in p1 do
		local v6 = string.format
		local v7 = tostring(v4)
		local v8 = tostring(v5)
		table.insert(v3, v6("%s=%s", v7, v8))
	end
	return table.concat(v3, p2 or ",")
end