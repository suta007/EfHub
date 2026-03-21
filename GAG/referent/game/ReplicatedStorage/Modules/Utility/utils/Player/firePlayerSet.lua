return function(p1, p2, ...)
	for _, v3 in pairs(p1.list) do
		p2:FireClient(v3, ...)
	end
end