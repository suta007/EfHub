local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
function v1.Acknowledge(_, p3)
	-- upvalues: (copy) v_u_2
	v_u_2.GameEvents.WarningService.Acknowledge:FireServer(p3)
end
return v1