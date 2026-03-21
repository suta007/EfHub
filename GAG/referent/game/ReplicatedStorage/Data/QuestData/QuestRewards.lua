local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = {
	["Sheckles"] = require(script.Sheckles),
	["Seed"] = require(script.Seed),
	["Egg"] = require(script.Egg),
	["Cosmetic Crate"] = require(script["Cosmetic Crate"]),
	["Cosmetic"] = require(script.Cosmetic),
	["Gear"] = require(script.Gear),
	["Seed Pack"] = require(script["Seed Pack"]),
	["Currency"] = require(script.Currency),
	["RandomSeed"] = require(script.RandomSeed),
	["CompositeAll"] = require(script.CompositeAll)
}
return table.freeze(v2)