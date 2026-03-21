local v1 = game:GetService("TweenService")
local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v3 = script.Parent.Parent.Frame.Text_Element.UIPadding
local v_u_4 = v1:Create(v3, v2, {
	["PaddingLeft"] = UDim.new(0.04, 0)
})
local v_u_5 = v1:Create(v3, v2, {
	["PaddingLeft"] = UDim.new(0, 0)
})
local v6 = script.Parent.Parent.ImageLabel
local v7 = script.Parent.Parent.ImageLabel.ImageTransparency
local v_u_8 = v1:Create(v6, v2, {
	["ImageTransparency"] = 0
})
local v_u_9 = v1:Create(v6, v2, {
	["ImageTransparency"] = v7
})
local v_u_10 = game.SoundService.Hover
script.Parent.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_8
	v_u_10.PlaybackSpeed = 1 + math.random(-5, 5) / 100
	v_u_10.Playing = true
	v_u_10.TimePosition = 0
	v_u_4:Play()
	v_u_8:Play()
end)
script.Parent.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_9
	v_u_5:Play()
	v_u_9:Play()
end)