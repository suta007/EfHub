--[[
local args = {
	"SubmitHeldPlant"
}
game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("SummerHarvestRemoteEvent"):FireServer(unpack(args))

]]
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local SummerHarvestRemoteEvent = GameEvents:WaitForChild("SummerHarvestRemoteEvent")

-- 1. ฟังก์ชันสำหรับส่งผลไม้ (Submit Fruit)
-- ส่งข้อมูลไปที่ Server โดยตรงเพื่อส่งผลไม้ที่ถืออยู่
local function submitHeldPlant()
	SummerHarvestRemoteEvent:FireServer("SubmitHeldPlant")
end

-- หรือส่งผ่าน ProximityPrompt ของรถเข็น (ถ้าใช้ Exploit Executor ที่มีฟังก์ชัน fireproximityprompt)
local function submitViaPrompt()
	local carts = CollectionService:GetTagged("SummerHarvestCart")
	local cart = carts[1]
	if cart then
		local prompt = cart:FindFirstChild("SummerHarvestProxPrompt", true)
		if prompt and prompt.Enabled then
			local fireproximityprompt = (getfenv() :: any).fireproximityprompt
			if fireproximityprompt then
				fireproximityprompt(prompt)
			else
				-- ถ้าไม่มี fireproximityprompt ให้กดผ่าน RemoteEvent แทน
				submitHeldPlant()
			end
		end
	end
end

-- 2. ฟังก์ชันสำหรับเคลมรางวัล (Claim Reward)
-- หมายเหตุ: จากโค้ดต้นฉบับ ฝั่งไคลเอนต์จะรับสัญญาณเคลมจากเซิร์ฟเวอร์ผ่าน SummerHarvestRewardRemoteEvent เท่านั้น
-- แต่โดยทั่วไปมักจะส่งคำสั่งเคลมผ่านรีโมทหลัก หรือรับอัตโนมัติเมื่อคะแนนถึงเป้า
local function claimRewards()
	-- ลองเรียกด้วย Parameter ที่มีความเป็นไปได้สูงสุดสำหรับระบบแนวนี้:
	SummerHarvestRemoteEvent:FireServer("Claim")
	SummerHarvestRemoteEvent:FireServer("ClaimReward")
	SummerHarvestRemoteEvent:FireServer("ClaimRewards")
end

-- ตัวอย่างการใช้งาน:
-- submitHeldPlant() -- ส่งผลไม้
-- claimRewards()    -- เคลมรางวัล
