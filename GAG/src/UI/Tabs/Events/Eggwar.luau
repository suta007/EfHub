local Eggwar = {}
local fireproximityprompt = (getfenv() :: any).fireproximityprompt
local reg
local QuickSave
local EventsTab

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
--local homePos = CFrame.new(-43.30, 4.7, -78.98)
local Utils
local EfTasks
local isWarLaunched = false

function Eggwar.autoEggwar()
	local Options = reg.Options
	if not Options.tgEggwarEnable.Value or reg.IsHuntEgg then
		return
	end
	local homePos = CFrame.new(Utils.ParseVector3(Options.ipEggwarPos.Value))
	reg.IsHuntEgg = true
	reg.IsEasterHarvesting = true
	local character = LocalPlayer.Character

	for _, obj in pairs(Workspace:GetChildren()) do
		if obj.Name == "Model" then
			character:PivotTo(obj.CFrame)
			task.wait(0.3)
			fireproximityprompt(obj)
			task.wait(0.5)
			character:PivotTo(homePos)
			task.wait(0.5)
		end
		task.wait()
	end

	reg.IsHuntEgg = false
	reg.IsEasterHarvesting = false
end

function Eggwar.checktime()
	local Options = reg.Options
	if not Options.tgEggwarEnable.Value or reg.IsHuntEgg then
		return
	end
	local currentMinute = os.date("!*t").min
	if currentMinute < 2 then
		if not isWarLaunched then
			isWarLaunched = true
			Eggwar.autoEggwar()
		end
	else
		isWarLaunched = false
	end
end

function Eggwar.Initialize(registry, tab)
	reg = registry
	QuickSave = reg.Window.QuickSave
	EventsTab = tab
	Utils = reg.Utils
	EfTasks = reg.EfTasks
	local Options = reg.Options
	_ = Options
	local character = LocalPlayer.Character
	local EggwarSection = EventsTab:AddCollapsibleSection("Eggwar", false)
	EggwarSection:AddToggle("tgEggwarEnable", {
		Title = "Eggwar Event Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if not Value then
				reg.IsHuntEgg = false
				reg.IsEasterHarvesting = false
			end
			EfTasks.ToggleTask("AutoEggwar", Value, function()
				Eggwar.checktime()
				task.wait(5)
			end)
		end,
	})

	EggwarSection:AddButton({
		Title = "Set Position",
		Callback = function()
			local Pos = character:GetPivot().Position
			local formattedPos = string.format("%.3f, %.3f, %.3f", Pos.X, Pos.Y, Pos.Z)
			Options.ipEggwarPos:SetValue(formattedPos)
			QuickSave()
		end,
	})
	EggwarSection:AddInput("ipEggwarPos", {
		Title = "Position",
		Default = "",
		Placeholder = "X, Y, Z",
		Numeric = false,
		Finished = false,
		Callback = function(_Value)
			QuickSave()
		end,
	})
end

return Eggwar
