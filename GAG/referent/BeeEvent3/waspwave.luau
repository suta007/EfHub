-- ตัวอย่างสคริปต์ช่วยเข้า/ออก และจุดชนวน Wasp Dungeon อัตโนมัติ (Client Script)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- โหลด Remotes ของระบบ Wasp Wave Survival
local WaspSurvivalFolder = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("WaspWaveSurvival")
local RequestStart = WaspSurvivalFolder:WaitForChild("RequestStart") -- RemoteFunction
local RequestExit = WaspSurvivalFolder:WaitForChild("RequestExit") -- RemoteEvent
local RequestClaim = WaspSurvivalFolder:WaitForChild("RequestClaim") -- RemoteEvent
local GetState = WaspSurvivalFolder:WaitForChild("GetState") -- RemoteFunction

local WaspAutomation = {}

-- ===================================================
-- ฟังก์ชันช่วยตรวจสอบสุขภาพของผึ้งทั้งหมด (AllBeesDead)
-- ===================================================
local function AllBeesDead()
	local success, BeeColonyStateController = pcall(function()
		return require(ReplicatedStorage.Modules.BeeEventV2Controllers.BeeColonyStateController)
	end)
	if not success or not BeeColonyStateController then
		return false
	end
	
	local playerKey = ("Player_%*"):format(LocalPlayer.UserId)
	local beeStates = BeeColonyStateController.State and BeeColonyStateController.State.BeeStates
	local playerBees = beeStates and beeStates[playerKey]
	if not playerBees then
		return false
	end
	
	local hasBees = false
	for _, bee in playerBees do
		hasBees = true
		local serverData = bee and bee.Server
		if serverData and serverData.Health and serverData.Health > 0 and serverData.WaspWaveSurvivalDead ~= true then
			return false -- ยังมีผึ้งที่มีชีวิตอยู่
		end
	end
	return hasBees -- คืนค่า true หากผึ้งทุกตัวตายหมดแล้ว
end

-- ===================================================
-- ฟังก์ชันช่วยตรวจสอบสถานะหน้าจอเคลมรางวัล (UI Claim Panel Check)
-- ===================================================
local function IsClaimUiVisible()
	local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	local survivalUI = playerGui and playerGui:FindFirstChild("WaspWaveSurvivalUI")
	if survivalUI then
		local victory = survivalUI:FindFirstChild("Victory")
		local conclusion = survivalUI:FindFirstChild("WaspWaveConclusionPanel")
		if (victory and victory.Visible == true) or (conclusion and conclusion.Visible == true) then
			return true
		end
	end
	return false
end

-- ===================================================
-- 1. ฟังก์ชันดึงสถานะปัจจุบันจากเซิร์ฟเวอร์ (Get State Helper)
-- ===================================================
function WaspAutomation.GetCurrentState()
	local success, state = pcall(function()
		return GetState:InvokeServer()
	end)
	if success and typeof(state) == "table" then
		return state
	end
	return nil
end

-- ===================================================
-- 2. ฟังก์ชันสั่ง IGNITION (จุดชนวนพอร์ทัล) อัตโนมัติ
-- ===================================================
function WaspAutomation.IgnitePortal()
	local state = WaspAutomation.GetCurrentState()
	if not state then
		warn("[WaspAutomation] ไม่สามารถดึงสถานะจากเซิร์ฟเวอร์ได้")
		return false
	end

	-- ตรวจสอบเงื่อนไขว่า พอร์ทัลพร้อมจุดชนวนหรือไม่
	local isIgnited = state.PortalIgnited == true
	local isReady = state.PortalReady == true
	local igniteCooldown = tonumber(state.PortalIgniteCooldownRemaining) or 0
	local canIgnite = state.PortalCanIgnite == true

	if isIgnited or isReady then
		print("[WaspAutomation] พอร์ทัลถูกจุดชนวนไปก่อนหน้านี้แล้ว")
		return true
	elseif igniteCooldown > 0 then
		warn(("[WaspAutomation] พอร์ทัลติดคูลดาวน์สะกดเวลา! กรุณารออีก %d วินาที"):format(igniteCooldown))
		return false
	end

	-- เรียกคำสั่งเริ่มจุดชนวนพอร์ทัล
	print("[WaspAutomation] กำลังส่งคำสั่ง Ignite Portal...")
	local success, result = pcall(function()
		return RequestStart:InvokeServer()
	end)

	if success and result and result.Success then
		print("[WaspAutomation] จุดชนวนพอร์ทัลสำเร็จแล้ว! รอช่วงอุ่นเครื่อง (Warmup)...")
		return true
	else
		warn("[WaspAutomation] การจุดชนวนล้มเหลว:", result and result.Code or "ไม่ทราบสาเหตุ")
		return false
	end
end

-- ===================================================
-- 3. ฟังก์ชันสั่ง ENTER DUNGEON (เข้าดันเจี้ยน) อัตโนมัติ
-- ===================================================
function WaspAutomation.EnterDungeon()
	-- ตรวจสอบว่าผู้เล่นอยู่ในดันเจี้ยนอยู่แล้วหรือไม่
	if LocalPlayer:GetAttribute("InWaspWaveSurvival") == true then
		print("[WaspAutomation] คุณอยู่ในดันเจี้ยนเรียบร้อยแล้ว")
		return true
	end

	local state = WaspAutomation.GetCurrentState()
	if not state then
		return false
	end

	-- ตรวจสอบคูลดาวน์พ่ายแพ้ (Defeat Lockout)
	local defeatLockout = tonumber(state.DefeatLockoutRemaining) or 0
	if defeatLockout > 0 then
		warn(("[WaspAutomation] ยังไม่สามารถเข้าได้เนื่องจากติดคูลดาวน์พ่ายแพ้ %d วินาที"):format(defeatLockout))
		return false
	end

	-- เช็คว่าพอร์ทัลอุ่นเครื่องเสร็จและพร้อมเข้า (PortalReady) หรือไม่
	if not state.PortalReady then
		local warmup = tonumber(state.PortalWarmupRemaining) or 0
		warn(("[WaspAutomation] พอร์ทัลยังไม่พร้อม! ยังอยู่ในช่วงอุ่นเครื่องอีก %d วินาที"):format(warmup))
		return false
	end

	-- สั่งส่งคำสั่งเข้าดันเจี้ยน (ใช้ Remote เดียวกันกับการจุดชนวน)
	print("[WaspAutomation] กำลังเข้าดันเจี้ยน...")
	local success, result = pcall(function()
		return RequestStart:InvokeServer()
	end)

	if success and result and result.Success then
		print("[WaspAutomation] เข้าสู่รังท้าทายเวฟแตนเรียบร้อยแล้ว!")
		return true
	else
		warn("[WaspAutomation] ไม่สามารถเข้าดันเจี้ยนได้:", result and result.Code or "ไม่ทราบสาเหตุ")
		return false
	end
end

-- ===================================================
-- 4. ฟังก์ชันสั่ง EXIT & CLAIM (เคลมรางวัลและออกจากดันเจี้ยน) อัตโนมัติ
-- ===================================================
function WaspAutomation.ExitAndClaimDungeon()
	print("[WaspAutomation] กำลังทำเคลมของรางวัล (Claim)...")
	-- ส่งสัญญาณเพื่อทำการรับของรางวัลที่ตกอยู่ทั้งหมด
	RequestClaim:FireServer()

	task.wait(0.5) -- รอสัญญาณดีเลย์เซฟฝั่งเซิร์ฟเวอร์เล็กน้อย

	print("[WaspAutomation] กำลังวาร์ปออกจากดันเจี้ยน (Exit)...")
	-- ส่งสัญญาณเพื่อขอออกจากดันเจี้ยนและกลับไปที่จุดเซฟสวนผึ้งปกติ
	RequestExit:FireServer()

	print("[WaspAutomation] ทำการออกจากดันเจี้ยนสำเร็จ")
	return true
end

-- ===================================================
-- 5. ระบบตรวจสอบและสั่งการอัตโนมัติ (Automation Main Check)
-- ===================================================
function WaspAutomation.CheckAndAction()
	local inDungeon = LocalPlayer:GetAttribute("InWaspWaveSurvival") == true

	if inDungeon then
		-- A. ถ้าอยู่ในดันเจี้ยน: ตรวจสอบว่า "พร้อมเคลมรางวัล" หรือไม่
		local readyToClaim = IsClaimUiVisible() or AllBeesDead()
		if readyToClaim then
			print("[WaspAutomation] ตรวจพบสถานะพร้อมเคลมรางวัล! เริ่มการเคลมและออกจากดันเจี้ยนอัตโนมัติ...")
			WaspAutomation.ExitAndClaimDungeon()
		end
	else
		-- B. ถ้านอกดันเจี้ยน: ตรวจสอบสถานะพอร์ทัลเพื่อจุดไฟหรือเข้าเล่น
		local state = WaspAutomation.GetCurrentState()
		if not state then
			return
		end

		local defeatLockout = tonumber(state.DefeatLockoutRemaining) or 0

		if defeatLockout > 0 then
			-- อยู่ในคูลดาวน์หลังพ่ายแพ้ รอให้คูลดาวน์หมดก่อน
			return
		end

		if state.PortalReady == true and state.PortalIgnited == true then
			-- B1. ถ้าพร้อมเข้าดันเจี้ยน -> สั่งเข้าเล่น
			print("[WaspAutomation] พอร์ทัลพร้อมเข้าดันเจี้ยนแล้ว! กำลังเข้าสู้...")
			WaspAutomation.EnterDungeon()
		elseif state.PortalIgnited == false and state.PortalReady == false and (state.PortalCanIgnite == true or state.PortalIgniteCooldownRemaining == 0) then
			-- B2. ถ้าพอร์ทัลยังไม่จุดชนวน และพร้อมจุดไฟ -> สั่งจุดไฟ
			print("[WaspAutomation] พอร์ทัลพร้อมจุดชนวน! กำลังทำการจุดไฟ...")
			WaspAutomation.IgnitePortal()
		end
	end
end

-- ===================================================
-- 6. ลูปทำงานอัตโนมัติแบบวนซ้ำ (Auto Polling Loop)
-- ===================================================
task.spawn(function()
	print("[WaspAutomation] ระบบบอท Wasp Wave Survival อัตโนมัติเริ่มทำงานแล้ว...")
	while true do
		local success, err = pcall(function()
			WaspAutomation.CheckAndAction()
		end)
		if not success then
			warn("[WaspAutomation] เกิดข้อผิดพลาดในระบบลูป:", err)
		end
		task.wait(3) -- ตรวจสอบสถานะทุกๆ 3 วินาที
	end
end)

return WaspAutomation
