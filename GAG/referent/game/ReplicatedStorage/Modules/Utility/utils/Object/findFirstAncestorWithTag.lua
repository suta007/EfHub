return function(p1, p2)
	if p1 then
		local v3 = p1.Parent
		while v3 ~= game do
			if v3:HasTag(p2) then
				return v3
			end
			v3 = v3.Parent
		end
		return nil
	end
end