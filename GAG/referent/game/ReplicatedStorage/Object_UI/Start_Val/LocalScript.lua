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
local v_u_8 = game.ReplicatedStorage.GameEvents.Purchase_Object
local v_u_9 = script.Parent.Parent.Object_ID
local v_u_10 = game.Players.LocalPlayer.PlayerGui.Gradient_UI.Green_VAL
local v_u_11 = game.Players.LocalPlayer.PlayerGui.Gradient_UI.Red_VAL
local v_u_12 = game.SoundService.Error
v_u_5.Completed:Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	if time() - v_u_7 >= 0.95 then
		if script.Parent.Parent.Cost_Val.Value <= game.Players.LocalPlayer.leaderstats["$"].Value then
			v_u_8:FireServer(v_u_9.Value)
			v_u_10.Value = true
		else
			v_u_11.Value = true
			v_u_12.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_12.TimePosition = 0
			v_u_12.Playing = true
		end
		script.Parent.Value = false
	end
end)