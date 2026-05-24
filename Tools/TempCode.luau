local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LootChest = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LootChest")
local OpenChest = LootChest:WaitForChild("OpenChest")
local SpawnChestRemote = LootChest:WaitForChild("SpawnChest")

workspace.ChildAdded:Connect(function(obj)
	local Character = localPlayer.Character
	if obj.Name == "WaspEgg" and obj:IsA("Model") and Character then
		local WaspPos = obj:GetPivot()
		Character:PivotTo(WaspPos * CFrame.new(2, 5, 2))
	end
end)

SpawnChestRemote.OnClientEvent:Connect(function(chestId, chestCFrame, _tier, _autoCollectAt)
	local Character = localPlayer.Character
	if Character then
		Character:PivotTo(chestCFrame * CFrame.new(2, 5, 2))
		task.wait(0.3)
		OpenChest:FireServer(chestId)
	end
end)
print("Start Wasp War")

local LocalLootChests = workspace:WaitForChild("LocalLootChests")
LocalLootChests.ChildAdded:Connect(function(obj)
	if obj:IsA("Model") then
		local JarPos = obj:GetPivot()
		Character:PivotTo(JarPos * CFrame.new(2, 5, 2))
		task.wait(0.5)
		local ticket = obj:GetAttribute("Ticket")
		if ticket and OpenChest then
			print("กำลังส่งสัญญาณเปิดกล่องด้วย Ticket:", ticket)
			OpenChest:FireServer(ticket)
		end
	end
end)

local function autoClaimRemote(jar)
	local ticket = jar:GetAttribute("Ticket")
	if ticket and OpenChest then
		print("กำลังส่งสัญญาณเปิดกล่องด้วย Ticket:", ticket)
		OpenChest:FireServer(ticket)
	end
end
for _, jar in ipairs(CollectionService:GetTagged("HoneyJarReward")) do
	print("Already Jar")
	task.spawn(autoClaimRemote, jar)
end

CollectionService:GetInstanceAddedSignal("HoneyJarReward"):Connect(function(jar)
	task.wait(0.5)
	print("Spawn Jar")
	autoClaimRemote(jar)
end)

--[[
local args = {
	"b20dd1f9-9a03-48df-aa18-feb206b4891c"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LootChest"):WaitForChild("OpenChest"):FireServer(unpack(args))

]]
