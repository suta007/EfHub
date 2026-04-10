local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.SettingsRegistry)
require(v1.Modules.PlatformService.Signal)
require(v1.Data.CraftingData.CraftingTypeRegistry)
require(v1.Data.QuestData.Types)
require(v1.Types.SlotServiceTypes)
require(v1.Types.PetTypes)
require(v1.Data.GardenGuideData.GardenGuideTypes)
require(v1.Data.CookingPotType)
require(v1.Data.DiggingMinigame.DiggingTypes)
require(v1.Data.NPCLevels.NPCLevelData.NPCLevelTypes)
require(v1.Data.RebirthConfigData)
require(v1.Data.TendablePlantTypes)
require(v1.Data.InfGrowPlantData.InfGrowPlantTypes)
require(v1.Modules.GiveServiceCommon)
local v3 = require(v1.Data.DiggingMinigame.DiggingConfigData)
local v4 = require(v1.Data.TradeTokenData)
local function v_u_9(p5)
	-- upvalues: (copy) v_u_9
	local v6 = table.clone(p5)
	for v7, v8 in v6 do
		if type(v8) == "table" then
			v6[v7] = v_u_9(v8)
		end
	end
	return v6
end
local v10 = {
	["Backpack"] = {},
	["Gamepasses"] = {},
	["PlantedObjects"] = {},
	["PlantedObjectsNew"] = {},
	["SavedFruit"] = {},
	["LastSaveTime"] = 0,
	["LastPetsSaveTime"] = nil,
	["LastPetsIncubationTime"] = nil,
	["FirstTimeUser"] = true,
	["PlayedGuaranteedLuckyHarvest"] = false,
	["ToyCodeCooldown"] = 0,
	["NewPlayersServers"] = {
		["ShouldTeleport"] = true,
	},
	["Migrated"] = {},
	["CropsSold"] = 0,
	["TotalCropsValueSold"] = 0,
	["GardenGuide"] = {
		["GardenGuideColor"] = nil,
		["PlantData"] = {},
		["PetData"] = {},
		["CosmeticData"] = {},
		["FoodData"] = {},
		["MutationData"] = {},
	},
	["CropMastery"] = {
		["PlantData"] = {},
	},
	["ShopTabData"] = {},
	["RebirthData"] = {
		["TotalRebirths"] = 0,
		["LastRebirthTime"] = 0,
		["RequiredPlants"] = {},
	},
	["Sheckles"] = 20,
	["DailyEgg"] = {
		["Stock"] = nil,
		["LastPurchaseDay"] = 0,
	},
	["GardenLevel"] = {
		["TotalExperience"] = 0,
		["ClaimedLevelRewards"] = {},
	},
	["SeasonPass"] = {},
	["NPCPoints"] = {},
	["SpecialCurrency"] = {
		["Honey"] = 0,
		["SummerCoins"] = 0,
		["Chi"] = 0,
		["GardenCoins"] = 0,
		["FairyPoints"] = 0,
		["PassPoints"] = 0,
		["CandyCorn"] = 0,
		["AdventToken"] = 0,
		["CarrotCoins"] = 0,
		["ButtercupCoins"] = 0,
		["HeartCoins"] = 0,
	},
	["Fertilizer"] = {
		["FertilizedPlants"] = {},
	},
	["TendablePlants"] = {
		["DEFAULT"] = {},
	},
	["InfGrowPlants"] = {
		["DEFAULT"] = {},
	},
	["CookingPot"] = {
		["SubmittedIngredients"] = {},
		["CookingEndTime"] = nil,
		["FinishedFoodRawData"] = nil,
		["IsCooking"] = false,
		["CookTimeTotal"] = 0,
		["BestRecipe"] = nil,
		["MutationChance"] = 0,
		["WaterColor"] = nil,
	},
	["CookingKit"] = {
		["DEFAULT"] = {},
	},
	["TravelingHoneyMerchant"] = {
		["SubmittedWeight"] = 0,
	},
	["TraderEventData"] = {
		["LastClaimedCycle"] = 0,
		["StreakEndTime"] = 0,
		["CurrentStreak"] = 0,
		["MaxStreak"] = 0,
	},
	["DiggingData"] = {
		["DataCycle"] = 0,
		["RemainingDigs"] = v3.MAX_DIGS_AVALIABLE,
		["DigComplete"] = false,
		["GridSize"] = -1,
		["NextDiggingGainTime"] = 0,
		["TreasureData"] = {},
		["GridData"] = {},
	},
	["SafariEvent"] = {
		["ContibutedPoints"] = 0,
		["TotalRewardsClaimed"] = 0,
		["IndivdualRewardPoints"] = 0,
		["V1Contributions"] = 0,
		["Version"] = 0,
		["ItemRewardsReceived"] = {},
		["ItemRewardsLockedOut"] = {},
	},
}
local v11 = {
	["Advent"] = {
		["Days"] = {},
		["CurrentQuestContainer"] = nil,
		["QuestGeneration"] = 0,
		["FinalRewardClaimed"] = nil,
		["PendingRobuxClaimDay"] = nil,
	},
	["Gifting"] = {
		["GiftsGiven"] = 0,
		["ItemRewardsLockedOut"] = {},
		["ItemRewardsReceived"] = {},
		["FruitGiven"] = {},
		["SubmissionCycle"] = -1,
	},
	["SubmissionPoints"] = 0,
	["ChristmasGlow"] = {
		["CurrentScore"] = 0,
		["LastClaimedThreshold"] = 0,
		["ResetsPerformed"] = 0,
	},
	["GiftingV2"] = {
		["CurrentGift"] = nil,
		["SubmissionPoints"] = 0,
		["TotalGiftsClaimed"] = 0,
		["LastClaimedCycle"] = 0,
		["CurrentCycle"] = 0,
	},
	["ChristmasTree"] = {
		["SubmissionPoints"] = 0,
		["SubmissionRewardsClaimed"] = 0,
		["LastSubmitTime"] = 0,
		["TreeSize"] = 0,
		["RewardBracketsClaimed"] = {},
		["HighestClaimedBracket"] = 0,
		["ClaimedTreeCount"] = 0,
		["HasATree"] = false,
	},
}
v10.ChristmasEvent = v11
v10.HungryBirdsEvent = {
	["CooldownTime"] = 0,
}
local v12 = {
	["Quests"] = {
		["CurrentQuestContainer"] = nil,
		["QuestGeneration"] = 0,
	},
	["Buttercup_Seeds"] = -1,
	["EventActivated"] = false,
}
v10.ButtercupEvent = v12
v10.BlackButtercupEvent = {
	["CurrentQuestIndex"] = 1,
	["ButtercupsGiven"] = 0,
}
local v13 = {
	["Completed"] = {
		false,
		false,
		false,
		false,
		false,
	},
	["Completed2"] = {
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
	},
	["Reward2PriceMultiplier"] = 1,
}
v10.ValentinesEvent = v13
v10.AdminQuest = nil
v10.LevelData = {}
v10.ClaimedCodes = {
	["FREE_PANDA_PET_UPDATE"] = false,
}
v10.SeedStocks = {}
v10.GearStock = {
	["Gear"] = 0,
	["Stocks"] = {},
	["ForcedGear"] = nil,
	["ForcedGearEndTimestamp"] = nil,
}
v10.PetEggStock = {
	["Egg"] = 0,
	["Stocks"] = {},
	["ForcedEgg"] = nil,
	["ForcedEggEndTimestamp"] = nil,
}
v10.CosmeticStock = {
	["CosmeticSeed"] = 0,
	["PermanentPurchases"] = {},
	["ForcedCosmetic"] = nil,
	["ForcedCosmeticEndTimestamp"] = nil,
	["TabStocks"] = {},
}
v10.EventShopStock = {}
v10.UnlockedEventShopItems = {}
v10.TravelingMerchantShopStock = {
	["MerchantType"] = nil,
	["Stocks"] = {},
	["MerchantStartTime"] = 0,
	["LifetimePurchases"] = {},
}
v10.GardenCoinShopStock = {
	["LastRefreshed"] = nil,
	["LastTimePurchasedGardenCoin"] = nil,
	["Stocks"] = {},
}
v10.GardenCoinShopStats = {
	["UnlockedGardenCoins"] = false,
	["LifetimeGardenCoins"] = 0,
	["LifetimePurchases"] = {},
}
v10.DailyQuests = {
	["Day"] = 0,
	["ContainerId"] = "",
	["RunStartDay"] = 0,
	["DailyRewards"] = {},
	["DaysCompleted"] = 0,
}
v10.SavedObjects = {}
v10.ExtraBackpackSize = 0
v10.InventoryData = {}
v10.QuestContainers = {}
v10.BadgeData = {}
v10.AwardedBadges = {}
local v14 = {
	["MutableStats"] = {
		["MaxEquippedPets"] = 3,
		["MaxPetsInInventory"] = 60,
		["MaxEggsInFarm"] = 3,
	},
	["PurchasedEquipSlots"] = 0,
	["PurchasedEggSlots"] = 0,
	["PurchasedPetInventorySlots"] = 0,
	["PetPouchUses"] = 0,
	["EquippedPets"] = {},
	["PetInventory"] = {
		["Counter"] = 0,
		["Data"] = {},
	},
	["PetLoadouts"] = {
		{},
		{},
		{},
		{},
		{},
		{},
	},
	["PetIncubatorData"] = {
		["IncubatorData"] = {},
	},
	["PetEggIncubatorData"] = {
		["IncubatorData"] = {},
	},
	["SelectedPetLoadout"] = 1,
	["MaxLoadoutSlots"] = 3,
}
v10.PetsData = v14
v10.InfinitePack = {
	["Depth"] = 0,
	["Day"] = 0,
}
v10.InfinitePack_AdRewards1 = {
	["Depth"] = 1,
	["Day"] = 1,
}
v10.InfinitePack_AdRewards2 = {
	["Depth"] = 0,
	["Day"] = 0,
}
v10.AdRewardsWateringCanProgress = {
	["Depth"] = 0,
	["Day"] = 0,
}
v10.EventInfinitePack = {}
v10.StarterPack = {
	["Started"] = false,
	["ContainerId"] = nil,
	["Timer"] = nil,
	["ShowTimer"] = nil,
}
v10.TotalRobuxSpent = 0
v10.TotalTokensSpent = 0
v10.Transactions = {}
v10.ItemGiftHistory = {
	["Plants"] = {},
	["Pets"] = {},
}
local v15 = {
	["Inventory"] = {},
	["History"] = {
		["Sent"] = {},
		["Received"] = {},
	},
}
v10.Gifts = v15
v10.Settings = {
	["Textures"] = v2.Textures.SettingsData.DefaultValue,
	["FavoriteIcons"] = v2.FavoriteIcons.SettingsData.DefaultValue,
	["VisualEffects"] = v2.VisualEffects.SettingsData.DefaultValue,
	["GearShopButton"] = v2.GearShopButton.SettingsData.DefaultValue,
	["PetShopButton"] = v2.PetShopButton.SettingsData.DefaultValue,
	["RecieveGifts"] = v2.RecieveGifts.SettingsData.DefaultValue,
	["PetUpdateRate"] = v2.PetUpdateRate.SettingsData.DefaultValue,
	["PlantableCollisions"] = v2.PlantableCollisions.SettingsData.DefaultValue,
	["TradeRequests"] = v2.TradeRequests.SettingsData.DefaultValue,
	["Tips"] = v2.Tips.SettingsData.DefaultValue,
	["AutoCloseActivePetsUI"] = v2.AutoCloseActivePetsUI.SettingsData.DefaultValue,
	["CropMutationVFX"] = v2.CropMutationVFX.SettingsData.DefaultValue,
	["PetMutationVFX"] = v2.PetMutationVFX.SettingsData.DefaultValue,
	["PetScaling"] = v2.PetScaling.SettingsData.DefaultValue,
	["KeepPetOnGround"] = v2.KeepPetOnGround.SettingsData.DefaultValue,
	["LowerPlantFXQuality"] = v2.LowerPlantFXQuality.SettingsData.DefaultValue,
	["PerformanceMode"] = v2.PerformanceMode.SettingsData.DefaultValue,
	["ToggleNotifications"] = v2.ToggleNotifications.SettingsData.DefaultValue,
}
v10.DefaultSettingsAlreadySet = {}
local v16 = {
	["Inventory"] = {},
	["MutableStats"] = {
		["MaxEquippedCosmetics"] = 0,
		["MaxCosmeticsInInventory"] = 0,
		["MaxCratesInFarm"] = 0,
	},
	["Equipped"] = {},
}
v10.CosmeticData = v16
v10.ExpansionsData = {
	["Unlocked"] = {},
	["ExpansionTimers"] = {},
	["CanSeeExpansions"] = false,
}
v10.PlayerFlags = {
	["ResetCosmetic"] = false,
	["ResetStats"] = false,
	["LogAllRemoteCalls"] = false,
	["HasDuplicatedPets"] = nil,
	["GotGreenbeanTools"] = nil,
	["PrunedRecipesUsedIn"] = nil,
	["ReturnedGardenCoinPurchases"] = false,
}
v10.AB_FTUELuckBoost_Timer = nil
v10.PlayedEggTutorial = false
v10.GardenLikes = {
	["Likes"] = 0,
	["LikedBy"] = {},
	["LikedGardens"] = {},
}
v10.PetMutationMachine = {
	["SubmittedPet"] = nil,
	["TimeLeft"] = 0,
	["IsRunning"] = false,
	["PetReady"] = false,
}
v10.PetAgeBreakMachine = {
	["SubmittedPet"] = nil,
	["TimeLeft"] = 0,
	["IsRunning"] = false,
	["PetReady"] = false,
}
v10.UnlockedRecipes = {}
v10.CraftingData = {
	["GlobalCraftingObjectData"] = {},
}
v10.InventorySortData = {}
local v17 = {
	["SelectedSlot"] = "DEFAULT",
}
local v18 = {
	["DEFAULT"] = {
		["LastLoaded"] = os.time(),
		["LastSaveTime"] = os.time(),
		["SlotName"] = "Save Slot #1",
		["PlantedObjects"] = {},
		["SavedObjects"] = {},
		["EquippedCosmetics"] = {},
		["SelectedFenceSkin"] = "DEFAULT",
	},
}
v17.AllSlots = v18
v17.UnlockedBefore = false
v10.SaveSlots = v17
v10.BoxingMachineData = {
	["BoxingMachines"] = {},
}
v10.TradeHistory = {
	["Shard"] = 1,
	["RecentTrades"] = {},
}
v10.BoothHistory = {
	["Shard"] = 1,
	["RecentTransactions"] = {},
}
local v19 = {
	["Tokens"] = 0,
	["ViewInventoryPermission"] = "Everyone",
	["UnfairTradeWarning"] = true,
}
local v20 = {
	["Pin"] = nil,
	["Recovery"] = nil,
	["Disable"] = {
		["Attempts"] = 3,
		["LastReset"] = 0,
	},
	["Match"] = {
		["Attempts"] = 3,
		["LastReset"] = 0,
	},
}
v19.Pin = v20
v19.Listings = {}
v19.TradeLocks = {}
v19.TokenAmounts = {
	["All"] = v_u_9(v4.TokenAmountsTemplate),
}
v19.RecentlyViewedListingIds = {}
v10.TradeData = v19
v10.Pity = {}
v10.PunnishmentData = {
	["Warnings"] = {},
}
v10.FenceSkinData = {
	["OwnedFences"] = {},
}
v10.TradeBoothSkinData = {
	["OwnedSkins"] = {},
	["CurrentSkin"] = nil,
}
v10.Achievements = {
	["Seasons"] = {},
}
v10.RaccoonSteals = {}
v10.GiftHatchEggAttempts = 0
v10.ArbitraryFTUEData = {
	["AcknowledgedBackpack"] = false,
}
v10.GiveawayData = {}
v10.PermanentGears = {}
v10.PlayerGiftCooldown = {}
local v21 = {
	["SnowGlobe"] = {
		["TimesUsed"] = 0,
		["CurrentChance"] = 0,
		["FirstUsed"] = 0,
	},
	["ChristmasStockings"] = {},
	["ChristmasStockingsTutorialCompleted"] = false,
	["WonderWaterTutorialCompleted"] = false,
}
v10.GearUseData = v21
return v10
