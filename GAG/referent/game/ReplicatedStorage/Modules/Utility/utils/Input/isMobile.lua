local v_u_1 = game:GetService("UserInputService")
return function()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.TouchEnabled
	if v2 then
		local v3 = v_u_1.KeyboardEnabled
		if v3 then
			v3 = v_u_1.MouseEnabled
		end
		v2 = not v3
		if v2 then
			v2 = not v_u_1.GamepadEnabled
		end
	end
	return v2
end