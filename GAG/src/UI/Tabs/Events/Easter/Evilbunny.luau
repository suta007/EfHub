local Evilbunny = {}
local reg
local EfTasks
local QuickSave
local EventsTab
local sData
local Utils

local evilFolder: Folder?

local SHOVEL_NAME = "Shovel [Destroy Plants]"

local function getShovelTool()
	local bp = sData.Backpack
	local shovel = Utils.FindToolByName(bp, SHOVEL_NAME)
	if shovel then
		return shovel
	end
	local char = sData.Character
	if char then
		return char:FindFirstChild(SHOVEL_NAME)
	end
	return nil
end

local function ensureEvilFolder(): Folder?
	if evilFolder and evilFolder.Parent then
		return evilFolder
	end
	local ge = sData.GameEvents:FindFirstChild("EvilBunny") or sData.GameEvents:WaitForChild("EvilBunny", 15)
	if not ge then
		return nil
	end
	evilFolder = ge :: Folder
	return evilFolder
end

local function findTargetPlants(targetName: string)
	local plantsPhysical = Utils.GetPlantsFolder()
	if not plantsPhysical then
		return {}
	end
	local list = {}
	for _, plant in ipairs(plantsPhysical:GetChildren()) do
		if plant:IsA("Model") and plant.Name == targetName and plant:GetAttribute("Favorited") ~= true then
			table.insert(list, plant)
		end
	end
	return list
end

local function shovelPlant(plant: Model): boolean
	local shovel = getShovelTool()
	if not shovel then
		reg.Log("Evil Bunny: ไม่พบพลั่ว (Shovel)", "WARN")
		return false
	end
	Utils.UnequipTool()
	task.wait(0.05)
	Utils.EquipTool(shovel)
	sData.RemoveItemEvent:FireServer(plant)
	task.wait(0.12)
	Utils.UnequipTool()
	return true
end

local function findSeedToolForPlant(seedName: string): Tool?
	for _, item in ipairs(sData.Backpack:GetChildren()) do
		if item:IsA("Tool") and item:GetAttribute("Seed") == seedName then
			return item
		end
	end
	local char = sData.Character
	if char then
		for _, item in ipairs(char:GetChildren()) do
			if item:IsA("Tool") and item:GetAttribute("Seed") == seedName then
				return item
			end
		end
	end
	return nil
end

---หลังขุดแล้ว: ถ้ามีเมล็ดชนิดเดียวกับต้นที่ถูกเควส ให้ปลูกทับตำแหน่งเดิม
local function tryReplantAtOriginalSpot(seedName: string, worldPos: Vector3)
	if not seedName or seedName == "" then
		return
	end
	local seedTool = findSeedToolForPlant(seedName)
	if not seedTool then
		reg.Log("Evil Bunny: ไม่มีเมล็ด '" .. seedName .. "' ในถุง — ข้ามปลูกทดแทน")
		return
	end
	local plantRE = sData.GameEvents:FindFirstChild("Plant_RE") or sData.GameEvents:WaitForChild("Plant_RE", 8)
	if not plantRE then
		reg.Log("Evil Bunny: ไม่พบ Plant_RE — ปลูกทดแทนไม่ได้", "WARN")
		return
	end
	Utils.UnequipTool()
	task.wait(0.06)
	Utils.EquipTool(seedTool)
	task.wait(0.1)
	local okFire, errFire = pcall(function()
		plantRE:FireServer(vector.create(worldPos.X, worldPos.Y, worldPos.Z), seedName)
	end)
	task.wait(0.12)
	Utils.UnequipTool()
	if okFire then
		reg.Log("Evil Bunny: ปลูกทดแทนตำแหน่งเดิม — " .. seedName)
	else
		reg.Log("Evil Bunny: ปลูกทดแทนล้มเหลว — " .. tostring(errFire), "WARN")
	end
end

---คืน success, ชื่อเมล็ด/ต้น (ใช้หาเมล็ด), ตำแหน่งก่อนขุด
local function destroyQuestPlant(targetName: string): (boolean, string?, Vector3?)
	if not targetName or targetName == "" or targetName == "???" then
		reg.Log("Evil Bunny: ไม่ได้รับชื่อต้นเป้าหมายจากเซิร์ฟเวอร์", "WARN")
		return false, nil, nil
	end
	local candidates = findTargetPlants(targetName)
	if #candidates == 0 then
		reg.Log("Evil Bunny: ไม่พบต้น '" .. targetName .. "' ในสวน (หรือถูก Favorite)", "WARN")
		return false, nil, nil
	end
	if #candidates > 1 then
		reg.Log("Evil Bunny: พบหลายต้นชื่อ '" .. targetName .. "' — จะทำลายต้นแรกที่ไม่ Favorite", "WARN")
	end
	local plant = candidates[1]
	local beforePos = plant:GetPivot().Position
	if not shovelPlant(plant) then
		return false, nil, nil
	end
	task.wait(0.2)
	return true, targetName, beforePos
end

local function pollUntilComplete(interact, claim, timeoutSec: number): boolean
	local deadline = os.clock() + timeoutSec
	while os.clock() < deadline do
		task.wait(0.35)
		local ok, snap = pcall(function()
			return interact:InvokeServer()
		end)
		if ok and type(snap) == "table" then
			if snap.QuestState == "Complete" then
				local okClaim, reward = pcall(function()
					return claim:InvokeServer()
				end)
				if okClaim and reward then
					reg.Log("Evil Bunny: รับรางวัล — " .. tostring(reward))
				elseif okClaim then
					reg.Log("Evil Bunny: รับรางวัลไม่สำเร็จ (เซิร์ฟเวอร์ปฏิเสธ)", "WARN")
				end
				return true
			end
		end
	end
	reg.Log("Evil Bunny: หมดเวลารอเควสเสร็จ — ลองใหม่รอบถัดไป", "WARN")
	return false
end

function Evilbunny.autoEvilbunny()
	local Options = reg.Options
	if not Options.tgEvilbunnyEnable.Value or reg.IsEvilbunny or reg.IsHuntEgg then
		return
	end

	local folder = ensureEvilFolder()
	if not folder then
		reg.Log("Evil Bunny: ไม่พบ GameEvents.EvilBunny (อีเวนต์อาจยังไม่เปิด)", "WARN")
		task.wait(20)
		return
	end

	local interact = folder:FindFirstChild("EvilBunnyInteract") :: RemoteFunction?
	local giveQuest = folder:FindFirstChild("EvilBunnyGiveQuest") :: RemoteFunction?
	local claim = folder:FindFirstChild("EvilBunnyClaim") :: RemoteFunction?
	if not (interact and giveQuest and claim) then
		reg.Log("Evil Bunny: Remote ไม่ครบในโฟลเดอร์ EvilBunny", "WARN")
		reg.IsEasterHarvesting = false
		reg.IsEvilbunny = false
		task.wait(15)
		return
	end
	reg.IsEasterHarvesting = true
	task.wait(0.5)
	reg.IsEvilbunny = true

	local okRun, errRun = pcall(function()
		local okSnap, snap = pcall(function()
			return interact:InvokeServer()
		end)
		if not okSnap or type(snap) ~= "table" then
			reg.Log("Evil Bunny: EvilBunnyInteract ล้มเหลว — " .. tostring(snap), "WARN")
			return
		end

		local state = snap.QuestState

		if state == "Cooldown" then
			local left = tonumber(snap.CooldownRemaining) or 60
			reg.Log("Evil Bunny: คูลดาวน์ ~" .. tostring(math.ceil(left)) .. " วินาที")
			reg.IsEasterHarvesting = false
			reg.IsEvilbunny = false
			task.wait(math.clamp(left, 2, 3660))
			return
		end

		if state == "Complete" then
			local okClaim, reward = pcall(function()
				return claim:InvokeServer()
			end)
			if okClaim and reward then
				reg.Log("Evil Bunny: รับรางวัล — " .. tostring(reward))
			elseif okClaim then
				reg.Log("Evil Bunny: ยังรับรางวัลไม่ได้", "WARN")
			else
				reg.Log("Evil Bunny: EvilBunnyClaim error — " .. tostring(reward), "WARN")
			end
			reg.IsEasterHarvesting = false
			reg.IsEvilbunny = false
			task.wait(1)
			return
		end

		if state == "Active" then
			local targetName = snap.TargetPlantName
			if not targetName then
				local okT, tSnap = pcall(function()
					return interact:InvokeServer()
				end)
				targetName = (okT and type(tSnap) == "table" and tSnap.TargetPlantName) or nil
			end
			local dug, replantSeed, replantPos = destroyQuestPlant(tostring(targetName or ""))
			if not dug or not replantSeed or not replantPos then
				reg.IsEasterHarvesting = false
				reg.IsEvilbunny = false
				task.wait(3)
				return
			end
			tryReplantAtOriginalSpot(replantSeed, replantPos)
			pollUntilComplete(interact, claim, 45)
			return
		end

		-- Idle / รับเควสใหม่ (สอดคล้องกับสาขา else ใน EvilBunnyClient)
		local okG, granted = pcall(function()
			return giveQuest:InvokeServer()
		end)
		if not okG then
			reg.Log("Evil Bunny: EvilBunnyGiveQuest error — " .. tostring(granted), "WARN")
			return
		end
		if not granted then
			reg.Log("Evil Bunny: ไม่มีต้นที่ใช้เควสได้ — ปลูกต้นอื่นก่อน", "WARN")
			reg.IsEasterHarvesting = false
			reg.IsEvilbunny = false
			task.wait(12)
			return
		end

		local plantName = type(granted) == "string" and granted or tostring(granted)
		reg.Log("Evil Bunny: รับเควส — ทำลาย: " .. plantName)
		task.wait(0.25)
		local dug2, replantSeed2, replantPos2 = destroyQuestPlant(plantName)
		if not dug2 or not replantSeed2 or not replantPos2 then
			reg.IsEasterHarvesting = false
			reg.IsEvilbunny = false
			task.wait(3)
			return
		end
		tryReplantAtOriginalSpot(replantSeed2, replantPos2)
		pollUntilComplete(interact, claim, 45)
	end)

	reg.IsEasterHarvesting = false
	reg.IsEvilbunny = false

	if not okRun then
		reg.Log("Evil Bunny: " .. tostring(errRun), "ERROR")
	end
end

function Evilbunny.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab
	sData = reg.sData
	Utils = reg.Utils

	local EvilbunnySection = EventsTab:AddCollapsibleSection("Evilbunny", false)
	EvilbunnySection:AddToggle("tgEvilbunnyEnable", {
		Title = "Evilbunny Enable",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoEvilbunny", Value, function()
				Evilbunny.autoEvilbunny()
				task.wait(4)
			end)
			if not Value then
				reg.IsEvilbunny = false
				reg.IsEasterHarvesting = false
			end
			QuickSave()
		end,
	})
end

return Evilbunny
