local v_u_1 = game:GetService("Players")
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	return function(...)
		-- upvalues: (ref) v_u_1, (copy) p_u_2
		if v_u_1:FindFirstChild(p_u_2) then
			return print(...)
		end
	end
end