local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData)
local SummerPlants = PlantTraitsData.Traits.Summer

local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local SummerHarvestRemoteEvent = GameEvents:WaitForChild("SummerHarvestRemoteEvent")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack
local Character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")
for _, item in ipairs(Backpack:GetChildren()) do
	local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
	if not item:GetAttribute("d") and item:HasTag("FruitTool") and table.find(SummerPlants, ItemName) then
		Humanoid:EquipTool(item)
		task.wait(0.1)
		SummerHarvestRemoteEvent:FireServer("SubmitHeldPlant")
		task.wait(1)
	end
end
