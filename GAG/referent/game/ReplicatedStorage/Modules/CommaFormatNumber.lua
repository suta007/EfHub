return function(p1)
	return tostring(p1):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end