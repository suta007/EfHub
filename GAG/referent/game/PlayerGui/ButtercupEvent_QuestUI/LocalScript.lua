local v_u_1 = require(game.ReplicatedStorage.Frame_Popup_Module)
script.Parent:GetPropertyChangedSignal("Enabled"):Connect(function()
	-- upvalues: (copy) v_u_1
	if script.Parent.Enabled == false then
		v_u_1.Hide(script.Parent)
	else
		v_u_1.Show(script.Parent)
	end
end)