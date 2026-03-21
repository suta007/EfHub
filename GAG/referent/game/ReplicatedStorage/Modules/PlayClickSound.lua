local v_u_1 = game:GetService("SoundService").Click
return function()
	-- upvalues: (copy) v_u_1
	v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_1.Playing = true
	v_u_1.TimePosition = 0
end