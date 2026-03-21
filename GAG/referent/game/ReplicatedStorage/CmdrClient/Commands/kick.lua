local v1 = {
	["Name"] = "kick",
	["Aliases"] = { "boot" },
	["Description"] = "Kicks a player or set of players.",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "players",
			["Description"] = "The players to kick."
		}
	}
}
return v1