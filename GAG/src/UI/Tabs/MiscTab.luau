local MiscTab = {}
local reg

function MiscTab.Initialize(Registry)
	reg = Registry
	local Options = Registry.Options
	_ = Options
	local Interface = Registry.Interface
	local Tabs = Registry.Tabs
	local QuickSave = Registry.Window.QuickSave
	local Misc = Registry.Misc
	local sData = Registry.sData

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
			Misc.HideTracker()
			QuickSave()
		end,
	})

	AntiLagSection:AddToggle("tgHidePlants", {
		Title = "Hide Plants",
		Default = false,
		Callback = function(Value)
			Misc.HidePlant(Value)
			Misc.HideTracker()
			QuickSave()
		end,
	})
	--[[ 
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
		Values = sData.PlantDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
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
		end,
	})
	EspSection:AddDropdown("ddEspPlants", {
		Title = "Select Plants",
		Values = sData.PlantDataBlackTable,
		Default = { "NONE" },
		Multi = true,
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
		 ]]
end

return MiscTab
