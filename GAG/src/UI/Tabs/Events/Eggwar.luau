local Eggwar = {}

local reg
local QuickSave
local EventsTab

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local homePos = CFrame.new(-43.30, 4.7, -78.98)
local eventConnection = nil

local function isEggWarActive()
	local endsAt = Workspace:GetAttribute("GlobalEggHuntEndsAt")
	if type(endsAt) == "number" then
		return Workspace:GetServerTimeNow() < endsAt
	end
	return false
end

function Eggwar.autoEggwar()
	local Options = reg.Options
	if not Options.tgEggwarEnable.Value or reg.IsHuntEgg then
		return
	end

	reg.IsHuntEgg = true
	reg.IsEasterHarvesting = true
	local character = LocalPlayer.Character

	local isCarrying = character:GetAttribute("EasterEggHunt_CARRYING")

	if isCarrying then
		character:PivotTo(homePos)
		task.wait(0.5)
		isCarrying = false
	end

	for _, obj in pairs(Workspace:GetDescendants()) do
		if obj:IsA("ProximityPrompt") and obj.ActionText == "Collect" then
			local model = obj.Parent and obj.Parent.Parent
			if model and model.Name == "Model" then
				local eggPart = model.PrimaryPart or obj.Parent
				if eggPart then
					-- 1. วาปไปหาไข่
					character:PivotTo(eggPart.CFrame)
					task.wait(0.3)

					for retry = 1, 3 do
						fireproximityprompt(obj)
						task.wait(0.5)

						if character:GetAttribute("EasterEggHunt_CARRYING") then
							reg.Log("[Success] เก็บไข่สำเร็จในรอบที่: " .. retry)
							isCarrying = true
							break
						end
						reg.Log("[Retry] พยายามเก็บอีกครั้ง... รอบที่: " .. retry)
					end

					if isCarrying then
						character:PivotTo(homePos)
						task.wait(0.5)
						isCarrying = false
					end
				end
			end
		end

		if not isEggWarActive() then
			break
		end
	end

	reg.IsHuntEgg = false
	reg.IsEasterHarvesting = false
end

local function onToggleChanged(Value)
	local isAutoFarmOn = Value -- อัปเดตสถานะตาม UI

	if isAutoFarmOn then
		reg.Log("[System] เปิดโหมด Auto Egg War")

		if isEggWarActive() then
			Eggwar.autoEggwar()
		end
		if not eventConnection then
			eventConnection = Workspace:GetAttributeChangedSignal("GlobalEggHuntEndsAt"):Connect(function()
				if isEggWarActive() then
					Eggwar.autoEggwar()
				end
			end)
		end
	else
		reg.Log("[System] ปิดโหมด Auto Egg War")
		if eventConnection then
			eventConnection:Disconnect()
			eventConnection = nil
		end
	end
end

function Eggwar.Initialize(registry, tab)
	reg = registry
	QuickSave = reg.Window.QuickSave
	EventsTab = tab
	local Options = reg.Options
	_ = Options

	local EggwarSection = EventsTab:AddCollapsibleSection("Eggwar", false)
	EggwarSection:AddToggle("tgEggwarEnable", {
		Title = "Eggwar Event Enable",
		Default = false,
		Callback = function(Value)
			onToggleChanged(Value)
			QuickSave()
			if not Value then
				reg.IsHuntEgg = false
				reg.IsEasterHarvesting = false
			end
		end,
	})
end

return Eggwar
