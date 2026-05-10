local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local petsFolder = workspace:WaitForChild("PetsPhysical")

-- 1. กำหนดพิกัดเป้าหมาย (เปลี่ยนตัวเลขได้เลยค่ะ)
local targetPosition = CFrame.new(-16.037, 5, -94.759)

-- สร้างตัวแปร Global ไว้เผื่อพี่เอฟต้องการกดรันสคริปต์ซ้ำเพื่อปิดการทำงาน (Toggle)
if getgenv().PetLockConnection then
	getgenv().PetLockConnection:Disconnect()
	getgenv().PetLockConnection = nil
	print("⏹️ ปิดระบบล็อกตำแหน่งสัตว์เลี้ยงแล้วค่ะพี่เอฟ!")
	return
end

print("▶️ เริ่มระบบล็อกตำแหน่งและตะโกนบอกสคริปต์อื่น (รัวๆ) แล้วค่ะ!")

-- 2. ผูกฟังก์ชันเข้ากับ Heartbeat (ทำงานทุกๆ เฟรมภาพ)
getgenv().PetLockConnection = RunService.Heartbeat:Connect(function()
	local partsToMove = {}
	local newCFrames = {}

	-- วนลูปหาสัตว์เลี้ยงของเราทุกรอบที่เรนเดอร์ภาพ
	for _, obj in pairs(petsFolder:GetChildren()) do
		if obj:IsA("BasePart") and obj:GetAttribute("OWNER") == tostring(LocalPlayer.Name) then
			-- ถ้าสัตว์เลี้ยงยังไม่ได้อยู่ตรงจุดหมายเป๊ะๆ ค่อยสั่งย้าย
			if obj.CFrame ~= targetPosition then
				table.insert(partsToMove, obj)
				table.insert(newCFrames, targetPosition)
			end
		end
	end

	-- 3. ถ้ามีสัตว์เลี้ยงหลุดออกจากจุดที่ล็อกไว้ ให้จับย้ายพร้อมกัน
	if #partsToMove > 0 then
		-- ย้ายและตะโกน FireCFrameChanged สู้กับสคริปต์หลักของเกม
		workspace:BulkMoveTo(partsToMove, newCFrames, Enum.BulkMoveMode.FireCFrameChanged)
	end
end)
