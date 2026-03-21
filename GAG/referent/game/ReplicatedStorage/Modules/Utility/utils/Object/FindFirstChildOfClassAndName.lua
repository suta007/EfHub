return function(p1, p2, p3)
	for _, v4 in pairs(p1:GetChildren()) do
		if v4.Name == p3 and v4:IsA(p2) then
			return v4
		end
	end
	return nil
end