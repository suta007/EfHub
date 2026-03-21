local v1 = {
	["Name"] = "resetachievement",
	["Aliases"] = { "rach" },
	["Description"] = "Resets a specified achievement for the specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to reset the achievement for."
		},
		{
			["Type"] = "achievementseason",
			["Name"] = "seasonId",
			["Description"] = "The season that the achievement is in."
		},
		{
			["Type"] = "achievementset",
			["Name"] = "setId",
			["Description"] = "The achievement set that the achievement is in.",
			["Optional"] = true
		},
		{
			["Type"] = "achievementquest",
			["Name"] = "questId",
			["Description"] = "The quest id to complete.",
			["Optional"] = true
		}
	}
}
return v1