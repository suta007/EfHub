local AutoTab = {}
local reg
function AutoTab.Initialize(registry)
	reg = registry
	local Interface = reg.Interface
	local Tabs = reg.Tabs
	local Options = reg.Options
	local QuickSave = reg.Window.QuickSave
	local sData = reg.sData
	local Auto = reg.Auto
	local fVar = reg.fVar
	local EfTasks = reg.EfTasks

	--local Utils = reg.Utils

	Tabs.Auto = Interface:AddTab({ Title = "Automatic", Icon = "bot" })
	-- [[ Remove Plants Section ]]
	local RemoveSection = Tabs.Auto:AddCollapsibleSection("Remove Plants", false)
	RemoveSection:AddToggle("tgRemovePlantsEnable", {
		Title = "Auto Remove Plants",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.IsRemovingPlants = false
			end
			EfTasks.ToggleTask("AutoRemovePlants", Value, function()
				Auto.RemovePlants()
				task.wait(0.1)
			end)
			QuickSave()
		end,
	})
	RemoveSection:AddButton({
		Title = "Clear Selected Plants",
		Callback = function()
			Options.ddRemovePlants:SetValue({})
		end,
	})
	RemoveSection:AddDropdown("ddRemovePlants", {
		Title = "Select Remove Plants",
		Values = sData.SeedDataTable,
		Default = {},
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveSection:AddDropdown("ddRemovePlantsWeight", {
		Title = "Plants Weight Threshold",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveSection:AddInput("ipRemovePlantsWeight", {
		Title = "Plants Weight",
		Default = 0,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	-- [[ Remove Fruit Section ]]
	local RemoveFruitSection = Tabs.Auto:AddCollapsibleSection("Remove Fruit", false)
	RemoveFruitSection:AddToggle("tgRemoveFruitEnable", {
		Title = "Auto Remove Fruit",
		Default = false,
		Callback = function(Value)
			if not Value then
				fVar.IsRemovingCrops = false
			end
			EfTasks.ToggleTask("AutoRemoveCrops", Value, function()
				Auto.RemoveCrops()
				task.wait(0.1)
			end)
			QuickSave()
		end,
	})
	RemoveFruitSection:AddDivider()
	RemoveFruitSection:AddButton({
		Title = "Clear Selected Remove Crops",
		Callback = function()
			Options.ddRemoveCrops:SetValue({ ALL = true })
		end,
	})
	RemoveFruitSection:AddDropdown("ddRemoveCrops", {
		Title = "Select Remove Crops",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddButton({
		Title = "Clear Backlist Remove Crops",
		Callback = function()
			Options.ddRemoveBlackCrops:SetValue({ NONE = true })
		end,
	})
	RemoveFruitSection:AddDropdown("ddRemoveBlackCrops", {
		Title = "Blacklist Remove Crops",
		Values = sData.SeedDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddDivider()
	RemoveFruitSection:AddButton({
		Title = "Clear Selected Mutant",
		Callback = function()
			Options.ddRemoveMutants:SetValue({ ALL = true })
		end,
	})
	RemoveFruitSection:AddDropdown("ddRemoveMutants", {
		Title = "Select Mutants",
		Values = sData.MutationDataTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddButton({
		Title = "Clear Backlist Mutant",
		Callback = function()
			Options.ddRemoveBlackMutants:SetValue({ NONE = true })
		end,
	})
	RemoveFruitSection:AddDropdown("ddRemoveBlackMutants", {
		Title = "Backlist Mutants",
		Values = sData.MutationDataBlackTable,
		Multi = true,
		Default = { "NONE" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddDivider()
	RemoveFruitSection:AddDropdown("ddRemoveVariant", {
		Title = "Variant",
		Values = { "ALL", "Silver", "Gold" },
		Default = { "ALL" },
		Multi = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddDropdown("ddRemoveBlackVariant", {
		Title = "Backlist Variant",
		Values = { "NONE", "Silver", "Gold" },
		Default = { "NONE" },
		Multi = true,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddDivider()
	RemoveFruitSection:AddDropdown("ddRemoveWeight", {
		Title = "Weight",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function()
			QuickSave()
		end,
	})
	RemoveFruitSection:AddInput("ipRemoveWeight", {
		Title = "Weight",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	--Trowel Section
	local TrowelSection = Tabs.Auto:AddCollapsibleSection("Trowel", false)
	TrowelSection:AddButton({
		Title = "Set Position",
		Callback = function()
			-- set position of trowel
			--fVar.Pos.Trowel = sData.Character:GetPivot()
			local Pos = sData.Character:GetPivot().Position
			local formattedPos = string.format("%.3f, %.3f, %.3f", Pos.X, Pos.Y, Pos.Z)
			Options.ipTrowelPosition:SetValue(formattedPos)
			QuickSave()
		end,
	})
	TrowelSection:AddInput("ipTrowelPosition", {
		Title = "Trowel Position",
		Default = "",
		Placeholder = "X, Y, Z",
		Numeric = false,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	TrowelSection:AddDivider()
	TrowelSection:AddToggle("tgTrowelEnable", {
		Title = "Trowel",
		Default = false,
		Callback = function(Value)
			if Value then
				task.spawn(Auto.Trowel)
			else
				fVar.IsTroweling = false
			end
		end,
	})
	TrowelSection:AddButton({
		Title = "Clear Selected Trowel",
		Callback = function()
			Options.ddTrowelPlants:SetValue({})
		end,
	})
	TrowelSection:AddDropdown("ddTrowelPlants", {
		Title = "Trowel Type",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	TrowelSection:AddDropdown("ddTrowelPlantsWeight", {
		Title = "Plants Weight Threshold",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function()
			QuickSave()
		end,
	})
	TrowelSection:AddInput("ipTrowelPlantsWeight", {
		Title = "Plants Weight",
		Default = 0,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	--Reclaim Section
	local ReclaimSection = Tabs.Auto:AddCollapsibleSection("Reclaim", false)
	ReclaimSection:AddToggle("tgReclaimEnable", {
		Title = "Reclaim",
		Default = false,
		Callback = function(Value)
			if Value then
				task.spawn(Auto.Reclaim)
			else
				fVar.IsReclaiming = false
			end
		end,
	})

	ReclaimSection:AddButton({
		Title = "Clear Selected Reclaim",
		Callback = function()
			Options.ddReclaimPlants:SetValue({})
		end,
	})

	ReclaimSection:AddDropdown("ddReclaimPlants", {
		Title = "Reclaim Type",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	ReclaimSection:AddDropdown("ddReclaimPlantsWeight", {
		Title = "Plants Weight Threshold",
		Values = { "Below", "Above" },
		Default = "Below",
		Multi = false,
		Callback = function()
			QuickSave()
		end,
	})
	ReclaimSection:AddInput("ipReclaimPlantsWeight", {
		Title = "Plants Weight",
		Default = 0,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	--Sprinkler Section
	local SprinklerSection = Tabs.Auto:AddCollapsibleSection("Sprinkler", false)
	SprinklerSection:AddButton({
		Title = "Set Position",
		Callback = function()
			local Pos = sData.Character:GetPivot().Position
			local formattedPos = string.format("%.3f, %.3f, %.3f", Pos.X, Pos.Y, Pos.Z)
			Options.ipSprinklerPosition:SetValue(formattedPos)
			QuickSave()
		end,
	})

	SprinklerSection:AddInput("ipSprinklerPosition", {
		Title = "Sprinkler Position",
		Default = "",
		Placeholder = "X, Y, Z",
		Numeric = false,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddDivider()
	SprinklerSection:AddToggle("tgSprinklerEnable", {
		Title = "Sprinkler",
		Default = false,
		Callback = function(Value)
			if Value then
				task.spawn(Auto.Sprinkler)
			else
				fVar.IsSprinkling = false
			end
		end,
	})
	SprinklerSection:AddInput("ipBasicSPK", {
		Title = "Number of Basic Sprinkler",
		Default = 5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddInput("ipAdvancedSPK", {
		Title = "Number of Advanced Sprinkler",
		Default = 3,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddInput("ipGodlySPK", {
		Title = "Number of Godly Sprinkler",
		Default = 2,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddInput("ipMasterSPK", {
		Title = "Number of Master Sprinkler",
		Default = 1,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddInput("ipGrandmasterSPK", {
		Title = "Number of Grandmaster Sprinkler",
		Default = 1,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddDropdown("ddOtherSPK", {
		Title = "Select Other Sprinkler",
		Values = sData.SprinklerDataTable,
		Default = { "NONE" },
		Multi = false,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddInput("ipOtherSPK", {
		Title = "Number of Other Sprinkler",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	SprinklerSection:AddDivider()
	SprinklerSection:AddToggle("tgCatLead", {
		Title = "Cat Lead",
		Default = false,
		Callback = function(Value)
			if Value then
				task.spawn(Auto.CatLead)
			else
				fVar.IsCatLeading = false
			end
		end,
	})
	--Open Pack Section
	local OpenPackSection = Tabs.Auto:AddCollapsibleSection("Open Pack", false)
	OpenPackSection:AddToggle("tgOpenPackEnable", {
		Title = "Auto Open Pack",
		Default = false,
		Callback = function(Value)
			if Value then
				task.spawn(function()
					pcall(Auto.OpenSeedPack)
				end)
			else
				fVar.IsOpeningPack = false
			end
			QuickSave()
		end,
	})
	OpenPackSection:AddDropdown("ddOpenPack", {
		Title = "Select Seed Pack",
		Values = sData.SeedPackTable,
		Default = { "ALL" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	OpenPackSection:AddInput("ipOpenPackDelay", {
		Title = "Delay",
		Default = 10,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	--Craft Section
	local CraftSection = Tabs.Auto:AddCollapsibleSection("Craft", false)
	CraftSection:AddToggle("tgCraftGearEnable", {
		Title = "Auto Craft",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoCraftGear", Value, function()
				Auto.CraftGear()
				task.wait(60)
			end)
			QuickSave()
			if not Value then
				fVar.CraftGearRunning = false
			end
		end,
	})
	CraftSection:AddDropdown("ddCraftGear", {
		Title = "Select Craft",
		Values = sData.GearEventDataTable,
		Default = "",
		Multi = false,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	--
end

return AutoTab
