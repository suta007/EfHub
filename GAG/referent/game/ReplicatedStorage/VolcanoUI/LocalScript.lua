local v1 = script.Parent
local v2 = v1.Holder.UIScale
v1.Holder.Visible = true
game.TweenService:Create(v2, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
	["Scale"] = 1
}):Play()
game.TweenService:Create(v1.Holder.Frame.Frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
	["GroupTransparency"] = 0
}):Play()
task.wait(5)
game.TweenService:Create(v2, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
	["Scale"] = 0
}):Play()
task.wait(1)
v1:Destroy()