local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlantTraitsData = require(ReplicatedStorage.Modules.PlantTraitsData :: any)

local Eastersell = {}
local reg
local QuickSave
local EfTasks
local EventsTab
local sData
local EasterSlot = table.clone(PlantTraitsData.Traits["EasterSlot"])
table.insert(EasterSlot, 1, "ALL")

local Utils
local GameEvents = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")

-- =====================================================================
-- 1. ย้ายฟังก์ชันการทำงานมาไว้ด้านบน เพื่อให้พร้อมใช้งานก่อนโหลด UI
-- =====================================================================

function Eastersell.HarvestCrops()
	local Options = reg.Options
	if not Options.tgEasterHarvestEnable or not Options.tgEasterHarvestEnable.Value or reg.IsEasterHarvesting then
		return
	end
	if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
		return
	end
	reg.IsEasterHarvesting = true
	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		reg.IsEasterHarvesting = false
		return
	end
	local easterPlantlist = Utils.GetSelectedItems(Options.ddEasterHarvestPlant.Value)
	local HarvestList
	if table.find(easterPlantlist, "ALL") then
		HarvestList = EasterSlot
	else
		HarvestList = easterPlantlist
	end
	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		if not Options.tgEasterHarvestEnable.Value or reg.IsHuntEgg then
			reg.IsEasterHarvesting = false
			return
		end
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local Fruits = FruitsContainer and FruitsContainer:GetChildren() or { plant }

		for _, fruit in ipairs(Fruits) do
			if fruit:IsA("Model") and table.find(HarvestList, fruit.Name) then
				GameEvents:WaitForChild("Crops"):WaitForChild("Collect"):FireServer({ fruit })
				task.wait(0.1)
			end
		end
	end
	reg.IsEasterHarvesting = false
end

function Eastersell.AutoEasterSell()
	local Options = reg.Options
	if not Options.tgEasterSellEnable or not Options.tgEasterSellEnable.Value then
		return
	end
	reg.IsEasterHarvesting = true
	Utils.ClickButton(Utils.SellButton)
	task.wait(0.5)
	GameEvents:WaitForChild("EasterEvent"):WaitForChild("EasterSellInventoryRE"):FireServer()
	task.wait(1)
	Utils.ClickButton(Utils.GardenButton)
	task.wait(1)
	reg.IsEasterHarvesting = false
end

function Eastersell.runSell(state)
	local Options = reg.Options
	local SellDelay = Options.ipEasterSellDelay and tonumber(Options.ipEasterSellDelay.Value) or 600
	local SellFull = Options.tgEasterSellFull and Options.tgEasterSellFull.Value or false
	local SellWait = SellFull and 1 or SellDelay
	EfTasks.ToggleTask("AutoEasterSell", state, function()
		if SellFull then
			if sData.InventoryService.IsMaxInventory(sData.LocalPlayer) then
				Eastersell.AutoEasterSell()
			end
		else
			Eastersell.AutoEasterSell()
		end
		task.wait(SellWait)
	end)
end

-- =====================================================================
-- 2. ฟังก์ชัน Initialize สร้าง UI (จัดลำดับ Settings ก่อนตัวสั่งการ)
-- =====================================================================

function Eastersell.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab
	sData = reg.sData
	Utils = reg.Utils

	local EastersellSection = EventsTab:AddCollapsibleSection("Eastersell", false)

	-- [หมวด Harvest] สร้างหน้าต่างตั้งค่าก่อน
	EastersellSection:AddButton({
		Title = "Clear Selected Plants",
		Callback = function()
			Options.ddEasterHarvestPlant:SetValue({ ALL = true })
		end,
	})

	EastersellSection:AddDropdown("ddEasterHarvestPlant", {
		Title = "Easter Harvest Plant",
		Values = EasterSlot,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	-- [หมวด Harvest] สร้าง Master Toggle สั่งการ
	EastersellSection:AddToggle("tgEasterHarvestEnable", {
		Title = "Easter Harvest Enable",
		Default = false,
		Callback = function(Value)
			-- ใช้ task.defer เพื่อรอให้ UI ทุกตัวโหลดเสร็จก่อนทำงาน
			task.defer(function()
				EfTasks.ToggleTask("AutoEasterHarvest", Value, function()
					Eastersell.HarvestCrops()
					task.wait(1)
				end)
			end)
			QuickSave()
		end,
	})

	EastersellSection:AddDivider()

	-- [หมวด Sell] สร้างหน้าต่างตั้งค่าก่อน
	EastersellSection:AddToggle("tgEasterSellFull", {
		Title = "Easter Sell Full",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})

	EastersellSection:AddInput("ipEasterSellDelay", {
		Title = "Easter Sell Delay",
		Default = 600,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	-- [หมวด Sell] สร้าง Master Toggle สั่งการ
	EastersellSection:AddToggle("tgEasterSellEnable", {
		Title = "Easter Sell Enable",
		Default = false,
		Callback = function(Value)
			-- ใช้ task.defer เพื่อป้องกันบั๊กหา Options.ipEasterSellDelay ไม่เจอ
			task.defer(function()
				if Eastersell.runSell then
					Eastersell.runSell(Value)
				end
			end)

			QuickSave()

			if not Value then
				reg.IsEasterHarvesting = false
			end
		end,
	})
end

return Eastersell
