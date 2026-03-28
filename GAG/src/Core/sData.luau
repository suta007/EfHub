local sData = {}
--local reg = {}

sData.Players = game:GetService("Players")
sData.LocalPlayer = sData.Players.LocalPlayer
sData.MyName = sData.LocalPlayer.Name
sData.Character = sData.LocalPlayer.Character or sData.LocalPlayer.CharacterAdded:Wait()
sData.Humanoid = sData.Character:WaitForChild("Humanoid")

sData.PlayerGui = sData.LocalPlayer:WaitForChild("PlayerGui")
sData.TeleportFrame = sData.PlayerGui:WaitForChild("Teleport_UI"):WaitForChild("Frame")

sData.VirtualUser = game:GetService("VirtualUser")

sData.ReplicatedStorage = game:GetService("ReplicatedStorage")
sData.GameEvents = sData.ReplicatedStorage:WaitForChild("GameEvents")
sData.Data = sData.ReplicatedStorage:WaitForChild("Data")
sData.PetRegistry = sData.Data:WaitForChild("PetRegistry")

sData.Modules = sData.ReplicatedStorage:WaitForChild("Modules") :: any
sData.DataService = require(sData.Modules.DataService)
sData.InventoryService = require(sData.Modules.InventoryService)

sData.CollectEvent = sData.GameEvents:WaitForChild("Crops"):WaitForChild("Collect")

sData.PetServices = sData.Modules:WaitForChild("PetServices") :: any
sData.ActivePetsService = require(sData.PetServices.ActivePetsService)

sData.Backpack = sData.LocalPlayer:WaitForChild("Backpack")

sData.Lighting = game:GetService("Lighting")
sData.Terrain = workspace.Terrain

--function sData.Initialize(registry)
--	reg = registry
--end

local SeedShopData = require(sData.Data:WaitForChild("SeedShopData") :: any)
sData.SeedShopTable = { "ALL" }
for seedName, seedInfo in pairs(SeedShopData) do
	table.insert(sData.SeedShopTable, seedName)
end

local SeedData = require(sData.Data:WaitForChild("SeedData") :: any)
sData.SeedDataTable = { "ALL" }
for seedName, seedInfo in pairs(SeedData) do
	table.insert(sData.SeedDataTable, seedName)
end
sData.SeedDataBlackTable = table.clone(sData.SeedDataTable)
sData.SeedDataBlackTable[1] = "NONE"

local MutationData = sData.DataService:GetData().GardenGuide.MutationData
sData.MutationDataTable = { "ALL" }
for MutationName, MutationInfo in pairs(MutationData) do
	table.insert(sData.MutationDataTable, MutationName)
end
sData.MutationDataBlackTable = table.clone(sData.MutationDataTable)
sData.MutationDataBlackTable[1] = "NONE"

local PetList = require(sData.PetRegistry:WaitForChild("PetList") :: any)
sData.PetsDataTable = {}
sData.HungerDataTable = {}
for petName, petInfo in pairs(PetList) do
	table.insert(sData.PetsDataTable, petName)
	sData.HungerDataTable[petName] = petInfo["DefaultHunger"]
end

local PetMutationData = require(sData.PetRegistry:WaitForChild("PetMutationRegistry") :: any)
sData.PetMutationDataTable = { "ALL" }
sData.EnumToNameCache = {}
for mutantName, mutantInfo in pairs(PetMutationData["PetMutationRegistry"]) do
	if type(mutantInfo) == "table" and mutantInfo.EnumId then
		table.insert(sData.PetMutationDataTable, mutantName)
		sData.EnumToNameCache[mutantInfo.EnumId] = mutantName
	end
end
sData.PetMutationDataBlackTable = table.clone(sData.PetMutationDataTable)
sData.PetMutationDataBlackTable[1] = "NONE"

return sData
