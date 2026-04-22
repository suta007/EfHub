local v_u_1 = game.SoundService.Hover
local v_u_2 = game.SoundService.Click
local v3 = game:GetService("UserInputService")
local v4 = game:GetService("TweenService")
local v5 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local v_u_6 = v4:Create(script.Parent.Parent.TextLabel, v5, {
	["Size"] = UDim2.new(1, 0, 1, 0)
})
local v_u_7 = v4:Create(script.Parent.Parent.TextLabel, v5, {
	["Size"] = UDim2.new(0.9, 0, 0.9, 0)
})
script.Parent.Parent.TextLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
if v3.TouchEnabled == false then
	script.Parent.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_1, (copy) v_u_6
		v_u_1.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_1.TimePosition = 0
		v_u_1.Playing = true
		v_u_6:Play()
	end)
	script.Parent.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_7
		v_u_7:Play()
	end)
end
script.Parent.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_2.TimePosition = 0
	v_u_2.Playing = true
end)