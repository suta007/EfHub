local v1 = game:GetService("TweenService")
local v2 = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v3 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v4 = script.Parent.CanvasGroup
v4.Position = UDim2.new(0.5, 0, 0.4, 0)
v1:Create(v4, v2, {
	["Position"] = UDim2.new(0.5, 0, 0.5, 0)
}):Play()
v4.GroupTransparency = 1
v1:Create(v4, v2, {
	["GroupTransparency"] = 0
}):Play()
local v5 = game.SoundService.EVENT_SFX
v5.PlaybackSpeed = 1 + math.random(-15, 15) / 100
v5.TimePosition = 0
v5.Playing = true
task.wait(math.random(5, 7))
v1:Create(v4, v3, {
	["Position"] = UDim2.new(0.5, 0, 0.6, 0)
}):Play()
v1:Create(v4, v3, {
	["GroupTransparency"] = 1
}):Play()
game.Debris:AddItem(script.Parent, v3.Time)