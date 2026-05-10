local MainBee = {}
local reg
local CollectionService = game:GetService("CollectionService")
local sData

local function HarvestHoneyFruits()
	local Options = reg.Options
	if not Options.tgHarvestHoneyEnable or not Options.tgHarvestHoneyEnable.Value then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end

	local allPrompts = CollectionService:GetTagged("CollectPrompt")
	for _, prompt in ipairs(allPrompts) do
		if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
			return
		end
		if prompt:IsA("ProximityPrompt") and prompt.Enabled and not prompt:GetAttribute("Collected") then
			local cropModel = prompt.Parent and prompt.Parent.Parent
			if cropModel then
				--seen[cropModel] = true
				--table.insert(ReadyCrops, cropModel)
				sData.CollectEvent:FireServer({ cropModel })
				task.wait(0.2)
			end
		end
	end
end

function MainBee.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local MainBeeSection = EventsTab:AddCollapsibleSection("MainBee", false)
	MainBeeSection:AddToggle("tgHarvestHoneyEnable", {
		Title = "Harvest Honey Fruits Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoHarvestHoney", Value, function()
				HarvestHoneyFruits()
				task.wait(1)
			end)
		end,
	})
end

return MainBee
