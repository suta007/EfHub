local PlantTraitsData = require(game:GetService("ReplicatedStorage").Modules.PlantTraitsData)
local Eastersell = {}
local reg
local fVar
local QuickSave
local EfTasks
local EventsTab
local sData
local EasterSlot = table.clone(PlantTraitsData.Traits["EasterSlot"])
table.insert(EasterSlot, 1, "ALL")
local Main
local Utils

function Eastersell.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab
	sData = reg.sData
	fVar = reg.fVar
	Main = reg.Main
	Utils = reg.Utils

	local EastersellSection = EventsTab:AddCollapsibleSection("Eastersell", false)
	EastersellSection:AddToggle("tgEasterHarvestEnable", {
		Title = "Easter Harvest Enable",
		Default = false,
		Callback = function(Value)
			reg.Log("Easter Harvest Toggle")
			EfTasks.ToggleTask("AutoEasterHarvest", Value, function()
				--Eastersell.autoEastersell()
				task.wait(1)
			end)
			QuickSave()
		end,
	})
	EastersellSection:AddButton("btnEasterHarvestAll", {
		Title = "Clear Selected Plants",
		Callback = function()
			Options.ddEasterHarvestPlant:SetValue({ ALL = true })
		end,
	})
	EastersellSection:AddDropdown("ddEasterHarvestPlant", {
		Title = "Easter Harvest Plant",
		Values = EasterSlot,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	EastersellSection:AddDivider()
	EastersellSection:AddToggle("tgEasterSellEnable", {
		Title = "Easter Sell Enable",
		Default = false,
		Callback = function(Value)
			reg.Log("Easter Sell Toggle")
			EfTasks.ToggleTask("AutoEasterSell", Value, function()
				--Eastersell.autoEastersell()
				task.wait(1)
			end)
			QuickSave()
		end,
	})
	EastersellSection:AddToggle("tgEasterSellFull", {
		Title = "Easter Sell Full",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})

	EastersellSection:AddInput("ipEasterSellDelay", {
		Title = "Easter Sell Delay",
		Default = 30,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
end

function Eastersell.HarvestCrops()
	local Options = reg.Options
	if not Options.tgEasterHarvestEnable.Value or fVar.IsEasterHarvesting then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end
	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		return
	end
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local Fruits = FruitsContainer and FruitsContainer:GetChildren() or { plant }

		for _, fruit in ipairs(Fruits) do
			if fruit:IsA("Model") and fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Variant") then
				--
			end
		end
	end
	--sData.CollectEvent:FireServer({ crop })
end

return Eastersell
