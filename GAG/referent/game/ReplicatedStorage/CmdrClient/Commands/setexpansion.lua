local v1 = {
	["Name"] = "setexpansion",
	["Aliases"] = {},
	["Description"] = "Sets expansion state",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "to",
			["Description"] = "The player(s)."
		},
		{
			["Type"] = "integer",
			["Name"] = "Expansion",
			["Description"] = "The expansion number you want"
		}
	}
}
return v1