local v_u_1 = game:GetService("UserInputService")
return function()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.MouseEnabled
	if v2 then
		v2 = v_u_1.KeyboardEnabled
	end
	return v2
end