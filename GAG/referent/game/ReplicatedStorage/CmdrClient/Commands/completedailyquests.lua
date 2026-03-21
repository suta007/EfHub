local v1 = {
	["Name"] = "completedailyquests",
	["Aliases"] = { "comday" },
	["Description"] = "Completes all daily quests for a specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to complete the achievement for."
		}
	}
}
return v1