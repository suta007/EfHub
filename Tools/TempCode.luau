local LocalPlayer = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PetUtils = require(ReplicatedStorage.Modules.PetServices.PetUtilities)

local equipPets = PetUtils:GetPetsSortedByAge(LocalPlayer, 0, true, true)

for i, pet in ipairs(equipPets) do
	print(i, pet.UUID)
end

local Backpack = LocalPlayer.Backpack
for _i, obj in pairs(Backpack:GetChildren()) do
	if obj:HasTag("PetBoost") then
	end
end
