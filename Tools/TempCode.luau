--!strict
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

-- ==========================================
-- 🎯 Hardcoded Targets (ห้ามเปลี่ยน!)
-- ==========================================
local TARGET_BENCH_INSTANCE = Workspace:WaitForChild("CraftingTables"):WaitForChild("EventCraftingWorkBench")
local TARGET_MACHINE_TYPE = "GearEventWorkbench"
local TARGET_BENCH_ID = "Workbench-1"

-- ==========================================
-- 📦 Services & Modules
-- ==========================================
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local CraftingRemote = GameEvents:WaitForChild("CraftingGlobalObjectService")

-- โหลด Module จากเกม
local DataService = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataService") :: any)
local CraftingDataPath = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CraftingData")
local RecipeRegistry = require(CraftingDataPath:WaitForChild("CraftingRecipeRegistry") :: any)

-- ==========================================
-- ⚙️ SutaHub State Registry
-- ==========================================
local Registry = {
	AutoCraft = {
		Enabled = false,
		SelectedRecipe = "Lightning Rod",
	},
}

-- รายชื่อไอเทม (สามารถเพิ่มได้ตามที่ต้องการ)
local CraftableItems = {
	"Lightning Rod",
	"Tanning Mirror",
	"Reclaimer",
	"Event Lantern",
	"Pet Pouch",
	"Small Toy",
	"Small Treat",
}

-- ==========================================
-- 🛠️ Helper Functions
-- ==========================================
local function GetRequiredItemsCount(targetItemName: string): number
	for _, recipeData in pairs(RecipeRegistry) do
		if recipeData.Outputs then
			for _, output in ipairs(recipeData.Outputs) do
				if output.ItemData and output.ItemData.ItemName == targetItemName then
					local totalRequired = 0
					if recipeData.Inputs then
						for _, inputReq in ipairs(recipeData.Inputs) do
							totalRequired += (inputReq.ItemData.Quantity or 1)
						end
					end
					return totalRequired
				end
			end
		end
	end
	return 0
end

-- ==========================================
-- 🔄 Core Auto Craft Loop
-- ==========================================
local function StartAutoCraftLoop(CraftToggle: any)
	task.spawn(function()
		while task.wait(1) do
			if not Registry.AutoCraft.Enabled then
				continue
			end

			local targetRecipe = Registry.AutoCraft.SelectedRecipe

			-- ดึงข้อมูลสดจาก DataService
			local GetData_result = DataService:GetData()
			local GlobalData = GetData_result.CraftingData.GlobalCraftingObjectData
			local benchData = GlobalData[TARGET_BENCH_ID].MachineData[TARGET_MACHINE_TYPE]

			if not benchData then
				continue
			end

			-- ====================================================
			-- 🟢 ข้อ 1: เช็คว่าโต๊ะทำงานอยู่ไหม?
			-- ====================================================
			local craftingItems = benchData.CraftingItems
			if craftingItems and craftingItems[1] then
				if craftingItems[1].IsDone == false then
					-- ยังไม่เสร็จ รอต่อไปค่ะ
					continue
				elseif craftingItems[1].IsDone == true then
					-- เสร็จแล้ว สั่ง Claim
					pcall(function()
						CraftingRemote:FireServer("Claim", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE, 1)
						print("SutaHub: คราฟต์เสร็จแล้ว Claim ของเรียบร้อยค่ะ!")
					end)
					task.wait(1.5)
					continue
				end
			end

			-- ====================================================
			-- 🟡 ข้อ 2: โต๊ะว่าง ส่ง SetRecipe และเช็คจำนวนของ
			-- ====================================================
			local requiredCount = GetRequiredItemsCount(targetRecipe)
			if requiredCount == 0 then
				print("SutaHub: หาสูตรไม่เจอใน Registry ค่ะ")
				continue
			end

			local isReadyToCraft = false

			-- ลองดันของสูงสุด 3 รอบ
			for attempt = 1, 3 do
				if not Registry.AutoCraft.Enabled then
					break
				end

				pcall(function()
					CraftingRemote:FireServer("SetRecipe", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE, targetRecipe)
				end)
				task.wait(0.5)

				-- ดึง Data ใหม่มาเช็ค InputItems
				local updatedDataResult = DataService:GetData()
				local updatedBenchData = updatedDataResult.CraftingData.GlobalCraftingObjectData[TARGET_BENCH_ID].MachineData[TARGET_MACHINE_TYPE]
				local currentInputItems = updatedBenchData.InputItems
				local inputCount = currentInputItems and #currentInputItems or 0

				if inputCount == requiredCount then
					isReadyToCraft = true
					break
				else
					print(string.format("SutaHub: ของไม่ครบ (มี %d / ต้องการ %d) ลองใหม่รอบที่ %d/3", inputCount, requiredCount, attempt))
					task.wait(1)
				end
			end

			-- ถ้า 3 รอบแล้วของไม่พอ ปิดระบบ
			if not isReadyToCraft then
				print("SutaHub: แจ้งเตือน! ของไม่พอ ปิดการทำงาน Auto Craft ค่ะ")
				Registry.AutoCraft.Enabled = false
				if CraftToggle then
					CraftToggle:SetValue(false)
				end
				continue
			end

			-- ====================================================
			-- 🔴 ข้อ 3: ของครบ สั่ง Craft
			-- ====================================================
			pcall(function()
				CraftingRemote:FireServer("Craft", TARGET_BENCH_INSTANCE, TARGET_MACHINE_TYPE)
				print("SutaHub: ของครบถ้วน สั่ง Craft -> " .. targetRecipe)
			end)

			task.wait(1.5)
		end
	end)
end

-- ==========================================
-- 🎨 Fluent Renewed UI Setup
-- ==========================================
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
	Title = "EfHub x SutaHub",
	SubTitle = "Grow a Garden",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Theme = "Darker",
})

local Tabs = {
	Crafting = Window:AddTab({ Title = "Crafting", Icon = "hammer" }),
}

local CraftDropdown = Tabs.Crafting:AddDropdown("CraftDropdown", {
	Title = "Select Recipe",
	Description = "เลือกไอเทมที่จะคราฟต์ที่ GearEventWorkbench",
	Values = CraftableItems,
	Multi = false,
	Default = 1,
	Callback = function(Value)
		Registry.AutoCraft.SelectedRecipe = Value
		print("SutaHub: ตั้งเป้าหมายคราฟต์เป็น -> " .. Value)
	end,
})

local CraftToggle = Tabs.Crafting:AddToggle("CraftToggle", {
	Title = "Enable Auto Craft",
	Description = "ทำงานอัตโนมัติตาม Logic ที่วางไว้",
	Default = false,
	Callback = function(Value)
		Registry.AutoCraft.Enabled = Value
		print("SutaHub: Auto Craft ทำงาน: " .. tostring(Value))
	end,
})

-- เรียกใช้งาน Loop พร้อมส่ง UI Toggle เข้าไปให้ควบคุมได้
StartAutoCraftLoop(CraftToggle)

Fluent:Notify({
	Title = "SutaHub Loaded",
	Content = "ระบบ Auto Craft อัปเกรดล่าสุดพร้อมใช้งานแล้วค่ะ พี่เอฟ!",
	Duration = 5,
})
