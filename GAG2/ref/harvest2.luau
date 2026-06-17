local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SharedModules = ReplicatedStorage:WaitForChild("SharedModules")
local Packet = SharedModules:WaitForChild("Packet")
local RemoteEvent = Packet:WaitForChild("RemoteEvent")

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerId = LocalPlayer.UserId
local num = 1
for _, prompt in CollectionService:GetTagged("HarvestPrompt") do
	if prompt:IsA("ProximityPrompt") and prompt.Enabled then
		local parent = prompt.Parent
		if parent:IsA("BasePart") then
			parent = parent.Parent
		end
		if not (parent and parent:IsA("Model")) then
			AddLog("Not a Model")
		end
		local UserId = parent:GetAttribute("UserId")

		if UserId ~= PlayerId then
			continue
		end
		local PromptType = tostring(parent.Parent) -- Fruits, Plants
		if parent:GetAttribute("PlantId") then
			local PromptName
			local args

			if PromptType == "Plants" then
				PromptName = parent:GetAttribute("SeedName")
				args = {
					buffer.fromstring("\177\000$" .. parent:GetAttribute("PlantId") .. "\000"),
				}
				RemoteEvent:FireServer(unpack(args))
			elseif PromptType == "Fruits" then
				PromptName = parent:GetAttribute("CorePartName")
				args = {
					buffer.fromstring("\177\000$" .. parent:GetAttribute("PlantId") .. "$" .. parent:GetAttribute("FruitId") .. "\000"),
				}
				RemoteEvent:FireServer(unpack(args))
			end
			AddLog(tostring(num) .. ". " .. PromptType)
			AddLog("Name: " .. tostring(PromptName))
			AddLog("UserId: " .. tostring(UserId))
			AddLog("PlantId: " .. parent:GetAttribute("PlantId"))
			if PromptType == "Fruits" then
				AddLog("FruitId: " .. parent:GetAttribute("FruitId"))
			end
			AddLog("+++++++++++++++++++++++++++")
			num = num + 1
		end
		task.wait(0.1)
	end
end
