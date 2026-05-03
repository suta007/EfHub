local getconnections = (getfenv() :: any).getconnections
local firesignal = (getfenv() :: any).firesignal
local statusGUI = Instance.new("ScreenGui")
local statusText = Instance.new("TextLabel")

local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualUser = game:GetService("VirtualUser")
local getgenv = (getfenv() :: any).getgenv

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules") :: any
local DataService = require(Modules.DataService)

local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")

local autoBuy = true

local TargetFolder = getgenv().GetHUI and getgenv().GetHUI() or game:GetService("CoreGui")
local oldFolder = TargetFolder:FindFirstChild("AutoAfxGUI")
if oldFolder then
	oldFolder:Destroy()
end

local statusFolder = Instance.new("Folder")
statusFolder.Name = "AutoAfxGUI"
statusFolder.Parent = TargetFolder

statusGUI.Name = "statusGUI"
statusGUI.Parent = statusFolder
statusGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

statusText.Name = "StatusText"
statusText.Parent = statusGUI
statusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusText.BackgroundTransparency = 1.000
statusText.BorderSizePixel = 0
statusText.Position = UDim2.fromOffset(10, 5)
statusText.Size = UDim2.fromOffset(100, 50)
statusText.Font = Enum.Font.GothamBold
statusText.Text = "Anti AFX & Gift On"
statusText.TextColor3 = Color3.fromRGB(10, 250, 50)
statusText.TextSize = 14.000
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.TextYAlignment = Enum.TextYAlignment.Top
statusText.TextStrokeTransparency = 0.3
statusText.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

function AcceptGiftPets()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
	local notiFrame = PlayerGui:FindFirstChild("Gift_Notification"):FindFirstChild("Frame")

	local GiftPetEvent = GameEvents:WaitForChild("GiftPet")
	GiftPetEvent.OnClientEvent:Connect(function(...)
		task.spawn(function()
			task.wait(2)
			pcall(function()
				for _, obj in pairs(notiFrame:GetChildren()) do
					if obj.Name == "Gift_Notification" then
						local acceptBtn = obj.Holder.Frame.Accept
						if firesignal then
							firesignal(acceptBtn.MouseButton1Click)
							firesignal(acceptBtn.Activated)
						elseif getconnections then
							for _, connection in pairs(getconnections(acceptBtn.MouseButton1Click)) do
								if connection.Fire then
									connection:Fire()
								else
									connection.Function()
								end
							end
						end
					end
				end
			end)
		end)
	end)
end

local buySeedData = {
	"Orange Tulip",
	"Daffodil",
	"Watermelon",
	"Pumpkin",
	"Apple",
	"Bamboo",
	"Coconut",
	"Cactus",
	"Dragon Fruit",
	"Mango",
	"Grape",
	"Mushroom",
	"Pepper",
	"Cacao",
	"Sunflower",
	"Beanstalk",
	"Ember Lily",
	"Sugar Apple",
	"Burning Bud",
	"Giant Pinecone",
	"Elder Strawberry",
	"Romanesco",
	"Crimson Thorn",
	"Zebrazinkle",
	"Octobloom",
	"Alien Apple",
	"Eggsnapper",
}

local buyGearData = {
	"Watering Can",
	"Trading Ticket",
	"Trowel",
	"Recall Wrench",
	"Basic Sprinkler",
	"Advanced Sprinkler",
	"Medium Toy",
	"Pet Lead",
	"Medium Treat",
	"Godly Sprinkler",
	"Magnifying Glass",
	"Master Sprinkler",
	"Cleaning Spray",
	"Favorite Tool",
	"Harvest Tool",
	"Grandmaster Sprinkler",
	"Levelup Lollipop",
	"Cleansing Pet Shard",
}

local buyEasterData = { "Springtide Egg" }
local function startAutoBuy()
	if not autoBuy then
		return
	end
	local GetData_result = DataService:GetData()
	local SeedStocks = GetData_result.SeedStocks.Shop.Stocks
	task.spawn(function()
		pcall(function()
			for itemId, itemInfo in pairs(SeedStocks) do
				local ItemName = itemId
				local StockAmount = tonumber(itemInfo.Stock) or 0
				if table.find(buySeedData, ItemName) then
					if StockAmount > 0 then
						for _i = 1, StockAmount do
							GameEvents.BuySeedStock:FireServer("Shop", ItemName)
							task.wait()
						end
					end
				end
			end
		end)
	end)

	local GearStocks = GetData_result.GearStock.Stocks
	task.spawn(function()
		pcall(function()
			for itemId, itemInfo in pairs(GearStocks) do
				local ItemName = itemId
				local StockAmount = tonumber(itemInfo.Stock) or 0
				if table.find(buyGearData, ItemName) then
					if StockAmount > 0 then
						for _i = 1, StockAmount do
							GameEvents.BuyGearStock:FireServer(ItemName)
							task.wait()
						end
					end
				end
			end
		end)
	end)

	local EasterStocks = GetData_result.EventShopStock["Easter Seed Shop"].Stocks
	task.spawn(function()
		pcall(function()
			for itemId, itemInfo in pairs(EasterStocks) do
				local ItemName = itemId
				local StockAmount = tonumber(itemInfo.Stock) or 0
				if table.find(buyEasterData, ItemName) then
					if StockAmount > 0 then
						for _i = 1, StockAmount do
							GameEvents.BuyEventShopStock:FireServer(ItemName, "Easter Seed Shop")
							task.wait()
						end
					end
				end
			end
		end)
	end)
end

local function startPollingTimer()
	local lastExecutedMinute = -1

	while true do
		local currentMin = os.date("*t").min

		-- ถ้านาทีปัจจุบันหาร 5 ลงตัว และยังไม่เคยทำงานในนาทีนี้
		if currentMin % 5 == 0 and currentMin ~= lastExecutedMinute then
			lastExecutedMinute = currentMin
			task.spawn(startAutoBuy)
		end

		-- เช็คเวลาใหม่ทุกๆ 1 วินาที
		task.wait(1)
	end
end

AcceptGiftPets()
startAutoBuy()
task.spawn(startPollingTimer)
