local Auto = {}
local reg
local fVar
local sData
local Utils

local function MatchesPlantFilter(plant, selectedList, weightCondition, weightValue)
	if not plant or not table.find(selectedList, plant.Name) then
		return false
	end
	local weightValueObj = plant:FindFirstChild("Weight")
	if not weightValueObj or type(weightValueObj.Value) ~= "number" then
		return false
	end
	return Utils.MatchesWeight(weightValueObj.Value, weightCondition, weightValue)
end

function Auto.Initialize(registry)
	reg = registry
	fVar = reg.fVar
	sData = reg.sData
	Utils = reg.Utils
end

function Auto.RemovePlants()
	local options = reg.Options
	if not options.tgRemovePlantsEnable.Value or fVar.IsRemovingPlants then
		return
	end
	Utils.RunWithFlag("IsRemovingPlants", "RemovePlants", function()
		local getSelectedItems = Utils.GetSelectedItems
		local removePlantsList = getSelectedItems(options.ddRemovePlants.Value)
		local plantsWeightThreshold = options.ddRemovePlantsWeight.Value
		local plantsWeightValue = tonumber(options.ipRemovePlantsWeight.Value) or 0
		local plantsPhysical = Utils.GetPlantsFolder()
		local backpack = sData.Backpack
		local shovel = Utils.FindToolByName(backpack, "Shovel [Destroy Plants]")
		if not plantsPhysical or not shovel then
			return
		end

		Utils.UnequipTool()
		for _, plant in ipairs(plantsPhysical:GetChildren()) do
			if not options.tgRemovePlantsEnable.Value then
				return
			end
			if MatchesPlantFilter(plant, removePlantsList, plantsWeightThreshold, plantsWeightValue) then
				Utils.EquipTool(shovel)
				sData.RemoveItemEvent:FireServer(plant)
				task.wait(0.1)
				Utils.UnequipTool()
				task.wait(0.1)
			end
		end
	end)
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
	local options = reg.Options
	local main = reg.Main
	if not options.tgRemoveFruitEnable.Value or fVar.IsRemovingCrops then
		return
	end
	Utils.RunWithFlag("IsRemovingCrops", "RemoveCrops", function()
		local plantsPhysical = Utils.GetPlantsFolder()
		if not plantsPhysical then
			return
		end
		local backpack = sData.Backpack
		local shovel = Utils.FindToolByName(backpack, "Shovel [Destroy Plants]")
		if not shovel then
			return
		end

		Utils.UnequipTool()
		for _, plant in ipairs(plantsPhysical:GetChildren()) do
			local fruitsContainer = plant:FindFirstChild("Fruits")
			local itemsToCheck = fruitsContainer and fruitsContainer:GetChildren() or { plant }
			for _, item in ipairs(itemsToCheck) do
				if not options.tgRemoveFruitEnable.Value then
					return
				end
				if item:IsA("Model") then
					local config = Auto.GetRemovePlantsVar()
					if main.CheckCrops(item, config, false) then
						Utils.EquipTool(shovel)
						sData.RemoveItemEvent:FireServer(item)
						task.wait(0.1)
						Utils.UnequipTool()
						task.wait(0.1)
					end
				end
			end
		end
		if options.tgRemoveFruitEnable.Value then
			task.wait(0.5)
		end
	end)
end

function Auto.Trowel()
	local Options = reg.Options
	if not Options.tgTrowelEnable.Value or fVar.IsTroweling then
		return
	end
	local posStr = Options.ipTrowelPosition.Value
	local parsedPos = Utils.ParseVector3(posStr)
	if not parsedPos then
		reg.Log("❌ Invalid position format. Use 'X, Y, Z'", "ERROR")
		if Options.tgTrowelEnable.Value then
			Options.tgTrowelEnable:SetValue(false)
			task.wait(0.5)
		end
		return
	end
	local TrowelPos = CFrame.new(parsedPos)
	Utils.RunWithFlag("IsTroweling", "Trowel", function()
		local getSelectedItems = Utils.GetSelectedItems
		local trowelPlantsList = getSelectedItems(Options.ddTrowelPlants.Value)
		local plantsWeightThreshold = Options.ddTrowelPlantsWeight.Value
		local plantsWeightValue = tonumber(Options.ipTrowelPlantsWeight.Value) or 0
		local plantsPhysical = Utils.GetPlantsFolder()
		local backpack = sData.Backpack
		local trowel = Utils.FindToolByPattern(backpack, "Trowel")
		if not trowel then
			reg.Log("🟡 No Trowel", "WARN")
			if Options.tgTrowelEnable.Value then
				Options.tgTrowelEnable:SetValue(false)
				task.wait(0.5)
			end
			return
		end

		Utils.UnequipTool()
		if plantsPhysical then
			for _, plant in ipairs(plantsPhysical:GetChildren()) do
				if not Options.tgTrowelEnable.Value then
					return
				end
				if MatchesPlantFilter(plant, trowelPlantsList, plantsWeightThreshold, plantsWeightValue) then
					Utils.EquipTool(trowel)
					local success, response = pcall(function()
						return sData.TrowelEvent:InvokeServer("Pickup", trowel, plant)
					end)
					if success then
						sData.TrowelEvent:InvokeServer("Place", trowel, plant, TrowelPos)
						task.wait(0.5)
					else
						reg.Log("❌ Place failed: " .. tostring(response))
					end
					task.wait(0.1)
					Utils.UnequipTool()
					task.wait(0.1)
				end
			end
		end
		if Options.tgTrowelEnable.Value then
			Options.tgTrowelEnable:SetValue(false)
			task.wait(0.5)
		end
		task.wait(0.5)
	end)
end

function Auto.Reclaim()
	local options = reg.Options
	if not options.tgReclaimEnable.Value or fVar.IsReclaiming then
		return
	end
	Utils.RunWithFlag("IsReclaiming", "Reclaim", function()
		local getSelectedItems = Utils.GetSelectedItems
		local reclaimPlantsList = getSelectedItems(options.ddReclaimPlants.Value)
		local plantsWeightThreshold = options.ddReclaimPlantsWeight.Value
		local plantsWeightValue = tonumber(options.ipReclaimPlantsWeight.Value) or 0
		local plantsPhysical = Utils.GetPlantsFolder()
		local backpack = sData.Backpack
		local reclaimer = Utils.FindToolByPattern(backpack, "Reclaimer")
		if not reclaimer then
			reg.Log("🟡 No Reclaimer")
			return
		end

		Utils.UnequipTool()
		if plantsPhysical then
			for _, plant in ipairs(plantsPhysical:GetChildren()) do
				if not options.tgReclaimEnable.Value then
					return
				end
				if MatchesPlantFilter(plant, reclaimPlantsList, plantsWeightThreshold, plantsWeightValue) then
					Utils.EquipTool(reclaimer)
					sData.ReclaimerEvent:FireServer("TryReclaim", plant)
					Utils.UnequipTool()
				end
			end
		end

		if options.tgReclaimEnable.Value then
			options.tgReclaimEnable:SetValue(false)
			task.wait(0.5)
		end
		Utils.UnequipTool()
		task.wait(0.5)
	end)
end

function Auto.Sprinkler()
	local Options = reg.Options
	if not Options.tgSprinklerEnable.Value or fVar.IsSprinkling then
		return
	end
	local posStr = Options.ipSprinklerPosition.Value
	local parsedPos = Utils.ParseVector3(posStr)
	if not parsedPos then
		reg.Log("❌ Invalid position format. Use 'X, Y, Z'", "ERROR")
		if Options.tgSprinklerEnable.Value then
			Options.tgSprinklerEnable:SetValue(false)
			task.wait(0.5)
		end
		return
	end
	local SprinklerPos = CFrame.new(parsedPos)
	Utils.RunWithFlag("IsSprinkling", "Sprinkler", function()
		local backpack = sData.Backpack
		local sprinklerData = {
			{ matchName = "Basic Sprinkler", optionKey = "ipBasicSPK" },
			{ matchName = "Advanced Sprinkler", optionKey = "ipAdvancedSPK" },
			{ matchName = "Godly Sprinkler", optionKey = "ipGodlySPK" },
			{ matchName = "Master Sprinkler", optionKey = "ipMasterSPK" },
			{ matchName = "Grandmaster Sprinkler", optionKey = "ipGrandmasterSPK" },
			{ matchName = Options.ddOtherSPK.Value, optionKey = "ipOtherSPK" },
		}

		for _, item in ipairs(backpack:GetChildren()) do
			if not Options.tgSprinklerEnable.Value then
				return
			end
			if item:IsA("Tool") then
				for _, data in ipairs(sprinklerData) do
					if data.matchName and data.matchName ~= "" and item.Name:match(data.matchName) then
						data.tool = item
					end
				end
			end
		end
		Utils.UnequipTool()

		for _, data in ipairs(sprinklerData) do
			if not Options.tgSprinklerEnable.Value then
				return
			end
			if data.tool then
				local ipAmount = tonumber(Options[data.optionKey].Value) or 0
				local qAmount = tonumber(data.tool:GetAttribute("e")) or 0
				local minAmount = math.min(ipAmount, qAmount)
				for _ = 1, minAmount do
					Utils.EquipTool(data.tool)
					sData.SprinklerEvent:FireServer("Create", SprinklerPos)
					task.wait(0.1)
					Utils.UnequipTool()
					task.wait(0.1)
				end
			end
		end

		Utils.UnequipTool()
		if Options.tgSprinklerEnable.Value then
			Options.tgSprinklerEnable:SetValue(false)
			task.wait(0.5)
		end
		task.wait(0.5)
	end)
end

function Auto.CatLead()
	local options = reg.Options
	if not options.tgCatLead.Value or fVar.IsCatLeading then
		return
	end
	fVar.IsCatLeading = true
	local positionCF = fVar.Pos.Sprinkler
	if typeof(positionCF) ~= "CFrame" then
		reg.Log("🟡 Cat Lead Position Must Set Spinkle Position")
		fVar.IsCatLeading = false
		return
	end

	Utils.RunWithFlag("IsCatLeading", "CatLead", function()
		local catTypes = { "Orange Tabby", "Cat", "Moon Cat", "Glass Cat", "Calico" }
		local backpack = sData.Backpack
		local petLead = Utils.FindToolByPattern(backpack, "Pet Lead")
		if not petLead then
			reg.Log("🟡 No Pet Lead")
			fVar.IsCatLeading = false
			return
		end

		local pets = reg.Pets
		local petsPhysical = game:GetService("Workspace"):WaitForChild("PetsPhysical")
		if not petsPhysical then
			reg.Log("🟡 No PetsPhysical")
			fVar.IsCatLeading = false
			return
		end

		for _, pet in ipairs(petsPhysical:GetChildren()) do
			if not options.tgCatLead.Value then
				fVar.IsCatLeading = false
				return
			end
			local uuid = pet:GetAttribute("UUID")
			if uuid then
				local petType = pets.GetPetType(uuid)
				if table.find(catTypes, petType) then
					local cat = pet:FindFirstChild(uuid)
					if cat then
						local magnitude = (cat:GetPivot().Position - positionCF.Position).Magnitude
						if magnitude > 15 then
							sData.Character:PivotTo(positionCF)
							Utils.EquipTool(petLead)
							sData.GameEvents:WaitForChild("PetLeadService_RE"):FireServer(cat)
							task.wait(0.1)
							Utils.UnequipTool()
							task.wait(0.1)
						end
					end
				end
			end
		end
		fVar.IsCatLeading = false
		Utils.UnequipTool()
		if options.tgCatLead.Value then
			options.tgCatLead:SetValue(false)
			task.wait(0.5)
		end
		task.wait(0.5)
	end)
end

function Auto.OpenSeedPack()
	local Options = reg.Options
	if not Options.tgOpenPackEnable.Value or fVar.IsOpeningSeedPack then
		return
	end
	local getSelectedItems = Utils.GetSelectedItems
	local seedPacks = getSelectedItems(Options.ddOpenPack.Value)
	if #seedPacks == 0 then
		reg.Log("🟡 No Seed Pack Selected")
		return
	end
	local seedPackNames = {}
	if table.find(seedPacks, "ALL") then
		seedPackNames = sData.SeedPackTable
	else
		seedPackNames = seedPacks
	end
	Utils.RunWithFlag("IsOpeningSeedPack", "OpenSeedPack", function()
		local backpack = sData.Backpack

		for _, item in ipairs(backpack:GetChildren()) do
			if not Options.tgOpenPackEnable.Value then
				return
			end
			local delay = tonumber(Options.ipOpenPackDelay.Value) or 0
			local packName = item:GetAttribute("n")
			if item:IsA("Tool") and table.find(seedPackNames, packName) then
				local packAmount = tonumber(item:GetAttribute("e")) or 0
				for _ = 1, packAmount do
					sData.SeedPackEvent.Open:FireServer(packName)
					task.wait(delay)
				end
			end
		end

		if Options.tgOpenPackEnable.Value then
			Options.tgOpenPackEnable:SetValue(false)
			task.wait(0.5)
		end
		task.wait(0.5)
	end)
end

local function GetRequiredItemsCount(targetItemName: string): number
	for key, recipeData in pairs(sData.GearEventData) do
		if key == targetItemName then
			local quantity = recipeData.Inputs
			if type(quantity) == "table" then
				return #quantity
			else
				return 0
			end
		end
	end
	return 0
end

local TARGET_BENCH_INSTANCE = game:GetService("Workspace"):WaitForChild("CraftingTables"):WaitForChild("EventCraftingWorkBench")
local TARGET_MACHINE_TYPE = "GearEventWorkbench"
local TARGET_BENCH_ID = "Workbench-1"
local CRAFT_INDEX = 1

local CraftingStationHandler = require(sData.Modules:WaitForChild("CraftingStationHandler"))

function Auto.CraftGear()
	local Options = reg.Options
	if not Options.tgCraftGearEnable or not Options.tgCraftGearEnable.Value or fVar.CraftGearRunning then
		return
	end

	Utils.RunWithFlag("CraftGearRunning", "CraftGear", function()
		local targetRecipe = Options.ddCraftGear.Value
		if not targetRecipe or targetRecipe == "" then
			reg.Log("🟡 No Gear Selected")
			return
		end
		local GetData_result = sData.DataService:GetData()
		local GlobalData = GetData_result.CraftingData.GlobalCraftingObjectData
		local benchData = GlobalData[TARGET_BENCH_ID].MachineData[TARGET_MACHINE_TYPE]

		if not benchData then
			reg.Log("🟡 No Bench Data")
			return
		end
		local craftingItems = benchData.CraftingItems

		if craftingItems and craftingItems[CRAFT_INDEX] then
			if craftingItems[CRAFT_INDEX].IsDone == false then
				return
			elseif craftingItems[CRAFT_INDEX].IsDone == true then
				pcall(function()
					sData.CraftingEvent:FireServer("Claim", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE, CRAFT_INDEX)
					reg.Log("Claim " .. tostring(craftingItems[CRAFT_INDEX].RecipeId))
				end)
				task.wait(1.5)
				return
			end
		end

		local requiredCount = GetRequiredItemsCount(targetRecipe)
		if requiredCount == 0 then
			reg.Log("🟡 No Recipe Found")
			return
		end

		local isReadyToCraft = false

		pcall(function()
			sData.CraftingEvent:FireServer("SetRecipe", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE, targetRecipe)
		end)
		task.wait(0.5)

		for attempt = 1, 3 do
			if not Options.tgCraftGearEnable.Value then
				return
			end

			pcall(function()
				CraftingStationHandler:SubmitAllRequiredItems(TARGET_BENCH_INSTANCE)
			end)
			task.wait(0.5)

			-- ดึง Data ใหม่มาเช็ค InputItems
			local updatedDataResult = sData.DataService:GetData()
			local updatedBenchData = updatedDataResult.CraftingData.GlobalCraftingObjectData[TARGET_BENCH_ID].MachineData[TARGET_MACHINE_TYPE]
			local currentInputItems = updatedBenchData.InputItems
			local inputCount = currentInputItems and #currentInputItems or 0

			if inputCount == requiredCount then
				isReadyToCraft = true
				break
			else
				reg.Log(string.format("ของไม่ครบ (มี %d / ต้องการ %d) ลองใหม่รอบที่ %d/3", inputCount, requiredCount, attempt))
				task.wait(1)
			end
		end

		-- ถ้า 3 รอบแล้วของไม่พอ ปิดระบบ
		if not isReadyToCraft then
			reg.Log("แจ้งเตือน! ของไม่พอ ปิดการทำงาน Auto Craft")
			if Options.tgCraftGearEnable then
				Options.tgCraftGearEnable:SetValue(false)
			end
			return
		end

		-- ====================================================
		-- 🔴 ข้อ 3: ของครบ สั่ง Craft
		-- ====================================================
		pcall(function()
			sData.CraftingEvent:FireServer("Craft", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE)
			reg.Log("ของครบถ้วน สั่ง Craft -> " .. targetRecipe)
		end)

		task.wait(1.5)
	end)
end

return Auto
