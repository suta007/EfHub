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

	local MyFarm = Utils.GetMyFarm()
	local Farm_Important = MyFarm:FindFirstChild("Important")
	local Plants_Physical = Farm_Important and Farm_Important:FindFirstChild("Plants_Physical")
	local Backpack = sData.Backpack
	local Shovel = Backpack:FindFirstChild("Shovel [Destroy Plants]")

	local function checkPlants(object)
		local PlantName = object.Name
		local PlantWeight = object.Weight.Value
		if table.find(RemovePlantsList, PlantName) then
			if PlantsWeightThreshold == "Below" then
				if PlantWeight < PlantsWeightValue then
					return true
				end
			elseif PlantsWeightThreshold == "Above" then
				if PlantWeight > PlantsWeightValue then
					return true
				end
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

function Auto.RemoveCrops()
	local Options = reg.Options
	if not Options.tgRemoveFruitEnable:GetValue() then
		return
	end
end

function Auto.OpenPack() end

return Auto
