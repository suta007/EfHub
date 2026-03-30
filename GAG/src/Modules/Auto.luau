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
	Utils.UnequipTool()
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
			if checkPlants(plant) then
				Utils.EquipTool(Shovel)
				sData.RemoveItemEvent:FireServer(plant)
				task.wait(0.1)
			end
			Utils.UnequipTool()
		end
	end
	fVar.isRemovingPlants = false
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
	task.wait(0.5)
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
	if Plants_Physical then
		for _, plant in pairs(Plants_Physical:GetChildren()) do
			if not Options.tgTrowelEnable.Value then
				fVar.isTroweling = false
				return
			end
			if checkPlants(plant) then
				Utils.EquipTool(Trowel)
				local success, response = pcall(function()
					return sData.TrowelEvent:InvokeServer("Pickup", Trowel, plant)
				end)
				if success then
					sData.TrowelEvent:InvokeServer("Place", Trowel, plant, fVar.Pos.Trowel)
					task.wait(0.5)
				else
					getgenv().fLog("❌ Place failed: " .. tostring(response))
				end
			end
			Utils.UnequipTool()
		end
	end
	fVar.isTroweling = false
	if Options.tgTrowelEnable.Value then
		Options.tgTrowelEnable:SetValue(false)
		task.wait(0.5)
	end
	task.wait(0.5)
end

function Auto.Reclaim()
	local Options = reg.Options
	local GetSelectedItems = Utils.GetSelectedItems
	local ReclaimPlantsList = GetSelectedItems(Options.ddReclaimPlants.Value)
	local PlantsWeightThreshold = Options.ddReclaimPlantsWeight.Value
	local PlantsWeightValue = tonumber(Options.ipReclaimPlantsWeight.Value) or 0
	local Plants_Physical = Utils.GetPlantsFolder()
	local Backpack = sData.Backpack
	local Reclaimer = nil
	for _, item in pairs(Backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match("Reclaimer") then
			Reclaimer = item
			break
		end
	end
	if not Reclaimer then
		getgenv().fLog("🟡 No Reclaimer")
		fVar.isReclaiming = false
		return
	end
	local function checkPlants(object)
		local PlantName = object.Name
		local PlantWeight = object.Weight.Value
		if table.find(ReclaimPlantsList, PlantName) then
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
			if not Options.tgReclaimEnable.Value then
				fVar.isReclaiming = false
				return
			end
			if checkPlants(plant) then
				Utils.EquipTool(Reclaimer)
				sData.ReclaimerEvent:FireServer("TryReclaim", plant)
			end
			Utils.UnequipTool()
		end
	end
	fVar.isReclaiming = false
	if Options.tgReclaimEnable.Value then
		Options.tgReclaimEnable:SetValue(false)
		task.wait(0.5)
	end
	task.wait(0.5)
end

function Auto.Sprinkler()
	local Options = reg.Options
	if not Options.tgSprinklerEnable.Value or fVar.isSprinkling then
		return
	end
	fVar.isSprinkling = true
	local Backpack = sData.Backpack
	local BasicSPK = nil
	local AdvancedSPK = nil
	local GodlySPK = nil
	local MasterSPK = nil
	local GrandmasterSPK = nil
	local OtherSPK = nil
	local ddOtherSPK = Options.ddOtherSPK.Value
	for _, item in pairs(Backpack:GetChildren()) do
		if item:IsA("Tool") then
			if item.Name:match("Basic Sprinkler") then
				BasicSPK = item
			elseif item.Name:match("Advanced Sprinkler") then
				AdvancedSPK = item
			elseif item.Name:match("Godly Sprinkler") then
				GodlySPK = item
			elseif item.Name:match("Master Sprinkler") then
				MasterSPK = item
			elseif item.Name:match("Grandmaster Sprinkler") then
				GrandmasterSPK = item
			end
			if item.Name:match(ddOtherSPK) then
				OtherSPK = item
			end
		end
	end
	Utils.UnequipTool()
	local PositionCF = fVar.Pos.Sprinkler
	if typeof(PositionCF) ~= "CFrame" then
		return
	end
	if BasicSPK then
		local ipBasicSPK = tonumber(Options.ipBasicSPK.Value) or 0
		local qBasicSPK = tonumber(BasicSPK:GetAttribute("e")) or 0
		local MinBasicSPK = math.min(ipBasicSPK, qBasicSPK)
		for i = 1, MinBasicSPK do
			Utils.EquipTool(BasicSPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	if AdvancedSPK then
		local ipAdvancedSPK = tonumber(Options.ipAdvancedSPK.Value) or 0
		local qAdvancedSPK = tonumber(AdvancedSPK:GetAttribute("e")) or 0
		local MinAdvancedSPK = math.min(ipAdvancedSPK, qAdvancedSPK)
		for i = 1, MinAdvancedSPK do
			Utils.EquipTool(AdvancedSPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	if GodlySPK then
		local ipGodlySPK = tonumber(Options.ipGodlySPK.Value) or 0
		local qGodlySPK = tonumber(GodlySPK:GetAttribute("e")) or 0
		local MinGodlySPK = math.min(ipGodlySPK, qGodlySPK)
		for i = 1, MinGodlySPK do
			Utils.EquipTool(GodlySPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	if MasterSPK then
		local ipMasterSPK = tonumber(Options.ipMasterSPK.Value) or 0
		local qMasterSPK = tonumber(MasterSPK:GetAttribute("e")) or 0
		local MinMasterSPK = math.min(ipMasterSPK, qMasterSPK)
		for i = 1, MinMasterSPK do
			Utils.EquipTool(MasterSPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	if GrandmasterSPK then
		local ipGrandmasterSPK = tonumber(Options.ipGrandmasterSPK.Value) or 0
		local qGrandmasterSPK = tonumber(GrandmasterSPK:GetAttribute("e")) or 0
		local MinGrandmasterSPK = math.min(ipGrandmasterSPK, qGrandmasterSPK)
		for i = 1, MinGrandmasterSPK do
			Utils.EquipTool(GrandmasterSPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	if OtherSPK then
		local ipOtherSPK = tonumber(Options.ipOtherSPK.Value) or 0
		local qOtherSPK = tonumber(OtherSPK:GetAttribute("e")) or 0
		local MinOtherSPK = math.min(ipOtherSPK, qOtherSPK)
		for i = 1, MinOtherSPK do
			Utils.EquipTool(OtherSPK)
			sData.SprinklerEvent:FireServer("Create", PositionCF)
			task.wait(0.2)
		end
	end
	fVar.isSprinkling = false
	if Options.tgSprinklerEnable.Value then
		Options.tgSprinklerEnable:SetValue(false)
		task.wait(0.5)
	end
	task.wait(0.5)
end

function Auto.OpenPack() end

return Auto
