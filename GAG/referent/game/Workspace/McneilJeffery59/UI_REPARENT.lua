local v1 = script.Parent:WaitForChild("HumanoidRootPart")
local v2 = game.ReplicatedStorage.Billboard_UI:Clone()
v2.Parent = game.Players.LocalPlayer.PlayerGui
v2.Adornee = v1