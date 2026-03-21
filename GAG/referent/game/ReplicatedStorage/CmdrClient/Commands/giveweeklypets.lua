local v1 = {
	["Name"] = "giveweeklypets",
	["Aliases"] = { "gp" },
	["Description"] = "Gives pet to specified player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give eggs to."
		}
	}
}
return v1