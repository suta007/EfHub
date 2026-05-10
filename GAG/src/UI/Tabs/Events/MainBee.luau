local MainBee = {}
local reg
local CollectionService = game:GetService("CollectionService")
local sData

local function HarvestHoneyFruits()
	local Options = reg.Options
	if not Options.tgHarvestHoneyEnable or not Options.tgHarvestHoneyEnable.Value then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end

	local allPrompts = CollectionService:GetTagged("CollectPrompt")
	for _, prompt in ipairs(allPrompts) do
		if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
			return
		end
		if prompt:IsA("ProximityPrompt") and prompt.Enabled and not prompt:GetAttribute("Collected") then
			local cropModel = prompt.Parent and prompt.Parent.Parent
			if cropModel then
				--seen[cropModel] = true
				--table.insert(ReadyCrops, cropModel)
				sData.CollectEvent:FireServer({ cropModel })
				task.wait(0.2)
			end
		end
	end
end

local function CompressHoney()
	local Options = reg.Options
	if not Options.tgCompressHoneyEnable or not Options.tgCompressHoneyEnable.Value then
		return
	end
	local GetData_result = sData.DataService:GetData()
	local HoneyMachine2026 = GetData_result.HoneyMachine2026
	local HoneyStored = HoneyMachine2026.HoneyStored
	local IsRunning = HoneyMachine2026.IsRunning
	if tonumber(HoneyStored) > 0 then
		sData.GameEvents:WaitForChild("HoneyMachine2026Service_RE"):FireServer("CollectHoney")
		task.wait(1)
	end
	if not IsRunning then
		sData.GameEvents:WaitForChild("HoneyMachine2026Service_RE"):FireServer("SubmitAll")
		task.wait(1)
	end
end

local function KeepPos()
	local Options = reg.Options
	local Utils = reg.Utils
	if not Options.tgKeepPosEnable or not Options.tgKeepPosEnable.Value then
		return
	end
	local posStr = Options.ipKeepPos.Value
	if posStr == "" then
		reg.Log("Please set position.")
		return
	end
	local targetPos = Utils.ParseVector3(posStr)
	if not targetPos then
		reg.Log("Invalid position format.")
		return
	end

	local character = sData.Character
	local currentPos = character.PrimaryPart.Position
	local distance = (currentPos - targetPos).Magnitude
	if distance > 10 then
		character:PivotTo(CFrame.new(targetPos))
	end
end

function MainBee.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local MainBeeSection = EventsTab:AddCollapsibleSection("MainBee", false)
	MainBeeSection:AddToggle("tgHarvestHoneyEnable", {
		Title = "Harvest Honey Fruits Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoHarvestHoney", Value, function()
				HarvestHoneyFruits()
				task.wait(1)
			end)
		end,
	})

	MainBeeSection:AddToggle("tgCompressHoneyEnable", {
		Title = "Compress Honey Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoCompressHoney", Value, function()
				CompressHoney()
				task.wait(10)
			end)
		end,
	})

	local KeepPosSection = EventsTab:AddCollapsibleSection("MainBee", false)
	KeepPosSection:AddButton({
		Title = "Set Position",
		Callback = function()
			local Pos = sData.Character:GetPivot().Position
			local formattedPos = string.format("%.3f, %.3f, %.3f", Pos.X, Pos.Y, Pos.Z)
			Options.ipKeepPos:SetValue(formattedPos)
			QuickSave()
		end,
	})
	KeepPosSection:AddInput("ipKeepPos", {
		Title = "Position",
		Default = "",
		Placeholder = "X, Y, Z",
		Numeric = false,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	})
	KeepPosSection:AddInput("ipKeepPosDelay", {
		Title = "Delay Check Time (s)",
		Default = 60,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	KeepPosSection:AddToggle("tgKeepPosEnable", {
		Title = "Keep Position Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoKeepPos", Value, function()
				local delay = tonumber(Options.ipKeepPosDelay.Value) or 60
				KeepPos()
				task.wait(delay)
			end)
		end,
	})
end

return MainBee
