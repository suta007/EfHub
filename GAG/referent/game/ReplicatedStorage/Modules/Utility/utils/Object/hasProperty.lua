return function(p_u_1, p_u_2)
	local v3, _ = pcall(function()
		-- upvalues: (copy) p_u_1, (copy) p_u_2
		p_u_1[p_u_2] = p_u_1[p_u_2]
	end)
	return v3
end