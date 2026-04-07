local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService :: any)
local ProgressionTable = require(ReplicatedStorage.Data.EASTER_SeedGiverQuestProgression :: any)
local SeedEvent = ReplicatedStorage.GameEvents.SeedPackGiverEvent
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData :: any)
local EasterSlot = table.clone(PlantTraitsData.Traits["EasterSlot"])
table.insert(EasterSlot, 1, "ALL")

local Angryplant = {}
local reg
local EfTasks
local QuickSave
local EventsTab
local sData
local questPos = CFrame.new(-100.68, 7.91, -9.52) ---100.68,7.91,-9.52
--[[

📋 Script initialized successfully.
[Progression] : 3
[ProgressionSeedPacks] : 0
[HasBeenFed] : true
[HasSeenPopup] : true
[GoldenEgg] : (Table)
  [BuyAmount] : 0
  [LastBuyTime] : 1775356196.09477
[TotalEasterPlaytime] : 5680
[HasSoldEasterPlant] : true
[HasEnabledEasterGarden] : true
[RequiredPlantInfo] : (Table)
  [RequiredPlantSize] : 1.4
  [RequiredPlant] : Easter Gumball
[SeedPackGiverDiscovered] : true
[TotalTrackedPlaytime] : 22474
[HasPurchasedEasterPlant] : true
[HasBeenGivenStarterPack] : true

]]

local chkName, chkWeight, chkMutation, chkVariant, chkNextQuest
local Utils

local GameEvents = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")

function Angryplant.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab
	sData = reg.sData
	Utils = reg.Utils

	local AngryplantSection = EventsTab:AddCollapsibleSection("Angryplant", false)
	AngryplantSection:AddToggle("tgAngryplantEnable", {
		Title = "Angryplant Enable",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoAngryplant", Value, function()
				Angryplant.autoAngryplant()
				task.wait(10)
			end)
			if not Value then
				reg.IsHuntEgg = false
				reg.IsEasterHarvesting = false
			end
			QuickSave()
		end,
	})

	AngryplantSection:AddToggle("tgAngryPlants", {
		Title = "Plants Quest Seed Enable",
		Default = false,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AngryplantSection:AddDropdown("ddFocusPlant", {
		Title = "Focus Plant",
		Values = EasterSlot,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
	AngryplantSection:AddButton({
		Title = "Set Position",
		Callback = function()
			local Pos = sData.Character:GetPivot().Position
			local formattedPos = string.format("%.3f, %.3f, %.3f", Pos.X, Pos.Y, Pos.Z)
			Options.ipAngryplantPos:SetValue(formattedPos)
			QuickSave()
		end,
	})
	AngryplantSection:AddInput("ipAngryplantPos", {
		Title = "Position",
		Default = "",
		Placeholder = "X, Y, Z",
		Numeric = false,
		Finished = false,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	AngryplantSection:AddParagraph("NextQuest", {
		Title = "Next Quest Time",
		Content = "Wait for update...",
	})
end
local function QuestValue()
	local Options = reg.Options
	local data = DataService:GetData().EasterEventData
	local currentIdx = data.Progression or 1
	local isCompleted = currentIdx > #ProgressionTable
	if not isCompleted then
		local current = ProgressionTable[currentIdx]
		local name = current.PLANT_NAME or nil
		local weight = current.WEIGHT or 0
		local mutation = current.MUTATION or "ALL"
		local variant = current.VARIANT or "ALL"
		local NextQuest = ProgressionTable[currentIdx + 1]
		local questText = ""

		-- ตรวจสอบก่อนว่ามีเควสต์ถัดไปอยู่จริงไหม
		if NextQuest then
			-- ดึงข้อมูลมาแปลงและใส่ค่า Default ป้องกัน nil ทำสคริปต์พัง
			local nName = tostring(NextQuest.PLANT_NAME or "Unknown")
			local nWeight = tonumber(NextQuest.WEIGHT) or 0 -- บังคับให้เป็นตัวเลข เพื่อใช้กับ %.2f
			local nMut = tostring(NextQuest.MUTATION or "ALL")
			local nVar = tostring(NextQuest.VARIANT or "ALL")

			-- ตอนนี้ปลอดภัยแล้ว นำไปเข้า string.format ได้เลย
			questText = string.format("Name: %s \n Weight: %.2f kg \n Mutation: %s \n Variant: %s", nName, nWeight, nMut, nVar)
		else
			-- กรณีเป็นเควสต์สุดท้าย จะไม่มี NextQuest
			questText = "Next Quest: None"
		end
		return name, weight, mutation, variant, questText
	end
	Options.NextQuest:SetValue("Completed")
	return nil, nil, nil, nil
end

local function CheckQuest(fruit)
	local Options = reg.Options
	chkName, chkWeight, chkMutation, chkVariant, chkNextQuest = QuestValue()
	if not chkName then
		return
	end
	local ItemName = fruit:FindFirstChild("Item_String") and fruit:FindFirstChild("Item_String").Value or fruit.Name
	local ItemVariant = fruit:FindFirstChild("Variant") and fruit:FindFirstChild("Variant").Value
	local ItemWeight = fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Weight").Value

	if ItemName ~= chkName then
		return
	end
	if ItemWeight < chkWeight then
		return
	end
	if chkMutation ~= "ALL" and fruit:GetAttribute(chkMutation) ~= true then
		return
	end
	if chkVariant ~= "ALL" and ItemVariant ~= chkVariant then
		return
	end
	if chkNextQuest then
		Options.NextQuest:SetValue(chkNextQuest)
	end
	return true
end

function Angryplant.autoAngryplant()
	local Options = reg.Options
	if not Options.tgAngryplantEnable.Value or reg.IsHuntEgg then
		return
	end

	local data = DataService:GetData().EasterEventData
	if data.Progression > #ProgressionTable then
		reg.Log("Auto Claim: Exotic Seed Pack ready!")
		reg.IsHuntEgg = true
		task.wait(1)
		reg.IsEasterHarvesting = true
		reg.sData.Character:PivotTo(questPos)
		task.wait(0.5)
		SeedEvent:FireServer("ClaimPremiumPack")
		task.wait(1.5)
		reg.Utils.ClickButton(reg.Utils.GardenButton)
		task.wait(1)
		reg.IsHuntEgg = false
		reg.IsEasterHarvesting = false
		return
	end

	reg.IsHuntEgg = true
	task.wait(1)
	reg.IsEasterHarvesting = true

	local Backpack = reg.sData.Backpack
	local angryPass = false
	for _, item in ipairs(Backpack:GetChildren()) do
		if CheckQuest(item) then
			reg.sData.Character:PivotTo(questPos)
			task.wait(0.5)
			reg.Utils.EquipTool(item)
			local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
			if ItemName then
				reg.Log("Submit " .. tostring(ItemName))
			end
			task.wait(0.5)
			SeedEvent:FireServer("SubmitHeldPlant")
			task.wait(0.5)
			reg.Utils.ClickButton(reg.Utils.GardenButton)
			task.wait(1)
			angryPass = true
			break
		end
	end
	if not angryPass then
		task.spawn(function()
			pcall(Angryplant.chkGarden)
		end)
	end
	reg.IsHuntEgg = false
	reg.IsEasterHarvesting = false
end

function Angryplant.chkGarden()
	local Options = reg.Options
	local gardenPass = false
	local Plants_Physical = Utils.GetPlantsFolder()
	local targetFruit = nil
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local Fruits = FruitsContainer and FruitsContainer:GetChildren() or { plant }

		for _, fruit in ipairs(Fruits) do
			if fruit:IsA("Model") and CheckQuest(fruit) then
				local Prompt = fruit:FindFirstChild("ProximityPrompt", true)
				if Prompt and Prompt.Enabled then
					gardenPass = true
					targetFruit = fruit
				else
					task.wait(10)
				end
				break
			end
		end
		if gardenPass then
			local CropsRemote = GameEvents:WaitForChild("Crops", 5):WaitForChild("Collect", 5)
			if CropsRemote then
				local success, _err = pcall(function()
					CropsRemote:FireServer({ targetFruit })
				end)
				if success then
					task.wait(1)
					task.spawn(function()
						Angryplant.autoAngryplant()
					end)
				end
			end
		else
			if Options.tgAngryPlants.Value then
				if chkMutation == "Choc" then
					if Angryplant.ChkBackpack("Chocolate Sprinkler") then
						task.spawn(function()
							Angryplant.autoPlants()
						end)
					end
				else
					task.spawn(function()
						Angryplant.autoPlants()
					end)
				end
			end
		end
	end
end

function Angryplant.autoPlants()
	local Options = reg.Options
	local focusPlant = Utils.GetSelectedItems(Options.ddFocusPlant.Value)
	if not table.find(focusPlant, chkName) then
		if chkMutation == "Choc" then
			local posStr = Options.ipSprinklerPosition.Value
			local parsedPos = Utils.ParseVector3(posStr)
			if parsedPos then
				Angryplant.autoChoco(parsedPos)
			end
		end
		return
	end

	local Backpack = sData.Backpack
	for _, item in ipairs(Backpack:GetChildren()) do
		local SeedName = item:GetAttribute("Seed")
		if SeedName and SeedName == chkName then
			local PlantsPos = Utils.ParseVector3(Options.ipAngryplantPos.Value)
			if PlantsPos then
				Utils.UnequipTool()
				task.wait(0.1)
				Utils.EquipTool(item)
				task.wait(0.1)
				sData.GameEvents:WaitForChild("Plant_RE"):FireServer(vector.create(PlantsPos.X, PlantsPos.Y, PlantsPos.Z), SeedName)
				task.wait(0.2)
				Utils.UnequipTool()
				task.wait(0.1)
				if chkMutation == "Choc" then
					Angryplant.autoChoco(PlantsPos)
				end
				break
			end
		end
	end
end

function Angryplant.autoChoco(pos)
	if Angryplant.ChkSprinkle("Chocolate Sprinkler") then
		return
	end
	local backpack = sData.Backpack
	for _, item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match("Chocolate Sprinkler") then
			local SprinklerPos = CFrame.new(pos)
			Utils.EquipTool(item)
			sData.SprinklerEvent:FireServer("Create", SprinklerPos)
			task.wait(0.1)
			Utils.UnequipTool()
			task.wait(5)
			Angryplant.autoGrand(pos)
		end
	end
end

function Angryplant.autoGrand(pos)
	if Angryplant.ChkSprinkle("Grandmaster Sprinkler") then
		return
	end
	local backpack = sData.Backpack
	for _, item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match("Grandmaster Sprinkler") then
			local SprinklerPos = CFrame.new(pos)
			Utils.EquipTool(item)
			sData.SprinklerEvent:FireServer("Create", SprinklerPos)
			task.wait(0.1)
			Utils.UnequipTool()
			task.wait(0.1)
		end
	end
end

function Angryplant.ChkSprinkle(sprinkle)
	local Farm_Important = Utils.GetMyFarm():FindFirstChild("Important")
	local Objects_Physical = Farm_Important:FindFirstChild("Objects_Physical")
	if not Objects_Physical then
		return
	end
	for _, obj in ipairs(Objects_Physical:GetChildren()) do
		if obj:IsA("Model") and obj.Name:match(sprinkle) then
			return true
		end
	end
	return false
end

function Angryplant.ChkBackpack(itemName)
	local backpack = sData.Backpack
	for _, item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match(itemName) then
			return true
		end
	end
	return false
end

return Angryplant
