local TestTab = {}

local reg
local sData
local PickPlaceTask = nil
local CooldownConnection = nil
local MyPetCooldowns = {}

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

	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)

	if EquipPets and #EquipPets > 0 then
		for _, pet in ipairs(EquipPets) do
			if not Options.tgPickPlace.Value then
				break
			end
			if table.find(pickPetType, pet.PetType) then
				local petUUID = pet.UUID
				local timeLeft = MyPetCooldowns[petUUID]
				if timeLeft ~= nil and timeLeft <= 0 then
					local looptime = tonumber(Options.inpPickTime.Value) or 1
					task.spawn(function()
						local uuid = petUUID
						for _i = 1, looptime do
							task.wait(tonumber(Options.inpPickDelay.Value) or 0.2)
							sData.PetsServiceEvent:FireServer("UnequipPet", uuid)
							task.wait(tonumber(Options.inpPlaceDelay.Value) or 0.2)
							sData.PetsServiceEvent:FireServer("EquipPet", uuid)
						end
					end)
				end
			end
		end
	end

	task.wait(1)
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
				-- 1. ลงทะเบียน Event ดักฟัง Cooldown
				if not CooldownConnection then
					table.clear(MyPetCooldowns) -- ล้างข้อมูลเก่า

					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
					local PetCooldownsUpdated = GameEvents:WaitForChild("PetCooldownsUpdated")

					CooldownConnection = PetCooldownsUpdated.OnClientEvent:Connect(function(petUUID, cooldownData)
						-- คำนวณเวลาที่สกิลจะเสร็จ (เวลาปัจจุบัน + เวลา Cooldown)
						if cooldownData and cooldownData[1].Time then
							MyPetCooldowns[petUUID] = cooldownData[1].Time
						end
					end)
				end

				-- 2. เริ่ม Task วนลูปทำงาน
				if not PickPlaceTask then
					PickPlaceTask = task.spawn(function()
						while true do
							if Options.tgPickPlace and Options.tgPickPlace.Value then
								PickPets()
							else
								break
							end
							task.wait(0.1)
						end
						PickPlaceTask = nil
					end)
				end
			else
				-- เมื่อปิด Toggle
				if PickPlaceTask then
					task.cancel(PickPlaceTask)
					PickPlaceTask = nil
				end

				-- ยกเลิกการเชื่อมต่อ Event เพื่อคืนทรัพยากรให้ระบบ
				if CooldownConnection then
					CooldownConnection:Disconnect()
					CooldownConnection = nil
				end

				table.clear(MyPetCooldowns) -- ล้างกระดาน
			end
			QuickSave()
		end,
	})
end

return TestTab
