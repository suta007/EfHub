local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(v2.UserGenerated.Client.ClientABTests)
local v3 = v1.LocalPlayer
if not v3 then
	return {}
end
local _ = v3.PlayerGui.Teleport_UI
v2.GameEvents.ABTestingEvents:WaitForChild("HideInventoryItem")
local v4 = {}
local v5 = require(v2.UserGenerated.Client.ClientABTests)
if v5.GetAssignmentsAsync(v3, true) then
	v5.GetAttributes(v3)
end
return v4