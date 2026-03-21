local v_u_1 = require(game.ReplicatedStorage.Field_Of_View_Module)
local v2 = game:GetService("TweenService")
local v3 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v4 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v5 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Pop_Effect"):WaitForChild("Frame")
local v_u_6 = v2:Create(v5, v3, {
	["BackgroundTransparency"] = 0
})
local v_u_7 = v2:Create(v5, v4, {
	["BackgroundTransparency"] = 1
})
game.ReplicatedStorage.GameEvents.Pop_Effect.OnClientEvent:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_7
	v_u_1.Change_FOV(120, 0.5)
	v_u_6:Play()
	task.wait(1)
	v_u_1.Change_FOV(70, 4)
	task.wait(1.25)
	v_u_7:Play()
end)