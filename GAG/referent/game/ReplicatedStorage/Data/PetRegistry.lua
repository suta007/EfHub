local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
v1:WaitForChild("Models")
v1:WaitForChild("Animations"):WaitForChild("PetAnimations")
local v2 = require(script:WaitForChild("PetConfig"))
local v3 = require(script:WaitForChild("DefaultPetNames"))
local v4 = require(script:WaitForChild("PetStatesRegistry"))
local v5 = require(script:WaitForChild("PetRarities"))
local v6 = require(script:WaitForChild("DefaultPetActions"))
local v7 = require(script:WaitForChild("DefaultPetStates"))
return {
	["PetStatesRegistry"] = v4,
	["PetList"] = require(script:WaitForChild("PetList")),
	["PetConfig"] = v2,
	["PassiveRegistry"] = require(script:WaitForChild("PassiveRegistry")),
	["PetEggs"] = require(script:WaitForChild("PetEggs")),
	["DefaultPetActions"] = v6,
	["DefaultPetStates"] = v7,
	["DefaultPetNames"] = v3,
	["PetRarities"] = v5,
	["PetMutationRegistry"] = require(script:WaitForChild("PetMutationRegistry")),
	["PetBoostRegistry"] = require(script:WaitForChild("PetBoostRegistry")),
	["EggSkipProducts"] = require(script:WaitForChild("EggSkipProducts"))
}