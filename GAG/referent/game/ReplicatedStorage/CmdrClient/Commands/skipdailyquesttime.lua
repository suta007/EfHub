local v1 = {
	["Name"] = "skipdailyquesttime",
	["Aliases"] = { "skipdaily" },
	["Description"] = "Skips daily quest regen time for a specified player(s).",
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