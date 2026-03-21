local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Debris")
v1.GameEvents.HapticEvent.OnClientEvent:Connect(function(p3)
	-- upvalues: (copy) v_u_2
	local v4 = Enum.HapticEffectType:FromName(p3)
	local v5 = ("HapticReceiver got an invalid HapticType (%*: %*)"):format(typeof(p3), p3)
	assert(v4, v5)
	local v6 = Instance.new("HapticEffect")
	v6.Type = Enum.HapticEffectType:FromName(p3)
	v6.Parent = workspace
	v6:Play()
	v_u_2:AddItem(v6, 5)
end)