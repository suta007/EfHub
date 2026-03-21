local v_u_1 = game.SoundService.Hover
local v_u_2 = game.SoundService.Click
script.Parent.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_1.Playing = true
	v_u_1.TimePosition = 0
end)
script.Parent.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_2.Playing = true
	v_u_2.TimePosition = 0
end)