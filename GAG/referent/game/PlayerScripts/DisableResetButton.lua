local v_u_1 = game:GetService("StarterGui")
while not pcall(function()
	-- upvalues: (copy) v_u_1
	v_u_1:SetCore("ResetButtonCallback", false)
end) do
	task.wait(1)
end