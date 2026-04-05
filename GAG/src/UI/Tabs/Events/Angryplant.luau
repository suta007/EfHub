local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)
local ProgressionTable = require(ReplicatedStorage.Data.EASTER_SeedGiverQuestProgression)
local SeedEvent = ReplicatedStorage.GameEvents.SeedPackGiverEvent

local Angryplant = {}
local reg
local EfTasks
local QuickSave
local EventsTab
local questPos = CFrame.new(-100.68, 7.91, -9.52) ---100.68,7.91,-9.52
--[[

📋 Script initialized successfully.
[Progression] : 3
[ProgressionSeedPacks] : 0
[HasBeenFed] : true
[HasSeenPopup] : true
[GoldenEgg] : (Table)
  [BuyAmount] : 0
  [LastBuyTime] : 1775356196.09477
[TotalEasterPlaytime] : 5680
[HasSoldEasterPlant] : true
[HasEnabledEasterGarden] : true
[RequiredPlantInfo] : (Table)
  [RequiredPlantSize] : 1.4
  [RequiredPlant] : Easter Gumball
[SeedPackGiverDiscovered] : true
[TotalTrackedPlaytime] : 22474
[HasPurchasedEasterPlant] : true
[HasBeenGivenStarterPack] : true

]]
function Angryplant.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab

	local AngryplantSection = EventsTab:AddCollapsibleSection("Angryplant", false)
	AngryplantSection:AddToggle("tgAngryplantEnable", {
		Title = "Angryplant Enable",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoAngryplant", Value, function()
				Angryplant.autoAngryplant()
				task.wait(10)
			end)
			QuickSave()
		end,
	})
end
local function QuestValue()
	local data = DataService:GetData().EasterEventData
	local currentIdx = data.Progression or 1
	local isCompleted = currentIdx > #ProgressionTable
	if not isCompleted then
		local current = ProgressionTable[currentIdx]
		local name = current.PLANT_NAME or nil
		local weight = current.WEIGHT or 0
		local mutation = current.MUTATION or "ALL"
		local variant = current.VARIANT or "ALL"
		return name, weight, mutation, variant
	end
	return nil, nil, nil, nil
end

local function CheckQuest(fruit)
	local name, weight, mutation, variant = QuestValue()
	if not name then
		return
	end
	local ItemName = fruit:FindFirstChild("Item_String") and fruit:FindFirstChild("Item_String").Value
	local ItemVariant = fruit:FindFirstChild("Variant") and fruit:FindFirstChild("Variant").Value
	local ItemWeight = fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Weight").Value

	if ItemName ~= name then
		return
	end
	if ItemWeight < weight then
		return
	end
	if mutation ~= "ALL" and fruit:GetAttribute(mutation) ~= true then
		return
	end
	if variant ~= "ALL" and ItemVariant ~= variant then
		return
	end
	return true
end

function Angryplant.autoAngryplant()
	local Options = reg.Options
	if not Options.tgAngryplantEnable.Value or reg.IsEasterHarvesting then
		return
	end
	reg.IsEasterHarvesting = true
	local Backpack = reg.sData.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		if CheckQuest(item) then
			reg.sData.Character:PivotTo(questPos)
			task.wait(0.5)
			reg.Utils.EquipTool(item)
			local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
			reg.Log("Submit " .. ItemName)
			task.wait(0.5)
			SeedEvent:FireServer("SubmitHeldPlant")
			task.wait(0.5)
			reg.Utils.ClickButton(reg.Utils.GardenButton)
			task.wait(1)
			reg.IsEasterHarvesting = false
			return
		end
	end
	reg.IsEasterHarvesting = false
end

return Angryplant
