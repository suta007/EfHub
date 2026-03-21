local v1 = {
	["Name"] = "givesuperseed",
	["Aliases"] = { "gss" },
	["Description"] = "Gives super seed(s) to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give super seed(s) to."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount given.",
			["Optional"] = true
		}
	}
}
return v1