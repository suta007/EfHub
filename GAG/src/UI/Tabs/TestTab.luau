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
	local EquipPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)
	local pickPetType = GetSelectedItems(Options.ddPickPets.Value)
	if EquipPets and #EquipPets > 0 then
		for _, pet in ipairs(EquipPets) do
			local petType = pet.PetType
			if table.find(pickPetType, petType) then
				local petUUID = pet.UUID
				sData.PetsServiceEvent:FireServer("UnequipPet", petUUID)
				task.wait(tonumber(Options.inpPickDelay.Value) or 0.5)
				sData.PetsServiceEvent:FireServer("EquipPet", petUUID)
				task.wait(tonumber(Options.inpPlaceDelay.Value) or 0.5)
			end
		end
	end
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
		Title = "Pet Dalay",
		Default = 1,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddInput("inpPickDelay", {
		Title = "Pick Delay",
		Default = 0.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddInput("inpPlaceDelay", {
		Title = "Place Delay",
		Default = 0.5,
		Numeric = true,
		Finished = true,
		Callback = function()
			QuickSave()
		end,
	})

	TestSection:AddToggle("tgPickPlace", {
		Title = "Pick Place Enable",
		Default = false,
		Callback = function(Value)
			if Value then
				if not PickPlaceTask then
					PickPlaceTask = task.spawn(function()
						while true do
							if Options.tgPickPlace.Value then
								PickPets()
							end
							task.wait()
						end
					end)
				end
			else
				if PickPlaceTask then
					PickPlaceTask:Cancel()
					PickPlaceTask = nil
				end
			end
			QuickSave()
		end,
	})
end

return TestTab
