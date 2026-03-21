local v1 = {
	["Name"] = "randommutation",
	["Aliases"] = { "rm" },
	["Description"] = "Adds random mutations to plants (or a specific mutation) on the player(s) farm",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to mutate plants for."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount of unique mutations to add on each plant."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount of plants to mutate."
		},
		{
			["Type"] = "mutation",
			["Name"] = "mutation",
			["Description"] = "Optional: specify a mutation type to only mutate crops using that.",
			["Optional"] = true
		}
	}
}
return v1