local v_u_1 = game:GetService("Players")
return function(p2)
	-- upvalues: (copy) v_u_1
	if p2 then
		local v3 = p2:FindFirstChild("Owner", true)
		if v3 then
			return v_u_1:FindFirstChild(v3.Value)
		end
	end
end