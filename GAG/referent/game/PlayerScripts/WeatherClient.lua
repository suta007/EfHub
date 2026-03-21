for _, v_u_1 in script:GetChildren() do
	task.spawn(function()
		-- upvalues: (copy) v_u_1
		require(v_u_1)
	end)
end