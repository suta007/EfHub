local v1 = {
	["Name"] = "giveallgears",
	["Aliases"] = { "gaf" },
	["Description"] = "Gives all gears to specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give gears to."
		}
	}
}
return v1