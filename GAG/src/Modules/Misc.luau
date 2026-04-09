local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Item_Module = require(ReplicatedStorage:WaitForChild("Item_Module") :: any)
local MutationHandler = require(ReplicatedStorage.Modules:WaitForChild("MutationHandler") :: any)
local InventoryEnums = require(ReplicatedStorage.Data.EnumRegistry:WaitForChild("InventoryServiceEnums") :: any)
local VariantColors = require(ReplicatedStorage.Data:WaitForChild("VariantColors") :: any)

local AllMutations = MutationHandler:GetMutations()

local Misc = {}
local reg
local sData
local Utils
local fVar
local SharedPlantConnection = nil
local PlantsESPFolderName = "PlantsESP"
local FruitESPFolderName = "FruitESP"
local EggsESPFolderName = "EggsESP"
local CratesESPFolderName = "CratesESP"
local BGuiSession = {}
local CoreGui = game:GetService("CoreGui")
local getgenv = (getfenv() :: any).getgenv
local GetHUI = if getgenv then getgenv().GetHUI else nil
if not GetHUI then
	GetHUI = function()
		return CoreGui
	end
end

local GetSelectedItems

-- ==========================================
-- [Number Formatting & Price Calculation]
-- ==========================================
local function FormatComma(amount)
	local formatted = tostring(amount)
	repeat
		local k
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
	until k == 0
	return formatted
end

local Suffixes = { "CENT", "VIG", "NOV", "OCT", "SEP", "SXD", "QUI", "QUA", "TR", "DU", "UN", "DE", "NO", "OC", "SP", "SX", "QI", "QA", "T", "B", "M", "K" }
local SuffixData = {}
local power = #Suffixes - 1

for _, symbol in ipairs(Suffixes) do
	table.insert(SuffixData, {
		Number = math.pow(1000, power) * 1000,
		Symbol = symbol,
	})
	power = power - 1
end

local function FormatCompactPrice(amount, decimals)
	amount = tonumber(amount) or 0
	if amount < 1000 then
		return FormatComma(math.floor(amount))
	end
	for _, data in ipairs(SuffixData) do
		if data.Number <= amount then
			local shortVal = amount / data.Number
			local formattedStr = string.format("%." .. (decimals or "3") .. "f", shortVal)
			formattedStr = string.gsub(formattedStr, "0+$", "")
			formattedStr = string.gsub(formattedStr, "%.$", "")
			return formattedStr .. data.Symbol
		end
	end
	return FormatComma(math.floor(amount))
end

local FinalTaxBrackets = {
	{ X = 0, Y = 0 },
	{ X = 1e12, Y = 1e12 },
	{ X = 20e12, Y = 10e12 },
	{ X = 50e12, Y = 25e12 },
	{ X = 100e12, Y = 40e12 },
	{ X = 750e12, Y = 280e12 },
}

local function ApplyMarketTax(rawPrice)
	for i = 2, #FinalTaxBrackets do
		local prevPoint = FinalTaxBrackets[i - 1]
		local nextPoint = FinalTaxBrackets[i]
		if prevPoint.X <= rawPrice and rawPrice <= nextPoint.X then
			return (nextPoint.Y - prevPoint.Y) / (nextPoint.X - prevPoint.X) * (rawPrice - prevPoint.X) + prevPoint.Y
		end
	end
	local last1 = FinalTaxBrackets[#FinalTaxBrackets - 1]
	local last2 = FinalTaxBrackets[#FinalTaxBrackets]
	return (last2.Y - last1.Y) / (last2.X - last1.X) * (rawPrice - last2.X) + last2.Y
end

local function GetFormattedFruitPrice(fruit)
	if not fruit or typeof(fruit) ~= "Instance" then
		return "0"
	end
	local itemStringObj = fruit:FindFirstChild("Item_String")
	local fruitName = itemStringObj and itemStringObj.Value or fruit.Name
	local variantObj = fruit:FindFirstChild("Variant")
	local weightObj = fruit:FindFirstChild("Weight")
	if not variantObj or not weightObj then
		return "0"
	end

	local actualWeight = weightObj.Value
	local fruitVersion = fruit:GetAttribute("FruitVersion") or fruit:GetAttribute(InventoryEnums.FruitVersion) or 0
	local mutationMulti = MutationHandler:CalcValueMulti(fruit)
	local variantMulti = Item_Module.Return_Variant_Multiplier(variantObj.Value)
	local itemData = Item_Module.Return_Data(fruitName)

	if not itemData or #itemData < 3 then
		return "0"
	end
	local targetWeight = itemData[2]
	local basePrice = itemData[3]

	local rawBaseCalculation = basePrice * mutationMulti * variantMulti
	local weightRatio = actualWeight / targetWeight
	local clampedRatio = math.clamp(weightRatio, 0.95, 100000000)
	local finalPrice = rawBaseCalculation * (clampedRatio * clampedRatio)

	if fruitVersion >= 1 then
		local taxedValue = ApplyMarketTax(finalPrice)
		finalPrice = math.max(taxedValue, 0)
	end

	return FormatCompactPrice(math.round(finalPrice), "3")
end

local function GetFormattedMutations(fruit)
	if not fruit or typeof(fruit) ~= "Instance" then
		return ""
	end
	local textList = {}

	local variantObj = fruit:FindFirstChild("Variant")
	if variantObj and variantObj:IsA("StringValue") then
		local variantName = variantObj.Value
		if variantName ~= "" and variantName ~= "Normal" then
			if variantName == "Rainbow" then
				table.insert(textList, "🌈 Rainbow")
			else
				local variantColor = VariantColors:GetHex(variantName)
				local prefix = string.sub(variantColor, 1, 1) == "#" and "" or "#"
				table.insert(textList, string.format('<font color="%s%s">%s</font>', prefix, variantColor, variantName))
			end
		end
	end

	for mutName, mutData in pairs(AllMutations) do
		if fruit:GetAttribute(mutName) then
			local hexColor = mutData.Color and mutData.Color:ToHex() or "FFFFFF"
			table.insert(textList, string.format('<font color="#%s">%s</font>', hexColor, mutName))
		end
	end

	if #textList > 0 then
		return table.concat(textList, ", ")
	else
		return ""
	end
end

-- ==========================================
-- [Helper Functions]
-- ==========================================
local function IsFruit(obj)
	if typeof(obj) ~= "Instance" then
		return false
	end
	if obj:HasTag("Harvestable") or obj:HasTag("FruitTool") then
		return true
	end
	local parentModel = obj:FindFirstAncestorWhichIsA("Model") or obj:FindFirstAncestorWhichIsA("Tool")
	if parentModel and (parentModel:HasTag("Harvestable") or parentModel:HasTag("FruitTool")) then
		return true
	end
	local current = obj
	while current and current ~= workspace do
		if current.Name == "Fruits" then
			return true
		end
		current = current.Parent
	end
	return false
end

local function SetVisibility(obj, isHidden)
	if obj:IsA("BasePart") then
		obj.LocalTransparencyModifier = isHidden and 1 or 0
		if isHidden then
			if obj:GetAttribute("OriginalCanCollide") == nil then
				obj:SetAttribute("OriginalCanCollide", obj.CanCollide)
				obj:SetAttribute("OriginalCanTouch", obj.CanTouch)
				obj:SetAttribute("OriginalCanQuery", obj.CanQuery)
			end
			obj.CanCollide = false
			obj.CanTouch = false
			obj.CanQuery = false
		else
			local origCollide = obj:GetAttribute("OriginalCanCollide")
			local origTouch = obj:GetAttribute("OriginalCanTouch")
			local origQuery = obj:GetAttribute("OriginalCanQuery")
			if origCollide ~= nil then
				obj.CanCollide = origCollide
			end
			if origTouch ~= nil then
				obj.CanTouch = origTouch
			end
			if origQuery ~= nil then
				obj.CanQuery = origQuery
			end
		end
	elseif obj:IsA("Decal") or obj:IsA("Texture") then
		if isHidden then
			if not obj:GetAttribute("OriginalTrans") then
				obj:SetAttribute("OriginalTrans", obj.Transparency)
			end
			obj.Transparency = 1
		else
			local origTrans = obj:GetAttribute("OriginalTrans")
			if origTrans then
				obj.Transparency = origTrans
			end
		end
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Fire") or obj:IsA("Trail") then
		if isHidden then
			if obj:GetAttribute("OriginalEnabled") == nil then
				obj:SetAttribute("OriginalEnabled", obj.Enabled)
			end
			obj.Enabled = false
		else
			local orig = obj:GetAttribute("OriginalEnabled")
			if orig ~= nil then
				obj.Enabled = orig
			end
		end
	end
end

-- ==========================================
-- [Core Module Functions]
-- ==========================================
function Misc.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
	GetSelectedItems = reg.Utils.GetSelectedItems
end

function Misc.AntiLag()
	sData.Lighting.GlobalShadows = false
	sData.Lighting.FogEnd = 9e9
	sData.Lighting.Brightness = 1
	sData.Lighting.EnvironmentDiffuseScale = 0
	sData.Lighting.EnvironmentSpecularScale = 0
	sData.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)

	sData.Terrain.WaterWaveSize = 0
	sData.Terrain.WaterWaveSpeed = 0
	sData.Terrain.WaterReflectance = 0
	sData.Terrain.WaterTransparency = 1

	for i, v in ipairs(workspace:GetDescendants()) do
		if i % 200 == 0 then
			task.wait()
		end
		if v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			v.Reflectance = 0
		elseif v:IsA("ParticleEmitter") then
			v.Enabled = false
		elseif v:IsA("Decal") or v:IsA("Texture") then
			v.Transparency = 1
		end
	end
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	end)
end

function Misc.HidePlant(state)
	fVar.IsPlantHidden = state
	local PlantFolder = Utils.GetPlantsFolder()
	if not PlantFolder then
		return
	end

	for _, obj in ipairs(PlantFolder:GetDescendants()) do
		if not IsFruit(obj) then
			SetVisibility(obj, state)
		end
	end
	Misc.UpdatePlantTracker()
end

function Misc.HideFruit(state)
	fVar.IsFruitHidden = state
	local PlantFolder = Utils.GetPlantsFolder()
	if not PlantFolder then
		return
	end

	for _, obj in ipairs(PlantFolder:GetDescendants()) do
		if IsFruit(obj) then
			SetVisibility(obj, state)
		end
	end
	Misc.UpdatePlantTracker()
end

function Misc.UpdatePlantTracker()
	local Options = reg.Options
	local isHideActive = (Options.tgHideFruits and Options.tgHideFruits.Value) or (Options.tgHidePlants and Options.tgHidePlants.Value)
	local espCropsList = Options.ddEspCrops and GetSelectedItems(Options.ddEspCrops.Value) or {}
	local isEspCropsActive = Options.tgEspCrops and Options.tgEspCrops.Value and not table.find(espCropsList, "NONE")
	local espPlantsList = Options.ddEspPlants and GetSelectedItems(Options.ddEspPlants.Value) or {}
	local isEspPlantsActive = Options.tgEspPlants and Options.tgEspPlants.Value and not table.find(espPlantsList, "NONE")

	if isHideActive or isEspCropsActive or isEspPlantsActive then
		local PlantFolder = Utils.GetPlantsFolder()
		if PlantFolder and not SharedPlantConnection then
			SharedPlantConnection = PlantFolder.DescendantAdded:Connect(function(newObj)
				task.wait(0.1)
				if not newObj or not newObj.Parent then
					return
				end
				if not (newObj:IsA("BasePart") or newObj:IsA("Model") or newObj:IsA("Decal") or newObj:IsA("Texture") or newObj:IsA("MeshPart")) then
					return
				end

				local isThisFruit = IsFruit(newObj)
				if isHideActive then
					if isThisFruit then
						if fVar.IsFruitHidden then
							SetVisibility(newObj, true)
						end
					else
						if fVar.IsPlantHidden then
							SetVisibility(newObj, true)
						end
					end
				end

				if newObj:IsA("Model") then
					if isThisFruit and isEspCropsActive and table.find(espCropsList, newObj.Name) then
						Misc.SetEspCrop(newObj)
					elseif not isThisFruit and isEspPlantsActive and table.find(espPlantsList, newObj.Name) then
						Misc.SetEspPlant(newObj)
					end
				end
			end)
		end
	else
		if SharedPlantConnection then
			SharedPlantConnection:Disconnect()
			SharedPlantConnection = nil
		end
	end
end

function Misc.CreatESP(espfolder, obj, uuid, txt1, txt2, arg)
	if not (espfolder and obj and txt1) then
		return
	end
	local priority = arg or 0
	if BGuiSession[uuid] then
		BGuiSession[uuid]:Destroy()
		BGuiSession[uuid] = nil
	end

	local hasTxt2 = txt2 ~= nil and txt2 ~= ""
	local bgui = Instance.new("BillboardGui")
	bgui.Name = "ESP_" .. uuid
	bgui.Adornee = obj
	bgui.Size = UDim2.fromOffset(600, hasTxt2 and 120 or 65)
	bgui.StudsOffset = Vector3.new(0, 4, 0)
	bgui.AlwaysOnTop = true
	bgui.LightInfluence = 0
	bgui.Active = false
	bgui.Parent = espfolder

	local listLayout = Instance.new("UIListLayout")
	listLayout.Parent = bgui
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 2)
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Top

	local textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "InfoLabel"
	textLabel1.Parent = bgui
	textLabel1.LayoutOrder = 1
	textLabel1.Size = UDim2.fromScale(1, 0)
	textLabel1.AutomaticSize = Enum.AutomaticSize.XY
	textLabel1.BackgroundTransparency = 1
	textLabel1.TextWrapped = false
	textLabel1.Active = false
	textLabel1.RichText = true
	textLabel1.TextSize = 12
	textLabel1.Font = Enum.Font.FredokaOne
	textLabel1.Text = txt1

	if hasTxt2 then
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = "MutationLabel"
		textLabel2.Parent = bgui
		textLabel2.LayoutOrder = 2
		textLabel2.Size = UDim2.fromScale(1, 0)
		textLabel2.AutomaticSize = Enum.AutomaticSize.Y
		textLabel2.BackgroundTransparency = 1
		textLabel2.TextWrapped = true
		textLabel2.Active = false
		textLabel2.RichText = true
		textLabel2.TextSize = 10
		textLabel2.Text = txt2
		textLabel2.Font = Enum.Font.FredokaOne
		textLabel2.TextColor3 = Color3.fromRGB(200, 200, 200)
	end

	if priority == 3 then
		textLabel1.TextColor3 = Color3.fromRGB(200, 200, 10)
	elseif priority == 2 then
		textLabel1.TextColor3 = Color3.fromRGB(200, 50, 10)
	elseif priority == 1 then
		textLabel1.TextColor3 = Color3.fromRGB(10, 200, 10)
	else
		textLabel1.TextColor3 = Color3.fromRGB(200, 200, 200)
	end

	BGuiSession[uuid] = bgui
end

function Misc.SetEspCrop(fruit)
	local Options = reg.Options
	if not Options.tgEspCrops.Value then
		return
	end

	local TargetFolder = GetHUI and GetHUI() or CoreGui
	local ESPFolder = TargetFolder:FindFirstChild(FruitESPFolderName)
	if not ESPFolder then
		return
	end

	local fruitName = fruit.Name
	local fruitWeight = fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Weight").Value or 0
	local Item_Seed = fruit:FindFirstChild("Item_Seed") and fruit:FindFirstChild("Item_Seed").Value or fruitName
	local uuid = Item_Seed

	local priceText = GetFormattedFruitPrice(fruit)
	local txt1 = string.format('<b>%s</b> (%.2fkg, <font color="#FFD700">$%s</font>)', fruitName, fruitWeight, priceText)
	local txt2 = GetFormattedMutations(fruit)

	local scale = fruit:GetAttribute("WeightMulti") or 0
	local arg = 0
	if scale >= 30 then
		arg = 3
	elseif scale >= 20 then
		arg = 2
	elseif scale >= 10 then
		arg = 1
	end

	Misc.CreatESP(ESPFolder, fruit, uuid, txt1, txt2, arg)
end

function Misc.SetEspPlant(plant)
	local Options = reg.Options
	if not (Options and Options.tgEspPlants and Options.tgEspPlants.Value) then
		return
	end
	if not (plant and plant:IsA("Model")) then
		return
	end

	local espPlantsList = GetSelectedItems(Options.ddEspPlants.Value)
	if not table.find(espPlantsList, plant.Name) then
		return
	end

	local TargetFolder = GetHUI and GetHUI() or CoreGui
	local ESPFolder = TargetFolder:FindFirstChild(PlantsESPFolderName)
	if not ESPFolder then
		return
	end

	local plantName = plant.Name
	local plantWeightValue = plant:FindFirstChild("Weight") and plant:FindFirstChild("Weight").Value or 0
	local uuid = tostring(plant:GetAttribute("UUID") or plant:GetDebugId())

	local txt1 = string.format("<b>%s</b> (%.2fkg)", plantName, tonumber(plantWeightValue) or 0)
	Misc.CreatESP(ESPFolder, plant, uuid, txt1, "", 0)
end

function Misc.EspCrops(State)
	local Options = reg.Options
	local TargetFolder = GetHUI and GetHUI() or CoreGui
	local oldFolder = TargetFolder:FindFirstChild(FruitESPFolderName)
	if oldFolder then
		oldFolder:Destroy()
	end
	if State ~= true then
		Misc.UpdatePlantTracker()
		return
	end

	local espCropsList = GetSelectedItems(Options.ddEspCrops.Value)
	if table.find(espCropsList, "NONE") then
		return
	end

	local ESPFolder = Instance.new("Folder")
	ESPFolder.Name = FruitESPFolderName
	ESPFolder.Parent = TargetFolder

	local Plants_Physical = Utils.GetPlantsFolder()
	if Plants_Physical then
		for _, plant in ipairs(Plants_Physical:GetChildren()) do
			local FruitsContainer = plant:FindFirstChild("Fruits")
			local itemsToCheck = FruitsContainer and FruitsContainer:GetChildren() or { plant }
			for _, item in ipairs(itemsToCheck) do
				if item:IsA("Model") and table.find(espCropsList, item.Name) then
					Misc.SetEspCrop(item)
				end
			end
		end
	end
	Misc.UpdatePlantTracker()
end

function Misc.EspPlants(State)
	local Options = reg.Options
	local TargetFolder = GetHUI and GetHUI() or CoreGui
	local oldFolder = TargetFolder:FindFirstChild(PlantsESPFolderName)
	if oldFolder then
		oldFolder:Destroy()
	end
	if State ~= true then
		Misc.UpdatePlantTracker()
		return
	end

	local espPlantsList = GetSelectedItems(Options.ddEspPlants.Value)
	if table.find(espPlantsList, "NONE") then
		Misc.UpdatePlantTracker()
		return
	end

	local ESPFolder = Instance.new("Folder")
	ESPFolder.Name = PlantsESPFolderName
	ESPFolder.Parent = TargetFolder

	local Plants_Physical = Utils.GetPlantsFolder()
	if Plants_Physical then
		for _, plant in ipairs(Plants_Physical:GetChildren()) do
			if plant:IsA("Model") and table.find(espPlantsList, plant.Name) then
				Misc.SetEspPlant(plant)
			end
		end
	end
	Misc.UpdatePlantTracker()
end

function Misc.EspEggs(State)
	--local Options = reg.Options
	local TargetFolder = GetHUI and GetHUI() or CoreGui
	local oldFolder = TargetFolder:FindFirstChild(EggsESPFolderName)
	if oldFolder then
		oldFolder:Destroy()
	end
	if State ~= true then
		--Misc.UpdatePlantTracker()
		return
	end

	local ESPFolder = Instance.new("Folder")
	ESPFolder.Name = EggsESPFolderName
	ESPFolder.Parent = TargetFolder

	local GetData_result = sData.DataService:GetData()
	local ReadyEggs = {}
	local PetsData = {}
	local myEggs = reg.Pets.EggInFarm()
	local SelectedSlot = GetData_result.SaveSlots.SelectedSlot
	local fData = GetData_result.SaveSlots.AllSlots[SelectedSlot].SavedObjects
	if not fData or type(fData) ~= "table" then
		--task.wait(5)
		return
	end
	local petCount = 0
	for Key, PetData in pairs(fData) do
		if PetData.ObjectType == "PetEgg" then
			PetsData[Key] = PetData
			petCount = petCount + 1
		end
	end

	for _, nEggs in pairs(myEggs) do
		if nEggs:GetAttribute("READY") == true then
			table.insert(ReadyEggs, nEggs)
		end
	end

	if #ReadyEggs == 0 then
		return
	end

	for _, Egg in ReadyEggs do
		local uuid = Egg:GetAttribute("OBJECT_UUID")
		local EggData = PetsData[uuid]
		if EggData then
			local HatchWeight = EggData.Data.BaseWeight * 1.1
			local HatchPetType = EggData.Data.Type
			local txt1 = string.format("<b>%s</b> (%.2f kg)", HatchPetType, tonumber(HatchWeight) or 0)
			Misc.CreatESP(ESPFolder, Egg, uuid, txt1, "", 3)
		end
	end
end

function Misc.EspCrates(State) end

function Misc.HideTracker()
	Misc.UpdatePlantTracker()
end

function Misc.SeasonPassShop()
	local Options = reg.Options
	if not Options.tgSeasonPassShop or not Options.tgSeasonPassShop.Value then
		return
	end
end

function Misc.SeasonPassQuests()
	local Options = reg.Options
	if not Options.tgSeasonPassQuests or not Options.tgSeasonPassQuests.Value then
		return
	end
	local GetData_result = sData.DataService:GetData()

	local currentSeason = sData.SeasonPassData.CurrentSeason
	local seasonInfo = GetData_result.SeasonPass[currentSeason]

	-- เช็คข้อมูล Container ของเควสรายวัน
	local ContainerId = GetData_result.DailyQuests and GetData_result.DailyQuests.ContainerId
	if ContainerId then
		local container = GetData_result.QuestContainers[ContainerId]

		if container then
			local allCompleted = true

			for _, quest in pairs(container.Quests) do
				-- เช็คว่าทำเควสนี้เสร็จหรือยัง
				if quest.Completed then
					local isClaimed = table.find(seasonInfo.QuestsClaimed, quest.Id)
					if not isClaimed then
						reg.Log("Claiming Season Pass Quest: " .. tostring(quest.Id))
						sData.ClaimSeasonPassQuestRemote:FireServer(quest.Id)
						task.wait(0.5)
					end
				else
					allCompleted = false
				end
			end

			-- กดสุ่มรางวัลใหญ่ (เมื่อทำครบและยังไม่เคยกด)
			if allCompleted and not seasonInfo.QuestRewardClaimed then
				sData.SeedPackEvent.Open:FireServer("Season Pass Quests")
			end
		end
	end
end

function Misc.SeasonPassRewards()
	local Options = reg.Options
	if not Options.tgSeasonPassRewards or not Options.tgSeasonPassRewards.Value then
		return
	end
	local GetData_result = sData.DataService:GetData()

	local currentSeason = sData.SeasonPassData.CurrentSeason
	local seasonInfo = GetData_result.SeasonPass[currentSeason]
	local currentLevel = sData.SeasonPassUtils.CalculateLevel(seasonInfo.TotalExperience)
	local maxLevel = sData.SeasonPassStaticData.MAX_LEVEL or 50

	local limitLevel = math.min(currentLevel, maxLevel)
	for tier = 1, limitLevel do
		-- เช็คการรับรางวัลฝั่งฟรี
		local claimedFree = table.find(seasonInfo.ClaimedLevelFreeRewards, tier)
		if not claimedFree then
			reg.Log("Claiming Season Pass Reward: " .. tostring(tier))
			sData.ClaimSeasonPassRewardRemote:FireServer(tier, false)
			task.wait(0.3)
		end

		-- เช็คการรับรางวัลฝั่งพรีเมียม (ตรวจสอบด้วยว่ามีสถานะพรีเมียมหรือไม่)
		local claimedPremium = table.find(seasonInfo.ClaimedLevelPremiumRewards, tier)
		if seasonInfo.IsPremium and not claimedPremium then
			reg.Log("Claiming Premium Season Pass Reward: " .. tostring(tier))
			sData.ClaimSeasonPassRewardRemote:FireServer(tier, true)
			task.wait(0.3)
		end
	end

	if currentLevel >= maxLevel then
		-- คำนวณหา XP ของเลเวล Max เพื่อเอามาหักลบหา XP ที่เกินมา
		local maxLevelXP = sData.SeasonPassUtils.CalculateXPForLevel(maxLevel)
		local excessXP = seasonInfo.TotalExperience - maxLevelXP

		-- ดึงค่า XP ที่ต้องใช้ต่อ 1 Infinite Reward
		-- (พี่เอฟลองเช็คชื่อตัวแปร InfRewardXP ใน SeasonPassStaticData อีกทีนะคะว่าชื่อตรงไหม)
		local infLevelPerXP = sData.SeasonPassStaticData.INF_REWARD_XP or 10000

		local totalInfEarned = math.floor(excessXP / infLevelPerXP)
		local totalInfClaimed = seasonInfo.InfiniteRewardsClaimed or 0

		-- ถ้าจำนวนที่ควรได้ มากกว่าจำนวนที่เคยกดรับไป
		if totalInfEarned > totalInfClaimed then
			local claimsToMake = totalInfEarned - totalInfClaimed
			for i = 1, claimsToMake do
				reg.Log("Claiming Season Pass Point : " .. tostring(i))
				sData.ClaimSeasonPassInfRewardRemote:FireServer()
				task.wait(0.3) -- ดีเลย์เล็กน้อยกันการส่งข้อมูลถี่เกินไป
			end
			--reg.Log("✨ รับ Infinite Rewards สำเร็จ: " .. tostring(claimsToMake) .. " กล่อง")
		end
	end
end
return Misc
