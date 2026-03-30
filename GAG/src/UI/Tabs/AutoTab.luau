local AutoTab = {}
local reg
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
--local TaskRemovePlants, TaskRemoveFruit
local SprinklerTask = nil
local TrowelTask = nil
local ReclaimTask = nil
local CatLeadTask = nil
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
				fVar.isRemovingPlants = false
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
				fVar.isRemovingCrops = false
			end
			EfTasks.ToggleTask("AutoRemoveCrops", Value, function()
				Auto.RemoveCrops()
				task.wait(0.1)
			end)
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

	local TrowelSection = Tabs.Auto:AddCollapsibleSection("Trowel", false)
	TrowelSection:AddButton({
		Title = "Set Position",
		Callback = function()
			-- set position of trowel
			fVar.Pos.Trowel = sData.Character:GetPivot()
			Options.TrowelPosition:SetValue("Position: " .. tostring(fVar.Pos.Trowel.Position))
		end,
	})

	TrowelSection:AddParagraph("TrowelPosition", {
		Title = "Trowel Position",
		Content = "Waiting for set position...",
	})
	if fVar.Pos.Trowel ~= nil then
		Options.TrowelPosition:SetValue("Position: " .. tostring(fVar.Pos.Trowel.Position))
	end
	TrowelSection:AddDivider()
	TrowelSection:AddToggle("tgTrowelEnable", {
		Title = "Trowel",
		Default = false,
		Callback = function(Value)
			if Value then
				TrowelTask = task.spawn(function()
					Auto.Trowel()
				end)
			else
				if TrowelTask then
					pcall(task.cancel, TrowelTask)
					TrowelTask = nil
				end
				fVar.isTroweling = false
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

	local ReclaimSection = Tabs.Auto:AddCollapsibleSection("Reclaim", false)
	ReclaimSection:AddToggle("tgReclaimEnable", {
		Title = "Reclaim",
		Default = false,
		Callback = function(Value)
			if Value then
				ReclaimTask = task.spawn(function()
					Auto.Reclaim()
				end)
			else
				if ReclaimTask then
					pcall(task.cancel, ReclaimTask)
					ReclaimTask = nil
				end
				fVar.isReclaiming = false
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
	local SprinklerSection = Tabs.Auto:AddCollapsibleSection("Sprinkler", false)
	SprinklerSection:AddButton({
		Title = "Set Position",
		Callback = function()
			-- set position of sprinkler
			fVar.Pos.Sprinkler = sData.Character:GetPivot()
			Options.SprinklerPosition:SetValue("Position: " .. tostring(fVar.Pos.Sprinkler.Position))
		end,
	})

	SprinklerSection:AddParagraph("SprinklerPosition", {
		Title = "Sprinkler Position",
		Content = "Waiting for set position...",
	})
	if fVar.Pos.Sprinkler ~= nil then
		Options.SprinklerPosition:SetValue("Position: " .. tostring(fVar.Pos.Sprinkler.Position))
	end
	SprinklerSection:AddDivider()
	SprinklerSection:AddToggle("tgSprinklerEnable", {
		Title = "Sprinkler",
		Default = false,
		Callback = function(Value)
			if Value then
				SprinklerTask = task.spawn(function()
					Auto.Sprinkler()
				end)
			else
				if SprinklerTask then
					pcall(task.cancel, SprinklerTask)
					SprinklerTask = nil
				end
				fVar.isSprinkling = false
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
				CatLeadTask = task.spawn(function()
					Auto.CatLead()
				end)
			else
				if CatLeadTask then
					pcall(task.cancel, CatLeadTask)
					CatLeadTask = nil
				end
				fVar.isCatLeading = false
			end
		end,
	})

	--[[	local OpenPackSection = Tabs.Auto:AddCollapsibleSection("Open Pack", false)
	OpenPackSection:AddToggle("tgOpenPackAnimation", {
		Title = "Disable Animation",
		Default = false,
		Callback = function(Value)
			if Value then
				pcall(function()
					Auto.disablePackAnimations()
				end)
			else
				pcall(function()
					Auto.enablePackAnimations()
				end)
			end
			--QuickSave()
		end,
	}) ]]

	--[[ 	Options.tgOpenPackAnimation:SetValue(false)
	-- toggle enable
	OpenPackSection:AddToggle("tgOpenPackEnable", {
		Title = "Auto Open Pack",
		Default = false,
		Callback = function(Value)
			if Value then
				fVar.LockDownControlVar()
				Auto.OpenPack()
				fVar.ResetControlVar()
			else
				fVar.ResetControlVar()
			end 
			QuickSave()
		end,
	}) ]]
	-- dropdown select seed pack
	--[[ 	OpenPackSection:AddDropdown("ddOpenPackSelect", {
		Title = "Select Seed Pack",
		Values = {}, --sData.SeedPackTable,
		Default = { "ALL" },
		Multi = true,
		Searchable = true,
		Callback = function(Value)
			QuickSave()
		end,
	}) ]]
end

return AutoTab
