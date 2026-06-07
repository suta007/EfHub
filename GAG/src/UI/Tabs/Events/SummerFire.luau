local SummerFire = {}
local reg
local sData

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local SummerEventControllers = Modules:WaitForChild("SummerEventControllers")
local SummerCraftingController = SummerEventControllers:WaitForChild("SummerCraftingController")
local SummerCraftingConfig = require(SummerCraftingController.SummerCraftingConfig)

local Craftables = SummerCraftingConfig.Craftables
local DataService = require(Modules.DataService)

local SummerCraftingService = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("SummerCraftingService")
local StartCraftRemote = SummerCraftingService:WaitForChild("StartCraft")
local ClaimCraftRemote = SummerCraftingService:WaitForChild("ClaimCraft")

local emptySlot = {}
local CraftList = {}

for _i, data in pairs(Craftables) do
	if data.Result and data.Result.Value then
		if type(data.Result.Value) == "string" then
			table.insert(CraftList, data.Result.Value)
		end
	end
end

local function getInvUUID(GetData, Name)
	local inventory = GetData.InventoryData or {}
	for uuid, value in pairs(inventory) do
		if value.ItemType == Name or (value.ItemData.EggName and value.ItemData.EggName == Name) or (value.ItemData.ItemName and value.ItemData.ItemName == Name) then
			print(Name, " UUID : ", uuid)
			return uuid
		end
	end
	return nil
end

local function getCosmeticUUID(GetData, cosmeticName)
	local inventory = GetData.CosmeticData and GetData.CosmeticData.Inventory or {}
	for uuid, value in pairs(inventory) do
		if value.Name == cosmeticName then
			return uuid
		end
	end
	return nil
end

local function GetRecipeUUID(recipes)
	local UUIDs = {}
	if type(recipes) ~= "table" then
		return nil
	end
	local GetData_result = DataService:GetData()
	for _i, recipe in pairs(recipes) do
		if recipe["Type"] == "Cosmetic" then
			local uuid = getCosmeticUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, "Cosmetic:" .. uuid)
			else
				return nil
			end
		elseif recipe["Type"] == "Pet" then
			--do not thing
			return nil
		elseif recipe["Type"] ~= "Currency" then
			local uuid = getInvUUID(GetData_result, recipe["Value"])
			if uuid then
				table.insert(UUIDs, uuid)
			else
				return nil
			end
		end
	end
	return UUIDs
end

local function claimCraft()
	table.clear(emptySlot)
	local GetData_result = DataService:GetData()
	local SummerCraftingEventData = GetData_result.SummerCraftingEventData
	for index, values in pairs(SummerCraftingEventData) do
		if index == "Slots" then
			if typeof(values) == "table" then
				for i, data in pairs(values) do
					if typeof(data) ~= "table" then
						print("Slot :" .. i .. " is empty")
						table.insert(emptySlot, i)
					elseif tonumber(data.RemainingTime) <= 0 then
						ClaimCraftRemote:FireServer(i)
						table.insert(emptySlot, i)
					end
				end
			end
		end
	end
end

local function startCraft()
	local Options = reg.Options
	if not Options.ddTargetCraft or not Options.ddTargetCraft.Value or Options.ddTargetCraft.Value == "" then
		return
	end
	local targetCraft = Options.ddTargetCraft.Value
	local TierIndex = {}
	for _i, data in pairs(Craftables) do
		if data.Result and data.Result.Value then
			TierIndex[data.Tier] = (TierIndex[data.Tier] or 0) + 1

			if data.Result.Value == targetCraft then
				local key = string.format("%d:%d:%s", data.Tier, TierIndex[data.Tier], data.Result.Value)
				local result = GetRecipeUUID(data.Recipe)
				if result then
					local args = { key, result }
					StartCraftRemote:FireServer(unpack(args))
				else
					print("Missing ingredient(s)")
				end
			end
		end
	end
end

function SummerFire.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local SummerFireSection = EventsTab:AddCollapsibleSection("SummerFire Craft", false)

	SummerFireSection:AddInput("ipWaitTime", {
		Title = "Wait Time (s)",
		Default = 30,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	SummerFireSection:AddDropdown("ddTargetCraft", {
		Title = "Target Craft",
		Default = "",
		Options = CraftList,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	SummerFireSection:AddToggle("tgAutoCraft", {
		Title = "Auto Craft",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoCraft", Value, function()
				claimCraft()
				task.wait(1)
				for _i = 1, #emptySlot do
					startCraft()
					task.wait(0.5)
				end
				task.wait(tonumber(Options.ipWaitTime.Value) or 10)
			end)
		end,
	})
end
return SummerFire
