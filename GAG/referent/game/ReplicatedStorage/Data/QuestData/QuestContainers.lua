local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = {
	["Dino"] = require(script.Dino),
	["Zen"] = require(script.Zen),
	["Daily"] = require(script.Daily),
	["StarterPack"] = require(script.StarterPack),
	["DinoFrequent"] = require(script.DinoFrequent),
	["StarterPackVariant2"] = require(script.StarterPackVariant2),
	["Fairy"] = require(script.Fairy),
	["HalloweenPart1"] = require(script.HalloweenPart1),
	["DeadTree"] = require(script.DeadTree),
	["AdminQuest01"] = require(script.AdminQuest01),
	["AdventCalendar"] = require(script.AdventCalendar),
	["GardenGames"] = require(script.GardenGames),
	["ButtercupEvent"] = require(script.ButtercupEvent)
}
return table.freeze(v2)