local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon)
local v3 = require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
local v4 = v2.Types
local v5 = {
	["FinalReward"] = v4.Seed:Use("Gingerbread Blossom", 1),
	["Rewards"] = {
		{ v4.Gear:Use("Dragon\'s Firework", 3) },
		{
			v4.Seed:Use("Carrot", 50),
			v4.Seed:Use("Buttercup", 40),
			v4.Seed:Use("Daffodil", 30),
			v4.Seed:Use("Bamboo", 20),
			v4.Seed:Use("Mushroom", 10)
		},
		{ v4.Gear:Use("Dragon\'s Firework", 10) },
		{ v4.SeedPack:Use("Santa\'s Surprise Present", 5), v4.SeedPack:Use("Rare Present", 1) },
		{ v4.Gear:Use("Dragon\'s Firework", 20) },
		{ v4.Crate:Use("Christmas Crate", 4), v4.SeedPack:Use("Christmas Present", 4) }
	}
}
if #v5.Rewards < v3.DAY_COUNT then
	warn("Number of rewards is less than the number of days!")
end
for v6 = 1, #v5.Rewards do
	if not v5.Rewards[v6] then
		warn((("Reward data not found for day %*"):format(v6)))
	end
end
return v5