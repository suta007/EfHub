## Season Pass Level Rewards & Infinite Rewards

**โฟกัส**: สำหรับทำสคริปต์:
- Auto-claim ของรางวัลตามเลเวล (Free & Premium)
- Auto-claim Inf Rewards หลังถึง Max Level
- ทำความเข้าใจโครงสร้าง `SeasonPassData` ที่ใช้คำนวณ XP/เลเวล

---

## 1. ระบบ XP และเลเวลของ Season Pass

ไฟล์: `Modules/SeasonPass/SeasonPassUtils.lua` + `Data/SeasonPass/SeasonPassStaticData.lua`

**ค่าคงที่หลัก** (`SeasonPassStaticData.lua`)
- `XP_CONSTANT = 600`
- `MAX_LEVEL = 50`
- `INF_REWARD_XP = 10000`

**ฟังก์ชันสำคัญ (SeasonPassUtils)**

- `CalculateLevel(totalXP) -> level`  
  - \( \text{level} = \left\lfloor \sqrt{ \frac{totalXP}{XP\_CONSTANT} } \right\rfloor \)

- `CalculateXPForLevel(level) -> requiredXP`  
  - \( \text{XP}(L) = XP\_CONSTANT \times L^2 \)

- `GetXPEarnedCurrentLevel(totalXP)`  
  - คืน `XP ที่เก็บแล้วในเลเวลปัจจุบัน` = `totalXP - XP_FOR_LEVEL(currentLevel)`

- `GetTotalXPForNextLevel(totalXP)`  
  - ใช้หาจำนวน XP ที่ต้องใช้ตั้งแต่ต้นเลเวลปัจจุบันไปถึงเลเวลถัดไป

- `GetXPFractionOfCurrentLevel(totalXP)`  
  - คืนค่า 0–1 เป็นเปอร์เซ็นความคืบหน้าของเลเวลปัจจุบัน

- `CalculateInfClaimCount(totalXP, infRewardsClaimed)`  
  - ใช้กับ Inf Rewards:  
  - นับจำนวนครั้งที่ควรเคลมได้จาก XP ส่วนเกินหลัง Max Level หัก InfRewards ที่เคลมไปแล้ว

---

## 2. โครงสร้าง Data ของ Season Pass

ไฟล์หลัก:
- `Data/SeasonPass/SeasonPassData.lua`
- `Data/SeasonPass/SeasonPassData/Season1Data.lua` – Season4Data.lua (รายละเอียดของแต่ละซีซัน)

### 2.1 SeasonPassData.lua

หน้าที่:
- ใช้เวลา load เกม จะคำนวณ season ปัจจุบันจากเวลาเซิร์ฟเวอร์:
  - `CurrentSeasonNum = SeasonPassUtils.GetCurrentSeason(serverTime)`
  - `CurrentSeason = ("Season %d"):format(CurrentSeasonNum)`
- โหลด module ซีซัน:
  - `script["Season1Data"]`, `"Season2Data"` ฯลฯ แล้ว require
- เซ็ตฟิลด์:
  - `InfRewards` – ตารางรางวัล Inf  
  - `FreeRewards` – ตารางเลเวล → rewards สำหรับ track ฟรี  
  - `PremiumRewards` – ตารางเลเวล → rewards สำหรับ track พรีเมียม  
  - `IncludesItems` – รายการไฮไลต์ของสิ่งที่รวมอยู่ใน season pass  
  - `ShopItems` – ตาราง item ในร้าน Season Pass (สำหรับ `BuySeasonPassStock`)

### 2.2 SeasonXData.lua

แต่ละไฟล์ SeasonXData ลักษณะเหมือนกัน:
- `InfRewards` – `{ { DisplayName, Type, Value, Quantity }, ... }`
- `FreeRewards[levelIndex] = { reward1, reward2, ... }`
- `PremiumRewards[levelIndex] = { reward1, reward2, ... }`
- `IncludesItems = { "ชื่อไฮไลต์", ... }`
- `ShopItems` – ตารางของร้านประจำซีซัน (ใช้ใน SeasonPassShopData/SeasonPassShopController)

**โครงสร้าง reward entry**

```lua
{
  DisplayName = "Pass Points",
  Type = "Currency" | "Gear" | "Seed" | "Seed Pack" | "Crate" | "Egg" | "Pet" | "Cosmetic",
  Value = "ชื่อ item ที่ไปแมปกับ Data อื่น",
  Quantity = 50,
  Variant = "Gold" | "Silver" | nil -- บางอันเท่านั้น
}
```

---

## 3. การ map Data กับ UI (SeasonPassRewardsController)

ไฟล์: `Modules/SeasonPass/SeasonPassRewardsController.lua`

### 3.1 สร้าง Reward Frames ต่อเลเวล

- ใช้ template:
  - `SeasonPassTemplates.RewardFrameTemplate` (เลเวลทั่วไป)
  - `SeasonPassTemplates.FinalRewardFrameTemplate` (เลเวลท้ายสุด)

- สำหรับ `level = 1 .. MAX_LEVEL`:
  - Clone template → `Tier{level}RewardFrame`
  - ภายในมี frame:
    - `Free` หรือ `Free{level}`
    - `Premium` หรือ `Premium{level}`
    - `Tier{level}` – icon ที่โชว์เลขเลเวล

- ฟังก์ชัน `SetupRewardFrame(frame, currentLevel, level, trackName)`:
  - ใช้ `SeasonPassData[trackName.."Rewards"][level]` หา reward list
  - ใช้ `ImageCycle.CycleRewardImages` ใส่ icon/ชื่อให้ vector + label
  - ตั้งค่า:
    - `Checkmark.Visible` ถ้าอยู่ใน `ClaimedLevel{trackName}Rewards`
    - `Locked.Visible`:
      - สำหรับ Premium: `level > currentLevel` หรือ `not IsPremium`
      - สำหรับ Free: `level > currentLevel`
    - ปุ่ม Claim ปิดอยู่ก่อน (`ToggleButton(Claim, false)`)

### 3.2 Binding ปุ่ม Claim ต่อเลเวล

สำหรับแต่ละฝั่ง (`Free` และ `Premium`):

```lua
local connActivated = rewardFrame.Claim.Activated:Once(function()
  SeasonPassButtonEffects.Click()
  GameEvents.SeasonPass.ClaimSeasonPassReward:FireServer(level, isPremium)
  rewardFrame.Checkmark.Visible = true
  SeasonPassUtils.ToggleButton(rewardFrame.Claim, false)
  activeConnectionsCount -= 1
  notifyDot.Visible = activeConnectionsCount > 0
end)

local connHover = rewardFrame.Claim.MouseEnter:Connect(function()
  SeasonPassButtonEffects.Hover()
end)
```

- มีตารางเก็บ connection เพื่อล้างตอนรีเฟรชแทร็ก
- `activeConnectionsCount` ใช้รวมจำนวนปุ่ม Claim ที่กดได้ตอนนี้ → คุมจุดแดง Notify ที่ปุ่ม Pass HUD

---

## 4. Infinite Rewards (หลัง MAX_LEVEL)

### 4.1 Data

- `SeasonPassData.InfRewards` – ตารางของ reward ที่จะ loop ไปเรื่อย ๆ

### 4.2 UI Logic

- ใช้ frame `InfReward` ใน `SeasonPassFrame.Main.Rewards.ScrollingFrame.Rewards.InfReward`
- ใช้ `ImageCycle.CycleRewardImages` เพื่อหมุน icon/text ตาม InfRewards list
- ตั้งค่า:
  - `Image.Locked.Visible = (currentLevel < MAX_LEVEL + 1)`
  - `Image.Progress.Text = string.format("%d/%dXP", currentRemainderXP, INF_REWARD_XP)`
  - ปิดปุ่ม Claim ไว้ก่อน ด้วย `SeasonPassUtils.ToggleButton(ClaimInfReward, false)`

### 4.3 การนับจำนวนครั้งที่เคลมได้

- `totalXP` = `data.SeasonPass[CurrentSeason].TotalExperience`
- `infClaimed` = `data.SeasonPass[CurrentSeason].InfRewardsClaimed`
- ใช้:

```lua
local canClaimCount = SeasonPassUtils.CalculateInfClaimCount(totalXP, infClaimed)
```

- ถ้า `canClaimCount >= 1`:
  - แสดง badge ตัวเลขบนปุ่ม
  - เปิดปุ่ม ClaimInfReward
  - เปิด Notify HUD จุดแดง

### 4.4 ปุ่ม Claim Inf Reward

ใน `SeasonPassRewardsController.lua`:

```lua
ClaimInfRewardButton.Activated:Connect(function()
  SeasonPassButtonEffects.Click()
  GameEvents.SeasonPass.ClaimSeasonPassInfReward:FireServer(MAX_LEVEL + 1, false)
  InfRewardFrame.Image.Progress.Text = ("0/%dXP"):format(INF_REWARD_XP)
  SeasonPassUtils.ToggleButton(ClaimInfRewardButton, false)
end)
```

มี listener:
- `DataService:GetPathSignal("SeasonPass/*/InfRewardsClaimed/@")`
  - ทุกครั้งที่ server ปรับค่า InfRewardsClaimed → รีคำนวณ progress/prizes ใหม่

---

## 5. Auto-claim Logic ที่แนะนำ

### 5.1 Auto-claim Free & Premium Rewards

1. โหลด `data = DataService:GetData()`  
2. อ่าน:
   - `sp = data.SeasonPass[CurrentSeason]`
   - `totalXP = sp.TotalExperience`
   - `currentLevel = SeasonPassUtils.CalculateLevel(totalXP)`
3. สำหรับ level `1 .. currentLevel`:
   - ถ้า `not table.find(sp.ClaimedLevelFreeRewards, level)`  
     → `ClaimSeasonPassReward:FireServer(level, false)`
   - ถ้า `sp.IsPremium` และ `not table.find(sp.ClaimedLevelPremiumRewards, level)`  
     → `ClaimSeasonPassReward:FireServer(level, true)`

> แนะนำให้หน่วงเวลาเล็กน้อยระหว่างการยิงแต่ละ Remote เพื่อลดความเสี่ยงโดนตรวจจับ spam

### 5.2 Auto-claim Infinite Rewards

1. อ่าน:
   - `totalXP = sp.TotalExperience`
   - `infClaimed = sp.InfRewardsClaimed`
2. คำนวณ:

```lua
local canClaim = SeasonPassUtils.CalculateInfClaimCount(totalXP, infClaimed)
```

3. ถ้า `canClaim > 0`:

```lua
for i = 1, canClaim do
  GameEvents.SeasonPass.ClaimSeasonPassInfReward:FireServer(MAX_LEVEL + 1, false)
  task.wait(0.2) -- ปรับตามความเสี่ยงที่ยอมรับ
end
```

---

## 6. Hook / Data ที่ควรฟังเพื่อตอบสนองอัตโนมัติ

- `GameEvents.SeasonPass.ProgressSeasonPassBar.OnClientEvent(oldXP, newXP)`
  - ใช้ trigger ให้รัน logic auto-claim หลังจาก XP เปลี่ยน

- `DataService:GetPathSignal(("SeasonPass/*/IsPremium/@"):format(CurrentSeason))`
  - เมื่อผู้เล่นซื้อ Premium Pass → อัปเดต free/premium rewards ที่สามารถ claim ได้

- `DataService:GetPathSignal(("SeasonPass/*/InfRewardsClaimed/@"):format(CurrentSeason))`
  - หลังเคลม Inf Reward → ปรับ state ให้ตรง

---

## 7. สรุปสำหรับสคริปต์ช่วยเล่น

**Remotes ที่ใช้โดยตรง**
- `GameEvents.SeasonPass.ClaimSeasonPassReward:FireServer(level, isPremiumBool)`
- `GameEvents.SeasonPass.ClaimSeasonPassInfReward:FireServer(MAX_LEVEL + 1, false)`

**Data สำหรับตัดสินใจ**
- `DataService:GetData().SeasonPass[CurrentSeason]`:
  - `TotalExperience`
  - `IsPremium`
  - `ClaimedLevelFreeRewards`
  - `ClaimedLevelPremiumRewards`
  - `InfRewardsClaimed`

โดยรวมแล้ว สคริปต์ auto-claim ของคุณควรถาม DataService ก่อนทุกครั้งเพื่อ:
- ไม่ยิง Remote เกินจำเป็น
- สอดคล้องกับสถานะในเซิร์ฟเวอร์  
แล้วใช้ remote และโครงสร้างที่สรุปในไฟล์นี้เป็นหลักในการเรียก.

