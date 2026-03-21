local v1 = {
	["Name"] = "movestreak",
	["Aliases"] = { "ms" },
	["Description"] = "Moves a streak forward or backward in time by X days",
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
			["Description"] = "The second player",
			["Optional"] = true
		},
		{
			["Type"] = "number",
			["Name"] = "DaysToMove",
			["Description"] = "Days to move",
			["Optional"] = true
		}
	}
}
return v1