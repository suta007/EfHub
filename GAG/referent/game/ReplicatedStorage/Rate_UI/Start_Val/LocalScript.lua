local v1 = game:GetService("TweenService")
local v2 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v3 = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v_u_4 = script.Parent.Parent.CanvasGroup.TextButton.Hold_Down_Val
local v_u_5 = v1:Create(v_u_4, v2, {
	["Size"] = UDim2.new(1, 0, 1, 0)
})
local v_u_6 = v1:Create(v_u_4, v3, {
	["BackgroundTransparency"] = 0.5
})
local v_u_7 = time()
script.Parent:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	v_u_7 = time()
	if script.Parent.Value == true then
		v_u_5:Cancel()
		v_u_4.Size = UDim2.new(0, 0, 1, 0)
		v_u_4.BackgroundTransparency = 1
		v_u_5:Play()
		v_u_6:Play()
		v_u_7 = time()
	else
		v_u_5:Cancel()
		v_u_6:Cancel()
		v_u_4.BackgroundTransparency = 1
	end
end)
local v_u_8 = game.ReplicatedStorage.GameEvents.Send_Rating
local _ = game.Players.LocalPlayer.PlayerGui.Gradient_UI.Green_VAL
local _ = game.Players.LocalPlayer.PlayerGui.Gradient_UI.Red_VAL
local _ = game.SoundService.Error
v_u_5.Completed:Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_8
	if time() - v_u_7 >= 0.95 then
		script.Parent.Parent.Show_Val.Value = false
		local v9 = game.Players:FindFirstChild(script.Parent.Parent.PLR_1.Value)
		if v9 and v9.Character then
			local v10 = v9.Character:FindFirstChild("Show_The_Val")
			local v11 = v9.Character:FindFirstChild("Character_Highlight_Click")
			if v10 and v11 then
				v10.Value = false
				v11.Value = false
			end
		end
		v_u_8:FireServer(script.Parent.Parent.PLR_1.Value, script.Parent.Parent.Rating_Val.Value)
	end
end)