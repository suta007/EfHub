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
	MutantSection:AddDropdown("ddMutantMethod", {
		Title = "Select Mutant Method",
		Values = { "None", "Nightmare", "Mutation", "Level", "Elephant", "Venom" },
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
end

return PetsTab
