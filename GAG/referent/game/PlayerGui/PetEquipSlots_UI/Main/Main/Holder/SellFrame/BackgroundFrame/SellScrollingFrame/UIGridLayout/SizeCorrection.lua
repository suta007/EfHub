local v_u_1 = script.Parent
local v_u_2 = v_u_1.Parent
v_u_2.CanvasSize = UDim2.new(0, 0, 0, v_u_1.AbsoluteContentSize.Y)
v_u_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2.CanvasSize = UDim2.new(0, 0, 0, v_u_1.AbsoluteContentSize.Y)
end)