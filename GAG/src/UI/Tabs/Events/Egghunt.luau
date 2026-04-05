local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game.Players.LocalPlayer
local Events = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Easter2026")
local Egghunt = {}
local reg
local EfTasks
local QuickSave
local EventsTab

function Egghunt.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	QuickSave = reg.Window.QuickSave
	EfTasks = reg.EfTasks
	EventsTab = tab

	local EgghuntSection = EventsTab:AddCollapsibleSection("Egghunt", false)
	EgghuntSection:AddToggle("tgEgghuntEnable", {
		Title = "Egghunt Event Enable",
		Default = false,
		Callback = function(Value)
			EfTasks.ToggleTask("AutoEggHunt", Value, function()
				Egghunt.autoEggHunt()
				task.wait(60)
			end)
			QuickSave()
		end,
	})
end

function Egghunt.autoEggHunt()
	-- 1. ตรวจสอบคูลดาวน์จาก Attribute ของผู้เล่น
	local cooldown = Player:GetAttribute("EasterEggHuntCooldownRemaining") or 0

	if cooldown <= 0 then
		reg.Log("🍳 [System] Starting Egg Hunt...")

		-- 2. ร้องขอการเริ่มกิจกรรม (รับตำแหน่งและ ID ไข่ 10 ใบ)
		-- หมายเหตุ: InvokeServer จะคืนค่า 2 อย่างคือ (ข้อความ, ตารางข้อมูลไข่)
		local success, _msg, eggData = pcall(function()
			return Events.EasterEventStartEggHunt:InvokeServer()
		end)

		if success and eggData and typeof(eggData) == "table" then
			reg.Log("🍳 [System] Found " .. tostring(#eggData) .. " Eggs! Collecting Instantly...")

			-- 3. วนลูปส่งคำสั่งเก็บไข่ทันทีทุกลูก (ใช้ task.spawn เพื่อความเร็วสูงสุด)
			for eggId, _position in pairs(eggData) do
				task.spawn(function()
					local collectSuccess = Events.CollectEasterEgg:InvokeServer(eggId)
					if collectSuccess then
						reg.Log("✅ [Collected] Egg ID:", eggId)
					end
				end)
			end

			reg.Log("🎉 [Finish] All Eggs collected! Rewards added to your inventory.")
		else
			reg.Log("❌ [Error] Failed to start Egg Hunt or No Eggs found.", "ERROR")
		end
	else
		reg.Log("⏳ [Wait] Cooldown: " .. math.floor(cooldown) .. " seconds remaining.", "WARN")
	end
end

return Egghunt
