local PetsTab = {}

local reg
local CheckLevelTask = nil

function PetsTab.Initialize(registry)
	reg = registry
	local Interface = reg.Interface
	local Tabs = reg.Tabs
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local sData = reg.sData
	local EfTasks = reg.EfTasks
	local Pets = reg.Pets
	local fVar = reg.fVar

	Tabs.Pets = Interface:AddTab({ Title = "Pets", Icon = "paw-print" })

	--#region Age Break Section
	local AgeBreakSection = Tabs.Pets:AddCollapsibleSection("Age Break", false)

	AgeBreakSection:AddToggle("tgAgeBreakEnabled", {
		Title = "Enable Auto Age Break",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.IsAgeBreaking = false
			end
			EfTasks.ToggleTask("AgeBreak", Value, function()
				Pets.AgeBreak()
				task.wait(2)
			end)
			QuickSave()
		end,
	})

	AgeBreakSection:AddDropdown("ddAgeBreakPetType", {
		Title = "Select Pet Type",
		Values = sData.PetsDataTable or {},
		Default = "",
		Multi = false,
		Searchable = true,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakTargetAge", {
		Title = "Target Break Age",
		Description = "Min: 101, Max: 125",
		Default = 125,
		Numeric = true,
		Finished = true,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddDivider()

	AgeBreakSection:AddDropdown("ddAgeBreakAgeCond", {
		Title = "Age Condition",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakAgeVal", {
		Title = "Dupe Age Value",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddDivider()

	AgeBreakSection:AddDropdown("ddAgeBreakWeightCond", {
		Title = "Weight Condition",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakWeightVal", {
		Title = "Dupe Weight Value",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(_Value)
			QuickSave()
		end,
	})
	--#endregion

	--#region Mutant Section

	local MutantSection = Tabs.Pets:AddCollapsibleSection("Mutation", false)

	MutantSection:AddToggle("tgMutantEnabled", {
		Title = "Enable Auto Mutation",
		Default = false,
		Callback = function(Value)
			if Value then
				Pets.FarmLevel()
				task.wait(2)
				local success, err = pcall(function()
					Pets.TargetPetLevelCheck()
				end)
				if not success then
					reg.Log("TargetPetLevelCheck failed: " .. tostring(err))
				end

				task.wait(2)
				CheckLevelTask = task.spawn(function()
					while task.wait(60) do
						local success2, err2 = pcall(function()
							Pets.TargetPetLevelCheck()
						end)
						if not success2 then
							reg.Log("TargetPetLevelCheck failed: " .. tostring(err2))
						else
							reg.Log("Loop TargetPetLevelCheck Success!")
						end
					end
				end)
			else
				fVar.IsMutating = false
				if CheckLevelTask then
					task.cancel(CheckLevelTask)
					CheckLevelTask = nil
				end
			end
			QuickSave()
		end,
	})

	MutantSection:AddButton({
		Title = "Reset Farm Pet UUID",
		Callback = function()
			Pets.resetFarmUUID()
		end,
	})

	MutantSection:AddDropdown("ddMutantMethod", {
		Title = "Select Mutant Method",
		Values = { "None", "Nightmare", "Mutation", "Level", "Elephant", "Venom", "Everchanted" },
		Default = "None",
		Callback = function()
			QuickSave()
		end,
	})
	MutantSection:AddToggle("tgFavoritePet", {
		Title = "Favorite Pet",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})
	MutantSection:AddButton({
		Title = "Clear Selected Mutant Pet Type",
		Callback = function()
			Options.ddMutantPetType:SetValue({})
		end,
	})

	MutantSection:AddDropdown("ddMutantPetType", {
		Title = "Select Mutant Pet Type",
		Values = sData.PetsDataTable or {},
		Default = {},
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddInput("inpMutantTargetAge", {
		Title = "Target Mutant Age",
		Default = 50,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddDivider()

	MutantSection:AddButton({
		Title = "Clear Selected Mutant",
		Callback = function()
			Options.ddTargetMutant:SetValue({ NONE = true })
		end,
	})

	MutantSection:AddDropdown("ddTargetMutant", {
		Title = "Target Mutant",
		Values = sData.PetMutationDataTable or {},
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddInput("LoadOutDelay", {
		Title = "Delay",
		Default = 10,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddDropdown("ddLevelLoadout", {
		Title = "Farm Level Loadout",
		Values = { "0", "1", "2", "3", "4", "5", "6" },
		Default = "1",
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddDropdown("ddTimeLoadout", {
		Title = "Reduce Time Loadout",
		Values = { "0", "1", "2", "3", "4", "5", "6" },
		Default = "2",
		Callback = function()
			QuickSave()
		end,
	})

	MutantSection:AddDropdown("ddClaimLoadout", {
		Title = "Claim Loadout",
		Values = { "0", "1", "2", "3", "4", "5", "6" },
		Default = "3",
		Callback = function()
			QuickSave()
		end,
	})
	--#endregion

	--#region Feed Pets Section
	local FeedPetsSection = Tabs.Pets:AddCollapsibleSection("Feed Pets", false)

	FeedPetsSection:AddToggle("tgFeedPetsEnabled", {
		Title = "Enable Auto Feed Pets",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("FeedPets", Value, function()
				Pets.FeedPets()
				task.wait(30)
			end)
			QuickSave()
		end,
	})

	FeedPetsSection:AddButton({
		Title = "Clear Selected Feed Crops Type",
		Callback = function()
			Options.ddFeedCropsType:SetValue({ ALL = true })
		end,
	})

	FeedPetsSection:AddDropdown("ddFeedCropsType", {
		Title = "Select Crops Type",
		Values = sData.SeedDataTable,
		Default = { "ALL" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	FeedPetsSection:AddInput("inpFeedPetsHunger", {
		Title = "Hunger",
		Default = 50,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	--#endregion

	--#region Egg Section
	local HatchEggSection = Tabs.Pets:AddCollapsibleSection("Hatch Eggs", false)

	HatchEggSection:AddToggle("tgPlaceEggsEn", {
		Title = "Enable Auto Place Eggs",
		Default = false,
		Callback = function(Value)
			Pets.RunHatchSet()
			QuickSave()
		end,
	})
	HatchEggSection:AddButton({
		Title = "Clear Selected Egg Type",
		Callback = function()
			Options.ddPlaceEgg:SetValue({ ALL = true })
		end,
	})
	HatchEggSection:AddDropdown("ddPlaceEgg", {
		Title = "Select Egg Type",
		Values = sData.EggDataTable,
		Default = { "ALL" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("ipMaxEggs", {
		Title = "Max Egg",
		Default = 3,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddPlaceMethod", {
		Title = "Select Place Method",
		Values = { "Set", "Random" },
		Default = "Set",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddPlaceSlot", {
		Title = "Select Place Slot",
		Values = { "1", "2" },
		Default = "1",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddSpeedLoadout", {
		Title = "Speed Loadout",
		Values = { "0", "1", "2", "3", "4", "5", "6" },
		Default = "1",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("inpDelayPlaceEgg", {
		Title = "Delay",
		Default = 2,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDivider()
	HatchEggSection:AddToggle("tgAutoHatchEn", {
		Title = "Enable Auto Hatch",
		Default = false,
		Callback = function(Value)
			Pets.RunHatchSet()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddHatchLoadout", {
		Title = "Select Hatch Loadout",
		Values = { "1", "2", "3", "4", "5", "6" },
		Default = "2",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddButton({
		Title = "Clear Selected Special Pet Type",
		Callback = function()
			Options.ddSpecialHatchPet:SetValue({ NONE = true })
		end,
	})
	HatchEggSection:AddDropdown("ddSpecialHatchPet", {
		Title = "Select Special Pet Type",
		Values = sData.PetsDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("inpSpecialHatchWeight", {
		Title = "Base Weight",
		Default = 3.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddSpecialHatchLoadout", {
		Title = "Select Special Hatch Loadout",
		Values = { "1", "2", "3", "4", "5", "6" },
		Default = "4",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("inpDelayHatchEgg", {
		Title = "Delay",
		Default = 2,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDivider()
	HatchEggSection:AddToggle("tgSellPetEn", {
		Title = "Enable Auto Sell Pet",
		Default = false,
		Callback = function()
			Pets.RunHatchSet()
			QuickSave()
		end,
	})
	HatchEggSection:AddButton({
		Title = "Clear Selected Sell Pet Type",
		Callback = function()
			Options.ddSellPet:SetValue({ NONE = true })
		end,
	})
	HatchEggSection:AddDropdown("ddSellPet", {
		Title = "Select Sell Pet Type",
		Values = sData.PetsDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddSellPetThreshold", {
		Title = "Select Weight Threshold",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("inpSellPetWeight", {
		Title = "Base Weight",
		Default = 3.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddDropdown("ddSellLoadout", {
		Title = "Select Sell Loadout",
		Values = { "1", "2", "3", "4", "5", "6" },
		Default = "3",
		Callback = function()
			QuickSave()
		end,
	})
	HatchEggSection:AddInput("inpDelaySellPet", {
		Title = "Delay",
		Default = 2,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	--#endregion
	--#region Gift Pet Section
	local GiftPetSection = Tabs.Pets:AddCollapsibleSection("Gift Pets", false)

	GiftPetSection:AddButton({
		Title = "Refresh Gift Friends",
		Callback = function()
			local Players = game:GetService("Players")
			local LocalPlayer = Players.LocalPlayer
			local allPlayers = Players:GetPlayers()
			local friendTable = {}
			for _, player in ipairs(allPlayers) do
				if player.Name ~= LocalPlayer.Name then
					table.insert(friendTable, player.Name)
				end
			end
			Options.ddGiftFriends:SetValues(friendTable)
		end,
	})
	GiftPetSection:AddDropdown("ddGiftFriends", {
		Title = "Select Friends",
		Values = {},
		Default = "",
		Callback = function()
			QuickSave()
		end,
	})

	GiftPetSection:AddButton({
		Title = "Clear Selected Gift Pet",
		Callback = function()
			Options.ddGiftPet:SetValue({})
		end,
	})

	GiftPetSection:AddDropdown("ddGiftPet", {
		Title = "Select Gift Pet Type",
		Values = sData.PetsDataTable,
		Default = {},
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	local giftMutant = table.clone(sData.PetMutationDataTable)
	table.insert(giftMutant, 2, "ALL")
	GiftPetSection:AddDropdown("ddGiftPetMutant", {
		Title = "Select Mutant Pet",
		Values = giftMutant,
		Default = { "ALL" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	GiftPetSection:AddDropdown("ddGiftPetThreshold", {
		Title = "Select Weight Threshold",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function()
			QuickSave()
		end,
	})
	GiftPetSection:AddInput("inpGiftPetWeight", {
		Title = "Base Weight",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	GiftPetSection:AddToggle("tgGiftPetEn", {
		Title = "Enable Auto Gift Pet",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("GiftPet", Value, function()
				Pets.GiftPets()
				task.wait(1)
			end)
			QuickSave()
		end,
	})
	GiftPetSection:AddDivider()

	GiftPetSection:AddToggle("tgAcceptGiftPetsEn", {
		Title = "Enable Auto Accept Gift Pet",
		Default = false,
		Callback = function(Value)
			Pets.AcceptGiftPets(Value)
			QuickSave()
		end,
	})

	--#endregion

	--#region Boost Pet Section
	local BoostPetSection = Tabs.Pets:AddCollapsibleSection("Boost Pets", false)

	BoostPetSection:AddDropdown("ddToyPetType", {
		Title = "Select Toy Pet Type",
		Values = sData.PetsDataTable,
		Default = {},
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	--Small Pet Toy
	BoostPetSection:AddToggle("tgSmToy", {
		Title = "Enable Auto Small Pet Toy",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})
	--Medium Pet Toy
	BoostPetSection:AddToggle("tgMdToy", {
		Title = "Enable Auto Medium Pet Toy",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})
	--Large Pet Toy
	BoostPetSection:AddToggle("tgLgToy", {
		Title = "Enable Auto Large Pet Toy",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})

	BoostPetSection:AddToggle("tgBoostPetEn", {
		Title = "Enable Auto Boost Pet",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("BoostPet", Value, function()
				Pets.BoostPet()
				task.wait(1)
			end)
			QuickSave()
		end,
	})

	--#endregion
end

return PetsTab
