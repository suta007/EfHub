-- workspace arttibute  SummerHarvest : Bool
local Summer = {}
local reg
local sData
local Utils
local Workspace = game:GetService("Workspace")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData)
local SummerPlants = PlantTraitsData.Traits.Summer

local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local SummerHarvestRemoteEvent = GameEvents:WaitForChild("SummerHarvestRemoteEvent")
local SummerCheck = nil

local function SummitSummer()
	local Options = reg.Options
	if not Options.tgSummerHarvestEnable or not Options.tgSummerHarvestEnable.Value then
		return
	end
	local EventStart = Workspace:GetAttribute("SummerHarvest")
	if not EventStart then
		return
	end
	local Backpack = sData.LocalPlayer.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
		if not item:GetAttribute("d") and item:HasTag("FruitTool") and table.find(SummerPlants, ItemName) then
			Utils.EquipTool(item)
			task.wait(0.1)
			SummerHarvestRemoteEvent:FireServer("SubmitHeldPlant")
			task.wait(1)
			return
		end
	end
end
function Summer.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	Utils = reg.Utils
	sData = reg.sData

	local SummerSection = EventsTab:AddCollapsibleSection("SummerHarvest", false)
	SummerSection:AddToggle("tgSummerHarvestEnable", {
		Title = "Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if Value then
				SummerCheck = Workspace:GetAttributeChangedSignal("SummerHarvest"):Connect(function()
					SummitSummer()
				end)
			else
				if SummerCheck then
					SummerCheck:Disconnect()
					SummerCheck = nil
				end
			end
		end,
	})
end

return Summer
