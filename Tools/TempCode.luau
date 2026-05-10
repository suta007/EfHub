local LocalPlayer = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
<<<<<<< HEAD
local GiftData = require(ReplicatedStorage.Data.GiftData)
local MarketplaceService = game:GetService("MarketplaceService")
local infoType = Enum.InfoType.Product
for k, v in pairs(GiftData) do
	--print(k, v.Display, v.NormalId)
	local success, productInfo = pcall(function()
		return MarketplaceService:GetProductInfo(v.NormalId, infoType)
	end)
	if success and productInfo then
		print(productInfo.DisplayName, "---", productInfo.ProductId, "---", productInfo.PriceInRobux, "---", productInfo.IsForSale)
	end
end

-- ระบุ ID ของสินค้าที่ต้องการดึงข้อมูล
local productId = 3444449485

-- ระบุประเภทของสินค้า
-- (ใช้ Enum.InfoType.Product สำหรับ Developer Product, หรือ Enum.InfoType.GamePass สำหรับ Gamepass)

-- ใช้ pcall เพื่อป้องกันสคริปต์พัง (Error) ในกรณีที่ใส่ ID ผิด หรือเซิร์ฟเวอร์ Roblox ไม่ตอบสนอง
local success, productInfo = pcall(function()
	return MarketplaceService:GetProductInfo(productId, infoType)
end)

-- ตรวจสอบว่าดึงข้อมูลสำเร็จหรือไม่
if success and productInfo then
	print("=== ข้อมูลสินค้า ===")
	print("ชื่อสินค้า: " .. (productInfo.Name or "ไม่ระบุ"))
	print("รายละเอียด: " .. (productInfo.Description or "ไม่มีรายละเอียด"))

	-- ตรวจสอบราคา (บางสินค้าอาจแจกฟรี หรือไม่พบข้อมูลราคา)
	if productInfo.PriceInRobux then
		print("ราคา: " .. tostring(productInfo.PriceInRobux) .. " Robux")
	else
		print("ราคา: ฟรี (หรือไม่ได้เปิดขาย)")
	end
	print("===================")
else
	warn("เกิดข้อผิดพลาด: ไม่สามารถดึงข้อมูลของสินค้า ID " .. tostring(productId) .. " ได้")
end
=======
local PetUtils = require(ReplicatedStorage.Modules.PetServices.PetUtilities)

local equipPets = PetUtils:GetPetsSortedByAge(LocalPlayer, 0, true, true)

for i, pet in ipairs(equipPets) do
	print(i, pet.UUID)
end

local Backpack = LocalPlayer.Backpack
for _i, obj in pairs(Backpack:GetChildren()) do
	if obj:HasTag("PetBoost") then
	end
end
>>>>>>> 6d6457fbc58cf9595ba23bc3e4ce37a6b399aac8
