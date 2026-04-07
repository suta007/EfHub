## Season Pass Shop & PassPoints

**โฟกัส**: สำหรับทำสคริปต์:
- Auto-buy item ด้วยสกุลเงิน `PassPoints`
- เข้าใจโครงสร้างตารางร้าน `ShopItems` และระบบสต๊อก

---

## 1. สกุลเงินที่ใช้ในร้าน Season Pass

- สกุลเงิน: **`PassPoints`**
  - เก็บใน `DataService:GetData().SpecialCurrency.PassPoints`
  - UI แสดงที่: `SeasonPassFrame.Main.Store.Currency.TextLabel`
  - มี listener:

```lua
local signal = DataService:GetPathSignal("SpecialCurrency/PassPoints/@")
if signal then
  signal:Connect(function()
    local data = DataService:GetData()
    if data then
      Store.Currency.TextLabel.Text = tostring(data.SpecialCurrency.PassPoints)
    end
  end)
end
```

สคริปต์ช่วยเล่นควรอ่านค่าจาก `DataService` เช่นเดียวกันแทนการอ่านจาก Text ใน UI

---

## 2. ข้อมูลร้าน: SeasonPassShopData & SeasonPassData

ไฟล์:
- `Data/SeasonPass/SeasonPassShopData.lua`
  - ระบุ:
    - `RefreshTime = 300` (หน่วยวินาที) – ค่า default สำหรับรอบ restock หากไม่ได้ force จาก server
    - `ShopItems = require(SeasonPassData).ShopItems`

- `Data/SeasonPass/SeasonPassData.lua` + `SeasonXData.lua`
  - ในแต่ละ `SeasonXData.lua` มี `ShopItems` ของตัวเอง
  - ตัวอย่างโครงสร้าง item หนึ่ง:

```lua
ShopItems["Prime Crate"] = {
  DisplayName  = "Prime Crate",
  Rarity       = "Common",
  Type         = "Crate",           -- ปรับดีไซน์ UI / Odds Button
  ImageId      = ...,
  Desc         = ...,               -- บางอันเท่านั้น
  StockChance  = 1,                 -- ใช้ฝั่ง server คำนวนสต๊อก
  StockAmount  = {1, 2},            -- ช่วงจำนวนที่สุ่มเวลาสต๊อก
  Price        = 100,               -- จำนวน PassPoints ต่อชิ้น
  PurchaseID   = <DevProductId>,    -- ใช้ซื้อด้วย Robux
  GiftPurchaseID = <DevProductId>,  -- ใช้ Gift ด้วย Robux (ถ้ามี)
  LayoutOrder  = 1,                 -- ใช้จัดเรียงใน UI
  FallbackPrice = 179,              -- ใช้โชว์ราคา Robux ถ้าไม่มี dynamic pricing
  RobuxOnly    = true|false (บางอันเท่านั้น)
}
```

**หมายเหตุ**: บางซีซันมี ShopItems ต่างกัน (ดูได้ใน `Season1Data.lua` – `Season4Data.lua`)

---

## 3. ข้อมูลสต๊อกฝั่งผู้เล่น

ใน `SeasonPassShopController.lua`:

- ใช้ Data จาก:

```lua
local data = DataService:GetData()
local stocks = data.SeasonPass[CurrentSeason].Stocks
local stockForItem = stocks[itemKey] -- ตาราง
local stockValue = stockForItem and stockForItem.Stock or 0
```

- ข้อมูลนี้ใช้ทั้ง:
  - แสดง `X{stock} Stock`
  - เปิด/ปิดปุ่ม Points_Buy
  - เปลี่ยน text สี และราคา

**สรุปสาขาที่ใช้ใน Shop**

- `data.SeasonPass[CurrentSeason].Stocks[itemKey].Stock` – จำนวนสต๊อกสำหรับไอเท็มนั้น ๆ
- ถ้า `RobuxOnly == true`:
  - ไม่ใช้ `Stocks` (แสดง `???` แทนราคา, ใช้ DevProduct ซื้อ)

---

## 4. Timer Restock

ฟังก์ชันใน `SeasonPassShopController.lua`:

```lua
local function getTimeUntilNextItem()
  local now = workspace:GetServerTimeNow()
  local data = DataService:GetData()
  if data.SeasonPass[CurrentSeason] then
    local forcedEnd = data.SeasonPass[CurrentSeason].ForcedItemEndTimestamp
    if forcedEnd and forcedEnd - now >= 0 then
      return forcedEnd - now
    else
      return SeasonPassShopData.RefreshTime - now % SeasonPassShopData.RefreshTime
    end
  else
    return -1
  end
end
```

ตัวแปรบน UI:

```lua
while true do
  local t = getTimeUntilNextItem()
  TimerLabel.Text = (t <= 0) and "Restocking"
                   or ("New item in " .. NumberUtil.compactFormat(t))
  task.wait(1)
end
```

สคริปต์ช่วยเล่นอาจใช้ข้อมูลนี้เพื่อ:
- ตัดสินใจรอ restock ก่อนจะ auto-buy รอบต่อไป

---

## 5. ปุ่มซื้อและ Remotes ที่เกี่ยวข้อง

ไฟล์: `SeasonPassShopController.lua`

### 5.1 ปุ่มซื้อด้วย PassPoints (Points_Buy)

- ปุ่มหลัก: `ItemFrame.Frame.Points_Buy`
- Logic การซื้อ:

```lua
local BuySeasonPassStock = GameEvents.SeasonPass.BuySeasonPassStock

local function singleBuy()
  BuySeasonPassStock:FireServer(itemKey)
end

Points_Buy.Activated:Connect(singleBuy)
```

- ปุ่มรองสำหรับกดค้าง (`WatchButtonHold`):

```lua
WatchButtonHold(Points_Buy, function(delta, released)
  if released then
    -- reset state + tween สีปุ่มกลับ
  else
    -- คำนวณจำนวนรอบที่จะยิง FireServer ตาม delta/time
    for i = 1, computedCount do
      BuySeasonPassStock:FireServer(itemKey)
    end
  end
end, {
  minimumHoldTime = 1,
  interval = 0.125
})
```

### 5.2 ปุ่มซื้อด้วย Robux (Robux_Buy)

```lua
Robux_Buy.Activated:Connect(function()
  MarketController:PromptPurchase(itemConfig.PurchaseID, Enum.InfoType.Product)
end)
```

### 5.3 การอัปเดตราคาและสต๊อกบน UI

ใน `updateStockAndPrice()`:

```lua
local data = DataService:GetData()
local stockEntry = data.SeasonPass[CurrentSeason].Stocks[itemKey]
local stock = stockEntry and stockEntry.Stock or 0

-- ถ้า RobuxOnly
Cost_Text.Text = "???"
MarketController:SetPriceLabel(Cost_Text, item.PurchaseID, ":robux::value:")

-- ถ้าใช้ PassPoints:
Cost_Text.Text = (stock <= 0) and "NO STOCK" or Comma(item.Price)
Cost_Text.TextColor3 = (stock <= 0) and Color3.fromRGB(255, 0, 0)
                                           or Color3.fromRGB(0, 255, 0)

Points_Buy.In_Stock.Visible = stock > 0
Points_Buy.No_Stock.Visible = stock <= 0
Points_Buy.HoverImage = stock > 0 and "..." or "..."
Points_Buy.Image = stock > 0 and "..." or "..."
Points_Buy.Visible = not item.RobuxOnly
```

สคริปต์ช่วยเล่นไม่จำเป็นต้องสนใจ UI เหล่านี้ แต่ควรรู้ logic ฝั่ง Data:
- ถ้า `stock <= 0` → FireServer ไปก็มักจะไม่ควรส่ง (server อาจ reject)

---

## 6. Listener Data สำหรับสต๊อกและสกุลเงิน

- สต๊อก:

```lua
local signal = DataService:GetPathSignal(("SeasonPass/*/@"):format(CurrentSeason))
if signal then
  signal:Connect(updateStockAndPrice)
end
```

- PassPoints:

```lua
local signal = DataService:GetPathSignal("SpecialCurrency/PassPoints/@")
if signal then
  signal:Connect(updateCurrencyText)
end
```

สคริปต์ช่วยเล่นสามารถใช้พวกนี้เป็น trigger เพื่อ:
- เมื่อ PassPoints เปลี่ยน → รัน logic auto-buy ใหม่  
- เมื่อ SeasonPass data เปลี่ยน (รวมสต๊อก) → ตรวจสอบว่ามีไอเท็มที่เราต้องการซื้อโผล่มาหรือยัง

---

## 7. แนวทาง Auto-Buy โดยใช้ PassPoints

### 7.1 ข้อมูลที่ต้องอ่าน

1. `local data = DataService:GetData()`  
2. `local sp = data.SeasonPass[CurrentSeason]`  
3. `local points = data.SpecialCurrency.PassPoints`  
4. `local shopItems = require(ReplicatedStorage.Data.SeasonPass.SeasonPassData).ShopItems`  
5. `local stocks = sp.Stocks`  

### 7.2 เงื่อนไขตัวอย่างสำหรับซื้ออัตโนมัติ

- Item ต้องเป็นประเภทที่เราสนใจ (whitelist):
  - เช่น `Type == "Seed Pack"` หรือ `Type == "Crate"` หรือ `Value == "Grow All"` ฯลฯ
- ไม่ใช่ Robux only:
  - `not item.RobuxOnly`
- มีสต๊อก:
  - `stocks[itemKey]` มีอยู่ และ `stocks[itemKey].Stock > 0`
- มี PassPoints พอ:
  - `points >= item.Price`

### 7.3 ตัวอย่าง pseudo-code auto-buy

```lua
local RS = game:GetService("ReplicatedStorage")
local GameEvents = RS.GameEvents
local spEvents = GameEvents.SeasonPass

local SeasonPassData = require(RS.Data.SeasonPass.SeasonPassData)
local DataService = require(RS.Modules.DataService)

local WHITELIST = {
  ["Prime Seed Pack"] = true,
  ["Zenith Seed Pack"] = true,
  ["Grow All"] = true,
}

local function autoBuyOnce()
  local data = DataService:GetData()
  if not data then return end

  local sp = data.SeasonPass[SeasonPassData.CurrentSeason]
  if not sp then return end

  local points = data.SpecialCurrency.PassPoints
  local stocks = sp.Stocks
  local shopItems = SeasonPassData.ShopItems

  for itemKey, cfg in pairs(shopItems) do
    if WHITELIST[itemKey]
      and not cfg.RobuxOnly
      and stocks[itemKey]
      and stocks[itemKey].Stock > 0
      and points >= cfg.Price
    then
      spEvents.BuySeasonPassStock:FireServer(itemKey)
      -- อาจลด points ในตัวแปร local แล้วคำนวณต่อ
      points -= cfg.Price
    end
  end
end
```

### 7.4 Trigger ที่ดีสำหรับ auto-buy

- ฟัง `SpecialCurrency/PassPoints/@`:
  - เมื่อ PassPoints เพิ่มขึ้น (เช่น จากการเล่น/เคลมรางวัล) → ลองเรียก `autoBuyOnce()`

- ฟัง `SeasonPass/*/@`:
  - เมื่อสต๊อกหรือ shop rotation เปลี่ยน → เรียก `autoBuyOnce()` อีกครั้ง

---

## 8. สรุป Remotes & Data ที่เกี่ยวข้องกับ Shop

**Remotes**
- `GameEvents.SeasonPass.BuySeasonPassStock:FireServer(itemKey)` – ใช้ PassPoints ซื้อ  
- `GameEvents.ShecklesClient.OnClientEvent(soundName)` – เล่นเสียงเท่านั้น  
- `MarketController:PromptPurchase(PurchaseID, Enum.InfoType.Product)` – ซื้อด้วย Robux  

**Data**
- `DataService:GetData().SpecialCurrency.PassPoints` – จำนวน PassPoints ปัจจุบัน  
- `DataService:GetData().SeasonPass[CurrentSeason].Stocks[itemKey].Stock` – สต๊อก  
- `SeasonPassData.ShopItems[itemKey]` – รายละเอียด item (Price, Type, RobuxOnly ฯลฯ)  

สคริปต์ช่วยเล่นควรควบคุม list ของ item ที่จะซื้อ และเคารพระยะเวลา/จำนวนครั้งที่ยิง Remote เพื่อหลีกเลี่ยงการ spam มากเกินไป.

