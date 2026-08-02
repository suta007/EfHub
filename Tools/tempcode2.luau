local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local HarvestMoonSell = GameEvents:WaitForChild("HarvestMoonSell")

task.spawn(function()
	HarvestMoonSell:FireServer("SellAll")
	task.wait(0.3)
	while task.wait(60) do
		HarvestMoonSell:FireServer("SellAll")
		task.wait(0.3)
	end
end)
