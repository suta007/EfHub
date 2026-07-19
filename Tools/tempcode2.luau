local fireproximityprompt = (getfenv() :: any).fireproximityprompt
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SummerChestHunt = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("SummerChestHunt")
local StartGlobalChestHunt = SummerChestHunt:WaitForChild("StartGlobalChestHunt")

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local MyName = LocalPlayer.Name

function GetMyFarm()
	local farmFolder = workspace:FindFirstChild("Farm")
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

local myFarm = GetMyFarm()

local spawnPoint
if myFarm then
	if myFarm:FindFirstChild("Spawn_Point") then
		spawnPoint = myFarm.Spawn_Point.CFrame
	end
end
Character:PivotTo(spawnPoint)

StartGlobalChestHunt.OnClientEvent:Connect(function()
	print("Start Chest Hunt Wait 5 s ...")
	task.wait(5)
	for _, obj in pairs(Workspace:GetChildren()) do
		if obj.Name == "Model" then
			print("Find Model")
			print("warp to " .. obj:GetPivot().Position)
			Character:PivotTo(obj:GetPivot())
			task.wait(2)
			local target = obj:FindFirstChild("ProximityPrompt", true)
			if target then
				fireproximityprompt(target)
				task.wait(2)
				print("warp to home")
				Character:PivotTo(spawnPoint)
				task.wait(2)
				--reg.Log("🟢 เก็บไข่ " .. count .. " สำเร็จ")
				--count = count + 1
			end
		end
		task.wait(0.2)
	end
end)

print("Event Summer Chest Hunt is load")
