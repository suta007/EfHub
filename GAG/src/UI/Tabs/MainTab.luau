local MainTab = {}

local Interface
local Tabs
local Options
local QuickSave
local fVar
local EfTasks
local Main
local sData

function MainTab.Initialize(reg)
	Interface = reg.Interface
	Tabs = reg.Tabs
	Options = reg.Options
	QuickSave = reg.Window.QuickSave
	fVar = reg.fVar
	EfTasks = reg.EfTasks
	Main = reg.Main
	sData = reg.sData

	Tabs.Main = Interface:AddTab({ Title = "Main", Icon = "dices" })
	local PlantsSection = Tabs.Main:AddCollapsibleSection("Plants", false)

	PlantsSection:AddToggle("tgPlantsEnable", {
		Title = "Auto Plants",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.isPlanting = false
			end
			EfTasks.ToggleTask("AutoPlant", Value, function()
				Main.AutoPlant()
				task.wait(2)
			end)
			QuickSave()
		end,
	})
	PlantsSection:AddButton({
		Title = "Clear Selected Seeds",
		Callback = function()
			Options.ddPlantsSeeds:SetValue({})
		end,
	})
	PlantsSection:AddDropdown("ddPlantsSeeds", {
		Title = "Select Seeds",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	PlantsSection:AddDropdown("ddPlantsPos", {
		Title = "Select Plants Position",
		Values = { "Player", "Random" },
		Default = "Player",
		Callback = function(Value)
			QuickSave()
		end,
	})

	local HarvestSection = Tabs.Main:AddCollapsibleSection("Harvest", false)
	HarvestSection:AddToggle("tgHarvestEnable", {
		Title = "Auto Harvest",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.isHarvesting = false
				Main.ClearReadyCrops()
			end
			EfTasks.ToggleTask("AutoHarvest", Value, function()
				Main.HarvestCrops()
				task.wait(0.1)
			end)
			QuickSave()
		end,
	})

	HarvestSection:AddDivider()

	HarvestSection:AddButton({
		Title = "Clear Selected Crops",
		Callback = function()
			Options.ddHarvestCrops:SetValue({ ALL = true })
		end,
	})
	HarvestSection:AddDropdown("ddHarvestCrops", {
		Title = "Select Crops",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	HarvestSection:AddButton({
		Title = "Clear Backlist Crops",
		Callback = function()
			Options.ddHarvestBlackCrops:SetValue({ NONE = true })
		end,
	})
	HarvestSection:AddDropdown("ddHarvestBlackCrops", {
		Title = "Blacklist Crops",
		Values = sData.SeedDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	HarvestSection:AddDivider()
	HarvestSection:AddButton({
		Title = "Clear Selected Mutant",
		Callback = function()
			Options.ddHarvestMutants:SetValue({ ALL = true })
		end,
	})

	HarvestSection:AddDropdown("ddHarvestMutants", {
		Title = "Select Mutants",
		Values = sData.MutationDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	HarvestSection:AddButton({
		Title = "Clear Backlist Mutant",
		Callback = function()
			Options.ddHarvestBlackMutants:SetValue({ NONE = true })
		end,
	})

	HarvestSection:AddDropdown("ddHarvestBlackMutants", {
		Title = "Backlist Mutants",
		Values = sData.MutationDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	HarvestSection:AddDivider()
	HarvestSection:AddDropdown("ddVariant", {
		Title = "Variant",
		Values = { "ALL", "Normal", "Rainbow", "Gold", "Silver", "Diamond" },
		Default = { "ALL" },
		Multi = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	HarvestSection:AddDropdown("ddBlackVariant", {
		Title = "Backlist Variant",
		Values = { "NONE", "Normal", "Rainbow", "Gold", "Silver", "Diamond" },
		Default = { "NONE" },
		Multi = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	HarvestSection:AddDivider()
	HarvestSection:AddDropdown("ddWeight", {
		Title = "Weight",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function(Value)
			QuickSave()
		end,
	})
	HarvestSection:AddInput("ipWeight", {
		Title = "Weight",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	--[[ 
** Sell Section **
	- Sell Enable (Toggle)
	- Sell Crops (Dropdown) + Clear Button
	- Sell Blacklist Crops (Dropdown) + Clear Button
	- Sell Mutants (Dropdown) + Clear Button
	- Sell Blacklist Mutants (Dropdown) + Clear Button
	- Sell Variant (Dropdown)
	- Sell Blacklist Variant (Dropdown)
	- Sell Weight (Dropdown)
	- Sell Weight Value (Input)
	]]
	local SellSection = Tabs.Main:AddCollapsibleSection("Sell", false)
	SellSection:AddToggle("tgSellEnable", {
		Title = "Auto Sell",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.isSelling = false
			else
				Main.SellCrops()
			end
			--[[ 			EfTasks.ToggleTask("AutoSell", Value, function()
				Main.SellCrops()
				task.wait(0.1)
			end) ]]

			QuickSave()
		end,
	})
	SellSection:AddToggle("tgSellAll", {
		Title = "Sell All",
		Default = false,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddButton({
		Title = "Sell Now",
		Callback = function()
			Main.SellCrops()
		end,
	})
	SellSection:AddDivider()
	SellSection:AddButton({
		Title = "Clear Selected Crops",
		Callback = function()
			Options.ddSellCrops:SetValue({ ALL = true })
		end,
	})
	SellSection:AddDropdown("ddSellCrops", {
		Title = "Select Crops",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddButton({
		Title = "Clear Backlist Crops",
		Callback = function()
			Options.ddSellBlackCrops:SetValue({ NONE = true })
		end,
	})
	SellSection:AddDropdown("ddSellBlackCrops", {
		Title = "Backlist Crops",
		Values = sData.SeedDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddDivider()
	SellSection:AddButton({
		Title = "Clear Selected Mutant",
		Callback = function()
			Options.ddSellMutants:SetValue({ ALL = true })
		end,
	})
	SellSection:AddDropdown("ddSellMutants", {
		Title = "Select Mutants",
		Values = sData.MutationDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddButton({
		Title = "Clear Backlist Mutant",
		Callback = function()
			Options.ddSellBlackMutants:SetValue({ NONE = true })
		end,
	})
	SellSection:AddDropdown("ddSellBlackMutants", {
		Title = "Backlist Mutants",
		Values = sData.MutationDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddDivider()
	SellSection:AddDropdown("ddSellVariant", {
		Title = "Variant",
		Values = { "ALL", "Normal", "Rainbow", "Gold", "Silver", "Diamond" },
		Default = { "ALL" },
		Multi = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddDropdown("ddSellBlackVariant", {
		Title = "Backlist Variant",
		Values = { "NONE", "Normal", "Rainbow", "Gold", "Silver", "Diamond" },
		Default = { "NONE" },
		Multi = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddDivider()
	SellSection:AddDropdown("ddSellWeight", {
		Title = "Weight",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function(Value)
			QuickSave()
		end,
	})
	SellSection:AddInput("ipSellWeight", {
		Title = "Weight",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
end
return MainTab
