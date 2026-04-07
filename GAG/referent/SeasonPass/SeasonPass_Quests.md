## Season Pass Quests Data & Flow

**โฟกัส**: ใช้สำหรับทำสคริปต์:
- เช็ก Daily quests ที่เกี่ยวข้องกับ Season Pass
- Auto-claim XP Season Pass จากแต่ละเควส
- Auto-roll แพ็ก `"Season Pass Quests"` เมื่อเคลมครบ

---

## 1. แหล่งข้อมูลหลักที่ใช้กับ Quests

- **Player data (ผ่าน DataService)**  
  - `local data = DataService:GetData()`  
  - ใช้ใน `SeasonPassQuestsController.lua`

- **Daily quests container**  
  - `data.DailyQuests.ContainerId` → ใช้กับ `QuestsController:GetContainerFromId(containerId)`  
  - จากนั้นจะได้:
    - `container.Quests` → อาร์เรย์ของ quest entries  

- **Season Pass quest flags (ต่อซีซัน)**  
  - `data.SeasonPass[CurrentSeason].QuestsCompleted` – list ของ `questId` ที่เคยถูกทำสำเร็จแล้ว  
  - `data.SeasonPass[CurrentSeason].QuestsClaimed` – list ของ `questId` ที่ถูกเคลมไปเป็น XP season pass แล้ว  
  - `data.SeasonPass[CurrentSeason].QuestRewardClaimed` – boolean ว่าได้เคลม reward รวม (RollRewards) หรือยัง

- **ค่าคงที่ XP ต่อเควส**  
  - อยู่ใน `SeasonPassStaticData.lua`:
    - `DAILY_QUEST_XP = 400`
  - ใน UI จะโชว์ `x400` XP ในแต่ละ quest

---

## 2. โครงสร้างเควส (ที่ QuestsController ส่งมา)

> โครงสร้างประมาณนี้ (จากการใช้ในโค้ด)

- สำหรับแต่ละ entry ใน `container.Quests`:
  - `quest.Id` – ไอดีของเควส (ใช้กับ `ClaimSeasonPassQuest:FireServer(quest.Id)`)
  - `quest.Type` – ชนิดเควส (ไป map ข้อมูลแสดงผลจาก `QuestData.Types`)
  - `quest.Progress` – ความคืบหน้าปัจจุบัน
  - `quest.Target` – จำนวนเป้าหมายที่ต้องถึง
  - `quest.Arguments` – พารามิเตอร์พิเศษของเควสแต่ละประเภท
  - `quest.Completed` – boolean ว่าเควสนี้ทำครบแล้วหรือยัง

- `QuestsController:GetQuest(quest.Type)`  
  - คืน object ที่มีเมธอด `Display(progress, target, args)`  
  - `Display` คืนตาราง:
    - `Title` – ข้อความชื่อเควส  
    - `Description` – คำอธิบาย  
    - `Bar` – string แสดงผล progress bar เช่น `"5 / 10"`  

ใน `SeasonPassQuestsController.lua`:
- นำค่าพวกนี้ไปใส่ใน GUI:
  - `QuestFrame.Title.Text = v.Title`
  - `QuestFrame.Desc.Text = v.Description`
  - `QuestFrame.Progress.Fill.Size = UDim2.fromScale(clamp(progress/target, 0, 1), 1)`
  - `QuestFrame.Progress.Amount.Text = quest.Completed ? "Completed!" : v.Bar`
  - `QuestFrame.Vector.Image = icon (fix value)`
  - `QuestFrame.Amount.Text = "xDAILY_QUEST_XP"`

---

## 3. ฟังก์ชันสำคัญใน SeasonPassQuestsController

ไฟล์: `Modules/SeasonPass/SeasonPassQuestsController.lua`

### 3.1 ฟังก์ชันตรวจว่า Daily quests ครบหรือยัง

```lua
local function AreAllDailiesComplete(): boolean
  local data = DataService:GetData()
  -- ถ้าไม่มีข้อมูล หรือไม่มี container / เควส → ถือว่าครบ (ใช้เป็น guard)
  -- ถ้ายังมีเควสใด Completed == false → false
end
```

ใช้เพื่อ:
- ซ่อน/โชว์ปุ่ม Skip Daily Quests  
- ตัดสินใจว่ากด Roll Reward ได้หรือยัง

### 3.2 ปุ่ม SkipQuests (ใช้ Robux)

```lua
SkipQuestsButton.Activated:Connect(function()
  GGButtonEffects.Click()
  if not AreAllDailiesComplete() then
    MarketController:PromptPurchase(DevProductIds.SkipDailyQuest.PurchaseID, Enum.InfoType.Product)
  end
end)
```

### 3.3 ปุ่ม Roll Rewards (รับแพ็ก Season Pass Quests)

```lua
RollRewardsButton.Activated:Connect(function()
  if AreAllDailiesComplete() then
    GameEvents.SeedPack.Open:FireServer("Season Pass Quests")
    task.wait(2)
    RefreshQuestUI()
  end
end)
```

> ตรงนี้คือ **เป้าหมายข้อ (1)** ของคุณ: รับรางวัลจาก Quest  
> – ใช้ Remote `SeedPack.Open` กับชื่อแพ็ก `"Season Pass Quests"`

### 3.4 ปุ่ม Claim ของแต่ละ Quest

```lua
QuestFrame.Progress.Claim.Activated:Once(function()
  SeasonPassButtonEffects.Click()
  GameEvents.SeasonPass.ClaimSeasonPassQuest:FireServer(quest.Id)
  QuestFrame.Progress.Claim.Visible = false
end)
```

เงื่อนไขเปิดปุ่ม Claim:
- `quest.Progress >= quest.Target`
- `quest.Id` อยู่ใน `SeasonPass[CurrentSeason].QuestsCompleted`
- แต่ยังไม่อยู่ใน `SeasonPass[CurrentSeason].QuestsClaimed`

---

## 4. แนวทางทำสคริปต์ Auto Quest

### 4.1 Auto-claim XP แต่ละเควส

ตรรกะ (ฝั่ง Client):
1. ดึง `data = DataService:GetData()`  
2. อ่าน `container = QuestsController:GetContainerFromId(data.DailyQuests.ContainerId)`  
3. สำหรับ `quest in container.Quests`:
   - ถ้า `quest.Progress >= quest.Target`  
   - และ `quest.Id` อยู่ใน `QuestsCompleted` แต่ไม่อยู่ใน `QuestsClaimed`  
   - ให้เรียก:

```lua
GameEvents.SeasonPass.ClaimSeasonPassQuest:FireServer(quest.Id)
```

4. ทำซ้ำทุก ๆ X วินาที หรือผูกกับ event ของ `DataService:GetPathSignal("DailyQuests/@")`

### 4.2 Auto-roll "Season Pass Quests" Pack

ตรรกะ:
1. ใช้ฟังก์ชันเดียวกับ `AreAllDailiesComplete()`:
   - ถ้า DailyQuests ว่าง / ทุกเควส Completed == true → ถือว่าพร้อม  
2. เช็ก flag `SeasonPass[CurrentSeason].QuestRewardClaimed`:
   - ถ้า `false` → ยังไม่เคลม reward รวม  
3. เรียก:

```lua
GameEvents.SeedPack.Open:FireServer("Season Pass Quests")
```

4. รอเล็กน้อย แล้วอัปเดต UI / flags จาก DataService

---

## 5. ไฟล์ SeasonPass Data ที่เกี่ยวข้องกับ Quest

- `SeasonPassStaticData.lua`
  - `DAILY_QUEST_XP = 400`

- `SeasonPassData.lua` + `SeasonXData.lua`  
  - ไม่ได้เก็บเควสโดยตรง แต่ผลของเควสจะเพิ่ม `TotalExperience` และทำให้ปลดล็อก rewards ใน `FreeRewards` / `PremiumRewards`  
  - InfRewards ใช้ตอน XP เกิน MAX_LEVEL

---

## 6. สรุปจุด Hook สำหรับสคริปต์

สำหรับสคริปต์ช่วยเล่น คุณสามารถ hook ได้ที่:

- **RemoteEvent**:
  - `GameEvents.SeasonPass.ClaimSeasonPassQuest`
  - `GameEvents.SeedPack.Open` กับ argument `"Season Pass Quests"`

- **Data**:
  - `DataService:GetData().DailyQuests` + `QuestsController`
  - `DataService:GetData().SeasonPass[CurrentSeason].{QuestsCompleted, QuestsClaimed, QuestRewardClaimed}`

หากต้องการทำให้ fully-automatic:
- ทำ watcher:
  - `DataService:GetPathSignal("DailyQuests/@")`
  - `DataService:GetPathSignal("QuestContainers/@")`
  - ทุกครั้งที่ data เปลี่ยน → เรียกฟังก์ชัน auto-claim + auto-roll ตามตรรกะด้านบน.

