return function(p1)
	local v2 = ""
	for _ = 1, p1 or 5 do
		local v3 = math.random(62)
		v2 = v2 .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"):sub(v3, v3)
	end
	return v2
end