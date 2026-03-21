local v1 = {
	["Name"] = "refreshpetabilities",
	["Aliases"] = { "rfa" },
	["Description"] = "Refreshes all pet abilities for the specified player",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "to",
			["Description"] = "The player to refresh pet abilities for."
		}
	}
}
return v1