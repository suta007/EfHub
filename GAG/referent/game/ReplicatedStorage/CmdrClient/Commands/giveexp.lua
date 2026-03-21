local v1 = {
	["Name"] = "giveexp",
	["Aliases"] = { "xp", "exp" },
	["Description"] = "Gives exp to specified player(s) with specified amount",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give exp to."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount given."
		}
	}
}
return v1