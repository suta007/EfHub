game:GetService("UserInputService")
local v_u_1 = game:GetService("GuiService")
local v_u_2 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_2
	v_u_2 = workspace.CurrentCamera
end)
return function(p3, p4)
	-- upvalues: (copy) v_u_1, (ref) v_u_2
	local v5 = v_u_1:GetGuiInset()
	local v6 = v_u_2:ScreenPointToRay(p3.X + v5.X, p3.Y - v5.Y)
	return workspace:Raycast(v6.Origin, v6.Direction * (p4 or 1000), RaycastParams)
end