local v1 = {
	["Name"] = "resetexp",
	["Aliases"] = { "rxp", "rexp" },
	["Description"] = "Resets exp of specified player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "for",
			["Description"] = "The player(s) to reset exp on."
		}
	}
}
return v1