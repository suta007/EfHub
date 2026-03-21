return function(p1, p2)
	for _, v3 in pairs(p1:GetDescendants()) do
		if v3:IsA("BasePart") then
			v3.CollisionGroup = p2
		end
	end
end