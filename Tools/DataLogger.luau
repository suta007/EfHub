local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

local Window = Fluent:CreateWindow({
	Title = "Console Log",
	SubTitle = "by EfHub",
	TabWidth = 100,
	Size = UDim2.fromOffset(1200, 768),
	Resize = true,
	-- MinSize = Vector2.new(470, 380),
	Acrylic = true,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.RightControl,
})

local Tabs = {
	Main = Window:AddTab({ Title = "Log Console", Icon = "terminal" }),
	--Event = Window:AddTab({ Title = "Event", Icon = "calendar" }),
}

Window:SelectTab(1)

------------------------------------------------------
-- 1. ประกาศตัวแปรระบบ (จองที่ไว้ก่อน)
------------------------------------------------------
local MaxLines = 100 -- จำนวนบรรทัดที่จะโชว์
local MaxFullHistory = 10000 -- จำนวนบรรทัดสูงสุดของประวัติทั้งหมด
local DisplayTable = {} -- ตารางเก็บข้อความโชว์
local FullHistoryTable = {} -- ตารางเก็บประวัติทั้งหมด
local IsPaused = false

-- [สำคัญ] ประกาศตัวแปร LogDisplay ไว้ก่อน เพื่อให้ปุ่มรู้จักตัวแปรนี้
local LogDisplay = nil

------------------------------------------------------
-- 2. สร้างปุ่มควบคุม (อยู่ด้านบน)
------------------------------------------------------

-- ปุ่มหยุด (Pause)
Tabs.Main:AddToggle("PauseSwitch", {
	Title = "Pause Logging",
	Default = false,
	Callback = function(Value)
		IsPaused = Value
	end,
})

-- ปุ่ม Copy All
Tabs.Main:AddButton({
	Title = "Copy All Logs",
	--Description = "คัดลอกประวัติทั้งหมดลง Clipboard",
	Callback = function()
		if setclipboard then
			setclipboard(table.concat(FullHistoryTable, "\n"))
			Fluent:Notify({ Title = "Success", Content = "Copied all logs!", Duration = 2 })
		else
			Fluent:Notify({ Title = "Error", Content = "Executor not supported", Duration = 2 })
		end
	end,
})

-- ปุ่ม Clear
Tabs.Main:AddButton({
	Title = "Clear Logs",
	Callback = function()
		DisplayTable = {}
		FullHistoryTable = {}
		if LogDisplay then
			LogDisplay:SetValue("") -- ตอนนี้ปุ่มจะรู้จัก LogDisplay แล้ว
		end
	end,
})

------------------------------------------------------
-- 3. สร้างหน้าจอแสดงผล (อยู่ด้านล่าง)
------------------------------------------------------

-- สร้าง Paragraph แล้วเอาไปใส่ในตัวแปรที่จองไว้
LogDisplay = Tabs.Main:AddParagraph("LogDisplay", {
	Title = "Recent Logs",
	Content = "System initialized...",
})

------------------------------------------------------
-- 4. ฟังก์ชัน AddLog
------------------------------------------------------
local function AddLog(message)
	if IsPaused then
		return
	end
	local entry = message
	-- เก็บลงประวัติทั้งหมด
	table.insert(FullHistoryTable, entry)
	if #FullHistoryTable > MaxFullHistory then
		table.remove(FullHistoryTable, 1)
	end

	-- เก็บลงตารางแสดงผล (จำกัดบรรทัด)
	table.insert(DisplayTable, entry)
	if #DisplayTable > MaxLines then
		table.remove(DisplayTable, 1)
	end

	-- อัปเดตหน้าจอ
	if LogDisplay then
		local TempText = ""
		TempText = table.concat(DisplayTable, "\n")
		LogDisplay:SetValue(TempText)
	end
end
------------------------------------------------------
-- 6. Test Loop (ทดสอบดูความสวยงาม)
------------------------------------------------------
AddLog("Script initialized successfully.")
task.wait(0.5)

pcall(function()
	local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	local targetUI = playerGui:FindFirstChild("Gift_Notification")

	if targetUI then
		AddLog("🔍 เริ่มสแกนหาปุ่มที่ซ่อนสคริปต์ใน: " .. tostring(targetUI.Name))
		local foundScript = false

		-- ค้นหาทุกชิ้นส่วนที่อยู่ข้างใน (รวมถึงลูกหลานทั้งหมด)
		for _, obj in pairs(targetUI:GetDescendants()) do
			-- กรณีที่ 1: เป็นปุ่ม (TextButton, ImageButton)
			if obj:IsA("GuiButton") and getconnections then
				local clickConns = getconnections(obj.MouseButton1Click)
				local actConns = getconnections(obj.Activated)

				if #clickConns > 0 then
					AddLog("🎯 เจอแล้ว! [MouseButton1Click] อยู่ที่: " .. tostring(clickConns.Function))
					foundScript = true
				end
				if #actConns > 0 then
					AddLog("🎯 เจอแล้ว! [Activated] อยู่ที่: " .. tostring(actConns.Function))
					foundScript = true
				end
			end

			-- กรณีที่ 2: เป็น Frame หรือรูปภาพ แต่ใช้ InputBegan ดักจับ
			if (obj:IsA("Frame") or obj:IsA("ImageLabel")) and getconnections then
				local inputConns = getconnections(obj.InputBegan)
				if #inputConns > 0 then
					AddLog("🕵️ น่าสงสัย! มี [InputBegan] ซ่อนอยู่ที่: " .. tostring(inputConns.Function))
					foundScript = true
				end
			end
		end

		if not foundScript then
			AddLog("❌ ไม่พบ Event กดปุ่มใดๆ ใน UI นี้เลย (อาจจะใช้ระบบคลิกจากหน้าจอรวมแทน)")
		end
		AddLog("✅ สแกนเสร็จสิ้น!")
	else
		AddLog("❌ หากล่องของขวัญไม่เจอ กรุณารันตอนกล่องเปิดอยู่ค่ะ")
	end
end)

local function ShowData(tbl, indent)
	local lclIndent = indent or 0
	local spacing = string.rep("  ", lclIndent)
	if type(tbl) == "table" then
		for k, v in pairs(tbl) do
			if type(v) == "table" then
				AddLog(spacing .. "[" .. tostring(k) .. "] : (Table)")
				ShowData(v, lclIndent + 1)
			else
				AddLog(spacing .. "[" .. tostring(k) .. "] : " .. tostring(v))
			end
			--return
		end
	else
		AddLog(spacing .. tostring(tbl))
	end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService :: any)
local GetData_result = DataService:GetData()
local data = GetData_result.TeamEventData
--local SelectedSlot = GetData_result.SaveSlots.SelectedSlot
--local fData = GetData_result.SaveSlots.AllSlots[SelectedSlot].SavedObjects
--local Data = GetData_result.SeasonPass
ShowData(data)
