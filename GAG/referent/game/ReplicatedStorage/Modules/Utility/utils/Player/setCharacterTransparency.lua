return function(p1, p2)
	for _, v3 in pairs(p1:GetDescendants()) do
		if v3:IsA("BasePart") and v3 ~= p1:FindFirstChild("HumanoidRootPart") then
			v3.Transparency = p2
		end
	end
end