return function(p1, p2)
	if not p1 then
		return nil
	end
	if not p1:IsA("Instance") then
		return nil
	end
	if not p2 or p2 == "" then
		return nil
	end
	local v3 = p1.Parent
	while v3 do
		if v3:HasTag(p2) then
			return v3
		end
		v3 = v3.Parent
	end
	return nil
end