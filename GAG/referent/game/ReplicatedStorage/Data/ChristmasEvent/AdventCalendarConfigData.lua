local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
local v2 = 86400
local v3 = DateTime.fromUniversalTime(2025, 12, 6, 2).UnixTimestamp
local v4 = DateTime.fromUniversalTime(2025, 12, 25, 2).UnixTimestamp
DAILY_QUEST_COUNT = 3
return {
	["DAY_LENGTH"] = v2,
	["START_TIMESTAMP"] = v3,
	["END_TIMESTAMP"] = v4,
	["DAY_COUNT"] = (v4 - v3) // v2,
	["DAILY_QUEST_COUNT"] = DAILY_QUEST_COUNT
}