local v_u_1 = workspace:WaitForChild("Farm")
return function(p2)
	-- upvalues: (copy) v_u_1
	for _, v3 in v_u_1:GetChildren() do
		if v3:IsAncestorOf(p2) then
			return v3
		end
	end
	return nil
end