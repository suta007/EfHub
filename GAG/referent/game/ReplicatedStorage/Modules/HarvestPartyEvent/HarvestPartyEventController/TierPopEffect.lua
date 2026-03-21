local v_u_1 = game:GetService("TweenService")
return {
	["Play"] = function(p2, p3)
		-- upvalues: (copy) v_u_1
		local v4 = p3 / 16 * 0.30000000000000004 + 0.35
		local v5 = Instance.new("TextLabel")
		v5.AnchorPoint = Vector2.new(0.5, 0.5)
		v5.Position = UDim2.new(0.5, 0, 0.42, 0)
		v5.Size = UDim2.new(0.6, 0, v4, 0)
		v5.BackgroundTransparency = 1
		v5.TextColor3 = Color3.fromRGB(255, 255, 255)
		v5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		v5.TextStrokeTransparency = 0
		v5.TextScaled = true
		v5.Font = Enum.Font.GothamBold
		v5.Text = ("\240\159\142\137 TIER %* UNLOCKED \240\159\142\137"):format(p3)
		v5.TextTransparency = 0
		v5.ZIndex = 101
		v5.Parent = p2
		v_u_1:Create(v5, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["Size"] = UDim2.new(0.75, 0, v4 + 0.04, 0)
		}):Play()
		task.wait(0.8)
		v_u_1:Create(v5, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1,
			["Position"] = UDim2.new(0.5, 0, 0.36, 0)
		}):Play()
		task.wait(0.6)
		v5:Destroy()
	end
}