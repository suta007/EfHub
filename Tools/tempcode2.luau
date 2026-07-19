local ReplicatedStorage = game:GetService("ReplicatedStorage")
local fireproximityprompt = (getfenv() :: any).fireproximityprompt

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack
local character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")

for _, obj in pairs(Workspace:GetChildren()) do
	if obj.Name == "Model" then
		character:PivotTo(obj:GetPivot())
		task.wait(2)
		local target = obj:FindFirstChild("ProximityPrompt", true)
		if target then
			fireproximityprompt(target)
			task.wait(2)
			--character:PivotTo(homePos)
			--task.wait(2)
			--reg.Log("🟢 เก็บไข่ " .. count .. " สำเร็จ")
			--count = count + 1
		end
	end
	task.wait(0.2)
end
