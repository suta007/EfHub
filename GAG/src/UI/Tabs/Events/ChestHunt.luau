local ChestHunt = {}
local fireproximityprompt = (getfenv() :: any).fireproximityprompt
local reg
local QuickSave
local EventsTab
local EfTasks
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local SummerChestHunt = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("SummerChestHunt")
--local StartGlobalChestHunt = SummerChestHunt:WaitForChild("StartGlobalChestHunt")

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
--local Character = LocalPlayer.Character
local MyName = LocalPlayer.Name
local myFarm = nil
local spawnPoint
local isWarLaunched = false
local isHunting = false
function GetMyFarm()
	local farmFolder = Workspace:FindFirstChild("Farm")
	if not farmFolder then
		return nil
	end
	for _, oFarm in pairs(farmFolder:GetChildren()) do
		local success, owner = pcall(function()
			return oFarm.Important.Data.Owner.Value
		end)

		if success and owner == MyName then
			return oFarm
		end
	end
	return nil
end

function ChestHunt.autoChestHunt()
	local Options = reg.Options
	if not Options.tgChestHuntEnable.Value or isHunting then
		return
	end
	isHunting = true
	local character = LocalPlayer.Character
	local count = 1
	reg.Log("🟣 กำลังล่ากล่อง รอ 3 วินาที")
	task.wait(3)

	for _, obj in pairs(Workspace:GetChildren()) do
		if obj.Name == "Model" then
			character:PivotTo(obj:GetPivot())
			task.wait(2)
			local target = obj:FindFirstChild("ProximityPrompt", true)
			if target then
				fireproximityprompt(target)
				task.wait(2)
				character:PivotTo(spawnPoint)
				task.wait(2)
				reg.Log("🟢 ล่ากล่อง " .. count .. " สำเร็จ")
				count = count + 1
			else
				reg.Log("🔴 ไม่พบ ProximityPrompt ใน Model")
			end
		end
		task.wait(0.2)
	end

	reg.Log("🟣 ล่ากล่องได้ " .. (count - 1) .. " ใบ")
	isHunting = false
	isWarLaunched = false
end

function ChestHunt.checktime()
	local Options = reg.Options
	if not Options.tgChestHuntEnable.Value or isHunting then
		return
	end
	local StartTime = tonumber(Options.ipStartChestHuntTime.Value)
	local StopTime = tonumber(Options.ipStopChestHuntTime.Value)
	local currentMinute = os.date("!*t").min
	if currentMinute >= StartTime and currentMinute <= StopTime then
		if not isWarLaunched then
			isWarLaunched = true
			ChestHunt.autoChestHunt()
		end
	else
		isWarLaunched = false
		isHunting = false
	end
end

function ChestHunt.Initialize(registry, tab)
	reg = registry
	QuickSave = reg.Window.QuickSave
	EventsTab = tab
	--Utils = reg.Utils
	EfTasks = reg.EfTasks
	local Options = reg.Options
	_ = Options
	myFarm = GetMyFarm()
	if myFarm then
		if myFarm:FindFirstChild("Spawn_Point") then
			spawnPoint = myFarm.Spawn_Point.CFrame
		end
	end

	local ChestHuntSection = EventsTab:AddCollapsibleSection("ChestHunt", false)
	ChestHuntSection:AddToggle("tgChestHuntEnable", {
		Title = "ChestHunt Event Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if not Value then
				isWarLaunched = false
				isHunting = false
			end
			EfTasks.ToggleTask("AutoEggwar", Value, function()
				ChestHunt.checktime()
				task.wait(5)
			end)
		end,
	})

	ChestHuntSection:AddInput("ipStartChestHuntTime", {
		Title = "Start Time (Minutes)",
		Default = 30,
		Numeric = false,
		Finished = false,
		Callback = function(_Value)
			QuickSave()
		end,
	})

	ChestHuntSection:AddInput("ipStopChestHuntTime", {
		Title = "Stop Time (Minutes)",
		Default = 33,
		Numeric = false,
		Finished = false,
		Callback = function(_Value)
			QuickSave()
		end,
	})
end

return ChestHunt
