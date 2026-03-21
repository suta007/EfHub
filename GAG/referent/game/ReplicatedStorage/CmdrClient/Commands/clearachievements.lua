local v1 = {
	["Name"] = "clearachievements",
	["Aliases"] = { "cach" },
	["Description"] = "Clears the specified player(s) achievements.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to clear all achievements."
		}
	}
}
return v1