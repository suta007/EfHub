local v_u_1 = game.SoundService.Hover
local v_u_2 = game.SoundService.Click
local v3 = game:GetService("UserInputService")
v3.InputBegan:Connect(function(p4, _)
	-- upvalues: (copy) v_u_2
	if p4.KeyCode == Enum.KeyCode.ButtonR2 or p4.KeyCode == Enum.KeyCode.E then
		script.Parent.Parent.Parent.Start_Val.Value = true
		v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_2.TimePosition = 0
		v_u_2.Playing = true
	end
end)
v3.InputEnded:Connect(function(p5, _)
	if p5.KeyCode == Enum.KeyCode.ButtonR2 or p5.KeyCode == Enum.KeyCode.E then
		script.Parent.Parent.Parent.Start_Val.Value = false
	end
end)
script.Parent.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_2
	script.Parent.Parent.Parent.Start_Val.Value = true
	v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_2.TimePosition = 0
	v_u_2.Playing = true
end)
script.Parent.MouseLeave:Connect(function()
	script.Parent.Parent.Parent.Start_Val.Value = false
end)
script.Parent.MouseButton1Up:Connect(function()
	script.Parent.Parent.Parent.Start_Val.Value = false
end)
script.Parent.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_1.TimePosition = 0
	v_u_1.Playing = true
end)