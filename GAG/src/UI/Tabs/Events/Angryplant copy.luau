local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)
local ProgressionTable = require(ReplicatedStorage.Data.EASTER_SeedGiverQuestProgression)
local SeedEvent = ReplicatedStorage.GameEvents.SeedPackGiverEvent

local Angryplant = {}
local reg
local EfTasks
local QuickSave
local EventsTab
--[[

📋 Script initialized successfully.
[Progression] : 3
[ProgressionSeedPacks] : 0
[HasBeenFed] : true
[HasSeenPopup] : true
[GoldenEgg] : (Table)
  [BuyAmount] : 0
  [LastBuyTime] : 1775356196.09477
[TotalEasterPlaytime] : 5680
[HasSoldEasterPlant] : true
[HasEnabledEasterGarden] : true
[RequiredPlantInfo] : (Table)
  [RequiredPlantSize] : 1.4
  [RequiredPlant] : Easter Gumball
[SeedPackGiverDiscovered] : true
[TotalTrackedPlaytime] : 22474
[HasPurchasedEasterPlant] : true
[HasBeenGivenStarterPack] : true

]]
function Angryplant.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab

	local AngryplantSection = EventsTab:AddCollapsibleSection("Angryplant", false)
	AngryplantSection:AddToggle("tgAngryplantEnable", {
		Title = "Angryplant Enable",
		Default = false,
		Callback = function(Value)
			reg.Log("Angryplant Toggle")
			EfTasks.ToggleTask("AutoAngryplant", Value, function()
				--Angryplant.autoAngryplant()
				task.wait(60)
			end)
			QuickSave()
		end,
	end)
end

return Angryplant
-- ฟังก์ชันดึงและแสดงข้อมูลด่านปัจจุบัน (แสดงครบ 4 เงื่อนไข)
local function getQuestInfo()
	local data = DataService:GetData().EasterEventData
	local currentIdx = data.Progression or 1
	local isCompleted = currentIdx > #ProgressionTable

	if not isCompleted then
		local current = ProgressionTable[currentIdx]

		-- ดึงข้อมูลพร้อม Check Nil และเตรียมค่าสำรอง (Fallback)
		local name = current.PLANT_NAME or "ไม่ทราบชื่อพืช"
		local weight = current.WEIGHT or 0
		local mutation = current.MUTATION or "None (ไม่มี)"
		local variant = current.VARIANT or "None (ไม่มี)"

		print("--- 🌵 Jim's Current Request (Step: " .. currentIdx .. ") ---")
		print(string.format("🟢 พืชที่ต้องใช้: %s", name))
		print(string.format("⚖️ น้ำหนักขั้นต่ำ: %.2f kg", weight))
		print(string.format("🧬 การกลายพันธุ์ (Mutation): %s", mutation))
		print(string.format("🌈 รูปแบบพิเศษ (Variant): %s", variant))

		-- 2. แสดงรายการรายการต่อไปล่วงหน้า (เผื่อไว้เตรียมตัวปลูก)
		if currentIdx < #ProgressionTable then
			local nextQ = ProgressionTable[currentIdx + 1]
			print(string.format("--- ⏩ Next Task: %s (Weight: %.2f kg) ---", nextQ.PLANT_NAME or "??", nextQ.WEIGHT or 0))
		end
	else
		print("🎉 ภารกิจทั้งหมดเสร็จสิ้นแล้ว! (Completed 304/304)")
	end

	return currentIdx, isCompleted
end

-- 3. Code ส่ง Quest และตรวจสอบการเปลี่ยนด่านอัตโนมัติ
local function submitQuest()
	-- ตรวจสอบคัมภีร์ก่อนหน้า
	local oldIdx = DataService:GetData().EasterEventData.Progression or 1
	print("🚀 กำลังส่งพืชในมือให้ Jim...")

	-- ส่งสัญญาณเซิร์ฟเวอร์
	SeedEvent:FireServer("SubmitHeldPlant")

	-- รอเซิร์ฟเวอร์อัปเดตและแจ้งผล
	task.delay(1, function()
		local newIdx = DataService:GetData().EasterEventData.Progression or 1
		if newIdx > oldIdx then
			print("✨ สำเร็จ! Jim กินเรียบร้อย ปรับเป้าหมายเป็นเควสที่: " .. newIdx)
			getQuestInfo() -- แสดงข้อมูลเควสใหม่ทันที
		else
			print("⚠️ ส่งไม่สำเร็จ: ตรวจสอบว่าพืชในมือตรงตามที่ Jim ต้องการ 4 อย่างหรือไม่")
		end
	end)
end

-- 4. Code เช็คว่าเควสครบหรือยัง
local function checkIsAllDone()
	local currentIdx = DataService:GetData().EasterEventData.Progression or 1
	return currentIdx > #ProgressionTable
end

-- 5. Code เช็คว่ารอบวันใหม่มาหรือยัง
local function checkNewRound()
	local data = DataService:GetData().EasterEventData
	-- ใช้สถานะการค้นพบจุดรับพืชเป็นตัวตัดสินรอบการรีเซ็ต
	if data and data.SeedPackGiverDiscovered == false then
		print("🆕 วันใหม่เปิดขึ้นแล้ว! คุณสามารถเริ่มคุยกับ Jim ใหม่ได้")
		return true
	end
	return false
end

-- รันเพื่อแสดงผล
getQuestInfo()
