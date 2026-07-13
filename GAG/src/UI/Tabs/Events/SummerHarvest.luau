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
local SamTheClamService = GameEvents:WaitForChild("SamTheClamService_RE")

local SummerCheck = nil
local EventStart = Workspace:GetAttribute("SummerHarvest")

local isSummiting = false

local function SummitSummer()
	if isSummiting then
		return
	end

	local Options = reg.Options
	if not Options.tgSummerHarvestEnable or not Options.tgSummerHarvestEnable.Value then
		isSummiting = false
		return
	end
	if not EventStart then
		isSummiting = false
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
		isSummiting = false
		return
	end
	isSummiting = true
	local SubmitDelay = tonumber(Options.inpSubmitDelay and Options.inpSubmitDelay.Value) or 0.5
	local EquipDelay = tonumber(Options.inpEquipDelay and Options.inpEquipDelay.Value) or 0.1

	local Backpack = sData.LocalPlayer.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		if not EventStart then
			isSummiting = false
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

local function Shelldon()
	local Options = reg.Options
	if not Options.tgShelldonEnable or not Options.tgShelldonEnable.Value then
		return
	end
	if not Options.ddShelldonPetType or not Options.ddShelldonPetType.Value then
		reg.Log("Select Pet Type!!", "ERROR")
		return
	end
	local GetData_result = sData.DataService:GetData()
	local SamTheClam = GetData_result.SamTheClam

	local IsRunning = SamTheClam.IsRunning or false
	local RewardReady = SamTheClam.RewardReady or false

	if RewardReady then
		SamTheClamService:FireServer("ClaimReward")
		task.wait(2)
		GetData_result = sData.DataService:GetData()
		SamTheClam = GetData_result.SamTheClam
		IsRunning = SamTheClam.IsRunning or false
	end

	--[[ 	if not IsRunning then
		local ShelldonPetType = Utils.GetSelectedItems(Options.ddShelldonPetType.Value)

		local Backpack = sData.Backpack
		pcall(function()
			sData.Humanoid:UnequipTool()
			task.wait(0.1)
		end)

		for _, item in pairs(Backpack:GetChildren()) do
			if item:GetAttribute("ItemType") == "Pet" and not item:GetAttribute("d") then
				local isSelectedPet = table.find(ShelldonPetType, item:GetAttribute("f"))
				if isSelectedPet then
					pcall(function()
						sData.Humanoid:EquipTool(item)
						task.wait(0.3)
					end)
					SummerHarvestRemoteEvent:FireServer("SubmitHeldPet")
					return
				end
			end
		end

		--[[ 		local Inventory = GetData_result and GetData_result.PetsData and GetData_result.PetsData.PetInventory
		if not Inventory then
			return
		end

		for _, tData in pairs(Inventory) do
			if type(tData) ~= "table" then
				continue
			end
			for _, pet in pairs(tData) do
				if type(pet) ~= "table" then
					continue
				end
				local petType = pet.PetType
				if not petType then
					continue
				end
				--local uuid = pet.UUID
				--local petLevel = tonumber(pet.PetData.Level)
				---local petWeight = tonumber(pet.PetData.BaseWeight)

				if table.find(ShelldonPetType, petType) then
					if not pet.IsFavorite and (not pet.MutationType or pet.MutationType=="m") then


					end
				end
			end
		end ]]
	--[[end ]]
	return
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
				isSummiting = false
				EventStart = false
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

	local Shelldon = EventsTab:AddCollapsibleSection("Shelldon", false)

	Shelldon:AddDropdown("ddShelldonPetType", {
		Title = "Select Pet Type",
		Values = sData.PetsDataTable or {},
		Default = "",
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	Shelldon:AddButton({
		Title = "Clear Selected Pet Type",
		Callback = function()
			Options.ddShelldonPetType:SetValue({})
		end,
	})

	Shelldon:AddToggle("tgShelldonEnable", {
		Title = "Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("Shelldon", Value, function()
				Shelldon()
				task.wait(10)
			end)
		end,
	})
end

return Summer
