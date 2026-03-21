return function(p1, p2)
	local v3 = {}
	for _, v4 in p1:GetDescendants() do
		if v4:HasTag(p2) then
			table.insert(v3, v4)
		end
	end
	return v3
end