local v1 = {
	["Name"] = "tallyplants",
	["Aliases"] = { "tpl" },
	["Description"] = "Tallies the specified player(s) plants and fruit.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to tally all plants and fruit."
		}
	}
}
return v1