local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)
local BuyEventRemote = ReplicatedStorage.GameEvents.BuyEventShopStock
---78.08405303955078, 4.790825843811035, -14.454557418823242

local function autoBuyEasterShop(itemName)
	local data = DataService:GetData()

	-- 1. เช็คจำนวนเงิน ChocCoins (เหรียญช็อกโกแลต)
	local myChocCoins = (data.SpecialCurrency and data.SpecialCurrency.ChocCoins) or 0

	-- 2. เช็คข้อมูลร้านค้าปัจจุบัน
	local shopData = data.EventShopStock and data.EventShopStock["Easter Shop"]
	if not shopData then
		return
	end

	-- 3. ค้นหารายการของที่จะซื้อ (เช่น "Carrot")
	local itemInfo = shopData.Stocks and shopData.Stocks[itemName]

	if itemInfo and itemInfo.Stock > 0 then
		-- ดึงราคาจากฐานข้อมูลร้านค้า (ต้องดึงจาก EventShopData มาเทียบ หรือใส่ Hardcode ไว้)
		-- ในตัวอย่างนี้สมมติว่าราคา 1 คอยน์ (ตามไฟล์ eventShopData.txt)
		local itemPrice = 1

		if myChocCoins >= itemPrice then
			print("💰 ยอดเงินเพียงพอ! กำลังซื้อ: " .. itemName)
			-- ส่งสัญญาณซื้อ: BuyEventShopStock:FireServer(item_name, shop_name)
			BuyEventRemote:FireServer(itemName, "Easter Shop")
		else
			print("❌ เหรียญช็อกโกแลตไม่พอ (มี: " .. myChocCoins .. ")")
		end
	else
		print("📦 ของหมดสต็อก หรือไม่พบสินค้า")
	end
end

-- เรียกใช้: autoBuyEasterShop("Carrot")

---78.08405303955078, 4.790825843811035, -14.454557418823242
