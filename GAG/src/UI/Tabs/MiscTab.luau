local MiscTab = {}
local reg

function MiscTab.Initialize(Registry)
	reg = Registry
	local Options = Registry.Options
	local Interface = Registry.Interface
	local Tabs = Registry.Tabs
	local QuickSave = Registry.Window.QuickSave
	local Misc = Registry.Misc
	local sData = Registry.sData
	local EfTasks = reg.EfTasks

	Tabs.MiscTab = Interface:AddTab({ Title = "Misc", Icon = "flower" })
	local MiscSection = Tabs.MiscTab:AddCollapsibleSection("Misc", false)
	MiscSection:AddButton({
		Title = "Reset Control Var",
		Callback = function()
			--reg.fVar.ResetControlVar()
		end,
	})

	local AntiLagSection = Tabs.MiscTab:AddCollapsibleSection("AntiLag", false)
	AntiLagSection:AddToggle("tgAntiLag", {
		Title = "AntiLag",
		Default = false,
		Callback = function(Value)
			if Value then
				Misc.AntiLag()
			end
			QuickSave()
		end,
	})

	AntiLagSection:AddToggle("tgHideFruits", {
		Title = "Hide Fruits",
		Default = false,
		Callback = function(Value)
			Misc.HideFruit(Value)
			QuickSave()
		end,
	})

	AntiLagSection:AddToggle("tgHidePlants", {
		Title = "Hide Plants",
		Default = false,
		Callback = function(Value)
			Misc.HidePlant(Value)
			QuickSave()
		end,
	})

	AntiLagSection:AddDivider()
	AntiLagSection:AddToggle("tgDisable3D", {
		Title = "Disable 3D",
		Default = false,
		Callback = function(Value)
			Misc.Disable3D(Value)
			QuickSave()
		end,
	})
	AntiLagSection:AddDivider()
	AntiLagSection:AddToggle("tgHideEvent", {
		Title = "Hide Event Decorations",
		Default = false,
		Callback = function(Value)
			Misc.HideEvent(Value)
			QuickSave()
		end,
	})

	AntiLagSection:AddDivider()
	AntiLagSection:AddToggle("tgHideFarm", {
		Title = "Hide Other Players' Farms",
		Default = false,
		Callback = function(Value)
			Misc.HideFarm(Value)
			QuickSave()
		end,
	})

	local EspSection = Tabs.MiscTab:AddCollapsibleSection("Esp", false)
	EspSection:AddToggle("tgEspCrops", {
		Title = "Esp Crops",
		Default = false,
		Callback = function(Value)
			Misc.EspCrops(Value)
			QuickSave()
		end,
	})
	EspSection:AddButton({
		Title = "Clear Selected Crops",
		Callback = function()
			Options.ddEspCrops:SetValue({ NONE = true })
		end,
	})
	EspSection:AddDropdown("ddEspCrops", {
		Title = "Select Crops",
		Values = sData.SeedDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	EspSection:AddDivider()

	EspSection:AddToggle("tgEspPlants", {
		Title = "Esp Plants",
		Default = false,
		Callback = function(Value)
			Misc.EspPlants(Value)
			QuickSave()
		end,
	})
	EspSection:AddButton({
		Title = "Clear Selected Plants",
		Callback = function()
			Options.ddEspPlants:SetValue({ NONE = true })
			if Options.tgEspPlants.Value then
				Misc.EspPlants(true)
			end
			QuickSave()
		end,
	})
	EspSection:AddDropdown("ddEspPlants", {
		Title = "Select Plants",
		Values = sData.SeedDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function()
			if Options.tgEspPlants.Value then
				Misc.EspPlants(true)
			end
			QuickSave()
		end,
	})
	EspSection:AddDivider()
	EspSection:AddToggle("tgEspEggs", {
		Title = "Esp Eggs",
		Default = false,
		Callback = function(Value)
			Misc.EspEggs(Value)
			QuickSave()
		end,
	})
	EspSection:AddToggle("tgEspCrates", {
		Title = "Esp Crates",
		Default = false,
		Callback = function(Value)
			Misc.EspCrates(Value)
			QuickSave()
		end,
	})

	local SeasonPassSection = Tabs.MiscTab:AddCollapsibleSection("Season Pass", false)
	SeasonPassSection:AddToggle("tgSeasonPassQuests", {
		Title = "Season Pass Quests",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoSeasonPassQuests", Value, function()
				Misc.SeasonPassQuests()
				task.wait(60)
			end)
			QuickSave()
		end,
	})
	SeasonPassSection:AddToggle("tgSeasonPassRewards", {
		Title = "Season Pass Rewards",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoSeasonPassRewards", Value, function()
				Misc.SeasonPassRewards()
				task.wait(60)
			end)
			QuickSave()
		end,
	})
end

return MiscTab
