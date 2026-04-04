local PlantTraitsData = require(game:GetService("ReplicatedStorage").Modules.PlantTraitsData)
local isEasterPlant = PlantTraitsData.HasTrait(plantName, "EasterSlot")

local PlantTraitsData = require(game:GetService("ReplicatedStorage").Modules.PlantTraitsData)

-- 1. ฟังก์ชันดึงกลุ่ม Easter (รายชื่อพืช/ไอเทมทั้งหมดในเทศกาล)
local function getEasterGroup()
	return PlantTraitsData.Traits["Easter"] or {}
end

-- 2. ฟังก์ชันดึงกลุ่ม EasterSlot (รายชื่อพืชที่ใช้ปลูก/ส่งเควสหลัก)
local function getEasterSlotGroup()
	return PlantTraitsData.Traits["EasterSlot"] or {}
end

-- ตัวอย่างการแสดงผล --
print("🥚 รายการพืชกลุ่ม EasterSlot:", table.concat(getEasterSlotGroup(), ", "))

local PlantTraitsData = require(game:GetService("ReplicatedStorage").Modules.PlantTraitsData)

--[[
    @function HasTrait
    @parameter plantName: string (ชื่อพืชที่ต้องการตรวจสอบ)
    @parameter traitName: string (ชื่อคุณลักษณะที่ต้องการเช็ค เช่น "EasterSlot", "Fruit", "Root")
    @return boolean (true หากพืชนั้นมีคุณสมบัติตรงตามที่ระบุ, false หากไม่มีหรือข้อมูลไม่ถูกต้อง)
    @description ใช้สำหรับตรวจสอบความถูกต้องของพืชแบบเฉพาะเจาะจง (เช่น เช็คว่าเป็นพืชกิจกรรม Easter หรือไม่)
    @usage local isEaster = PlantTraitsData.HasTrait("Easter Candy Carrot", "EasterSlot")
]]

--[[
    @function GetTraits
    @parameter plantName: string (ชื่อพืชที่ต้องการดึงข้อมูล)
    @return table (ตารางรายการชื่อ Trait ทั้งหมดที่พืชชนิดนั้นมี)
    @description ใช้สำหรับดึงรายการคุณลักษณะทั้งหมดของพืชหนึ่งชนิด เพื่อนำไปวิเคราะห์หรือจัดหมวดหมู่ต่อ
    @usage local traitsList = PlantTraitsData.GetTraits("Apple") -- return {"Fruit", "Leafy", "Woody"}
]]

--[[
    @function GetTraitsAsString
    @parameter plantName: string (ชื่อพืชที่ต้องการดึงข้อมูล)
    @return string (ข้อความชื่อ Trait ทั้งหมดคั่นด้วยเครื่องหมายจุลภาคพร้อมโค้ดสี HTML)
    @description ใช้สำหรับแสดงผลคุณลักษณะของพืชบนหน้าจอ UI โดยจะให้ข้อความที่มีสีสันตามหมวดหมู่โดยอัตโนมัติ
    @usage label.Text = PlantTraitsData.GetTraitsAsString("Golden Eggfruit")
]]
