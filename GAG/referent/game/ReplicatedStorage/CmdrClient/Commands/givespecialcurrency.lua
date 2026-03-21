local v1 = {
	["Name"] = "givespecialcurrency",
	["Aliases"] = { "gs$" },
	["Description"] = "Gives specified currency to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give sheckles to."
		},
		{
			["Type"] = "currencyname",
			["Name"] = "Currency",
			["Description"] = "Specified Currency"
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