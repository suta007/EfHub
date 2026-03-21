local v_u_1 = game:GetService("Players")
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = p2:FindFirstAncestor("Important")
	local v4
	if v3 then
		v4 = v3:FindFirstChild("Data")
	else
		v4 = nil
	end
	local v5
	if v4 then
		v5 = v4:FindFirstChild("Owner")
	else
		v5 = nil
	end
	if v5 and v5.Value then
		return v_u_1:FindFirstChild(v5.Value)
	else
		return nil
	end
end