local v1 = {
	["Name"] = "clearplants",
	["Aliases"] = { "cpl" },
	["Description"] = "Clears the specified player(s) plants (and fruit).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to clear all plants."
		}
	}
}
return v1