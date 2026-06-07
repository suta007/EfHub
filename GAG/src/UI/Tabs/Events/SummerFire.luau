local SummerFire = {}
local reg
local sData
local Utils

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
				reg.Log("Missing ingredient: " .. recipe["Value"], "WARN")
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
				reg.Log("Missing ingredient: " .. recipe["Value"], "WARN")
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

local function BurnFruit()
	local Options = reg.Options
	if not Options.tgAutoBurn or not Options.tgAutoBurn.Value then
		return
	end
	if tonumber(workspace:GetAttribute("EmberCount")) >= 60000 then
		return
	end
	local GetSelectedItems = Utils.GetSelectedItems
	local ddBurnFruit = GetSelectedItems(Options.ddBurnFruit.Value)
	local Backpack = sData.LocalPlayer.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
		if not item:GetAttribute("d") and item:HasTag("FruitTool") and (table.find(ddBurnFruit, "ALL") or table.find(ddBurnFruit, ItemName)) then
			Utils.EquipTool(item)
			task.wait(0.1)
			--sData.GameEvents.Sell_Item:FireServer()
			sData.GameEvents.SummerFire.Submit:FireServer()
			return
		end
	end
end

function SummerFire.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	Utils = reg.Utils
	local EfTasks = reg.EfTasks

	local BurnSection = EventsTab:AddCollapsibleSection("SummerFire Burn", false)

	BurnSection:AddDropdown("ddBurnFruit", {
		Title = "Select Fruit for burn",
		Values = sData.SeedDataTable,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	BurnSection:AddButton({
		Title = "Clear Selected Fruit for burn",
		Callback = function()
			Options.ddBurnFruit:SetValue({})
		end,
	})

	BurnSection:AddInput("ipDelayBurn", {
		Title = "Delay (s)",
		Default = 1,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})
	BurnSection:AddToggle("tgAutoBurn", {
		Title = "Auto Burn",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoBurn", Value, function()
				BurnFruit()
				task.wait(tonumber(Options.ipDelayBurn.Value) or 1)
			end)
		end,
	})

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
		--Default = "",
		Values = CraftList,
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
