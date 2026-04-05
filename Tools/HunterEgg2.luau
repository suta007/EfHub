local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local EasterEvents = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Easter2026")

local function AutoFarmEggs()
	-- 1. เช็คคูลดาวน์ก่อนเริ่ม (ระบบเกมเก็บค่าคูลดาวน์ไว้ที่ Attribute ของ LocalPlayer) [cite: 2, 3, 6, 7]
	local cooldown = LocalPlayer:GetAttribute("EasterEggHuntCooldownRemaining")
	if cooldown and cooldown > 0 then
		print("⏳ กิจกรรมติดคูลดาวน์ รออีก: ", math.floor(cooldown), " วินาที")
		return
	end

	print("🚀 กำลังส่งคำสั่งเริ่ม Egg Hunt ไปที่เซิร์ฟเวอร์...")

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
				task.wait(0.2)
			end

			-- 4. ส่งคำสั่งเก็บไข่ด้วย ID กลับไปที่ Server ทันที
			local success = EasterEvents.CollectEasterEgg:InvokeServer(eggId)

			if success then
				count += 1
				print("✨ เก็บไข่ใบที่ " .. count .. " สำเร็จ! (ID: " .. tostring(eggId) .. ")")
			end

			-- หน่วงเวลาเล็กน้อยป้องกันเซิร์ฟเวอร์เตะฐานยิง Remote รัวเกินไป
			task.wait(0.1)
		end
		print("🎉 ฟาร์มไข่เสร็จสิ้นทั้งหมด " .. count .. " ฟอง!")
	else
		print("❌ เริ่มเกมไม่ได้ หรือหาข้อมูลไข่ไม่พบ สถานะ: ", tostring(message))
	end
end

-- สั่งรันฟังก์ชัน
AutoFarmEggs()
