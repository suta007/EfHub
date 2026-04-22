local v1 = {
	["Name"] = script.Name,
	["Aliases"] = {},
	["Description"] = "Resets golden egg data",
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