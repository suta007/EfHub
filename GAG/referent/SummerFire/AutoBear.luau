local TargetTrait = workspace:GetAttribute("SummerBearTrait")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData)
--local TraitNames = PlantTraitsData.TraitNames
local Traits = PlantTraitsData.Traits
local FruitList = Traits[TargetTrait]

local DataService = require(ReplicatedStorage.Modules.DataService)

local SummerFireEvent = ReplicatedStorage.GameEvents.SummerFire

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local GameConfigController = require(ReplicatedStorage.Modules.GameConfigController)
local SummerBearConfig = GameConfigController:GetConfig("SummerBearConfig")

workspace:GetAttributeChangedSignal("SummerBearConfig"):Connect(function()
	SummerBearConfig = GameConfigController:GetConfig("SummerBearConfig")
end)

local BearPos = Vector3.new(-98.172, 6.6, 18.620)
local function MoveToBear()
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	HumanoidRootPart.CFrame = CFrame.new(BearPos)
end
local function SummerBear()
	local GetData = DataService:GetData()
	local SummerFireEventData = GetData.SummerFireEventData
	local CurrentLevel = tonumber(SummerFireEventData.CurrentLevel) or 0

	if CurrentLevel < 50 then
		local requiredWeight = SummerBearConfig.WEIGHTS[CurrentLevel + 1]
		local requiredMutation = SummerBearConfig.MUTATION_LIST[CurrentLevel + 1]
		local Backpack = LocalPlayer:WaitForChild("Backpack")
		for _, item in ipairs(Backpack:GetChildren()) do
			local ItemName = item:FindFirstChild("Item_String") and item:FindFirstChild("Item_String").Value
			if not item:GetAttribute("d") and item:HasTag("FruitTool") and table.find(FruitList, ItemName) then
				print("Found " .. ItemName)
				local ItemWeight = item:FindFirstChild("Weight") and item:FindFirstChild("Weight").Value
				if ItemWeight < requiredWeight then
					print("Weight to less : ", ItemWeight, " < ", requiredWeight)
					task.wait(1)
					continue
				end
				if requiredMutation ~= "Normal" and not item:GetAttribute(requiredMutation) then
					print("Mutation not found : ", requiredMutation)
					task.wait(1)
					continue
				end
				MoveToBear()
				task.wait(0.3)
				print("Equipping tool : ", item.Name)
				Humanoid:EquipTool(item)
				task.wait(0.1)
				SummerFireEvent.SubmitBear:FireServer()
				task.wait(1)
			end
		end
	end
end

task.spawn(function()
	while task.wait(1) do
		pcall(SummerBear)
	end
end)
