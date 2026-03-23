local Main = {}
local CollectionService = game:GetService("CollectionService")
local reg
local sData
local Utils
local fVar
local readyCrops = {}

function Main.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
end

function Main.GetHarvestVar()
	local Options = reg.Options
	local GetSelectedItems = Utils.GetSelectedItems
	return {
		mode = "Harvest",
		wl = {
			crops = GetSelectedItems(Options.ddHarvestCrops.Value),
			mutants = GetSelectedItems(Options.ddHarvestMutants.Value),
			variant = GetSelectedItems(Options.ddVariant.Value),
			weightCondition = Options.ddWeight.Value,
			weightValue = tonumber(Options.ipWeight.Value) or 0,
		},
		bl = {
			crops = GetSelectedItems(Options.ddHarvestBlackCrops.Value),
			variant = GetSelectedItems(Options.ddBlackVariant.Value),
			mutants = GetSelectedItems(Options.ddHarvestBlackMutants.Value),
		},
	}
end

function Main.AutoPlant()
	local Options = reg.Options
	if not Options.tgPlantsEnable.Value or fVar.isPlanting then
		return
	end
	fVar.isPlanting = true
	local tSeed = Utils.GetSelectedItems(Options.ddPlantsSeeds.Value)
	local Backpack = sData.LocalPlayer.Backpack

	for _, item in pairs(Backpack:GetChildren()) do
		local SeedName = item:GetAttribute("Seed")
		if SeedName and (table.find(tSeed, "ALL") or table.find(tSeed, SeedName)) then
			local Quantity = item:GetAttribute("Quantity")
			for i = 1, Quantity do
				Utils.UnequipTool()
				task.wait(0.1)
				Utils.EquipTool(item)
				task.wait(0.1)
				local PlantsPos
				if Options.ddPlantsPos.Value == "Player" then
					PlantsPos = Utils.GetPosition()
				else
					PlantsPos = Utils.GetRandomPlotPos().Position
				end
				local args = { vector.create(PlantsPos.X, PlantsPos.Y, PlantsPos.Z), SeedName }
				sData.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(args))
			end
		end
	end
	fVar.isPlanting = false
end

function Main.ClearReadyCrops()
	table.clear(readyCrops)
end

function Main.GetAllReadyCrops()
	table.clear(readyCrops)
	local allPrompts = CollectionService:GetTagged("CollectPrompt")

	for _, prompt in ipairs(allPrompts) do
		if prompt:IsA("ProximityPrompt") and prompt.Enabled and not prompt:GetAttribute("Collected") then
			local cropModel = prompt.Parent and prompt.Parent.Parent
			if cropModel then
				table.insert(readyCrops, cropModel)
			end
		end
	end
end

function Main.GetAllReadyCrops2()
	table.clear(readyCrops)
	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		return
	end
	local count = 0
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local itemsToCheck = FruitsContainer and FruitsContainer:GetChildren() or { plant }

		for _, item in ipairs(itemsToCheck) do
			if item:IsA("Model") then
				table.insert(readyCrops, item)
			end
			count = count + 1
			if count % 100 == 0 then
				task.wait()
			end
		end
	end
end

function Main.CheckCrops(fruit, config, HarvestMode)
	if not fruit or not fruit:IsA("Model") then
		return false
	end
	local Mode = HarvestMode or true

	local fruitName = fruit.Name
	local fruitVariant = fruit:FindFirstChild("Variant") and fruit:FindFirstChild("Variant").Value
	local fruitWeight = fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Weight").Value
	--local CropsMutants = fruit:GetAttribute("Mutation")
	if Mode then
		local Prompt = fruit:FindFirstChild("ProximityPrompt", true)
		if not Prompt or not Prompt.Enabled then
			return false
		end
	end
	if fruit:GetAttribute("Favorited") == true then
		return false
	end
	if not table.find(config.wl.crops, "ALL") and not table.find(config.wl.crops, fruitName) then
		return false
	end

	if not table.find(config.wl.variant, "ALL") and not table.find(config.wl.variant, fruitVariant) then
		return false
	end

	if not table.find(config.wl.mutants, "ALL") then
		local isMutantMatch = false

		for _, v in pairs(config.wl.mutants) do
			if fruit:GetAttribute(v) == true then
				isMutantMatch = true
				break
			end
		end
		if not isMutantMatch then
			return false
		end
	end

	if config.wl.weightValue ~= 0 then
		local weight = tonumber(fruitWeight)
		if weight then
			if config.wl.weightCondition == "Below" and weight >= config.wl.weightValue then
				return false
			end
			if config.wl.weightCondition == "Above" and weight <= config.wl.weightValue then
				return false
			end
		else
			return false
		end
	end

	if not table.find(config.bl.crops, "NONE") and table.find(config.bl.crops, fruitName) then
		return false
	end
	if not table.find(config.bl.variant, "NONE") and table.find(config.bl.variant, fruitVariant) then
		return false
	end

	if not table.find(config.bl.mutants, "NONE") then
		local isBlackMutantMatch = false
		for _, v in pairs(config.bl.mutants) do
			if fruit:GetAttribute(v) == true then
				isBlackMutantMatch = true
				break
			end
		end
		if isBlackMutantMatch then
			return false
		end
	end

	return true
end

function Main.HarvestCrops()
	local Options = reg.Options
	if not Options.tgHarvestEnable.Value or fVar.isHarvesting then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end
	fVar.isHarvesting = true
	if #readyCrops == 0 then
		Main.GetAllReadyCrops2()

		if #readyCrops == 0 then
			fVar.isHarvesting = false
			return
		end
	end

	if #readyCrops > 0 then
		local config = Main.GetHarvestVar()
		local crop = table.remove(readyCrops, 1)
		if Main.CheckCrops(crop, config) then
			sData.CollectEvent:FireServer({ crop })
		end
	end
	fVar.isHarvesting = false
end

function Main.GetSellVar()
	local Options = reg.Options
	local GetSelectedItems = Utils.GetSelectedItems
	return {
		mode = "Sell",
		wl = {
			crops = GetSelectedItems(Options.ddSellCrops.Value),
			mutants = GetSelectedItems(Options.ddSellMutants.Value),
			variant = GetSelectedItems(Options.ddSellVariant.Value),
			weightCondition = Options.ddSellWeight.Value,
			weightValue = tonumber(Options.ipSellWeight.Value) or 0,
		},
		bl = {
			crops = GetSelectedItems(Options.ddSellBlackCrops.Value),
			variant = GetSelectedItems(Options.ddSellBlackVariant.Value),
			mutants = GetSelectedItems(Options.ddSellBlackMutants.Value),
		},
	}
end
function Main.CheckItem(item, config)
	local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
	local ItemVariant = item:FindFirstChild("Variant") and item:FindFirstChild("Variant").Value
	local ItemWeight = item:FindFirstChild("Weight") and item:FindFirstChild("Weight").Value

	if not ItemName or not ItemVariant or ItemWeight == nil then
		return false
	end

	if not table.find(config.wl.crops, "ALL") and not table.find(config.wl.crops, ItemName) then
		return false
	end

	if not table.find(config.wl.variant, "ALL") and not table.find(config.wl.variant, ItemVariant) then
		return false
	end

	if not table.find(config.wl.mutants, "ALL") then
		local isMutantMatch = false

		for _, v in pairs(config.wl.mutants) do
			if item:GetAttribute(v) == true then
				isMutantMatch = true
				break
			end
		end
		if not isMutantMatch then
			return false
		end
	end

	if config.wl.weightValue ~= 0 then
		local weight = tonumber(ItemWeight)
		if config.wl.weightCondition == "Below" and weight >= config.wl.weightValue then
			return false
		end
		if config.wl.weightCondition == "Above" and weight <= config.wl.weightValue then
			return false
		end
	end

	if not table.find(config.bl.crops, "NONE") and table.find(config.bl.crops, ItemName) then
		return false
	end
	if not table.find(config.bl.variant, "NONE") and table.find(config.bl.variant, ItemVariant) then
		return false
	end

	if not table.find(config.bl.mutants, "NONE") then
		local isBlackMutantMatch = false
		for _, v in pairs(config.bl.mutants) do
			if item:GetAttribute(v) == true then
				isBlackMutantMatch = true
				break
			end
		end
		if isBlackMutantMatch then
			return false
		end
	end

	return true
end

function Main.SellCrops()
	local Options = reg.Options

	fVar.isSelling = true

	Utils.ClickButton(Utils.SellButton)
	task.wait(0.5)

	if Options.tgSellAll.Value then
		sData.GameEvents.Sell_Inventory:FireServer()
		task.wait(1)
	else
		local config = Main.GetSellVar()
		local Backpack = sData.LocalPlayer.Backpack
		for _, item in pairs(Backpack:GetChildren()) do
			if Main.CheckItem(item, config) then
				Utils.EquipTool(item)
				task.wait(0.1)
				sData.GameEvents.Sell_Item:FireServer()
				task.wait(0.5)
			end
		end
	end
	Utils.ClickButton(Utils.GardenButton)
	task.wait(1)
	fVar.isSelling = false
end

function Main.SellIfFull()
	local Options = reg.Options
	if Options.tgSellIfFull.Value then
		if not sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
			return
		end
	end
	Main.SellCrops()
end

return Main
