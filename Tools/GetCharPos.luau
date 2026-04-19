local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

print(Character:GetPivot())



local homePos = CFrame.new(-43.30, 4.7, -78.98)
Character:PivotTo(homePos)




-100.68,7.91,-9.52