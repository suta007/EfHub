local v_u_1 = game:GetService("ReplicatedStorage")
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v_u_4 = Instance.new("Sound")
	v_u_4.PlaybackSpeed = p3 or Random.new():NextNumber(0.95, 1.05)
	v_u_4.SoundId = p2
	v_u_4.Parent = v_u_1
	v_u_4.Ended:Once(function()
		-- upvalues: (copy) v_u_4
		v_u_4:Destroy()
	end)
	v_u_4:Play()
	return v_u_4
end