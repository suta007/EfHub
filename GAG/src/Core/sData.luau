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
sData.RemoveItemEvent = sData.GameEvents:WaitForChild("Remove_Item")
sData.TrowelEvent = sData.GameEvents:WaitForChild("TrowelRemote")
sData.ReclaimerEvent = sData.GameEvents:WaitForChild("ReclaimerService_RE")
sData.SprinklerEvent = sData.GameEvents:WaitForChild("SprinklerService")
sData.RefreshActivePetsUI = sData.GameEvents:WaitForChild("RefreshActivePetsUI")
sData.PetsServiceEvent = sData.GameEvents:WaitForChild("PetsService")
sData.SeedPackEvent = sData.GameEvents:WaitForChild("SeedPack")

sData.ClaimSeasonPassRewardRemote = sData.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassReward")
sData.ClaimSeasonPassInfRewardRemote = sData.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassInfReward") 
sData.ClaimSeasonPassQuestRemote = sData.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassQuest")
sData.BuySeasonPassStockRemote = sData.GameEvents:WaitForChild("SeasonPass"):WaitForChild("BuySeasonPassStock")

sData.SeasonPassData = require(sData.Data:WaitForChild("SeasonPass"):WaitForChild("SeasonPassData") :: any)
sData.SeasonPassUtils = require(sData.Modules:WaitForChild("SeasonPass"):WaitForChild("SeasonPassUtils") :: any)
sData.SeasonPassStaticData = require(sData.Data:WaitForChild("SeasonPass"):WaitForChild("SeasonPassStaticData") :: any)


sData.PetServices = sData.Modules:WaitForChild("PetServices") :: any
sData.ActivePetsService = require(sData.PetServices.ActivePetsService)
sData.PetUtils = require(sData.PetServices.PetUtilities)

sData.Backpack = sData.LocalPlayer:WaitForChild("Backpack")

sData.Lighting = game:GetService("Lighting")
sData.Terrain = workspace.Terrain

sData.CoreGui = game:GetService("CoreGui")

sData.PetShardService_RE = sData.GameEvents:WaitForChild("PetShardService_RE")
sData.Workspace = game:GetService("Workspace")

--function sData.Initialize(registry)
--	reg = registry
--end

local SEED_SHOP_DATA = require(sData.Data:WaitForChild("SeedShopData") :: any)
sData.SeedShopTable = { "ALL" }
for seedName, _seedInfo in pairs(SEED_SHOP_DATA) do
	table.insert(sData.SeedShopTable, seedName)
end

local DAILY_SEED_SHOP_DATA = require(sData.Data:WaitForChild("DailySeedShopData") :: any)
sData.DailySeedShopTable = { "ALL" }
for seedName, _seedInfo in pairs(DAILY_SEED_SHOP_DATA) do
	table.insert(sData.DailySeedShopTable, seedName)
end

local SEED_DATA = require(sData.Data:WaitForChild("SeedData") :: any)
sData.SeedDataTable = { "ALL" }
for seedName, _seedInfo in pairs(SEED_DATA) do
	table.insert(sData.SeedDataTable, seedName)
end
sData.SeedDataBlackTable = table.clone(sData.SeedDataTable)
sData.SeedDataBlackTable[1] = "NONE"

local MUTATION_DATA = sData.DataService:GetData().GardenGuide.MutationData
sData.MutationDataTable = { "ALL" }
for MutationName, _MutationInfo in pairs(MUTATION_DATA) do
	table.insert(sData.MutationDataTable, MutationName)
end
sData.MutationDataBlackTable = table.clone(sData.MutationDataTable)
sData.MutationDataBlackTable[1] = "NONE"

local PET_LIST = require(sData.PetRegistry:WaitForChild("PetList") :: any)
sData.PetsDataTable = {}
sData.HungerDataTable = {}
for petName, petInfo in pairs(PET_LIST) do
	table.insert(sData.PetsDataTable, petName)
	sData.HungerDataTable[petName] = petInfo["DefaultHunger"]
end

local PET_MUTATION_DATA = require(sData.PetRegistry:WaitForChild("PetMutationRegistry") :: any)
sData.PetMutationDataTable = { "NONE" }
sData.EnumToNameCache = {}
for mutantName, mutantInfo in pairs(PET_MUTATION_DATA["PetMutationRegistry"]) do
	if type(mutantInfo) == "table" and mutantInfo.EnumId then
		table.insert(sData.PetMutationDataTable, mutantName)
		sData.EnumToNameCache[mutantInfo.EnumId] = mutantName
	end
end
sData.PetMutationDataBlackTable = table.clone(sData.PetMutationDataTable)
sData.PetMutationDataBlackTable[1] = "NONE"

local GEAR_DATA = require(sData.Data:WaitForChild("GearShopData") :: any)
sData.GearShopTable = { "ALL" }
for gearName, _gearInfo in pairs(GEAR_DATA["Gear"]) do
	table.insert(sData.GearShopTable, gearName)
end

local EGG_DATA = require(sData.Data:WaitForChild("PetEggData") :: any)
sData.EggShopTable = { "ALL" }
for eggName, _eggInfo in pairs(EGG_DATA) do
	table.insert(sData.EggShopTable, eggName)
end

local TRAVELING_DATA = require(sData.Data:WaitForChild("TravelingMerchant"):WaitForChild("TravelingMerchantData") :: any)
sData.TravelingMerchantTable = {}
for Name, data in pairs(TRAVELING_DATA) do
	if type(data.ShopData) == "table" then
		sData.TravelingMerchantTable[Name] = {}
		for itemName, _itemInfo in pairs(data.ShopData) do
			table.insert(sData.TravelingMerchantTable[Name], itemName)
		end
	end
end

sData.SprinklerData = require(sData.Data:WaitForChild("SprinklerData") :: any)
sData.SprinklerDataTable = { "NONE" }
for itemName, _itemInfo in pairs(sData.SprinklerData["SprinklerBoxSizes"]) do
	table.insert(sData.SprinklerDataTable, itemName)
end

local EVENT_DATA = require(sData.Data:WaitForChild("EventShopData") :: any)
--[[ sData.SantaShopTable = { "ALL" }
for itemName, _itemInfo in pairs(EVENT_DATA["Santa's Stash"]) do
	table.insert(sData.SantaShopTable, itemName)
end

sData.NewYearShopTable = { "ALL" }
for itemName, _itemInfo in pairs(EVENT_DATA["New Years Shop"]) do
	table.insert(sData.NewYearShopTable, itemName)
end ]]

sData.EasterShopTable = { "ALL" }
for itemName, _itemInfo in pairs(EVENT_DATA["Easter Seed Shop"]) do
	table.insert(sData.EasterShopTable, itemName)
end

local SEED_PACK_DATA = require(sData.Data:WaitForChild("SeedPackData") :: any)
sData.SeedPackTable = { "ALL" }
for _, info in pairs(SEED_PACK_DATA.Packs) do
	if info.DisplayName then
		table.insert(sData.SeedPackTable, info.DisplayName)
	end
end

--["ShopItems"] = require(v1.Data.SeasonPass.SeasonPassData).ShopItems

local SEASON_PASS_SHOP_DATA = sData.SeasonPassData.ShopItems
sData.SeasonPassShopTable = { "ALL" }
sData.SeasonPassPriceTable = {}
for itemName, itemInfo in pairs(SEASON_PASS_SHOP_DATA) do
	table.insert(sData.SeasonPassShopTable, itemName)
	sData.SeasonPassPriceTable[itemName] = itemInfo.Price
end

return sData
