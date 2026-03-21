local v1 = {
	["Name"] = "clearobjects",
	["Aliases"] = { "cpi" },
	["Description"] = "Clears the specified player(s) farm objects.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to farm objects."
		}
	}
}
return v1