local TestTab = {}

local reg
local sData
local PickPlaceTask = nil

local function PickPets()
	local Options = reg.Options

	if not Options.tgPickPlace or not Options.tgPickPlace.Value then
		return
	end

	local GetSelectedItems = reg.Utils.GetSelectedItems
	local pickPetType = GetSelectedItems(Options.ddPickPets.Value)

	if not pickPetType or #pickPetType == 0 then
		task.wait(1)
		return
	end

	-- ดึงข้อมูลเฉพาะสัตว์เลี้ยงที่กำลัง "อยู่บนพื้น (Equipped)" เท่านั้น
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)

	if EquipPets and #EquipPets > 0 then
		for _, pet in ipairs(EquipPets) do
			if not Options.tgPickPlace.Value then
				break
			end

			if table.find(pickPetType, pet.PetType) then
				local petUUID = pet.UUID

				-- 1. สั่งเก็บ (Unequip) สัตว์เลี้ยงที่อยู่บนพื้นก่อน
				sData.PetsServiceEvent:FireServer("UnequipPet", petUUID)

				-- หน่วงเวลารอเซิร์ฟเวอร์ประมวลผลการเก็บ
				task.wait(tonumber(Options.inpPickDelay.Value) or 0.2)

				-- 2. สั่งวาง (Equip) กลับลงไปใหม่ เพื่อให้ลูปรอบหน้ายังค้นหาเจอ
				sData.PetsServiceEvent:FireServer("EquipPet", petUUID)

				-- หน่วงเวลารอเซิร์ฟเวอร์ประมวลผลการวาง (และอาจจะเป็นจังหวะที่สกิลบัคทำงาน)
				task.wait(tonumber(Options.inpPlaceDelay.Value) or 0.2)
			end
		end
	end

	-- ระยะเวลาพักรอบ ก่อนจะเริ่มดึงข้อมูล EquipPets มาทำซ้ำ
	task.wait(tonumber(Options.inpPickTime.Value) or 1)
end

function TestTab.Initialize(registry)
	reg = registry
	local Options = registry.Options
	local Tabs = reg.Tabs
	local Interface = reg.Interface
	local QuickSave = reg.Window.QuickSave
	sData = reg.sData

	Tabs.Test = Interface:AddTab({ Title = "Test", Icon = "axe" })

	local TestSection = Tabs.Test:AddCollapsibleSection("Test", false)

	TestSection:AddDropdown("ddPickPets", {
		Title = "Select Pets type",
		Values = sData.PetsDataTable or {},
		Default = {},
		Multi = true,
		Searchable = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddButton({
		Title = "Clear Select Pets",
		Callback = function()
			Options.ddPickPets:SetValue({})
		end,
	})

	TestSection:AddInput("inpPickTime", {
		Title = "Pet Timer", -- เปลี่ยนชื่อให้ตรงกับ UI ที่พี่เอฟต้องการ
		Default = 1,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddInput("inpPickDelay", {
		Title = "Delay To Pick",
		Default = 0.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddInput("inpPlaceDelay", {
		Title = "Delay To Place",
		Default = 0.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddToggle("tgPickPlace", {
		Title = "Auto Pick Place",
		Default = false,
		Callback = function(Value)
			if Value then
				if not PickPlaceTask then
					PickPlaceTask = task.spawn(function()
						while true do
							if Options.tgPickPlace and Options.tgPickPlace.Value then
								PickPets()
							else
								break -- หยุดลูปเมื่อ Toggle ถูกปิด
							end
							task.wait()
						end
						PickPlaceTask = nil -- เคลียร์ค่า Thread เมื่อลูปหยุด
					end)
				end
			else
				if PickPlaceTask then
					task.cancel(PickPlaceTask) -- ใช้ task.cancel() แก้ไขปัญหา Error
					PickPlaceTask = nil
				end
			end
			QuickSave()
		end,
	})
end

return TestTab
