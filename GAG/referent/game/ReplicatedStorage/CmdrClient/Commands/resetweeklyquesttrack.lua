local v1 = {
	["Name"] = "resetweeklyquesttrack",
	["Aliases"] = { "resetdaily" },
	["Description"] = "Resets all weekly quest track progress for a specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to reset the quests for."
		}
	}
}
return v1