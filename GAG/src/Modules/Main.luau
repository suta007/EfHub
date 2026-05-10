local Main = {}
local CollectionService = game:GetService("CollectionService")
local reg
local sData
local Utils
local fVar
local ReadyCrops = {}

local function ShouldMatchMutants(target, mutantList)
	if table.find(mutantList, "ALL") then
		return true
	end
	for _, mutantName in ipairs(mutantList) do
		if target:GetAttribute(mutantName) == true then
			return true
		end
	end
	return false
end

local function IsBlockedByBlackMutants(target, mutantList)
	if table.find(mutantList, "NONE") then
		return false
	end
	for _, mutantName in ipairs(mutantList) do
		if target:GetAttribute(mutantName) == true then
			return true
		end
	end
	return false
end

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
	if not Options.tgPlantsEnable.Value or fVar.IsPlanting then
		return
	end
	Utils.RunWithFlag("IsPlanting", "AutoPlant", function()
		local tSeed = Utils.GetSelectedItems(Options.ddPlantsSeeds.Value)
		local seedAmount = tonumber(Options.ipPlantsAmount.Value) or 0
		local Backpack = sData.LocalPlayer.Backpack
		for _, item in ipairs(Backpack:GetChildren()) do
			if not Options.tgPlantsEnable.Value then
				fVar.IsPlanting = false
				return
			end
			local SeedName = item:GetAttribute("Seed")
			if SeedName and (table.find(tSeed, "ALL") or table.find(tSeed, SeedName)) then
				local Quantity = 0
				local hasAmount = tonumber(item:GetAttribute("Quantity")) or 0
				if seedAmount == 0 then
					Quantity = hasAmount
				else
					Quantity = math.min(seedAmount, hasAmount)
				end
				for _ = 1, Quantity do
					if not Options.tgPlantsEnable.Value then
						return
					end
					Utils.UnequipTool()
					task.wait(0.1)
					Utils.EquipTool(item)
					task.wait(0.1)
					local PlantsPos
					if Options.ddPlantsPos.Value == "Player" then
						PlantsPos = Utils.GetPosition()
					elseif Options.ddPlantsPos.Value == "Set" then
						PlantsPos = Utils.ParseVector3(Options.ipPlantsPos.Value)
						if not PlantsPos then
							PlantsPos = Utils.GetPosition()
						end
					else
						local randomPlot = Utils.GetRandomPlotPos()
						PlantsPos = randomPlot and randomPlot.Position
					end
					if PlantsPos then
						local args = { vector.create(PlantsPos.X, PlantsPos.Y, PlantsPos.Z), SeedName }
						sData.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(args))
						task.wait(0.2)
					end
				end
			end
		end
		Utils.UnequipTool()
	end)
end

function Main.ClearReadyCrops()
	table.clear(ReadyCrops)
end

function Main.GetAllReadyCrops()
	table.clear(ReadyCrops)
	local allPrompts = CollectionService:GetTagged("CollectPrompt")
	local seen = {}

	for _, prompt in ipairs(allPrompts) do
		if prompt:IsA("ProximityPrompt") and prompt.Enabled and not prompt:GetAttribute("Collected") then
			local cropModel = prompt.Parent and prompt.Parent.Parent
			if cropModel and not seen[cropModel] then
				seen[cropModel] = true
				table.insert(ReadyCrops, cropModel)
			end
		end
	end
end

function Main.GetAllReadyCrops2()
	table.clear(ReadyCrops)
	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		return
	end
	local count = 0
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local itemsToCheck = FruitsContainer and FruitsContainer:GetChildren() or { plant }

		for _, item in ipairs(itemsToCheck) do
			if item:IsA("Model") and item:FindFirstChild("Weight") and item:FindFirstChild("Variant") then
				table.insert(ReadyCrops, item)
			end
			count = count + 1
			if count % 250 == 0 then
				task.wait()
			end
		end
	end
end

function Main.CheckCrops(fruit, config, HarvestMode)
	if not fruit or not fruit:IsA("Model") then
		return false
	end
	local Mode = HarvestMode ~= false

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
		if not ShouldMatchMutants(fruit, config.wl.mutants) then
			return false
		end
	end

	if config.wl.weightValue ~= 0 then
		local weight = tonumber(fruitWeight)
		if not weight or not Utils.MatchesWeight(weight, config.wl.weightCondition, config.wl.weightValue) then
			return false
		end
	end

	if not table.find(config.bl.crops, "NONE") and table.find(config.bl.crops, fruitName) then
		return false
	end
	if not table.find(config.bl.variant, "NONE") and table.find(config.bl.variant, fruitVariant) then
		return false
	end

	if IsBlockedByBlackMutants(fruit, config.bl.mutants) then
		return false
	end

	return true
end

function Main.HarvestCrops()
	local Options = reg.Options
	if not Options.tgHarvestEnable.Value or fVar.IsHarvesting then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end
	Utils.RunWithFlag("IsHarvesting", "HarvestCrops", function()
		if Utils.IsTableEmpty(ReadyCrops) then
			Main.GetAllReadyCrops2()
			if Utils.IsTableEmpty(ReadyCrops) then
				return
			end
		end

		local config = Main.GetHarvestVar()
		local crop = table.remove(ReadyCrops, 1)
		if crop and Main.CheckCrops(crop, config) then
			sData.CollectEvent:FireServer({ crop })
		end
	end)
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
		if not ShouldMatchMutants(item, config.wl.mutants) then
			return false
		end
	end

	if config.wl.weightValue ~= 0 then
		local weight = tonumber(ItemWeight)
		if not weight or not Utils.MatchesWeight(weight, config.wl.weightCondition, config.wl.weightValue) then
			return false
		end
	end

	if not table.find(config.bl.crops, "NONE") and table.find(config.bl.crops, ItemName) then
		return false
	end
	if not table.find(config.bl.variant, "NONE") and table.find(config.bl.variant, ItemVariant) then
		return false
	end

	if IsBlockedByBlackMutants(item, config.bl.mutants) then
		return false
	end

	return true
end

function Main.SellCrops()
	local Options = reg.Options
	if fVar.IsSelling then
		return
	end
	Utils.RunWithFlag("IsSelling", "SellCrops", function()
		Utils.ClickButton(Utils.SellButton)
		task.wait(0.5)
		if Options.tgSellAll.Value then
			sData.GameEvents.Sell_Inventory:FireServer()
			task.wait(1)
		else
			local config = Main.GetSellVar()
			local Backpack = sData.LocalPlayer.Backpack
			for _, item in ipairs(Backpack:GetChildren()) do
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
	end)
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
