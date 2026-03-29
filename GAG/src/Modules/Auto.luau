local getgenv = (getfenv() :: any).getgenv
local Auto = {}
local reg
local fVar
local sData
local Utils
function Auto.Initialize(registry)
	reg = registry
	fVar = reg.fVar
	sData = reg.sData
	Utils = reg.Utils
end

function Auto.RemovePlants()
	local Options = reg.Options
	if not Options.tgRemovePlantsEnable.Value or fVar.isRemovingPlants then
		return
	end
	fVar.isRemovingPlants = true
	local GetSelectedItems = Utils.GetSelectedItems
	local RemovePlantsList = GetSelectedItems(Options.ddRemovePlants.Value)
	local PlantsWeightThreshold = Options.ddRemovePlantsWeight.Value
	local PlantsWeightValue = tonumber(Options.ipRemovePlantsWeight.Value) or 0

	local Plants_Physical = Utils.GetPlantsFolder()
	local Backpack = sData.Backpack
	local Shovel = Backpack:FindFirstChild("Shovel [Destroy Plants]")

	local function checkPlants(object)
		local PlantName = object.Name
		local PlantWeight = object.Weight.Value
		if table.find(RemovePlantsList, PlantName) then
			if PlantsWeightValue > 0 then
				if PlantsWeightThreshold == "Below" then
					if PlantWeight < PlantsWeightValue then
						return true
					end
				elseif PlantsWeightThreshold == "Above" then
					if PlantWeight > PlantsWeightValue then
						return true
					end
				end
			else
				return true
			end
		end
		return false
	end

	if Plants_Physical then
		for _, plant in pairs(Plants_Physical:GetChildren()) do
			if not Options.tgRemovePlantsEnable.Value then
				fVar.isRemovingPlants = false
				return
			end
			Utils.UnequipTool()
			if checkPlants(plant) then
				Utils.EquipTool(Shovel)
				sData.RemoveItemEvent:FireServer(plant)
				task.wait(0.1)
			end
		end
	end
	fVar.isRemovingPlants = false
end

function Auto.Trowel()
	local Options = reg.Options
	if not Options.tgTrowelEnable.Value or fVar.isTroweling then
		return
	end
	fVar.isTroweling = true
	local GetSelectedItems = Utils.GetSelectedItems
	local TrowelPlantsList = GetSelectedItems(Options.ddTrowelPlants.Value)
	local PlantsWeightThreshold = Options.ddTrowelPlantsWeight.Value
	local PlantsWeightValue = tonumber(Options.ipTrowelPlantsWeight.Value) or 0

	Utils.UnequipTool()
	local Plants_Physical = Utils.GetPlantsFolder()
	local Backpack = sData.Backpack
	local Trowel = nil
	for _, item in pairs(Backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match("Trowel") then
			Trowel = item
			break
		end
	end
	if not Trowel then
		getgenv().fLog("🟡 No Trowel")
		fVar.isTroweling = false
		return
	end
	local function checkPlants(object)
		local PlantName = object.Name
		local PlantWeight = object.Weight.Value
		if table.find(TrowelPlantsList, PlantName) then
			if PlantsWeightValue > 0 then
				if PlantsWeightThreshold == "Below" then
					if PlantWeight < PlantsWeightValue then
						return true
					end
				elseif PlantsWeightThreshold == "Above" then
					if PlantWeight > PlantsWeightValue then
						return true
					end
				end
			else
				return true
			end
		end
		return false
	end
	--local TargetCFrame = CFrame.new(fVar.Pos.Trowel)
	local Character = reg.sData.Character
	local TargetCFrame = Character:GetPivot()
	if Plants_Physical then
		for _, plant in pairs(Plants_Physical:GetChildren()) do
			if not Options.tgTrowelEnable.Value then
				fVar.isTroweling = false
				return
			end
			--Utils.UnequipTool()
			if checkPlants(plant) then
				Utils.EquipTool(Trowel)
				local success, response = pcall(function()
					return sData.TrowelEvent:InvokeServer("Pickup", Trowel, plant)
				end)
				if success then
					sData.TrowelEvent:InvokeServer("Place", Trowel, plant, TargetCFrame)
					task.wait(0.1)
				else
					getgenv().fLog("❌ Place failed: " .. tostring(response))
				end
			end
		end
	end
	fVar.isTroweling = false
	if Options.tgTrowelEnable.Value then
		Options.tgTrowelEnable:SetValue(false)
	end
end

function Auto.GetRemovePlantsVar()
	local Options = reg.Options
	local GetSelectedItems = Utils.GetSelectedItems
	return {
		mode = "RemovePlants",
		wl = {
			crops = GetSelectedItems(Options.ddRemoveCrops.Value),
			mutants = GetSelectedItems(Options.ddRemoveMutants.Value),
			variant = GetSelectedItems(Options.ddRemoveVariant.Value),
			weightCondition = Options.ddRemoveWeight.Value,
			weightValue = tonumber(Options.ipRemoveWeight.Value) or 0,
		},
		bl = {
			crops = GetSelectedItems(Options.ddRemoveBlackCrops.Value),
			variant = GetSelectedItems(Options.ddRemoveBlackVariant.Value),
			mutants = GetSelectedItems(Options.ddRemoveBlackMutants.Value),
		},
	}
end

function Auto.RemoveCrops()
	local Options = reg.Options
	local Main = reg.Main
	if not Options.tgRemoveFruitEnable.Value and fVar.isRemovingCrops then
		return
	end
	fVar.isRemovingCrops = true
	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		return
	end
	local Backpack = sData.Backpack
	local Shovel = Backpack:FindFirstChild("Shovel [Destroy Plants]")
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local itemsToCheck = FruitsContainer and FruitsContainer:GetChildren() or { plant }
		for _, item in ipairs(itemsToCheck) do
			Utils.UnequipTool()
			if not Options.tgRemoveFruitEnable.Value then
				fVar.isRemovingCrops = false
				return
			end
			if item:IsA("Model") then
				local config = Auto.GetRemovePlantsVar()
				if Main.CheckCrops(item, config, false) then
					Utils.EquipTool(Shovel)
					sData.RemoveItemEvent:FireServer(item)
					task.wait(0.1)
				end
			end
		end
	end
	fVar.isRemovingCrops = false
end

function Auto.OpenPack() end

return Auto
