
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
	local options = reg.Options
	if not options.tgTrowelEnable.Value or fVar.IsTroweling then
		return
	end
	Utils.RunWithFlag("IsTroweling", "Trowel", function()
		local getSelectedItems = Utils.GetSelectedItems
		local trowelPlantsList = getSelectedItems(options.ddTrowelPlants.Value)
		local plantsWeightThreshold = options.ddTrowelPlantsWeight.Value
		local plantsWeightValue = tonumber(options.ipTrowelPlantsWeight.Value) or 0
		local plantsPhysical = Utils.GetPlantsFolder()
		local backpack = sData.Backpack
		local trowel = Utils.FindToolByPattern(backpack, "Trowel")
		if not trowel then
			reg.Log("🟡 No Trowel")
			return
		end

		Utils.UnequipTool()
		if plantsPhysical then
			for _, plant in ipairs(plantsPhysical:GetChildren()) do
				if not options.tgTrowelEnable.Value then
					return
				end
				if MatchesPlantFilter(plant, trowelPlantsList, plantsWeightThreshold, plantsWeightValue) then
					Utils.EquipTool(trowel)
					local success, response = pcall(function()
						return sData.TrowelEvent:InvokeServer("Pickup", trowel, plant)
					end)
					if success then
						sData.TrowelEvent:InvokeServer("Place", trowel, plant, fVar.Pos.Trowel)
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
		if options.tgTrowelEnable.Value then
			options.tgTrowelEnable:SetValue(false)
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
	local options = reg.Options
	if not options.tgSprinklerEnable.Value or fVar.IsSprinkling then
		return
	end

	Utils.RunWithFlag("IsSprinkling", "Sprinkler", function()
		local backpack = sData.Backpack
		local sprinklerData = {
			{ matchName = "Basic Sprinkler", optionKey = "ipBasicSPK" },
			{ matchName = "Advanced Sprinkler", optionKey = "ipAdvancedSPK" },
			{ matchName = "Godly Sprinkler", optionKey = "ipGodlySPK" },
			{ matchName = "Master Sprinkler", optionKey = "ipMasterSPK" },
			{ matchName = "Grandmaster Sprinkler", optionKey = "ipGrandmasterSPK" },
			{ matchName = options.ddOtherSPK.Value, optionKey = "ipOtherSPK" },
		}

		for _, item in ipairs(backpack:GetChildren()) do
			if not options.tgSprinklerEnable.Value then
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
		local positionCF = fVar.Pos.Sprinkler
		if typeof(positionCF) == "CFrame" then
			for _, data in ipairs(sprinklerData) do
				if not options.tgSprinklerEnable.Value then
					return
				end
				if data.tool then
					local ipAmount = tonumber(options[data.optionKey].Value) or 0
					local qAmount = tonumber(data.tool:GetAttribute("e")) or 0
					local minAmount = math.min(ipAmount, qAmount)
					for _ = 1, minAmount do
						Utils.EquipTool(data.tool)
						sData.SprinklerEvent:FireServer("Create", positionCF)
						task.wait(0.1)
						Utils.UnequipTool()
						task.wait(0.1)
					end
				end
			end
		end
		Utils.UnequipTool()
		if options.tgSprinklerEnable.Value then
			options.tgSprinklerEnable:SetValue(false)
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

function Auto.OpenPack() end

return Auto
