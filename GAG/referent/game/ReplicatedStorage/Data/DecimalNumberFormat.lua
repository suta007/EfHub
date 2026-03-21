return function(p1)
	return math.round(p1) - p1 == 0 and p1 and p1 or ("%.2f"):format(p1)
end