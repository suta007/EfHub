local v_u_1 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_1
	v_u_1 = workspace.CurrentCamera
end)
return function(p2)
	-- upvalues: (ref) v_u_1
	if p2 then
		local v3, v4 = v_u_1:WorldToScreenPoint(p2)
		return UDim2.fromOffset(v3.X, v3.Y), v4
	end
end