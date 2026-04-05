local Goldenegg = {}
local reg

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local TryBuyGoldenEggRE = GameEvents.EasterEvent.TryBuyGoldenEggRE
local DataService = require(ReplicatedStorage.Modules.DataService)
local EasterHelper = require(ReplicatedStorage.Modules.EasterEvent.EasterHelper)
local EggRates = {}
for i = 0, 15 do
	local v33 = EasterHelper:GetNextGoldenEggPrice(i)
	table.insert(EggRates, v33)
end

local EggShopPos = CFrame.new(-55.38, 5.6, -14.77)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local GoldeneggConnections = {}

local function BuyGoldenEgg()
	local Options = reg.Options
	if not Options.tgGoldeneggEnable.Value then
		return
	end
	reg.IsEasterHarvesting = true
	local MaxPrice = tonumber(Options.ddGoldeneggMaxPrice.Value) or 25000
	local GetData_result = DataService:GetData()
	local ChocCoins = tonumber(GetData_result.SpecialCurrency.ChocCoins)
	local CurrentAmount = tonumber(GetData_result.EasterEventData.GoldenEgg.BuyAmount)
	local CurrentPrice = tonumber(EasterHelper:GetNextGoldenEggPrice(CurrentAmount))
	if ChocCoins >= (CurrentPrice * 2) and CurrentPrice <= MaxPrice then
		Character:PivotTo(EggShopPos)
		task.wait(0.5)
		TryBuyGoldenEggRE:FireServer()
		task.wait(1)
		reg.Utils.ClickButton(reg.Utils.GardenButton)
		task.wait(1)
		reg.IsEasterHarvesting = false
		return
	end
	reg.IsEasterHarvesting = false
end

local function EventDrive(state: boolean)
	for _, connection in pairs(GoldeneggConnections) do
		connection:Disconnect()
	end
	table.clear(GoldeneggConnections)

	if state then
		local v35 = DataService:GetPathSignal("SpecialCurrency/ChocCoins/@")
		if v35 then
			table.insert(GoldeneggConnections, v35:Connect(BuyGoldenEgg))
		end
		local v36 = DataService:GetPathSignal("EasterEventData/GoldenEgg/@")
		if v36 then
			table.insert(GoldeneggConnections, v36:Connect(BuyGoldenEgg))
		end
	end
end

function Goldenegg.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	local GoldeneggSection = EventsTab:AddCollapsibleSection("Golden Egg", false)
	GoldeneggSection:AddToggle("tgGoldeneggEnable", {
		Title = "Buy Golden Egg Enable",
		Default = false,
		Callback = function(Value)
			EventDrive(Value)
			QuickSave()
		end,
	})
	GoldeneggSection:AddDropdown("ddGoldeneggMaxPrice", {
		Title = "Max Buy Golden Egg",
		Values = EggRates,
		Default = 6,
		Multi = false,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})
end

return Goldenegg
