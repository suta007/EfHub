local v1 = {
	["Name"] = script.Name,
	["Aliases"] = {},
	["Description"] = "Adds progress to a player\'s Easter event progression",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to progress."
		},
		{
			["Type"] = "number",
			["Name"] = "amount",
			["Description"] = "How much progression to add."
		}
	}
}
return v1