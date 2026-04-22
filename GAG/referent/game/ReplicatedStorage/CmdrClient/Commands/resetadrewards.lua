local v1 = {
	["Name"] = "resetadrewards",
	["Aliases"] = { "rar" },
	["Description"] = "Resets the ad rewards depth for the specified player(s) so they can test ad reward slots from the beginning",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "for",
			["Description"] = "The player(s) to reset ad rewards depth for."
		}
	}
}
return v1