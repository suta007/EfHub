local MainTab = {}

local Interface
local Tabs
local Options
local QuickSave
local sData
local fVar
local Main
local actionQueue
local TaskPlantsSeeds, TaskHarvestCrops
function MainTab.Initialize(reg)
	Interface = reg.Interface
	Tabs = reg.Tabs
	Options = reg.Options
	QuickSave = reg.Window.QuickSave
	sData = reg.sData
	fVar = reg.fVar
	Main = reg.Main
	actionQueue = reg.fVar.actionQueue
	Tabs.Main = Interface:AddTab({ Title = "Main", Icon = "dices" })
	local PlantsSection = Tabs.Main:AddCollapsibleSection("Plants", false)
	PlantsSection:AddToggle("tgPlantsEnable", {
		Title = "Auto Plants",
		Default = false,
		Callback = function(Value)
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
		Values = fVar.SeedDataTable,
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
end
return MainTab
