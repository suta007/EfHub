local v1 = {
	["Name"] = "gamemode",
	["Aliases"] = { "gm" },
	["Description"] = "This sets the player\'s gamemode.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give the gamemode to."
		},
		{
			["Type"] = "gamemode",
			["Name"] = "gamemode",
			["Description"] = "The gamemode you want the player(s) to be set to."
		}
	}
}
return v1