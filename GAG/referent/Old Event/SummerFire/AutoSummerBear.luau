-- Auto Summer Bear script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local LocalPlayer = Players.LocalPlayer
local DataService = require(ReplicatedStorage.Modules.DataService)
local InventoryService = require(ReplicatedStorage.Modules.InventoryService)
local GameConfigController = require(ReplicatedStorage.Modules.GameConfigController)
local CalculateWeight = require(ReplicatedStorage.Calculate_Weight)
local MutationHandler = require(ReplicatedStorage.Modules.MutationHandler)
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData)
local SeedData = require(ReplicatedStorage.Data.SeedData)

local SummerBearConfig = GameConfigController:GetConfig("SummerBearConfig")

local function getMatchingFruit()
	local data = DataService:GetData()
	local currentLevel = data.SummerFireEventData and data.SummerFireEventData.CurrentLevel or 0
	local requiredLevelIndex = currentLevel + 1
	
	local weights = SummerBearConfig.WEIGHTS
	local mutationList = SummerBearConfig.MUTATION_LIST
	local traitAttributeName = SummerBearConfig.WORKSPACE_TRAIT_NAME
	
	if requiredLevelIndex > #weights then
		return nil, "Completed all levels"
	end
	
	local requiredWeight = weights[requiredLevelIndex]
	local requiredMutation = mutationList[requiredLevelIndex]
	local requiredTrait = workspace:GetAttribute(traitAttributeName)
	
	-- Check both Character and Backpack
	local items = {}
	if LocalPlayer.Character then
		for _, child in ipairs(LocalPlayer.Character:GetChildren()) do
			if child:IsA("Tool") and child:HasTag("FruitTool") then
				table.insert(items, child)
			end
		end
	end
	for _, child in ipairs(LocalPlayer.Backpack:GetChildren()) do
		if child:IsA("Tool") and child:HasTag("FruitTool") then
			table.insert(items, child)
		end
	end
	
	for _, tool in ipairs(items) do
		local toolData = InventoryService:GetToolData(tool)
		if toolData and toolData.ItemData then
			local itemData = toolData.ItemData
			local itemName = itemData.ItemName
			
			if SeedData[itemName] then
				-- Calculate weight
				local weightMultiplier = itemData.WeightMultiplier or 1
				local baseWeight = CalculateWeight.Calculate_Weight(itemData.Seed, itemName)
				local totalWeight = baseWeight * weightMultiplier
				
				-- Check trait
				local hasTrait = PlantTraitsData.HasTrait(itemName, requiredTrait)
				
				-- Check mutation
				local hasMutation = false
				if requiredMutation == "Normal" then
					hasMutation = true
				else
					local mutations = MutationHandler:ExtractMutationsFromString(itemData.MutationString or "")
					for _, mut in ipairs(mutations) do
						if mut.Name == requiredMutation then
							hasMutation = true
							break
						end
					end
				end
				
				-- Validate all conditions
				if hasTrait and hasMutation and totalWeight >= requiredWeight then
					return tool, itemName, totalWeight
				end
			end
		end
	end
	
	return nil, string.format("Need Trait: %s | Weight: %skg | Mutation: %s", tostring(requiredTrait), tostring(requiredWeight), tostring(requiredMutation))
end

local function run()
	local bearModel = CollectionService:GetTagged("SummerBearModel")[1]
	if not bearModel then
		warn("SummerBearModel not found!")
		return
	end
	
	local prompt = bearModel:FindFirstChildWhichIsA("ProximityPrompt", true)
	if not prompt then
		warn("ProximityPrompt not found on SummerBearModel!")
		return
	end
	
	local tool, msgOrName, weight = getMatchingFruit()
	if tool then
		print(string.format("Found matching fruit: %s (%skg) - submitting...", msgOrName, tostring(weight)))
		
		-- Equip the tool
		if tool.Parent ~= LocalPlayer.Character then
			tool.Parent = LocalPlayer.Character
			task.wait(0.2)
		end
		
		-- Teleport player near the bear if too far to activate prompt
		if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
			local bearPos = bearModel:GetPivot().Position
			local playerPos = LocalPlayer.Character.PrimaryPart.Position
			if (playerPos - bearPos).Magnitude > 10 then
				LocalPlayer.Character:PivotTo(bearModel:GetPivot() * CFrame.new(0, 0, 5))
				task.wait(0.3)
			end
		end
		
		-- Fire ProximityPrompt
		if fireproximityprompt then
			fireproximityprompt(prompt)
		else
			prompt:InputHoldBegin()
			task.wait(prompt.HoldDuration + 0.1)
			prompt:InputHoldEnd()
		end
		task.wait(0.5)
	else
		print("Status:", msgOrName)
	end
end

-- Auto Loop Thread
local AutoSummerBear = {}
local running = false

function AutoSummerBear.Start()
	if running then return end
	running = true
	print("Auto Summer Bear started.")
	task.spawn(function()
		while running do
			local success, err = pcall(run)
			if not success then
				warn("Error in AutoSummerBear loop:", err)
			end
			task.wait(2)
		end
	end)
end

function AutoSummerBear.Stop()
	running = false
	print("Auto Summer Bear stopped.")
end

-- Automatically start when script is run
AutoSummerBear.Start()

return AutoSummerBear
