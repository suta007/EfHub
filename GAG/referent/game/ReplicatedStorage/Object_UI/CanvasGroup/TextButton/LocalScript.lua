local v_u_1 = game.SoundService.Hover
local v_u_2 = game.SoundService.Click
local v_u_3 = script.Parent.BackgroundColor3
local v4 = game:GetService("UserInputService")
v4.InputBegan:Connect(function(p5, _)
	-- upvalues: (copy) v_u_2
	if p5.KeyCode == Enum.KeyCode.ButtonR2 or p5.KeyCode == Enum.KeyCode.E then
		script.Parent.Parent.Parent.Start_Val.Value = true
		v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_2.TimePosition = 0
		v_u_2.Playing = true
		script.Parent.BackgroundColor3 = Color3.new(0, 0.7, 0)
	end
end)
v4.InputEnded:Connect(function(p6, _)
	-- upvalues: (copy) v_u_3
	if p6.KeyCode == Enum.KeyCode.ButtonR2 or p6.KeyCode == Enum.KeyCode.E then
		script.Parent.Parent.Parent.Start_Val.Value = false
		script.Parent.BackgroundColor3 = v_u_3
	end
end)
script.Parent.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_2
	script.Parent.Parent.Parent.Start_Val.Value = true
	v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_2.TimePosition = 0
	v_u_2.Playing = true
	script.Parent.BackgroundColor3 = Color3.new(0, 0.7, 0)
end)
script.Parent.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_3
	script.Parent.Parent.Parent.Start_Val.Value = false
	script.Parent.BackgroundColor3 = v_u_3
end)
script.Parent.MouseButton1Up:Connect(function()
	-- upvalues: (copy) v_u_3
	script.Parent.Parent.Parent.Start_Val.Value = false
	script.Parent.BackgroundColor3 = v_u_3
end)
script.Parent.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_1.TimePosition = 0
	v_u_1.Playing = true
	script.Parent.BackgroundColor3 = Color3.new(0.3, 1, 0.3)
end)