local var = {}

function var.init(registry)
	local sData = registry.sData
	local allPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, false)
	if allPets then
		for i, pet in ipairs(allPets) do
			local txt = string.format("ลำดับที่ %d: %s | Level: %d | UUID: %s", i, pet.PetType, pet.PetData.Level, pet.UUID)
			getgenv().fLog(txt)
		end
	end

	local equippedPets = sData.PetUtils:GetPetsSortedByAge(sData.LocalPlayer, 0, true, true)

	if equippedPets then
		for i, pet in ipairs(equippedPets) do
			local txt2 = string.format("ลำดับที่ %d: %s | Level: %d | UUID: %s", i, pet.PetType, pet.PetData.Level, pet.UUID)
			getgenv().fLog(txt2)
		end
	end
end

return var
