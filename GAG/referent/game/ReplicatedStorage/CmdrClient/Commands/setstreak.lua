local v1 = {
	["Name"] = "setstreak",
	["Aliases"] = { "ss" },
	["Description"] = "Sets a streak to X days",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "FirstPlayer",
			["Description"] = "The first player"
		},
		{
			["Type"] = "player",
			["Name"] = "SecondPlayer",
			["Description"] = "The second player"
		},
		{
			["Type"] = "number",
			["Name"] = "DaysToBe",
			["Description"] = "Days to be",
			["Optional"] = true
		}
	}
}
return v1