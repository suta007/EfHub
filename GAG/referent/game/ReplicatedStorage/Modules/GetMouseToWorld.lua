local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_3
	v_u_3 = workspace.CurrentCamera
end)
return function(p4, p5)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (ref) v_u_3
	local v6 = v_u_1:GetMouseLocation()
	local v7 = v_u_2:GetGuiInset()
	local v8 = v_u_3:ScreenPointToRay(v6.X + v7.X, v6.Y - v7.Y)
	return workspace:Raycast(v8.Origin, v8.Direction * (p5 or 1000), p4)
end