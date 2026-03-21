local v1 = {
	["Name"] = "giveseedpack",
	["Aliases"] = { "gsp" },
	["Description"] = "Gives seed pack(s) to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give seed pack to."
		},
		{
			["Type"] = "seedpack",
			["Name"] = "seedpack",
			["Description"] = "Seed pack name"
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount to give.",
			["Optional"] = true
		}
	}
}
return v1