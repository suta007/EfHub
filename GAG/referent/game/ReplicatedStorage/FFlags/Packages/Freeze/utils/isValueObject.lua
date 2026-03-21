return function(p1)
	if p1 and typeof(p1) == "table" then
		local v2 = p1.equals
		if typeof(v2) == "function" then
			return true
		end
	end
	return false
end