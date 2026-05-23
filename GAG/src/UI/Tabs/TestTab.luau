local TestTab = {}

local reg
local sData
local PickPlaceTask = nil

local function PickPets()
	local Options = reg.Options

	-- เช็คว่า Toggle เปิดอยู่ไหม ถ้าไม่ให้หยุดทำงานทันที
	if not Options.tgPickPlace or not Options.tgPickPlace.Value then
		return
	end

	local GetSelectedItems = reg.Utils.GetSelectedItems
	local pickPetType = GetSelectedItems(Options.ddPickPets.Value)

	-- ถ้ายังไม่ได้เลือกสัตว์เลี้ยงใน Dropdown ให้หน่วงเวลาตาม Pet Timer แล้วข้ามไปเลย (ป้องกันลูปรันรัวจนแลค)
	if not pickPetType or #pickPetType == 0 then
		task.wait(tonumber(Options.inpPickTime.Value) or 1)
		return
	end

	-- ดึงข้อมูลสัตว์เลี้ยงที่กำลังติดตั้งอยู่
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)

	if EquipPets and #EquipPets > 0 then
		for _, pet in ipairs(EquipPets) do
			-- เช็คเผื่อว่าพี่เอฟกดปิด Toggle กลางคันตอนที่กำลังวนลูปสัตว์เลี้ยงหลายตัว จะได้หยุดทันที
			if not Options.tgPickPlace.Value then
				break
			end

			local petType = pet.PetType
			if table.find(pickPetType, petType) then
				local petUUID = pet.UUID

				-- 1. หน่วงเวลาก่อนเก็บ (Delay To Pick)
				task.wait(tonumber(Options.inpPickDelay.Value) or 0.2)
				sData.PetsServiceEvent:FireServer("UnequipPet", petUUID)

				-- 2. หน่วงเวลาก่อนวาง (Delay To Place)
				task.wait(tonumber(Options.inpPlaceDelay.Value) or 0.2)
				sData.PetsServiceEvent:FireServer("EquipPet", petUUID)
			end
		end
	end

	-- 3. หน่วงเวลารอบใหญ่ (Pet Timer) ให้สัตว์เลี้ยงทำงานก่อนจะวนลูปรอบใหม่
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
