local PetsTab = {}

local reg

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
				fVar.isAgeBreaking = false
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
		Callback = function(Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakTargetAge", {
		Title = "Target Break Age",
		Description = "Min: 101, Max: 125",
		Default = 125,
		Numeric = true,
		Finished = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddDivider()

	AgeBreakSection:AddDropdown("ddAgeBreakAgeCond", {
		Title = "Age Condition",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function(Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakAgeVal", {
		Title = "Dupe Age Value",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddDivider()

	AgeBreakSection:AddDropdown("ddAgeBreakWeightCond", {
		Title = "Weight Condition",
		Values = { "Below", "Above" },
		Default = "Below",
		Callback = function(Value)
			QuickSave()
		end,
	})

	AgeBreakSection:AddInput("inpAgeBreakWeightVal", {
		Title = "Dupe Weight Value",
		Default = 0,
		Numeric = true,
		Finished = true,
		Callback = function(Value)
			QuickSave()
		end,
	})
end

return PetsTab
