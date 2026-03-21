local MainTab = {}

local Interface
local Tabs
local Options
local QuickSave
local fVar
local EfTasks
local Main
local Utils

function MainTab.Initialize(reg)
	Interface = reg.Interface
	Tabs = reg.Tabs
	Options = reg.Options
	QuickSave = reg.Window.QuickSave
	fVar = reg.fVar
	EfTasks = reg.EfTasks
	Main = reg.Main
	Utils = reg.Utils

	Tabs.Main = Interface:AddTab({ Title = "Main", Icon = "dices" })
	local PlantsSection = Tabs.Main:AddCollapsibleSection("Plants", false)

	PlantsSection:AddButton({
		Title = "Test Random Position",
		Callback = function()
			local pos = Utils.GetRandomPlotPos()
			getgenv().fLog("Random Position: " .. tostring(pos.Position))
		end,
	})

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
