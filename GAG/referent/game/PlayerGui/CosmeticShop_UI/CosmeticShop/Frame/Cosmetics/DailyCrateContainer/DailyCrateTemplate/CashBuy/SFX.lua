local v_u_1 = game.SoundService.Hover
local v_u_2 = game.SoundService.Click
local v3 = game:GetService("UserInputService")
game:GetService("TweenService")
TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
if v3.TouchEnabled == false then
	script.Parent.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_1
		v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_1.TimePosition = 0
		v_u_1.Playing = true
	end)
end
script.Parent.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_2.TimePosition = 0
	v_u_2.Playing = true
end)