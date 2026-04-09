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

--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local DataService = require(ReplicatedStorage.Modules.DataService :: any)
--local GetData_result = DataService:GetData()
--local SelectedSlot = GetData_result.SaveSlots.SelectedSlot
--local fData = GetData_result.SaveSlots.AllSlots[SelectedSlot].SavedObjects

--ShowData(fData)
--[[==========================================================]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- ฟังก์ชันดึง Properties ทั้งหมด (ใช้ความสามารถของ Delta)
local function GetDynamicProperties(instance)
	local props = {}

	-- พยายามใช้ฟังก์ชันของ Executor (getproperties หรือ gethiddenproperties)
	local getProps = getproperties or gethiddenproperties or nil

	if getProps then
		local success, result = pcall(function()
			return getProps(instance)
		end)
		if success and type(result) == "table" then
			for k, v in pairs(result) do
				-- บางตัวอาจให้มาเป็น list ของชื่อ [1]="Name", [2]="ClassName"...
				-- บางตัวอาจให้มาเป็น dict {Name="Part", ClassName="Part"...}
				if type(k) == "number" and type(v) == "string" then
					table.insert(props, v)
				elseif type(k) == "string" then
					table.insert(props, k)
				end
			end
		end
	end

	-- Fallback: ถ้า Executor ไม่รองรับการดึงแบบ Dynamic ให้ใช้รายการพื้นฐาน
	if #props == 0 then
		AddLog("Warning: getproperties and gethiddenproperties not found or returned empty. Using fallback list.")
		if instance:IsA("Player") then
			props = { "Name", "DisplayName", "UserId", "AccountAge", "MembershipType", "Team" }
		elseif instance:IsA("Workspace") or instance:IsA("WorldRoot") then
			props = { "Name", "ClassName", "Gravity", "FallenPartsDestroyHeight", "DistributedGameTime" }
		else
			props = { "Name", "ClassName", "Parent" }
		end
	end

	return props
end

local function LogAllData(title, instance)
	AddLog("========== [ " .. title .. " ] ==========")

	-- 1. ค้นหาและอ่าน Properties
	AddLog("[Properties - Dynamic]")
	local propertyNames = GetDynamicProperties(instance)

	-- จัดลำดับและกรองชื่อที่ซ้ำกัน
	local uniqueProps = {}
	for _, name in ipairs(propertyNames) do
		uniqueProps[name] = true
	end

	local sortedNames = {}
	for name in pairs(uniqueProps) do
		table.insert(sortedNames, name)
	end
	table.sort(sortedNames)

	for _, name in ipairs(sortedNames) do
		local success, value = pcall(function()
			return instance[name]
		end)
		if success then
			-- แปลงข้อมูลที่แสดงผลไม่ได้ให้เป็นข้อความ
			local valStr = tostring(value)
			if typeof(value) == "Instance" then
				valStr = value:GetFullName()
			end
			AddLog("  " .. name .. ": " .. valStr)
		end
	end

	-- 2. อ่าน Attributes (ดั้งเดิมของ Roblox ทำได้อยู่แล้ว)
	AddLog("[Attributes - Dynamic]")
	local attributes = instance:GetAttributes()
	local attrCount = 0
	for key, value in pairs(attributes) do
		AddLog("  " .. tostring(key) .. ": " .. tostring(value))
		attrCount = attrCount + 1
	end

	if attrCount == 0 then
		AddLog("  (No attributes found)")
	end

	AddLog("==========================================")
end

-- เริ่มทำงาน
task.spawn(function()
	if LocalPlayer then
		LogAllData("LocalPlayer", LocalPlayer)
	else
		AddLog("Error: LocalPlayer is nil")
	end

	task.wait(0.5) -- หน่วงเวลาเล็กน้อยเพื่อให้ Log ไม่ตีกัน
	LogAllData("Workspace", Workspace)
end)
