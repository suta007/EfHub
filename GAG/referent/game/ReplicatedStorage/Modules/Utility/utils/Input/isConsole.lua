local v_u_1 = game:GetService("UserInputService")
return function()
	-- upvalues: (copy) v_u_1
	return v_u_1.GamepadEnabled
end