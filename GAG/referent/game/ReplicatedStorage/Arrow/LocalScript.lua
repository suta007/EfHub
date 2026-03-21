local v_u_1 = require(game.ReplicatedStorage.Arrow_Module)
local v_u_2 = true
script.Parent.Touched:Connect(function(p3)
	-- upvalues: (ref) v_u_2, (copy) v_u_1
	if p3.Parent.Name == script.Parent.Target_Player.Value and v_u_2 == true then
		v_u_2 = false
		v_u_1.Remove_Arrow(script.Parent)
	end
end)