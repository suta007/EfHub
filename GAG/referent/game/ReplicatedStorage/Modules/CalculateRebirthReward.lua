return function(p1)
	if p1 and type(p1) == "number" then
		return 10
	end
	warn("Invalid Sheckles Parameter, Defaulting...")
	return 10
end