-- workspace arttibute  SummerHarvest : Bool
local MoonBeam = {}
local reg
local sData

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local HarvestMoonSell = GameEvents:WaitForChild("HarvestMoonSell")

local isMoonSelling = false

--[[
HarvestMoonSell:FireServer("SellAll")
]]

local function MoonBeamSell()
	local Options = reg.Options
	if not Options.tgMoonBeamEnable or not Options.tgMoonBeamEnable.Value then
		return
	end
	if isMoonSelling then
		return
	end
	if not sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end
	isMoonSelling = true
	HarvestMoonSell:FireServer("SellAll")
	task.wait(0.3)
	isMoonSelling = false
end

function MoonBeam.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local SummerSection = EventsTab:AddCollapsibleSection("MoonBeam", false)

	SummerSection:AddInput("inpMoonBeamSellDelay", {
		Title = "MoonBeam Sell Delay",
		Default = 30,
		Numeric = true,
		Finished = true,
		Callback = function(v)
			if v == "" then
				v = 30
			end
			QuickSave()
		end,
	})

	SummerSection:AddToggle("tgMoonBeamEnable", {
		Title = "MoonBeam Sell Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if not Value then
				isMoonSelling = false
			end

			EfTasks.ToggleTask("MoonBeamSell", Value, function()
				local LoopDelay = tonumber(Options.inpMoonBeamSellDelay and Options.inpMoonBeamSellDelay.Value) or 30
				MoonBeamSell()
				task.wait(LoopDelay)
			end)
		end,
	})
end

return MoonBeam
