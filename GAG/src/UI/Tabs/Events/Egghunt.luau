local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Egghunt = {}
local reg
local EfTasks
local QuickSave
local EventsTab

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local EasterEvents = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Easter2026")

function Egghunt.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab

	local EgghuntSection = EventsTab:AddCollapsibleSection("Egghunt", false)
	EgghuntSection:AddToggle("tgEgghuntEnable", {
		Title = "Egghunt Event Enable",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoEggHunt", Value, function()
				Egghunt.autoEggHunt()
				task.wait(60)
			end)
			QuickSave()
			if not Value then
				reg.IsEasterHarvesting = false
			end
		end,
	})
end

function Egghunt.autoEggHunt()
	local Options = reg.Options
	if not Options.tgEgghuntEnable.Value or reg.IsHuntEgg then
		return
	end

	local cooldown = LocalPlayer:GetAttribute("EasterEggHuntCooldownRemaining")
	if cooldown and cooldown > 0 then
		reg.Log("⏳ กิจกรรมติดคูลดาวน์ รออีก: " .. math.floor(cooldown) .. " วินาที")
		return
	end
	reg.IsHuntEgg = true
	reg.IsEasterHarvesting = true
	reg.Log("🚀 กำลังส่งคำสั่งเริ่ม Egg Hunt ไปที่เซิร์ฟเวอร์...")
	task.wait(1)
	-- 2. ข้าม UI ไปยิง Remote เริ่มกิจกรรมตรงๆ
	local message, eggData = EasterEvents.EasterEventStartEggHunt:InvokeServer()

	-- เช็คว่า Server ยอมให้เริ่ม และส่งข้อมูลตารางไข่กลับมาไหม
	if eggData and type(eggData) == "table" then
		local count = 0

		-- 3. วนลูปดึง ID (eggId) และ ตำแหน่ง (position) จากที่ Server ส่งมา
		for eggId, position in pairs(eggData) do
			-- วาร์ปไปที่ตำแหน่งไข่ (เผื่อสคริปต์ฝั่ง Server มีระบบตรวจจับระยะทางของคนเก็บ)
			if Character:FindFirstChild("HumanoidRootPart") then
				Character:PivotTo(CFrame.new(position))
				-- หน่วงเวลาให้ Server อัปเดตพิกัดตัวละครเราก่อนสั่งเก็บ
				task.wait(0.5)
			end

			-- 4. ส่งคำสั่งเก็บไข่ด้วย ID กลับไปที่ Server ทันที
			local success = EasterEvents.CollectEasterEgg:InvokeServer(eggId)

			if success then
				count += 1
				reg.Log("✨ เก็บไข่ใบที่ " .. count .. " สำเร็จ! (ID: " .. tostring(eggId) .. ")")
			else
				task.wait(1)
				EasterEvents.CollectEasterEgg:InvokeServer(eggId)
			end

			-- หน่วงเวลาเล็กน้อยป้องกันเซิร์ฟเวอร์เตะฐานยิง Remote รัวเกินไป
			task.wait(1)
		end
		reg.Log("🎉 ฟาร์มไข่เสร็จสิ้นทั้งหมด " .. count .. " ฟอง!")
		reg.Utils.ClickButton(reg.Utils.GardenButton)
		task.wait(1)
	else
		reg.Log("❌ เริ่มเกมไม่ได้ หรือหาข้อมูลไข่ไม่พบ สถานะ: " .. tostring(message))
	end
	reg.IsHuntEgg = false
	reg.IsEasterHarvesting = false
end

return Egghunt
