## Season Pass Remotes Overview

**จุดประสงค์**: ไว้ใช้เป็นคู่มือเวลาเขียนสคริปต์ช่วยเล่น (LocalScript / exploit) เพื่อ:
- รับรางวัลจากเควส Season Pass
- รับรางวัลจากเลเวล Season Pass (รวม Inf Rewards)
- ใช้เหรียญ `PassPoints` ซื้อของใน Season Pass shop

---

## 1. รายการ Remote หลักของ Season Pass

**Namespace หลัก**: `ReplicatedStorage.GameEvents.SeasonPass`

- **UpdateSeasonPass**  
  - ประเภท: `RemoteEvent` (ฝั่ง Client ใช้ `OnClientEvent`)  
  - ใช้ใน: `SeasonPassUIController.lua`  
  - การใช้งาน:  
    - `GameEvents.SeasonPass.UpdateSeasonPass:FireAllClients(newSeasonNumber)` (ฝั่งเซิร์ฟเวอร์ – เดา)  
    - Client ฟังด้วย:
      - เปลี่ยนซีซันปัจจุบัน
      - อัปเดตแทร็กของรางวัลและร้านค้า
      - แสดง Notification "New Season Pass Available"  

- **ClaimSeasonPassReward**  
  - ประเภท: `RemoteEvent`  
  - ใช้ใน: `SeasonPassRewardsController.lua`  
  - การเรียกจาก Client:
    - `ClaimSeasonPassReward:FireServer(levelNumber, isPremiumBool)`
      - `levelNumber`: หมายเลขเลเวลที่ต้องการเคลม
      - `isPremiumBool`:  
        - `false` = เคลมรางวัลฝั่งฟรี  
        - `true` = เคลมรางวัลฝั่งพรีเมียม  
  - ใช้ตอนกดปุ่ม `Claim` ในกรอบรางวัลแต่ละเลเวล

- **ProgressSeasonPassBar**  
  - ประเภท: `RemoteEvent` (`OnClientEvent`)  
  - ใช้ใน: `SeasonPassRewardsController.lua`  
  - Server น่าจะเรียกเป็น: `:FireClient(player, oldXP, newXP)`  
  - Client ใช้ค่า:
    - `oldXP` = XP ก่อนหน้า  
    - `newXP` = XP หลังได้รับเพิ่ม  
  - ใช้เพื่อเล่นแอนิเมชันแถบ XP, อัปเดตเลเวล และเปิดการเคลมรางวัลที่ปลดล็อกใหม่

- **ClaimSeasonPassInfReward**  
  - ประเภท: `RemoteEvent`  
  - ใช้ใน: `SeasonPassRewardsController.lua`  
  - การเรียกจาก Client:
    - `ClaimSeasonPassInfReward:FireServer(infTierIndex, false)`
      - `infTierIndex`: index ของ Inf reward (โค้ดใช้ `MAX_LEVEL + 1`)  
      - พารามิเตอร์ที่สองเป็น `false` เสมอในโค้ดปัจจุบัน  
  - ใช้เมื่อกดปุ่ม `ClaimInfReward` หลังถึง Max Level แล้วมี XP เกิน

- **ClaimSeasonPassQuest**  
  - ประเภท: `RemoteEvent`  
  - ใช้ใน: `SeasonPassQuestsController.lua`  
  - การเรียกจาก Client:
    - `ClaimSeasonPassQuest:FireServer(questId)`
      - `questId`: ไอดีเควสใน DailyQuests container  
  - ใช้เมื่อ:
    - เควสรายวันสำเร็จแล้ว
    - ยังไม่ได้ถูกเคลมเป็น XP Season Pass

- **SeedPack.Open** (เกี่ยวกับ Quest Reward)  
  - Namespace: `GameEvents.SeedPack.Open`  
  - ใช้ใน: `SeasonPassQuestsController.lua`  
  - การเรียกจาก Client:
    - `GameEvents.SeedPack.Open:FireServer("Season Pass Quests")`  
  - ใช้เพื่อเปิดแพ็ก `"Season Pass Quests"` หลังจากกดปุ่ม Roll Rewards (รับของจากเควสรวม)

- **BuySeasonPassStock**  
  - Namespace: `GameEvents.SeasonPass.BuySeasonPassStock`  
  - ใช้ใน: `SeasonPassShopController.lua`  
  - การเรียกจาก Client:
    - `BuySeasonPassStock:FireServer(itemKey)`
      - `itemKey`: ชื่อ item key ใน `SeasonPassData.ShopItems` เช่น `"Prime Crate"`, `"Grow All"` ฯลฯ  
    - โค้ดในปุ่มกด:
      - คลิกครั้งเดียว: `BuySeasonPassStock:FireServer(itemKey)`  
      - กดค้าง: ส่ง `FireServer` ซ้ำหลายครั้งตามสปีดที่คำนวณ  
  - ใช้จ่ายสกุลเงิน `PassPoints` เพื่อซื้อของในร้าน Season Pass

- **ShecklesClient**  
  - Namespace: `GameEvents.ShecklesClient`  
  - ใช้ใน: `SeasonPassShopController.lua`  
  - ประเภท: `RemoteEvent` ขาเข้า Client, payload เป็น string ชื่อ Sound  
  - ใช้เพื่อเล่นเสียง effect เวลาเกิด event บางอย่างในร้าน (ไม่ได้ใช้งานด้าน logic ซื้อของโดยตรง)

นอกจากนี้ยังมี DevProduct (Robux) ที่ใช้ผ่าน `MarketController` เช่น:
- `DevProductIds.BuySeasonPassPremium.PurchaseID` – ซื้อ Premium Pass  
- `DevProductIds.GiftSeasonPass.PurchaseID` – Gift Premium Pass ให้คนอื่น  
- `DevProductIds.SeasonPassShopRestock.PurchaseID` – รีเฟรชร้าน Season Pass  
- `SkipTierData.GetSkipTierId`, `SkipTierData.GetSkipAllId(level)` – DevProduct สำหรับข้ามเลเวล

---

## 2. เป้าหมายการใช้ Remotes สำหรับสคริปต์ช่วยเล่น

### 2.1 รับรางวัลจาก Quest (Daily Season Pass Quests)

**ขั้นตอนในเกมปกติ**
- ระบบอ่านข้อมูลเควสจาก `DataService:GetData().DailyQuests.ContainerId` ผ่าน `QuestsController`
- เมื่อเควสสำเร็จ:
  - ปุ่ม `Claim` ของเควสจะเรียก:
    - `GameEvents.SeasonPass.ClaimSeasonPassQuest:FireServer(questId)`
  - ระบบจะเพิ่ม XP Season Pass ให้ และใส่ questId ลงใน `SeasonPass[CurrentSeason].QuestsClaimed`

**Auto-script แนวทาง (ฝั่ง Client)**
- วนเช็ก DailyQuests -> หาเควสที่:
  - `Completed == true`
  - ยังไม่อยู่ใน `SeasonPass[CurrentSeason].QuestsClaimed`
- แล้วเรียก:

```lua
local GameEvents = game:GetService("ReplicatedStorage").GameEvents
local spEvents = GameEvents.SeasonPass

-- สำหรับแต่ละ questId ที่ยังไม่เคลม
spEvents.ClaimSeasonPassQuest:FireServer(questId)
```

### 2.2 รับรางวัลจาก Level (Tier Rewards + Inf Rewards)

**Tier Rewards ปกติ**
- ปุ่ม Claim ใน UI เรียก:

```lua
-- Free reward
ClaimSeasonPassReward:FireServer(levelNumber, false)

-- Premium reward
ClaimSeasonPassReward:FireServer(levelNumber, true)
```

- เงื่อนไข (ฝั่ง Client ก่อนเปิดปุ่ม):
  - Player level (`TotalExperience` → `SeasonPassUtils.CalculateLevel`) >= `levelNumber`
  - ยังไม่อยู่ใน list:
    - `ClaimedLevelFreeRewards` หรือ `ClaimedLevelPremiumRewards`
  - กรณี Premium ต้องมี `IsPremium == true`

**Inf Rewards (หลัง MAX_LEVEL)**  
- โค้ดคิด index: `MAX_LEVEL + 1`  
- ปุ่ม Claim เรียก:

```lua
ClaimSeasonPassInfReward:FireServer(MAX_LEVEL + 1, false)
```

- เงื่อนไข:  
  - XP ส่วนเกินหลัง `CalculateXPForLevel(MAX_LEVEL)` ต้อง >= `INF_REWARD_XP` ต่อ 1 ครั้ง  
  - ใช้ `SeasonPassUtils.CalculateInfClaimCount(totalXP, InfRewardsClaimed)` เพื่อนับได้ว่าควรเคลมได้กี่ครั้ง

**Auto-script แนวทาง**
- อ่าน DataService:GetData().SeasonPass[CurrentSeason]:
  - `TotalExperience`
  - `ClaimedLevelFreeRewards`, `ClaimedLevelPremiumRewards`
  - `IsPremium`
- คำนวณ `currentLevel = SeasonPassUtils.CalculateLevel(TotalExperience)`
- สำหรับทุกเลเวล `1..currentLevel`:
  - ถ้ายังไม่เคลมฟรี: `ClaimSeasonPassReward:FireServer(level, false)`
  - ถ้ามีพรีเมียม + ยังไม่เคลม: `ClaimSeasonPassReward:FireServer(level, true)`
- ถ้า `currentLevel >= MAX_LEVEL`:
  - คำนวณจำนวน Inf claims ที่ควรได้
  - ลูปเรียก `ClaimSeasonPassInfReward:FireServer(MAX_LEVEL + 1, false)` ตามจำนวน

### 2.3 ใช้เหรียญ `PassPoints` ซื้อของใน Shop

**ข้อมูลหลัก**
- สกุลเงิน:  
  - `DataService:GetData().SpecialCurrency.PassPoints`
- ข้อมูลร้าน:  
  - `Data.SeasonPass.SeasonPassData.ShopItems`  
  - แต่ละ item มี:
    - `Price` (จำนวน PassPoints)
    - `RobuxOnly` (ถ้ามี = ซื้อได้เฉพาะ Robux DevProduct)
    - `StockChance` / `StockAmount` / `FallbackPrice` / `PurchaseID` ฯลฯ  
- สต๊อกของผู้เล่น:
  - `DataService:GetData().SeasonPass[CurrentSeason].Stocks[itemKey].Stock`

**ปุ่มซื้อใน UI**
- Points buy:

```lua
GameEvents.SeasonPass.BuySeasonPassStock:FireServer(itemKey)
```

- Robux buy:
  - `MarketController:PromptPurchase(PurchaseID, Enum.InfoType.Product)`

**Auto-script แนวทาง**
- อ่านค่า:
  - `currentPoints = Data.SpecialCurrency.PassPoints`
  - ตาราง `SeasonPassData.ShopItems` เพื่อตรวจ `Price`, `RobuxOnly`
  - ตาราง stock `SeasonPass[CurrentSeason].Stocks[itemKey].Stock`
- เงื่อนไขซื้ออัตโนมัติ:
  - ไม่ใช่ `RobuxOnly`
  - `Stock > 0`
  - `currentPoints >= Price`
  - และผ่าน policy ส่วนตัว เช่น white-list รายชื่อไอเท็มที่ยอมซื้อ  
- เรียก:

```lua
local spEvents = game:GetService("ReplicatedStorage").GameEvents.SeasonPass

spEvents.BuySeasonPassStock:FireServer(itemKey)
```

หากต้องการ auto-spam แบบใน UI:
- ใช้ลูปส่ง `FireServer` ซ้ำพร้อมหน่วงเวลาเล็กน้อย (ระวังโดนตรวจจับ spam)

---

## 3. ไฟล์ที่เกี่ยวข้องกับ Remotes เหล่านี้

- **Season Pass UI / Logic**
  - `Modules/SeasonPass/SeasonPassUIController.lua`  
  - `Modules/SeasonPass/SeasonPassRewardsController.lua`  
  - `Modules/SeasonPass/SeasonPassQuestsController.lua`  
  - `Modules/SeasonPass/SeasonPassShopController.lua`  
  - `Modules/SeasonPass/SeasonPassUtils.lua`  
  - `Modules/SeasonPass/SPQuestsRewardOddsController.lua`

- **Data / Config**
  - `Data/SeasonPass/SeasonPassStaticData.lua`  
  - `Data/SeasonPass/SeasonPassData.lua` + `Season1Data.lua`–`Season4Data.lua`  
  - `Data/SeasonPass/SeasonPassShopData.lua` (อ้างไป `SeasonPassData.ShopItems`)  
  - `Data/SeasonPass/SkipTierData.lua`

- **ระบบอื่นที่อิงร่วม**
  - `Modules/DataService` – ดึง player data  
  - `Modules/QuestsController` – ดึงข้อมูล DailyQuests  
  - `Modules/MarketController` – DevProduct / Gift  
  - `Data/DevProductIds` – รหัสสินค้ารูบั๊กที่เกี่ยวข้อง

สคริปต์ช่วยเล่นของคุณควรอิงชื่อ Remote และ signature ตามที่สรุปในไฟล์นี้ เพื่อให้ `auto-claim quests`, `auto-claim level rewards` และ `auto-buy shop` ทำงานได้ตรงกับโค้ดเกมปัจจุบัน.

