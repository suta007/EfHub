local v1 = {
	["Name"] = "equippets",
	["Aliases"] = { "epets" },
	["Description"] = "Gives and equips pets to specified player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give pets to."
		},
		{
			["Type"] = "pettype",
			["Name"] = "petname",
			["Description"] = "The type of pet to give."
		},
		{
			["Type"] = "number",
			["Name"] = "amount",
			["Description"] = "How many pets to give (max 8)."
		}
	}
}
return v1