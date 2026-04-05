local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Character = Player.Character or Player.CharacterAdded:Wait()

-- ดึงฟังก์ชันของ Executor
local fireproximityprompt = (getfenv() :: any).fireproximityprompt
local getconnections = (getfenv() :: any).getconnections

-- ==========================================
-- ฟังก์ชันช่วย: กดปุ่ม UI
-- ==========================================
local function ClickButton(Button)
	if getconnections then
		local connections = getconnections(Button.MouseButton1Click)
		if #connections == 0 then
			connections = getconnections(Button.Activated)
		end

		for _, connection in pairs(connections) do
			if typeof(connection.Function) == "function" then
				connection.Function()
			elseif typeof(connection.Fire) == "function" then
				connection:Fire()
			end
		end
	end
end

-- ==========================================
-- ฟังก์ชันช่วย: วนลูปเก็บไข่
-- ==========================================
local function CollectAllEggs()
	print("🥚 เริ่มต้นค้นหาและเก็บไข่...")
	local collectedCount = 0

	for _, obj in ipairs(Workspace:GetChildren()) do
		if obj.Name == "Model" or obj:IsA("Model") then
			local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)

			if prompt and prompt.ActionText == "Collect" then
				local targetPos = (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart") or obj):GetPivot().Position

				-- ขยับระยะออกมานิดหน่อย และหันหน้าเข้าหาไข่ (กันตัวละครไถลล้ม/จมดิน)
				local offsetPos = targetPos + Vector3.new(3, 3, 3)
				Character:PivotTo(CFrame.lookAt(offsetPos, targetPos))

				-- เคลียร์แรงเฉื่อยของตัวละครให้หยุดนิ่งสนิท
				local rootPart = Character:FindFirstChild("HumanoidRootPart")
				if rootPart then
					rootPart.Velocity = Vector3.new(0, 0, 0)
					rootPart.RotVelocity = Vector3.new(0, 0, 0)
				end

				-- รอให้ Client อัปเดตตำแหน่งกับ Server
				task.wait(0.2)

				-- สั่งกดเก็บไข่
				if typeof(fireproximityprompt) == "function" then
					fireproximityprompt(prompt)
				else
					prompt:InputHoldBegin()
					task.wait(prompt.HoldDuration + 0.1)
					prompt:InputHoldEnd()
				end

				collectedCount += 1
				print("✨ เก็บไข่ใบที่ " .. collectedCount)
				task.wait(0.5) -- หน่วงเวลาก่อนไปใบต่อไป
			end
		end
	end
	print("🎉 เก็บไข่เสร็จสิ้นทั้งหมด " .. collectedCount .. " ฟอง!")
end

-- ==========================================
-- ระบบการทำงานหลัก (Main Flow)
-- ==========================================
task.spawn(function()
	print("💬 1. กำลังไปคุยกับ NPC...")

	-- ค้นหา NPC ตามโครงสร้างของเกม
	local interaction = Workspace:FindFirstChild("Interaction")
	local npc = interaction
		and interaction:FindFirstChild("UpdateItems")
		and interaction.UpdateItems:FindFirstChild("Easter2026")
		and interaction.UpdateItems.Easter2026:FindFirstChild("EggHuntPlatform")
		and interaction.UpdateItems.Easter2026.EggHuntPlatform:FindFirstChild("EasterEggHuntNPC")

	if not npc then
		print("❌ หาตัว NPC (Boppy) ไม่เจอ")
		return
	end

	local npcPrompt = npc:WaitForChild("RootPart"):FindFirstChildOfClass("ProximityPrompt")
	if npcPrompt then
		-- วาร์ปไปใกล้ๆ NPC นิดนึงให้ชัวร์ว่าคุยถึง
		Character:PivotTo(npc:GetPivot() + Vector3.new(0, 3, 4))
		task.wait(0.5)

		if typeof(fireproximityprompt) == "function" then
			fireproximityprompt(npcPrompt)
		else
			npcPrompt:InputHoldBegin()
			task.wait(npcPrompt.HoldDuration + 0.1)
			npcPrompt:InputHoldEnd()
		end
	end

	print("⏳ 2. กำลังรอหน้าต่าง UI เริ่มกิจกรรม...")
	local billboardObjects = PlayerGui:WaitForChild("Billboard_UI"):WaitForChild("Objects")
	local startTime = os.clock()
	local targetButton = nil

	-- รอจนกว่า UI จะถูกสร้างขึ้นมา (ให้เวลาค้นหาสูงสุด 5 วินาที)
	while os.clock() - startTime < 5 do
		for _, obj in ipairs(billboardObjects:GetChildren()) do
			local frame = obj:FindFirstChild("Frame")
			local textElem = frame and frame:FindFirstChild("Frame") and frame.Frame:FindFirstChild("Text_Element")

			if textElem then
				local textAttr = textElem:GetAttribute("Text")
				if textAttr == "Start Egg Hunt" then
					targetButton = textElem.Parent.Parent:FindFirstChildWhichIsA("ImageButton")
					break
				end
			end
		end
		if targetButton then
			break
		end
		task.wait(0.2)
	end

	-- ขั้นตอนที่ 3: กดปุ่ม และเก็บไข่
	if targetButton and targetButton.Active then
		ClickButton(targetButton)
		print("✅ กดปุ่ม Start Egg Hunt เรียบร้อย!")

		-- รอเซิร์ฟเวอร์เสกไข่ลงมาในแมพ (ประมาณ 3-4 วินาที)
		print("⏳ 3. กำลังรอโมเดลไข่เกิด...")
		task.wait(4)

		-- เรียกใช้ฟังก์ชันเก็บไข่
		CollectAllEggs()
	else
		print("❌ ปุ่ม Start Egg Hunt ไม่พร้อมใช้งาน (อาจจะติดคูลดาวน์ 10 นาที หรือโหลด UI ไม่สำเร็จ)")
	end
end)
