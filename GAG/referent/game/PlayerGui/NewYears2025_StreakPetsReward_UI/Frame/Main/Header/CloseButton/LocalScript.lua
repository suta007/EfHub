local v1 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.GuiController)
local v_u_4 = v1:WaitForChild("NewYears2025_StreakPetsReward_UI")
local v_u_5 = game.SoundService.Click
script.Parent.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	v_u_5.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_5.Playing = true
	v_u_5.TimePosition = 0
	v_u_3:Close(v_u_4)
end)