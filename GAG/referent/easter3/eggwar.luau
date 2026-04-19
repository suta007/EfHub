local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character

for _, obj in pairs(Workspace:GetChildren) do
    if obj.Name == "Model" then
        character:PivotTo(obj.CFrame)
		task.wait(0.3)
		fireproximityprompt(obj)
		task.wait(0.5)
    end
    task.wait()
end

for _, obj in pairs(Workspace:GetDescendants()) do
	if obj:IsA("ProximityPrompt") and obj.ActionText == "Collect" then
		local model = obj.Parent and obj.Parent.Parent
        print("1")
		if model and model.Name == "Model" then
            print("2")
			local eggPart = model.PrimaryPart or obj.Parent
			if eggPart then
				-- 1. วาปไปหาไข่
                print("3")
				character:PivotTo(eggPart.CFrame)
				task.wait(0.3)
				fireproximityprompt(obj)
				task.wait(0.5)
			end
		end
	end
	task.wait()
end

local isCarrying = character:GetAttribute("EasterEggHunt_CARRYING")

print("Carrying: " .. tostring(isCarrying))

local function isEggWarActive()
	local currentMinute = DateTime.now():ToUniversalTime().Minute
	return currentMinute < 2
end

task.spawn(function()
	while task.wait(5) do
		if isEggWarActive() then
			print("Egg War is active")
		else
			print("Egg War is not active")
		end
	end
end)

for _i = 1, 10 do
    local currentMinute = DateTime.now():ToUniversalTime().Minute
    print(currentMinute)
    task.wait(1)
end