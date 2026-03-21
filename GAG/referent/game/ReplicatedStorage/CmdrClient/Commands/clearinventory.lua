local v1 = {
	["Name"] = "clearinventory",
	["Aliases"] = { "ci" },
	["Description"] = "Clears the specified player(s) inventory.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to clear inventory."
		}
	}
}
return v1