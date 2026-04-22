local v1 = {
	["Name"] = script.Name,
	["Aliases"] = {},
	["Description"] = "Testing command",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give eggs to."
		},
		{
			["Type"] = "eggname",
			["Name"] = "eggname(s)",
			["Description"] = "The name of the egg to give."
		}
	}
}
return v1