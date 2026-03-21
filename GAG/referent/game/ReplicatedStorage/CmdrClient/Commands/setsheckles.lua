local v1 = {
	["Name"] = "setsheckles",
	["Aliases"] = { "s$" },
	["Description"] = "Set sheckles to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to set sheckles to."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount set.",
			["Optional"] = true
		}
	}
}
return v1