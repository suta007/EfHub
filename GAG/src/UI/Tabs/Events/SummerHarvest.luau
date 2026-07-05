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
local EventStart = Workspace:GetAttribute("SummerHarvest")

local isSummiting = false

local function SummitSummer()
	if isSummiting then
		return
	end

	local Options = reg.Options
	if not Options.tgSummerHarvestEnable or not Options.tgSummerHarvestEnable.Value then
		return
	end
	if not EventStart then
		return
	end

	local GetData_result = sData.DataService:GetData()
	local SummerHarvestTeamData = GetData_result.SummerHarvestTeamData
	local DayPoints = SummerHarvestTeamData.DayPoints

	local Points = 0
	for _, val in pairs(DayPoints) do
		Points = tonumber(val)
	end

	local MaxPoint = tonumber(Options.inpMaxPoint and Options.inpMaxPoint.Value) or 150000
	if Points >= MaxPoint then
		return
	end
	isSummiting = true
	local SubmitDelay = tonumber(Options.inpSubmitDelay and Options.inpSubmitDelay.Value) or 0.5
	local EquipDelay = tonumber(Options.inpEquipDelay and Options.inpEquipDelay.Value) or 0.1

	local Backpack = sData.LocalPlayer.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		if not EventStart then
			return
		end
		local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
		if not item:GetAttribute("d") and item:HasTag("FruitTool") and table.find(SummerPlants, ItemName) then
			Utils.EquipTool(item)
			task.wait(EquipDelay)
			SummerHarvestRemoteEvent:FireServer("SubmitHeldPlant")
			task.wait(SubmitDelay)
		end
	end
	isSummiting = false
end
function Summer.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	Utils = reg.Utils
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local SummerSection = EventsTab:AddCollapsibleSection("SummerHarvest", false)

	SummerSection:AddInput("inpLoopDelay", {
		Title = "Loop Delay",
		Default = 5,
		Numeric = true,
		Finished = true,
		Callback = function(v)
			if v == "" then
				v = 5
			end
			QuickSave()
		end,
	})

	SummerSection:AddInput("inpEquipDelay", {
		Title = "Equip Delay",
		Default = 0.1,
		Numeric = true,
		Finished = true,
		Callback = function(v)
			if v == "" then
				v = 0.1
			end
			QuickSave()
		end,
	})
	SummerSection:AddInput("inpSubmitDelay", {
		Title = "Submit Delay",
		Default = 0.5,
		Numeric = true,
		Finished = true,
		Callback = function(v)
			if v == "" then
				v = 0.5
			end
			QuickSave()
		end,
	})

	SummerSection:AddInput("inpMaxPoint", {
		Title = "Max Point",
		Default = 150000,
		Numeric = true,
		Finished = true,
		Callback = function(v)
			if v == "" then
				v = 150000
			end
			QuickSave()
		end,
	})

	SummerSection:AddToggle("tgSummerHarvestEnable", {
		Title = "Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if Value then
				SummerCheck = Workspace:GetAttributeChangedSignal("SummerHarvest"):Connect(function()
					EventStart = Workspace:GetAttribute("SummerHarvest")
				end)
			else
				if SummerCheck then
					SummerCheck:Disconnect()
					SummerCheck = nil
				end
			end

			EfTasks.ToggleTask("SummerHarvest", Value, function()
				local LoopDelay = tonumber(Options.inpLoopDelay and Options.inpLoopDelay.Value) or 5
				SummitSummer()
				task.wait(LoopDelay)
			end)
		end,
	})
end

return Summer
