local v1 = game:GetService("ReplicatedStorage").Modules.GardenGuideModules.DataModules
return {
	["Plant"] = require(v1.PlantData),
	["Pet"] = require(v1.PetData),
	["Cosmetic"] = require(v1.CosmeticData),
	["Food"] = require(v1.FoodData),
	["Mutation"] = require(v1.MutationData)
}