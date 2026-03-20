local sData = {}
local reg = {}

sData.Players = game:GetService("Players")
sData.LocalPlayer = sData.Players.LocalPlayer

sData.Character = sData.LocalPlayer.Character or sData.LocalPlayer.CharacterAdded:Wait()
sData.Humanoid = sData.Character:WaitForChild("Humanoid")
sData.VirtualUser = game:GetService("VirtualUser")

sData.ReplicatedStorage = game:GetService("ReplicatedStorage")

sData.Data = sData.ReplicatedStorage:WaitForChild("Data")
sData.PetRegistry = sData.Data:WaitForChild("PetRegistry")
sData.PetList = sData.PetRegistry:WaitForChild("PetList") :: any

sData.Modules = sData.ReplicatedStorage:WaitForChild("Modules") :: any
sData.DataService = require(sData.Modules.DataService)
sData.PetServices = sData.Modules:WaitForChild("PetServices") :: any
sData.ActivePetsService = require(sData.PetServices.ActivePetsService)

sData.GameEvents = sData.ReplicatedStorage:WaitForChild("GameEvents")

sData.Backpack = sData.LocalPlayer:WaitForChild("Backpack")

function sData.Initialize(registry)
	reg = registry
end

sData.PetsDataTable = {}
sData.HungerDataTable = {}
for petName, petInfo in pairs(require(sData.PetList)) do
	table.insert(sData.PetsDataTable, petName)
	sData.HungerDataTable[petName] = petInfo["DefaultHunger"]
end

return sData
